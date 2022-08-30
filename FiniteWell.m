%Code to compute energy bands in a Finite quatum well

%Function to calculate the finite quantum well energies 
%The arguments are the aluminium composition in AlGaAs material system 

function FiniteWell(x)

%n is the number of mini-bands
% n1 = 1;
% n2 = 2;
% n3 = 3;
%n = 1:1:3;

%l is defined to be the width of the quatum well in angstorm
%l = 10:10:200;
l = 10;

%Eg is band gap energy in eV of GaAs at 300K
Eg = 1.426;


%Eg1 is band gap energy in eV of AlGaAs at 300K
Eg1 = (1.426 + 1.247*x);

%Potential Barrier Height
%Assuming there is no band offset
PB = (Eg1 - Eg)/2;

%PB in joules
PB = PB * 1.602 * 10^-19;

%meff is defined as the effective mass in kg
meff = 0.067 * 9.10938215*10^-31;
%meff = 0.067 * 0.511/1*10^-6;
%meff = 0.067 * 0.511 * 10^-6;

%hbar is the reduced plank's constant
hbar = 1.054571726*10^-34;
%hbar = 6.58211928*10^-16;

%Ecurr is being defined as the energy for current iteration
%For the first iteration we assume its value to be zero
Ecurr = 0.1;

%Enext is being defined as the energy for next iteration
Enext = Ecurr;

%Looping
for i=1:20;
    
        Ecurr = Enext;
        
        %k is the wavenumber for well
        k = sqrt(2 * meff * Ecurr) / hbar;
        
        %K is the wavenumber for barrier
        K = sqrt(2 * meff * (PB - Ecurr)) / hbar;
        
        %fE if the energy function
        fE = k * tan(k * l.*10^-10 / 2) - K;
        
        %dkE is the derivative of k
        dkE = sqrt(2*meff)/(2*sqrt(Ecurr)*hbar);
        
        %dKE is the derivative of K
        dKE = sqrt(2*meff)/(2*sqrt(PB-Ecurr)*hbar);
        
        %dfE is the derivate of fE
        dfE = dkE.*tan(k*l.*10^-10 / 2) + k*(sec(k*l.*10^-10 / 2)^2)*(l.*10^-10/2)*dKE - dKE;
        
        %The Iteration
        Enext = Ecurr - fE/dfE;
        
        
end

%En is the lower edge of the minn-band in eV
% % En = (((hbar^2)*(pi^2)*(n^2))/2*meff*(l*10^-10).^2)*6.24150974*10^18*1000;
% num = (hbar^2)*(pi^2)*(n1^2);
% den = 2 * meff * (l.*10^-10).^2;
% En1 = (den./num).^-1;            %in Joules
% En1 = En1.*6.24150974*10^18;      %in eV
% En1 = En1.*1000;                  %in meV
% 
% 
% num = (hbar^2)*(pi^2)*(n2^2);
% den = 2 * meff * (l.*10^-10).^2;
% En2 = (den./num).^-1;            %in Joules
% En2 = En2.*6.24150974*10^18;      %in eV
% En2 = En2.*1000;                  %in meV
% 
% 
% num = (hbar^2)*(pi^2)*(n3^2);
% den = 2 * meff * (l.*10^-10).^2;
% En3 = (den./num).^-1;            %in Joules
% En3 = En3.*6.24150974*10^18;      %in eV
% En3 = En3.*1000;                  %in meV
% 
% E1 = (((hbar^2)*(pi^2)*(1^2))/2*meff*(l.*10^-10)^2)*6.24150974*10^18;
% E2 = (((hbar^2)*(pi^2)*(2^2))/2*meff*(l.*10^-10)^2)*6.24150974*10^18;
% E3 = (((hbar^2)*(pi^2)*(3^2))/2*meff*(l.*10^-10)^2)*6.24150974*10^18;




figure();
%p = plot(l, En1, l, En2, l, En3);
%p = semilogy(l, Enext, l, En2, l, En3);

p = semilogy(l, Enext);
set(gca, 'FontSize', 12);
set(p, 'Color', 'black', 'LineWidth', 2);
% xlabel(char(197));
xlabel(char(197), 'FontSize', 16);
ylabel('Energy (meV)', 'FontSize', 16);
grid on;
