#!/usr/bin/env zsh
#
# Install or update claude-code-zsh-completion:
#   curl -fsSL https://raw.githubusercontent.com/0xlxx/claude-code-zsh-completion/main/install.zsh | zsh
#
set -euo pipefail

REPO="https://github.com/0xlxx/claude-code-zsh-completion.git"
INSTALL_DIR="${HOME}/.claude/zsh"

if [[ -d "${INSTALL_DIR}/.git" ]]; then
  echo "=== Updating ==="
  cd "${INSTALL_DIR}"
  git pull --ff-only
  echo ""

  if [[ -f "${INSTALL_DIR}/_claude_diff.sh" ]]; then
    zsh "${INSTALL_DIR}/_claude_diff.sh"
  fi
else
  echo "=== Installing ==="
  mkdir -p "$(dirname "${INSTALL_DIR}")"
  git clone "${REPO}" "${INSTALL_DIR}"

  if ! grep -qF 'fpath=(~/.claude/zsh' ~/.zshrc 2>/dev/null; then
    echo '' >> ~/.zshrc
    echo '# claude-code-zsh-completion' >> ~/.zshrc
    echo 'fpath=(~/.claude/zsh $fpath)' >> ~/.zshrc
    echo "Added fpath to ~/.zshrc"
  fi

  echo "Done. Restart your shell or run: exec zsh"
fi
