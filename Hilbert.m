function soft_signal = Hilbert(original_signal)
%                  ...

% soft_signal = Hilbert(original_signal)::Funcion con elemento de entrada original_signal [array de valores de una señal]
% Funcion que suaviza una señal a traves de la transformadad de Hilbert.
% Salida soft_signal :: array de valores de la señal suavizada.
%                  ...

t = (0:1:length(original_signal));

soft_signal = conv(original_signal,1/(pi*t));

end
