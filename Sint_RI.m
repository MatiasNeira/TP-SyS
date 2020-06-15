function y = Sint_RI(T,Fs,bandas,T60)

%                       ...

% y = Sint_RI :: Funcion que sintetiza la respuesta al impulso teniendo en cuenta las
% frecuencias centrales normalizadas segun la banda
% Funcion con argumentos de entrada: 
%                T[segundos] = duracion
%                Fs[Hz] = Frecuencia de sampleo
%                Bandas = corresponde al filtrado por octava ("oct") o tercio de octava ("tercio").
% Salida = y = Respuesta al impulso sintetizada 

%                      ...

    cant = length(f);
    y = zeros(1,cant);
    n = 1/Fs;
    t = (0:n:T);
    Y = 0;
    
    if bandas == 'oct'
        f = [125 250 500 1000 2000 4000 8000];
        else if bandas == 'tercio'
            f = [125 160 200 250 315 400 500 630 800 1000 1250 1600 2250 3150 4000 5000 6000 8000];
        end
    end


    for i=(1:cant)
            for k=(1:length(T60)
                pi_i(k) = (-log(10^-3))./(T60(k)); 
            end
        y(i)=flip(exp(pi_i*t)*cos(2*pi*f(i)*t));
        Y = Y+y(i);
    end
     
     plot(Y);
     
end
