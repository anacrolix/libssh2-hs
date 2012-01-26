LIBS=-lssh2
GHC=ghc $(LIBS) --make
C2HS=c2hs
HSFILES=Network/SSH/Client/LibSSH2.hs Network/SSH/Client/LibSSH2/Types.hs Network/SSH/Client/Erros.hs Network/SSH/Client/Foreign.hs

all: ssh-client

ssh-client: ssh-client.hs $(HSFILES)
	$(GHC) $<

%.hs: %.chs
	$(C2HS) $<

clean:
	find . -name \*.hi -delete
	find . -name \*.chi -delete
	find . -name \*.o -delete
	find . -name \*.chs.h -delete
	rm -f ssh-client
