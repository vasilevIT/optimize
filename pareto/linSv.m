%линейная свертка
function pos = linSv(P,L1,L2)
    s = size(P,1);
    F = zeros(s,1);
    for i = 1:s
        F(i) = P(i,1)*L1+P(i,2)*L2;
    end
    P = [P,F];
    Phi = min(P(:,3));
    pos = find(P(:,3) == Phi);
    hold on;
    grid on;
    title(sprintf('Метод линейной свёртки u1=%.2f u2=%.2f',L1,L2));
    plot(P(:,1),P(:,2),'.','MarkerSize',10,'color','red');
    plot(P(pos,1),P(pos,2),'.','MarkerSize',15,'color','green');
    plot([ 0 P(pos,1)+Phi],[ P(pos,2)+Phi 0], 'g');
    disp(P(pos,1));
    disp(P(pos,2));
end

