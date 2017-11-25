function [Min]=ga
%clear

inn = 30; %��ʼ��Ⱥ��С
gnmax = 50;  %������
pc = 1; %�������
pm = 0.08; %�������

%������ʼ��Ⱥ
Population = zeros(inn,20);
for i=1:inn
    Population(i,:) = randperm(20);
end

%�����ʼ��Ⱥ��ֵ
[pr, ~, v]=Fitness(Population);

%��ʼ����������
gn=1;

%��¼ÿ�����Ž�
ymean = zeros(gnmax,1);
ymin = zeros(gnmax,1);
cmin = zeros(inn,20);
%ym=1e10;%ȫ�����Ž�
%cm=[];%ȫ�����Ž�����
ChildPopulation = zeros(inn, 20);
while gn < gnmax
   [vmin,nmin]=min(v);
   ymean(gn,:) = mean(v(~isnan(v)));
   ymin(gn, :)=vmin;
   cmin(gn,:)=Population(nmin,:);
   %����ǰ2�����Ž�
   vv = v;
   vv(nmin) = 1e5;
   [~,nnmin] = min(vv);
   ChildPopulation(1,:) = Population(nmin,:);
   ChildPopulation(2,:) = Population(nnmin,:);
   
   %ѡ�񣬽��棬����
   for i = 3:2:inn
        %ѡ�񡢽���
       parent = select(pr);
       children = PMX(Population(parent, :), pc);  %�������
       %����������
       ChildPopulation(i,:) = variation(children(1, :), pm);
       ChildPopulation(i+1,:) = variation(children(2, :), pm);
   end
    %����Ⱥ�����һ���������¼�����ֵ
    Population = ChildPopulation;
    [pr, ~, v]=Fitness(Population);
    gn = gn + 1;
end
[vmin,nmin]=min(v);
% ymean(gn, :)=mean(v(~isnan(v)));
ymin(gn, :)=vmin;
cmin(gn, :)=Population(nmin,:);
[Min,nMin] = min(ymin);
%�������д�������ֵ
cMin = cmin(nMin,:);
value(cMin);
%��������������
plot(ymin);hold on