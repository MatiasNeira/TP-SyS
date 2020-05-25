function [a,b] = impFile(tipo)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    if tipo == 1

        file = uigetfile('*.wav','Seleccione RI')
        A=audioread(file);
    
    end

    if tipo == 2

        file = uigetfile('*.wav','Seleccione SS')
        A =audioread(file);
    
        fileb = uigetfile('*.wav','Seleccione FI')
        B = audioread(fileb);
    end
    
end
