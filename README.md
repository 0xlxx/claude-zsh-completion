# claude-zsh-completion

Zsh tab completion for the [Claude Code](https://claude.ai/code) CLI.

## Install

```zsh
curl -fsSL https://raw.githubusercontent.com/0xlxx/claude-zsh-completion/main/install.zsh | zsh
```

Or with oh-my-zsh:

```zsh
git clone https://github.com/0xlxx/claude-zsh-completion \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh-completion

# In .zshrc:
plugins=(... claude-code-zsh-completion)
```

The install script is also the updater — re-run it anytime to pull the latest completion and diff CLI changes.

## Usage

Type `claude ` and press tab. Completes:

- Subcommands — `agents`, `auth`, `mcp`, `plugin`, `project`, `ultrareview`, etc.
- Options — `--model`, `--effort`, `--permission-mode`, `--add-dir`, etc.
- Option values — model names, effort levels, permission modes, output formats
- Subcommand arguments — `claude mcp add`, `claude plugin install`, etc.

## Keeping up with Claude Code updates

Re-run the install script — it pulls the latest completion and diffs CLI changes:

```zsh
zsh ~/.claude/zsh/install.zsh
```

## Why

Claude Code doesn't ship shell completion yet. The [existing community completion](https://github.com/1160054/claude-code-zsh-completion) covers 120+ languages but is heavy for CLI use. This is a minimal, hand-maintained alternative focused purely on the CLI surface.
