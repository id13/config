import { Plugin } from "@opencode/plugin/tui"

// OSC 1337 user vars belong to the emitting pane, unlike a global tab title.
// Keep the payload to fixed, ASCII-only states (no session or prompt text).
function setStatus(status: "running" | "done" | "failed" | "") {
  if (!process.env.WEZTERM_PANE) return
  process.stdout.write(`\x1b]1337;SetUserVar=OPENCODE_STATUS=${Buffer.from(status).toString("base64")}\x07`)
}

export default Plugin.define({
  id: "wezterm-status",
  setup(context) {
    if (!process.env.WEZTERM_PANE) return

    // Only track turns started by this TUI, not unrelated sessions on the
    // shared server (including turns in other WezTerm panes).
    const running = new Set<string>()
    const started = context.data.on("session.execution.started", (event) => {
      const sessionID = event.data.sessionID
      if (sessionID !== context.ui.router.current()?.sessionID) return
      running.add(sessionID)
      setStatus("running")
    })
    const succeeded = context.data.on("session.execution.succeeded", (event) => {
      if (!running.delete(event.data.sessionID)) return
      setStatus("done")
    })
    const failed = context.data.on("session.execution.failed", (event) => {
      if (!running.delete(event.data.sessionID)) return
      setStatus("failed")
    })
    const interrupted = context.data.on("session.execution.interrupted", (event) => {
      if (!running.delete(event.data.sessionID)) return
      setStatus("")
    })

    setStatus("")
    return () => {
      started()
      succeeded()
      failed()
      interrupted()
      setStatus("")
    }
  },
})
