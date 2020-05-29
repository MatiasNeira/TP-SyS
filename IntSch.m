function [E] = IntSch(RI,T)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
a=RI^2;
t=(0:T);
for i_(0:T)
E(i)= integral(a,0,inf) - integral(a,0,t(i));
end
end

