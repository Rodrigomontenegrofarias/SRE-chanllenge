FROM ubuntu:18.04
# Image providing Jupyter notebook server with Python 3.6 bindings for OpenCV 3.4.5
# Based on https://www.pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/



# Switch to root to be able to install stuff
USER root

# This will make apt-get install without question
ARG DEBIAN_FRONTEND=noninteractive

# Update package list, upgrade system and set default locale
RUN apt-get update  && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils && \
    apt-get -y install locales && \
    locale-gen "en_US.UTF-8" && \
    dpkg-reconfigure --frontend=noninteractive locales
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

# Install python3.6
RUN apt-get -y install python3.6-dev python3.6 python3-pip && \
    pip3 install --upgrade pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1

# Install packages required for compiling opencv
RUN apt-get -y install build-essential cmake unzip pkg-config wget

# Install packages providing support for several image formats like JPEG, PNG, TIFF
RUN apt-get -y install libjpeg-dev libpng-dev libtiff-dev

# Install packages providing support for several video formats
# so you can work with your camera stream and process video files
RUN apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev

# Install gtk (GUI components in opencv rely on gtk)
# as OpenCV’s highgui relies on the GTK library for GUI operations
RUN apt-get -y install libgtk-3-dev

# Install additional packages optimizing opencv
RUN apt-get -y install libatlas-base-dev gfortran

# Define OpenCV version to download, compile and install
ENV OPENCV_VERSION=3.4.5

# Download and extract OpenCV sources
WORKDIR /root
RUN echo "Downloading OpenCV source..." && \
    wget -O opencv.tgz https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.tar.gz -nv && \
    wget -O opencv_contrib.tgz https://github.com/Itseez/opencv_contrib/archive/${OPENCV_VERSION}.tar.gz -nv && \
    echo "Extracting OpenCV sources..." && \
    tar xzf opencv.tgz && \
    tar xzf opencv_contrib.tgz

# numpy is required for OpenCV Python bindings
RUN pip install numpy
RUN pip install matplotlib
RUN pip install pandas
#RUN pip install pandas as sb
RUN pip install keras
RUN pip install numpy
RUN pip install keras
RUN pip install scipy
RUN pip install scikit-learn
RUN pip install seaborn
RUN pip install keras
RUN pip install sklearn
RUN pip install conda
# verRUN pip install mpl_toolkits
RUN pip install imageio-ffmpeg
#RUN pip install mpl_toolkits
RUN pip install scikit-image
RUN pip install pillow
RUN pip install opencv-python
RUN pip install moviepy
RUN pip install --upgrade matplotlib
RUN pip install keras-models
RUN pip install keras 
RUN pip install chardet
RUN pip install tensorflow
RUN pip install plotly
RUN pip install statsmodels
RUN pip install openpyxl
RUN apt-get update && apt-get install -y git






# Configure, compile, install, clean up
#RUN mkdir opencv-${OPENCV_VERSION}/build && \
  #  cd opencv-${OPENCV_VERSION}/build && \
   # cmake -D CMAKE_BUILD_TYPE=RELEASE \
     #   -D CMAKE_INSTALL_PREFIX=/usr/local \
    #    -D INSTALL_PYTHON_EXAMPLES=ON \
     #   -D INSTALL_C_EXAMPLES=OFF \
     #   -D OPENCV_ENABLE_NONFREE=ON \
     #   -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-${OPENCV_VERSION}/modules \
     #   -D OPENCV_SKIP_PYTHON_LOADER=ON \
     #   -D PYTHON_EXECUTABLE=/usr/bin/python \
      
      #  -D BUILD_EXAMPLES=ON \
       # -D BUILD_DOCS=OFF \
       # -D BUILD_PERF_TESTS=OFF \
      #  -D BUILD_TESTS=OFF \
    #    .. && \
    #make -j4 && \
  #  make install && \
  #  ldconfig && \
    #rm -rf opencv*

# Copy Jupyter settings
COPY .jupyter .jupyter

# Install required python packages
RUN mkdir notebooks
RUN cd notebooks

ADD pickle_model.pkl notebooks/pickle_model.pkl
ADD guardar-notebook.ipynb notebooks/guardar-notebook.ipynb
ADD model.ipynb notebooks/model.ipynb
ADD requirements.txt notebooks/requirements.txt
RUN pip install -r notebooks/requirements.txt

# Populate notebooks
COPY datasets notebooks/datasets/
WORKDIR /root/notebooks
ENV PYTHONPATH=/root/notebooks



# Run tests
#RUN py.test tests/test_requirements.py

# Define entrypoint
ENTRYPOINT ["jupyter", "notebook"]

EXPOSE 8881
#docker run -p 8881:8888 monteblack1/notebook-111 

#docker build . -t monteblack1/notebook-111 