# claude-code-zsh-completion

Zsh tab completion for the [Claude Code](https://claude.ai/code) CLI.

## Install

```zsh
# Clone anywhere
git clone https://github.com/0xlxx/claude-code-zsh-completion.git ~/.claude/zsh

# Add to ~/.zshrc (before compinit)
fpath=(~/.claude/zsh $fpath)
```

Or with oh-my-zsh:

```zsh
git clone https://github.com/0xlxx/claude-code-zsh-completion \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/claude-code-zsh-completion

# In .zshrc:
plugins=(... claude-code-zsh-completion)
```

## Usage

Type `claude ` and press tab. Completes:

- Subcommands — `agents`, `auth`, `mcp`, `plugin`, `project`, `ultrareview`, etc.
- Options — `--model`, `--effort`, `--permission-mode`, `--add-dir`, etc.
- Option values — model names, effort levels, permission modes, output formats
- Subcommand arguments — `claude mcp add`, `claude plugin install`, etc.

## Keeping up with Claude Code updates

Claude Code's CLI options change across versions. Check what's new after an upgrade:

```zsh
zsh /path/to/_claude_diff.sh
```

This diffs `claude --help` against a saved snapshot and shows added, removed, or changed options. Update `_claude` accordingly.

## Why

Claude Code doesn't ship shell completion yet. The [existing community completion](https://github.com/1160054/claude-code-zsh-completion) covers 120+ languages but is heavy for CLI use. This is a minimal, hand-maintained alternative focused purely on the CLI surface.
