function iF = InverseFilter(T,F0,Ff)

%                      ...
%                      
% iF = InverseFilter :: Funcion con argumento de entrada.
% Argumentos : T [segundos] tiempo de duracion.
%              F0 [Hz] frecuencia inicial.
%              Ff [Hz] frecuencia final.
% La funcion realiza un filtro inverso de tiempo T [segundos]
% 
%                      ...
    Fs=44100;
    m=Fs*T;
    t=linspace(0,T,m);

    D = flip(SineSweep(T,F0,Ff));

    iF = Modulacion(T,F0,Ff).*D;

% Test
    %Test_INvFilt(t,iF) % Descomentar para testear

end

function Test = Test_INvFilt(t,iF)
% --- Test para el filtro inverso :: Entrega una representacion grafica de Amplitud vs Tiempo ---

    plot(t,iF);title('Inverse Filter');ylabel('Amplitud');xlabel('Tiempo');
    
end
