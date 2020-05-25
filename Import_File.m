function [a,b] = Import_File(tipo)
% [a,b] = Import_File :: Funcion con argumentos de entrada
% La funcion importa un archivo .wav.
% Argumento :: tipo

    if tipo == 1

        file = uigetfile('*.wav','Seleccione RI');
        a = audioread(file);

    end

%-----------------------------------------------------------

    if tipo == 2

        file = uigetfile('*.wav','Seleccione SS');
        a = audioread(file);

        fileb = uigetfile('*.wav','Seleccione FI');
        b = audioread(fileb);
    end

end
