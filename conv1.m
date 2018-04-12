## Author: Christian Lascsak
## 01363742

function [retval] = conv1 (f, g)
    sum = [];
    lf = length(f);
    lg = length(g);
    
    endlength  = lg + lf -1;
   
 
    
    for n = 1 : endlength
      intSum = 0;
      for k = 1:length(f)
        if(n-k+1 <=0 || n-k+1 > length(g))
          continue;
        endif;
       intSum = intSum + f(k) * g(n-k+1);
       end;
     sum  = [sum, intSum];
     
   end;
   retval = sum;
           
     
endfunction
