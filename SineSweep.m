function Xt = SineSweep(T,F0,Ff)

%                   ...
%
% Xt=SineSweep :: Funcion con argumentos de entrada
% Argumentos : T [segundos] tiempo de duracion
%              F0 [Hz] frecuencia inicial
%              Ff [Hz] frecuencia final
% La funcion realiza un sine-sweep de tiempo T asignado,
% procesando los datos: w0, wf, Fs [Hz] y t. La salida es Xt.
% ..nota:: t es un array con "m" puntos entre 0 y T.
%
%                   ...

    
    w0 = 2*pi*F0;
    wf = 2*pi*Ff;
    Fs=44100;
    m = Fs*T;
    t = linspace(0,T,m);
    
    k=(T*w0)/log(wf/w0);
    L=T/log(wf/w0);
    
    Xt = sin(k*(exp(t/L)-1));
    
    plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo')
end
