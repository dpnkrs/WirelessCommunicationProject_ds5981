function y0=patchInset(fc,W,L)
    c = 3e11; % velocity of light in mm/s
    Lambda = c/fc; % m -- wavelength in free space
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
    y0=(L/pi)*(acos(sqrt(50/r_in)));  %in mm  -- (recessed distance- y0)
    %{
    k=(2*pi)/Lambda;
    x=k*(Wp);
    i1=-2+cos(x)+(x*sinint(x))+(sin(x)/x); % (sinint) is sine integral
    g1=i1/(120*pi*pi);          %Conductance
    a=@(th)(((sin((x./2).*cos(th))./cos(th)).^2).*(besselj(0,(k.*Lp.*sin(th)))).*(sin(th)).^3);
    a1=integral(a,0,pi);
    g12=a1/(120*pi*pi);     %in siemens
    r_in=1/(2*(g1+g12));    %in ohms
    % The position of the inset feed point where the input impedance is 50 ohms
    y0=(Lp/pi)*(acos(sqrt(50/r_in)));  %in mm  -- (recessed distance- y0)
    %}
end