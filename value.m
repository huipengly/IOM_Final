function [ day, a, b ] = value(x)
%FITNESS 计算个体值
%   此处显示详细说明
global p;
global d;

%TODO:判断片段是否合法

% q(i)代表第i个工件的加工顺序
Q=[x(1:20);1:20];
Q1=sortrows(Q',1)';
q=Q1(2,:);

a = [];

%寻找第一次维护前的生产个数a
for i = 1:20
    aaa = sum(p(x(1:i)));
    if aaa > 28
       a = i - 1; 
       break;
    end
end

%寻找第一次维护到第二次维护期间的生产个数b
for i = a:20
    if sum(p(x(a+1:i))) > (58 - 29)
       b = i - 1 - a; 
       break;
    end
end

%判断是否满足交货期，不满足则day直接返回NaN
for i = 20:-1:1
   actday = -d(i) + (sum(p(x(1:q(i)))))*(q(i)<=a) + ...
                (30 + sum(p(x(a+1 : q(i))))) * ((a < q(i)) & (q(i) <= a + b)) + ...
                (60 + sum(p(x(a+b+1 : q(i))))) * (a + b < q(i));
    if actday > 0
        day = NaN;
        return;
    end
end

%返回总日期
day = sum(p(x(a+b+1 : 20))) + 60;

end