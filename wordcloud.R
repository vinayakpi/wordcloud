word_cloud<-readLines("path of text file")
word_cloud

library(tm)
word_corpus<-Corpus(VectorSource(word_cloud))
inspect(word_corpus)


clean_corpus <- tm_map(word_corpus, tolower)
clean_corpus <- tm_map(clean_corpus, removeNumbers)
clean_corpus <- tm_map(clean_corpus, removePunctuation)
clean_corpus <- tm_map(clean_corpus, stripwhitespace)
clean_corpus <- tm_map(clean_corpus, removeWords, stopwords())                           
clean_corpus <- tm_map(clean_corpus, stemDocument)

inspect(clean_corpus[1:10])

library(wordcloud)

wordcloud(clean_corpus , min.freq = 2)
wordcloud(clean_corpus,min.freq = 1,colors = brewer.pal(8,"Set2"),random.order=FALSE,rot.per= .50)


word_tdm <- TermDocumentMatrix(clean_corpus)
inspect(word_tdm[1:10,10:97])

word_matrix <- as.matrix(word_tdm)

word_sorted <-sort(rowSums(word_matrix),decreasing = TRUE)

head(word_sorted)





