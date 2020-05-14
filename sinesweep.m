function Xt = sinesweep(T,w0,wf,t)
Fs=44100;
m = Fs*T;
t = linspace(0,T,m);
k=(T*w0)/log(wf/w0);
L=T/log(wf/w0);
Xt = sin(k*(exp(t/L)-1));
plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo')
sound(Xt,Fs);
audiowrite('sinesweep.wav',Xt,Fs);

end
