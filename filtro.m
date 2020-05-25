function fil = filtro(bandas)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
     Fs=44100;

     %---------------------------------------------------------------------
     if bandas==1
          fc=[63 125 250 500 1000 2000 4000 8000 16000];
          
     for i=(1:8)
     
        f_inf = fc(i)/2^(1/2);
        f_sup = fc(i)*2^(1/2);
       
           fil{i,1} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_inf,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);  
     end
     
     fvtool(fil{4,1})
     
     end
     %---------------------------------------------------------------------
     if bandas==2
     fc=[30 40 50 60 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2250 3150 4000 5000 6000 8000 10000 12000 16000]
     
     for i=(1:26)
          f_inf = fc(i)/2^(1/2);
          f_sup = fc(i)*2^(1/2);
       
            fil{i,1} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_in,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);  
     end
     
     fvtool(fil{4,1})
     end
end
    
