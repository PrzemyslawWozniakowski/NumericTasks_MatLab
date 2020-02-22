function [wynik] = ibikwad(fun,x0,y0,l)
%IBIKWAD
%Ibikwad Funkcja interpoluje funkcj� na kwadracie, przy pomocy funkcji
%bikwadratowej. Oblicza przybli�on� warto�� w 4 punktach b�d�cych �rodkami 4 �wiartek kwadratu. Przyjmuje ona 4 argumenty
%fun - interpolowan� funkcje
%x0 - wsp�rz�dn� x lewego dolnego wierzcho�ka kwadratu
%y0 - wsp�rz�dn� y lewego dolnego wierzcho�ka kwadratu
%l - d�ugo�� boku kwadratu
%Funkcja zwraca:
%wynik - wektor w kt�rym znajduj� si�: wsp�rz�dne punktu, warto�� funkcji i
%przybli�enia w punkcie oraz b��d
A=ones(9,9);
b=ones(9,1);
x=[x0 x0 x0+l x0+l x0 x0+l/2 x0+l x0+l/2 x0+l/2]; %wsp�rz�dne x 9 w�z��w interpolacji
y=[y0 y0+l y0+l y0 y0+l/2 y0+l y0+l/2 y0 y0+l/2]; %wsp�rz�dne y 9 w�z��w interpolacji
for i=1:9
    A(i,:)=[1 x(i) y(i) x(i)*y(i) x(i)^2 y(i)^2 x(i)^2*y(i) y(i)^2*x(i) x(i)^2*y(i)^2];
    b(i)=fun(x(i),y(i));
end
px=[x0+l/4;x0+l/4; x0+l*3/4; x0+3*l/4]; %wsp�rz�dne x punkt�w, kt�rych warto�� przybli�amy
py=[y0+l/4;y0+l*3/4; y0+l*3/4; y0+l/4]; %wsp�rz�dne y punkt�w, kt�rych warto�� przybli�amy
a=A\b; %obliczanie wsp�czynnik�w funkcji bikwadratowej

wynik(:,1)=px;
wynik(:,2)=py;
wynik(:,4) =a(1) + a(2).*px + a(3).*py + a(4).*px.*py + a(5) .*px.^2 + a(6)*py.^2 + a(7).*px.^2.*py+py.^2.*px*a(8)+a(9).*px.^2.*py.^2;
wynik(:,3) = fun(px,py);
wynik(:,5) = abs(wynik(:,4)-wynik(:,3));
end

