# Deformation potential extraction formalism
This work is done by Dr. Bhawna Sahni under the guidance of Prof. Neophytos Neophytou. Here, we provide the method to compute deformation potentials. 
The steps involved are:
1) SCF calculation
2) NSCF calculation along k-path 
3) Phonon calculation
4) EPW calculation: Reproduce DFT bands from wannier 
5) Extract matrix elements using extract_matrices.sh
6) Convert g(matrix elements from EPW) to M [𝑔𝜈𝑚⁢𝑛⁡(𝐤,𝐪)= sqrt(ℏ/2⁢𝑚0𝜔𝜈⁢𝐪)𝑀𝜈𝑚⁢𝑛⁡(𝐤,𝐪)] and plot matrix elements
7) Compute Acoustic deformation potential 
8) Compute Optical deformation potential 
9) Compute inter-valley deformation potential 

If you are using this method, please cite our paper 
"Thermoelectric transport and the role of different scattering processes in the half-Heusler NbFeSb", Materials Horizons 2025, DOI: 10.1039/D5MH00228A

