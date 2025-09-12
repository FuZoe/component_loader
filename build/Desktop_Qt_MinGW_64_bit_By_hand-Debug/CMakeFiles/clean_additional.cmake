# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appcomponent_loader_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appcomponent_loader_autogen.dir\\ParseCache.txt"
  "appcomponent_loader_autogen"
  )
endif()
