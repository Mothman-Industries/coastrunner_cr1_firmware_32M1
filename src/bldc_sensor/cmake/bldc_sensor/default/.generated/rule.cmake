# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "C:/Users/Timothy/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(bldc_sensor_default_default_avr_gcc_assemble_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "${MP_EXTRA_AS_PRE}"
        "-mmcu=atmega32m1"
        "-BC:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/gcc/dev/atmega32m1"
        "-c"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2,-g")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__ATmega32M1__"
        PRIVATE "default=default")
    target_include_directories(${target}
        PRIVATE "C:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/include"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers/adc"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers/comparator"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers/pll"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/conf"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/."
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/uart"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers")
endfunction()
function(bldc_sensor_default_default_avr_gcc_assembleWithPreprocess_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "${MP_EXTRA_AS_PRE}"
        "-mmcu=atmega32m1"
        "-BC:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/gcc/dev/atmega32m1"
        "-c"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2,-g")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__ATmega32M1__"
        PRIVATE "default=default")
    target_include_directories(${target}
        PRIVATE "C:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/include"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers/adc"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers/comparator"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers/pll"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/conf"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/."
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/uart"
        PRIVATE "../../../../../../../Desktop/AVR194 Trapezoid drive with overcurrent/avr194_software/Applications/MC310_bldc_sensor/../../Drivers")
endfunction()
function(bldc_sensor_default_default_avr_gcc_compile_rule target)
    set(options
        "-g"
        "-gdwarf-2"
        "${MP_EXTRA_CC_PRE}"
        "-mmcu=atmega32m1"
        "-BC:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/gcc/dev/atmega32m1"
        "-x"
        "c"
        "-c"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-Os"
        "-ffunction-sections"
        "-fdata-sections"
        "-fpack-struct"
        "-fshort-enums"
        "-Wall")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__ATmega32M1__"
        PRIVATE "default=default")
    target_include_directories(${target}
        PRIVATE "C:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/include"
        PRIVATE "./../Drivers"
        PRIVATE "./conf"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../.."
        PRIVATE "./uart")
endfunction()
function(bldc_sensor_default_default_avr_gcc_compile_cpp_rule target)
    set(options
        "-g"
        "-gdwarf-2"
        "${MP_EXTRA_CC_PRE}"
        "-mmcu=atmega32m1"
        "-BC:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/gcc/dev/atmega32m1"
        "-x"
        "c++"
        "-c"
        "-O0"
        "-ffunction-sections"
        "-fdata-sections")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__ATmega32M1__"
        PRIVATE "default=default")
    target_include_directories(${target} PRIVATE "C:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/include")
endfunction()
function(bldc_sensor_default_link_rule target)
    set(options
        "-gdwarf-2"
        "${MP_EXTRA_LD_PRE}"
        "-mmcu=atmega32m1"
        "-BC:/Program Files (x86)/Atmel/Studio/7.0/Packs/Atmel/ATmega_DFP/1.4.331/gcc/dev/atmega32m1"
        "-Wl,--defsym=__MPLAB_BUILD=1${MP_EXTRA_LD_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1"
        "-Wl,--gc-sections")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__ATmega32M1__"
        PRIVATE "default=default")
endfunction()
function(bldc_sensor_default_objcopy_ihex_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --output-target=ihex ${bldc_sensor_default_image_name} ${bldc_sensor_default_image_base_name}.hex
        WORKING_DIRECTORY ${bldc_sensor_default_output_dir})
endfunction()
function(bldc_sensor_default_objcopy_eep_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --only-section=.eeprom --change-section-lma .eeprom=0 --no-change-warnings --output-target=ihex ${bldc_sensor_default_image_name} ${bldc_sensor_default_image_base_name}.eep
        WORKING_DIRECTORY ${bldc_sensor_default_output_dir})
endfunction()
function(bldc_sensor_default_objcopy_lss_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJDUMP}
        ARGS --disassemble --wide --demangle --line-numbers --section-headers --source ${bldc_sensor_default_image_name} > ${bldc_sensor_default_image_base_name}.lss
        WORKING_DIRECTORY ${bldc_sensor_default_output_dir})
endfunction()
function(bldc_sensor_default_objcopy_srec_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --output-target=srec --remove-section=.eeprom --remove-section=.fuse --remove-section=.lock --remove-section=.signature ${bldc_sensor_default_image_name} ${bldc_sensor_default_image_base_name}.srec
        WORKING_DIRECTORY ${bldc_sensor_default_output_dir})
endfunction()
function(bldc_sensor_default_objcopy_sig_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --only-section=.user_signatures --change-section-lma .user_signatures=0 --no-change-warnings --output-target=ihex ${bldc_sensor_default_image_name} ${bldc_sensor_default_image_base_name}.usersignatures
        WORKING_DIRECTORY ${bldc_sensor_default_output_dir})
endfunction()
