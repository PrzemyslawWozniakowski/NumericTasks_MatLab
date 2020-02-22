function [ X, YP, Y , err ,merr ] = milmethrk3classic( f, a, b, n, y0 ,y)
%MILMETHRK4
% Funkcja znajduje rozwi�zanie zwyczajnego r�wnania r�niczkowego za pomoc�
% metody Milne'a. y1, y2 i y3 obliczone s� za pomoc� metody Rungego-Kuty 4
% rz�dy z wzorem Gille'a.
%Funkcja przyjmuje:
%f(x,y) - r�wnanie do rozwi�zania (y')
%a - lew� granic� przedzia�u na kt�rym okre�lone jest rozwi�zanie
%b - praw� granice przedzia�u
%n - liczb� podprzedzia��w
%y0 - warto�� na pocz�tku przedzia�u
%y - faktyczne rozwi�zanie (w celu obliczenia b��du i por�wnania)
%Funkcja zwraca:
%X - wektor [x_0,...,x_n];
%YP - rozwi�zanie ( w postaci warto�ci w punktach xi)
%Y - warto�ci funkcji y w punktach xi
%err - tablic� b��d�w
%merr - b��d maksymalny 

X = linspace(a,b,n);
YP = 1:n;

YP(1) = y0;
h = X(2) - X(1);
Y = y(X)


for i = 1:3
    x = X(i);   
    y = YP(i);
    k1 = h*f(x,y);
    k2 = h*f(x+0.5*h,   y+0.5*k1);
    k3 = h*f(x+0.5*h,  y- k1+2*k2);
    YP(i+1) = YP(i) + (1/6)*(k1+4*k2+k3)*h; 
end

for i = 4:n-1
    prediction = YP(i-3) + h*(4/3)*(2*f(X(i-2),YP(i-2))-f(X(i-1),YP(i-1))+2*f(X(i),YP(i))); 
    YP(i+1) = YP(i-1) + h*(1/3)*(f(X(i-1),YP(i-1)) + 4*f(X(i),YP(i))+ f(X(i+1),prediction));
end
err = abs(Y-YP);
merr= max(err);

end
