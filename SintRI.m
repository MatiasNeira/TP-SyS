function SintRI = y(T,Fs,bandas)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if bandas == 'oct'
    f = [125 250 500 1000 2000 4000 8000 ];
else if bandas == 'tercio'
    f = [125 160 200 250 315 400 500 630 800 1000 1250 1600 2250 3150 4000 5000 6000 8000];
end

T60=%agregar_correspondinte;
y=zeros(1,cant);

n=1/Fs;
t=(0:n:T);
Y=0;
 for i=(1:cant)
     
     pi_i(k) = (-log(10^-3))./(T60(k)); 
     y(i)=flip(exp(pi_i*t)*cos(2*pi*f(i)*t));
     
     Y=Y+y(i)
 end
 plot(Y)
end
