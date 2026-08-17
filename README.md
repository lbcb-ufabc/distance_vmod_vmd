# distance_vmod_vmd

## 📌 Descrição
Pipeline computacional para análise de dinâmica molecular (MD) de um complexo tetramérico/trimérico proteico utilizando modos normais (NMA) e Análise de Componentes Principais (PCA). O pipeline calcula distâncias interatômicas (distâncias de ligação) entre resíduos específicos ao longo de diferentes modos de vibração e realiza análise de componentes principais na trajetória de dinâmica molecular.

**Autoria:**
Yolanda Marcello

---
## ⚙️ Requisitos
Os requisitos estão disponíveis em:
[Requirements](https://github.com/lbcb-ufabc/distance_vmod_vmd/blob/main/requirements.md)

---
## ▶️ Como executar
Clonar o repositório:

```bash
git clone https://github.com/lbcb-ufabc/distance_vmod_vmd.git
cd distance_vmod_vmd
```
Renomear os arquivos PDB:
```bash
sh change_name.sh
```
Calcular distância do complexo (exemplos: tetramérica e trimérico):
```bash
sh run_distances_tetra.sh ou sh run_distances_tri.sh 
```
Processar dados de distância
```bash
sh  awk_dist.sh <arquivo_entrada>
```
Análise de Componetes Principais (PCA):
```bash
python3 pca_v1.py
```
Carregar estruturas no VMD:
```bash
vmd2 -e load_pdb.tcl
```
---

# 📖 Sobre o projeto

O pipeline foi desenvolvido para:
* Cálculo de distâncias intra/intermoleculares
* Análise de componentes principais

---

# 📂 Estrutura do repositório

```
├── requirements.md
├── awk_dist.sh
├── change_name.sh
├── run_distances_tetra.sh
├── run_distances_tri.sh
├── load_pdb.tcl
├── dist_vmod_tetra.tcl
├── dist_vmod_tri.tcl
├── pca_v1.py
├── README-en.md
└── README.md
```

## 🔄 Visão geral do pipeline
         
1- change_name.sh → Renomear PDB (mini_0.pdb → mini_0.0.pdb)
2- run_distances_tetra.sh → Calcular distâncias tetraméricas
3- run_distances_tri.sh → Calcular distâncias triméricas
4- awk_dist.sh (opcional) → Processar e resumir dados
5- pca_v1.py → Análise PCA e visualização
         

---

## 📥 Inputs
* step1_pdbreader.psf
* mini_*.pdb
* arquivo.dcd

## 📥 Outputs
* dist_*.dat
* gráficos PNG
* estatísticas
