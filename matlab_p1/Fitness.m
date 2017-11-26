function [ p, fitness, v ] = Fitness( Population )
%FITNESS 计算个体在群体中的适值和累积概率
%   此处显示详细说明
%使用max - x + xi;

length = size(Population,1);%列数
v = zeros(1, length);
for i = 1:length
    v(i) = value(Population(i,:));
end

%适值
rand1 = rand();
fitness = max(v) - v + rand1;
fitness(isnan(fitness)) = 0.1*rand1;

%累积概率
p1 = fitness./sum(fitness);
p = cumsum(p1);

end