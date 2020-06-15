function Mt = Modulacion(T,F0,Ff)

%                    ...

% Mt = Modulacion(T, F0, Ff) :: Funcion que realiza una modulacion de compensacion 
% de eneria para el filtro inverso
% Procesando los datos : w0,wf,Fs [Hz] y t (array)
% Funcion con argumento de entrada:  
%               T [segundos] = tiempo de duracion
%              F0 [Hz] = frecuencia inicial
%              Ff [Hz] = frecuencia final
% 
% ..nota:: t es un array con "m" puntos entre 0 y T
% Salida = Mt = modulacion 

%                    ...
    
    w0 = 2*pi*F0;
    wf = 2*pi*Ff;
    Fs=44100;
    m=Fs*T;
    t=linspace(0,T,m);
    
    Mt = ((w0)./((((T*w0)/log(wf/w0))/((T/log(wf/w0))))*exp((t)/(T/log(wf/w0)))));
     
end
