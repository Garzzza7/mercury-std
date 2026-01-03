.PHONY: main clean

main: main.m
	mmc -E --make main --no-warn-unused-imports -O5 --no-warn-interface-imports --no-warn-nothing-exported
clean:
	rm -rf *.c *.o *.c_date *.mh *.d *.err main Mercury/ Mercury.modules
