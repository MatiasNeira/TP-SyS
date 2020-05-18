function iF = inversefilter(T,w0,wf)
Fs=44100;
m=Fs*T;
t=linspace(0,T,m);
D = flip(SineSweep(T,w0,wf));

iF = modulacion(T,wf,w0,t).*D;


plot(t,iF);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo');
sound(iF,Fs);
end
