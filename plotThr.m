parseLogsout
 figure
for i = 1:100000:length(tsc.kitePosGnd.time)
   
   
    scatter3(tsc.kitePosGnd.data(i,1),tsc.kitePosGnd.data(i,2),tsc.kitePosGnd.data(i,3))
     xlim([-300 300])
      zlim([0 1000])
       ylim([-300 300])
    hold on 
    scatter3(tsc.node2Pos.data(i,1),tsc.node2Pos.data(i,2),tsc.node2Pos.data(i,3))
    scatter3(tsc.node3Pos.data(i,1),tsc.node3Pos.data(i,2),tsc.node3Pos.data(i,3))
    scatter3(tsc.node4Pos.data(i,1),tsc.node4Pos.data(i,2),tsc.node4Pos.data(i,3))
    scatter3(tsc.node5Pos.data(i,1),tsc.node5Pos.data(i,2),tsc.node5Pos.data(i,3))
    hold off
    pause(.1)
end