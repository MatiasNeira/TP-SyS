function Xt = SineSweep(T)
%Xt = SineSweep :: Funcion con argumento T [segundos] de entrada.
%La funcion realiza un Sinesweep de tiempo T asignado como entrada
%procesando los datos : w0,wf,Fs [Hz] y t (array). Dando la salida Xt.
% ..nota:: t es un array con "m" puntos entre 0 y T.
    
    w0 = 20;
    wf = 22000;
    Fs=44100;
    m = Fs*T;
    t = linspace(0,T,m);
    
    k=(T*w0)/log(wf/w0);
    L=T/log(wf/w0);
    
    Xt = sin(k*(exp(t/L)-1));
    
    plot(t,Xt);title('Sine-Sweep');ylabel('Amplitud');xlabel('Tiempo')
end
