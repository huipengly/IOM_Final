function [ chroC ] = crossover( chroP, pc )
%CROSSOVER Ⱦɫ�彻�棬ǰ20������PMX����8��spc
%   �˴���ʾ��ϸ˵��

if pc > rand()
    chroPa = chroP(:,1:20);
    chroPb = chroP(:,21:28);
    chroCa = PMX(chroPa, 1);
    chroCb = spc(chroPb);
    chroC = [chroCa chroCb];
else
    chroC = chroP;
end

end
