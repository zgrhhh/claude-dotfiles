# Claude Code Dotfiles

My personal Claude Code configuration files.

## What's Included

### Settings (`settings.json`)
- **StatusLine**: Custom status bar with visual context progress bar
  - Shows model name and context usage
  - Color-coded progress bar (light gray = used, dark gray = remaining)
  - Format: `Claude Opus 4.5 | Context: ████████            40%`

- **Enabled Plugins**:
  - `pyright-lsp` - Python language server
  - `typescript-lsp` - TypeScript language server
  - `vtsls` - Vue/TypeScript language server
  - `document-skills` - PDF, DOCX, XLSX, PPTX processing
  - `example-skills` - Various utility skills

### Custom Commands (`commands/`)
- `commit.md` - Generate conventional commit messages (example)

## Installation

### Quick Install

```bash
git clone https://github.com/zgrhhh/claude-dotfiles.git
cd claude-dotfiles
chmod +x install.sh
./install.sh
```

### Manual Install

1. Copy configuration:
```bash
cp -r .claude/* ~/.claude/
```

2. Add to your shell config (`.zshrc` or `.bashrc`):
```bash
export ENABLE_LSP_TOOLS=1
```

3. Install plugins in Claude Code:
```
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
/plugin install example-skills@anthropic-agent-skills
/plugin install pyright-lsp@claude-plugins-official
/plugin install typescript-lsp@claude-plugins-official
```

4. Restart Claude Code

## Structure

```
claude-dotfiles/
├── README.md
├── install.sh              # One-click install script
└── .claude/
    ├── settings.json       # Main config (statusLine, plugins)
    └── commands/           # Custom slash commands
        └── commit.md
```

## Customization

### StatusLine
Edit `settings.json` to customize the status bar. The current config uses ANSI color codes for the progress bar.

### Adding Commands
Create `.md` files in `.claude/commands/` with frontmatter:
```yaml
---
description: What this command does
---
Your prompt instructions here
```

### Adding Skills
Create directories in `.claude/skills/` with a `SKILL.md` file:
```yaml
---
name: skill-name
description: When to use this skill
---
Instructions for the skill
```

## License

MIT
