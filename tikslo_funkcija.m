%tikslo funkcija 
function [tf] =  tikslo_funkcija(t)
    %reikšm?s nustatomos iš duotos s?lygos
    b = mod(20145120, 7)/2 + 2.5; 
    c2 = mod(20145120, 30) + 150;
    c = mod(20145120, 5) + 3;
    %matematinis modelis
    tf = (c2./t)+(b*c*t);
end