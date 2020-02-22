function [intval,err] = calculateintegral(fun,N)
%CALCULATEINTEGRAL
%Funkcja, liczy wartoœæ ca³ki podwójnej z funkcji f(x,y) na obszarze |x| + |y| <= 1,
%przy pomocy transformacji na kwadrat i zastosowanie podwójnej
%kwadratury Gaussa-Legendre'a na N przedzia³ach
%funkcja przyjmuje:
%Funkcje  - fun
%Paramaetr okreœlaj¹cy iloœæ przedzia³ów, na których liczymy kwadraturê
%Zwraca:
%Wartoœæ ca³ki - intval
%B³¹d (bêd¹cy ró¿nic¹ pomiêdzy wartoœci¹ ca³ki intval, a wartoœci¹ ca³ki
%znalezion¹ przy pomocy funkcji Matlabowej integral2 
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
    error('Funkcja ma rozbie¿n¹ ca³kê!');
end
err=abs(intval - intval2);
end

