
# 📡 OBSProc-INPE

The **OBSProc-INPE** project aims to manage the processing flow of **prepBUFR** at **INPE/CPTEC**, based on the methodology adopted by **NCEP**. This repository contains the **ObsProc** source code, its dependencies, auxiliary scripts, and technical documentation to ensure the correct conversion and validation of observational data.

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

