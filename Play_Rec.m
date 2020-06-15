function GR = Play_Rec()
 
 %                       ...
 
 % GR = Play_Rec :: Funcion que reproduce y graba la opcion seleccionada:
 % .SineSweep : arg(T) [segundos]-- (Reproduce y graba el SineSweep) 
 % .InverseFilter : arg(T) [segundos]-- (Reproduce y graba el InverseFilter) 
 % .RuidoRosa : arg(T) [segundos]-- (Reproduce y graba el RuidoRosa) 
 % Funcion sin elementos de entrada

 %                       ...   
 
    GR.SineSweep = @SS;
    GR.InverseFilter = @IF;
    GR.RuidoRosa = @RR;
    
end

function Sine = SS(T,F0,Ff)

     Xt = SineSweep(T,F0,Ff);
        
        Fs=44100; 
        sound(Xt,Fs);
        audiowrite('sinesweep.wav',Xt,Fs);
    
        bits=16; %bits de grabacion
        canales = 1; %dos canales para que grabe stereo
        input = -1; %por default el input del mic en la compu es -1
        recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba

        disp('-----grabando-----')
        recordblocking(recorder,T); % Graba por un tiempo T
        disp('-----fin de la grabacion-----')

        a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
        audiowrite('SineSweep_Graba.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
        sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)
end

function Inv = IF(T,F0,Ff)
   
    Xt = InverseFilter(T,F0,Ff);
        
    
        Fs=44100;
        sound(Xt,Fs);
        audiowrite('InverseFilter.wav',Xt,Fs);
        
        bits=16; %bits de grabacion
        canales = 1; %dos canales para que grabe stereo
        input = -1; %por default el input del mic en la compu es -1
        recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba

        disp('-----grabando-----')
        recordblocking(recorder,T); % Graba por un tiempo T
        disp('-----fin de la grabacion-----')

        a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
        audiowrite('InverseFilter_Graba.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
        sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)
    

end

function Ruido = RR(T)

    Xt = RuidoRosa(T);
        
        Fs=44100;
        sound(Xt,Fs);
        audiowrite('RuidoRosa.wav',Xt,Fs);
        
        bits=16; %bits de grabacion
        canales = 1; %dos canales para que grabe stereo
        input = -1; %por default el input del mic en la compu es -1
        recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba

        disp('-----grabando-----')
        recordblocking(recorder,T); % Graba por un tiempo T
        disp('-----fin de la grabacion-----')

        a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
        audiowrite('RuidoRosa_Graba.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
        sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)
end
