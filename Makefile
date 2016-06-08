GO_EASY_ON_ME = 1
THEOS_PACKAGE_DIR_NAME = debs
ARCHS = armv7 arm64
THEOS_DEVICE_IP = 192.168.1.100
THEOS_DEVICE_PORT=22
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = bunny
bunny_FILES = Tweak.xm $(wildcard Apps/*.xm)
bunny_FRAMEWORKS = UIKit CoreGraphics MobileCoreServices QuartzCore
bunny_PRIVATE_FRAMEWORKS = ChatKit IMCore AppSupport

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Tumblr"
include $(THEOS_MAKE_PATH)/aggregate.mk
