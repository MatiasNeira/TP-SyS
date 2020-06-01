function [E] = IntSch(RI,Time)
%                  ...

% [E] = IntSch(RI,T)::Funcion con elementos de entradas : RI (Respuesta al
% impulso) --- Time tiempo [segundos]
% Funcion que aproxima un impulso a una señal mas adecuada, a traves de la
% transformada de Schroeder.
% Salida E : array de valores.

%                  ...

Int_arg = RI^2;
t =(0:Time);
E = zeros(1,Time);

    for i = (0:Time)
        E(i)= integral(Int_arg,0,inf) - integral(Int_arg,0,t(i));
    end

end

