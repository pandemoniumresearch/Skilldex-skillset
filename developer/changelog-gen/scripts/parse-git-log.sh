#!/usr/bin/env bash
# parse-git-log.sh
# Extracts commits since the last git tag in a structured format
# for use by the changelog-gen skill.
#
# Output format (one block per commit, separated by ---END---):
#   HASH|SUBJECT|BODY
#
# Usage: bash parse-git-log.sh [--from <ref>] [--to <ref>]
#   --from  Start ref (default: last tag, or first commit if no tags exist)
#   --to    End ref (default: HEAD)

set -euo pipefail

FROM=""
TO="HEAD"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --from) FROM="$2"; shift 2 ;;
    --to)   TO="$2";   shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

# Determine the start ref
if [[ -z "$FROM" ]]; then
  if git describe --tags --abbrev=0 >/dev/null 2>&1; then
    FROM=$(git describe --tags --abbrev=0)
    echo "# Commits since tag: $FROM"
  else
    # No tags — use the first commit
    FROM=$(git rev-list --max-parents=0 HEAD)
    echo "# No tags found — showing all commits from first commit"
  fi
fi

echo "# Range: ${FROM}..${TO}"
echo ""

# Extract commits
git log "${FROM}..${TO}" \
  --pretty=format:"%H|%s|%b---END---" \
  --no-merges \
| awk '
  BEGIN { RS="---END---\n?"; FS="|" }
  NF >= 2 {
    hash  = $1
    subj  = $2
    body  = $3

    # Trim leading/trailing whitespace from each field
    gsub(/^[ \t\n]+|[ \t\n]+$/, "", hash)
    gsub(/^[ \t\n]+|[ \t\n]+$/, "", subj)
    gsub(/^[ \t\n]+|[ \t\n]+$/, "", body)

    if (hash == "") next

    print "HASH: " hash
    print "SUBJECT: " subj
    if (body != "") print "BODY: " body
    print ""
  }
'
