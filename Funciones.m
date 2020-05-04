%%RuidoRosa
function Xt= ruidorosa(t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    Fs=44100;
    Nx=Fs*t; %Cantidad de muestras a sintetizar
    B=[0.049922035 -0.095993537 0.050612699 -0.004408786]; %Coeficientes de el filtro de 3db de caida
    A=[1 -2.494956002 2.017265875 -0.522189400];
    nT60=round(log(1000)/1-max(abs(roots(A)))); %Calcula la cantidad de muestras que ocupa el TR. Creo.
    v=randn(1,Nx+nT60);
    x=filter(B,A,v);
    Xt=x(nT60+1:end);
    plot(Xt);title('Ruido Rosa');ylabel('Amplitud');xlabel('frecuencia')
    sound(Xt,Fs);
    audiowrite('ruidoRosa.wav',Xt,Fs);
    
    %% Grabacion y Reproduccion del ruido rosa
    
    bits=16; %bits de grabacion
    canales = 2; %dos canales para que grabe stereo
    input= -1; %por default el input del mic en la compu es -1
    recorder = audiorecorder(Fs,bits,canales,input); %informacion y forma en la que graba
    
    disp('-----grabando-----')
    recordblocking(recorder,t); % Graba por un tiempo t
    disp('-----fin de la grabacion-----')
    
    a=getaudiodata(recorder); %Guarda el audio (en forma matricial) en la variable a
    audiowrite('grabacion.wav',a,Fs); % Guarda en forma de archivo de audio .WAV
    sound(a,Fs) %Reproduce el archivo de audio de la grabacion (a)
    
end
        
%%SineSweep
        
function Xt = sineSweep(tf,w0,wf)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs=44100
m= Fs*tf
t = linspace(0,tf,m);
k=(tf*w0)/log(wf/w0);
L=tf/log(wf/w0);

Xt = sin(k*(exp(t/L)-1));
end

    
    %%Modulacion
    
function Mt = functionMt(tf,w0,wf,t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    Mt=(w0/2*pi*((tf*w0)/log(wf/w0))/((tf/log(wf/w0))))*exp(t/(tf/log(wf/w0)))
end