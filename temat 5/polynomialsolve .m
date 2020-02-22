function [sol] = polynomialsolve(tab,eps)
%POLYNOMIALSOLVE
%Funkcja znajduje zera wielomianu, x^n + p_{n-1}x^{n-1} + ... p_1x + p_0,
%poprzez znalezienie wartoœci w³asnej macierzy skojarzonej, a nastêpnie deflacje wielomianu
%wspó³czynnikiem liniowym postaci (x-x_i) gdzie x_i jest zerem wielomianu.
%Funkcja przyjmuje:
%-tab - wektor [p_{n-1},...,p_1,p_0] wspó³czynników wielomianu
%-eps - dok³adnoœæ (d)
%Funkcja zwraca:
%-solution - wektor zer wielomianu.
%W przypadku, gdy obliczona wartoœæ w³asna bêdzie mia³a wartoœæ Nan, wypisywany jest komunikat, a dalsze szukanie jest przerywane.

m=length(tab);
v=m;
if nargin==1
    eps = 1e-15;
end
sol=0;
k=0;
maxit=1000;

for j=1:m
    n=length(tab);
    mac = zeros(n,n);
    mac(1,:)=-tab;
    for i=2:n
        mac(i,i-1)=1;%generowanie macierzy skojarzonej
    end
    x2=ones(n,1);
    lambda1=1;
    lambda2=0;
    k=0;
    while abs(lambda1-lambda2)>eps
        if(maxit<=k)
            disp('tik');
            break;
        end
        x1=x2;
        y=mac*x1;
        x2=y/norm(y);
        lambda1=lambda2;
        lambda2= dot(y,x1);%metoda potêgowa
        k=k+1;   
    end
    if isnan(lambda2)
        disp('Wielomian ma dwa zera o równym module');
        return; %zwracam miejsca zerowe, ju¿ znalezione (te o wiêkszym module)
    end
    
    sol(j) = lambda2;
    newtab=0;
    newtab(1) = lambda2 + tab(1);
    for k=2:n-1
       newtab(k) = newtab(k-1)*lambda2 + tab(k); %schemat hornera
    end
    tab=newtab; % podstawiam wektor obliczony schematem hornera
    
end
k=1;
for i=1:v
    logic=0;
    for j=1:v
        if i~=j && abs(sol(j) - sol(i))<eps^(1/2)
            logic=1;
        end
    end
    if logic==0
        solution(k)=sol(i);
        k=k+1;
    end
end


end

