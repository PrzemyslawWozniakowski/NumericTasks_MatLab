%-------------------------------------------
f1=@(x,y,z) 1/8 * cos(x-z) +1/8 *y + 1/8 *x - 1/8 *z;
f2=@(x,y,z) 1/8 * sin(x-y) + 1/8 *z - 1/8 *x;
f3=@(x,y,z) 1/8 * cos(x+y+z) + 1/8 *x - 1/8 *z;
[A,n] = iterprosta(f1,f2,f3,1e-6,[1,1,1])
f1(A(1),A(2),A(3))

%-------------------------------------------
g1=@(x,y,z) 1/8 * atan(x+y) + 1/8 *z;
g2=@(x,y,z) 1/8 * acot(y+z) + 1/8 *x;
g3=@(x,y,z) 1/8 * atan(x+z) + 1/8 *y;
[B,m]=iterprosta(g1,g2,g3,1e-10,[-1,-1,-1])
g1(B(1),B(2),B(3))
g2(B(1),B(2),B(3))
g3(B(1),B(2),B(3))

%-------------------------------------------
h1=@(x,y,z) 1/4 * asinh(2+x+y+z) +1/8 *y ;
h2=@(x,y,z) 1/8 * asinh(3-2*x+y+z) + 1/8 *z;
h3=@(x,y,z) 1/4 * asinh(1+x-y-z) + 1/8 *x;
[C,k]=iterprosta(h1,h2,h3)

%-------------------------------------------
i1=@(x,y,z) 1/4 * asinh(x+y+z) +1/8 *y ;
i2=@(x,y,z) 1/8 * asinh(2*x+y+z) + 1/8 *z;
i3=@(x,y,z) 1/4 * asinh(x-y-z) + 1/8 *x;
[D,n]=iterprosta(i1,i2,i3,1e-10,[1,1,1])

%-------------------------------------------
j1=@(x,y,z) 1/4 * cos(x+y-z) +1/8 *y ;
j2=@(x,y,z) 1/8 * atan(2*x+y+z) + 1/8 *z;
j3=@(x,y,z) 1/4 * asinh(x-y-z) + 1/8 *x;
tic
[E,n]=iterprosta(j1,j2,j3,1e-10,[0,0,0])
toc
j1(E(1),E(2),E(3))
j2(E(1),E(2),E(3))
j3(E(1),E(2),E(3))

%-------------------------------------------
%badanie przy pomocy funkcji matlabowej fsolve
options = optimoptions('fsolve','Display','iter');

fun=@root3d;
x0 = [0,0,0];
tic
x = fsolve(fun,x0,options)
toc
j1(x(1),x(2),x(3))