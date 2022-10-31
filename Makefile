RELEASE_VERSION = 2.0
TAG2 = $(shell curl https://api.github.com/repos/mikel-jauregui-ironchip/artifacts/releases/latest -s | jq .tag_name -r)
LIB_VERSION=${CI_COMMIT_BRANCH#*/}


build:
	echo $(findstring RELEASE_VERSION,TAG2)
	echo $(RELEASE_VERSION)
	echo $(TAG2)

ifneq ($(findstring $(RELEASE_VERSION),$(TAG2)))
		@echo Found
else
    @echo Not found
endif

ifeq ($(TAG)*, $(TAG2))
	@echo yes
else
		@echo NO
endif

VARIABLE=$(shell echo $(TAG2) | grep -q $(RELEASE_VERSION))
all:
	@echo $(VARIABLE)