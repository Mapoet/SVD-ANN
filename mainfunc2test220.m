
di=2;
es=46;




for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',30);%30为第一层神经元数
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）20');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）20.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类30）20.txt',FroResult);








for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',40);%10为第一层神经元数
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类40）20');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类40）20.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类40）20.txt',FroResult);







for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',50);%20为第一层神经元数
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类50）20');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类50）20.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类50）20.txt',FroResult);







for i=21:di:es
    FroResult(i,1)=mainfunc2(i,1,0,'fro',60);%60为第一层神经元数
end
g=figure();
    plot(21:di:es,FroResult(21:di:es,1)*100);
title('在傅立叶变换时准确性随svdk的变化（使用神经网络分类60）20');
ylabel('准确率(%)');
xlabel('svdk的变化');
saveas(g,'在傅立叶变换时准确性随svdk的变化（使用神经网络分类60）20.jpg');
matwrite('在傅立叶变换时准确性随svdk的变化（使用神经网络分类60）20.txt',FroResult);






