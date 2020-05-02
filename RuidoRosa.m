function Xt= ruidorosa(t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Fs=44100;
Nx=Fs*t;
B=[0.049922035 -0.095993537 0.050612699 -0.004408786];
A=[1 -2.494956002 2.017265875 -0.522189400];
nT60=round(log(1000)/1-max(abs(roots(A)))); 
v=randn(1,Nx+nT60);
x=filter(B,A,v);
Xt=x(nT60+1:end);
plot(Xt)
sound(Xt,Fs)	
audiowrite('ruidoRosa.wav',Xt,Fs);
end