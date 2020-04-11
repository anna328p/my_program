CC ?= g++
TARGET ?= /usr/local

GTK_CFLAGS != pkg-config --cflags gtk+-3.0
GTK_LIBS != pkg-config --libs gtk+-3.0

OPTIMIZATIONS := -O4 -flto -fno-fat-lto-objects -march=native -Ofast
COMMON_FLAGS := $(OPTIMIZATIONS) -std=gnu18 -Wno-unused-result -Wall -Wextra -pedantic

CFLAGS := $(COMMON_FLAGS) $(GTK_CFLAGS)
LIBS := $(COMMON_FLAGS) $(GTK_LIBS)

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
	@$(CC) $(LIBS) -o $(PROG) $(objects)

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
