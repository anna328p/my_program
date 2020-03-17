CC ?= g++
TARGET ?= /usr/local
OPTIMIZATIONS = -O4 -flto -fno-fat-lto-objects -march=native -Ofast
CFLAGS := $(OPTIMIZATIONS) -std=gnu18 -Wno-unused-result -Wall -Wextra -pedantic

PROG := my_program

objects := $(patsubst %.c,%.o,$(wildcard *.c))

ifdef $$CFLAGS
	CFLAGS := $(CFLAGS) $$CFLAGS
endif

all: $(PROG)

.c.o:
	@echo -e "\tCC\t" $<
	@$(CC) $(CFLAGS) -c -o $@ $<

$(PROG): $(objects)
	@echo -e "\tLD\t" $(PROG)
	@$(CC) $(CFLAGS) -o $(PROG) $(objects)

clean:
	@echo -e "\tRM\t" *.o $(PROG)
	@rm -f *.o $(PROG)

%/:
	@echo -e "\tMKDIR\t" $@
	@mkdir -p $@

install: $(TARGET)/bin/
	@echo -e "\tINSTALL\t" $(PROG)
	@install -t $(TARGET)/bin $(PROG)

.PHONY: all clean install
