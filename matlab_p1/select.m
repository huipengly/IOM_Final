function [ selected ] = select( p )
%SELECT ѡ����
%   ѡ�����������ۼƸ��ʼ��㣬���̶ķ�ʽ��

r = rand(2,1);
pr = repmat(p,2,1) - repmat(r,1,size(p,2));
selected(1) = find(pr(1,:) > 0, 1);
selected(2) = find(pr(2,:) > 0, 1);

%ѡ����ͬ������ѡ
while(selected(1) == selected(2))
    r = rand(1,1);
    pr = p - repmat(r,1,size(p,2));
    selected(2) = find(pr > 0, 1);
end

end