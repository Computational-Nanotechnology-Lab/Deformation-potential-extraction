clc
clear
% Masses of elements
m1 = 92.9100;
m2 = 55.8470;
m3 = 121.7500;

hbar = 1.0546e-34;
M = m1+m2+m3;
fac = 1.6e-27;
K = (2*M*fac)/hbar;
%For acoustic modes-------

Omega_TA = readmatrix('EPW_1.txt');
omega_THz_TA = Omega_TA(:,1).* 0.242 ; %since 1 meV = 0.242 THz%---Converting frequencies to THz
Omega_TA2 = readmatrix('EPW_2.txt');
omega_THz_TA2 = Omega_TA2(:,1).* 0.242 ;
Omega_LA = readmatrix('EPW_3.txt');
omega_THz = Omega_LA(:,1).* 0.242 ;
Num_of_mat_elem = size(Omega_TA,1);

M_TA_array = zeros(Num_of_mat_elem,1);
M_TA2_array = zeros(Num_of_mat_elem,1);
M_LA_array = zeros(Num_of_mat_elem,1);

for i = 1:size(omega_THz_TA(:,1))
    M_TA_array(i,1) = Omega_TA(i,2).*sqrt(K*omega_THz_TA(i,1)*1e12);
    M_TA_array(i,1)= M_TA_array(i,1)*1e-13;
end

for i = 1:size(omega_THz_TA2(:,1))
    M_TA2_array(i,1) = Omega_TA2(i,2).*sqrt(K*omega_THz_TA2(i,1)*1e12);
    M_TA2_array(i,1)= M_TA2_array(i,1)*1e-13;
end

for i = 1:size(omega_THz(:,1))
    M_LA_array(i,1) = Omega_LA(i,2).*sqrt(K*omega_THz(i,1)*1e12);
    M_LA_array(i,1)= M_LA_array(i,1)*1e-13;
end

% For Optical mdoes ------
Omega_O1 = readmatrix('EPW_4.txt');
omega1_THz = Omega_O1(:,1).* 0.242 ;
Omega_O2 = readmatrix('EPW_5.txt');
omega2_THz = Omega_O2(:,1).* 0.242 ;
Omega_O3 = readmatrix('EPW_6.txt');
omega3_THz = Omega_O3(:,1).* 0.242 ;
Omega_O4 = readmatrix('EPW_7.txt');
omega4_THz = Omega_O4(:,1).* 0.242 ;
Omega_O5 = readmatrix('EPW_8.txt');
omega5_THz = Omega_O5(:,1).* 0.242 ;
Omega_O6 = readmatrix('EPW_9.txt');
omega6_THz = Omega_O6(:,1).* 0.242 ;

M1_array = zeros(Num_of_mat_elem,1);
M2_array = zeros(Num_of_mat_elem,1);
M3_array = zeros(Num_of_mat_elem,1);
M4_array = zeros(Num_of_mat_elem,1);
M5_array = zeros(Num_of_mat_elem,1);
M6_array = zeros(Num_of_mat_elem,1);

for i = 1:size(omega1_THz(:,1))
    M1_array(i,1) = Omega_O1(i,2).*sqrt(K*omega1_THz(i,1)*1e12);
    M1_array(i,1)= M1_array(i,1)*1e-13;
    
    M2_array(i,1) = Omega_O2(i,2).*sqrt(K*omega2_THz(i,1)*1e12);
    M2_array(i,1)= M2_array(i,1)*1e-13; 
    
    M3_array(i,1) = Omega_O3(i,2).*sqrt(K*omega3_THz(i,1)*1e12);
    M3_array(i,1)= M3_array(i,1)*1e-13;

    M4_array(i,1) = Omega_O4(i,2).*sqrt(K*omega4_THz(i,1)*1e12);
    M4_array(i,1)= M4_array(i,1)*1e-13;
    
    M5_array(i,1) = Omega_O5(i,2).*sqrt(K*omega5_THz(i,1)*1e12);
    M5_array(i,1)= M5_array(i,1)*1e-13;
    
    M6_array(i,1) = Omega_O6(i,2).*sqrt(K*omega6_THz(i,1)*1e12);
    M6_array(i,1)= M6_array(i,1)*1e-13;    
end



Omega_O = {Omega_O1, Omega_O2, Omega_O3, Omega_O4, Omega_O5, Omega_O6};  % Cell array to hold Omega_O1 to Omega_O6
nu = cell(1,6);  % Cell array to hold nu_1 to nu_6
for j = 1:6
    for i = 1:size(omega6_THz, 1)
        nu{j}(i, 1) = Omega_O{j}(i, 1);
    end
    
end

% Define x values
x = linspace(0, 0.1, 26); 
arrays = {M1_array, M2_array, M3_array, M4_array, M5_array, M6_array};



