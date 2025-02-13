
# 📡 OBSProc-INPE

O projeto **OBSProc-INPE** tem como objetivo gerenciar o fluxo de processamento do **prepBUFR** no **INPE/CPTEC**, baseado na metodologia adotada pelo **NCEP**. Esse repositório contém o código-fonte do **ObsProc**, suas dependências, scripts auxiliares e documentação técnica para garantir a conversão e validação correta dos dados observacionais.

## 🚀 Features
- 📂 Handles observational data in **BUFR** format
- 🔄 Converts BUFR to **prepBUFR** for assimilation
- ⚡ Compatible with **GSI** and numerical models
- 📊 Supports data validation and quality control

## 📦 Project Structure
```
obsproc-inpe/
├── library/         # Dependencies (bufr-dump, prepobs, etc.)
├── utils/           # Auxiliary scripts
├── src/             # Main ObsProc source code
├── docs/            # Documentation
├── config/          # Configuration files (namelists, setup)
├── tests/           # Validation and testing scripts
├── .github/workflows/ # CI/CD pipelines
├── README.md        # Project description
├── LICENSE          # License file
├── .gitignore       # Ignore rules
```

## 🔧 Installation
```bash
git clone https://github.com/joaogerd/obsproc-inpe.git
cd obsproc-inpe
make
```

## 📝 License
This project is licensed under the **CC BY-NC 3.0** license.

## 🤝 Contributing
Contributions are welcome! Open an issue or submit a pull request.

## 📬 Contact
For questions or suggestions, contact:  
📧 **joao.gerd@inpe.br**

