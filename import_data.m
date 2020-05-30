function Import = import_data()


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
