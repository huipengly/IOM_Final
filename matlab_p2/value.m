function [ day, a, b, s ] = value(x)
%FITNESS �������ֵ
%   �˴���ʾ��ϸ˵��
global p;
global d;

%TODO:�ж�Ƭ���Ƿ�Ϸ�

%����ά��ʱ��
s(1)=25 + sum(x(:,21:24).*2.^(3:-1:0));
s(2)=55 + sum(x(:,25:28).*2.^(3:-1:0));
if s(1)>35
    day = NaN;
    a = [];
    b = [];
    s = NaN;
    return
end
if s(2) > 65
    day = NaN;
    a = [];
    b = [];
    s = NaN;
    return
end

x=x(1:20);

% q(i)�����i�������ļӹ�˳��
Q=[x(1:20);1:20];
Q1=sortrows(Q',1)';
q=Q1(2,:);

a = [];

%Ѱ�ҵ�һ��ά��ǰ����������a
for i = 1:20
    if sum(p(x(1:i))) > s(1)-1
       a = i - 1; 
       break;
    end
end

%Ѱ�ҵ�һ��ά�����ڶ���ά���ڼ����������b
for i = a:20
    if sum(p(x(a+1:i))) > (s(2) - s(1) - 1)
       b = i - 1 - a; 
       break;
    end
end

%�ж��Ƿ����㽻���ڣ���������dayֱ�ӷ���NaN
for i = 1:20
   actday = -d(i) + (sum(p(x(1:q(i)))))*(q(i)<=a) + ...
                (s(1) + 1 + sum(p(x(a+1 : q(i))))) * ((a < q(i)) & (q(i) <= a + b)) + ...
                (s(2) + 1 + sum(p(x(a+b+1 : q(i))))) * (a + b < q(i));
    if actday > 0
        day = NaN;
        return;
    end
end

%����������
day = sum(p(x(a+b+1 : 20))) + s(2);

end