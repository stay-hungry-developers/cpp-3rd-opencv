#include <opencv2/opencv.hpp>
using namespace cv;

int main(int argc, char** argv)
{
  // Read the image
  Mat image = imread("input.jpg");

  // Resize the image
  Mat resizedImage;
  resize(image, resizedImage, Size(640, 480));

  // Display the original and resized images
  namedWindow("Original Image", WINDOW_NORMAL);
  imshow("Original Image", image);

  namedWindow("Resized Image", WINDOW_NORMAL);
  imshow("Resized Image", resizedImage);

  waitKey(0);
  return 0;
}
