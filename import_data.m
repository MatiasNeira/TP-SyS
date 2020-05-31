function Import = import_data()

%                  ...

% Import=import_data()::Funcion sin elementos de entrada
% Funcion que importa archivos ´.wav´ seleccionados y recopila sus correspodientes datos de forma numerica
% .RespuestaImpulso :: Importa la RI seleccionada y recopila sus datos
% .SS_FI :: Importa el sine-sweep y el filtro inverso seleccionados y recopila sus dato

%                  ...


disp('----Elija las caracteristicas del archivo----')

Import.RespuestaImpulso = @RI;
Import.SS_FI = @SF;



end

function files = RI()
    
    file = uigetfile('*.wav','Seleccione uno o mas archivos (Respuesta al Impulso)','Multiselect','on');
    
    files = cell(1,length(file));
    
    for i= 1 : length(file)
        files{i} = audioread(file{i}); 
    end
   
end 

function files = SF()
   
      file = uigetfile('*.wav','Seleccione uno o mas archivos (Sine-Sweep y Filtro Inverso)','Multiselect','on');
      
      files = cell(1,length(file));
    
      for i= 1 : length(file)
        files{i} = audioread(file{i}); 
      end
      
end
