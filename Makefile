progname=context

all: $(progname).com

$(progname).com: $(progname).s
	fasm $^ $@

clean:
	rm -rf $(progname).com
