function soft_signal = Hilbert(original_signal)

%                  ...

% soft_signal = Hilbert(original_signal) :: Funcion que suaviza una señal a traves de la transformada de Hilbert
% Funcion con elemento de entrada: 
%               original_signal =  array de valores de una señal original
% Salida = soft_signal = array de valores de la señal suavizada

%                  ...

    transformada = hilbert(original_signal);
    
    soft_signal = abs(transformada);
    
end
