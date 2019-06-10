min_islaidos(1,30);
function [q, t, x_min_vid, f_min, islaidos, iteracija, ilgis] = min_islaidos(pradzia, pabaiga)
  [x_min_vid, f_min, nauja_pradzia, nauja_pabaiga, iteracija, ilgis, x, x_reiksme] = pirmas(pradzia, pabaiga);
  vid_taskas = (nauja_pradzia+nauja_pabaiga)/2; %randamas intervalo vidurio taska
  vid_taskas_apacia = floor(vid_taskas); %randama intervalo vidurio tasko apacia
  f_apacia = tikslo_funkcija(vid_taskas_apacia); %randama modelio reiksme vd_taskas_apacia taske
  vid_taskas_virsus = ceil(vid_taskas); %randamas intervalo vidurio tasko virsus
  f_virsus = tikslo_funkcija(vid_taskas_virsus); %randama modelio reiksme vd_taskas_virsus taske
  
  if(f_apacia > f_virsus) %jeigu virsutine modelio reiksme yra didesne nei apataine, tada
    islaidos = f_virsus; %isaugome virsutine reiksme
    t = vid_taskas_virsus; %issaugome paros reiksme
  else %kitu atveju
    islaidos = f_apacia; %isaugome apatine reiksme
    t = vid_taskas_apacia; %issaugome paros reiksme
  end
 
  a = pradzia:1:pabaiga; %optimalus prekiu vezimo periodas
  b = tikslo_funkcija(a); %islaidos kiekviename periode
 
  %auksinio pjuvio metodas
  optimizavimas = optimset('Display', 'iter','MaxFunEvals', 1000,'PlotFcns', @optimplotfval , 'TolX', ilgis);
  [xfminbnd, yfminbnd] = fminbnd(@tikslo_funkcija, pradzia, pabaiga, optimizavimas);
  
  figure %breziamas grafikas
  plot(a, b, '.-', x, x_reiksme, '.-'), legend('reiksmes, kiekviename taske', 'reiksmes, dalijant intervala pusiau'); 
  title('Prekybos bazes islaidu kitimas pagal vezimo perioda t');
  xlabel('Prekiu vezimo periodas (t)');
  ylabel('Prekybos bazes islaidos per viena diena'); 
  
  b = mod(20145120, 7)/2 + 2.5; 
  q = t * b; 
  f_min
  x_min_vid
  t
  q
  islaidos
  iteracija
  ilgis
  xfminbnd 
  yfminbnd 
  
end
