    function [intval] = calculateintegralfun(f,N)
%CALCULATEINTEGRALFUN
H= 2/N;


intval =0;

for i=0:N-1
        intval = intval + f(-1+i*H + H*(1/2)*(1- 1/sqrt(3)))...
                        + f(-1+i*H + H*(1/2)*(1+ 1/sqrt(3)));
                       
end
 intval = intval * H/2;

end
