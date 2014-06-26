scoredinstances <- read.table("c:\\hackathon\\1.inst.txt", header=TRUE, sep="\t")
classindices <- read.table("C:\\hackathon\\class_name_to_index_mapping.tsv", header=FALSE, sep="\t", colClasses = "character")

finalset <- data.frame(
  bugid <- scoredinstances [,1],
  path <- rep("null",nrow(scoredinstances )),
  stringsAsFactors=FALSE
)

for(i in 1: nrow(finalset))
{

classname <- classindices[match( scoredinstances[i,"Assigned"],classindices[,2]),1]
classname <- gsub("Windows.Phone.Blue", "Windows Phone Blue", classname )
classname <- chartr (".","\\",classname )

finalset[i,2] <- classname 

}
names(finalset) <- c("BugID","Path")
write.table(finalset,"c:\\hackathon\\finalset.tsv",sep="\t",row.names=FALSE,col.names=TRUE,quote=FALSE)
