include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(bldc_sensor_default_library_list )

# Handle files with suffix s, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_assemble)
add_library(bldc_sensor_default_default_avr_gcc_assemble OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_assemble})
    bldc_sensor_default_default_avr_gcc_assemble_rule(bldc_sensor_default_default_avr_gcc_assemble)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_assemble>")

endif()

# Handle files with suffix S, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_assembleWithPreprocess)
add_library(bldc_sensor_default_default_avr_gcc_assembleWithPreprocess OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_assembleWithPreprocess})
    bldc_sensor_default_default_avr_gcc_assembleWithPreprocess_rule(bldc_sensor_default_default_avr_gcc_assembleWithPreprocess)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_assembleWithPreprocess>")

endif()

# Handle files with suffix [cC], for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile)
add_library(bldc_sensor_default_default_avr_gcc_compile OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile})
    bldc_sensor_default_default_avr_gcc_compile_rule(bldc_sensor_default_default_avr_gcc_compile)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_compile>")

endif()

# Handle files with suffix cpp, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile_cpp)
add_library(bldc_sensor_default_default_avr_gcc_compile_cpp OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_compile_cpp})
    bldc_sensor_default_default_avr_gcc_compile_cpp_rule(bldc_sensor_default_default_avr_gcc_compile_cpp)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_compile_cpp>")

endif()

# Handle files with suffix elf, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_ihex)
add_library(bldc_sensor_default_default_avr_gcc_objcopy_ihex OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_ihex})
    bldc_sensor_default_default_avr_gcc_objcopy_ihex_rule(bldc_sensor_default_default_avr_gcc_objcopy_ihex)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_objcopy_ihex>")

endif()

# Handle files with suffix elf, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_eep)
add_library(bldc_sensor_default_default_avr_gcc_objcopy_eep OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_eep})
    bldc_sensor_default_default_avr_gcc_objcopy_eep_rule(bldc_sensor_default_default_avr_gcc_objcopy_eep)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_objcopy_eep>")

endif()

# Handle files with suffix elf, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_lss)
add_library(bldc_sensor_default_default_avr_gcc_objcopy_lss OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_lss})
    bldc_sensor_default_default_avr_gcc_objcopy_lss_rule(bldc_sensor_default_default_avr_gcc_objcopy_lss)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_objcopy_lss>")

endif()

# Handle files with suffix elf, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_srec)
add_library(bldc_sensor_default_default_avr_gcc_objcopy_srec OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_srec})
    bldc_sensor_default_default_avr_gcc_objcopy_srec_rule(bldc_sensor_default_default_avr_gcc_objcopy_srec)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_objcopy_srec>")

endif()

# Handle files with suffix elf, for group default-avr-gcc
if(bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_sig)
add_library(bldc_sensor_default_default_avr_gcc_objcopy_sig OBJECT ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_objcopy_sig})
    bldc_sensor_default_default_avr_gcc_objcopy_sig_rule(bldc_sensor_default_default_avr_gcc_objcopy_sig)
    list(APPEND bldc_sensor_default_library_list "$<TARGET_OBJECTS:bldc_sensor_default_default_avr_gcc_objcopy_sig>")

endif()


# Main target for this project
add_executable(bldc_sensor_default_image_HOnbTgD5 ${bldc_sensor_default_library_list})

set_target_properties(bldc_sensor_default_image_HOnbTgD5 PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${bldc_sensor_default_output_dir}")
target_link_libraries(bldc_sensor_default_image_HOnbTgD5 PRIVATE ${bldc_sensor_default_default_avr_gcc_FILE_TYPE_link})

#Add objcopy steps
bldc_sensor_default_objcopy_ihex_rule(bldc_sensor_default_image_HOnbTgD5)
bldc_sensor_default_objcopy_eep_rule(bldc_sensor_default_image_HOnbTgD5)
bldc_sensor_default_objcopy_lss_rule(bldc_sensor_default_image_HOnbTgD5)
bldc_sensor_default_objcopy_srec_rule(bldc_sensor_default_image_HOnbTgD5)
bldc_sensor_default_objcopy_sig_rule(bldc_sensor_default_image_HOnbTgD5)
# Add the link options from the rule file.
bldc_sensor_default_link_rule( bldc_sensor_default_image_HOnbTgD5)


