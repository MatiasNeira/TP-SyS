

%% Carga de archivos
% carga de archivos mediante funcion handles
carga_archivo = import_data();

SsFi = carga_archivo.SS_FI(); % SsFi contiene los archivos cargados en un cell.

%% Convolucion -> Respuesta al impulso
Ri_conv = conv(SsFi{1},SsFi{2}); % convolucion entre los archivos cargados (Ej. SineSweep grabado vs. Filtro inverso sintetizado) --> devuelve una Respuesta al Impulso.

subplot(5,1,1);
plot(Ri_conv);

%% filtrado
% Filtrado de la señal, lo siguiente es el llamado de la funcion filt hdles
filter = filt();
type_filter = filter.Octava(Ri_conv); % Filtrado de la señal


subplot(5,1,2);
plot(type_filter) %plot de la señal ya filtrada

%% Recorte de la señal en la zona de interes

X_max = find(type_filter==max(type_filter)); %Busco el maximo de la señal (RI)

%end_signal = length(type_filter);

second_part = [X_max:X_max+8.3*10^4]; %selecciono la seccion desde el maximo hasta el maximo + cierta distancia aprox a ojo.

cut_signal = type_filter(second_part); %cut_signal es la parte de la señal mencionada anteriormente (el decaimiento de la señal)

subplot(5,1,3); 
plot(cut_signal)

%% Suavizado por Hilbert
H = Hilbert(cut_signal); 

% escala logaritmica al suavizado de Hilbert
Deci_B = ConvLog (H);

subplot(5,1,4);
plot(Deci_B);

%% Integral de Schroeder.

schroeder = IntSch(cut_signal,Deci_B);

subplot(5,1,5);

plot(schroeder);








