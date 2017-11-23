function [ c, ceq ] = nonlcon( x )
%NONLCON 此处显示有关此函数的摘要
%   此处显示详细说明
global p;
global d;
if x(21) + x(22) > 20
    %当a,b值大于20，直接返回全为正，则不满足约束
    c = ones(1,25);
    ceq = [];
   return 
end
Q=[x(1:20);1:20];
Q1=sortrows(Q',1)';
q=Q1(2,:);
c(1) = sum(p(x(1:x(21)))) - x(24);
c(2) = sum(p(x(x(21) + 1: x(21) + x(22)))) + x(24) - x(25);
for i = 1:20
   c(i + 2) = -d(i) + (sum(p(x(1:q(i)))))*(q(i)<=x(21)) + ...
                (x(24) + sum(p(x(x(21)+1 : q(i))))) * ((x(21) < q(i)) & (q(i) <= x(21) + x(22))) + ...
                (x(25) + sum(p(x(x(21) + x(22) + 1 : q(i))))) * (x(21) + x(22) < q(i));
end
m1=repmat(x(1:20),20,1);
ii=repmat(1:20,20,1)';
c(23) = -sum(prod(m1 - ii)) - 1e-10;
c(24) = sum(prod(m1 - ii)) - 1e-10;
c(25) = -(x(21) + x(22) + x(23) - 20) - 1e-10;
c(26) = x(21) + x(22) + x(23) - 20 - 1e-10;
c(27) = -(x(24) - 29) - 1e-10;
c(28) = x(24) - 29 - 1e-10;
c(27) = -(x(25) - 59) - 1e-10;
c(28) = x(25) - 59 - 1e-10;

ceq = [];

% ceq(1) = sum(prod(m1 - ii));
% ceq(2) = x(21) + x(22) + x(23) - 20;
end

