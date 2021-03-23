library(Biobase)

folder_path="/Users//Desktop//Data/"

Test_data=list.files(path=folder_path,pattern="Test_")
for(i in seq(1,1000))
{
n<-0;
assign("f",Test_data[i])
test_data<-read.csv(file=paste0(folder_path,f),sep="\t",header=TRUE,blank.lines.skip = TRUE,stringsAsFactors=FALSE)
n<-length(unique(test_data$FileName))
cat("Each test data has ",n,"samples\n")
}
