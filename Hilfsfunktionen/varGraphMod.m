function [endGraph] = varGraphMod(Startgraph)
%Modifizierte Version von varGraph, nur für die Verwendung mit dem
%Wettkampf Beispiel (Figur 9)

n=size(Startgraph.Nodes,1);
m=size(Startgraph.Edges,1);
tGr=Startgraph;
failcount=0;
reroll=true;
while reroll && failcount<1000
    i=randi(6);
    j=randi(n-12)+12;
    failcount=failcount+1;
    if findedge(tGr,i,j)==0 && i~=j
        reroll=false;
    end
    if failcount ==100
        fprintf('This never happened before?! Wir finden keine neuen kanten zum hinzufügen!!')
    end
end
tGr=addedge(tGr,i,j,rand*0.5);
endGraph=tGr;
end

