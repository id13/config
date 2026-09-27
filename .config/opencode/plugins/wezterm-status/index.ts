import { Plugin } from "@opencode/plugin"

// The companion tui.ts owns the terminal integration; the server half is inert.
export default Plugin.define({
  id: "wezterm-status",
  setup() {},
})
