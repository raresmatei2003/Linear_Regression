# Linear_Regression

parse_data_set_file: Citesc datele din fisierul dat. Prima coloana o retin
in Y. Restul matricei o retin in InitialMatrix care este de tip cell.
Citesc fiecare celula din matrice drept string si in cazul in care incepe
cu o cifra il convertesc in numar.

parse_csv_file: Am urmat un procedeu similar ca la parse_data_set_file.
Stiu ca trebuie citite 13 coloane, dintre care prima este Y si retul 12
sunt pentru InitialMatrix. Deoarece nu stiu numarul de linii folosesc un
while care merge la infinit din care ies atunci cand a fost parcurs tot
fisierul de intrare. Singura diferenta in citirea efectiva a datelor fata
de parse_data_set_file este faptul ca am delimitat fiecare linie dupa ','.

prepare_from_regression: Parcurg matricea de tip cell InitialMatrix si
transform string-urile in codurile date in cerinta: yes - 1; no - 0;
furnished - 0 0; semi-furnished - 1 0; unfurnished - 0 1. Pentru furnished,
semi-furnished si unfurnished creez o coloana noua care retine cea de a doua
valoare din cod, si retin coloana din matrice unde se afla furnished etc.
La final introduc coloana noua in matrice.

Pentru linear_regression_cost_function,  lasso_regression_cost_function,
 ridge_regression_cost_function, normal_equation si  gradient_descent am
implementat algoritmii dati in cerinta.
