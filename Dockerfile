FROM x11docker/lxqt

# install GNURadio
RUN apt-get update && apt-get install -y build-essential cmake git python-pip \
            libboost-all-dev libusb-1.0-0-dev python-six python-mako pkg-config \
            doxygen python-docutils cmake build-essential libncurses5 libncurses5-dev \
            libcppunit-dev python-cheetah libqt4-opengl-dev libqwt-dev \
            python3 python3-pip

# install pybombs
RUN pip install mako requests numpy
RUN pip install --upgrade git+https://github.com/gnuradio/pybombs.git
RUN pybombs auto-config
RUN pybombs recipes add-defaults
RUN pybombs prefix init /pybombs -R gnuradio-stable
RUN pybombs install theseus-cores

# download and install the GNURadio DVB-S2 transmitter
COPY repositories/gr-dvbs2 /repositories/gr-dvbs2
WORKDIR /repositories/gr-dvbs2/build
RUN cmake .. -DCMAKE_PREFIX_PATH=/pybombs/lib/cmake/gnuradio
RUN make && make install && ldconfig
RUN chmod +x /pybombs/setup_env.sh

# install useful python libraries
RUN pip3 install jupyter matplotlib numpy pylink-satcom itur

# fixes linking of pylinks latex template
WORKDIR /usr/lib/python3/dist-packages/pylink
RUN ln -s /usr/local/lib/python3.7/dist-packages/pylink/tex 

WORKDIR /
