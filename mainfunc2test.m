%test scripts
%������Щ��������ע�͵���һ�����
%���ҵĵ����ϲ��Զ�û�����⡣

num=92;
FroResult(1:num,1)=0;



for i=1:92
    FroResult(i,1)=mainfunc2(i,0,1,'fro',0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��fro�������ࣩ');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��fro�������ࣩ.jpg');
matwrite('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��fro�������ࣩ.txt',FroResult);

for i=1:92
    FroResult(i,1)=mainfunc2(i,0,1,1,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��1�������ࣩ');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��1�������ࣩ.jpg');
matwrite('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��1�������ࣩ.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,0,1,Inf,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��Inf�������ࣩ');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��Inf�������ࣩ.jpg');
matwrite('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��Inf�������ࣩ.txt',FroResult);




for i=1:92
    FroResult(i,1)=mainfunc2(i,1,1,'fro',0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��fro�������ࣩ');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��fro�������ࣩ.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��fro�������ࣩ.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,1,1,1,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��1�������ࣩ');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��1�������ࣩ.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��1�������ࣩ.txt',FroResult);



for i=1:92
    FroResult(i,1)=mainfunc2(i,1,1,Inf,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��Inf�������ࣩ');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��Inf�������ࣩ.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ��Inf�������ࣩ.txt',FroResult);



for i=1:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',10);
end
g=figure();
    plot(FroResult(:,1)*100);
title('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������10��');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������10��.jpg');
matwrite('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������10��.txt',FroResult);






for i=1:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',10);%10Ϊ��һ����Ԫ��
end
g=figure();
    plot(FroResult(:,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������10��');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������10��.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������10��.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',20);
end
g=figure();
    plot(FroResult(:,1)*100);
title('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������20��');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������20��.jpg');
matwrite('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������20��.txt',FroResult);






for i=1:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',20);%20Ϊ��һ����Ԫ��
end
g=figure();
    plot(FroResult(:,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������20��');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������20��.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������20��.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',30);
end
g=figure();
    plot(FroResult(:,1)*100);
title('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��.jpg');
matwrite('���޸���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��.txt',FroResult);






for i=1:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',30);%30Ϊ��һ����Ԫ��
end
g=figure();
    plot(FroResult(:,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��.txt',FroResult);






