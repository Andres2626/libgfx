SUBDIRS +=
export MK = $(MAKE) -C

OUTDIR  := build
INCDIR  := include
SRCDIR  := src

CC      := gcc
CFLAGS  := -FPIC -DGLAD_GLAPI_EXPORT_BUILD -I$(INCDIR)

LIB     := $(OUTDIR)/libgfx.so

PHONY += all clean distclean
all: $(LIB)

distclean:

clean:

$(OUTDIR)/libgfx.so: $(OUTDIR)/glad.o
	$(CC) -shared -o $@ $^

$(OUTDIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) -c $< -o $@ $(CFLAGS)



.PHONY: $(PHONY)
	