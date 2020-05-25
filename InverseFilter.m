function iF = InverseFilter(T)
%iF = InverseFilter :: Funcion con argumento de entrada.
%Argumento T :: tiempo [segundos]
%La funcion realiza un Filtro Inverso de tiempo T (arg)
%Devolviendo como salida iF (Array) y un plot del mismo (Amplitud vs. tiempo).
    
w0 = 20;
wf = 22000;
Fs=44100;
m=Fs*T;
t=linspace(0,T,m);

D = flip(SineSweep(T));

iF = Modulacion(T).*D;


plot(t,iF);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo');
end
