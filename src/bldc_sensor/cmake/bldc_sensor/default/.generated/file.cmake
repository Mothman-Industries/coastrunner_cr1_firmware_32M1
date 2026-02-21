# The following variables contains the files used by the different stages of the build process.
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_assemble)
set_source_files_properties(${bldc_sensor_default_default_avr_gcc_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_assembleWithPreprocess)
set_source_files_properties(${bldc_sensor_default_default_avr_gcc_FILE_TYPE_assembleWithPreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_assembleWithPreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../a4910.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../adc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../comparator.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../dac.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../debug.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../hall.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../interface.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../motor.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../pid.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../psc.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../timing.c")
set_source_files_properties(${bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile_cpp)
set_source_files_properties(${bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_link)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_ihex)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_eep)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_lss)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_srec)
set(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_sig)
set(bldc_sensor_default_image_name "default.elf")
set(bldc_sensor_default_image_base_name "default")

# The output directory of the final image.
set(bldc_sensor_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/bldc_sensor")

# The full path to the final image.
set(bldc_sensor_default_full_path_to_image ${bldc_sensor_default_output_dir}/${bldc_sensor_default_image_name})

# Potential output file extensions
set(output_extensions
    .hex
    .lss
    .eep
    .srec
    .usersignatures)
list(TRANSFORM output_extensions PREPEND "${bldc_sensor_default_output_dir}/${bldc_sensor_default_image_base_name}")
