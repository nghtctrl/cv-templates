# Curriculum Vitae Templates

A small collection of [Typst](https://typst.app/) curriculum vitae templates designed by Jiho Kim.

## Requirements

[Typst](https://github.com/typst/typst#installation), `make`, and `awk` in your PATH.

## Quick Start

```sh
git clone https://github.com/nghtctrl/cv-templates.git
cd cv-templates
make     # compiles main.typ -> main.pdf
```

Then edit `templates/date-column-example.typ` (or a copy of it) with your own
details and run `make` again.

While drafting, use live preview instead:

```sh
make watch     # recompiles main.pdf on every save
```

To remove all generated PDFs and dependency files:

```sh
make clean
```

The Makefile records each document's dependencies with `typst --deps`, so
editing a file under `templates/` (or swapping a font) triggers a rebuild of
anything that includes it.

## Choosing a Template

`main.typ` is a switcher. Leave exactly one `#include` line uncommented and
comment out the rest:

```typst
#include "templates/date-column-example.typ"
// #include "templates/some-other-example.typ"
```

## Attribution

Libertinus is licensed separately under the SIL Open Font License; see [fonts/libertinus/OFL.txt](fonts/libertinus/OFL.txt).
