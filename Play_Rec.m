function GR = Play_Rec()
    % GR = Play_Rec :: Funcion sin elementos de entrada
    % Funcion para reproducir y grabar segun funcion anonima seleccionada.
    % .SineSweep :: arg(T) [segundos]-- (Reproduce y graba el SineSweep) --
    % .InverseFilter :: arg(T) [segundos]-- (Reproduce y graba el InverseFilter) --
    % .RuidoRosa :: arg(T) [segundos]-- (Reproduce y graba el RuidoRosa) --
    
     
GR.SineSweep = @SS;
GR.InverseFilter = @IF;
GR.RuidoRosa = @RR;

end

function Sine = SS(T)

     Xt = SineSweep(T);
        
        Fs=44100; 
        sound(Xt,Fs);
        audiowrite('sinesweep.wav',Xt,Fs);
    
        
        bits=16; %bits de grabacion
        canales = 2; %dos canales para que grabe stereo
        input = -1; %por default el input del mic en la compu es -1
        recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba

        disp('-----grabando-----')
        recordblocking(recorder,T); % Graba por un tiempo T
        disp('-----fin de la grabacion-----')

        a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
        audiowrite('SineSweep_Graba.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
        sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)
end

function Inv = IF(T)
   
    Xt = InverseFilter(T);
        
    
        Fs=44100;
        sound(Xt,Fs);
        audiowrite('InverseFilter.wav',Xt,Fs);
        
        bits=16; %bits de grabacion
        canales = 2; %dos canales para que grabe stereo
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
        canales = 2; %dos canales para que grabe stereo
        input = -1; %por default el input del mic en la compu es -1
        recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba

        disp('-----grabando-----')
        recordblocking(recorder,T); % Graba por un tiempo T
        disp('-----fin de la grabacion-----')

        a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
        audiowrite('RuidoRosa_Graba.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
        sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)
end