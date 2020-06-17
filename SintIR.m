function SintIR = SintIR(time,band)
%Sintetizacion de respuesta al impulso

%   fcen = Frecuencia Central
%   T60 = Tiempo de reverberacion
%   time = Duracion del impulso
%   ri = Respuesta al impuslo
%   pii = Decamiento exponencial en funcion del tiempo de rev.
%   band = Seleccion de Frecucuencias por banda de octavas(oct) o tercio de
%   octava(ter)
f_cen = zeros(18);
T60 = zeros(18);
% Seleccion de Frecucuencias en Banda de octavas(oct) o tercio de octava(ter)
    if band == 'oct'

        %Frecuencias centrales nominales por banda de octavas
        f_cen = [125 250 500 1000 2000 4000 8000];
          %T60 = Tiempo_de_Reverberacion (Referencia: Venturi,Farina. ArchitecturalAcoustics: Advanced Analysis ofRoom Acoustics:ISO 3382 ICA2013)
        T60 = [1.07 1.34 1.39 1.22 1.17 1.08 0.76];
    
    elseif band == 'ter'
        %Frecuencias_centrales_nominales_po_banda tercio de octavas
        f_cen =[125 160 200 250 315 400 500 630 800 1000 1250 1600 2250 3150 4000 5000 6000 8000];
          %T60 = Tiempo de Reverberacion 
        T60 = [1.07 1.34 1.39 1.22 1.17 1.08 0.76 0.52 1.07 1.04 1.09 0.32 0.17 1.08 0.761 1.07 1.02 0.76];

    end
     
    
% Ajuste de tiempo y frecuencia de muestreo
    SampleRate = 44100;
    N = time*SampleRate;
    t = linspace(0,time,N);                                       
        
    
% Decamiento exponencial en funcion del tiempo de rev
    for k= 1:length(f_cen)                                          
        pik(k) = (-log(10^-3))./(T60(k)); 

%        Respuesta al impulso
        y_i{k} = flip((exp(pik(k)*t)).*cos(2*pi*f_cen(k)*t)); %Genero un banco de IRs por frec. centrales           
       
    end
    
% Sumatoria de IR

    for i = 1:length(f_cen)
 
            Sumcell = cumsum(y_i{i});
            Ajustecero = Sumcell - Sumcell(length(t));           
            SintIR = Ajustecero./abs(max(Ajustecero));
                    
    end
% % Grafica    
%      plot(seconds(t),SintIR);
%      title('Sintetizacion de Respuesta al Impulso');
%   
% % Guardado de la respuesta al impulso en formato .wav
% name = ['SintIR'];
% audiowrite('SintIR.wav',SintIR,44100)
%      
% % Chequeo    
%      subplot(3,1,1);
%      %plot(seconds(t),escale{k});
%      title('Sintetizacion de IR Primera ESCALA UN Impulso');
%     
%      subplot(3,1,2); 
%      plot(seconds(t),SintIR);
%      title('Sintetizacion de SUMA Respuesta al Impulso');
% 
%       subplot(3,1,3); 
%       plot(seconds(t),Ajustecero);
%       title('Sintetizacion de IR Suma con error');
% 
%             if OctOrTer == 'oct'
%                 Ajustecero = y_i{1}+y_i{2}+y_i{3}+y_i{4}+y_i{5}+y_i{6}+y_i{7};
%             
%             elseif OctOrTer == 'ter'
%                 Ajustecero = y_i{1}+y_i{2}+y_i{3}+y_i{4}+y_i{5}+y_i{6}+y_i{7}+y_i{8}+y_i{9}+y_i{10}+y_i{11}+y_i{12}+y_i{13}+y_i{14}+y_i{15}+y_i{16}+y_i{17}+y_i{18};
%             end            
% 
%              Sumcell = cumsum(escale{k});
%              Ajustecero = Sumcell./max(Sumcell); 
%              SintIR = Ajustecero - Ajustecero(length(t));
%      
% end