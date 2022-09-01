
%计算所有种群的适应度

function [fitness,probability]=Fitness(s,distance_list)

population=size(s,1);
fitness=zeros(population,1);
for i=1:population
   fitness(i)=CalculateDistance(distance_list,s(i,:));
end
fitness=1000./fitness';


fitness_sum=0;
for i=1:population
   fitness_sum=fitness_sum+fitness(i)^15;
end
population_s=zeros(population,1);
for i=1:population
   population_s(i)=fitness(i)^15/fitness_sum;
end

%计算累积概率
probability=zeros(population,1);
probability(1)=population_s(1);
for i=2:population
   probability(i)=probability(i-1)+population_s(i);
end
probability=probability';
end
