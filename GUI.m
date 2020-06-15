function GUI
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
i = figure('Visible','off','Position',[1000 1000 500 300]);

    p = uipanel(i,'Title','',... 
        'Position',[.05 .05 .9 .9]);
    t = uicontrol(i,'Style','text',...                 
        'String','Menu Principal', ...
        'FontSize',(12),	...                 
        'Position',[100 275 300 50]);
    medicionRF = uicontrol('Style', 'pushbutton',...
        'String','Medir ruido de fondo (RF)','Position',[175 250 150 50],...
        'Callback',{@ruido_fondo_Callback});    
    t = uicontrol(i,'Style','text',...                 
        'String','Adquisicion de Datos',...
         'FontSize',(10),	...    
        'Position',[100 160 300 50]);
    archivosexternos = uicontrol('Style', 'pushbutton',...
        'String','Sintetizar RI','Position',[50 125 150 50],...
        'Callback',{@Sint_RI_Callback});
    grabaryreproducir = uicontrol('Style', 'pushbutton',...
        'String','Generar o Importar RI','Position',[300 125 150 50],...
        'Callback',{@Gen_Imp_Callback});
    
    Procesamiento = uicontrol('Style', 'pushbutton',...
        'String','Procesamiento','Position',[175 30 150 50],...
        'Callback',{@procesamiento_Callback});
    
     i.Units = 'normalized';
    text1.Units = 'normalized';
    text2.Units = 'normalized';
    text3.Units = 'normalized';
    htext.Units = 'normalized';
    hpopup.Units = 'normalized';
    ha.Units = 'normalized';
    RI = 0;
      i.Name = 'Menu Principal';
    movegui(i,'center')
    i.MenuBar = 'none';
    i.NumberTitle = 'off';
    i.Visible = 'on';
    
    %%
    function ruido_fondo_Callback(source,eventdata)
        g = figure('Visible','off','Position',[500 500 200 100]);
        tg = uicontrol(g,'Style','text',...                 
        'String','Ruido de Fondo Obtenido',...
         'FontSize',(10),	...    
        'Position',[25 75 150 50]);
       
        p = uipanel(g,'Title','',... 
        'Position',[.1 .29 .80 .30]);
       
        t = uicontrol(g,'Style','text',...
            'String','respuesta de la medicion',...          
            'Position',[25 25 150 50]); 
      
    
        g.Units = 'normalized';
        text1.Units = 'normalized';
        text2.Units = 'normalized';
        text3.Units = 'normalized';
        htext.Units = 'normalized';
        hpopup.Units = 'normalized';
        ha.Units = 'normalized';
    
        g.Name = 'Medicion Ruido de Fondo';
        movegui(g,'center')
        g.MenuBar = 'none';
        g.NumberTitle = 'off';
        g.Visible = 'on';  
     end
 %%
    function Sint_RI_Callback(source,eventdata)
        g = figure('Visible','off','Position',[1000 1000 250 500]);
         
        p1 = uipanel(g,'Title','Impulso Sintetizado',... 
        'Position',[.05 .05 .9 .95],...
        'TitlePosition','centertop');
    
    
    t = uicontrol(g,'Style','text',...                 
        'String','Ingrese duracion RI:', ...
        'FontSize',(8),	...                 
        'Position',[25 475 100 25]);
    text2= uicontrol(g,'Style','edit',...                 
        'String','',... 
        'Max',1,'Min',0,...                 
        'Position',[125 440 100 25]);
    
     t = uicontrol(g,'Style','text',...                 
        'String','Ingrese Tipo de Filtro', ...
        'FontSize',(8),	...                 
        'Position',[25 355 100 30]);
    hpopup = uicontrol('Style', 'popupmenu',...
        'String',{'Filtro de Octava','Filtro de Tercio de Octava'},'Position',[125 330 100 25],...
        'Callback',{@popup_Callback});
    sintetizar = uicontrol('Style', 'pushbutton',...
        'String','Sintetizar','Position',[75 300 100 40],...
        'Callback',{@sintetizar_Callback});
    
    hpopup1 = uicontrol('Visible','off','Style', 'popupmenu',...
        'String',{'125','250','500','1000','2000','4000','8000'},'Position',[75 250 100 25],...
        'Callback',{@popup1_Callback});
     
    hpopup2 = uicontrol('Visible','off','Style', 'popupmenu',...
        'String',{'125','160','200','250','315','400','500','630','800','1000','1250','1600','2250','3150','4000','5000','6000','8000'},'Position',[75 250 100 25],...
        'Callback',{@popup2_Callback});
    ax2 = axes('Parent',p1,'Position',[.05 .1 .9 .3]);
    
    
    
    g.Units = 'normalized';
   
    text2.Units = 'normalized';
    
    hpopup.Units = 'normalized';
    ha.Units = 'normalized';
    RI = 0;
      g.Name = 'Sintetizar RI';
    movegui(g,'center')
    g.MenuBar = 'none';
    g.NumberTitle = 'off';
    g.Visible = 'on';
    
   
    T = 0;
    bandas = 0;
    x = cell(1,7);
    a = 1;
      function popup_Callback(source,eventdata)
        str = source.String;
        val = source.Value;
        switch str{val}
           case 'Filtro de Octava'
              bandas == 'oct'
              set(hpopup1,'visible','on')
              set(hpopup2,'visible','off')
            case 'Filtro de Tercio de Octava'
                bandas == 'tercio'
                set(hpopup2,'visible','on')
                set(hpopup1,'visible','off')
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
        
            T= str2num(get(text2,'String'));
            x = Sint_RI(T,44100,bandas);
            plot(x{a});
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
          
         plot(RI);
        end
    end
%%
    function procesamiento_Callback(source,eventdata)
       i = figure('Visible','off','Position',[200 200 1000 500]);
       procesar = uicontrol('Style', 'pushbutton',...
        'String','Procesar','Position',[50 400 150 50],...
        'Callback',{@proc_Callback});
       gurdar_tabla = uicontrol('Style', 'pushbutton',...
        'String','Guardar Tabla','Position',[50 50 150 50],...
        'Callback',{@guardar_tabla_Callback});
       
    
    
    
    
    
    
    i.Units = 'normalized';
    text1.Units = 'normalized';
    text2.Units = 'normalized';
    text3.Units = 'normalized';
    htext.Units = 'normalized';
    hpopup.Units = 'normalized';
    ha.Units = 'normalized';
    RI = 0;
      i.Name = 'Menu Principal';
    movegui(i,'center')
    i.MenuBar = 'none';
    i.NumberTitle = 'off';
    i.Visible = 'on';
    end
end
