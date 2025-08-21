# Deformation potential extraction formalism
Method to calculate deformation potentials. 
Steps involved are:
1) SCF calculation
2) NSCF calculation along k-path 
3) Phonon calculation
4) EPW calculation: Reproduce DFT bands from wannier 
5) Extract matrix elements using extract_matrices.sh
6) Convert g(matrix elements from EPW) to M [𝑔𝜈𝑚⁢𝑛⁡(𝐤,𝐪)= sqrt(ℏ/2⁢𝑚0𝜔𝜈⁢𝐪)𝑀𝜈𝑚⁢𝑛⁡(𝐤,𝐪)] and plot matrix elements
7) Compute Acoustic deformation potential 
8) Compute Optical deformation potential 
9) Compute inter-valley deformation potential 
