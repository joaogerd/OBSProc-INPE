#!/usr/bin/env bash
# Pequenos utilitários para rodar fora do NCEP

set -euo pipefail

# postmsg <logfile> <message>
postmsg() {
  local jlogfile="$1"; shift || true
  local msg="${*:-}"
  local ts
  ts=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
  echo "[$ts] ${msg}" | tee -a "${jlogfile}"
}

# ensure_dir <path>
ensure_dir() {
  mkdir -p "$1"
}

# write_ncepdate <dest> <PDY> <cyc>
write_ncepdate() {
  local dest="$1"; local pdy="$2"; local cyc="$3"
  # formato esperado pelo exglobal_dump.sh: contém DUMPTIME
  echo "DUMPTIME ${pdy}${cyc}" > "${dest}"
}

# export_if_unset VAR VALUE
export_if_unset() {
  local var="$1"; local val="$2"
  if [[ -z "${!var:-}" ]]; then
    export "${var}=${val}"
  fi
}
