function [Lp,Wp,w0]=patchDim(fc,hs,er,t)
    c = 3e11; % velocity of light in mm/s
    z0=50; %characteristic impedance in ohms
     
    
    Wp= c/(2*fc)/sqrt((er+1)/2);  % mm -- Width of the patch antenna
    
    er_eff=(er+1)/2 +(er-1)/2/sqrt(1+12*hs/Wp); % effective relative permitivity
    
    delta_L = hs * 0.412* (er_eff+0.3)*(Wp/hs+0.264)/(er_eff-0.258)/(Wp/hs+0.8); % mm
    L_eff = c/(2*fc)/sqrt(er_eff); % mm -- effective Length of the patch antenna
    Lp = L_eff -2* delta_L; % mm -- Length of the patch antenna
    
    %%
    w0=7.475*hs/exp(z0*sqrt(er+1.41)/87)-1.25*t; %width of a 50 ohm microstrip 
                                                %transmission/feed line
end