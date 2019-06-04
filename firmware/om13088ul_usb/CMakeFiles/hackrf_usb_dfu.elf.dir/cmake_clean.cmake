file(REMOVE_RECURSE
  "hackrf_usb_dfu.elf.pdb"
  "hackrf_usb_dfu.elf"
)

# Per-language clean rules from dependency scanning.
foreach(lang ASM C)
  include(CMakeFiles/hackrf_usb_dfu.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
