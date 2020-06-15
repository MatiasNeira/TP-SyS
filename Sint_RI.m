function y = Sint_RI(T,Fs,bandas,T60)
% y = Sint_RI :: Funcion con argumentos de entrada
% La funcion sintetiza la respuesta al impulso teniendo en cuenta las
% frecuencias centrales normalizadas segun la banda.
% Argumentos T,Fs,bandas :: T[segundos];Fs[Hz] 
%..notas:: T es el tiempo de duracion 
% Bandas corresponde al filtrado por octava ("oct") o tercio de octava ("tercio").
% 
    
    
    n = 1/Fs;
    t = (0:n:T);
    Y = 0;
    f=0;
    if bandas == 'oct'
        f = [125 250 500 1000 2000 4000 8000];
        else if bandas == 'tercio'
            f = [125 160 200 250 315 400 500 630 800 1000 1250 1600 2250 3150 4000 5000 6000 8000];
        end
    end
    cant = length(f);
    y = zeros(1,cant);
    a = zeros(1,cant);
    pi_i = (-log(10^-3))/(T60); 
    
    for i=(1:cant)
       a(i)=f(i)*(2*pi*t(i));
   y(i)=flip(exp(pi_i*t(i))*cos(a(i)));
        Y = Y+y(i);
    end
     
     plot(Y);
     
end
