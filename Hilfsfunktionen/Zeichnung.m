function []=Zeichnung(Netzwerk, Meinungen, Gd, plotdataD, Gs, plotdataS)
%ZEICHNUNG erstellt einen Plot der Meinungsausbreitungsmodelle
%   Der plot besteht aus 5 Subplots in einem 2x3 Grid, mit jeweils dem
%   Endergebnis und dem Verlauf der druchschnittlichen Meinung
n=size(Gd.Nodes,1);

%zuerst die Ausgangssituatuion
subplot(2,3,1);
Go= digraph(Netzwerk);
Go.Nodes.Meinungen=Meinungen;
goPlot=plot(Go);%Go steht für G original
goPlot.MarkerSize=8;
for i=1:n
    highlight(goPlot,i,'NodeColor',[(0.5-(Go.Nodes.Meinungen{i})/2) 0 (0.5+(Go.Nodes.Meinungen{i})/2)]);
end
goPlot.EdgeColor=[.5 .5 .5];
goPlot.MarkerSize=8;
goPlot.NodeLabel={};
title('Start Bedingungen')

%danach der stochastische Fall
subplot(2,3,4);
gsPlot=plot(Gs);
gsPlot.EdgeColor=[.5 .5 .5];
gsPlot.NodeColor=[.5 .5 0];
gsPlot.MarkerSize=8;
gsPlot.NodeLabel={};
for i=1:n
    highlight(gsPlot,i,'NodeColor',[(0.5-(Gs.Nodes.Meinungen{i})/2) 0 (0.5+(Gs.Nodes.Meinungen{i})/2)]);
end
title('Statistische Simulation')

subplot(2,3,5);
stairs(plotdataS(1,:),plotdataS(2,:),'-','Linewidth',2);
for i=1:n
   hold on
   stairs(plotdataS(1,:),plotdataS(i+2,:),'-','Linewidth',0.5);
end
hold off
title('Verlauf der Meinungen')


subplot(2,3,6);
stairs(plotdataS(1,2:end),plotdataS(3,2:end),'--','Linewidth',1);
title('Verlauf der Varianz')

%zuletzt der deterministische Fall 
subplot(2,3,2);
gdPlot=plot(Gd);
gdPlot.EdgeColor=[.5 .5 .5];
gdPlot.NodeColor=[.5 .5 0];
gdPlot.MarkerSize=8;
gdPlot.NodeLabel={};
for i=1:n
    highlight(gdPlot,i,'NodeColor',[(0.5-(Gd.Nodes.Meinungen{i})/2) 0 (0.5+(Gd.Nodes.Meinungen{i})/2)]);
end
title('Deterministische Simulation')

subplot(2,3,3);
for i=1:n
   plot(plotdataD(1,:),plotdataD(i+3,:),'-', 'Linewidth', 2);
    hold on
end
plot(plotdataD(1,:),plotdataD(2,:),'--');
hold off
title('Verlauf der Meinungen')
end