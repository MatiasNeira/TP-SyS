function [Rt] = ConvLog(At)
%                  ...

% [Rt] = ConvLog(At)::Funcion con elemento de entrada At [array de valores que describen a una señal]
% Funcion que convierte un impulso en escala logaritmica
% Salida Rt : array de valores.

%                  ...

Rt=20*log10(At/max(At));

end
