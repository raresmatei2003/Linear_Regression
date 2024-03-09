function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  [m n] = size(FeatureMatrix);
  Error = 0;
  ThetaNorm = norm(Theta,1);
  for i=1:m
    h = FeatureMatrix(i,:) * Theta(2:n+1,1);
    Error += (Y(i) - h)^2;
  endfor
  Error = Error/m + lambda * ThetaNorm;
endfunction
