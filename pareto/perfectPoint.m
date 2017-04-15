function P = perfectPoint(Tbl)
    mX = max(Tbl(:,1));
    mY = max(Tbl(:,2));
    pos1 = find(Tbl(:,1) == mX);
    pos2 = find(Tbl(:,2) == mY);
    Y = Tbl( pos1,2);
    X = Tbl( pos2,1);

    N = size(Tbl(:,1),1);
    R = zeros(1,N);
    for i = 1:N
        R(i) = (Tbl(i,1)-X)^2 + (Tbl(i,2)-Y)^2;
    end
    P = find(R == min(R));
    optX = Tbl(P,1);
    optY = Tbl(P,2);
    hold on;
    grid on;
    title('Метод идеальной точки');
    plot(X,Y,'ob');
    plot(optX,optY,'ob');
    plot(Tbl(:,1),Tbl(:,2),'*r');
    plot([X optX],[Y optY],'b');
end