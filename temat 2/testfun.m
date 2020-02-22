function [] = testfun(fun)
%TESTFUN
%  Funkcja testuje funkcje interpolbikwad. Przyjmuje jeden argument
% fun - funkcja interpolowana
[h,nwekt(1,:)]=interpolbikwad(fun,5);
[h,nwekt(2,:)]=interpolbikwad(fun,10);
[A,nwekt(3,:)]=interpolbikwad(fun,20);
[h,nwekt(4,:)]=interpolbikwad(fun,40);


scatter3(A(:,1),A(:,2),A(:,3),1,'r','*');
hold on
scatter3(A(:,1),A(:,2),A(:,4),1,'b','*');
wynik = nwekt(:,5);

X=['Maksymalny b³¹d dla n=5: ', num2str(wynik(1))];
disp(X);
X=['Maksymalny b³¹d dla n=10: ', num2str(wynik(2))];
disp(X);
X=['Maksymalny b³¹d dla n=20: ', num2str(wynik(3))];
disp(X);
X=['Maksymalny b³¹d dla n=40: ', num2str(wynik(4))];
disp(X);

disp('----------------------------------------------------------------');
%===================================================================
a(1)=wynik(1)/wynik(2);
a(2)=wynik(2)/wynik(3);
a(3)=wynik(3)/wynik(4);


X=['Przy wzroœcie n z 5 do 10 b³¹d maleje: ', num2str(a(1)),' razy.'];
disp(X);
X=['Przy wzroœcie n z 10 do 20 b³¹d maleje: ', num2str(a(2)),' razy.'];
disp(X);
X=['Przy wzroœcie n z 20 do 40 b³¹d maleje: ', num2str(a(3)),' razy.'];
disp(X);

disp('----------------------------------------------------------------');
%===================================================================
[h,nwekt(1,:)]=interpolbikwad(fun,5);
[h,nwekt(2,:)]=interpolbikwad(fun,10);
[h,nwekt(3,:)]=interpolbikwad(fun,20);
[h,nwekt(4,:)]=interpolbikwad(fun,30);
[h,nwekt(5,:)]=interpolbikwad(fun,40);

%plotwekt = nwekt(:,5);
%plotwekt = plotwekt';
%xaxis=[5 10 20 30 40];
%bar(xaxis,plotwekt);
%title('Zaleznoœæ b³êdu od n');
%xlabel('wartoœæ n');
%ylabel('wartoœæ b³êdu');
%===================================================================
 
[h,wekt]=interpolbikwad(fun,20);
len = length(h);
y=[0 0 0 0 0 0];
for i=1:len
    if h(i,5)> 1e-3
        y(1)=y(1)+1;
    elseif h(i,5)> 1e-5
        y(2)=y(2)+1;
    elseif h(i,5)> 1e-7
        y(3)=y(3)+1;
    elseif h(i,5)> 1e-9
        y(4)=y(4)+1;
    elseif h(i,5)> 1e-10
        y(5)=y(5)+1;
    else
        y(6)=y(6)+1;
    end
end

disp('Dla n=20:');
X=['Iloœæ punktów o b³êdzie wiêkszym od 1e-3:', num2str(y(1))];
disp(X);
X=['Iloœæ punktów o b³êdzie wiêkszym od 1e-5, a mniejszym od 1e-3:', num2str(y(2))];
disp(X);
X=['Iloœæ punktów o b³êdzie wiêkszym od 1e-7, a mniejszym od 1e-5:', num2str(y(3))];
disp(X);
X=['Iloœæ punktów o b³êdzie wiêkszym od 1e-9, a mniejszym od 1e-7:', num2str(y(4))];
disp(X);
X=['Iloœæ punktów o b³êdzie wiêkszym od 1e-10, a mniejszym od 1e-9:', num2str(y(5))];
disp(X);
X=['Iloœæ punktów o b³êdzie mniejszym od 1e-10:', num2str(y(6))];
disp(X);

end

