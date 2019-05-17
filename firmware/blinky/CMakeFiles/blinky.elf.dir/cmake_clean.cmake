file(REMOVE_RECURSE
  "blinky.elf.pdb"
  "blinky.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM C)
  include(CMakeFiles/blinky.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
