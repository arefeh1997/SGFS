# SGFS
A semi-supervised graph-based feature selection algorithm based on the PageRank algorithm

This code belongs to our paper "SGFS: A semi-supervised graph-based feature selection algorithm based on the PageRank algorithm".

function FRank = SGFS(dataTrain, dataTrainLabel)
inputs:
dataTrain = trainsamples
dataTrainLabel = trainlabels

Output:
FRank=sorted feature ranking vector
