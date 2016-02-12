
#include "a6.h"

int main()
{
    
   	
    image_rgb = imread("/home/tecomp/3266/assing6/lena.jpg");   // Read the file
	
    if(! image_rgb.data )                              // Check for invalid input
    {
        cout <<  "Could not open or find the image" << std::endl ;
        return -1;
    }
	cvtColor(image_rgb,image_gray,CV_BGR2GRAY);

	//cout<<image_gray;
	//Size s =image.size();
	//cout<<s;

	/*int rows = image.rows;
	int cols = image.cols;
	cout<<rows<<" "<<cols;	 
	*/

  	gui(image_gray);
    return 0;
}
