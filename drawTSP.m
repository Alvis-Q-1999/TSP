
%��ͼ

function drawTSP(city_list,B,b,probability,fitness)
city_num=size(city_list,1);
for i=1:city_num-1
    plot([city_list(B(i),1),city_list(B(i+1),1)],[city_list(B(i),2),city_list(B(i+1),2)],'bp-','LineWidth',2,'MarkerEdgeColor','y','MarkerFaceColor','y');
    text(city_list(B(i),1),city_list(B(i),2),['  ',int2str(B(i))]);
    text(city_list(B(i+1),1),city_list(B(i+1),2),['  ',int2str(B(i+1))]);
    hold on;
end
plot([city_list(B(city_num),1),city_list(B(1),1)],[city_list(B(city_num),2),city_list(B(1),2)],'bp-','LineWidth',2,'MarkerEdgeColor','y','MarkerFaceColor','y');
title([num2str(city_num),'����TSP']);
if fitness==0 && city_num~=10
    text(5,5,['�� ',int2str(probability),' ��','  ��̾���Ϊ ',num2str(b)]);
else
    text(5,5,['���ս������̾��� ',num2str(b),'�� �ڵ� ',num2str(probability),' ���ﵽ']);
end
if city_num==10
    if fitness==0
        text(0,0,['�� ',int2str(probability),' ��','  ��̾���Ϊ ',num2str(b)]);
    else
        text(0,0,['���ս������̾��� ',num2str(b),'�� �ڵ� ',num2str(probability),' ���ﵽ']);
    end
end
hold off;
pause(0.05); 
end
