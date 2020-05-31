function iF = InverseFilter(T,Fi,Ff)
%iF = InverseFilter :: Funcion con argumento de entrada.
% Argumentos : T [segundos] tiempo de duracion.
%              Fi [Hz] frecuencia inicial.
%              Ff [Hz] frecuencia final.
%La funcion realiza un Filtro Inverso de tiempo T (arg)
%Devolviendo como salida iF (Array) y un plot del mismo (Amplitud vs. tiempo).
    
Fs=44100;
m=Fs*T;
t=linspace(0,T,m);

D = flip(SineSweep(T,Fi,Ff));

iF = Modulacion(T).*D;


plot(t,iF);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo');
end
