#!/usr/bin/env bash
set -euo pipefail

PDY="${1:?YYYYMMDD}"
CYC="${2:?HH}"

PKG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
source "${PKG_DIR}/scripts/env.local"
source "${PKG_DIR}/scripts/helpers.sh"

# Diretórios por ciclo
export DATA="${WRK_BASE}/${PDY}${CYC}"
export COMOUT="${OUT_BASE}/${PDY}"
ensure_dir "${DATA}" "${COMOUT}"

export cyc="${CYC}"
export cycle="t${cyc}z"
export tmmark="tm00"
export jlogfile="${PKG_DIR}/../../logs/${NET}.${PDY}${CYC}.log"
ensure_dir "$(dirname "${jlogfile}")"

write_ncepdate "${DATA}/ncepdate" "${PDY}" "${CYC}"
printf '%s
' '#!/bin/sh' 'echo "$2" >> "'${jlogfile}'" ' > "${DATA}/postmsg"
chmod +x "${DATA}/postmsg"

# Grupos padrão (pb)
export DUMP_group2=YES
export DUMP_group3=YES
export DUMP_group4=YES
export DUMP_group8=YES
export DUMP_group13=YES

set -x
bash "${OBSPROC_HOME}/scripts/exglobal_dump.sh"
rc=$?
set +x

postmsg "${jlogfile}" "exglobal_dump.sh RC=${rc}"
echo "Saída em ${COMOUT}/${RUN}.t${cyc}z/"
exit ${rc}
