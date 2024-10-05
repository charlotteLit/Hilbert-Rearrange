function [x,y] = Hilbert(n)
    if n <= 0
      x = 0;
      y = 0;
     
    %recursive method call
    else
      [x0,y0] = Hilbert(n-1);
     
      %calculate new co-ordinates
      x = .5 * [-.5 + y0, -.5 + x0, .5 + x0, .5 - y0];
      y = .5 * [-.5 + x0, .5 + y0, .5 + y0, -.5 - x0];
    end


