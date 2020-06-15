function y = Sint_RI(T,Fs,band)
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
    if band == 'oct'
        f = [125 250 500 1000 2000 4000 8000 ];
        T60 = [1.07 1.34 1.39 1.22 1.17 1.08 0.76];
    
    elseif band == 'ter'
        f =[125 160 200 250 315 400 500 630 800 1000 1250 1600 2250 3150 4000 5000 6000 8000];  
        T60 = [1.07 1.34 1.39 1.22 1.17 1.08 0.76 0.52 1.07 1.04 1.09 0.32 0.17 1.08 0.761 1.07 1.02 0.76];

    end
    
    cant = length(f);
    y = cell(cant,1);
    pi_i = (-log(10^-3))./(T60); 
    
  for k= 1:length(f)                                          
        pik(k) = (-log(10^-3))./(T60(k)); 
        y{k} = flip((exp(pik(k)*t)).*cos(2*pi*f(k)*t)); %Genero un banco de IRs por frec. centrales           
       
    end
    


    for i = 1:length(f)
 
            Sumcell = cumsum(y{i});
            Ajustecero = Sumcell - Sumcell(length(t));           
            SintIR = Ajustecero./abs(max(Ajustecero));
                    
    end
    
end
