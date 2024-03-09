function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [lines cols] = size(InitialMatrix);
  #coloana ce trebuie introdusa pentru valorile 'furnished', ii introduc
  #valorile si la final o pun in matrice
  new_col = cell(lines,1);
  #pozitia unde trebuie introdusa coloana respectiva
  new_col_poz = 0;
  for i=1:lines
    for j=1:cols
      if strcmp(InitialMatrix(i,j), "yes") == 1
        InitialMatrix(i,j) = 1;
      elseif strcmp(InitialMatrix(i,j), "no") == 1
        InitialMatrix(i,j) = 0;
      elseif strcmp(InitialMatrix(i,j), "furnished") == 1
        new_col_poz = j;
        new_col(i) = 0;
        InitialMatrix(i,j) = 0;
      elseif strcmp(InitialMatrix(i,j), "semi-furnished") == 1
        new_col_poz = j;
        new_col(i) = 0;
        InitialMatrix(i,j) = 1;
      elseif strcmp(InitialMatrix(i,j), "unfurnished") == 1
        new_col_poz = j;
        new_col(i) = 1;
        InitialMatrix(i,j) = 0;
      endif
    endfor
  endfor
  #introduc coloana noua in matrice pe pozitia ei
  InitialMatrix = [InitialMatrix(:,1:new_col_poz) new_col InitialMatrix(:,new_col_poz+1:cols)];
  FeatureMatrix = cell2mat(InitialMatrix);
endfunction
