FONTS := ./fonts
TYPST := typst compile --font-path $(FONTS)

SRCS := $(wildcard *.typ)
PDFS := $(SRCS:.typ=.pdf)
DEPS := $(SRCS:.typ=.d)

.PHONY: all watch clean

all: $(PDFS)

define DEPS_GUARD_AWK
{
  print
  line = $$0
  sub(/\\$$/, " ", line)
  buf = buf " " line
}
END {
  sub(/^[^:]*:/, "", buf)
  gsub(/\\ /, "\001", buf)
  n = split(buf, dep, /[ \t]+/)
  for (i = 1; i <= n; i++) {
    if (dep[i] == "") continue
    d = dep[i]
    gsub(/\001/, "\\\\ ", d)
    print d ":"
  }
}
endef
export DEPS_GUARD_AWK

%.pdf: %.typ
	$(TYPST) --deps $*.d --deps-format make $< $@
	@awk "$$DEPS_GUARD_AWK" $*.d > $*.d.tmp && mv $*.d.tmp $*.d

-include $(DEPS)

watch: $(firstword $(SRCS))
	typst watch --font-path $(FONTS) $< $(<:.typ=.pdf)

clean:
	rm -f $(PDFS) $(DEPS) $(DEPS:.d=.d.tmp)
