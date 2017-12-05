function [ day, a, b, s ] = value(x)
%FITNESS 计算个体值
%   此处显示详细说明
global p;
global d;

%TODO:判断片段是否合法

%解码维护时间
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

% q(i)代表第i个工件的加工顺序
Q=[x(1:20);1:20];
Q1=sortrows(Q',1)';
q=Q1(2,:);

a = [];

%寻找第一次维护前的生产个数a
for i = 1:20
    if sum(p(x(1:i))) > s(1)-1
       a = i - 1; 
       break;
    end
end

%寻找第一次维护到第二次维护期间的生产个数b
for i = a:20
    if sum(p(x(a+1:i))) > (s(2) - s(1) - 1)
       b = i - 1 - a; 
       break;
    end
end

%判断是否满足交货期，不满足则day直接返回NaN
for i = 1:20
   actday = -d(i) + (sum(p(x(1:q(i)))))*(q(i)<=a) + ...
                (s(1) + 1 + sum(p(x(a+1 : q(i))))) * ((a < q(i)) & (q(i) <= a + b)) + ...
                (s(2) + 1 + sum(p(x(a+b+1 : q(i))))) * (a + b < q(i));
    if actday > 0
        day = NaN;
        return;
    end
end

%返回总日期
day = sum(p(x(a+b+1 : 20))) + s(2);

end