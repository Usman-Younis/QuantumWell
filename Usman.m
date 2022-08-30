Theta = 0:0.1:90;

%effeciency
% EFN = ((1 + cos(degtorad(Theta))).^2) / pi;
% EFD = (pi + degtorad(Theta) - sin(2* degtorad(Theta)) / 2);
% %effeciency ends
% 
% EF = (EFN./EFD)*100;
% 
% %Form Factor
% FFN = sqrt((pi + degtorad(Theta) - sin(2 * degtorad(Theta)) / 2) / (4*pi));
% FFD = (1+ cos(degtorad(Theta))) / (2* pi);
% % 
% FF = FFN./FFD;
% RF = sqrt(FF.^2 - 1);

EFN = ((1 + cos(degtorad(Theta))).^2) / pi;
EFD = (pi + degtorad(Theta) - sin(2 * degtorad(Theta)) / 2);

EF = EFN./EFD;

figure();
plot(Theta, FF, 'Color', 'black', 'LineWidth', 3);
set(gca, 'FontSize', 14);
xlabel('Displacement Angle (deg)', 'FontSize', 16);
ylabel('Effeciency %', 'FontSize', 16);
% ylabel('Form Factor', 'FontSize', 16);


