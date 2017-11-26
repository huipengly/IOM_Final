function [ chroC ] = spc( chroP )
%SPC 二进制代码单切点交叉single-point crossover
%   此处显示详细说明

length = size(chroP, 2);

r1 = round((length-1)*rand()) + 1;
chroC = chroP;
chroC([2 1],r1:end) = chroC([1 2],r1:end);

end