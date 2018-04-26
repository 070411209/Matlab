/*
************vs2013+opencv2.9************
***************Belong*******************
************nmgwbd@163.com**************
*/



#include <windows.h>

#include <iostream>
using namespace std;

#include <cv.h>
#include <highgui.h>
#include <cxcore.h>
using namespace cv;

#include "sift.h"


int main()
{
	Mat src = imread("jobs_512.jpg");
	Keypoint mykeypoint;
	if (src.empty())
	{
		cout << "file open error! " << endl;
		//getchar();
		return -1;
	}
	
	if(src.channels()!=3)
	return -2;

	Vector<Keypoint> features;

	Sift(src, features, 1.6);
	//	DrawKeyPoints(src, features);
	DrawSiftFeatures(src, features);

	mykeypoint.write_features(features, "descriptor.txt");
	
	imshow("src", src);

	waitKey(0);
	return 0;
}
