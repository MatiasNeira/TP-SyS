function Xt = RuidoRosa(T)

%                    ...

% Xt = RuidoRosa :: La funcion crea la generacion de un ruido rosa a traves de una serie de
% valores:
%   Fs [Hz] -- Frecuencia de muestreo
%   Nx -- Cantidad de muestras
%   A y B coeficientes del filtro
% Funcion con argumento de entrada:  
%                   T[segundos] = duracion
% Salida = Xt = array de valores correspondientes a la señal de ruido rosa

%                    ...

    Fs = 44100;
    Nx = Fs*T;
    B = [0.049922035 -0.095993537 0.050612699 -0.004408786]; 
    A = [1 -2.494956002 2.017265875 -0.522189400];
    
    nT60 = round(log(1000)/1-max(abs(roots(A)))); 
    v = randn(1,Nx+nT60);
    x = filter(B,A,v);
    
    Xt = x(nT60+1:end);

% Test
    %Test_RR(Xt)    %Descomentar para testear
    
end

function Test = Test_RR(Xt)
%------ Test del Ruido Rosa con una duracion de T segundos y la
%       representacion en un plot ----------------

    plot(Xt);title('Ruido Rosa');ylabel('Amplitud');xlabel('tiempo');

end
