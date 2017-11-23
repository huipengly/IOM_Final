load p.mat
load d.mat

inn=30; %初始种群大小
gnmax=500;  %最大代数
pc=0.8; %交叉概率
pm=0.08; %变异概率

%产生初始种群
Population=zeros(inn,20);
for i=1:inn
    Population(i,:)=randperm(20);
end

[f,p]=Fitness(Population,dislist);

gn=1;

ChildPopulation = zeros(inn, 20);
while gn <= gnmax
    for i = 1:2:inn
        %交叉
       parent = select(p);
       %scro=cro(s,seln,pc);  %交叉操作
       %交叉结果变异
       ChildPopulation(i,:) = variation(children(1), pm);
       ChildPopulation(i+1,:) = variation(children(2), pm);
    end
    Population = ChildPopulation;
    [f,p]=Fitness(Population,dislist);
    %TODO:fitness函数，修改，输入染色体，输出不变
end