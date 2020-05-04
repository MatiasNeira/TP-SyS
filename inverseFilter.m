function Mt = functionMt(tf,w0,wf,t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    Mt=(w0/2*pi*((tf*w0)/log(wf/w0))/((tf/log(wf/w0))))*exp(t/(tf/log(wf/w0)))
end