%遗传算法主函数，主要实现对算法的多次调用，并将调用结果绘图。
%m用来统计各个解的个数，例如m(1)为最小的解的个数。m(10)为无解的情况。

%加载一直条件pi和di
clear;
load p.mat
load d.mat
clear;close all;
tic
d = zeros(1,100);
m = zeros(1,10);
%循环运行1000次
for i = 1:1000
   d(i) = ga;
end
%绘制求解情况图
figure(2)
plot(d,'*');
%统计解的个数
for j=1:max(d)-min(d)+1
   m(j)= sum(d==(j-1+min(d)));
end
m(10)= sum(isnan(d));
toc