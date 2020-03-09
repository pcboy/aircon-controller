.PHONY: webui

secrets:
	ncypher decrypt < include/secrets.h.enc > include/secrets.h
	cd webui && make secrets

webui:
	cd webui && make && mv dist ../public
