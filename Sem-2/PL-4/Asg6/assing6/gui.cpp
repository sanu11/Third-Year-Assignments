#include "gui.h" 

int gui::display(image)
{
	namedWindow( "Display window", WINDOW_AUTOSIZE );		// Create a window for display.
	imshow( "Display window", image_gray );                // Show our image inside it.

	waitKey(0);                                          // Wait for a keystroke in the window
	return 0;
}
