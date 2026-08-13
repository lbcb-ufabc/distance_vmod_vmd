import prody as pd
import matplotlib.pyplot as plt
import numpy as np

# Defina os arquivos
trajectory_file = "tetra_wt_homo.dcd"
initial_structure_file = "step1_pdbreader.pdb"
open_structure_file = "tetra_wt_homo_mode15_-3.2.pdb"

# Carregar a estrutura inicial
structure = pd.parsePDB(initial_structure_file)

# Alinhar e carregar a trajetória
trajectory = pd.Trajectory(trajectory_file)
trajectory.link(structure)

# Superpor a trajetória à estrutura inicial
pd.superpose(trajectory, structure)

# Executar PCA
pca = pd.PCA("PCA")
pca.buildCovariance(trajectory)  # Calcula a matriz de covariância
pca.calcModes()  # Calcula os modos principais

# Obter vetores próprios (eigenvectors)
eigvecs = pca.getEigvecs()

# Projeção da trajetória nos dois primeiros componentes principais
coords = trajectory.getCoordsets()  # Obtém as coordenadas da trajetória
coords_flattened = coords.reshape(coords.shape[0], -1)  # Achatando para (567, 20934)
mean_coords = coords_flattened.mean(axis=0)  # Coordenadas médias achatadas
pc1 = np.dot(coords_flattened - mean_coords, eigvecs[:, 0])  # Projeção no PC1
pc2 = np.dot(coords_flattened - mean_coords, eigvecs[:, 1])  # Projeção no PC2
# Projeção da estrutura inicial e aberta
initial_coords = structure.getCoords().reshape(-1)
initial_projection = np.dot(initial_coords - mean_coords, eigvecs[:, :2])
open_structure = pd.parsePDB(open_structure_file)
open_coords = open_structure.getCoords().reshape(-1)
open_projection = np.dot(open_coords - mean_coords, eigvecs[:, :2])
print('teste')

# Plotar os resultados
plt.figure(figsize=(8, 6))
plt.scatter(pc1, pc2, c='brown', s=10, label='VMOD')
plt.scatter(initial_projection[0], initial_projection[1], c='blue', label='Initial', edgecolor='k', s=100)
plt.scatter(open_projection[0], open_projection[1], c='yellow', label='Open', edgecolor='k', s=100)
plt.xlabel("PC1")
plt.ylabel("PC2")
plt.title("VMOD - Not phosphorylated - pH 4")
plt.legend()
plt.grid(alpha=0.3)

plt.savefig("tetra_homo_wt_nfos_ph4.png", dpi=300, bbox_inches='tight')

plt.show()
