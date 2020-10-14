

FILE=setup_android_sdk_and_ndk.sh

PLATFORM=?


ANDROID_SDK_PATH=null
ANDROID_NDK_PATH=null

print: oscheck
	@echo
	@echo FILE: $(FILE)
	@echo PLATFORM: $(PLATFORM)
	@echo PLATFORM: $(PLATFORM)
	@echo ANDROID_SDK_PATH: $(ANDROID_SDK_PATH)
	@echo ANDROID_NDK_PATH: $(ANDROID_NDK_PATH)

oscheck:

# Just a checker i can run when needed.

	@echo
	@echo -- OS-check : start --
	@echo

ifeq ($(GO_OS), windows)
	@echo Windows detected
	ANDROID_SDK_PATH=win
else
	
ifeq ($(GO_OS), linux)
	@echo Linux detected
	ANDROID_SDK_PATH=lin
else
	@echo Darwin detected
	ANDROID_SDK_PATH=dar
endif
endif

	@echo
	@echo -- OS-check : end --
	@echo



init:
	chmod +x ./$(FILE)

zshrc-open:
	code $(HOME)/.zshrc

run-linux:
	bash ./$(FILE) ~/Android/Sdk ~/Android/Ndk r18b
run-darwin:
	bash ./$(FILE)