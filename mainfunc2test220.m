
di=2;
es=46;




for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',30);%30Ϊ��һ����Ԫ��
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��20');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��20.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������30��20.txt',FroResult);








for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',40);%10Ϊ��һ����Ԫ��
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������40��20');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������40��20.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������40��20.txt',FroResult);







for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',50);%20Ϊ��һ����Ԫ��
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������50��20');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������50��20.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������50��20.txt',FroResult);







for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',60);%60Ϊ��һ����Ԫ��
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������60��20');
ylabel('׼ȷ��(%)');
xlabel('svdk�ı仯');
saveas(g,'�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������60��20.jpg');
matwrite('�ڸ���Ҷ�任ʱ׼ȷ����svdk�ı仯��ʹ�����������60��20.txt',FroResult);






