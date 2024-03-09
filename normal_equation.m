function [Theta] = normal_equation(A, b, tol, iter)
  b = A' * b;
  A = A' * A;
  [m n] = size(A);
  Theta = zeros(n+1, 1);
  #verificare daca A este pozitiv definita
  for i=1:m
    if(det(A(1:i,1:i)) <= 0)
      return;
    endif
  endfor
  x = zeros(n,1);
  r_old = b - A * x;
  v = r_old;
  tol_sqr = tol * tol;
  k = 1;
  while k <= iter && r_old' * r_old > tol_sqr
    t = (r_old' * r_old)/(v' * A * v);
    x = x + t * v;
    r = r_old - t * A * v;
    s = (r' * r)/(r_old' * r_old);
    v = r + s * v;
    k = k + 1;
    r_old = r;
  endwhile
  Theta = [0;x];
endfunction
