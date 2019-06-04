file(REMOVE_RECURSE
  "hackrf_usb.elf.pdb"
  "hackrf_usb.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM C)
  include(CMakeFiles/hackrf_usb.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
