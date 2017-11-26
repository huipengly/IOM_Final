function [ chroC ] = spc( chroP )
%SPC �����ƴ��뵥�е㽻��single-point crossover
%   �˴���ʾ��ϸ˵��

length = size(chroP, 2);

r1 = round((length-1)*rand()) + 1;
chroC = chroP;
chroC([2 1],r1:end) = chroC([1 2],r1:end);

end