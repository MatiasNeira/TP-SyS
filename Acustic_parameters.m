function [EDT,T10,T20,T30,T60,C80,D50] = Acustic_parameters(Soft_signal,original_Signal,Method_T60)
%%   
%                  ...

% [EDT,T10,T20,T30,C80,D50] = Acustic_parameters(Soft_signal,original_Signal,Method_T60):: Funcion con elementos de entrada
% Funcion que calcula parametros acusticos segun Norma señalada.
% Argumentos de Entrada:: 
%                           Soft_signal : Señal suavizada
%                           original_signal : Señal original, sin
%                           procesamiento.
%                           Method_T60 : Metodo de obtencion del T60 -- A
%                           traves del T10, T20 ó T30.
% Elementos de salida :: 
%       EDT = Early Decay Time en [s]
%       T20 = Parametro T20 [s]
%       T30 = Parametro T30 [s]
%       T60 = Parametro T60 [s]
%       C80 = Claridad             (C80) [dB]
%       D50 = Definicion de la voz (D50) [Porcentaje]

%                  ...

    Fs = 44100;

%% Transformacion del eje X de muestras a Tiempo [Segundos]

    x = 0:1/Fs:(length(Soft_signal)-1)/Fs; 
    

%% Encuentro el maximo valor que toma la funcion en el dominio [maxValue_X]
    
    maxValue_Y = max(Soft_signal);
        for i = 1:length(Soft_signal)
            if Soft_signal(i) == maxValue_Y
                break
            end
        end
    maxValue_X = i; % i-ésima muestra
    

%% Valor del dominio de la señal despues de una decaida de 5dB desde su pico maximo [X_5dBDecay]

    Y_5dBDecay = max(Soft_signal)-5;
        for i = 1:length(Soft_signal)
            if round(Soft_signal(i)) == Y_5dBDecay
                break
            end
        end
    X_5dBDecay = i; % i-ésima muestra
    
%% Cálculo del EDT
    Y_10dBDecay = max(Soft_signal)-10;
        for i = 1:length(Soft_signal)
            if round(Soft_signal(i)) == Y_10dBDecay
                break
            end
        end
    X_10dBDecay = i; % i-ésima muestra
    
    % Transformacion de muestras a segundos.
    T0_EDT = x(maxValue_X);
    Tf_EDT = x(X_10dBDecay);
      
    EDT = 6*(Tf_EDT - T0_EDT);

%% Calculo del T10
    Y_15dBDecay = max(Soft_signal)-15;
        for i = 1:length(Soft_signal)
            if round(Soft_signal(i)) == Y_15dBDecay
                break
            end
        end
    X_15dBDecay = i; % i-ésima muestra
    
    % Transformacion de muestras a segundos.
    T0_T10 = x(X_5dBDecay);
    Tf_T10 = x(X_15dBDecay);
    
    T10 = 6*(Tf_T10 - T0_T10);
    
%% Calculo del T20  
    Y_25dBDecay = max(Soft_signal)-25;
        for i = 1:length(Soft_signal)
            if round(Soft_signal(i)) == Y_25dBDecay
                break
            end
        end
    X_25dBDecay = i; % i-ésima muestra
    
    % Transformacion de muestras a segundos.
    T0_T20 = x(X_5dBDecay);
    Tf_T20 = x(X_25dBDecay);
    
    T20 = 3*(Tf_T20 - T0_T20);
%% Calculo del T30
    Y_35dBDecay = max(Soft_signal)-35;
        for i = 1:length(Soft_signal)
            if round(Soft_signal(i)) == Y_35dBDecay
                break
            end
        end
    X_35dBDecay = i; % i-ésima muestra
    
    % Transformacion de muestras a segundos.
    T0_T30 = x(X_5dBDecay);
    Tf_T30 = x(X_35dBDecay);
    
    T30 = 2*(Tf_T30 - T0_T30);
%% Calculo del T60 dependiendo el método

    switch Method_T60
        case 'T10' 
            T60 = T10*6;
        case 'T20'
            T60 = T20*3;
        case 'T30'
            T60 = T30*2;
    end    

 %% Calculo del C80 y D50
 
    Max_Signal = max(original_Signal);            %Máximo del Impulso
    Max_Signal = find(original_Signal == Max_Signal);
    
    pt = original_Signal.^2;                  %Respuesta al Impulso al Cuadrado
    Ms50 = (0.05*Fs);               %Redondeo a 50ms 
    Ms80 = (0.08*Fs);               %Redondeo a 80ms
    
    C80 = 10*log10(trapz(pt(Max_Signal:Max_Signal + Ms80))/trapz(pt(Max_Signal + Ms80:end)));    
    D50 = 100*(sum(pt(Max_Signal:Max_Signal + Ms50))/sum(pt(Max_Signal:end)));

end
