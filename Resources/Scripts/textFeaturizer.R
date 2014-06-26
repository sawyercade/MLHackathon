# author: Mohamed Abdel-hady
# Creation Date: June 24, 2014
#
# this function returns the document-term matrix in a TSV file and a vocabulary file
#
# Arguments
#
# text.file   a file without header where the first column is the text to extract features from.
# 
textFeaturizer <- function(text.file){
  if(!is.element("tm", installed.packages()[,1]) )
    install.packages("tm")
  
  library("tm")
   
  text.data <- read.csv(text.file, header=FALSE, sep="\t", blank.lines.skip = FALSE)

  #replace null values
  #text.data$V1 <- as.vector(text.data$V1)
  #empty_indices <- which(text.data$V1 == "")  
  #text.data$V1[empty_indices] <- "0.00001"
  
  #read the first column in the data frame
  myCorpus <- Corpus(VectorSource(text.data$V1))
  
  #convert to lower case
  myCorpus <- tm_map(myCorpus, tolower)
  
  # remove punctuation
  myCorpus <- tm_map(myCorpus, removePunctuation)
  
  # remove numbers
  myCorpus <- tm_map(myCorpus, removeNumbers)
  
  # remove stopwords
  myCorpus <- tm_map(myCorpus, removeWords, stopwords("english"))
  
  myCorpus <- tm_map(myCorpus, stripWhitespace)
  
  myDTM <- DocumentTermMatrix(myCorpus, control = list(dictionary = NULL,
                                                            weighting = weightTf))
  
  #convert   DocumentTermMatrix into Matrix
  myMatrix <- as.matrix(myDTM)
  
  #convert Matrix into data frame
  #df <- as.data.frame(myMatrix)
  
  #return dictionary
  myVocabulary <- Terms(myDTM)
   
  write.table(myMatrix, file= paste0(text.file, ".dense.tsv"), quote = FALSE, row.names = FALSE)
  
  write.table(myVocabulary, file= paste0(text.file, ".voc"), quote = FALSE, row.names = FALSE)
  
  return()
}

bugs.file <- "D:\\hackathon\\miscs\\BugComments.txt"
textFeaturizer(bugs.file)


