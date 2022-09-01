
%ÊÊÓ¦¶Èº¯Êý

function F=CalculateDistance(distance_list,s)

DistanV=0;
m=size(s,2);
for i=1:(m-1)
    DistanV=DistanV+distance_list(s(i),s(i+1));
end
DistanV=DistanV+distance_list(s(m),s(1));
F=DistanV;

end
