function trainpath=makepath(trainindex)
%获得指定下标的文件路径
currPath = fileparts(mfilename('fullpath'));
[m,n]=size(trainindex);
for i=1:m
    for j=1:n
        trainpath{i,j}=strcat(currPath,'\ORL\s',num2str(i),'\',num2str(trainindex(i,j)),'.bmp');
    end
end
end