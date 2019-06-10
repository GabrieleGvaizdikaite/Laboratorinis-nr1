% intervalo dalijimo pusiau metodo funkcija
function [x_min_vid, f_min, nauja_pradzia, nauja_pabaiga, iteracija, naujas_ilgis, x, x_reiksme] = metod(pradzia, pabaiga)
    iteracija = 1; %pirmoji iteracija skaiciavimui
    x_vid = (pradzia + pabaiga)/2; %skaiciuojamo intervalo vidurio taškas
    fx_vid = tikslo_funkcija(x_vid); %esamo matematinio modelio reikšme intervalo vidurio taške
    x_min_vid = x_vid; %esamas minimalus intervalo vidurio taškas
    fx_vid_1 = fx_vid; %nauja funkcijos reikšme
    fx_vid_2 = fx_vid; %nauja funkcijos reikšme  
    x(iteracija) = x_vid;  %išsisaugome vidurio taške intervale
    x_reiksme(iteracija) = fx_vid_1; %išsaugoma f-jos reikšme x_vid taške 
    nauja_pradzia = pradzia; %nauja intervalo pradžia
    nauja_pabaiga = pabaiga; %nauja intervalo pabaiga
    ilgis = pabaiga - pradzia; %turimas intervalo ilgis
    naujas_ilgis = ilgis; %išsaugomas intervalo ilgis
 
    %ciklas vyks tol, kol fx_vid_2 >= fx_vid_1
    while fx_vid_2 >= fx_vid_1
    iteracija = iteracija + 1; 
        x1 = pradzia + ilgis/4; %naujai pradžiai nustatyti pridedame ketvirti intervalo ilgio 
        x2 = pabaiga - ilgis/4; %nauja intervalo pabaiga
        fx1 = tikslo_funkcija(x1); %funkcijos reikšme naujoje intervalo pradžioje
        fx2 = tikslo_funkcija(x2); %funkcijos reikšme naujoje intervalo pabaigoje
        
%jeigu funkcijos reikšme naujoje intervalo pradžioje yra mažesne už matematinio modelio reikšme buvusiame vidurio taške, tuomet
        if(fx1 < fx_vid)
            pabaiga = x_vid; %intervalo pabaiga yra buves vidurio taškas
            x_vid = x1; %buves vidurio taškas tampa nauja intervalo pradžia
        else 
%kitu atveju, jei funkcijos reikšme naujoje intervalo pabaigoje yra mažesne už matematinio modelio reikšme buvusiame vidurio taške, tuomet
            if(fx2 < fx_vid)                
                pradzia = x_vid; %intervalo pradžia yra buves vidurio taškas
                x_vid = x2; %buves vidurio taškas tampa nauja intervalo pabaiga
            else %kitu atveju
                pradzia = x1; %intervalo pradžia pasistumia ketvirtadaliu viso intervalo ilgio
                pabaiga = x2; %intervalo pabaiga atsitraukia ketvirtadaliu viso intervalo ilgio
            end
        end
        
        fx_vid_1 = tikslo_funkcija(x_vid);  %matematinio modelio reikšme naujame vidurio taške
        x(iteracija) = x_vid;  %išsisaugome taške
        x_reiksme(iteracija) = fx_vid_1; %išsaugome reikšme
        ilgis = pabaiga - pradzia;  %išsaugomas naujas intervalo ilgis
        if(fx_vid_2 > fx_vid_1) %jeigu tenkina šia salyga tuomet yra perrašomos reikšmes
            naujas_ilgis = ilgis; 
            nauja_pradzia = pradzia;
            nauja_pabaiga = pabaiga;
            x_min_vid = x_vid;     
            fx_vid_2 = fx_vid_1;       
        end
    end
 
    f_min = fx_vid_2; %rasta matematinio modelio minimali reikšme
end


