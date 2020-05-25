function Mt = Modulacion(T)
%Mt = Modulacion :: Funcion con argumento de entrada.
%Argumento T :: tiempo [segundos]
%La funcion realiza una modulacion de compensacion 
%de eneria para el filtro inverso.
%procesando los datos : w0,wf,Fs [Hz] y t (array). Dando la salida Mt.
% ..nota:: t es un array con "m" puntos entre 0 y T.
    
    w0 = 20;
    wf = 22000;
    Fs=44100;
    m=Fs*T;
    t=linspace(0,T,m);
    
    Mt = ((w0)./((((T*w0)/log(wf/w0))/((T/log(wf/w0))))*exp((t)/(T/log(wf/w0)))));
     
end
