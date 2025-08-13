#!/usr/bin/env bash
set -euo pipefail

postmsg() {
  local jlogfile="$1"; shift || true
  local msg="${*:-}"
  local ts
  ts=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
  echo "[$ts] ${msg}" | tee -a "${jlogfile}"
}

ensure_dir() { mkdir -p "$1"; }

write_ncepdate() {
  local dest="$1"; local pdy="$2"; local cyc="$3"
  echo "DUMPTIME ${pdy}${cyc}" > "${dest}"
}
