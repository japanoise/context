progname=context

all: $(progname).com

%.com: %.s
	fasm $^ $@

clean:
	rm -rf $(progname).com
