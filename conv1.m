## Author: Christian Lascsak
## Created: 2018-04-06

function [retval] = conv1 (f, g)
    sum = [];
    lf = length(f);
    lg = length(g);
    endlength = 0;
    if(lf>lg)
      endlength = lf;
      dif = lf - lg;
      for i = 1:dif
        g = [g , 0]
      end;
      
    elseif (lg>lf)
      endlength = lg;
      dif = lg - lf;
      for i = 1:dif
        f = [f, 0]
      end;
      else
      endlength = length(f);
    endif;
    
    g = flip(g);
    disp(g);
    
    for n = 1 : endlength
      intSum = 0;
      for k = 1:n
       intSum = intSum + f(k) * g(endlength - k + 1);
       end;
     sum  = [sum, intSum];
     
   end;
   retval = sum;
           
     
endfunction
