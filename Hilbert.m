function [s_t] = Hilbert(A_t)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
T=(0:1:length(A_t));
conv(A_t,1/(pi*T));
end

