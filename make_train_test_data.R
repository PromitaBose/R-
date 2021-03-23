library(limma)
library(Biobase)
library(stats)
library(gdata)


rm(list=ls(all=TRUE))
###############/usr/local/bin/R
#make 1000 train, test sets
##################################

all_samples<-readTargets("/home/ubuntu/Input_Data/filelist.txt")
####
for (k in 1:1000){
N<-c();
sample=c();
FIXED_train_data=c();
targets_train_model=c();
targets_test_predict=c();

sample = sample.split(all_samples$FileName, SplitRatio = .70)
FIXED_train_data = subset(all_samples$FileName, sample == TRUE)
N<-match(FIXED_train_data,all_samples$FileName)

targets_train_model<-all_samples[N,]
targets_test_predict<-all_samples[-N,]
################################store all dep
write.table(targets_train_model,file=sprintf("%s_%s.txt","Train",k),sep="\t",row.names=TRUE,col.names=TRUE,quote=FALSE)
write.table(targets_test_predict,file=sprintf("%s_%s.txt","Test",k),sep="\t",row.names=TRUE,col.names=TRUE,quote=FALSE)
}
