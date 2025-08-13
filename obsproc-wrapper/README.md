# obsproc-wrapper (GDAS/GFS lab runner)

Este pacote fornece *wrappers* e configurações mínimas para executar o `scripts/exglobal_dump.sh` do **NOAA-EMC/obsproc** fora do ambiente NCEP (ex.: em um laboratório/centro de pesquisa com Slurm).

> ⚠️ Requisitos:
> - Repositório oficial **obsproc** clonado e compilado (incluindo dependências de *runtime* `bufr_dump` e `prepobs`).
> - Tabelas BUFR e arquivos `parm/fix` coerentes com suas fontes de dados.
> - Disponibilidade de dados de observação (feeds locais, arquivos de teste, ou espelhamento do NOMADS).

## Estrutura
```
obsproc-wrapper/
├── README.md
├── scripts/
│   ├── run_dump_gdas_local.sh
│   ├── helpers.sh
│   └── env.sample
├── configs/
│   ├── groups.conf
│   ├── bufr_dumplist.sample
│   └── job_gdas_dump.slurm
├── logs/
└── examples/
    └── run_slurm_example.sh
```

## Uso rápido (shell)
1. Ajuste o **caminho** para o repositório oficial do `obsproc` em `scripts/env.sample` e salve como `scripts/env.local`.
2. Revise os grupos em `configs/groups.conf` (ligue/desligue conforme seu inventário de dados).
3. (Opcional) Ajuste `configs/jog_gdas_dump.slurm` e rode via Slurm.
4. Para execução direta:
   ```bash
   cd scripts
   cp env.sample env.local   # edite!
   ./run_dump_gdas_local.sh 20250101 00   # PDY=YYYYMMDD cyc=HH
   ```

## Saídas
- Dumps BUFR em `${COMOUT}/${RUN}.t${cyc}z/` (um arquivo por grupo/tipo).
- Logs em `logs/` e `${DATA}/pgmout`.

## Notas
- Este wrapper **não** envia DBNet alerts.
- `NAP` e `NAP_adpupa` são setados para 0 por padrão (sem antecipação). Ajuste conforme sua logística.
- Ajuste as janelas e listas específicas diretamente no `exglobal_dump.sh` do obsproc se necessário.
