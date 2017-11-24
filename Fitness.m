function [ p, fitness, v ] = Fitness( Population )
%FITNESS ���������Ⱥ���е���ֵ���ۻ�����
%   �˴���ʾ��ϸ˵��
%ʹ��max - x + xi;

length = size(Population,1);%����
v = zeros(1, length);
for i = 1:length
    v(i) = value(Population(i,:));
end

%��ֵ
rand1 = rand();
fitness = max(v) - v + rand1;
fitness(isnan(fitness)) = 0.1*rand1;

%�ۻ�����
p1 = fitness./sum(fitness);
p = cumsum(p1);

end