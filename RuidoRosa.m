function Xt= RuidoRosa(T)

%                    ...
%
% Xt= RuidoRosa :: funcion con argumento T [segundos] de entrada
% La funcion crea la generacion de un ruido rosa a traves de una serie de
% valores:
%   Fs [Hz] -- Frecuencia de muestreo
%   Nx -- Cantidad de muestras
%   A y B coeficientes del filtro
% Salida Xt :: array de valores y un plot
%
%                    ...


    Fs = 44100;
    Nx = Fs*T;
    B = [0.049922035 -0.095993537 0.050612699 -0.004408786]; 
    A = [1 -2.494956002 2.017265875 -0.522189400];
    
    nT60 = round(log(1000)/1-max(abs(roots(A)))); 
    v = randn(1,Nx+nT60);
    x = filter(B,A,v);
    
    Xt = x(nT60+1:end);
    
    plot(Xt);title('Ruido Rosa');ylabel('Amplitud');xlabel('frecuencia');
    
end
