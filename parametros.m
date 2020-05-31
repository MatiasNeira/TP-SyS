function [T60,EDT,D50,C80] = parametros(A,Fs)
%UNTITLED3 Calculo de parametros acusticos T60, EDT, D50 y C80
% Busca en el vector A (señal de entrada) los tiempos donde la señal tiene
% 0, -5, -10, -25, -35 dB, y en base a esos tiemos hace las ecuaciones
% pertinentes.

t0 = find(A==0);
t_5 = find(A==-5);
t_10 = find(A==-10);
t_25 = find(A==-25);
t_35 = find(A==-35);

tf=length(A);

T20=(t_25/Fs)-(t_5/Fs);
T30=(t_35/Fs)-(t_5/Fs);

T60= T20+(40/10)+(T30-T20);
EDT= 6*((t_10/Fs)-(t_0/Fs));
D50= (integral(A^2,0,2205))/(integral(A^2,0,tf); %integral desde 0 a 5ms (muestra numero 2205) sobre integral sobre toda la señal
C80= 10*log((integral(A^2,0,3528)/(integral(A^2,3528,tf));%integral desde 0 a 8ms(muestras numero 3528) sobre integral desde 8msal final de la señal

end

