tf=20; % Tiempo en segundos.
w0=20; %Frecuencia inicial
wf=2000; %frecuencia Final
Fs=44100; %frecuencia de muestreo
m= Fs*tf; %cantidad de muestras
t = linspace(0,tf,m);

subplot(2,1,1);
Xt=sineSweep(tf,w0,wf);
plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo')


subplot(2,1,2);
Yt=inverseFilter(tf,wf,w0,t);
plot(t,Yt);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo')

sound(Xt,Fs);
audiowrite('sinesweep.wav',Xt,Fs);


        

    
