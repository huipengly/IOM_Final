function [ newchro ] = variation( chro, pm )
%VARIATION 变异函数
%   在[1,length-1]范围内产生两个变异位，变异位之间左右翻转

newchro = chro;

if pm > rand()
    length = size(chro,2);%列数
   r1=round(rand*(length-2))+1;  %在[1,length-1]范围内随机产生一个变异位  
   r2=round(rand*(length-2))+1;  
   chr1=min(r1,r2);  
   chr2=max(r1,r2);  
   x=chro(chr1+1:chr2);  
   newchro(chr1+1:chr2)=fliplr(x);%变异位之间左右翻转
end


end