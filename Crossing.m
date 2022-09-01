
%交叉”操作

function s_crossing=Crossing(s,selections,crossing_probability)

BN=size(s,2);
crossing_Flag=Probability(crossing_probability);  %根据交叉概率决定是否进行交叉操作，1则是，0则否
s_crossing(1,:)=s(selections(1),:);
s_crossing(2,:)=s(selections(2),:);
if crossing_Flag==1
   child1=round(rand*(BN-2))+1;  %在[1,bn-1]范围内随机产生一个交叉位
   child2=round(rand*(BN-2))+1;
   child_b1=min(child1,child2);
   child_b2=max(child1,child2);
   middle=s_crossing(1,child_b1+1:child_b2);
   s_crossing(1,child_b1+1:child_b2)=s_crossing(2,child_b1+1:child_b2);
   s_crossing(2,child_b1+1:child_b2)=middle;
   for i=1:child_b1 
       while find(s_crossing(1,child_b1+1:child_b2)==s_crossing(1,i))
           x=find(s_crossing(1,child_b1+1:child_b2)==s_crossing(1,i));
           y=s_crossing(2,child_b1+x);
           s_crossing(1,i)=y;
       end
       while find(s_crossing(2,child_b1+1:child_b2)==s_crossing(2,i))
           x=find(s_crossing(2,child_b1+1:child_b2)==s_crossing(2,i));
           y=s_crossing(1,child_b1+x);
           s_crossing(2,i)=y;
       end
   end
   for i=child_b2+1:BN
       while find(s_crossing(1,1:child_b2)==s_crossing(1,i))
           x=logical(s_crossing(1,1:child_b2)==s_crossing(1,i));
           y=s_crossing(2,x);
           s_crossing(1,i)=y;
       end
       while find(s_crossing(2,1:child_b2)==s_crossing(2,i))
           x=logical(s_crossing(2,1:child_b2)==s_crossing(2,i));
           y=s_crossing(1,x);
           s_crossing(2,i)=y;
       end
   end
end
end
