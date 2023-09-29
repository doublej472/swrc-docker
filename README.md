# Star Wars Republic Commando Docker Server

## Building

Copy over your repcom game folder into a folder named `repcom` on the same level
as the `Dockerfile`.

Then run this to build the container image:

```bash
docker build . -t repcom-container:latest
```

## Running

Here is an example on how to run the server locally, assuming that
`maps` exists in your current directory and has extra maps you want
to include with the server:

```bash
docker run -it \
	--restart=unless-stopped \
	-p 7777:7777/tcp -p 7777:7777/udp \
	-p 11138:11138/tcp -p 11138:11138/udp \
	-e PASSWORD=supersecret \
	--mount=type=bind,source=maps,destination=/maps,ro=true \
	--name repcom repcom-container:latest
```
