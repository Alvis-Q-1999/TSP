
%ѡ�����

function selections=Selections(probability)

selections=zeros(2,1);
%����Ⱥ��ѡ���������壬��ò�Ҫ����ѡ��ͬһ������
for i=1:2
   random=rand;  %����һ�������
   p_rand=probability-random;
   j=1;
   while p_rand(j)<0
       j=j+1;
   end
   selections(i)=j; %ѡ�и�������
   if i==2&&j==selections(i-1)    %%����ͬ����ѡһ��
       random=rand;  %����һ�������
       p_rand=probability-random;
       j=1;
       while p_rand(j)<0
           j=j+1;
       end
   end
end
end
