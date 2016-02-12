#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
using namespace cv;
using namespace std;

int main( int argc, const char** argv )
{
     Mat img = imread("lena.jpg", CV_LOAD_IMAGE_UNCHANGED); //read the image data in the file "MyPic.JPG" and store it in 'img'
	Mat grayscale;
     if (img.empty()) //check whether the image is loaded or not
     {
          cout << "Error : Image cannot be loaded..!!" << endl;
          //system("pause"); //wait for a key press
          return -1;
     }


	
	  cvtColor( img,img, CV_BGR2GRAY );
	imshow("original image",img);

	//cout<<"vals of mat matrix greyscale"<<img<<endl;
	Size s=img.size();	
	int rows,cols,alpha=1.5;
	rows=s.height;
	cols=s.width;
	//increasing brightness
	/*for(int i=0;i<rows;i++)
	{
		for(int j=0;j<cols;j++)
		{

			uchar color=img.at<uchar>(i,j);
			color=color*alpha;
			img.at<uchar>(i,j)=color;



		}
	}*/
		
	//blurring 
	int arr[3][3]={1};
	int ta=0;
	for(int i=0;i<rows-2;i++)
	{
		for(int j=0;j<cols-2;j++)
		{
			for(int k=0;k<3;k++)
			  {
				for(int l=0;l<3;l++)
				{
				     uchar color=img.at<uchar>(i+k,j+l);
				     ta=ta+(color*arr[k][l]);			
				}


			  }
				ta=ta/9;
				//cout<<"ta val is :"<<ta<<endl;				
				img.at<uchar>(i,j)=ta;			


		}
	}



	










    // namedWindow("MyWindow", CV_WINDOW_AUTOSIZE); //create a window with the name "MyWindow"
     imshow("new image", img); //display the image which is stored in the 'img' in the "MyWindow" window

     waitKey(0); //wait infinite time for a keypress

     destroyWindow("MyWindow"); //destroy the window with the name, "MyWindow"

     return 0;
}
