%Hilfe zur erstellung des Sammelgraph benötigt
clear;Bild6;Netzwerk=Figur61;Netzwerk2=Figur62;Meinungen=MeinungenF61;
Meinungen=MeinungsRandom(Meinungen);
Gs = digraph(Netzwerk);
Gs.Nodes.Meinungen=Meinungen;
[Gs,plotdataS]=MeinungVerbreitenS(Gs,10,0);
Gd = digraph(Netzwerk);
Gd.Nodes.Meinungen=Meinungen;
[Gd,plotdataD]=MeinungVerbreitenD(Gd,10,0,0,0.2,[-inf,inf]);
Gd2 = digraph(Netzwerk2);
Gd2.Nodes.Meinungen=Meinungen;
[Gd2,plotdataD2]=MeinungVerbreitenD(Gd2,10,0,0,0.2,[-inf, inf]);
Gs2 = digraph(Netzwerk2);
Gs2.Nodes.Meinungen=Meinungen;
[Gs2,plotdataS2]=MeinungVerbreitenS(Gs2,10,0);
%% hier werden dann die Plots erstellt
semilogy(plotdataD2(1,:),plotdataD2(3,:),'-b');
hold on
semilogy(plotdataD(1,:),plotdataD(3,:),'-r');
hold on
semilogy(plotdataS2(1,:),plotdataS2(3,:),'-k');
hold on
semilogy(plotdataS(1,:),plotdataS(3,:),'-g');
legend('Lambda2=.48(deterministisch)', 'Lambda2=.13 (deterministisch)', 'Lambda2=.48(stochastisch)', 'Lambda2=.13(stochastisch)')
hold off