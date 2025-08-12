SUBDIRS +=
export MK = $(MAKE) -C

OUTDIR  := build
INCDIR  := include
SRCDIR  := src

CC      := gcc
CFLAGS  := -FPIC -DGLAD_GLAPI_EXPORT_BUILD -I$(INCDIR)

BIN     := $(OUTDIR)/libgfx.dll
LIB		:= $(OUTDIR)/libgfxdll.a

PHONY += all clean distclean
all: $(BIN)

distclean: clean
	
clean:
	rm -rf $(LIB)
	rm -rf $(BIN)
	rm -rf $(OUTDIR)/*

$(OUTDIR)/libgfx.dll: $(OUTDIR)/glad.o
	$(CC) -shared -o $@ $^ -Wl,--out-implib,$(LIB)

$(OUTDIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) -c $< -o $@ $(CFLAGS)

.PHONY: $(PHONY)
	