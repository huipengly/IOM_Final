function [ chroC ] = crossover( chroP, pc )
%CROSSOVER 染色体交叉，前20个基因PMX，后8个spc
%   此处显示详细说明

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
