# Deformation potential extraction formalism
Here, we provide the method to compute the acoustic and optical deformation potentials.
We used quantum espresso and Electron-Phonon Wannier Package (EPW) for computing the matrix elements. The q-vector paths were calculated manually. 
The steps for computing matrix elements are following:
1) SCF (Self-Consistent Field) calculation 
2) NSCF (Non Self-Consistent Field) calculation along k-path (generate kpoints using kmesh.pl, for e.g. kmesh.pl 6 6 6) 
3) Phonon calculation (ensure k-points in NSCF and q-points in Phonon calculation are integer multiple of 2) 
4) EPW calculation: First, reproduce the DFT bands from the Wannier calculation, and then run the EPW calculation by using q-vectors in three different crystallographic directions for intra-valley scattering and q-vector (k-k') for inter-valley scattering.
5) Extract matrix elements using extract_matrices.sh
6) Convert g(matrix elements from EPW) to M [𝑔_{𝜈𝑚⁢𝑛}⁡(𝐤,𝐪)= sqrt(ℏ/2⁢𝑚_0𝜔_{𝜈⁢𝐪})𝑀_{𝜈𝑚⁢𝑛}⁡(𝐤,𝐪)] and plot the matrix elements. Check which modes are polar.
7) Run the EPW calculation with tag "shortrange = .true." to subtract the long-range part of matrix elements. 
8) Compute the Acoustic deformation potential 
9) Compute the Optical deformation potential 
10) Identify coordinates of different valleys near VBM and CBM. Compute the Inter-valley deformation potential (the q-path for inter-valley deformation potential are such that k' = k+q) 

If you are using this method, please cite our work. 
"Thermoelectric transport and the role of different scattering processes in the half-Heusler NbFeSb", Materials Horizons 2025, DOI: 10.1039/D5MH00228A

