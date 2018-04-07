## Author: Christian Lascsak
## Created: 2018-04-06

function [retval] = conv1 (f, g)
    sum = [];
    m = length(f);
    for n = 1:m
      intSum = 0;
      n;
      for k = 2:n
       k;
       intSum = intSum + f(n) * g(n-k);
      end;
     sum  = (sum, intSum);
     
   end;
   retval = sum;
           
     
endfunction
