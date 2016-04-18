#include <opencv2/core/core.hpp>
#include <opencv2/video/background_segm.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/nonfree/features2d.hpp>

#include <iostream>
#include <sstream>
#include <vector>
#include <windows.h>
#include <ctime>

using namespace cv;
using namespace std;

Mat frame; //current frame
Mat foregroundFrame; //foregroundFrame generated
Ptr<BackgroundSubtractor> pMOG; //MOG Background subtractor

time_t lastChangedTime=0;

int keyboard;
bool leftSaved=false,rightSaved=false;
long long leftTotal=-1,rightTotal=-1;
long long xval=-1;
vector <string> store(10,"mid");

void slideLeft(){
	time_t timeNow = time(nullptr);
	if((timeNow-lastChangedTime)<2){
		cout<<"-----LEFT-TOO-SOON\n";
		return;
	}
	lastChangedTime=timeNow;
	cout<<"--------------SLIDE-LEFT----------------\n";
	// Simulate a key press
	keybd_event( VK_LEFT, 0x45, KEYEVENTF_EXTENDEDKEY | 0, 0);
	// Simulate a key release
	keybd_event( VK_LEFT, 0x45, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
}

void slideRight(){
	time_t timeNow = time(nullptr);
	if((timeNow-lastChangedTime)<2){
		cout<<"-----RIGHT-TOO-SOON\n";
		return;
	}
	lastChangedTime=timeNow;
	cout<<"--------------SLIDE-RIGHT---------------\n";
	// Simulate a key press
	keybd_event( VK_RIGHT, 0x45, KEYEVENTF_EXTENDEDKEY | 0, 0);
	// Simulate a key release
	keybd_event( VK_RIGHT, 0x45, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
}

void printAverage(Mat image){
	xval=0;
	for( int y = 0; y < image.rows; y++ ){
		for( int x = 0; x < image.cols; x++ ){
			int cnt=0;
			for(int c = 0 ; c < 3; c++){
				if(image.at<Vec3b>(y,x)[c]<10){
					cnt+=1;
				}
			}
			if(cnt==3){
				xval += (long long)x;
			}
		}
	}
	cout<<"Average X value of foreground: "<<xval<<" ";
	long long leftDeviation = abs(xval-leftTotal);
	long long rightDeviation = abs(xval-rightTotal);
	string currentVal = "";
	if(leftDeviation<(rightDeviation/2)){
		currentVal="left";
	}else if(rightDeviation<(leftDeviation/2)){
		currentVal="right";
	}else{
		currentVal="mid";
	}
	store.push_back(currentVal);
	int cntDiff=0, cntSame=0;
	for(int i=0;i<10;i++){
		if(store[i]!="mid" && store[10]!="mid" && store[i]!=store[10]){
			cntDiff+=1;
		}
		if(store[i]==store[10]){
			cntSame+=1;
		}else{
			cntSame=0;
		}
	}
	if(cntDiff>=3 && cntSame>=2){
		if(store[10]=="right"){
			slideRight();
		}else if(store[10]=="left"){
			slideLeft();
		}
	}
	store.erase(store.begin());
	cout<<"Hand position: "<<currentVal<<endl;
}
void processVideo() {
    //create the capture object
    VideoCapture capture(0);
    if(!capture.isOpened()){
        //error in opening the video input
        cerr << "Unable to open video file"<< endl;
        exit(EXIT_FAILURE);
    }
    //read input data. ESC or 'q' for quitting
    while( (char)keyboard != 'q' && (char)keyboard != 27 ){
		if(keyboard==2621440){				//left key
			lastChangedTime=time(nullptr);
			cout<<"Left configured as: "<<xval<<"\n";
			leftTotal=xval;
			keyboard=-1;
		}else if(keyboard==2490368){		//right key
			lastChangedTime=time(nullptr);
			cout<<"Right configured as: "<<xval<<"\n";
			rightTotal=xval;
			keyboard=-1;
		}
        //read the current frame
        if(!capture.read(frame)) {
            cerr << "Unable to read next frame." << endl;
            cerr << "Exiting..." << endl;
            exit(EXIT_FAILURE);
        }
        //update the background model
           //AND HERE!!!
        pMOG->operator()(frame, foregroundFrame);
        //get the frame number and write it on the current frame
        stringstream ss;
        rectangle(frame, cv::Point(10, 2), cv::Point(100,20),cv::Scalar(255,255,255), -1);
        ss << capture.get(CV_CAP_PROP_POS_FRAMES);
        string frameNumberString = ss.str();
        putText(frame, frameNumberString.c_str(), cv::Point(15, 15), FONT_HERSHEY_SIMPLEX, 0.5 , cv::Scalar(0,0,0));
        //show the current frame and the fg masks
        imshow("Frame", frame);
        imshow("Background Deletion", foregroundFrame);
		printAverage(foregroundFrame);
        //get the input from the keyboard
        keyboard = waitKey( 30 );
    }
    //delete capture object
    capture.release();
}

int main(int argc, char* argv[]){
	lastChangedTime=time(nullptr);
    namedWindow("Frame");
    namedWindow("Background Deletion");
    pMOG= new BackgroundSubtractorMOG(); //MOG approach
	processVideo();
    destroyAllWindows();
    return EXIT_SUCCESS;
}
