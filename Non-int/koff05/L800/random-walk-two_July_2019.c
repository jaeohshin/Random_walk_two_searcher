/**
Random search of two molecules in 1D lattice.
* Jaeoh Shin (jaeoh.shin@rice.edu). 2019. Jan. 29th
* 
**/


/**
Simulation:
1. Two molecules evolve independently, with the hopping rate u1 in the non-target region 
* and with hopping rate u0 in the target region (u0< u1).
2. When two moleculears are adjacent, they form a bond and cannot move until the bond breaks.
3. The bond breakage rate is kd.
4. The process end when the 1st molecule arrive at site 0 and the 2nd molecule arrive at site 1.
**/


/**
Development
1. Check the search of a single molecule in 1D lattice: Jan. 29th
2. May 2019- now the random walker can stay at the target site only for a finite time, <t>=1/k_{off}
* That is with the prob. koff, the find=1 becomes find=0.
3. June 2019- now two searcher are interacting. If they occupy the same site, they can: (i) dissociate with the rate kd, (ii) move togetehr with hopping rate mu2- that is (1-kd)*mu2, (iii) or stay at the same site. (1-kd)*(1-mu2)
* July 9th
* July 17th- Random walk will not move with probability s (=1/2)
**/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <math.h>
#include "/home/js131/work/utils/mt19937-64/mt19937-64.c"


/** 
* Generation of random number seed, get a current time in micri-second unit
**/
int gus() {
	struct timeval tp;
	gettimeofday(&tp,0);
	return tp.tv_usec;
}


int main(){
	unsigned long long idum;
	idum=gus();
	init_genrand64(idum);
	int i, kk, ntraj, nn ;
	ntraj=10000;
	int n1, n2; //Coordinate of two random walker
	int L ; //lattice coordinate= [-L/2, +L/2]
	
	double koff ; // This is the dissociation rate from the target site.
	double mu2=0.05 ;// hopping rate when two searchears are moving together.
	double kd ; //dissociation rate of two searchers.
	double ss=0.0 ; //stopping probability
	int find1, find2 ;
	int m1, m2 ;
	
	long int total_time; 

	double r ;

	FILE *eqFile ;
		eqFile=fopen("eqFile.txt","w");
	FILE *tFile ;
		 tFile=fopen("timeFile.txt", "a");
	FILE *atFile ;
		 atFile=fopen("alltimeFile.txt", "a");

	kd=1; 
	koff=0.5;

	for (nn=0; nn< 1; nn++) {
	
	L=800;//50*pow(2, nn);
	total_time=0;		
		
	for (kk=0; kk<ntraj;kk++) {

//	n1=-L*0.5;
//	n2=0;	

	r= genrand64_real2()-0.5;
	n1= ceil(r*L);
	r= genrand64_real2()-0.5;
	n2= ceil(r*L);

	find1=0;
	find2=0;
	
	for(i=0; ;i++){
		
//	fprintf(eqFile, "%d\t%d\t%d\n", i, n1, n2) ;


/// Below we determine the state of the random walkers.
	if (n1==L*0.5){ 
		find1=1;
		}
		
	if (n2==L*0.5){
		find2=1;
		}
		
///And they arrived at the target site, the search process will end.
	if (find1*find2){ //Two random walkers arrived at the target
//		fprintf(tFile, "%d\n", i );
		total_time=total_time+i;
		
		fprintf(atFile, "%d\n", i) ;

		break;
		}
		
	
	
	
	
	//Below is for the interaction of two searchers.- June 2019
	
	if (n1==n2) {
		r=genrand64_real2();
		
		if (r< kd) {  ///dissociate
			
			if (n1> -L/2){
					r=genrand64_real2();
					if(r< 0.5){
							n1=n1-1;
							//n2=n2+1;  /// July 22
							}
					else {
							n1=n1+1;
							// n2=n2-1; ///July 22
							}
						}
										
			else {  //if two particles are at the left low corner
				r=genrand64_real2();
				if (r<0.5){ n1=n1+ 1;  //July 22
							n2=n2;}
				else {n2=n2+1  ;   //July 22
					  n1=n1; }
				}
				
			}
		
		else if (r < kd+mu2 ) { ///move together
					r=genrand64_real2();
					
					if(r<0.5*(1-ss)) {
						n1=n1+1;
						n2=n2+1;
						}
						
					else if (r< (1-ss) ){
						if(n1>-L/2) {
							n1=n1-1;
							n2=n2-1; }
										}
						}
		}


		
else { ///Below is the dynamics of two RWs. 		


// Two RWs move alternatively

	r=genrand64_real2();
	if (r<0.5) {
		
	if(find1==0) { //If the particle does not arrive at the target, it moves
	if(n1==-L*0.5){
		r=genrand64_real2();
		if(r<0.5*(1-ss)) {n1=n1+1;}
	}
	else {
		r=genrand64_real2();
		if(r<0.5*(1-ss)) {n1=n1+1;}
		else if (r< (1-ss)) {n1=n1-1;}
		}
				}
				
	else if(find1==1) {		// The 1st RW is already at the target site, then it can leave to the left site with prob. koff. and then find1 becomes 0;
		r=genrand64_real2();
		if (r< koff){n1=n1-1;
					find1=0;
					}
			}
		}
	
	
	
// 2nd RW
	else {
			
	if(find2==0) {
	
	if(n2==-L*0.5){
		r=genrand64_real2();
		if(r<0.5*(1-ss)) {n2=n2+1;}
	}
	
	else {
		r=genrand64_real2();
		if(r<0.5*(1-ss)) {n2=n2+1;}
		else if (r<(1-ss)) {n2=n2-1;}
			}
		}
	
	else if (find2==1){		// The 2nd RW is already at the target site, then it can leave to the left site with prob. koff.
		
		r=genrand64_real2();
		if (r< koff){n2=n2-1;
					find2=0;
					}
		}
	}
	
	
	
}
	
	
	
	
		
	} 
	
	}//end of 1 search event.
	
	
	
 
 
 printf("%d\t%d\n", L, total_time/ntraj) ;
 fprintf(tFile, "%d\t%d\n", L, total_time/ntraj) ;

 
	}
	
return 0;

 }

