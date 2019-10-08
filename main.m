%%main scripts
clc;%����
clear;%�������
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
svdk=60;




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


subplot(2,2,4);
imshow(mat2gray(absffttrainpool{1,1}));
title('�����ͼ');
%��ñ�׼�����
%���ͼƬ��С
[imrow,imcol]=size(absffttrainpool{1,1});
normalface(1:imrow,1:imcol)=0;
for i=1:ifacenum
    for j=1:ifacetrain
        normalface=normalface+double(absffttrainpool{i,j});
    end
end
normalface=normalface/ifacenum/ifacetrain;


%%�Ա�׼������SVD�ֽ�
[normalU,normalS,normalV]=svd(normalface);

%%��ø��������������
for i=1:ifacenum
    perface(1:imrow,1:imcol,i)=0;
    for j=1:ifacetrain
        perface(1:imrow,1:imcol,i)=perface(1:imrow,1:imcol,i)+double(absffttrainpool{i,j});
    end
     perface(1:imrow,1:imcol,i)= perface(1:imrow,1:imcol,i)/ifacetrain;
end

%%������������svdͶӰ
for i=1:ifacenum
    perfaceproject{i}=normalU(1:svdk,:)*perface(1:imrow,1:imcol,i)*normalV(1:svdk,:)';
end

%%�Բ��ԵĲ�ͬ�������н���svdͶӰ
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
       projecttest{i,j}=normalU(1:svdk,:)*double(absffttestpool{i,j})*normalV(1:svdk,:)';
    end
end

%%������ԵĲ�ͬ������Frobenius����
Fronum(1:ifacenum,1:iperfacenum-ifacetrain,1:ifacenum)=0;
for i=1:ifacenum
    for j=1:iperfacenum-ifacetrain
        for k=1:ifacenum
            Fronum(i,j,k)=norm(double(projecttest{i,j})-double(perfaceproject{k}),-Inf);
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
FroResult
mean(FroResult)





