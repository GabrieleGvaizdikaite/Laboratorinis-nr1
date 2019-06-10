% intervalo dalijimo pusiau metodo funkcija
function [x_min_vid, f_min, nauja_pradzia, nauja_pabaiga, iteracija, naujas_ilgis, x, x_reiksme] = metod(pradzia, pabaiga)
    iteracija = 1; %pirmoji iteracija skaiciavimui
    x_vid = (pradzia + pabaiga)/2; %skaiciuojamo intervalo vidurio ta�kas
    fx_vid = tikslo_funkcija(x_vid); %esamo matematinio modelio reik�me intervalo vidurio ta�ke
    x_min_vid = x_vid; %esamas minimalus intervalo vidurio ta�kas
    fx_vid_1 = fx_vid; %nauja funkcijos reik�me
    fx_vid_2 = fx_vid; %nauja funkcijos reik�me  
    x(iteracija) = x_vid;  %i�sisaugome vidurio ta�ke intervale
    x_reiksme(iteracija) = fx_vid_1; %i�saugoma f-jos reik�me x_vid ta�ke 
    nauja_pradzia = pradzia; %nauja intervalo prad�ia
    nauja_pabaiga = pabaiga; %nauja intervalo pabaiga
    ilgis = pabaiga - pradzia; %turimas intervalo ilgis
    naujas_ilgis = ilgis; %i�saugomas intervalo ilgis
 
    %ciklas vyks tol, kol fx_vid_2 >= fx_vid_1
    while fx_vid_2 >= fx_vid_1
    iteracija = iteracija + 1; 
        x1 = pradzia + ilgis/4; %naujai prad�iai nustatyti pridedame ketvirti intervalo ilgio 
        x2 = pabaiga - ilgis/4; %nauja intervalo pabaiga
        fx1 = tikslo_funkcija(x1); %funkcijos reik�me naujoje intervalo prad�ioje
        fx2 = tikslo_funkcija(x2); %funkcijos reik�me naujoje intervalo pabaigoje
        
%jeigu funkcijos reik�me naujoje intervalo prad�ioje yra ma�esne u� matematinio modelio reik�me buvusiame vidurio ta�ke, tuomet
        if(fx1 < fx_vid)
            pabaiga = x_vid; %intervalo pabaiga yra buves vidurio ta�kas
            x_vid = x1; %buves vidurio ta�kas tampa nauja intervalo prad�ia
        else 
%kitu atveju, jei funkcijos reik�me naujoje intervalo pabaigoje yra ma�esne u� matematinio modelio reik�me buvusiame vidurio ta�ke, tuomet
            if(fx2 < fx_vid)                
                pradzia = x_vid; %intervalo prad�ia yra buves vidurio ta�kas
                x_vid = x2; %buves vidurio ta�kas tampa nauja intervalo pabaiga
            else %kitu atveju
                pradzia = x1; %intervalo prad�ia pasistumia ketvirtadaliu viso intervalo ilgio
                pabaiga = x2; %intervalo pabaiga atsitraukia ketvirtadaliu viso intervalo ilgio
            end
        end
        
        fx_vid_1 = tikslo_funkcija(x_vid);  %matematinio modelio reik�me naujame vidurio ta�ke
        x(iteracija) = x_vid;  %i�sisaugome ta�ke
        x_reiksme(iteracija) = fx_vid_1; %i�saugome reik�me
        ilgis = pabaiga - pradzia;  %i�saugomas naujas intervalo ilgis
        if(fx_vid_2 > fx_vid_1) %jeigu tenkina �ia salyga tuomet yra perra�omos reik�mes
            naujas_ilgis = ilgis; 
            nauja_pradzia = pradzia;
            nauja_pabaiga = pabaiga;
            x_min_vid = x_vid;     
            fx_vid_2 = fx_vid_1;       
        end
    end
 
    f_min = fx_vid_2; %rasta matematinio modelio minimali reik�me
end


