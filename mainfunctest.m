%test scripts
num=92;
FroResult(1:num,1)=0;
for i=1:92
    FroResult(i,1)=mainfunc(i,'fro');
end
    plot(FroResult(:,1));