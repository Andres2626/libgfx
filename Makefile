SUBDIRS +=

OUTDIR  := build
INCDIR  := include
SRCDIR  := src

CFLAGS  := $(OUT_CFLAGS) -DGLAD_GLAPI_EXPORT_BUILD -I$(INCDIR)

BIN     := $(OUTDIR)/libgfx.$(DYNEXT)

ifeq ($(TOOLCHAIN), mingw)
LIB		:= $(OUTDIR)/libgfxdll.$(LIBEXT)
else ifeq ($(TOOLCHAIN), cygwin)
LIB    :=
endif

PHONY += all clean distclean
all: $(BIN)

distclean: clean
	
clean:
	rm -rf $(LIB)
	rm -rf $(BIN)
	rm -rf $(OUTDIR)/*

$(BIN): $(OUTDIR)/glad.o
	$(CC) -o $@ $^ $(EXEC_CFLAGS)$(LIB)

$(OUTDIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) -c $< -o $@ $(CFLAGS)

.PHONY: $(PHONY)
	