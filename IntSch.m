function Etsch = IntSch(original_signal,Norm_signal)

%                     ...

% [E] = IntSch(original_signal,Norm_signal)::Funcion que aproxima un impulso a una seÃ±al mas adecuada, a traves de la
% transformada de Schroeder 
% Funcion con elementos de entrada:
%           original_signal = Respuesta al impulso [Señal original]
%           Norm_signal = Señal suavizada (Transformada de Hilbert) y Normalizada [Señal Normalizada]
% 
% Salida = Etsch = Señal respuesta de Schroeder Normalizada

%                    ...

    fs = 44100;
    
    integral_limit = lundeby(Norm_signal);   %Limite de integracion
    
    htsch(integral_limit:-1:1) = (cumsum(original_signal(integral_limit:-1:1).^2)/...
                      (sum(original_signal(1:length(original_signal))).^2));  
                  
    Etsch = 10*log10(htsch/max(abs(htsch))); %Normalizacion

end


