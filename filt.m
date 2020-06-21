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

function z = Octava(Audio,Fc)
   
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
     
   
    switch Fc
        case '16'
        z = filtfilt(octaveFilterBank{1},Audio);
        case '31'
        z = filtfilt(octaveFilterBank{2},Audio);
        case '63'
        z = filtfilt(octaveFilterBank{3},Audio);
        case '125'
        z = filtfilt(octaveFilterBank{4},Audio);
        case '250'
        z = filtfilt(octaveFilterBank{5},Audio);
        case '500'
        z = filtfilt(octaveFilterBank{6},Audio);
        case '1000'
        z = filtfilt(octaveFilterBank{7},Audio);
        case '2000'
        z = filtfilt(octaveFilterBank{8},Audio);
        case '4000'
        z = filtfilt(octaveFilterBank{9},Audio);
        case '8000'
        z = filtfilt(octaveFilterBank{10},Audio);
    end

end
   
function z = Tercio(Audio,Fc)

    Fs = 44100;
    fc = [125,160,200,315,400,500,630,800,1000,1250,1600,2250,3150,4000,5000,6000,8000];

    octaveFilterBank = cell(1,length(fc));
   
        for i = 1:17
           
            f_in = fc(i)/2^(1/2);
            f_sup = fc(i)*2^(1/2);
           
            octaveFilterBank{1,i} = designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f_in,'HalfPowerFrequency2',f_sup,'SampleRate',Fs);  
        end
   
%     plotter = fvtool(octaveFilterBank{1},octaveFilterBank{2},octaveFilterBank{3},octaveFilterBank{4},octaveFilterBank{5},octaveFilterBank{6},octaveFilterBank{7},octaveFilterBank{8},octaveFilterBank{9},octaveFilterBank{10},octaveFilterBank{11},octaveFilterBank{12},octaveFilterBank{13},octaveFilterBank{14},octaveFilterBank{15},octaveFilterBank{16},octaveFilterBank{17},octaveFilterBank{18},octaveFilterBank{19},octaveFilterBank{20},octaveFilterBank{21},octaveFilterBank{22},octaveFilterBank{23},octaveFilterBank{24},octaveFilterBank{25},octaveFilterBank{26},octaveFilterBank{27},octaveFilterBank{28},octaveFilterBank{29},octaveFilterBank{30},octaveFilterBank{31},octaveFilterBank{32},octaveFilterBank{33});
%     set(plotter,'FrequencyScale','Log');
   
    switch Fc
        case '125'
        z = filtfilt(octaveFilterBank{1},Audio);
        case '160'
        z = filtfilt(octaveFilterBank{2},Audio);
        case '200'
        z = filtfilt(octaveFilterBank{3},Audio);
        case '315'
        z = filtfilt(octaveFilterBank{4},Audio);
        case '400'
        z = filtfilt(octaveFilterBank{5},Audio);
        case '500'
        z = filtfilt(octaveFilterBank{6},Audio);
        case '630'
        z = filtfilt(octaveFilterBank{7},Audio);
        case '800'
        z = filtfilt(octaveFilterBank{8},Audio);
        case '1000'
        z = filtfilt(octaveFilterBank{9},Audio);
        case '1250'
        z = filtfilt(octaveFilterBank{10},Audio);
        case '1600'
        z = filtfilt(octaveFilterBank{11},Audio);
        case '2250'
        z = filtfilt(octaveFilterBank{12},Audio);
        case '3150'
        z = filtfilt(octaveFilterBank{13},Audio);
        case '4000'
        z = filtfilt(octaveFilterBank{14},Audio);
        case '5000'
        z = filtfilt(octaveFilterBank{15},Audio);
        case '6000'
        z = filtfilt(octaveFilterBank{16},Audio);
        case '8000'
        z = filtfilt(octaveFilterBank{17},Audio);
        
    end
end