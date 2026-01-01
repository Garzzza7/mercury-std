.PHONY: main clean

main: main.m
	mmc -E --make main
clean:
	rm -rf *.c *.o *.c_date *.mh *.d *.err main Mercury/ Mercury.modules
