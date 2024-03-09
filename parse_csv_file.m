function [Y InitialMatrix] = parse_csv_file(file_path)
  #pkg load io;
  #InitialMatrix = csv2cell(file_path);
  #[lines cols] = size(InitialMatrix);
  #Y = cell2mat(InitialMatrix(2:lines,1));
  #InitialMatrix = InitialMatrix(2:lines,2:cols);
  in = fopen(file_path,"r");
  [line] = fgetl(in)
  n = 12;
  m = 0;
  Y = [];
  InitialMatrix = cell(1,n);
  line_cells = cell(m,1);
  while 1
    #daca am ajuns la finalul fisierului ies din functie
    if feof(in)
      return;
    endif
    #citesc primul numar de pe linie si il introduc la finalul lui Y
    nr = fscanf(in,"%ld,",1)
    m++;
    Y = [Y;nr];
    #citesc linia actuala
    [line] = fgetl(in);
    #impart linia intr-un vector de tip cell cu separatorul ','
    line_cells = strsplit(line,',');
    #copiez vectorul cell in InitialMatrix
    for j=1:n
      InitialMatrix{m,j} = line_cells{1,j};
      #daca incepe cu o cifra atunci transform string-ul in numar
      if(isdigit(InitialMatrix{m,j}(1)))
        InitialMatrix{m,j} = str2num(InitialMatrix{m,j});
      endif
    endfor
  endwhile
  fclose(in);
endfunction
