function [a0,a1] = cuadMin(x,y)
%%  Funcion cuadMin
%   
%     [a0,a1] = cuadMin(x,y)
% 
%   Realiza una regresion lineal mediante un ajuste por cuadrados
%   minimos.
%
%   Inputs: 
%       x, y = Coordenadas de cada muestra de la senal a procesar.
%
%   Output: 
%       a0, a1 = Coeficientes de una recta de ajuste definida como a0+a1*x

   
    A = ones(length(x),2);
    A(:,2) = x;
    B = y;
    
    try
        coef = (A'*A)\(A'*B);
        a0 = coef(1);
        a1 = coef(2);
    catch
        switch length(x)==length(y)
            case 1                      %Si y es ingresado como vector columna
               B = B';
               coef = (A'*A)\(A'*B);
               a0 = coef(1);
               a1 = coef(2);
        end
    end
    X = min(x):0.1: max(x);
    Y = min(y):0.1: max(y);
    Y = a0 + a1*X;
    
    
%     
end