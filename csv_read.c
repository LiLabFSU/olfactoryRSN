/*******************************************************************************
 *
 * This routine imports roi data from csv file format and calculates the
 * Pearsons Correlation coefficient for all roi combinations. These values are
 * written to a NxN csv file (where N is the number of rois).
 *
 * The roi matrix is also transposed as the csv file from nifti_simu.c outputs
 * the data in a timepoint x roi orientation as opposed to roi x timepoint.
 *
 * Compile with: cc -o csv_read csv_read.c -lm
 * Execute with: ./csv_read filename.csv
 *
 ******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

main(argc,argv)
int argc;
char *argv[];
{
	FILE *f,*fp;
	char *csv;
	char delim;
	csv = argv[1]; //set filename equal to csv
	int i, j, val;
	float *data[627];
	for (i=0; i<627; i++){
	data[i] = (float *)malloc(2400 * sizeof(float));
	}
	float temp;
	
	// start timer
	/*** set a time parameter ***/
	time_t tstart, tend;
	tstart = time(0);
	
	// open csv file
	f = fopen(csv,"r");
	
	// used to index matrix, start at zero
	i=0;
	j=0;
	int n=0;
		
	/***************************************************************************
	 *
	 * The data must be read in from a .csv file and then transposed. The 
	 * output from nifti_simu.c is in 1200x601 (the last column is zeros). This
	 * needs to be transposed into a 605(rois) x 1200(timepoints) matrix. The
	 * result of this will be called "data"
	 *
	***************************************************************************/
	//fscanf(f,"%i",&temp);
	while(val = fscanf(f,"%f%c",&temp,&delim)){
		if(i <= 626){
			// is int value, put in array
			data[i][j] = temp;
			//if(i<=1){
			//data[i][j] = temp;}
			
			//fprintf(stderr,"\ni=%i j=%i\n",i,j); // used to check proper i,j output
			if(i>=626){
				i=0;
				j++;
				if(j>=2400){break;}
			}else{
				i++;
			}
		}else{
			break;
		}
	}
	
	/***************************************************************************
	 *
	 * This section can be used to verify output file is properly transposed
	 *
	 *
	// open csv file to write
	fp = fopen("transpose.csv","w");
				
	for(i=0; i<605; i++){
		for(j=0; j<1200; j++){
			fprintf(fp,"%i,",data[i][j]);
		}
		fprintf(fp,"\n",data[i][j]);
	}
	***************************************************************************/
	
	// close csv file to write
	fclose(f);
	
	/***************************************************************************
	 *
	 * This section beneath is for calculating the correlation matrix, also
	 * known as the functional connectivity map (fcMap). Each roi is correlated
	 * with each other roi producing an NxN matrix where N is the number of
	 * rois.
	 *
	***************************************************************************/
	
	int k;
	float x[2400], y[2400], xy[2400], xsquare[2400], ysquare[2400];
	float xsum, ysum, xysum, xsqr_sum, ysqr_sum;
    long double num, deno;
	long double coeff;
    
    // open file for writing fcMap to
    fp = fopen("fcMap.csv","w");
    // loop through each combination of i,j from 1 to N
    for(k=0; k<627; k++){
		for(j=0; j<627; j++){
			
			xsum = ysum = xysum = xsqr_sum = ysqr_sum = 0;
			
			// set X and Y
			for(n=0; n<2400; n++){
				x[n]=data[k][n];
			}
				 
			for(n=0; n<2400; n++){
				y[n]=data[j][n];
			}
			
			
	
			
			
			/* find the needed data to manipulate correlation coeff */
			for (i = 0; i < 2400; i++) {
                xy[i] = x[i] * y[i];
                xsquare[i] = x[i] * x[i];
                ysquare[i] = y[i] * y[i];
                xsum += x[i];
                ysum = ysum + y[i];
                xysum = xysum + xy[i];
                xsqr_sum = xsqr_sum + xsquare[i];
                ysqr_sum = ysqr_sum + ysquare[i];
            }
			
            // calculate numerator and denominator 
            /** 1 formerly 1.0 for float type **/
            num = 1 * ((2400 * xysum) - (xsum * ysum));
            deno = 1 * ((2400 * xsqr_sum - xsum * xsum) * (2400 * ysqr_sum - ysum * ysum));
            
            // calcualte correlation coefficient [ num/sqrt(deno) ]
            coeff = num / sqrt(deno);
            
            if (k==1 && j==0){
                	fprintf(stderr, "\nxsum = %f\n",xsum);
                	fprintf(stderr, "\nysum = %f\n",ysum);
                	fprintf(stderr, "\nxysum = %f\n",xysum);
                	fprintf(stderr, "\nxsqr_sum = %f\n",xsqr_sum);
                	fprintf(stderr, "\nysqr_sum = %f\n",ysqr_sum);
                	fprintf(stderr, "\nnum = %Lf\n",num);
                	fprintf(stderr, "\ndeno = %Lf\n",deno);
                	fprintf(stderr, "\ncoeff = %Lf\n",coeff);
            }
                
            // put corr coef in fcMap
            fprintf(fp,"%Lf,",coeff);
		}
		fprintf(fp,"\n");
	}
	fclose(fp);
	
	/*** call back time parameter ***/
	tend = time(0);
	fprintf(stderr, "\nIt took %.3f second(s) to run this code.\n",difftime(tend, tstart));
	
    return 0;
}

