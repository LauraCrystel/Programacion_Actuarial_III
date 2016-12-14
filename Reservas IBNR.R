
n <- 7
x<-c(3511,3215,2266,1712,1059,587,340,4001,3702,2278,1180,956,629,4355,3932,1946,1522,1238,4295,3455,2023,1320,4150,3747,2320,5102,4548,6283)
siniestros <- data.frame(originf = factor(rep(2007:2013, n:1)),dev=sequence(n:1),inc.paid=x)
(inc.triangle<- with(siniestros,{
    M<- matrix(nrow=n,ncol=n,dimnames=list(origen=levels(originf), desarrollo=1:n))
    M[cbind(originf, dev)] <- inc.paid
    M
}))
View(inc.triangle)
cum.triangle<-t(apply(inc.triangle, 1 ,cumsum))
f<- sapply((n-1):1, function(i){
    sum(cum.triangle[1:i, n-i+1])/sum(cum.triangle[1:i,n-i])
})
View(cum.triangle)
tail<-1
round((f<-c(f,tail)),digits=3)
full.triangle<- cum.triangle
for(k in 1:(n-1)){
    full.triangle[(n-k+1):n, k+1]<- full.triangle[(n-k+1):n,k]*f[k]
}

full.triangle<-(round(full.triangle, digits=0))
View(full.triangle)
ldf<-round(rev(cumprod(rev(f))), digits=2)
ldf
dev.pattern<-1/ldf
round(dev.pattern, digits=4)
round(ultimate.paid<-full.triangle[,n], digits=0)
latest.paid <- cum.triangle[row(cum.triangle) == n - col(cum.triangle) + 1]

latest.paid
reserve<-round(sum(ultimate.paid-latest.paid),digits=0)

reserve