function FroResult=mainfunc2(svdk,isfft,isfronorm,norntype,netid)
%%main scripts
clc;%清屏
close all;%关闭所有窗口
%%初始化变量
%人脸类别数
ifacenum=40;
%单人人脸总数
iperfacenum=10;
%训练人脸数
ifacetrain=4;%<iperfacenum
%灰度均一化参数
meangray=0;%都为零表示使用总体均值
thetagray=0;
%SVD投影参数
%svdk=30;
%isfft=1;
%isfronorm=0;
%netid=20;



%%获得所有图片路径

%获得所有随机图片序列
trainindexs=[];
testindexs=[];
for i=1:ifacenum
    pnum=randnofm(iperfacenum,iperfacenum);
    trainindexs=[trainindexs;pnum(1,1:ifacetrain)];
    testindexs=[testindexs;pnum(1,ifacetrain+1:iperfacenum)];
end
%获得训练图片路径
trainpath=makepath(trainindexs);
%获得检测图片路径
testpath=makepath(testindexs);%如果进行单图测试将其修改为单图路径

%%获得所有像素
trainpool=getpiexpool(trainpath,'gray');
testpool=getpiexpool(testpath,'gray');


figure();
subplot(2,2,1);
imshow(trainpool{1,1});
title('原图');
subplot(2,2,2);
imshow(trainpool{1,1});
title('初始灰度图');

%%进行均一化
%计算各个图片的灰度均值与方差
graymt(1:ifacenum,1:iperfacenum,1:2)=0;
for i=1:ifacenum
    for j=1:ifacetrain
        graymt(i,j,:)=getgraymt(trainpool{i,j});
    end
    for j=ifacetrain+1:iperfacenum
        graymt(i,j,:)=getgraymt(testpool{i,j-ifacetrain});
    end
end
%获得总体图片的归一化均值与方差
if meangray==0||thetagray==0
    amt=mean(mean(graymt,1),2);%获得均值作为新的灰度均值与方差
    amt(1,1:2)=amt(1,1,1:2);%调用方便
else    
    amt=[meangray,thetagray];%设定值
end
%进行各个图片的灰度归一化
for i=1:ifacenum
    for j=1:ifacetrain
       trainpool{i,j}=graymeanstheta(trainpool{i,j},graymt(i,j,:),amt);
    end
    for j=ifacetrain+1:iperfacenum
       testpool{i,j-ifacetrain}=graymeanstheta(testpool{i,j-ifacetrain},graymt(i,j,:),amt);
    end
end

subplot(2,2,3);
imshow(trainpool{1,1});
title('归一化灰度图');

%%获得傅里叶谱
%进行傅立叶变换
if isfft==1
for i=1:ifacenum
    for j=1:ifacetrain
       ffttrainpool{i,j}=fft2(trainpool{i,j});
    end
    for j=1:iperfacenum-ifacetrain
       ffttestpool{i,j}=fft2(testpool{i,j});
    end
end
%获得振幅谱
for i=1:ifacenum
    for j=1:ifacetrain
       absffttrainpool{i,j}=abs(ffttrainpool{i,j});%对傅立叶变换矩阵元素求模获得傅立叶矩阵的振幅谱
    end
    for j=1:iperfacenum-ifacetrain
       absffttestpool{i,j}=abs(ffttestpool{i,j});
    end
end
dealtrainpool=absffttestpool;
else
dealtrainpool=trainpool; 
absffttestpool=testpool;
end

subplot(2,2,4);
imshow(mat2gray(dealtrainpool{1,1}));
title('振幅谱图');
%获得标准振幅谱
%获得图片大小
[imrow,imcol]=size(dealtrainpool{1,1});
normalface(1:imrow,1:imcol)=0;
for i=1:ifacenum
    for j=1:ifacetrain
        normalface=normalface+double(dealtrainpool{i,j});
    end
end
normalface=normalface/ifacenum/ifacetrain;


%%对标准脸进行SVD分解
[normalU,normalS,normalV]=svd(normalface);



if isfronorm==1
%%求得各个人脸的振幅谱
for i=1:ifacenum
    perface{i,1}=zeros(imrow,imcol);
    for j=1:ifacetrain
        perface{i,1}=perface{i,1}+double(dealtrainpool{i,j});
    end
     perface{i,1}= perface{i,1}/ifacetrain;
end
else
    perface=dealtrainpool;
end
%%对其他脸进行svd投影
[ifacenum,ifaceuse]=size(perface);
for i=1:ifacenum
    for j=1:ifaceuse
        perfaceproject{i,j}=normalU(1:svdk,:)*double(perface{i,j})*normalV(1:svdk,:)';
    end
end

%%对测试的不同的脸进行进行svd投影
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
       projecttest{i,j}=normalU(1:svdk,:)*double(absffttestpool{i,j})*normalV(1:svdk,:)';
    end
end

%%求出测试的不同的脸的Frobenius范数
if isfronorm==1
Fronum(1:ifacenum,1:iperfacenum-ifacetrain,1:ifacenum)=0;
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
        for k=1:ifacenum
            Fronum(i,j,k)=norm(double(projecttest{i,j})-double(perfaceproject{k,1}),norntype);
        end
    end
end

%%对结果进行判断获得具体分类结果
FroIden(1:ifacenum,1:iperfacenum-ifacetrain)=0;
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
        minFro=min(Fronum(i,j,:));
        for k=1:ifacenum
             if Fronum(i,j,k)==minFro
                 FroIden(i,j)=k;
             end
        end
    end
end
else
    Xtrain(1:svdk*svdk,1:ifacenum*ifaceuse)=0;
    Xid(1,1:ifacenum*ifaceuse)=0;
    Xtest(1:svdk*svdk,1:ifacenum*(iperfacenum-ifacetrain))=0;
    Xid2(1,1:ifacenum*(iperfacenum-ifacetrain))=0;
for i=1:ifacenum
    for j=1:ifaceuse
       Xtrain(:,(i-1)*ifaceuse+j)=reshape(perfaceproject{i,j},svdk*svdk,1);
       Xid(1,(i-1)*ifaceuse+j)=i;
    end
    for j=1:iperfacenum-ifacetrain
        Xtest(:,(i-1)*(iperfacenum-ifacetrain)+j)=reshape(projecttest{i,j},svdk*svdk,1); 
        Xid2(1,(i-1)*(iperfacenum-ifacetrain)+j)=i;
    end
end
   FroIdenline=bpnet(Xtrain',Xid',netid,ifacenum,Xtest'); 
   FroIden(1:ifacenum,1:iperfacenum-ifacetrain)=0;
   for i=1:ifacenum
       FroIden(i,:)=FroIdenline(1,(i-1)*(iperfacenum-ifacetrain)+1:i*(iperfacenum-ifacetrain));
   end
end




%%输出结果
FroResult(1:ifacenum,1)=0;
fid=fopen('data.txt','w');
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
        if FroIden(i,j)==i
            FroResult(i,1)=FroResult(i,1)+1;
        end
        fprintf(fid,'%f\t',FroIden(i,j));
    end
    fprintf(fid,'\n');
end
fclose(fid);
FroResult=FroResult/(iperfacenum-ifacetrain);
FroResult=mean(FroResult);
end




