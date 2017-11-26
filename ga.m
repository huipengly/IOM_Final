function [Min]=ga
%clear

inn = 300; %初始种群大小
gnmax = 50;  %最大代数
pc = 1; %交叉概率
pm = 0.08; %变异概率

%产生初始种群
Population = zeros(inn,20+8);
%Population(1,:) = [[6,4,3,16,9,14,11,7,15,12,19,17,10,5,13,18,20,2,8,1],0 1 0 0 0 1 0 0];
for i=1:inn
    Population(i,:) = [randperm(20),round(rand(1,8))];
end
%TODO:更改除了value函数以外的函数，以适应新编码
%计算初始种群适值
[pr, ~, v]=Fitness(Population);

%初始化进化代数
gn=1;

%记录每代最优解
ymean = zeros(gnmax,1);
ymin = zeros(gnmax,1);
cmin = zeros(inn,28);
%ym=1e10;%全局最优解
%cm=[];%全局最优解序列
ChildPopulation = zeros(inn, 28);
while gn < gnmax
   [vmin,nmin]=min(v);
   ymean(gn,:) = mean(v(~isnan(v)));
   ymin(gn, :)=vmin;
   cmin(gn,:)=Population(nmin,:);
   %保留前2个最优解
   vv = v;
   vv(nmin) = 1e5;
   [~,nnmin] = min(vv);
   ChildPopulation(1,:) = Population(nmin,:);
   ChildPopulation(2,:) = Population(nnmin,:);
   
   %选择，交叉，变异
   for i = 3:2:inn
        %选择、交叉
       parent = select(pr);
       children = crossover(Population(parent, :), pc);  %交叉操作
       %交叉结果变异
       ChildPopulation(i,:) = variation(children(1, :), pm);
       ChildPopulation(i+1,:) = variation(children(2, :), pm);
   end
    %新种群替代上一代，并重新计算适值
    Population = ChildPopulation;
    [pr, ~, v]=Fitness(Population);
    gn = gn + 1;
end
[vmin,nmin]=min(v);
% ymean(gn, :)=mean(v(~isnan(v)));
ymin(gn, :)=vmin;
cmin(gn, :)=Population(nmin,:);
[Min,nMin] = min(ymin);
%计算所有代的最优值
cMin = cmin(nMin,:);
value(cMin);
%绘制求解过程曲线
plot(ymin);hold on