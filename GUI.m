function GUI
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f = figure('Visible','off','Position',[1000 1000 500 250]);

    pan_1 = uipanel(f,'Title','',... 
        'Position',[.05 .05 .9 .9]);
    text_1_1 = uicontrol(f,'Style','text',...                 
        'String','Menu Principal', ...
        'FontSize',(12),	...                 
        'Position',[100 190 300 50]);
%     medicionRF = uicontrol('Style', 'pushbutton',...
       % 'String','Medir ruido de fondo (RF)','Position',[175 250 150 50],...
        %'Callback',{@ruido_fondo_Callback});    
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
    
     f.Units = 'normalized';
    text_1_1.Units = 'normalized';
    text_1_2.Units = 'normalized';
    text3.Units = 'normalized';
    
    ha.Units = 'normalized';
    RI = 0;
      f.Name = 'Menu Principal';
    movegui(f,'center')
    f.MenuBar = 'none';
    f.NumberTitle = 'off';
    f.Visible = 'on';

    %%
%     function ruido_fondo_Callback(source,eventdata)
%         g = figure('Visible','off','Position',[500 500 200 100]);
%         text_2_1 = uicontrol(g,'Style','text',...                 
%         'String','Ruido de Fondo Obtenido',...
%          'FontSize',(10),	...    
%         'Position',[25 40 150 50]);
%        
%         panel_2 = uipanel(g,'Title','',... 
%         'Position',[.1 .29 .80 .30]);
%        
%         text_2_2 = uicontrol(g,'Style','text',...
%             'String','respuesta de la medicion',...          
%             'Position',[25 25 150 50]); 
%       
%     
%         g.Units = 'normalized';
%         text_2_1.Units = 'normalized';
%         text_2_1.Units = 'normalized';
%         htext.Units = 'normalized';
%         hpopup.Units = 'normalized';
%         ha.Units = 'normalized';
%     
%         g.Name = 'Medicion Ruido de Fondo';
%         movegui(g,'center')
%         g.MenuBar = 'none';
%         g.NumberTitle = 'off';
%         g.Visible = 'on';  
%      end
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
        'String',{'Filtro de Octava','Filtro de Tercio de Octava'},'Position',[125 330 100 25],...
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
    x = cell(7,1);
    a = 1;
      function popup_Callback(source,eventdata)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'Filtro de Octava'
              bandas == 'oct'
              set(hpopup_1_2,'visible','on')
              set(hpopup_1_3,'visible','off')
            case 'Filtro de Tercio de Octava'
                bandas == 'tercio'
                set(hpopup_1_3,'visible','on')
                set(hpopup_1_2,'visible','off')
        end
       end
     
      function popup1_Callback(source,eventdata)
             str = source.String;
             val = source.Value;
                switch str{val}
                    case '125'
                       a=1;
                    case'250'
                        a=2;
                    case'500'
                        a=3;
                    case'1000'
                        a=4;
                    case'2000'
                        a=5;
                    case'4000'
                        a=6;
                    case'8000'
                        a=7;
                
                end
                
      end
      function popup2_Callback (source,eventdata)
           str = source.String;
           val = source.Value;
                switch str{val}
                    case'125'
                        a=1;
                    case'160'
                        a=2;
                    case'200'
                        a=3;
                    case'250'
                        a=4;
                    case'315'
                        a=5;
                    case'400'
                        a=6;
                    case'500'
                        a=7;
                    case'630'
                        a=8;
                    case'800'
                        a=9;
                    case'1000'
                        a=10;
                    case'1250'
                        a=11;
                    case'1600'
                        a=12;
                    case'2250'
                        a=13;
                    case'3150'
                        a=14;
                    case'4000'
                        a=15;
                    case'5000'
                        a=16;
                    case'6000'
                        a=17;
                    case'8000'
                        a=18;
                end
        end
      function sintetizar_Callback(source,eventdata)
        axes(ax_2);
            T= str2num(get(edit_1,'String'));
            x = Sint_RI(T,bandas);
            plot(x{a,1});

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
        'String',{'Cargar RI (.wav)','Generar RI (SS y FI existentes)','Generar SS, FI y RI'},'Position',[75 360 100 25],...
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
       gurdar_tabla = uicontrol('Style', 'pushbutton',...
        'String','Guardar Tabla','Position',[50 30 150 50],...
        'Callback',{@guardar_tabla_Callback});
       
       text_4_1 = uicontrol(i,'Style','text','String','Calcular T60 a partir de:','Position',[75 420 100 25]);
       text_4_2 = uicontrol(i,'Style','text','String','Banda a Plotear','Position',[75 350 100 25]);
       text_4_3 = uicontrol(i,'Style','text','String','Datos del espectro completo:','Position',[75 250 100 25]);
       
    
       text_4_4 = uicontrol(i,'Style','text','String','Respuesta al Impulso','FontSize',(7),'Position',[550 525 100 10]);
       ax3_1 = axes('Parent',i,'Position',[.25 .80 .7 .15]);
       
       text_4_5 = uicontrol(i,'Style','text','String','Respuesta al Impulso con filtro con octava/tercio de octava','FontSize',(7),'Position',[400 390 400 10]);
       ax3_2 = axes('Parent',i,'Position',[.25 .55 .7 .15]);
       
       text_4_6 = uicontrol(i,'Style','text','String','Recorte de la respuesta al impulso en zona de interes','FontSize',(7),'Position',[400 250 400 10]);
       ax3_3 = axes('Parent',i,'Position',[.25 .30 .7 .15]);
       
       text_4_7 = uicontrol(i,'Style','text','String','Suavizados','FontSize',(7),'Position',[550 115 70 10]);
       ax3_4 = axes('Parent',i,'Position',[.25 .05 .7 .15]);
       
        hpopup = uicontrol('Style', 'popupmenu',...
        'String',{'Filtro de Octava','Filtro de Tercio de Octava'},'Position',[75 300 100 25],...
        'Callback',{@popup_Callback});
    
        hpopup1 = uicontrol('Visible','off','Style', 'popupmenu',...
            'String',{'125','250','500','1000','2000','4000','8000'},'Position',[75 300 100 25],...
            'Callback',{@popup1_Callback});
       
        hpopup2 = uicontrol('Visible','off','Style', 'popupmenu',...
            'String',{'125','160','200','250','315','400','500','630','800','1000','1250','1600','2250','3150','4000','5000','6000','8000'},'Position',[75 300 100 25],...
            'Callback',{@popup2_Callback});
       
        hpopup3 = uicontrol('Visible','on','Style', 'popupmenu',...
            'String',{'T10','T20','T30'},'Position',[75 390 100 25],...
            'Callback',{@popup3_Callback});
        
       
       ter = zeros(18,6);
       oct = zeros(7,6);
       tb_ter = uitable(i,'Data',ter,'Position',[15 90 200 150],'ColumnName',{'EDT';'T10';'T20';'T30';'C80';'D50'},'RowName',{'125';'160';'200';'250';'315';'400';'500';'630';'800';'1000';'1250';'1600';'2250';'3150';'4000';'5000';'6000';'8000'});
       tb_oct = uitable(i,'Data',oct,'Position',[15 90 200 150],'ColumnName',{'EDT';'T10';'T20';'T30';'C80';'D50'},'RowName',{'125';'250';'500';'1000';'2000';'4000';'8000'});
     
    
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
    
 ter = zeros(18,6);
 oct = zeros(7,6);
 T = 0;  
      function popup3_Callback(source,eventdata)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'T10'
               T='T10'
           case 'T20'
               T='T20'
           case 'T30'
               T='T30'
        end
        end
type_filter_oct = cell(7,1);
X_max = zeros(7,1);
second_part_oct = cell(7,1);
cut_signal_oct = cell(7,1);
H_oct = cell(7,1);
Deci_B_oct= cell(7,1);
schroeder_oct = cell(7,1);
fc_oct = [125,500,1000,2000,4000,8000];
for i=1:6
filter = filt();
type_filter_oct{i} = filter.Octava(RI,int2str(fc_oct(i))); % Filtrado de la señal
X_max(i) = find(type_filter_oct{i}==max(type_filter_oct{i})); %Busco el maximo de la señal (RI)
second_part_oct{i} = [X_max(i):X_max(i)+8.3*10^4]; %selecciono la seccion desde el maximo hasta el maximo + cierta distancia aprox a ojo.
cut_signal_oct{i} = type_filter_oct{i}(second_part_oct{i}); %cut_signal es la parte de la señal mencionada anteriormente (el decaimiento de la señal)
H_oct{i} = Hilbert(cut_signal_oct{i}); 
Deci_B_oct{i} = ConvLog (H_oct{i});
schroeder_oct{i} = IntSch(cut_signal_oct{i},Deci_B_oct{i});
[oct(i,:)] = Acustic_parameters(H_oct{i},type_filter_oct{i},T);
end


type_filter_ter = cell(18,1);
X_max = zeros(18,1);
second_part_ter = cell(18,1);
cut_signal_ter = cell(18,1);
H_ter = cell(18,1);
Deci_B_ter = cell(18,1);
schroeder_ter = cell(18,1);
fc_ter = [125,160,200,315,400,500,630,800,1000,1250,1600,2250,3150,4000,5000,6000,8000];
for i=1:17
filter = filt();
type_filter_ter{i} = filter.Tercio(RI,int2str(fc_ter(i))); % Filtrado de la señal
X_max(i) = find(type_filter_ter{i}==max(type_filter_ter{i})); %Busco el maximo de la señal (RI)
second_part_ter{i} = [X_max(i):X_max(i)+8.3*10^4]; %selecciono la seccion desde el maximo hasta el maximo + cierta distancia aprox a ojo.
cut_signal_ter{i} = type_filter_ter{i}(second_part_ter{i}); %cut_signal es la parte de la señal mencionada anteriormente (el decaimiento de la señal)
H_ter{i} = Hilbert(cut_signal_ter{i}); 
Deci_B_ter{i} = ConvLog (H_ter{i});
schroeder_ter{i} = IntSch(cut_signal_ter{i},Deci_B_ter{i});

[ter(i,:)] = Acustic_parameters(H_ter{i},type_filter_ter{i},T);
end


   
tb_ter = uitable(i,'Data',ter,'Position',[15 90 200 150],'ColumnName',{'EDT';'T10';'T20';'T30';'C80';'D50'},'RowName',{'125';'160';'200';'250';'315';'400';'500';'630';'800';'1000';'1250';'1600';'2250';'3150';'4000';'5000';'6000';'8000'});
tb_oct = uitable(i,'Data',oct,'Position',[15 90 200 150],'ColumnName',{'EDT';'T10';'T20';'T30';'C80';'D50'},'RowName',{'125';'250';'500';'1000';'2000';'4000';'8000'});
     



Vis_1=0;
Vis_2=0;
a_oct=0;
a_ter=0;

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






