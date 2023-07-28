function FRank = SGFS(dataTrain, dataTrainLabel)

% randomly miss n% of class labels and replace them with NaN!
labeledAndUnlabeled = MissDatasetLabel1(dataTrainLabel, 0.2);

labeled = find(~isnan(labeledAndUnlabeled));
labeledData = [dataTrain(labeled, :), labeledAndUnlabeled(labeled)];

unlabeled = find(isnan(labeledAndUnlabeled));
unlabeledData = dataTrain(unlabeled, :);

%relevancy
cordis =2 - pdist2(labeledData(:, 1:end-1)',labeledData(:, end)','correlation');
cordis(isnan(cordis)) = 0;

alldata = cat(1,labeledData(:, 1:end-1), unlabeledData);

%redundancy
redun = pdist2(alldata',alldata','correlation');
redun(isnan(redun)) = 0;

cordisredun = cat(2, cordis , mean(redun,2));

%Euclidean distance
Edg = pdist2(cordisredun,cordisredun);

%create graph 
[aa bb] = find(Edg>0);
w1 = Edg(find(Edg>0));
G = graph(aa,bb,w1);

%pagerank
rank = centrality(G,'pagerank','Importance',G.Edges.Weight);
[w1 w2]=sort(-rank)
FRank=w2;
end

