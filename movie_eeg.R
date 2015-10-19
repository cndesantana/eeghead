library(eegkit)
library(eegR)
library(rgl)

filenames<-system("ls *.csv",intern=TRUE);
nfiles<-length(filenames);
for(i in 1:nfiles){
   file<-filenames[i];
   emotion<-unlist(strsplit(file,'C'))[1];
   genetic<-unlist(strsplit(unlist(strsplit(file,'T'))[2],'[.]'))[1];
   eeg<-read.csv(file,sep=";")
   
   #getting the data
   n100 <- eeg[100,]
   
   #getting the cordinates
   data(eegdata)
   data(eegcoord)
   cidx <- match(toupper(names(n100)),rownames(eegcoord))
   
   #plotting the head
   eegspace(space=eegcoord[cidx,1:3],as.numeric(n100))
   #saving the movie
   movie3d(spin3d(axis=c(0,0,1)),duration=10,dir=getwd());
   outputmovie<-paste("movie_n100_",emotion,"_comt",genetic,".gif",sep="")
   cat(paste("creating movie ",outputmovie,"...",sep=""),sep="\n") 
   system(paste("mv ./movie.gif ./",outputmovie,sep=""))


   p200 <- eeg[200,]
   #getting the cordinates
   data(eegdata)
   data(eegcoord)
   cidx <- match(toupper(names(p200)),rownames(eegcoord))
   
   #plotting the head
   eegspace(space=eegcoord[cidx,1:3],as.numeric(p200))
   #saving the movie
   movie3d(spin3d(axis=c(0,0,1)),duration=10,dir=getwd());
   outputmovie<-paste("movie_p200_",emotion,"_comt",genetic,".gif",sep="")
   cat(paste("creating movie ",outputmovie,"...",sep=""),sep="\n") 
   system(paste("mv ./movie.gif ./",outputmovie,sep=""))


   p300 <- eeg[300,]
   #getting the cordinates
   data(eegdata)
   data(eegcoord)
   cidx <- match(toupper(names(p300)),rownames(eegcoord))
   
   #plotting the head
   eegspace(space=eegcoord[cidx,1:3],as.numeric(p300))
   #saving the movie
   movie3d(spin3d(axis=c(0,0,1)),duration=10,dir=getwd());
   outputmovie<-paste("movie_p300_",emotion,"_comt",genetic,".gif",sep="")
   cat(paste("creating movie ",outputmovie,"...",sep=""),sep="\n") 
   system(paste("mv ./movie.gif ./",outputmovie,sep=""))

}
