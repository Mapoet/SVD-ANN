function FroResult=mainfunc2(svdk,isfft,isfronorm,norntype,netid)
%%main scripts
clc;%����
close all;%�ر����д���
%%��ʼ������
%���������
ifacenum=40;
%������������
iperfacenum=10;
%ѵ��������
ifacetrain=4;%<iperfacenum
%�ҶȾ�һ������
meangray=0;%��Ϊ���ʾʹ�������ֵ
thetagray=0;
%SVDͶӰ����
%svdk=30;
%isfft=1;
%isfronorm=0;
%netid=20;



%%�������ͼƬ·��

%����������ͼƬ����
trainindexs=[];
testindexs=[];
for i=1:ifacenum
    pnum=randnofm(iperfacenum,iperfacenum);
    trainindexs=[trainindexs;pnum(1,1:ifacetrain)];
    testindexs=[testindexs;pnum(1,ifacetrain+1:iperfacenum)];
end
%���ѵ��ͼƬ·��
trainpath=makepath(trainindexs);
%��ü��ͼƬ·��
testpath=makepath(testindexs);%������е�ͼ���Խ����޸�Ϊ��ͼ·��

%%�����������
trainpool=getpiexpool(trainpath,'gray');
testpool=getpiexpool(testpath,'gray');


figure();
subplot(2,2,1);
imshow(trainpool{1,1});
title('ԭͼ');
subplot(2,2,2);
imshow(trainpool{1,1});
title('��ʼ�Ҷ�ͼ');

%%���о�һ��
%�������ͼƬ�ĻҶȾ�ֵ�뷽��
graymt(1:ifacenum,1:iperfacenum,1:2)=0;
for i=1:ifacenum
    for j=1:ifacetrain
        graymt(i,j,:)=getgraymt(trainpool{i,j});
    end
    for j=ifacetrain+1:iperfacenum
        graymt(i,j,:)=getgraymt(testpool{i,j-ifacetrain});
    end
end
%�������ͼƬ�Ĺ�һ����ֵ�뷽��
if meangray==0||thetagray==0
    amt=mean(mean(graymt,1),2);%��þ�ֵ��Ϊ�µĻҶȾ�ֵ�뷽��
    amt(1,1:2)=amt(1,1,1:2);%���÷���
else    
    amt=[meangray,thetagray];%�趨ֵ
end
%���и���ͼƬ�ĻҶȹ�һ��
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
title('��һ���Ҷ�ͼ');

%%��ø���Ҷ��
%���и���Ҷ�任
if isfft==1
for i=1:ifacenum
    for j=1:ifacetrain
       ffttrainpool{i,j}=fft2(trainpool{i,j});
    end
    for j=1:iperfacenum-ifacetrain
       ffttestpool{i,j}=fft2(testpool{i,j});
    end
end
%��������
for i=1:ifacenum
    for j=1:ifacetrain
       absffttrainpool{i,j}=abs(ffttrainpool{i,j});%�Ը���Ҷ�任����Ԫ����ģ��ø���Ҷ����������
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
title('�����ͼ');
%��ñ�׼�����
%���ͼƬ��С
[imrow,imcol]=size(dealtrainpool{1,1});
normalface(1:imrow,1:imcol)=0;
for i=1:ifacenum
    for j=1:ifacetrain
        normalface=normalface+double(dealtrainpool{i,j});
    end
end
normalface=normalface/ifacenum/ifacetrain;


%%�Ա�׼������SVD�ֽ�
[normalU,normalS,normalV]=svd(normalface);



if isfronorm==1
%%��ø��������������
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
%%������������svdͶӰ
[ifacenum,ifaceuse]=size(perface);
for i=1:ifacenum
    for j=1:ifaceuse
        perfaceproject{i,j}=normalU(1:svdk,:)*double(perface{i,j})*normalV(1:svdk,:)';
    end
end

%%�Բ��ԵĲ�ͬ�������н���svdͶӰ
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
       projecttest{i,j}=normalU(1:svdk,:)*double(absffttestpool{i,j})*normalV(1:svdk,:)';
    end
end

%%������ԵĲ�ͬ������Frobenius����
if isfronorm==1
Fronum(1:ifacenum,1:iperfacenum-ifacetrain,1:ifacenum)=0;
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
        for k=1:ifacenum
            Fronum(i,j,k)=norm(double(projecttest{i,j})-double(perfaceproject{k,1}),norntype);
        end
    end
end

%%�Խ�������жϻ�þ��������
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




%%������
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




