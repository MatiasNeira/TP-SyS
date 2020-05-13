function Xt = sineSweep(tf,w0,wf)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs=44100
m= Fs*tf
t = linspace(0,tf,m);
k=(tf*w0)/log(wf/w0);
L=tf/log(wf/w0);

Xt = sin(k*(exp(t/L)-1));
plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo');
sound(Xt,Fs);
end
