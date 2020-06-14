function [Rt] = ConvLog(signal)
%                  ...

% [Rt] = ConvLog(signal)::Funcion con elemento de entrada signal [array de valores que describen a una seÃ±al]
% Funcion que representa una señal logaritmicamente [Normalizacion]
% Salida Rt : array de valores.[Señal Normalizada]

%                  ...

    abs_signal = abs(signal);

    max_signal = max(abs_signal);

    Rt = 20*log10(abs_signal/max_signal);

end

