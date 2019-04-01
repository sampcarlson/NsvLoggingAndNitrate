#10^(seq(from=-1,to=3,by=0.25))
getVar=function(nConc=1,varNames,effect="unlogged",baseSegOnly=F,dateStr="2019-03-30",dataPath="C:/Users/sam/Dropbox/Logjams/jamModelResults/",baseSegHolonName="channel_1"){
  thisFile=read.csv(paste0(dataPath,dateStr,"_",effect,"_",
                sub(pattern="\\.",replacement="_",x=as.character(nConc)),
                ".csv"))
  if(baseSegOnly){
    thisFile=thisFile[thisFile$holonName==baseSegHolonName,]
  }
  thisVars=thisFile[names(thisFile)%in%varNames]
  return(thisVars)
}

listVars=function(varNames,dateStr="2019-03-30",nConc=1,effect="unlogged",dataPath="C:/Users/sam/Dropbox/Logjams/jamModelResults/"){
  thisFile=read.csv(paste0(dataPath,dateStr,"_",effect,"_",
                           sub(pattern="\\.",replacement="_",x=as.character(nConc)),
                           ".csv"))
  return(names(thisFile))
}
