Nx=2^16; %Cantidad de muestras a sintetizar
vNx=[0:Nx];
B=[0.049922035 -0.095993537 0.050612699 -0.004408786]; %Coeficientes de el filtro de 3db de caida
A=[1 -2.494956002 2.017265875 -0.522189400];
nT60=round(log(1000)/1-max(abs(roots(A)))); %Calcula la cantidad de muestras que ocupa el TR. Creo.
v=randn(1,Nx+nT60);
x=filter(B,A,v);
y=x(nT60+1:end);
plot(y)

Fs=44100
sound(y,Fs)

audiowrite('ruidoRosa.wav',y,Fs);