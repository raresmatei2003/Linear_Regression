function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  [m n] = size(FeatureMatrix);
  Error = 0;
  for i=1:m
    h = FeatureMatrix(i,:) * Theta(2:n+1,1);
    Error += (h-Y(i))^2;
  endfor
  Error = Error/(2*m);
endfunction
