function [b,m] = RL_CM(X,Y)
%                                       ...
% [b,m] = RL_CM(X,Y) :: Funcion con elementos de entrada.
% Funcion que aproxima una recta mediante una regresion lineal con un ajuste por cuadrados minimos
% Parametros de entrada :: 
%                           X : Valores del dominio de la señal.
%                           Y : Valores que toma la señal.
% Parametros de Salida :: 
%                          [b,m] : parametros que da valor a la recta de
%                           ajuste de la siguiente manera ::
%                          Y = mX + b; siendo m la pendiente y b la
%                           ordenada al origen.
%                                       ...
    
    amount_X = length(X); % cantidad de elementos de X
    amount_Y = length(Y); % cantidad de elementos de Y
    
    
    multip_XY = zeros(1,length(X)); %vector que multiplica el valor i de X por el valor i de Y.
    for i = 1:amount_X
        multip_XY(i)= X(i)*Y(i);
    end
    
    X_squared = X.^2; %valores del array X elevados al cuadrado(punto a punto).
    
    %% Sumatorias
    sum_x = 0;
    for i = 1:amount_X
       sum_x = sum_x + X(i);
    end
    
    sum_y = 0;
    for i = 1:amount_Y
       sum_y = sum_y + Y(i);
    end
    
    sum_xy = 0;
    for i = 1:amount_X
       sum_xy = sum_xy + multip_XY(i);
    end
    
    sum_x2=0;
    for i = 1:amount_X
       sum_x2 = sum_x2 + X_squared(i);
    end
    
    %% Cálculo de prametros
    m = (sum_xy-((sum_x*sum_y)/amount_X))/(sum_x2-((sum_x)^2)/amount_X);
    
    b = ((sum_y)/amount_X)-(m*((sum_x)/amount_X));
    
end



