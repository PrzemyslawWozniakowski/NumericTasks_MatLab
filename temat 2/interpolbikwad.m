function [A,maxerr] =interpolbikwad(fun,n)
%INTERPOLBIKWAD
%Interpolbikwad Funkcja interpoluje funkcjami bikwadratowymi, funkcjê na
%obszarze D= [-2,2]x[-2,2] - [-1,1]x[-1,1] podzielonym na 12 n^2 kwadratów
%Przyjmuje 2 argumenty:
%fun - interpolowan¹ funkcjê
%n - parametr okreœlaj¹cy iloœæ kwadratów
%Zwraca ona 
%A - wektor w którym znajduj¹ siê: wspó³rzêdne punktów, wartoœæ funkcji i
%przybli¿enia w danym punkcie oraz b³¹d
%maxerr - maksymaln¹ wartoœæ b³êdu
A=ones(n^2*4,5);
count=1;
for i=0:(n-1)
    for j=0:(n-1)
       xwekt=[-2+(1/n)*i,-1+(1/n)*i, (1/n)*i,1+(1/n)*i, ...
              1+(1/n)*i,1+(1/n)*i,1+(1/n)*i,(1/n)*i, ... 
             -1+(1/n)*i,-2+(1/n)*i,-2+(1/n)*i,-2+(1/n)*i];
       ywekt=[1+(1/n)*j,1+(1/n)*j,1+(1/n)*j,1+(1/n)*j,...
             (1/n)*j,-1+(1/n)*j,-2+(1/n)*j,-2+(1/n)*j,...
             -2+(1/n)*j,-2+(1/n)*j,-1+(1/n)*j,(1/n)*j];
       for k=1:12
        A(((count-1)*4 +1):count*4,:)=ibikwad(fun,xwekt(k),ywekt(k), 1/n);
        count=count+1;
       end
    end
end

[unused,ind] = max(A(:,5));
maxerr=A(ind,:);
end

    