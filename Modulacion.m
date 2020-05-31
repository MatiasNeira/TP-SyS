function Mt = Modulacion(T,F0,Ff)

%                    ...
% 
% Mt = Modulacion :: Funcion con argumento de entrada
% Argumentos : T [segundos] tiempo de duracion
%              F0 [Hz] frecuencia inicial
%              Ff [Hz] frecuencia final
% La funcion realiza una modulacion de compensacion 
% de eneria para el filtro inverso
% Procesando los datos : w0,wf,Fs [Hz] y t (array)
% ..nota:: t es un array con "m" puntos entre 0 y T
%
%                    ...
    
    w0 = 2*pi*F0;
    wf = 2*pi*Ff;
    Fs=44100;
    m=Fs*T;
    t=linspace(0,T,m);
    
    Mt = ((w0)./((((T*w0)/log(wf/w0))/((T/log(wf/w0))))*exp((t)/(T/log(wf/w0)))));
     
end
