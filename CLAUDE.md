# Claude Code Dotfiles Setup

This is a dotfiles repo for Claude Code configuration.

## First-time Setup on New Machine

When user asks to "setup" or "install plugins", run these commands in order:

```
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
/plugin install example-skills@anthropic-agent-skills
/plugin install pyright-lsp@claude-plugins-official
/plugin install typescript-lsp@claude-plugins-official
```

Then tell user to restart Claude Code to load plugins.
