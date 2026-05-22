#!/usr/bin/env zsh
#
# Diff current `claude --help` against the last-saved snapshot.
# Run after `claude update` to see what CLI options changed, then edit
# ~/.claude/zsh/_claude accordingly.
#
set -euo pipefail

DIR="${0:A:h}"
SNAPSHOT="$DIR/.claude-help-snapshot"
CLAUDE=${CLAUDE:-claude}

dump_help() {
  echo "=== claude ==="
  $CLAUDE --help 2>&1

  for cmd in agents auth auto-mode doctor install mcp plugin project setup-token ultrareview update; do
    local h
    h=$($CLAUDE "$cmd" --help 2>&1) || continue
    echo ""
    echo "=== claude $cmd ==="
    echo "$h"
  done
}

if [[ ! -f "$SNAPSHOT" ]]; then
  echo "No snapshot yet — saving current help output as baseline."
  dump_help > "$SNAPSHOT"
  echo "Snapshot saved to $SNAPSHOT"
  exit 0
fi

TMP=$(mktemp /tmp/claude-help-current.XXXXXX)
dump_help > "$TMP"

echo "Diff: snapshot → current"
echo "========================="
echo ""

diff -u "$SNAPSHOT" "$TMP" || true

echo ""
echo "———————————"
echo "To accept the current state as the new baseline:"
echo "  cp $TMP $SNAPSHOT"

rm -f "$TMP"
