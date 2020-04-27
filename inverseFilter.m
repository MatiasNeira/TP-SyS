function iF = inverseFilter(tf,w0,w1,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
iF=(w0/2*pi*((tf*w0)/log(w1/w0))/((tf/log(w1/w0))))*exp(n/(tf/log(w1/w0)));
end

