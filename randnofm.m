function randindex = randnofm(m,n)
%%获得m以内的随机数（返回n个）且n小于m
randindex=[];
u=0;
while 1
    sz=size(randindex,2);
    while 1 
        p=0;
        srad=ceil(rand()*m);
        for i=1:sz
            if srad==randindex(1,i)
                p=1;  
            end
        end
        if p==0
            break;
        end
    end
    randindex=[randindex,srad];
    u=u+1;
    if u==n
        break;
   end
end
end

