emails = read.csv("energy_bids.csv", stringsAsFactors=FALSE)
str(emails)
emails$email[1]
emails$responsive[1]
emails$email[2]
emails$responsive[2]

# Responsive emails
table(emails$responsive)

library(tm)
corpus = Corpus(VectorSource(emails$email))
corpus[[1]]$content
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords("english"))
corpus = tm_map(corpus, stemDocument)
corpus[[1]]$content

dtm = DocumentTermMatrix(corpus)
dtm
dtm = removeSparseTerms(dtm, 0.97)
dtm
labeledTerms = as.data.frame(as.matrix(dtm))
labeledTerms$responsive = emails$responsive
str(labeledTerms)

library(caTools)
set.seed(144)
spl = sample.split(labeledTerms$responsive, 0.7)
train = subset(labeledTerms, spl == TRUE)
test = subset(labeledTerms, spl == FALSE)

library(rpart)
library(rpart.plot)
emailCART = rpart(responsive~., data=train, method="class")
prp(emailCART)

pred = predict(emailCART, newdata=test)
pred[1:10,]
pred.prob = pred[,2]
table(test$responsive, pred.prob >= 0.5)
(195+25)/(195+25+17+20)

# Baseline model accuracy
table(test$responsive)
215/(215+42)
library(ROCR)
predROCR = prediction(pred.prob, test$responsive)
perfROCR = performance(predROCR, "tpr", "fpr")
plot(perfROCR, colorize=TRUE)
performance(predROCR, "auc")@y.values

