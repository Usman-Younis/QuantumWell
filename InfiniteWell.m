%Code to compute energy bands in an infinite quatum well

%n is the number of mini-bands
n1 = 1;
n2 = 2;
n3 = 3;
%n = 1:1:3;

%l is defined to be the width of the quatum well in angstorm
l = 10:10:200;

%Eg is band gap energy in eV of GaAs at 300K
Eg = 1.424;

%meff is defined as the effective mass in kg
meff = 0.067 * 9.10938215*10^-31;
%meff = 0.067 * 0.511/1*10^-6;
%meff = 0.067 * 0.511 * 10^-6;

%hbar is the reduced plank's constant
hbar = 1.054571726*10^-34;
%hbar = 6.58211928*10^-16;

%k is defined as the wavenumber
% k1 = pi*1/l;
% k2 = pi*2/l;
% k3 = pi*3/l;


% for n=1:3
%     for i=1:21
%         k = pi*n./l(i);
%     end
% end




%En is the lower edge of the minn-band in eV
% En = (((hbar^2)*(pi^2)*(n^2))/2*meff*(l*10^-10).^2)*6.24150974*10^18*1000;
num = (hbar^2)*(pi^2)*(n1^2);
den = 2 * meff * (l.*10^-10).^2;
En1 = (den./num).^-1;            %in Joules
En1 = En1.*6.24150974*10^18;      %in eV
En1 = En1.*1000;                  %in meV


num = (hbar^2)*(pi^2)*(n2^2);
den = 2 * meff * (l.*10^-10).^2;
En2 = (den./num).^-1;            %in Joules
En2 = En2.*6.24150974*10^18;      %in eV
En2 = En2.*1000;                  %in meV


num = (hbar^2)*(pi^2)*(n3^2);
den = 2 * meff * (l.*10^-10).^2;
En3 = (den./num).^-1;            %in Joules
En3 = En3.*6.24150974*10^18;      %in eV
En3 = En3.*1000;                  %in meV

% E1 = (((hbar^2)*(pi^2)*(1^2))/2*meff*(l.*10^-10)^2)*6.24150974*10^18;
% E2 = (((hbar^2)*(pi^2)*(2^2))/2*meff*(l.*10^-10)^2)*6.24150974*10^18;
% E3 = (((hbar^2)*(pi^2)*(3^2))/2*meff*(l.*10^-10)^2)*6.24150974*10^18;




figure();
%p = plot(l, En1, l, En2, l, En3);
p = semilogy(l, En1, l, En2, l, En3);
set(gca, 'FontSize', 12);
set(p, 'Color', 'black', 'LineWidth', 2);
% xlabel(char(197));
xlabel(char(197), 'FontSize', 16);
ylabel('Energy (meV)', 'FontSize', 16);
grid on;


E = 0:1:200;
E1 = E./(1000 * 6.24150974*10^18);
A = (2 * meff)^0.5;
A = A/hbar;
A = (A*n1)/(200*10^-10).^2;
A = A/2;
A = A * (E1.^-0.5);

B = meff/(pi*hbar^2);
figure();
plot(E, B);