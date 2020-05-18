tf=20; % Tiempo en segundos.
w0=20; %Frecuencia inicial
wf=2000; %frecuencia Final
Fs=44100; %frecuencia de muestreo
m= Fs*tf; %cantidad de muestras
t = linspace(0,tf,m);

subplot(3,1,1);
Xt=sineSweep(tf,w0,wf);
plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo')


subplot(3,1,3);
Yt=inverseFilter(tf,wf,w0,t);
plot(t,Yt);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo')


subplot(3,1,3);
Zt=conv(Xt,Yt);
plot(Zt);title('Convolucion');ylabel('Amplitud');xlabel('Tiempo')

audiowrite('Convolucion.wav',Zt,Fs);
