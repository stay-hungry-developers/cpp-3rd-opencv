#!/bin/bash

# Set OpenCV version and download URL
OPENCV_VERSION="4.5.5"
OPENCV_URL="https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip"

# Set installation directory
INSTALL_DIR="/usr/local"

# Install dependencies
echo "Installing dependencies..."
apt-get install -y libjpeg-dev libpng-dev

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
  -DOPENCV_GENERATE_PKGCONFIG=YES \
  -DWITH_IPP=OFF \
  -DWITH_TBB=OFF \
  -DWITH_OPENMP=OFF \
  -DWITH_CUDA=OFF \
  -DWITH_OPENCL=OFF \
  -DWITH_FFMPEG=OFF \
  -DWITH_GTK=OFF \
  -DWITH_GTK_2_X=OFF \
  -DWITH_VTK=OFF \
  -DWITH_QT=OFF \
  -DWITH_JPEG=ON \
  -DWITH_PNG=ON \
  -DWITH_TIFF=OFF \
  -DWITH_OPENJPEG=OFF \
  -DWITH_JASPER=OFF \
  -DWITH_WEBP=OFF \
  -DWITH_ZLIB=OFF \
  -DWITH_OPENEXR=OFF \
  -DWITH_LAPACK=OFF \
  -DWITH_EIGEN=OFF \
  -DWITH_MKL=OFF \
  -DWITH_ITT=OFF \
  -DWITH_PROTOBUF=OFF \
  -DWITH_GDAL=OFF \
  -DWITH_GDCM=OFF \
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



