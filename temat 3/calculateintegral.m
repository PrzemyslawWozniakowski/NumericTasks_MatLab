function [intval,err] = calculateintegral(fun,N)
%CALCULATEINTEGRAL
%Funkcja, liczy warto�� ca�ki podw�jnej z funkcji f(x,y) na obszarze |x| + |y| <= 1,
%przy pomocy transformacji na kwadrat i zastosowanie podw�jnej
%kwadratury Gaussa-Legendre'a na N przedzia�ach
%funkcja przyjmuje:
%Funkcje  - fun
%Paramaetr okre�laj�cy ilo�� przedzia��w, na kt�rych liczymy kwadratur�
%Zwraca:
%Warto�� ca�ki - intval
%B��d (b�d�cy r�nic� pomi�dzy warto�ci� ca�ki intval, a warto�ci� ca�ki
%znalezion� przy pomocy funkcji Matlabowej integral2 
f = @(x,y) 1/2 * fun((x+y)/2,(x-y)/2);
H= 2/N;
intval =0;

for i=0:N-1
     for j=0:N-1
         intval = intval + f(-1+i*H + H* 1/2 *(1- 1/sqrt(3)),-1+j*H + H* 1/2 *(1- 1/sqrt(3)))...
                       + f(-1+i*H + H* 1/2 *(1+ 1/sqrt(3)),-1+j*H + H* 1/2 *(1+ 1/sqrt(3)))...
                       + f(-1+i*H + H* 1/2 *(1+ 1/sqrt(3)),-1+j*H + H* 1/2 *(1- 1/sqrt(3)))...
                       + f(-1+i*H + H* 1/2 *(1- 1/sqrt(3)),-1+j*H + H* 1/2 *(1+ 1/sqrt(3)));
     end
     
end
    intval = intval * H^2 /4;
intval2= integral2(f,-1,1,-1,1);
if isinf(intval2) == 1 || isnan(intval2) ==1
    error('Funkcja ma rozbie�n� ca�k�!');
end
err=abs(intval - intval2);
end

