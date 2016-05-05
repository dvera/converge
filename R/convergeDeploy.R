
convergeDeploy<-function(message="no message"){
	library(converge)
	res <- system(paste0("git -C /lustre/maize/home/dlv04c/software/r/converge/ add /lustre/maize/home/dlv04c/software/r/converge/ &&\
	git -C /lustre/maize/home/dlv04c/software/r/converge/ commit -a -m '",message,"' &&\
	git -C /lustre/maize/home/dlv04c/software/r/converge/ push"))
	library(devtools)
	detach("package:converge",unload=T)
	install_github("dvera/converge")
	library(converge)
}
