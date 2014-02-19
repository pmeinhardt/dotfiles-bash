# manage dotfiles via `make`

default: install

bootstrap:
	@./script/bootstrap

install:
	@./script/install

update:
	@./script/update

uninstall:
	@./script/uninstall
