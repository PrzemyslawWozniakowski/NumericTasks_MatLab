%f=@(x) x^4 + exp(x) + sin(x) + 1 + x*100
%=@(x) x^8 + x^27 + 1/(x+4)
f=@(x) exp(3*x) + exp(x^2)
%f=@(x) 35*x^7 + 24 + cos(x)
%f=@(x) tan(x) 
%f=matlabFunction(legpoly0(5))
g=sym(f);
n1=5;m1=100;
[w1,e1,g1] = quadaproxgl(f,n1,m1);
n2=7;m2=200;
[w2,e2,g2] = quadaproxgl(f,n2,m2);
n3=5;m3=400000;
[w3,e3,g3] = quadaproxgl(f,n3,m3);

err1=max(w1(:,3));
err2=max(w2(:,3));
err3=max(w3(:,3));
g
disp(['Dla n=',num2str(n1),', i m=',num2str(m1),',  err max =',num2str(err1), '   blad œredniokwadratowy =' num2str(e1)]);
disp(['Dla n=',num2str(n2),', i m=',num2str(m2),',  err max =',num2str(err2), '   blad œredniokwadratowy =' num2str(e2)]);
disp(['Dla n=',num2str(n3),', i m=',num2str(m3),',  err max =',num2str(err3), '   blad œredniokwadratowy =' num2str(e3)]);
w2