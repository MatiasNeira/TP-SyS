function [R(t)] = ConvLog(A(T))
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
R(t)=20*log10(A(t)/max(A(t)));
end

