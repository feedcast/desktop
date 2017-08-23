export BUILD_IMAGE=toschneck/nativefier
export BUILD_DIR=${PWD}/build
export OSX_BUILD_DIR=${BUILD_DIR}/osx
export APP_NAME=Feedcast
export APP_URL=https://feedcast.io
export APP_MIN_WIDTH=800
export APP_MIN_HEIGHT=600

.PHONY: install
install:
	docker pull ${BUILD_IMAGE}

.PHONY: build_osx
build_osx:
	docker run -v ${OSX_BUILD_DIR}/:/build ${BUILD_IMAGE} -p osx --name ${APP_NAME} -f --min-width ${APP_MIN_WIDTH} --min-height ${APP_MIN_HEIGHT} --disable-context-menu --disable-dev-tools --single-instance ${APP_URL} build/
