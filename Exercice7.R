
mat<- as.table(rbind(c(10,10,15,20,30,15), c(30,14,34,45,57,20)))
dimnames(mat) <- list(c("Théoriques (%)","Observés") ,c("Lundi", "Mardi", "Mercredi", "Jeudi", 
                                                        "Vendredi","Samedi"))

mat

testChi2 <- chisq.test(mat)
testChi2$statistic #: la statistique du Chi2.
testChi2$parameter #: le nombre de degrés de libertés.
testChi2$p.value #: la p-value.