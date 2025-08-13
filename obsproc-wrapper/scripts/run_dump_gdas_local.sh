#!/usr/bin/env bash
# Execução direta (sem SLURM) do exglobal_dump.sh com ENV mínimo

set -euo pipefail

PDY="${1:?YYYYMMDD}"
CYC="${2:?HH}"

# Caminho deste pacote
PKG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# Carrega env e helpers
source "${PKG_DIR}/scripts/env.local"
source "${PKG_DIR}/scripts/helpers.sh"
source "${PKG_DIR}/configs/groups.conf"

# Diretórios por ciclo
export DATA="${WRK_BASE}/${PDY}${CYC}"
export COMOUT="${OUT_BASE}/${PDY}"
ensure_dir "${DATA}" "${COMOUT}"

# Meta do ciclo
export cyc="${CYC}"
export cycle="t${cyc}z"
export tmmark="tm00"
export jlogfile="${PKG_DIR}/logs/${NET}.${PDY}${CYC}.log"
ensure_dir "$(dirname "${jlogfile}")"

# ncepdate e postmsg stub
write_ncepdate "${DATA}/ncepdate" "${PDY}" "${CYC}"
printf '%s\n' '#!/bin/sh' 'echo "$2" >> "'${jlogfile}'" ' > "${DATA}/postmsg"
chmod +x "${DATA}/postmsg"

# Execução do script oficial
set -x
bash "${OBSPROC_HOME}/scripts/exglobal_dump.sh"
rc=$?
set +x

postmsg "${jlogfile}" "exglobal_dump.sh RC=${rc}"
echo "Saída em ${COMOUT}/${RUN}.t${cyc}z/"
exit ${rc}
