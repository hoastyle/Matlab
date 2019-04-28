ptbuffer = textread('point_cloud.txt')
id = find(ptbuffer(:,2)==0)
ptbuffer(id,:) = [];
pcshow(ptbuffer, [0 0 1], 'VerticalAxis', 'Y', 'VerticalAxisDir', 'Down');axis equal;
xlabel('x')
ylabel('y')
zlabel('z')