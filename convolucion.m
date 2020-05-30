T=20; % Tiempo en segundos.
F0=20; %Frecuencia inicial
Ff=20000; %frecuencia Final
w0 = 2*pi*F0;
wf = 2*pi*Ff;
Fs=44100; %frecuencia de muestreo
m= Fs*T; %cantidad de muestras
t = linspace(0,T,m);

subplot(3,1,1);

    Xt=SineSweep(T,F0,Ff);
    plot(t,Xt);title('SineSweep');ylabel('Amplitud');xlabel('Tiempo')


subplot(3,1,2);

    Yt=InverseFilter(T,F0,Ff);
    plot(t,Yt);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo')


subplot(3,1,3);
    Zt = conv(Xt,Yt);
    plot(Zt);title('Convolucion');ylabel('Amplitud');xlabel('Tiempo')

    audiowrite('Convolucion.wav',Zt,Fs);
