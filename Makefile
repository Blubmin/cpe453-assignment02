CC=gcc
CFLAGS=-Wall -ansi -pedantic

END_COLOR=\e[0m
INFO_COLOR=\e[36;1m
PADDING======================
define PRINT_INFO
	@printf "$(INFO_COLOR)$(PADDING)\n$(1)\n$(PADDING)$(END_COLOR)\n"
endef
NEWLINE=@printf "\n"

liblwp.so: lwp.o magic64.o
	$(call PRINT_INFO,Building liblwp.so)
	$(CC) $(CFLAGS) -shared -fpic -o liblwp.so lwp.o magic64.o
	$(NEWLINE)

lwp.o: lwp.c
	$(call PRINT_INFO,Building lwp.o)
	$(CC) $(CFLAGS) -c lwp.c
	$(NEWLINE)

magic64.o: magic64.S
	$(call PRINT_INFO,Building magic64.o)
	$(CC) -o magic64.o -c magic64.S
	$(NEWLINE)

clean:
	$(call PRINT_INFO,Deleting all .o files)
	rm *.o
	$(NEWLINE)