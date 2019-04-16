function [endGraph] = varGraph(Startgraph,type)
%VARGRAPH variiert die Kanten eines Graphen durch entwerder hinzufügen oder entfernen einer neuen kante type r entfernt und a fügt hinzu

n=size(Startgraph.Nodes,1);
m=size(Startgraph.Edges,1);
tGr=Startgraph;
if type=='a'
    failcount=0;
    reroll=true;
    while reroll && failcount<1000 %failcount sichert nur, dass hier keine endlosschleife Läuft
        i=randi(n);
        j=randi(n); 
        failcount=failcount+1;
        if findedge(tGr,i,j)==0 && i~=j
            reroll=false; 
            %solange neue indices generieren bis eine noch nicht vorhandene Kante gefunden wurde
        end
        if failcount ==100
            fprintf('This never happened before?! Wir finden keine neuen kanten zum hinzufügen!!')
        end
    end
    tGr=addedge(tGr,i,j,rand);
elseif type=='r'
    
    tGr=rmedge(tGr,randi(m)); %entfernt eine zufällige kante
end
endGraph=tGr;
end

