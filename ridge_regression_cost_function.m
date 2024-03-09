function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  [m n] = size(FeatureMatrix);
  Error = 0;
  TermenReg = lambda * (norm(Theta,2)^2);
  for i=1:m
    h = FeatureMatrix(i,:) * Theta(2:n+1,1);
    Error += (h - Y(i))^2;
  endfor
  Error = Error/(2 * m) + TermenReg;
endfunction
