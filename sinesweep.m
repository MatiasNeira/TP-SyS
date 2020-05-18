function Xt = sinesweep(T,w0,wf)

    Fs=44100;
    m = Fs*T;
    t = linspace(0,T,m);
    k=(T*w0)/log(wf/w0);
    L=T/log(wf/w0);
    Xt = sin(k*(exp(t/L)-1));
    plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo')
    sound(Xt,Fs);
    audiowrite('sinesweep.wav',Xt,Fs);

 %% Grabacion y Reproduccion del SineSweep

        bits=16; %bits de grabacion
        canales = 2; %dos canales para que grabe stereo
        input = -1; %por default el input del mic en la compu es -1
        recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba

        disp('-----grabando-----')
        recordblocking(recorder,T); % Graba por un tiempo T
        disp('-----fin de la grabacion-----')

        a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
        audiowrite('sinesweepGraba.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
        sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)

end
