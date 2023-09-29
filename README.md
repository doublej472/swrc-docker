# Star Wars Republic Commando Docker Server

## About

Getting a Repcom server running by hand is painful. Getting it running on Linux is more painful.
This repo hopes to reduce that pain to the bare minimum by making many assumptions and being opinionated.

When using this to run Repcom servers you get:

* Admin patch including ready check
* Removed n00b guns and force all players spawn with blaster
* Removed CD key check
* Use community supported GameSpy server browser (using openSpy)
* Tuned `System.ini`:
  * Default gamemode changed to CTF with custom settings
  * Include custom maps dir at `/maps`, so you can keep custom maps separate from normal maps

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

Feel free to add `--network=host` and get rid of the port forwards so that connections are made directly to the server.
The maximum connection attempts per IP per minute has been increased to 60 so this may not be required.
