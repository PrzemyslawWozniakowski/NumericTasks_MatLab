%do funkcji matlabowej fsolve
function F = root3d(x)
% x=x(1), y=x(2), z=x(3)
%0= 1/4 * cos(x+y-z) +1/8 *y -x;
%0= 1/8 * atan(2*x+y+z) + 1/8 *z- y;
%0= 1/4 * asinh(x-y-z) + 1/8 *x - z;
F(1) = 1/4 * cos(x(1)+x(2)-x(3)) +1/8 *x(2) -x(1);
F(2) = 1/8 * atan(2*x(1)+x(2)+x(3)) + 1/8 *x(3)-x(2);
F(3) = 1/4 * asinh(x(1)-x(2)-x(3)) + 1/8 *x(1)-x(3);