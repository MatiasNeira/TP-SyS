
function iF = inversefilter(T,w0,wf,t)
Fs=44100;
m=Fs*T;
t=linspace(0,T,m);

iF = modulacion(T,w0,wf,-t).*sinesweep(T,w0,wf,t);


plot(t,iF);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo');
sound(iF,Fs);
end