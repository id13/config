; Override of nvim-treesitter hcl injections.
; The upstream query injects heredoc bodies using the heredoc identifier as the
; language name (e.g. <<EOT). Identifiers like EOT/HEREDOC are not real
; languages, and processing them on terraform files with many heredocs +
; interpolations causes the highlighter to hang. We keep comment injection and
; only inject heredoc bodies when the identifier matches a known language.

((comment) @injection.content
  (#set! injection.language "comment"))

(heredoc_template
  (template_literal) @injection.content
  (heredoc_identifier) @injection.language
  (#downcase! @injection.language)
  (#any-of? @injection.language
    "bash" "sh" "css" "go" "graphql" "html" "javascript" "json" "lua"
    "markdown" "python" "regex" "sql" "toml" "tsx" "typescript" "xml" "yaml"))
