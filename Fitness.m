function [ fitness, p ] = Fitness( x )
%FITNESS ���������Ⱥ���е���ֵ���ۻ�����
%   �˴���ʾ��ϸ˵��
%ʹ��max - x + xi;

%��ֵ
rand1 = rand();
fitness = max(x) - x + rand1;
fitness(isnan(fitness)) = 0.1*rand1;

%�ۻ�����
p1 = fitness./sum(fitness);
p = cumsum(p1);

end