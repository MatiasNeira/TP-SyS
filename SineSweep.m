tf=20;
w0=20;
wf=2000;
Fs=44100;
m=Fs*tf

t = linspace(0,tf,m);
k=(tf*w0)/log(wf/w0);
L=tf/log(wf/w0);
%w = linspace(w0,wf,m);
y = sin(k*(exp(t/L)-1));

subplot(2,1,1);
plot(t,y)

subplot(2,1,2);
b=inverseFilter(tf,wf,w0,t).*y;
plot(t,b)

%sound(y,Fs);
%audiowrite('sinesweep.wav',y,Fs);