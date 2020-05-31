function fil = filtro(bandas)
% fil = filtro :: Funcion con argumentos de entrada
% La funcion genera un vector en el que cada caeficiente es un filtro,
% dependiendo de la frecuencia central.
% Argumento :: banda
%..notas:: si banda = 1 cada coeficiente va a ser un filtro de octava
% si la banda = 2 cada coeficiente va a ser un filtro de tercio de octava.

   
     Fs=44100;
%---------------------------------------------------------------------
    if bandas==1
        fc=[16 31 63 125 250 500 1000 2000 4000 8000 16000];
        
        for i=(1:8)
            f_in = fc(i)/2^(1/2);
            f_sup = fc(i)*2^(1/2);
            fil{i,1} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_in,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);  
        end
        
        fvtool(fil{4,1})
    end
    %---------------------------------------------------------------------
    if bandas==2
        fc=[12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000 20000];
        
        for i=(1:26)
            f_in = fc(i)/2^(1/2);
            f_sup = fc(i)*2^(1/2);
            fil{i,1} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_in,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);  
        end
        
        fvtool(fil{4,1})
    end

end
    
