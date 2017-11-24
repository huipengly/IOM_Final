clear;
tic
load p.mat
load d.mat

inn=30; %��ʼ��Ⱥ��С
gnmax=500;  %������
pc=0.8; %�������
pm=0.08; %�������

%������ʼ��Ⱥ
Population=zeros(inn,20);
for i=1:inn
    Population(i,:)=randperm(20);
end

[pr, f, v]=Fitness(Population);

gn=1;

ymean=zeros(gnmax,1);  
ymin=zeros(gnmax,1);  
xmin=zeros(inn,20);  
ChildPopulation = zeros(inn, 20);
while gn <= gnmax
   [vmin,nmin]=min(v);
   if ~isnan(vmin)
       aaa = 1;
   end
   ymean(gn)=mean(v(~isnan(v)));
   ymin(gn)=vmin;
   x=Population(nmin,:);
   xmin(gn,:)=x;
    for i = 1:2:inn
        %����
       parent = select(pr);
       children = PMX(Population(parent, :), pc);  %�������
       %����������
       aa = variation(children(1, :), pm);
       bb = variation(children(2, :), pm);
       ChildPopulation(i,:) = aa;
       ChildPopulation(i+1,:) = bb;
%        ChildPopulation(i,:) = variation(children(1, :), pm);
%        ChildPopulation(i+1,:) = variation(children(2, :), pm);
    end
    Population = ChildPopulation;
    [pr, f]=Fitness(Population);
    gn = gn + 1
end
x
value(x)
toc