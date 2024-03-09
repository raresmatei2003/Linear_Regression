function [Y InitialMatrix] = parse_data_set_file(file_path)
  in = fopen(file_path,"r");
  [m n] = fscanf(in,"%d%d","C")
  Y = [];
  InitialMatrix = cell(m,n);
  for i=1:m
    #citesc primul numar de pe linie si il introduc la finalul lui Y
    nr = fscanf(in,"%ld",1);
    Y = [Y;nr];
    for j=1:n
      InitialMatrix{i,j} = fscanf(in,"%s",1);
      #daca incepe cu o cifra atunci transform string-ul in numar
      if(isdigit(InitialMatrix{i,j}(1)))
        InitialMatrix{i,j} = str2num(InitialMatrix{i,j});
      endif
    endfor
  endfor
  fclose(in);
endfunction
