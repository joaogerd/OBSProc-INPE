# Alterações e Extensões do INPE para o OBSProc (fork NOAA-EMC/obsproc)

Este documento registra tudo o que diverge do upstream oficial.

## Base do fork
- Branch base sincronizado com **NOAA-EMC/obsproc@develop** (data da criação deste delta).

## Mudanças ativas (INPE)
- [tools/obsproc-wrapper] Wrapper mínimo para execução do `scripts/exglobal_dump.sh` fora do ambiente NCEP (sem DBNet), com exemplos para execução local e via Slurm.
- [CI] Workflow leve de qualidade de shell (shellcheck) e verificação de árvore.

## Planejadas
- Perfis de ambiente (EGEON/XC50) em `configs/sites/`.
- Orquestração por Slurm/Rocoto para ciclos 00/06/12/18Z.
- Documentação operacional local (latências e janelas).

## Compatibilidade
- Não altera código-fonte em `sorc/`. Alterações no runtime são adicionadas como wrappers externos.
