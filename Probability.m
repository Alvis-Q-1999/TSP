
%���ݱ���/��������ж��Ƿ����/����

function crossing_Flag=Probability(crossing_probability)
test(1:100)=0;
l=round(100*crossing_probability);
test(1:l)=1;
n=round(rand*99)+1;
crossing_Flag=test(n);   
end
