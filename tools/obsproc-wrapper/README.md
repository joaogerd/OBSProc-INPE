# obsproc-wrapper (INPE)

Wrapper mínimo para executar o `scripts/exglobal_dump.sh` do OBSProc (NOAA-EMC) fora do ambiente NCEP.

## Requisitos
- OBSProc oficial clonado/compilado e disponível localmente.
- Dependências de runtime (`bufr_dump`, `prepobs`) instaladas e no PATH.
- Dados de entrada (arquivos locais ou espelho NOMADS).

## Uso rápido
```bash
cd tools/obsproc-wrapper
cp scripts/env.sample scripts/env.local    # edite caminhos
./scripts/run_dump_gdas_local.sh 20250101 00
```
Saídas: `${OUT_BASE}/20250101/gdas.t00z/`

## Execução via Slurm
```bash
sbatch configs/job_gdas_dump.slurm 20250101 00
```
