ASSIGNMENT A6
Roll No. 3275

#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <math.h>

using namespace cv;
using namespace std;
double theta=30;

void brightness(int seed,Mat temp)
{
	Mat B=temp.clone();
	Size sz=B.size();
	int mrows=sz.height;
	int mcolums=sz.width;
	for(int i=0;i<mrows;i++)
		for(int j=0;j<mcolums;j++)
			for(int k=0;k<3;k++)
				B.at<Vec3b>(i,j)[k]=saturate_cast<uchar>(seed+B.at<Vec3b>(i,j)[k]);
	namedWindow("Brightness", CV_WINDOW_AUTOSIZE);
	imshow("Brightness", B);
	waitKey(0);
}

void contrast(int alpha,int beta,Mat temp)
{
	Mat B=temp.clone();
	Size sz=B.size();
	int mrows=sz.height;
	int mcolums=sz.width;
	for(int i=0;i<mrows;i++)
		for(int j=0;j<mcolums;j++)
			for(int k=0;k<3;k++)
				B.at<Vec3b>(i,j)[k]=saturate_cast<uchar>(alpha+(beta*B.at<Vec3b>(i,j)[k]));
	namedWindow("Contrast", CV_WINDOW_AUTOSIZE);
	imshow("Contrast", B);
	waitKey(0);
}

void blurr(Mat temp)
{
	Mat B=temp.clone();
	Size sz=B.size();
	int mrows=sz.height;
	int mcolums=sz.width;
	for(int i=0;i<mrows;i++)
		for(int j=0;j<mcolums;j++)
			for(int k=0;k<3;k++)
			{
				int temp1=0;
				for(int l=-1;l<=1;l++)
					for(int m=-1;m<=1;m++)
						temp1+=B.at<Vec3b>(i+l,j+m)[k];
				temp1/=9;
				B.at<Vec3b>(i,j)[k]=saturate_cast<uchar>(temp1);
			}
	namedWindow("Blurr", CV_WINDOW_AUTOSIZE);
	imshow("Blurr", B);
	waitKey(0);
}

void sharpen(Mat temp)
{
	int kernel[3][3]={{0,-1,0},{-1,5,-1},{0,-1,0}};
	Mat B=temp.clone();
	Size sz=B.size();
	int mrows=sz.height;
	int mcolums=sz.width;
	for(int i=0;i<mrows;i++)
		for(int j=0;j<mcolums;j++)
			for(int k=0;k<3;k++)
			{
				int temp1=0;
				for(int l=-1;l<=1;l++)
					for(int m=-1;m<=1;m++)
						temp1+=(B.at<Vec3b>(i+l,j+m)[k])*(kernel[l+1][m+1]);
				B.at<Vec3b>(i,j)[k]=saturate_cast<uchar>(temp1);
			}
	namedWindow("Sharpen", CV_WINDOW_AUTOSIZE);
	imshow("Sharpen", B);
	waitKey(0);
}

void rotations(Mat temp)
{
	Mat B = Mat::zeros( temp.size(), temp.type() );
	int px,py,ox,oy;
	 theta=(3.14/180)*theta;
	 ox=temp.cols/2;
	 oy=temp.rows/2;
	 for(int y=0;y<temp.rows;y++)
	     for(int x=0;x<temp.cols;x++)
	     {
	         Vec3b color = temp.at<Vec3b>(Point(x,y));
	         px = cos(theta) * (x-ox) - sin(theta) * (y-oy) + ox;
	         py = sin(theta) * (x-ox) + cos(theta) * (y-oy) + oy;
	         if(px<temp.cols && py<temp.rows && py>0 && px>0)
	         B.at<Vec3b>(Point(px,py)) = color;
	     }
	 namedWindow("Rotate", CV_WINDOW_AUTOSIZE);
	 imshow("Rotate", B);
	 waitKey(0);
}

void histogram(Mat img)
{
	Mat histo = Mat::zeros( img.size()*2, img.type() );
	int reda[256],bluea[256],greena[256];
	Vec3b Colo,white,redc,bluec,greenc,black;
	white.val[0]=white.val[1]=white.val[2]=255;
	redc.val[0]=redc.val[1]=redc.val[2]=0;
	bluec.val[0]=bluec.val[1]=bluec.val[2]=0;
	greenc.val[0]=greenc.val[1]=greenc.val[2]=0;
	black.val[0]=black.val[1]=black.val[2]=0;
	redc[2]=255;
	bluec[0]=255;
	greenc[1]=255;
	for(int v=0;v<256;v++)
	    greena[v]=bluea[v]=reda[v]=0;
	double N=0;
	for(int y=0;y<img.rows;y++)
	    for(int x=0;x<img.cols;x++)
	    {
	        Vec3b color = img.at<Vec3b>(Point(x,y));
	        int blue = color.val[0];
	        int green = color.val[1];
	        int red = color.val[2];
	        reda[red]++;
	        bluea[blue]++;
	        greena[green]++;
	        N++;
	    }
	for(int y=0;y<histo.rows;y++)
	    for(int x=0;x<histo.cols;x++)
		    histo.at<Vec3b>(Point(x,y)) = white;
	double sum_r=0,sum_b=0,sum_g=0;
	for(int q=0;q<256;q++)
	{
	    sum_r+=reda[q]*q;
	    sum_g+=greena[q]*q;
	    sum_b+=bluea[q]*q;
	}
	double mean_r=sum_r/N,mean_g=sum_g/N,mean_b=sum_b/N;
	double tot_r=0,tot_g=0,tot_b=0;
	for(int q=0;q<256;q++)
	{
	    tot_r+=reda[q]*(q-mean_r)*(q-mean_r);
	    tot_g+=greena[q]*(q-mean_g)*(q-mean_g);
	    tot_b+=bluea[q]*(q-mean_b)*(q-mean_b);
	}
	double SD_R=sqrt(tot_r/N),SD_G=sqrt(tot_g/N),SD_B=sqrt(tot_b/N);
	cout<<"Red Mean::"<<mean_r<<" Red Sd::"<<SD_R<<endl;
	cout<<"Green Mean::"<<mean_g<<" Green Sd::"<<SD_G<<endl;
	cout<<"BLue Mean::"<<mean_b<<" BLue Sd::"<<SD_B<<endl;
	for(int x=0;x<1000;x++)
	    histo.at<Vec3b>(Point(x,700)) = black;
	for(int y=0;y<720;y++)
	{
	    histo.at<Vec3b>(Point(30,y)) = black;
	    histo.at<Vec3b>(Point(30+2+256+25,y)) = black;
	    histo.at<Vec3b>(Point(30+2+256+25+256+25,y)) = black;
	}
	int x=32;
	int y=700;
	for(int v=0;v<256;v++)
	{
	    y=700;
	    for(int c=0;c<=reda[v]/10;c++)
	        if(y>0)
	            histo.at<Vec3b>(Point(x,y--)) = redc;
	    x++;
	}
	x+=25+2;
	for(int v=0;v<256;v++)
	{
	    y=700;
	    for(int c=0;c<=greena[v]/10;c++)
	    if(y>0)
	        histo.at<Vec3b>(Point(x,y--)) = greenc;
	    x++;
	}
	x+=25+2;
	for(int v=0;v<256;v++)
	{
	    y=700;
	    for(int c=0;c<=bluea[v]/10;c++)
	    if(y>0)
	        histo.at<Vec3b>(Point(x,y--)) = bluec;
	    x++;
	}
	namedWindow("Histogram", CV_WINDOW_AUTOSIZE);
	imshow("Histogram", histo);
	waitKey(0);
}

void pdf_fun(Mat img)
{
	Mat pdf = Mat::zeros( img.size()*2, img.type() );
	int reda[256],bluea[256],greena[256];
	Vec3b Colo,white,redc,bluec,greenc,black;
	white.val[0]=white.val[1]=white.val[2]=255;
	redc.val[0]=redc.val[1]=redc.val[2]=0;
	bluec.val[0]=bluec.val[1]=bluec.val[2]=0;
	greenc.val[0]=greenc.val[1]=greenc.val[2]=0;
	black.val[0]=black.val[1]=black.val[2]=0;
	redc[2]=255;
	bluec[0]=255;
	greenc[1]=255;
	for(int v=0;v<256;v++)
	    greena[v]=bluea[v]=reda[v]=0;
	double N=0;
	for(int y=0;y<img.rows;y++)
	    for(int x=0;x<img.cols;x++)
	    {
	        Vec3b color = img.at<Vec3b>(Point(x,y));
	        int blue = color.val[0];
	        int green = color.val[1];
	        int red = color.val[2];
	        reda[red]++;
	        bluea[blue]++;
	        greena[green]++;
	        N++;
	    }
	for(int y=0;y<pdf.rows;y++)
	    for(int x=0;x<pdf.cols;x++)
		    pdf.at<Vec3b>(Point(x,y)) = white;
	for(int x=0;x<1000;x++)
    	pdf.at<Vec3b>(Point(x,700)) = black;
	for(int y=0;y<720;y++)
	{
	    pdf.at<Vec3b>(Point(30,y)) = black;
	    pdf.at<Vec3b>(Point(30+2+256+25,y)) = black;
	    pdf.at<Vec3b>(Point(30+2+256+25+256+25,y)) = black;
	}
	int x=32;
	int y=700;
	for(int v=0;v<256;v++)
	{
	    y=700;
	    float c = (float)reda[v]/(img.rows*img.cols);
	    if(c>0)
	        pdf.at<Vec3b>(Point(x,y-c*10000)) = redc;
	    x++;
	}
	x+=25+2;
	for(int v=0;v<256;v++)
	{
	    y=700;
	    float c = (float)greena[v]/(img.rows*img.cols);
	    if(c>0)
	        pdf.at<Vec3b>(Point(x,y-c*10000)) = greenc;
	    x++;
	}
	x+=25+2;
	for(int v=0;v<256;v++)
	{
	    y=700;
	    float c = (float)bluea[v]/(img.rows*img.cols);
	    if(c>0)
	        pdf.at<Vec3b>(Point(x,y-c*10000)) = bluec;
	    x++;
    }
    namedWindow("pdf", CV_WINDOW_AUTOSIZE);
	imshow("pdf", pdf);
	waitKey(0);
}


int main( int argc, const char** argv )
{
	Mat img = imread("a6.jpg", CV_LOAD_IMAGE_UNCHANGED);
	if (img.data == NULL)
	{
		cout << "Image cannot be loaded..!!" << endl;
		system("pause");
		return -1;
	}
	namedWindow("Original Image", CV_WINDOW_AUTOSIZE);
	imshow("Original Image", img);
	brightness(100,img);
	contrast(25,3,img);
	blurr(img);
	sharpen(img);
	rotations(img);
	histogram(img);
	pdf_fun(img);
	return 0;
}


