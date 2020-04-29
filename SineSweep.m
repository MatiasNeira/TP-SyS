function SS = sineSweep(tf,w0,w1,Fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m=Fs*tf
t = linspace(0,tf,m);
k=(tf*w0)/log(wf/w0);
L=tf/log(wf/w0);

y = sin(k*(exp(t/L)-1));
end

