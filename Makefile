include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = RemovedSound
RemovedSound_FILES = Tweak.xm
RemovedSound_FRAMEWORKS = UIKit AVFoundation
include $(THEOS_MAKE_PATH)/tweak.mk
