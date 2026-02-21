# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\Timothy\\Documents\\git\\coastrunner_cr1_firmware_32M1\\src\\bldc_sensor\\out\\bldc_sensor\\default.eep"
  "C:\\Users\\Timothy\\Documents\\git\\coastrunner_cr1_firmware_32M1\\src\\bldc_sensor\\out\\bldc_sensor\\default.hex"
  "C:\\Users\\Timothy\\Documents\\git\\coastrunner_cr1_firmware_32M1\\src\\bldc_sensor\\out\\bldc_sensor\\default.lss"
  "C:\\Users\\Timothy\\Documents\\git\\coastrunner_cr1_firmware_32M1\\src\\bldc_sensor\\out\\bldc_sensor\\default.srec"
  "C:\\Users\\Timothy\\Documents\\git\\coastrunner_cr1_firmware_32M1\\src\\bldc_sensor\\out\\bldc_sensor\\default.usersignatures"
  )
endif()
