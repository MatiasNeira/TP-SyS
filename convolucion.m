T = 20; % Tiempo en segundos.
w0 = 20; %Frecuencia inicial
wf = 2000; %frecuencia Final
Fs = 44100; %frecuencia de muestreo
m = Fs*T; %cantidad de muestras
t = linspace(0,T,m);

subplot(3,1,1);

    Xt = SineSweep(T);
    plot(t,Xt);title('Sine_Sweep');ylabel('Amplitud');xlabel('Tiempo')


subplot(3,1,2);

    Yt = InverseFilter(T);
    plot(t,Yt);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo')


subplot(3,1,3);
    Zt = conv(Xt,Yt);
    plot(Zt);title('Convolucion');ylabel('Amplitud');xlabel('Tiempo')

    audiowrite('Convolucion.wav',Zt,Fs);
