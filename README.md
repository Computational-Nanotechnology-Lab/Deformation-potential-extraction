# Deformation potential extraction formalism
Here, we provide the method to compute the acoustic and optical deformation potentials.  
The steps involved are:
1) SCF calculation
2) NSCF calculation along k-path 
3) Phonon calculation
4) EPW calculation: First, reproduce DFT bands from the Wannier calculation, and then run the EPW calculation by using q-vectors in three different crystallographic directions for intra-valley scattering and q-vector (k-k') for inter-valley scattering.
5) Extract matrix elements using extract_matrices.sh
6) Convert g(matrix elements from EPW) to M [𝑔𝜈𝑚⁢𝑛⁡(𝐤,𝐪)= sqrt(ℏ/2⁢𝑚0𝜔𝜈⁢𝐪)𝑀𝜈𝑚⁢𝑛⁡(𝐤,𝐪)] and plot the matrix elements. Check which modes are polar.
7) Run the EPW calculation with tag "shortrange = .true." to subtract the long-range part of matrix elements. 
8) Compute the Acoustic deformation potential 
9) Compute the Optical deformation potential 
10) Compute the Inter-valley deformation potential 

If you are using this method, please cite our work. 
"Thermoelectric transport and the role of different scattering processes in the half-Heusler NbFeSb", Materials Horizons 2025, DOI: 10.1039/D5MH00228A

