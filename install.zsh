#!/usr/bin/env zsh
#
# Install or update claude-zsh-completion:
#   curl -fsSL https://raw.githubusercontent.com/0xlxx/claude-zsh-completion/main/install.zsh | zsh
#
set -euo pipefail

REPO="https://github.com/0xlxx/claude-zsh-completion.git"
INSTALL_DIR="${HOME}/.claude/zsh"

if [[ -d "${INSTALL_DIR}/.git" ]]; then
  echo "=== Updating ==="
  cd "${INSTALL_DIR}"
  git pull --ff-only
  echo ""

  if [[ -f "${INSTALL_DIR}/_claude_diff.sh" ]]; then
    zsh "${INSTALL_DIR}/_claude_diff.sh"
  fi
  exit 0
fi

echo "=== Installing ==="
mkdir -p "$(dirname "${INSTALL_DIR}")"
git clone "${REPO}" "${INSTALL_DIR}"

# Try to find an existing completions directory in fpath
COMPLETIONS_DIR=""
for dir in $fpath; do
  dir="${dir/#\~/$HOME}"
  if [[ -d "$dir" && -w "$dir" ]]; then
    COMPLETIONS_DIR="$dir"
    break
  fi
done

if [[ -n "$COMPLETIONS_DIR" ]]; then
  ln -sf "${INSTALL_DIR}/_claude" "${COMPLETIONS_DIR}/_claude"
  echo "Linked _claude → ${COMPLETIONS_DIR}/_claude"
else
  echo '' >> ~/.zshrc
  echo '# claude-zsh-completion' >> ~/.zshrc
  echo 'fpath=(${HOME}/.claude/zsh $fpath)' >> ~/.zshrc
  echo "Added fpath to ~/.zshrc"
fi

echo "Done. Restart your shell or run: exec zsh"
