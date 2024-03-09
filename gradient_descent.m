function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n+1,1);
  for k=1:iter
    for j=1:n
      dif = 0;
      h = 0;
      for i=1:m
        h = FeatureMatrix(i,:) * Theta(2:n+1);
        dif = dif + (h-Y(i,1)) * FeatureMatrix(i, j);
      endfor
      dif = dif/m;
      Theta(j+1) = Theta(j+1) - alpha * dif;
    endfor
  endfor
endfunction
