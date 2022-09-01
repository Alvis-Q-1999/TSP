
%画图

function drawTSP(city_list,B,b,probability,fitness)
city_num=size(city_list,1);
for i=1:city_num-1
    plot([city_list(B(i),1),city_list(B(i+1),1)],[city_list(B(i),2),city_list(B(i+1),2)],'bp-','LineWidth',2,'MarkerEdgeColor','y','MarkerFaceColor','y');
    text(city_list(B(i),1),city_list(B(i),2),['  ',int2str(B(i))]);
    text(city_list(B(i+1),1),city_list(B(i+1),2),['  ',int2str(B(i+1))]);
    hold on;
end
plot([city_list(B(city_num),1),city_list(B(1),1)],[city_list(B(city_num),2),city_list(B(1),2)],'bp-','LineWidth',2,'MarkerEdgeColor','y','MarkerFaceColor','y');
title([num2str(city_num),'城市TSP']);
if fitness==0 && city_num~=10
    text(5,5,['第 ',int2str(probability),' 代','  最短距离为 ',num2str(b)]);
else
    text(5,5,['最终结果：最短距离 ',num2str(b),'， 在第 ',num2str(probability),' 代达到']);
end
if city_num==10
    if fitness==0
        text(0,0,['第 ',int2str(probability),' 代','  最短距离为 ',num2str(b)]);
    else
        text(0,0,['最终结果：最短距离 ',num2str(b),'， 在第 ',num2str(probability),' 代达到']);
    end
end
hold off;
pause(0.05); 
end
