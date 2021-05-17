clc , clear all , close all 
c = 3e11; % mm/s
er=4;
h=6.3e-3; % mm
f=142e9; % Hz - resonance frequency 
Lambda = c/f; % m -- wavelength in free space
z0=50;%characteristic impedance
t=1.2e-3;%thickness of metal
W= c/(2*f)/sqrt((er+1)/2);  % mm -- Width of patch antenna
er_eff=(er+1)/2 +(er-1)/2/sqrt(1+12*h/W); % effective relative permitivity
delta_L = h * 0.412* (er_eff+0.3)*(W/h+0.264)/(er_eff-0.258)/(W/h+0.8); % mm
L_eff = c/(2*f)/sqrt(er_eff); % mm -- effective Length of patch antenna
L = L_eff -2* delta_L; % mm -- Length of patch antenna

%%
k=(2*pi)/Lambda;
x=k*(W);
i1=-2+cos(x)+(x*sinint(x))+(sin(x)/x); % (sinint) is sine integral
g1=i1/(120*pi*pi);          %Conductance
a=@(th)(((sin((x./2).*cos(th))./cos(th)).^2).*(besselj(0,(k.*L.*sin(th)))).*(sin(th)).^3);
a1=integral(a,0,pi);
g12=a1/(120*pi*pi);     %in siemens
r_in=1/(2*(g1+g12));    %in ohms
% The position of the inset feed point where the input impedance is 50 ohms
inset=(L/pi)*(acos(sqrt(50/r_in)));  %in mm  -- (recessed distance- y0)
w0=7.475*h/exp(z0*sqrt(er+1.41)/87)-1.25*t; %width of a 50 ohm microstrip 
                                                %transmission/feed line
disp(['The width is:  ',num2str(W),' mm'])
disp(['The length is:  ',num2str(L),' mm'])
disp(['The input resistance is:  ',num2str(r_in),' ohms'])
disp(['The position of the inset feed point (y0) is:  ',num2str(inset),' mm'])
disp(['trace width (w0) is:  ',num2str(w0),' mm'])