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

function z = Octava(Audio)
    
    Fs = 44100;
    
    fc = [16 31 63 125 250 500 1000 2000 4000 8000];
    
    octaveFilterBank = cell(1,length(fc));
    
    for i=1:10
        
            f_in = fc(i)/2^(1/2);
            
            f_sup = fc(i)*2^(1/2);
            
            octaveFilterBank{1,i} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_in,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);
            
    end
    
%         plotter = fvtool(octaveFilterBank{1},octaveFilterBank{2},octaveFilterBank{3},octaveFilterBank{4},octaveFilterBank{5},octaveFilterBank{6},octaveFilterBank{7},octaveFilterBank{8},octaveFilterBank{9},octaveFilterBank{10});
%         set(plotter,'FrequencyScale','Log');
     
    z = {zeros(1,length(Audio))};

    for i = 1:length(octaveFilterBank)

        fil = octaveFilterBank{i};

        z = filtfilt(fil,Audio);

    end
end
    
function z = Tercio(Audio)

    Fs=44100;
    fc=[12.5 16 20 25 31.5 40 50 63 80 100 125 160 200 250 315 400 500 630 800 1000 1250 1600 2000 2500 3150 4000 5000 6300 8000 10000 12500 16000 20000];
        
    octaveFilterBank = cell(1,length(fc));
    
        for i = 1:26
            
            f_in = fc(i)/2^(1/2);
            f_sup = fc(i)*2^(1/2);
            
            octaveFilterBank{1,i} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_in,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);  
        end
    
    plotter = fvtool(octaveFilterBank{1},octaveFilterBank{2},octaveFilterBank{3},octaveFilterBank{4},octaveFilterBank{5},octaveFilterBank{6},octaveFilterBank{7},octaveFilterBank{8},octaveFilterBank{9},octaveFilterBank{10},octaveFilterBank{11},octaveFilterBank{12},octaveFilterBank{13},octaveFilterBank{14},octaveFilterBank{15},octaveFilterBank{16},octaveFilterBank{17},octaveFilterBank{18},octaveFilterBank{19},octaveFilterBank{20},octaveFilterBank{21},octaveFilterBank{22},octaveFilterBank{23},octaveFilterBank{24},octaveFilterBank{25},octaveFilterBank{26},octaveFilterBank{27},octaveFilterBank{28},octaveFilterBank{29},octaveFilterBank{30},octaveFilterBank{31},octaveFilterBank{32},octaveFilterBank{33});
    set(plotter,'FrequencyScale','Log');
    
    z = {zeros(1,length(Audio))};

        for i = 1:length(octaveFilterBank)

            fil = octaveFilterBank{i};

            z = filtfilt(fil,Audio);

        end
end

