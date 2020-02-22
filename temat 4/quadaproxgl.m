function [wektor,err,fm] = quadaproxgl(f,n,m)
%QUADAPROXGL 
%Funkcja znajduje aproksymacjê funkcji w bazie sk³adaj¹cej siê z n+1
%kolejnych wielomianów Lagandre'a. Iloczyny sklarane obliczane s¹ przy
%pomocy z³o¿onych 2-punktowych kwadratur Gaussa-Lagandre'a
%Funkcja przyjmuje
%f - funkcje aproksymowan¹
%n - wymiar bazy
%m - iloœæ przedzia³ów na których liczona jest kwadratura
%Funkcja zwraca
%err - b³¹d œredniokwadratowy
%fm - przybli¿enie funkcji
%wektor - tablicê wartoœci funkcji, przybli¿enia i b³êdu.
f=sym(f);
syms  x a1 a2 a3 a4 a5 a6 a7 a8 a9 a10;
P=x;
for i=1:n+1
    P(i)=legpoly0(i-1);
end
b=[a1;a2;a3;a4;a5;a6;a7;a8;a9;a10];
Ln=0;

for i=1:n+1
    Ln = Ln + b(i) * P(i);
end

c=sym('c');
for i=1:n+1
    c(i)=f*P(i);
end

g=sym('g');
for i=1:n+1
    g(i)=P(i)*P(i);
end

ffun=matlabFunction(f);
fskalar(1)=calculateintegralfun(ffun,m);
for i=2:n+1
    ffun=matlabFunction(c(i));
    fskalar(i)=calculateintegralfun(ffun,m);
end

ffun=@(x)1+0.*x;
gskalar(1)=calculateintegralfun(ffun,m);
for i=2:n+1
    ffun=matlabFunction(g(i));
    gskalar(i)=calculateintegralfun(ffun,m);
end

for i=1:n+1
    a(i) = fskalar(i)/gskalar(i);
end

switch n
    case 0 
    fun = subs(Ln,{a1},{a(1)});
    case 1 
    fun = subs(Ln,{a1,a2},{a(1),a(2)});
    case 2 
    fun = subs(Ln,{a1,a2,a3},{a(1),a(2),a(3)});
    case 3 
    fun = subs(Ln,{a1,a2,a3,a4},{a(1),a(2),a(3),a(4)});
    case 4 
    fun = subs(Ln,{a1,a2,a3,a4,a5},{a(1),a(2),a(3),a(4),a(5)});
    case 5 
    fun = subs(Ln,{a1,a2,a3,a4,a5,a6},{a(1),a(2),a(3),a(4),a(5),a(6)});
    case 6
    fun = subs(Ln,{a1,a2,a3,a4,a5,a6,a7},{a(1),a(2),a(3),a(4),a(5),a(6),a(7)});
    case 7 
    fun = subs(Ln,{a1,a2,a3,a4,a5,a6,a7,a8},{a(1),a(2),a(3),a(4),a(5),a(6),a(7),a(8)});
    case 8 
    fun = subs(Ln,{a1,a2,a3,a4,a5,a6,a7,a8,a9},{a(1),a(2),a(3),a(4),a(5),a(6),a(7),a(8),a(9)});
    case 9 
    fun = subs(Ln,{a1,a2,a3,a4,a5,a6,a7,a8,a9,a10},{a(1),a(2),a(3),a(4),a(5),a(6),a(7),a(8),a(9),a(10)});
end
f1=matlabFunction(f);
fm=matlabFunction(fun);
X= linspace(-1,1);
F1 = f1(X);
F2 = fm(X);
figure
plot(X,F2,'r',X,F1,'b*');
title(['Aproksymacja œredniokwadratowa ci¹g³a dla n=', num2str(n),' i m=', num2str(m)])
xlabel('-1 <= x <= 1') 
ylabel('wartoœæ') 
legend({'f*(x)','f(x)'},'Location','southeast')
wektor=ones(m,3);
for i=1:m
    wektor(i,1) = f1(-1 + 2/m *i);
    wektor(i,2)= fm(-1 + 2/m *i);
    wektor(i,3)=abs(wektor(i,1)-wektor(i,2));
end
err  = sqrt(sum(wektor(:,3).*wektor(:,3)) /m);
end 


