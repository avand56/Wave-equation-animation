%% wave equation animation
% animation of standing and travelling waves
% To pause press control+c
% Alex Vanderhoeff

%% Wave equation - Standing Waves

clear all
close all 

n = 12; % normal mode <- vary this
L = 2*pi; % length of string <- vary this 
T = 2; % tension in the string <- vary this 
rho = 5; % density of string <- vary this 
v = sqrt(T/rho); % velocity
lambda = 3; % wavelength <- vary this 
kappa = (2*pi)/lambda; % wavenumber
omega = v*kappa; %angular frequency

% declaring the domain
x = 1e-3:1e-3:2*pi;

B = 10; % wave amplitude

for tnum = 1:200
    yS = B.*sin((n*pi/L).*x).*cos(omega.*tnum);
    title(['Standing Wave'])
    plot(x,yS,'k','LineWidth',3)
    hold on
    axis tight
    pause(0.2)
end

%% Wave equation - Travelling Waves
clear all
close all

% variables for the wave travelling to the right
TR = 2; % tension in the string <- vary this 
rhoR = 5; % density of string <- vary this 
vR = sqrt(TR/rhoR); % velocity
lambdaR = 3; % wavelength <- vary this 
kappaR = (2*pi)/lambdaR; % wavenumber
omegaR = vR*kappaR; %angular frequency

% variables for the wave travelling to the left
TL = 2; % tension in the string <- vary this , try 0.1
rhoL = 5; % density of string <- vary this 
vL = sqrt(TL/rhoL); % velocity
lambdaL = 3; % wavelength <- vary this 
kappaL = (2*pi)/lambdaL; % wavenumber
omegaL = vL*kappaL; %angular frequency

% declaring the domain
x = 1e-3:1e-3:2*pi*lambdaR;
t = 1e-3:1e-3:(2*pi)./omegaR;

A = 10; % wave amplitude

for tnum = 1:length(t)
    % right travelling wave
    yR = A.*cos(kappaR.*x - omegaR.*tnum);
    subplot(2,1,1)
    hold off
    plot(x,yR,'b','LineWidth',3)    
    title(['Right Travelling Wave'])
    axis tight
    hold off
    % left travelling wave
    yL = A.*cos(kappaL.*x + omegaL.*tnum);
    subplot(2,1,2)
    hold off
    plot(x,yL,'r','LineWidth',3)    
    title(['Left Travelling Wave'])
    axis tight
    hold off
    pause(0.1)
end
