function [ day, a, b ] = value(x)
%FITNESS �������ֵ
%   �˴���ʾ��ϸ˵��
global p;
global d;

%TODO:�ж�Ƭ���Ƿ�Ϸ�

% q(i)�����i�������ļӹ�˳��
Q=[x(1:20);1:20];
Q1=sortrows(Q',1)';
q=Q1(2,:);

a = [];

%Ѱ�ҵ�һ��ά��ǰ����������a
for i = 1:20
    aaa = sum(p(x(1:i)));
    if aaa > 28
       a = i - 1; 
       break;
    end
end

%Ѱ�ҵ�һ��ά�����ڶ���ά���ڼ����������b
for i = a:20
    if sum(p(x(a+1:i))) > (58 - 29)
       b = i - 1 - a; 
       break;
    end
end

%�ж��Ƿ����㽻���ڣ���������dayֱ�ӷ���NaN
for i = 20:-1:1
   actday = -d(i) + (sum(p(x(1:q(i)))))*(q(i)<=a) + ...
                (30 + sum(p(x(a+1 : q(i))))) * ((a < q(i)) & (q(i) <= a + b)) + ...
                (60 + sum(p(x(a+b+1 : q(i))))) * (a + b < q(i));
    if actday > 0
        day = NaN;
        return;
    end
end

%����������
day = sum(p(x(a+b+1 : 20))) + 60;

end