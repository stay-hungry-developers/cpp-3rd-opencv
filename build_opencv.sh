#!/bin/bash

# sudo apt-get -y update
# sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev libopencv-dev 

# Set OpenCV version and download URL
OPENCV_VERSION="2.4.13.6"
OPENCV_URL="https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip"

# Set installation directory
INSTALL_DIR="/usr/local"

# Install dependencies
# echo "Installing dependencies..."
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y build-essential cmake libgtk2.0-dev pkg-config python-dev python-numpy libavcodec-dev libavformat-dev libswscale-dev

# Download and extract OpenCV
echo "Downloading OpenCV..."
curl -L "${OPENCV_URL}" -o opencv.zip
unzip opencv.zip
rm opencv.zip

# Configure and build OpenCV
cd opencv-${OPENCV_VERSION}
mkdir build && cd build
echo "Configuring OpenCV..."
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  -DBUILD_SHARED_LIBS=OFF \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DBUILD_EXAMPLES=OFF \
  -DWITH_IPP=OFF \
  -DWITH_TBB=OFF \
  -DWITH_OPENMP=OFF \
  -DWITH_CUDA=OFF \
  -DWITH_OPENCL=OFF \
  -DWITH_FFMPEG=OFF \
  -DWITH_GTK=ON \
  -DWITH_GTK_2_X=ON \
  -DWITH_VTK=OFF \
  -DWITH_QT=OFF \
  -DWITH_JPEG=ON \
  -DWITH_PNG=ON \
  -DWITH_TIFF=ON \
  -DWITH_WEBP=ON \
  -DWITH_ZLIB=ON \
  -DWITH_OPENEXR=ON \
  -DWITH_LAPACK=OFF \
  -DWITH_EIGEN=OFF \
  -DWITH_MKL=OFF \
  -DWITH_ITT=OFF \
  -DWITH_PROTOBUF=OFF \
  -DWITH_GDAL=OFF \
  -DWITH_GDCM=OFF \
  -DWITH_QT=OFF \
  -DWITH_CUFFT=OFF \
  -DWITH_CUBLAS=OFF \
  -DWITH_NVCUVID=OFF \
  -DWITH_CUDA_SPARSE=OFF \
  -DWITH_CUDNN=OFF \
  -DWITH_CUBLASXT=OFF \
  -DWITH_NVML=OFF \
  -DWITH_QUIRC=OFF \
  -DWITH_OPENCL_SVM=OFF \
  -DWITH_OPENCLAMDFFT=OFF \
  -DWITH_OPENCLAMDBLAS=OFF \
  -DWITH_VA=OFF \
  -DWITH_VA_INTEL=OFF \
  -DWITH_VA_FFMPEG=OFF \
  -DWITH_GSTREAMER=OFF \
  -DWITH_GSTREAMER_0_10=OFF \
  -DWITH_AVFOUNDATION=OFF \
  -DWITH_CAROTENE=OFF \
  -DWITH_IMAGEIO=OFF \
  -DWITH_GPHOTO2=OFF \
  -DWITH_DC1394=OFF \
  -DWITH_NVCUDA=OFF \
  -DWITH_NVTX=OFF \
  -DWITH_XINE=OFF \
  -DWITH_LAPACK=OFF \
  -DWITH_OPENBLAS=OFF \
  -DWITH_ACCELERATE=OFF \
  ..

echo "Building OpenCV..."
make -j4

# Install OpenCV
echo "Installing OpenCV..."
sudo make install



