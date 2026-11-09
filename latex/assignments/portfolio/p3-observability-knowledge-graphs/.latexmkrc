# Adds the shared/ directory to the TeX search path so itvest.cls and bib.bib are found.
# Adjust the relative path if this document moves to a different nesting level.
ensure_path('TEXINPUTS', '../../../shared//');
ensure_path('BIBINPUTS', '../../../shared//');
