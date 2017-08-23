export BUILD_IMAGE=toschneck/nativefier
export BUILD_DIR=${PWD}/build
export OSX_BUILD_DIR=${BUILD_DIR}/osx
export LINUX_BUILD_DIR=${BUILD_DIR}/linux
export APP_NAME=Feedcast
export APP_URL=https://feedcast.io
export APP_MIN_WIDTH=800
export APP_MIN_HEIGHT=600

.PHONY: install
install:
	docker pull ${BUILD_IMAGE}

.PHONY: build
build: build_osx build_linux

.PHONY: build_osx
build_osx:
	docker run -v ${OSX_BUILD_DIR}/:/build ${BUILD_IMAGE} -p osx --name ${APP_NAME} -f --min-width ${APP_MIN_WIDTH} --min-height ${APP_MIN_HEIGHT} --disable-context-menu --disable-dev-tools --single-instance ${APP_URL} build/

.PHONY: build_linux
build_linux:
	docker run -v ${LINUX_BUILD_DIR}/:/build ${BUILD_IMAGE} -p linux --name ${APP_NAME} -f --min-width ${APP_MIN_WIDTH} --min-height ${APP_MIN_HEIGHT} --disable-context-menu --disable-dev-tools --single-instance ${APP_URL} build/
