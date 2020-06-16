function [EDT,T10,T20,T30,C80,D50] = Acustic_parameters(Soft_signal,original_Signal)
%%   
%                  ...

% [EDT,T10,T20,T30,C80,D50] = Acustic_parameters(Soft_signal,original_Signal):: Funcion con elementos de entrada
% Funcion que calcula parametros acusticos segun Norma señalada.
% Argumentos de Entrada:: 
%                           Soft_signal : Señal suavizada
%                           original_signal : Señal original, sin
%                           procesamiento.
% Elementos de salida :: 
%       EDT = Early Decay Time en [s]
%       T20 = Parametro T20 [s]
%       T30 = Parametro T30 [s]
%       C80 = Claridad Musical Media (C80) [dB]
%       C50 = Claridad de la Voz (C50) [dB]
%       D50 = Definicion de la voz (D50) [Porcentaje]

%                  ...

%%

% Calculo de los parametros energ?ticos de claridad y definici?n
%       

    Fs = 44100;
    
    Max_Signal = max(original_Signal);            %Máximo del Impulso
    Max_Signal = find(original_Signal == Max_Signal);
    
    pt = original_Signal.^2;                  %Respuesta al Impulso al Cuadrado
    Ms50 = (0.05*Fs);               %Redondeo a 50ms 
    Ms80 = (0.08*Fs);               %Redondeo a 80ms
    
    C80 = 10*log10(trapz(pt(Max_Signal:Max_Signal + Ms80))/trapz(pt(Max_Signal + Ms80:end)));    
    D50 = 100*(sum(pt(Max_Signal:Max_Signal + Ms50))/sum(pt(Max_Signal:end)));  
    
%%  Tiempos de reverberacion


    Fs = 44100;
    x = 0:1/Fs:(length(Soft_signal)-1)/Fs;


    Max_value = find(round(Soft_signal) == max(Soft_signal));
    Max_value = max(Max_value);               

    T_value = find(round(Soft_signal) == round(max(Soft_signal)-5));    
    T_value = T_value(T_value > Max_value);
    T_value = T_value(1);                                      

    % Calculo del EDT (Early Decay Time)
    y1EDT = Max_value;
    y2EDT = find(round(Soft_signal) <= round(max(Soft_signal)-10),1,'first');    

    x1EDT = x(y1EDT);
    x2EDT = x(y2EDT);

    EDT = 6*(x2EDT - x1EDT);

    % Calculo del T10

    y2T10 = find(round(Soft_signal) <= round(max(Soft_signal)-15),1,'first');    

    x1T10 = x(T_value);
    x2T10 = x(y2T10);

    T10 = 6*(x2T10 - x1T10);

    % Calculo del T20

    y2T20 = find(round(Soft_signal) <= round(max(Soft_signal)-25),1,'first');

    x1T20 = x(T_value);
    x2T20 = x(y2T20);

    T20 = 3*(x2T20 - x1T20);

    % Calculo del T30
    y2T30 = find(round(Soft_signal-5) == round(max(Soft_signal)-35),1, 'first');

    x1T30 = x(T_value);
    x2T30 = x(y2T30);

    T30 = 2*(x2T30 - x1T30);

end
