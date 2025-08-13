#!/usr/bin/env bash
#SBATCH -J gdas_dump
#SBATCH -p compute
#SBATCH -N 1
#SBATCH -c 8
#SBATCH -t 01:30:00
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

set -euo pipefail

# Datas via argumentos: YYYYMMDD HH
PDY="${1:?YYYYMMDD}"
CYC="${2:?HH}"

# Ative módulos/conda se precisar aqui
# module load bufr_dump prepobs

# Caminho deste pacote
PKG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
source "${PKG_DIR}/scripts/env.local"
source "${PKG_DIR}/scripts/helpers.sh"
source "${PKG_DIR}/configs/groups.conf"

# Diretórios por ciclo
export DATA="${WRK_BASE}/${PDY}${CYC}"
export COMOUT="${OUT_BASE}/${PDY}"
ensure_dir "${DATA}" "${COMOUT}"

# Meta
export cyc="${CYC}"
export cycle="t${cyc}z"
export tmmark="tm00"
export jlogfile="${PKG_DIR}/logs/${NET}.${PDY}${CYC}.log"
ensure_dir "$(dirname "${jlogfile}")"

# ncepdate + postmsg stub
write_ncepdate "${DATA}/ncepdate" "${PDY}" "${CYC}"
printf '%s\n' '#!/bin/sh' 'echo "$2" >> "'${jlogfile}'" ' > "${DATA}/postmsg"
chmod +x "${DATA}/postmsg"

# Execução
set -x
bash "${OBSPROC_HOME}/scripts/exglobal_dump.sh"
rc=$?
set +x

postmsg "${jlogfile}" "exglobal_dump.sh RC=${rc}"
exit ${rc}
