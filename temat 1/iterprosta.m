function [A,n] = iterprosta(g1,g2,g3,eps,x0)
%ITERPROSTA
%Funkcja oblicza rozwi¹zanie uk³adu 3 równañ nieliniowych:
%x=g1(x,y,z);y=g2(x,y,z);z=g3(x,y,z) przy pomocy metody iteracji prostej
%dla podanego punktu pocz¹tkowego x0 (domyœlnie dla [1,1,1])
%Warunkiem przerwania jest: norm(x(k+1)-G(x(k))) <= eps (eps podawany jako
%argument, domyslnie 1e-5). Funkcja zwraca wektor bêd¹cy rozwi¹zaniem i iloœæ wykonanych
%iteracji.
 if(nargin == 3)
     eps=1e-5;
     x0=[1,1,1];
 end
  if(nargin == 4)
     x0=[1,1,1];
 end
 A = x0;
 n=0;
 while norm(A-[g1(A(1),A(2),A(3)),g2(A(1),A(2),A(3)),g3(A(1),A(2),A(3))])>eps
     n=n+1;
     A=[g1(A(1),A(2),A(3)),g2(A(1),A(2),A(3)),g3(A(1),A(2),A(3))];
 end

end

