include theos/makefiles/common.mk

BUNDLE_NAME = BBCurrency
BBCurrency_FILES = BBCurrencyController.m
BBCurrency_INSTALL_PATH = /System/Library/WeeAppPlugins/
BBCurrency_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk


after-install::
	install.exec "killall -9 SpringBoard"
