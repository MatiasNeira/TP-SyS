function GUI
%                     ...

% GUI ::  Función sin elementos de entrada, para ponerla en ejecucion se
% podrá llamar desde la Command Window o Correrla (Run).
%
% Interfaz grafica que articula todas las funciones trabajadas para obtener los
% parametros acusticos de un recinto. 
%
% Una vez ejecutada la función, seleccionar el pushbutton "Manual" para
% conocer las instrucciones y pasos a seguir.

%                    ...

f = figure('Visible','off','Position',[1000 1000 500 250]);

    pan_1 = uipanel(f,'Title','',... 
        'Position',[.05 .05 .9 .9]);
    text_1_1 = uicontrol(f,'Style','text',...                 
        'String','Menú Principal', ...
        'FontSize',(12),	...                 
        'Position',[100 190 300 50]);  
    text_1_2 = uicontrol(f,'Style','text',...                 
        'String','Adquisicion de Datos',...
         'FontSize',(10),	...    
        'Position',[100 140 300 50]);
  
    Sinte_RI = uicontrol('Style', 'pushbutton',...
        'String','Sintetizar RI','Position',[50 125 150 50],...
        'Callback',{@Sint_RI_Callback});
    Gen_RI = uicontrol('Style', 'pushbutton',...
        'String','Generar o Importar RI','Position',[300 125 150 50],...
        'Callback',{@Gen_Imp_Callback});
    
    Procesamiento = uicontrol('Style', 'pushbutton',...
        'String','Procesamiento','Position',[175 30 150 50],...
        'Callback',{@procesamiento_Callback});
    
    Grabar = uicontrol('Style', 'pushbutton',...
        'String','Play - Rec','Position',[175 200 150 50],...
        'Callback',{@grabar_Callback});
    
    Guia = uicontrol('Style', 'pushbutton',...
        'String','Manual','Position',[420 25 50 25],...
        'Callback',{@Guia_Callback});
    
     f.Units = 'normalized';
    text_1_1.Units = 'normalized';
    text_1_2.Units = 'normalized';
    text3.Units = 'normalized';
    
    ha.Units = 'normalized';
    RI = 0;
      f.Name = 'Menú Principal';
    movegui(f,'center')
    f.MenuBar = 'none';
    f.NumberTitle = 'off';
    f.Visible = 'on';

    
    %%
    function Guia_Callback(source,eventdata)
        
            hGui = figure('Visible','off','Position',[1000 1000 500 500]);
        
       
    p2Gui = uipanel(hGui,'Title','Manual de usuario',... 
        'Position',[.05 .05 .9 .95],...
        'TitlePosition','centertop');
    
    tGui = uicontrol(hGui,'Style','text',...                 
        'String','  Respuesta al Impulso (RI)', ...                
        'Position',[55 450 400 50]);
    
     tGui1 = uicontrol(hGui,'Style','text',...                 
        'String','+ Como primer paso, usted, debe cargar una respuesta al impulso la cual una vez cargada, quedará registrada en el programa para asi luego procesarla. Para ello tiene la posibilidad de sintetizarlo a traves del pushbutton "Sintetizar RI", de otra manera existe la forma de cargar archivos de audio .wav a traves de "Generar o Importar RI", elgiendo si directamente carga la RI o realiza la convolucion entre dos audios para obtenerla. ', ...                
        'Position',[45 390 400 85]);
     tGui2 = uicontrol(hGui,'Style','text',...                 
        'String','Play - Rec ', ...                
        'Position',[55 280 400 85]);
    tGui3 = uicontrol(hGui,'Style','text',...                 
        'String','+ En el caso que exista la posibilidad de realizar la grabacion del recinto a medir, el programa cuenta con la posibilidad de reproducir un Sine-Sweep (Barrido Senoidal) y grabar su respuesta, guardando ambas tomas en archivos .wav para luego utilizarlas en el pushbutton "Generar o Importar RI" mencionado anteriormente. Tambien cuenta con la posibilidad de realizar la misma acción con Ruido Rosa para realizar ciertas mediciones o un Filtro inverso correspondiente al Sine-Sweep mencionado con anterioridad, para poder realizar la convolucion. ', ...                
        'Position',[45 230 400 110]);
     tGui4 = uicontrol(hGui,'Style','text',...                 
        'String','Procesamiento ', ...                
        'Position',[55 115 400 85]);
    tGui5 = uicontrol(hGui,'Style','text',...                 
        'String','+ Una vez cargada la respuesta al impulso, se debe proceder a clickear "Procesamiento", donde encontrará una serie de graficos con las distintas etapas de proceso de la RI y una tabla, la cual debe ser actualizada, que le indicara todos los parametros acusticos del recinto a estudiar. Para poder visualizar los graficos, debe seleccionar que tipo de filtro desea aplicarle a la señal y su frecuencia central (Fc), una vez hecho esto proceda a seleccionar el pushbutton "Procesar" donde se le actualizaran los graficos correspondientes a los datos seleccionados. ', ...                
        'Position',[45 55 400 120]);
  
        hGui.Units = 'normalized';
    text1.Units = 'normalized';
    text2.Units = 'normalized';
    text3.Units = 'normalized';
    htext.Units = 'normalized';
    hpopup.Units = 'normalized';    
    ha.Units = 'normalized';
    
      hGui.Name = 'Manual';
    movegui(hGui,'center')
    hGui.MenuBar = 'none';
    hGui.NumberTitle = 'off';
    hGui.Visible = 'on'; 
    
    end
    
    %%
    function grabar_Callback(source,eventdata)
       j = figure('Visible','off','Position',[1000 1000 200 150]);
       
       
       text_4_1 = uicontrol(j,'Style','text',...                 
        'String','¿Que desea grabar?', ...
        'FontSize',(8),	...                 
        'Position',[50 160 100 30]);
    hpopup_4_1 = uicontrol('Style', 'popupmenu',...
        'String',{'Grabar SS','Grabar FI','Grabar RR'},'Position',[50 135 100 25],...
        'Callback',{@popup41_Callback});
    
        t = uicontrol(j,'Style','text',...  
        'String','Frecuencia Final', ...               
        'Position',[135 100 50 30], ...
        'FontSize',(7));
    text1= uicontrol(j,'Style','edit',...                 
        'String','',... 
        'Max',1,'Min',0,...                 
        'Position',[135 70 50 30]);
    
    t = uicontrol(j,'Style','text',...                 
        'String','Duracion (s)', ...               
        'Position',[77 100 50 30], ...
        'FontSize',(7));
    text2 = uicontrol(j,'Style','edit',...                 
        'String','',...                 
        'Max',1,'Min',0,...                 
        'Position',[77 70 50 30]);
    
    t = uicontrol(j,'Style','text',...                 
        'String','Frecuancia Inicial', ...                
        'Position',[20 100 50 30], ...
        'FontSize',(7));
     text3 = uicontrol(j,'Style','edit',...                 
         'String','',...                 
         'Max',1,'Min',0,...                 
         'Position',[20 70 50 30]);
     
    grab = uicontrol('Style', 'pushbutton',...
        'String','Grabar','Position',[50 20 100 50],...
        'Callback',{@grab_Callback});
  
    
        t = uicontrol(j,'Style','text',...  
        'String','Frecuencia Inicial', ...               
        'Position',[40 300 50 30], ...
        'FontSize',(7));
    text1= uicontrol(j,'Style','edit',...                 
        'String','',... 
        'Max',1,'Min',0,...                 
        'Position',[40 250 50 30]);
    
    t = uicontrol(j,'Style','text',...                 
        'String','Duracion (s)', ...               
        'Position',[100 300 50 30], ...
        'FontSize',(7));
    text2 = uicontrol(j,'Style','edit',...                 
        'String','',...                 
        'Max',1,'Min',0,...                 
        'Position',[100 250 50 30]);
    
    t = uicontrol(j,'Style','text',...                 
        'String','Frecuancia Final', ...                
        'Position',[160 300 50 30], ...
        'FontSize',(7));
     text3 = uicontrol(j,'Style','edit',...                 
         'String','',...                 
         'Max',1,'Min',0,...                 
         'Position',[160 250 50 30]);
    
        j.Units = 'normalized';
    text1.Units = 'normalized';
    text2.Units = 'normalized';
    text3.Units = 'normalized';
    
    ha.Units = 'normalized';
    
      j.Name = 'Grabar';
    movegui(j,'center')
    j.MenuBar = 'none';
    j.NumberTitle = 'off';
    j.Visible = 'on';
    GR=0;
    gr=0;
   
    T= str2num(get(text2,'String'));
    F0= str2num(get(text1,'String'));
    Ff= str2num(get(text3,'String'));
    function popup41_Callback(source,eventdata)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'Grabar SS'
               gr=1;
               
           case 'Grabar FI'
               gr=2;
               
           case 'Grabar RI'
               gr=3;
               
        end
    end
    function grab_Callback(source,eventdata)
        GR = Play_Rec();
        if gr==1
            GR.SineSweep(T,F0,Ff);
        elseif gr==2
          GR.InverseFilter(T,F0,Ff);
        elseif gr==3
            GR.RuidoRosa(T);
        end
    end
    end
 %%
    function Sint_RI_Callback(source,eventdata)
        g = figure('Visible','off','Position',[1000 1000 250 500]);
         
        panel_3 = uipanel(g,'Title','Impulso Sintetizado',... 
        'Position',[.05 .05 .9 .95],...
        'TitlePosition','centertop');
    
    
    text_3_1 = uicontrol(g,'Style','text',...                 
        'String','Ingrese duracion RI:', ...
        'FontSize',(8),	...                 
        'Position',[25 395 100 25]);
    edit_1= uicontrol(g,'Style','edit',...                 
        'String','',... 
        'Max',1,'Min',0,...                 
        'Position',[125 440 100 25]);
    
     text_3_2 = uicontrol(g,'Style','text',...                 
        'String','Ingrese Tipo de Filtro', ...
        'FontSize',(8),	...                 
        'Position',[25 325 100 30]);
    hpopup_1_1 = uicontrol('Style', 'popupmenu',...
        'String',{'','Filtro de Octava','Filtro de Tercio de Octava'},'Position',[125 330 100 25],...
        'Callback',{@popup_Callback});
    sint = uicontrol('Style', 'pushbutton',...
        'String','Sintetizar','Position',[75 300 100 40],...
        'Callback',{@sintetizar_Callback});
    
    hpopup_1_2 = uicontrol('Visible','off','Style', 'popupmenu',...
        'String',{'125','250','500','1000','2000','4000','8000'},'Position',[75 240 100 25],...
        'Callback',{@popup1_Callback});
     
    hpopup_1_3 = uicontrol('Visible','off','Style', 'popupmenu',...
        'String',{'125','160','200','250','315','400','500','630','800','1000','1250','1600','2250','3150','4000','5000','6000','8000'},'Position',[75 240 100 25],...
        'Callback',{@popup2_Callback});
    ax_2 = axes('Parent',panel_3,'Position',[.05 .1 .9 .3]);
    
    
    
    g.Units = 'normalized';
   
    text_3_1.Units = 'normalized';
    text_3_2.Units = 'normalized';
    text_3_3.Units = 'normalized';
    
    hpopup_1_1 .Units = 'normalized';
    hpopup_1_2 .Units = 'normalized';
    hpopup_1_3 .Units = 'normalized';
    ha.Units = 'normalized';
    
   
    g.Name = 'Sintetizar RI';
    movegui(g,'center')
    g.MenuBar = 'none';
    g.NumberTitle = 'off';
    g.Visible = 'on';
    
   
    T = 1;
    bandas = 0;
   a=0;
    ter = 1;
    oct = 1;  
  
      function popup_Callback(source,eventdata)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'Filtro de Octava'
              bandas == 'oct'
              ter=0;
              a=1;
            g = Sint_RI(T,'oct');
              set(hpopup_1_2,'visible','on')
              set(hpopup_1_3,'visible','off')
            case 'Filtro de Tercio de Octava'
                bandas == 'ter'
                oct=0;
                a=2;
                g = Sint_RI(T,'ter');
                set(hpopup_1_3,'visible','on')
                set(hpopup_1_2,'visible','off')
        end
       end
     
      function popup1_Callback(source,eventdata)
             str = source.String;
             val = source.Value;
                switch str{val}
                    case '125'
                       oct=1;
                    case'250'
                        oct=2;
                    case'500'
                        oct=3;
                    case'1000'
                        oct=4;
                    case'2000'
                        oct=5;
                    case'4000'
                        oct=6;
                    case'8000'
                        oct=7;
                
                end
                
      end
      function popup2_Callback (source,eventdata)
           str = source.String;
           val = source.Value;
         
                switch str{val}
                    case'125'
                        ter=1;
                    case'160'
                        ter=2;
                    case'200'
                        ter=3;
                    case'250'
                        ter=4;
                    case'315'
                        ter=5;
                    case'400'
                        ter=6;
                    case'500'
                        ter=7;
                    case'630'
                        ter=8;
                    case'800'
                        ter=9;
                    case'1000'
                        ter=10;
                    case'1250'
                        ter=11;
                    case'1600'
                        ter=12;
                    case'2250'
                        ter=13;
                    case'3150'
                        ter=14;
                    case'4000'
                        ter=15;
                    case'5000'
                        ter=16;
                    case'6000'
                        ter=17;
                    case'8000'
                        ter=18;
                end
        end
      function sintetizar_Callback(source,eventdata)
            T= str2double(get(edit_1,'String'));
            g = Sint_RI(T,'oct');
           if a==1 
           plot(g{oct});
           RI=g{oct};
           elseif a==2
           plot(g{ter});
           RI=g{ter};
           end

      end
    end
%%
    function Gen_Imp_Callback(source,eventdata)
       
        h = figure('Visible','off','Position',[1000 1000 250 500]);
        
        
       
        p2 = uipanel(h,'Title','Adquisicion con Medicion',... 
        'Position',[.05 .05 .9 .95],...
        'TitlePosition','centertop');
    
    t = uicontrol(h,'Style','text',...                 
        'String','Seleccione su Medicion', ...                
        'Position',[75 450 100 50]);
    
   cargar = uicontrol('Style', 'pushbutton',...
        'String','Cargar','Position',[75 425 100 40],...
        'Callback',{@cargar_Callback});
    hpopup = uicontrol('Style', 'popupmenu',...
        'String',{'','Cargar RI (.wav)','Generar RI (SS y FI existentes)','Generar SS, FI y RI'},'Position',[75 360 100 25],...
        'Callback',{@popup_Callback});
    
    
    t = uicontrol(h,'Style','text',...  
        'String','Frecuencia Inicial', ...               
        'Position',[40 300 50 30], ...
        'FontSize',(7));
    text1= uicontrol(h,'Style','edit',...                 
        'String','',... 
        'Max',1,'Min',0,...                 
        'Position',[40 250 50 30]);
    
    t = uicontrol(h,'Style','text',...                 
        'String','Duracion (s)', ...               
        'Position',[100 300 50 30], ...
        'FontSize',(7));
    text2 = uicontrol(h,'Style','edit',...                 
        'String','',...                 
        'Max',1,'Min',0,...                 
        'Position',[100 250 50 30]);
    
    t = uicontrol(h,'Style','text',...                 
        'String','Frecuancia Final', ...                
        'Position',[160 300 50 30], ...
        'FontSize',(7));
     text3 = uicontrol(h,'Style','edit',...                 
         'String','',...                 
         'Max',1,'Min',0,...                 
         'Position',[160 250 50 30]);
     
     ax1 = axes('Parent',p2,'Position',[.05 .1 .9 .3]);
     
        h.Units = 'normalized';
    text1.Units = 'normalized';
    text2.Units = 'normalized';
    text3.Units = 'normalized';
    htext.Units = 'normalized';
    hpopup.Units = 'normalized';
    ha.Units = 'normalized';
    
      h.Name = 'Medicion RI';
    movegui(h,'center')
    h.MenuBar = 'none';
    h.NumberTitle = 'off';
    h.Visible = 'on'; 
    
        current_data= 0;
        T = 0;
        Ff = 0;
        F0 = 0;
  
        SS = 0;
        FI = 0;
     
        H = 0;
        G = 0;
        
    
      
       function popup_Callback(source,eventdata)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'Cargar RI (.wav)'
               current_data = 1;
           case 'Generar RI (SS y FI existentes)'
               current_data = 2;
            case 'Generar SS, FI y RI'
                current_data = 3;
        end
       end
        function cargar_Callback(source,eventdata)
            
            T= str2num(get(text2,'String'));
            F0= str2num(get(text1,'String'));
            Ff= str2num(get(text3,'String'));

          switch current_data
           case 1
              H = import_data();
              G = H.RespuestaImpulso();
              RI= G;
             
           case 2
               H = import_data();
               G = H.SS_FI();
               RI = conv(G{1},G{2});
           case 3
              SS = SineSweep(T,F0,Ff);
              FI = InverseFilter(T,F0,Ff);
              RI = conv(SS,FI);
          end
          
         plot(ax1,RI);
        end
   end
%%
    function procesamiento_Callback(source,eventdata)
   
          
       i = figure('Visible','off','Position',[200 200 1000 500]);
       procesar = uicontrol('Style', 'pushbutton',...
        'String','Procesar','Position',[50 450 150 50],...
        'Callback',{@proc_Callback});
       
       actualizar_tabla = uicontrol('Style', 'pushbutton',...
        'String','Actualizar Tabla','Position',[50 25 150 60],...
        'Callback',{@actualizar_tabla_Callback});
      
       text_4_2 = uicontrol(i,'Style','text','String','Banda a Plotear','Position',[75 350 100 25]);
       text_4_3 = uicontrol(i,'Style','text','String','Datos del espectro completo:','Position',[75 250 100 25]);
       
    
       text_4_4 = uicontrol(i,'Style','text','String','Respuesta al Impulso','FontSize',(7),'Position',[550 525 100 10]);
       ax3_1 = axes('Parent',i,'Position',[.25 .80 .7 .15]);
       
       text_4_5 = uicontrol(i,'Style','text','String','Respuesta al Impulso filtrada por octava/tercio de octava','FontSize',(7),'Position',[400 390 400 10]);
       ax3_2 = axes('Parent',i,'Position',[.25 .55 .7 .15]);
       
       text_4_6 = uicontrol(i,'Style','text','String','Recorte de la respuesta al impulso en zona de interes','FontSize',(7),'Position',[400 250 400 10]);
       ax3_3 = axes('Parent',i,'Position',[.25 .30 .7 .15]);
       
       text_4_7 = uicontrol(i,'Style','text','String','Suavizado de la señal y decaimiento de Schroeder','FontSize',(7),'Position',[400 115 400 10]);
       ax3_4 = axes('Parent',i,'Position',[.25 .05 .7 .15]);
        
%[550 115 70 10]
        hpopup = uicontrol('Style', 'popupmenu',...
        'String',{'','Filtro de Octava','Filtro de Tercio de Octava'},'Position',[75 300 100 25],...
        'Callback',{@popup_Callback});
    
        hpopup1 = uicontrol('Visible','off','Style', 'popupmenu',...
            'String',{'125','250','500','1000','2000','4000','8000'},'Position',[75 300 100 25],...
            'Callback',{@popup1_Callback});
       
        hpopup2 = uicontrol('Visible','off','Style', 'popupmenu',...
            'String',{'125','160','200','250','315','400','500','630','800','1000','1250','1600','2250','3150','4000','5000','6000','8000'},'Position',[75 300 100 25],...
            'Callback',{@popup2_Callback});
       
        
       
       ter = zeros(18,9);
       oct = zeros(7,9);
       tb_ter = uitable(i,'Data',ter,'Position',[15 90 200 150],'ColumnName',{'EDT';'T10';'T20';'T30';'T60(T10)';'T60(T20)';'T60(T30)';'C80';'D50'},'RowName',{'125';'160';'200';'250';'315';'400';'500';'630';'800';'1000';'1250';'1600';'2250';'3150';'4000';'5000';'6000';'8000'});
       tb_oct = uitable(i,'Data',oct,'Position',[15 90 200 150],'ColumnName',{'EDT';'T10';'T20';'T30';'T60(T10)';'T60(T20)';'T60(T30)';'C80';'D50'},'RowName',{'125';'250';'500';'1000';'2000';'4000';'8000'});
     
    
    i.Units = 'normalized';
%     text1.Units = 'normalized';
%     text2.Units = 'normalized';
%     text3.Units = 'normalized';
%     htext.Units = 'normalized';
    hpopup.Units = 'normalized';
    ha.Units = 'normalized';

    i.Name = 'Procesamiento';
    movegui(i,'center')
    i.MenuBar = 'none';
    i.NumberTitle = 'off';
    i.Visible = 'on';
    
   
     
    type_filter_oct = cell(7,1);
    X_max = zeros(7,1);
    second_part_oct = cell(7,1);
    cut_signal_oct = cell(7,1);
    H_oct = cell(7,1);
    Deci_B_oct= cell(7,1);
    schroeder_oct = cell(7,1);
    fc_oct = [125,500,1000,2000,4000,8000];
    M=zeros(9,6);
    
for i = 1:6
    filter = filt();
    type_filter_oct{i} = filter.Octava(RI,int2str(fc_oct(i))); % Filtrado de la señal
    
    X_max(i) = find(type_filter_oct{i}==max(type_filter_oct{i})); %Busco el maximo de la señal (RI)
    second_part_oct{i} = [X_max(i):X_max(i)+8.3*10^4]; %selecciono la seccion desde el maximo hasta el maximo + cierta distancia aprox a ojo.
    cut_signal_oct{i} = type_filter_oct{i}(second_part_oct{i}); %cut_signal es la parte de la señal mencionada anteriormente (el decaimiento de la señal)
    
    H_oct{i} = Hilbert(cut_signal_oct{i}); 
    Deci_B_oct{i} = ConvLog (H_oct{i});
    schroeder_oct{i} = IntSch(cut_signal_oct{i},Deci_B_oct{i});
    
    [M(1,i),M(2,i),M(3,i),M(4,i),M(5,i),M(6,i),M(7,i)] = Acustic_parameters(schroeder_oct{i},RI,'T10');
end


type_filter_ter = cell(18,1);
X_max = zeros(18,1);
second_part_ter = cell(18,1);
cut_signal_ter = cell(18,1);
H_ter = cell(18,1);
Deci_B_ter = cell(18,1);
schroeder_ter = cell(18,1);
fc_ter = [125,160,200,315,400,500,630,800,1000,1250,1600,2250,3150,4000,5000,6000,8000];
M_ter=zeros(9,17);

for i=1:17
filter = filt();
type_filter_ter{i} = filter.Tercio(RI,int2str(fc_ter(i))); % Filtrado de la señal
X_max(i) = find(type_filter_ter{i}==max(type_filter_ter{i})); %Busco el maximo de la señal (RI)
second_part_ter{i} = [X_max(i):X_max(i)+8.3*10^4]; %selecciono la seccion desde el maximo hasta el maximo + cierta distancia aprox a ojo.
cut_signal_ter{i} = type_filter_ter{i}(second_part_ter{i}); %cut_signal es la parte de la señal mencionada anteriormente (el decaimiento de la señal)
H_ter{i} = Hilbert(cut_signal_ter{i}); 
Deci_B_ter{i} = ConvLog (H_ter{i});
schroeder_ter{i} = IntSch(cut_signal_ter{i},Deci_B_ter{i});

[M_ter(1,i),M_ter(2,i),M_ter(3,i),M_ter(4,i),M_ter(5,i),M_ter(6,i),M_ter(7,i)] = Acustic_parameters(schroeder_ter{i},RI,'T10');
end

   
     
 


Vis_1=0;
Vis_2=0;
a_oct=0;
a_ter=0; 

 
     function actualizar_tabla_Callback(~,~)
       
           for i=1:5
               for j=1:17
                   tb_ter.Data(j,i)=M_ter(i,j);
                   tb_ter.Data(j,6)=M_ter(3,j)*3;
                   tb_ter.Data(j,7)=M_ter(4,j)*2;
                   tb_ter.Data(j,8)=M_ter(6,j);
                   tb_ter.Data(j,9)=M_ter(7,j);
               end
               for j=1:6
                   tb_oct.Data(j,i)=M(i,j);
                   tb_oct.Data(j,6)=M(3,j)*3;
                   tb_oct.Data(j,7)=M(4,j)*2;
                   tb_oct.Data(j,8)=M(6,j);
                   tb_oct.Data(j,9)=M(7,j);
               end
           end
          
         end
 
     function popup_Callback(source,~)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'Filtro de Octava'
                  set(tb_oct,'visible','on')
                  set(tb_ter,'visible','off')

                  set(hpopup1,'visible','on')
                  set(hpopup2,'visible','off')
                  
                  
                  Vis_1=1;
                  Vis_2=0;
            case 'Filtro de Tercio de Octava'
                  set(tb_oct,'visible','off')
                  set(tb_ter,'visible','on')
                
                  set(hpopup2,'visible','on')
                  set(hpopup1,'visible','off')
                  
                  
                  Vis_1=0;
                  Vis_2=1;
        end
        end
     function popup1_Callback(source,~)
             str = source.String;
             val = source.Value;
                switch str{val}
                    case '125'
                       a_oct=1;
                    case'250'
                        a_oct=2;
                    case'500'
                        a_oct=3;
                    case'1000'
                        a_oct=4;
                    case'2000'
                       a_oct=5;
                    case'4000'
                        a_oct=6;
                    case'8000'
                        a_oct=7;
                
                end
                
      end
     function popup2_Callback (source,~)
          str = source.String;
           val = source.Value;
                switch str{val}
                    case'125'
                       a_ter=1;
                    case'160'
                        a_ter=2;
                    case'200'
                        a_ter=3;
                    case'250'
                        a_ter=4;
                    case'315'
                        a_ter=5;
                    case'400'
                        a_ter=6;
                    case'500'
                        a_ter=7;
                    case'630'
                        a_ter=8;
                    case'800'
                       a_ter=9;
                    case'1000'
                        a_ter=10;
                    case'1250'
                        a_ter=11;
                    case'1600'
                       a_ter=12;
                    case'2250'
                        a_ter=13;
                    case'3150'
                        a_ter=14;
                    case'4000'
                        a_ter=15;
                    case'5000'
                        a_ter=16;
                    case'6000'
                        a_ter=17;
                    case'8000'
                        a_ter=18;
                end
     end
      
     function proc_Callback(~,~)
         
         
         if Vis_1 == 1 && Vis_2 == 0
            plot(ax3_1,RI)
            plot(ax3_2,type_filter_oct{a_oct})
            plot(ax3_3,cut_signal_oct{a_oct})
            plot(ax3_4,Deci_B_oct{a_oct})
            hold on
            plot(ax3_4,schroeder_oct{a_oct})
            hold off
            
        elseif  Vis_1 == 0 && Vis_2 == 1
            plot(ax3_1,RI)
            plot(ax3_2,type_filter_ter{a_ter})
            plot(ax3_3,cut_signal_ter{a_ter})
            plot(ax3_4,Deci_B_ter{a_ter})
            hold on
            plot(ax3_4,schroeder_ter{a_ter})
            hold off
         end
        
       
        
     end
    end
end










