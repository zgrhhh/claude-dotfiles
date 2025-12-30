#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$CLAUDE_DIR.backup.$(date +%Y%m%d_%H%M%S)"

echo "=== Claude Code Dotfiles Installer ==="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if claude is installed
if ! command -v claude &> /dev/null; then
    echo -e "${RED}Error: Claude Code CLI is not installed.${NC}"
    echo "Please install it first: npm install -g @anthropic-ai/claude-code"
    exit 1
fi

# Backup existing configuration
if [ -d "$CLAUDE_DIR" ]; then
    echo -e "${YELLOW}Backing up existing configuration to $BACKUP_DIR${NC}"
    cp -r "$CLAUDE_DIR" "$BACKUP_DIR"
fi

# Create .claude directory if it doesn't exist
mkdir -p "$CLAUDE_DIR"

# Copy settings.json
echo -e "${GREEN}Installing settings.json (statusLine + plugins config)...${NC}"
cp "$SCRIPT_DIR/.claude/settings.json" "$CLAUDE_DIR/settings.json"

# Copy commands
if [ -d "$SCRIPT_DIR/.claude/commands" ]; then
    echo -e "${GREEN}Installing custom commands...${NC}"
    mkdir -p "$CLAUDE_DIR/commands"
    cp -r "$SCRIPT_DIR/.claude/commands/"* "$CLAUDE_DIR/commands/" 2>/dev/null || true
fi

# Copy skills
if [ -d "$SCRIPT_DIR/.claude/skills" ]; then
    echo -e "${GREEN}Installing custom skills...${NC}"
    mkdir -p "$CLAUDE_DIR/skills"
    cp -r "$SCRIPT_DIR/.claude/skills/"* "$CLAUDE_DIR/skills/" 2>/dev/null || true
fi

# Add ENABLE_LSP_TOOLS to shell config
echo ""
echo -e "${GREEN}Configuring shell environment...${NC}"
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    if ! grep -q "ENABLE_LSP_TOOLS" "$SHELL_RC"; then
        echo "" >> "$SHELL_RC"
        echo "# Claude Code LSP tools" >> "$SHELL_RC"
        echo "export ENABLE_LSP_TOOLS=1" >> "$SHELL_RC"
        echo -e "  Added ENABLE_LSP_TOOLS=1 to $SHELL_RC"
    else
        echo -e "  ENABLE_LSP_TOOLS already configured in $SHELL_RC"
    fi
fi

echo ""
echo -e "${GREEN}=== Installation Complete ===${NC}"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: source $SHELL_RC"
echo "  2. Run Claude Code and install plugins:"
echo ""
echo "     claude"
echo "     /plugin marketplace add anthropics/skills"
echo "     /plugin install document-skills@anthropic-agent-skills"
echo "     /plugin install example-skills@anthropic-agent-skills"
echo "     /plugin install pyright-lsp@claude-plugins-official"
echo "     /plugin install typescript-lsp@claude-plugins-official"
echo ""
echo "  3. Restart Claude Code to load plugins"
echo ""
