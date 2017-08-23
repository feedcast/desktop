export BUILD_DIR=${PWD}/build
export OSX_BUILD_DIR=${BUILD_DIR}/osx

.PHONY: install
install:
	docker pull toschneck/nativefier

.PHONY: build_osx
build_osx:
	docker run -v ${OSX_BUILD_DIR}/:/build toschneck/nativefier -p osx --name Feedcast -f --min-width 800 --min-height 600 --disable-context-menu --disable-dev-tools --single-instance https://feedcast.io build/
