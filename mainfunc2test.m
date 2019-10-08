%test scripts
%下面哪些话出错，就注释掉那一块代码
%在我的电脑上测试都没有问题。

num=92;
FroResult(1:num,1)=0;



for i=1:92
    FroResult(i,1)=mainfunc2(i,0,1,'fro',0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用fro范数分类）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用fro范数分类）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用fro范数分类）.txt',FroResult);

for i=1:92
    FroResult(i,1)=mainfunc2(i,0,1,1,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用1范数分类）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用1范数分类）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用1范数分类）.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,0,1,Inf,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用Inf范数分类）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用Inf范数分类）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用Inf范数分类）.txt',FroResult);




for i=1:92
    FroResult(i,1)=mainfunc2(i,1,1,'fro',0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用fro范数分类）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用fro范数分类）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用fro范数分类）.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,1,1,1,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用1范数分类）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用1范数分类）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用1范数分类）.txt',FroResult);



for i=1:92
    FroResult(i,1)=mainfunc2(i,1,1,Inf,0);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用Inf范数分类）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用Inf范数分类）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用Inf范数分类）.txt',FroResult);



for i=1:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',10);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类10）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类10）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类10）.txt',FroResult);






for i=1:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',10);%10为第一层神经元数
end
g=figure();
    plot(FroResult(:,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类10）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类10）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类10）.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',20);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类20）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类20）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类20）.txt',FroResult);






for i=1:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',20);%20为第一层神经元数
end
g=figure();
    plot(FroResult(:,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类20）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类20）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类20）.txt',FroResult);





for i=1:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',30);
end
g=figure();
    plot(FroResult(:,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类30）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.txt',FroResult);






for i=1:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',30);%30为第一层神经元数
end
g=figure();
    plot(FroResult(:,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.txt',FroResult);






