function filtros = filt()
%                  ...

% filtros = filt()::Funcion sin elementos de entrada
% Funcion que realiza filtros de octavas o de tercios de octava.

% .Octava :: realiza un filtro de octava con las frecuencias centrales [16
% 31 63 125 250 500 1000 2000 4000 8000 16000] -- Tambien devuelve un
% grafico con los filtros.

% .Tercio :: realiza un filtro de tercio de octava en las frecuencias 
% centrales [12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500
% 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500
% 16000 20000]; / Devuleve un grafico de todos los filtros .

%                  ...
   filtros.Octava = @Octava;
   filtros.Tercio = @Tercio;
   
   
end

function octaveFilterBank = Octava()
 
    centerFrequencies = [16 31 63 125 250 500 1000 2000 4000 8000 16000];

    for i=1:11
        octaveFilterBank{i} = octaveFilter(centerFrequencies(i),'1 octave','FilterOrder', 6);
    end

    plotter=fvtool(getFilter(octaveFilterBank{1}),getFilter(octaveFilterBank{2}),getFilter(octaveFilterBank{3}),getFilter(octaveFilterBank{4}),getFilter(octaveFilterBank{5}),getFilter(octaveFilterBank{6}),getFilter(octaveFilterBank{7}),getFilter(octaveFilterBank{8}),getFilter(octaveFilterBank{9}),getFilter(octaveFilterBank{10}),getFilter(octaveFilterBank{11}));
    set(plotter,'FrequencyScale','Log');

end
    
function octaveFilterBank = Tercio()

    centerFrequencies= [12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000 20000];
    
    for i=1:33
       octaveFilterBank{i} = octaveFilter(centerFrequencies(i),'FilterOrder',8);
    end
    
    plotter = fvtool(getFilter(octaveFilterBank{1}),getFilter(octaveFilterBank{2}),getFilter(octaveFilterBank{3}),getFilter(octaveFilterBank{4}),getFilter(octaveFilterBank{5}),getFilter(octaveFilterBank{6}),getFilter(octaveFilterBank{7}),getFilter(octaveFilterBank{8}),getFilter(octaveFilterBank{9}),getFilter(octaveFilterBank{10}),getFilter(octaveFilterBank{11}),getFilter(octaveFilterBank{12}),getFilter(octaveFilterBank{13}),getFilter(octaveFilterBank{14}),getFilter(octaveFilterBank{15}),getFilter(octaveFilterBank{16}),getFilter(octaveFilterBank{17}),getFilter(octaveFilterBank{18}),getFilter(octaveFilterBank{19}),getFilter(octaveFilterBank{20}),getFilter(octaveFilterBank{21}),getFilter(octaveFilterBank{22}),getFilter(octaveFilterBank{23}),getFilter(octaveFilterBank{24}),getFilter(octaveFilterBank{25}),getFilter(octaveFilterBank{26}),getFilter(octaveFilterBank{27}),getFilter(octaveFilterBank{28}),getFilter(octaveFilterBank{29}),getFilter(octaveFilterBank{30}),getFilter(octaveFilterBank{31}),getFilter(octaveFilterBank{32}),getFilter(octaveFilterBank{33}));
    set(plotter,'FrequencyScale','Log');
    
end
