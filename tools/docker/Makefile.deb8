# Build the Docker image for people to use as a build image
# Only maintainers need this ... everyone else should use the 
# top level Makefile

ifndef ONL
$(error Need to define $$ONL variable to use this Makefile)
endif

# needed to get SSH agent credential forwarding
ifdef SSH_AUTH_SOCK
ssh_dir = $(shell dirname $$SSH_AUTH_SOCK)
SSH_AGENT=-v $(ssh_dir):$(ssh_dir) -e SSH_AUTH_SOCK=$$SSH_AUTH_SOCK
else
SSH_AGENT=
endif

DOCKER=docker


all: docker_run

docker_build: docker_check
	$(DOCKER) build -t sonn/onl_deb8_builder .

DOCKER_SHELL='$(ONL)/tools/docker/docker_shell.sh'
DOCKER_INTERACTIVE=-i

docker_run: docker_check
	$(DOCKER) run --privileged -t \
        $(DOCKER_INTERACTIVE) \
        -e USER=root \
        -e ONL=$(ONL) \
        -e MAKE_UID=`id -u` \
        -e MAKE_USER=$(USER) \
        -v $(ONL):$(ONL) \
        -w $(ONL) $(DNS) \
        -h "onl-builder" \
        $(SSH_AGENT) \
        sonn/onl_deb8_builder \
        bash -c $(DOCKER_SHELL)

# DANGER - destructively kills all containers and images - DO NOT USE
docker_nuke_all: docker_check
	@echo Before
	@echo ------------------------
	$(DOCKER) info
	$(DOCKER) rm `docker ps -aq` || true
	$(DOCKER) rmi `docker images -aq` || true
	@echo After
	@echo ------------------------
	$(DOCKER) info

docker_push: docker_check
	$(DOCKER) push sonn/onl_deb8_builder

docker_check: 
	@which $(DOCKER) || echo STOP : you need to install docker.io first
