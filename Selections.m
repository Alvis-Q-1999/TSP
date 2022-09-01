
%选择操作

function selections=Selections(probability)

selections=zeros(2,1);
%从种群中选择两个个体，最好不要两次选择同一个个体
for i=1:2
   random=rand;  %产生一个随机数
   p_rand=probability-random;
   j=1;
   while p_rand(j)<0
       j=j+1;
   end
   selections(i)=j; %选中个体的序号
   if i==2&&j==selections(i-1)    %%若相同就再选一次
       random=rand;  %产生一个随机数
       p_rand=probability-random;
       j=1;
       while p_rand(j)<0
           j=j+1;
       end
   end
end
end
