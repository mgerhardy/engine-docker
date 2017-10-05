FROM debian:experimental

LABEL maintainer "martin.gerhardy@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y \
		pkg-config \
		build-essential \
		cmake \
		doxygen \
		graphviz \
		postgresql-server-dev-10 \
		postgresql-10 \
		libpq-dev \
		libassimp-dev \
		lua5.3 \
		liblua5.3-dev \
		libsdl2-dev \
		libenet-dev \
		libcurl4-openssl-dev \
		opencl-c-headers \
		libgtk-3-dev \
		qt5-default \
		qtbase5-dev \
		ocl-icd-libopencl1 \
		ocl-icd-opencl-dev \
		cppcheck \
		gcc-7 \
		clang-4.0 \
		ccache \
		valgrind \
		clang-format-4.0 \
		linux-perf \
		binutils-dev \
		libdw-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get autoremove -y \
	&& apt-get clean -y \
	&& su postgres -c createdb engine \
	&& su postgres -c "psql -c \"CREATE USER engine WITH PASSWORD 'engine';\"" \
	&& su postgres -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE engine to engine;\""
