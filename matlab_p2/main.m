%�Ŵ��㷨����������Ҫʵ�ֶ��㷨�Ķ�ε��ã��������ý����ͼ��
%m����ͳ�Ƹ�����ĸ���������m(1)Ϊ��С�Ľ�ĸ�����m(10)Ϊ�޽�������

%����һֱ����pi��di
clear;close all;
load p.mat
load d.mat
tic
n = 100;
dd = zeros(1,n);
m = zeros(1,10);
%ѭ������1000��
for i = 1:n
   dd(i) = ga;
end
% %����������ͼ
% figure(2)
% plot(d,'*');
% %ͳ�ƽ�ĸ���
% for j=1:max(d)-min(d)+1
%    m(j)= sum(d==(j-1+min(d)));
% end
% m(10)= sum(isnan(d));
toc