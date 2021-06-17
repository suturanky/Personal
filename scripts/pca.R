all_2<-read.csv("./R/Personal/datasets/all2.csv")
n<-all_2$gene_id
all_22<-all_2[,5:19]
all_23<-t(all_22)
colnames(all_23)<-n
for(i in 1:ncol(all_23)) {       # for-loop over columns
       all_23[ , i] <- as.numeric(all_23[,i])
   }
 res.pca <- prcomp(all26, scale = TRUE)
 fviz_pca_ind(res.pca,
                            col.ind = "cos2", # Color by the quality of representation
                          gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
                            repel = TRUE)     # Avoid text overlapping
