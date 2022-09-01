
%±äÒì²Ù×÷

function s_nnew=Mutation(s_new,mutation_probability)

BN=size(s_new,2);
s_nnew=s_new;

mutation_Flag=Probability(mutation_probability); 
if mutation_Flag==1
   child1=round(rand*(BN-2))+1;  
   child2=round(rand*(BN-2))+1;
   child_b1=min(child1,child2);
   child_b2=max(child1,child2);
   x=s_new(child_b1+1:child_b2);
   s_nnew(child_b1+1:child_b2)=fliplr(x);
end
end
