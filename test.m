x0=5;
f='x^2+5';
yy= Fx(f,x0);

dfun=char(diff(sym(f)));

fprintf('�������� ������� %s � ����� %f  = $f;',f,x0,yy);