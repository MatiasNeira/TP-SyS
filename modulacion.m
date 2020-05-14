function Mt = modulacion(T,w0,wf,t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Fs=44100;
m=Fs*T;
%t=linspace(0,T,m);
    Mt=(w0/2*pi*((T*w0)/log(wf/w0))/((T/log(wf/w0))))*exp(t/(T/log(wf/w0)));
end