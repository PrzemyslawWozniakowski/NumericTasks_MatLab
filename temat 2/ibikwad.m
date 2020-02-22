function [wynik] = ibikwad(fun,x0,y0,l)
%IBIKWAD
%Ibikwad Funkcja interpoluje funkcjê na kwadracie, przy pomocy funkcji
%bikwadratowej. Oblicza przybli¿on¹ wartoœæ w 4 punktach bêd¹cych œrodkami 4 æwiartek kwadratu. Przyjmuje ona 4 argumenty
%fun - interpolowan¹ funkcje
%x0 - wspó³rzêdn¹ x lewego dolnego wierzcho³ka kwadratu
%y0 - wspó³rzêdn¹ y lewego dolnego wierzcho³ka kwadratu
%l - d³ugoœæ boku kwadratu
%Funkcja zwraca:
%wynik - wektor w którym znajduj¹ siê: wspó³rzêdne punktu, wartoœæ funkcji i
%przybli¿enia w punkcie oraz b³¹d
A=ones(9,9);
b=ones(9,1);
x=[x0 x0 x0+l x0+l x0 x0+l/2 x0+l x0+l/2 x0+l/2]; %wspó³rzêdne x 9 wêz³ów interpolacji
y=[y0 y0+l y0+l y0 y0+l/2 y0+l y0+l/2 y0 y0+l/2]; %wspó³rzêdne y 9 wêz³ów interpolacji
for i=1:9
    A(i,:)=[1 x(i) y(i) x(i)*y(i) x(i)^2 y(i)^2 x(i)^2*y(i) y(i)^2*x(i) x(i)^2*y(i)^2];
    b(i)=fun(x(i),y(i));
end
px=[x0+l/4;x0+l/4; x0+l*3/4; x0+3*l/4]; %wspó³rzêdne x punktów, których wartoœæ przybli¿amy
py=[y0+l/4;y0+l*3/4; y0+l*3/4; y0+l/4]; %wspó³rzêdne y punktów, których wartoœæ przybli¿amy
a=A\b; %obliczanie wspó³czynników funkcji bikwadratowej

wynik(:,1)=px;
wynik(:,2)=py;
wynik(:,4) =a(1) + a(2).*px + a(3).*py + a(4).*px.*py + a(5) .*px.^2 + a(6)*py.^2 + a(7).*px.^2.*py+py.^2.*px*a(8)+a(9).*px.^2.*py.^2;
wynik(:,3) = fun(px,py);
wynik(:,5) = abs(wynik(:,4)-wynik(:,3));
end

