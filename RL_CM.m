function Y = RL_CM(a)

%
%                        ...
% Funcion que aproxima una recta mediante una regresion lineal con un ajuste por cuadrados minimos
% Parametros de entrada :: 
%                           a: 
%                        ...


    n=length(a);
    x=linspace(0,1,n);
    E=0;
    Ex=0;
    Ey=0;

    for i=1:n
        E=E+(a(i)*i);
        Ex=Ex+i;
        Ey=Ey+a(i);
    end

    m=(n*E-Ex*Ey)/(n*(Ex)^2 - abs((Ex)^2));
    b=(Ey*(Ex)^2 -Ex*E)/(n*(Ex)^2 - abs((Ex)^2));
    Y=m*x+b;

    subplot (2,1,1)
    plot(a)
    subplot(2,1,2)
    plot(Y)
    end


