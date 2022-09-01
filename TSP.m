
function TSP

city_num=10; %10, 20，30, 50, 70
[distance_list,city_list]=Create_City(city_num);

population=30;
max_generation=200;
crossing_probability=0.8; %交叉概率
mutation_probability=0.8; %变异概率

%生成种群
s=zeros(population,city_num);
for i=1:population
    s(i,:)=randperm(city_num);
end
[~,probability]=Fitness(s,distance_list);

generation=1;
y_average=zeros(generation,1);
y_max=zeros(generation,1);
x_max=zeros(population,city_num);
sc_new=zeros(population,city_num);
sm_new=zeros(population,city_num);
while generation<max_generation+1
   for j=1:2:population
      selections=Selections(probability);  %选择操作
      s_crossing=Crossing(s,selections,crossing_probability);  %交叉操作
      sc_new(j,:)=s_crossing(1,:);
      sc_new(j+1,:)=s_crossing(2,:);
      sm_new(j,:)=Mutation(sc_new(j,:),mutation_probability);  %变异操作
      sm_new(j+1,:)=Mutation(sc_new(j+1,:),mutation_probability);
   end
   s=sm_new;  %生成新种群
   [fitness,probability]=Fitness(s,distance_list);  %计算新种群适应度
   %记录当前代最好和平均的适应度
   [fitness_max,nmax]=max(fitness);
   y_average(generation)=1000/mean(fitness);
   y_max(generation)=1000/fitness_max;
   %记录当前代的最佳个体
   x=s(nmax,:);
   x_max(generation,:)=x;
   drawTSP(city_list,x,y_max(generation),generation,0);
   generation=generation+1;
end
[min_ymax,pointer]=min(y_max);
drawTSP(city_list,x_max(pointer,:),min_ymax,pointer,1);

figure(2);
plot(y_max,'b'); hold on;
plot(y_average,'g');grid;
title('搜索过程追踪图');
legend('最短距离','平均距离');
fprintf('遗传算法得到的最短距离:%.2f\n',min_ymax);
fprintf('遗传算法得到的最短路线');
disp(x_max(pointer,:));
end
