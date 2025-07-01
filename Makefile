all: container-build rdopkg-c

container-build:
	if podman images | grep -q '^localhost/rdopkg'; then \
		echo "Please remove existing container first"; \
		echo "  podman image rm -f localhost/rdopkg"; \
	else \
		podman build . -t rdopkg; \
	fi

rdopkg-c: rdopkg.in
	cat $^ > $@
	chmod +x $@

clean:
	# Note: doesn't destroy the container image
	rm -f rdopkg
