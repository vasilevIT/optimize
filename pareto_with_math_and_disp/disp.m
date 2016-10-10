function f = disp(table)
 d=0;
    table2 = table;
    table2(1,:) = table(1,:).^2; 
  d = mat(table2) - mat(table)^2;
 f=d;
end