h1=@(x,y,z) 1/4 * asinh(2+x+y+z) +1/8    *y ;
h2=@(x,y,z) 1/8 * asinh(3-2*x+y+z) + 1/8 *z;
h3=@(x,y,z) 1/4 * asinh(1+x-y-z) + 1/8 *x;

[C,n(1)]=iterprosta(h1,h2,h3,1e-5);
[C,n(2)]=iterprosta(h1,h2,h3,1e-10);
[C,n(3)]=iterprosta(h1,h2,h3,1e-15);
[C,n(4)]=iterprosta(h1,h2,h3,1e-20);
[C,n(5)]=iterprosta(h1,h2,h3,1e-25);
[C,n(6)]=iterprosta(h1,h2,h3,1e-30);
C
subplot(2,1,1)
x = categorical({'1e-5','1e-10','1e-15','1e-20','1e-25','1e-30'});
x = reordercats(x,{'1e-5','1e-10','1e-15','1e-20','1e-25','1e-30'});
bar(x,n,'r');
title('Iloœæ iteracji dla danego eps i wektora pocz. [1,1,1]')
xlabel('eps');
ylabel('iloœæ iteracji');
ylim([5 35])

[C,m(1)] = iterprosta(h1,h2,h3,1e-15,[-10,-10,-10]);
[C,m(2)] = iterprosta(h1,h2,h3,1e-15,[-1,-1,-1]);
[C,m(3)] = iterprosta(h1,h2,h3,1e-15,[0,0,0]);
[C,m(4)] = iterprosta(h1,h2,h3,1e-15,[1,1,1]);
[C,m(5)] = iterprosta(h1,h2,h3,1e-15,[2,2,2]);
[C,m(6)] = iterprosta(h1,h2,h3,1e-15,[10,10,10]);
[C,m(7)] = iterprosta(h1,h2,h3,1e-15,[25,25,25]);

subplot(2,1,2)
x = categorical({'[-10,-10,-10]','[-1,-1,-1]','[0,0,0]','[1,1,1]','[2,2,2]','[10,10,10]','[25,25,25]'});
x = reordercats(x,{'[-10,-10,-10]','[-1,-1,-1]','[0,0,0]','[1,1,1]','[2,2,2]','[10,10,10]','[25,25,25]'});
bar(x,m,'g');
title('Iloœæ iteracji dla eps 1e-15 i danego wektora pocz.')
xlabel('wektor pocz¹tkowy');
ylabel('iloœæ iteracji');
ylim([20 35])