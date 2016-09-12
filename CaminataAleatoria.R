cuentaarriba <- 0
cuentaabajo <- 0
bla <-vector("numeric")
for (p in 1:100){
  
  z <- 5
  while(z>=3 && z<=10){
    moneda <- rbinom(1,1,0.5)
    if (moneda==1){ #Caminata Aleatoria
      z <- z + 0.5
    }else{
      z <- z - 0.5
    }
    bla <- c(z)
    if (bla==10.5){
      cuentaarriba <- cuentaarriba + 1
    }
    if (bla==2.5){
      cuentaabajo <- cuentaabajo + 1
    }
  }
}

cuentaarriba
cuentaabajo

