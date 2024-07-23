DOCKER		 = docker

CONTAINER	 = verilog-pcie

BUILD_IMAGE	 = $(CONTAINER):build

BUILD_FLAGS	 = --rm
BUILD_FLAGS	+= --tag $(BUILD_IMAGE)
BUILD_FLAGS	+= -f ./.docker/Dockerfile

RUN_FLAGS	 = --interactive --tty
RUN_FLAGS	+= --detach
RUN_FLAGS	+= --name $(CONTAINER)

all: build run

build:
	$(DOCKER) build $(BUILD_FLAGS) .

run:
	$(DOCKER) run $(RUN_FLAGS) $(BUILD_IMAGE)
