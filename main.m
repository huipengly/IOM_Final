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

[f,p]=Fitness(Population,dislist);

gn=1;

ChildPopulation = zeros(inn, 20);
while gn <= gnmax
    for i = 1:2:inn
        %����
       parent = select(p);
       %scro=cro(s,seln,pc);  %�������
       %����������
       ChildPopulation(i,:) = variation(children(1), pm);
       ChildPopulation(i+1,:) = variation(children(2), pm);
    end
    Population = ChildPopulation;
    [f,p]=Fitness(Population,dislist);
    %TODO:fitness�������޸ģ�����Ⱦɫ�壬�������
end