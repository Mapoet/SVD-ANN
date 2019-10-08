
di=5;




for i=1:di:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',30);
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类30）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.txt',FroResult);






for i=1:di:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',30);%30为第一层神经元数
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）.txt',FroResult);









for i=1:di:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',40);
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类40）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类40）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类40）.txt',FroResult);






for i=1:di:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',40);%10为第一层神经元数
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类40）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类40）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类40）.txt',FroResult);





for i=1:di:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',50);
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类50）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类50）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类50）.txt',FroResult);






for i=1:di:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',50);%20为第一层神经元数
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类50）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类50）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类50）.txt',FroResult);





for i=1:di:92
    FroResult(i,1)=mainfunc2(i,0,0,'fro',60);
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类60）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在无傅立叶变换时准确性随svdk的变化（使用神经网络分类60）.jpg');
matwrite('在无傅立叶变换时准确性随svdk的变化（使用神经网络分类60）.txt',FroResult);






for i=1:di:92
    FroResult(i,1)=mainfunc2(i,1,0,'fro',60);%60为第一层神经元数
end
g=figure();
    plot(1:di:92,FroResult(1:di:92,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类60）');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类60）.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类60）.txt',FroResult);






