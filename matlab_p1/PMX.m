function [ chroC ] = PMX( chroP, pc )
%PMX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

if pc > rand()
    length = size(chroP,2);%����
    chroC=chroP;  
    c1=round(rand*(length-2))+1;  %��[1,length-1]��Χ���������һ������λ
    c2=round(rand*(length-2))+1;
    chb1=min(c1,c2);
    chb2=max(c1,c2);
    middle=chroC(1,chb1+1:chb2);
    chroC(1,chb1+1:chb2)=chroC(2,chb1+1:chb2);
    chroC(2,chb1+1:chb2)=middle;
    for i=1:chb1 %�ƺ�������
        while find(chroC(1,chb1+1:chb2)==chroC(1,i))
            zhi=find(chroC(1,chb1+1:chb2)==chroC(1,i));
            y=chroC(2,chb1+zhi);
            chroC(1,i)=y;
        end
        while find(chroC(2,chb1+1:chb2)==chroC(2,i))
            zhi=find(chroC(2,chb1+1:chb2)==chroC(2,i));
            y=chroC(1,chb1+zhi);
            chroC(2,i)=y;
        end
    end
    for i=chb2+1:length
        while find(chroC(1,1:chb2)==chroC(1,i))
            zhi=logical(chroC(1,1:chb2)==chroC(1,i));
            y=chroC(2,zhi);
            chroC(1,i)=y;
        end
        while find(chroC(2,1:chb2)==chroC(2,i))
            zhi=logical(chroC(2,1:chb2)==chroC(2,i));
            y=chroC(1,zhi);
            chroC(2,i)=y;
        end
    end
else
    chroC = chroP;
end

end

