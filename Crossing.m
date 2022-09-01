
%���桱����

function s_crossing=Crossing(s,selections,crossing_probability)

BN=size(s,2);
crossing_Flag=Probability(crossing_probability);  %���ݽ�����ʾ����Ƿ���н��������1���ǣ�0���
s_crossing(1,:)=s(selections(1),:);
s_crossing(2,:)=s(selections(2),:);
if crossing_Flag==1
   child1=round(rand*(BN-2))+1;  %��[1,bn-1]��Χ���������һ������λ
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
