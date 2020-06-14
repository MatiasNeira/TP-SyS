function soft_signal = Hilbert(original_signal)
%                  ...

% soft_signal = Hilbert(original_signal)::Funcion con elemento de entrada original_signal [array de valores de una seÃ±al original]
% Funcion que suaviza una seÃ±al a traves de la transformadad de Hilbert.
% Salida soft_signal :: array de valores de la seÃ±al suavizada.
%                  ...

    transformada = hilbert(original_signal);
    
    soft_signal = abs(transformada);
    
end
