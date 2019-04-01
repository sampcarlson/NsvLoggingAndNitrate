source('~/R/projects/NsvLoggingAndNitrate/getVar.R')

totalRemoval=data.frame(nConcs=10^(seq(from=-1,to=3,by=0.25)))

totalRemoval$logged.NCONC=unlist(t(sapply(totalRemoval$nConcs,getVar,varNames="NCONC",effect="logged",baseSegOnly=T)))
totalRemoval$logged.FracRemoved=1-totalRemoval$logged.NCONC/totalRemoval$nConcs

totalRemoval$loggedMaxConfInt.NCONC=unlist(t(sapply(totalRemoval$nConcs,getVar,varNames="NCONC",effect="logged_maxConfInt",baseSegOnly=T)))
totalRemoval$loggedMaxConfInt.FracRemoved=1-totalRemoval$loggedMaxConfInt.NCONC/totalRemoval$nConcs

totalRemoval$loggedMinConfInt.NCONC=unlist(t(sapply(totalRemoval$nConcs,getVar,varNames="NCONC",effect="logged_minConfInt",baseSegOnly=T)))
totalRemoval$loggedMinConfInt.FracRemoved=1-totalRemoval$loggedMinConfInt.NCONC/totalRemoval$nConcs

totalRemoval$loggedMulti.NCONC=unlist(t(sapply(totalRemoval$nConcs,getVar,varNames="NCONC",effect="logged_multi",baseSegOnly=T)))
totalRemoval$loggedMulti.FracRemoved=1-totalRemoval$loggedMulti.NCONC/totalRemoval$nConcs

totalRemoval$unlogged.NCONC=unlist(t(sapply(totalRemoval$nConcs,getVar,varNames="NCONC",effect="unlogged",baseSegOnly=T)))
totalRemoval$unlogged.FracRemoved=1-totalRemoval$unlogged.NCONC/totalRemoval$nConcs

totalRemoval$unloggedSingle.NCONC=unlist(t(sapply(totalRemoval$nConcs,getVar,varNames="NCONC",effect="unlogged_single",baseSegOnly=T)))
totalRemoval$unloggedSingle.FracRemoved=1-totalRemoval$unloggedSingle.NCONC/totalRemoval$nConcs

windows()
plot(totalRemoval$unlogged.FracRemoved~totalRemoval$nConcs,type="l",log="x",ylim=c(0,0.9),lwd=4)

lines(totalRemoval$logged.FracRemoved~totalRemoval$nConcs,col="blue",lwd=4,lty=2)
lines(totalRemoval$loggedMaxConfInt.FracRemoved~totalRemoval$nConcs,col="blue",lty=3,lwd=2)
lines(totalRemoval$loggedMinConfInt.FracRemoved~totalRemoval$nConcs,col="blue",lty=3,lwd=2)


lines(totalRemoval$unloggedSingle.FracRemoved~totalRemoval$nConcs,lty=2,lwd=2)
lines(totalRemoval$loggedMulti.FracRemoved~totalRemoval$nConcs,col="blue",lwd=2)

legend("topright",legend=c("unlogged","logged","logged_confInt","loggedButMulti","unloggedButSingle"),lty=c(1,2,3,1,2),col=c("black","blue","blue","black","blue"),lwd=c(4,4,2,2,2))
