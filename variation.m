function [ newchro ] = variation( chro, pm )
%VARIATION ���캯��
%   ��[1,length-1]��Χ�ڲ�����������λ������λ֮�����ҷ�ת

newchro = chro;

if pm > rand()
    length = size(chro,2);%����
   r1=round(rand*(length-2))+1;  %��[1,length-1]��Χ���������һ������λ  
   r2=round(rand*(length-2))+1;  
   chr1=min(r1,r2);  
   chr2=max(r1,r2);  
   x=chro(chr1+1:chr2);  
   newchro(chr1+1:chr2)=fliplr(x);%����λ֮�����ҷ�ת
end


end