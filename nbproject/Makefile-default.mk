#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=application/source/dejavusansbold9.c application/source/verdanabold14.c application/source/draw_edit_page.c application/source/draw_main_page.c application/source/gui.c application/source/drawing.c application/source/lcd_adc.c application/source/lcd_gpio.c application/source/sm_gui.c application/source/app_timer.c application/source/usb_config.c application/source/sm_voc.c application/source/app_voc.c application/source/draw_meas_page.c application/source/voc_heater.c app_buzzer.c application/source/draw_rtc_page.c application/source/support.c application/source/main.c application/source/draw_init_log_page.c application/source/flash_log.c driver/source/ina219.c driver/source/ILI9341.c driver/source/eeprom.c driver/source/touchscreen.c driver/source/lld_i2c5.c driver/source/ad5282.c driver/source/mlx90614.c driver/source/adc.c driver/source/clock.c driver/source/gpio.c driver/source/i2c.c driver/source/intr.c driver/source/lld_i2c1.c driver/source/rtc.c driver/source/systick.c driver/source/lld_spi3.c driver/source/spi.c driver/source/s25fl.c esolid-base/port/pic32-none-gcc/mips-m4k/intr.c esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c esolid-base/src/debug.c esolid-base/src/prio_queue.c esolid-base/src/error.c esolid-base/src/base.c esolid-eds/src/epa.c esolid-eds/src/event.c esolid-eds/src/smp.c esolid-mem/src/heap.c esolid-mem/src/static.c esolid-mem/src/mem_class.c esolid-mem/src/pool.c esolid-vtimer/src/vtimer.c mla/Common/TimeDelay.c mla/MDD/FSIO.c mla/USB/usb_host_msd.c mla/USB/usb_host_msd_scsi.c mla/USB/usb_host.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/application/source/dejavusansbold9.o ${OBJECTDIR}/application/source/verdanabold14.o ${OBJECTDIR}/application/source/draw_edit_page.o ${OBJECTDIR}/application/source/draw_main_page.o ${OBJECTDIR}/application/source/gui.o ${OBJECTDIR}/application/source/drawing.o ${OBJECTDIR}/application/source/lcd_adc.o ${OBJECTDIR}/application/source/lcd_gpio.o ${OBJECTDIR}/application/source/sm_gui.o ${OBJECTDIR}/application/source/app_timer.o ${OBJECTDIR}/application/source/usb_config.o ${OBJECTDIR}/application/source/sm_voc.o ${OBJECTDIR}/application/source/app_voc.o ${OBJECTDIR}/application/source/draw_meas_page.o ${OBJECTDIR}/application/source/voc_heater.o ${OBJECTDIR}/app_buzzer.o ${OBJECTDIR}/application/source/draw_rtc_page.o ${OBJECTDIR}/application/source/support.o ${OBJECTDIR}/application/source/main.o ${OBJECTDIR}/application/source/draw_init_log_page.o ${OBJECTDIR}/application/source/flash_log.o ${OBJECTDIR}/driver/source/ina219.o ${OBJECTDIR}/driver/source/ILI9341.o ${OBJECTDIR}/driver/source/eeprom.o ${OBJECTDIR}/driver/source/touchscreen.o ${OBJECTDIR}/driver/source/lld_i2c5.o ${OBJECTDIR}/driver/source/ad5282.o ${OBJECTDIR}/driver/source/mlx90614.o ${OBJECTDIR}/driver/source/adc.o ${OBJECTDIR}/driver/source/clock.o ${OBJECTDIR}/driver/source/gpio.o ${OBJECTDIR}/driver/source/i2c.o ${OBJECTDIR}/driver/source/intr.o ${OBJECTDIR}/driver/source/lld_i2c1.o ${OBJECTDIR}/driver/source/rtc.o ${OBJECTDIR}/driver/source/systick.o ${OBJECTDIR}/driver/source/lld_spi3.o ${OBJECTDIR}/driver/source/spi.o ${OBJECTDIR}/driver/source/s25fl.o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o ${OBJECTDIR}/esolid-base/src/debug.o ${OBJECTDIR}/esolid-base/src/prio_queue.o ${OBJECTDIR}/esolid-base/src/error.o ${OBJECTDIR}/esolid-base/src/base.o ${OBJECTDIR}/esolid-eds/src/epa.o ${OBJECTDIR}/esolid-eds/src/event.o ${OBJECTDIR}/esolid-eds/src/smp.o ${OBJECTDIR}/esolid-mem/src/heap.o ${OBJECTDIR}/esolid-mem/src/static.o ${OBJECTDIR}/esolid-mem/src/mem_class.o ${OBJECTDIR}/esolid-mem/src/pool.o ${OBJECTDIR}/esolid-vtimer/src/vtimer.o ${OBJECTDIR}/mla/Common/TimeDelay.o ${OBJECTDIR}/mla/MDD/FSIO.o ${OBJECTDIR}/mla/USB/usb_host_msd.o ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o ${OBJECTDIR}/mla/USB/usb_host.o
POSSIBLE_DEPFILES=${OBJECTDIR}/application/source/dejavusansbold9.o.d ${OBJECTDIR}/application/source/verdanabold14.o.d ${OBJECTDIR}/application/source/draw_edit_page.o.d ${OBJECTDIR}/application/source/draw_main_page.o.d ${OBJECTDIR}/application/source/gui.o.d ${OBJECTDIR}/application/source/drawing.o.d ${OBJECTDIR}/application/source/lcd_adc.o.d ${OBJECTDIR}/application/source/lcd_gpio.o.d ${OBJECTDIR}/application/source/sm_gui.o.d ${OBJECTDIR}/application/source/app_timer.o.d ${OBJECTDIR}/application/source/usb_config.o.d ${OBJECTDIR}/application/source/sm_voc.o.d ${OBJECTDIR}/application/source/app_voc.o.d ${OBJECTDIR}/application/source/draw_meas_page.o.d ${OBJECTDIR}/application/source/voc_heater.o.d ${OBJECTDIR}/app_buzzer.o.d ${OBJECTDIR}/application/source/draw_rtc_page.o.d ${OBJECTDIR}/application/source/support.o.d ${OBJECTDIR}/application/source/main.o.d ${OBJECTDIR}/application/source/draw_init_log_page.o.d ${OBJECTDIR}/application/source/flash_log.o.d ${OBJECTDIR}/driver/source/ina219.o.d ${OBJECTDIR}/driver/source/ILI9341.o.d ${OBJECTDIR}/driver/source/eeprom.o.d ${OBJECTDIR}/driver/source/touchscreen.o.d ${OBJECTDIR}/driver/source/lld_i2c5.o.d ${OBJECTDIR}/driver/source/ad5282.o.d ${OBJECTDIR}/driver/source/mlx90614.o.d ${OBJECTDIR}/driver/source/adc.o.d ${OBJECTDIR}/driver/source/clock.o.d ${OBJECTDIR}/driver/source/gpio.o.d ${OBJECTDIR}/driver/source/i2c.o.d ${OBJECTDIR}/driver/source/intr.o.d ${OBJECTDIR}/driver/source/lld_i2c1.o.d ${OBJECTDIR}/driver/source/rtc.o.d ${OBJECTDIR}/driver/source/systick.o.d ${OBJECTDIR}/driver/source/lld_spi3.o.d ${OBJECTDIR}/driver/source/spi.o.d ${OBJECTDIR}/driver/source/s25fl.o.d ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d ${OBJECTDIR}/esolid-base/src/debug.o.d ${OBJECTDIR}/esolid-base/src/prio_queue.o.d ${OBJECTDIR}/esolid-base/src/error.o.d ${OBJECTDIR}/esolid-base/src/base.o.d ${OBJECTDIR}/esolid-eds/src/epa.o.d ${OBJECTDIR}/esolid-eds/src/event.o.d ${OBJECTDIR}/esolid-eds/src/smp.o.d ${OBJECTDIR}/esolid-mem/src/heap.o.d ${OBJECTDIR}/esolid-mem/src/static.o.d ${OBJECTDIR}/esolid-mem/src/mem_class.o.d ${OBJECTDIR}/esolid-mem/src/pool.o.d ${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d ${OBJECTDIR}/mla/Common/TimeDelay.o.d ${OBJECTDIR}/mla/MDD/FSIO.o.d ${OBJECTDIR}/mla/USB/usb_host_msd.o.d ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d ${OBJECTDIR}/mla/USB/usb_host.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/application/source/dejavusansbold9.o ${OBJECTDIR}/application/source/verdanabold14.o ${OBJECTDIR}/application/source/draw_edit_page.o ${OBJECTDIR}/application/source/draw_main_page.o ${OBJECTDIR}/application/source/gui.o ${OBJECTDIR}/application/source/drawing.o ${OBJECTDIR}/application/source/lcd_adc.o ${OBJECTDIR}/application/source/lcd_gpio.o ${OBJECTDIR}/application/source/sm_gui.o ${OBJECTDIR}/application/source/app_timer.o ${OBJECTDIR}/application/source/usb_config.o ${OBJECTDIR}/application/source/sm_voc.o ${OBJECTDIR}/application/source/app_voc.o ${OBJECTDIR}/application/source/draw_meas_page.o ${OBJECTDIR}/application/source/voc_heater.o ${OBJECTDIR}/app_buzzer.o ${OBJECTDIR}/application/source/draw_rtc_page.o ${OBJECTDIR}/application/source/support.o ${OBJECTDIR}/application/source/main.o ${OBJECTDIR}/application/source/draw_init_log_page.o ${OBJECTDIR}/application/source/flash_log.o ${OBJECTDIR}/driver/source/ina219.o ${OBJECTDIR}/driver/source/ILI9341.o ${OBJECTDIR}/driver/source/eeprom.o ${OBJECTDIR}/driver/source/touchscreen.o ${OBJECTDIR}/driver/source/lld_i2c5.o ${OBJECTDIR}/driver/source/ad5282.o ${OBJECTDIR}/driver/source/mlx90614.o ${OBJECTDIR}/driver/source/adc.o ${OBJECTDIR}/driver/source/clock.o ${OBJECTDIR}/driver/source/gpio.o ${OBJECTDIR}/driver/source/i2c.o ${OBJECTDIR}/driver/source/intr.o ${OBJECTDIR}/driver/source/lld_i2c1.o ${OBJECTDIR}/driver/source/rtc.o ${OBJECTDIR}/driver/source/systick.o ${OBJECTDIR}/driver/source/lld_spi3.o ${OBJECTDIR}/driver/source/spi.o ${OBJECTDIR}/driver/source/s25fl.o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o ${OBJECTDIR}/esolid-base/src/debug.o ${OBJECTDIR}/esolid-base/src/prio_queue.o ${OBJECTDIR}/esolid-base/src/error.o ${OBJECTDIR}/esolid-base/src/base.o ${OBJECTDIR}/esolid-eds/src/epa.o ${OBJECTDIR}/esolid-eds/src/event.o ${OBJECTDIR}/esolid-eds/src/smp.o ${OBJECTDIR}/esolid-mem/src/heap.o ${OBJECTDIR}/esolid-mem/src/static.o ${OBJECTDIR}/esolid-mem/src/mem_class.o ${OBJECTDIR}/esolid-mem/src/pool.o ${OBJECTDIR}/esolid-vtimer/src/vtimer.o ${OBJECTDIR}/mla/Common/TimeDelay.o ${OBJECTDIR}/mla/MDD/FSIO.o ${OBJECTDIR}/mla/USB/usb_host_msd.o ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o ${OBJECTDIR}/mla/USB/usb_host.o

# Source Files
SOURCEFILES=application/source/dejavusansbold9.c application/source/verdanabold14.c application/source/draw_edit_page.c application/source/draw_main_page.c application/source/gui.c application/source/drawing.c application/source/lcd_adc.c application/source/lcd_gpio.c application/source/sm_gui.c application/source/app_timer.c application/source/usb_config.c application/source/sm_voc.c application/source/app_voc.c application/source/draw_meas_page.c application/source/voc_heater.c app_buzzer.c application/source/draw_rtc_page.c application/source/support.c application/source/main.c application/source/draw_init_log_page.c application/source/flash_log.c driver/source/ina219.c driver/source/ILI9341.c driver/source/eeprom.c driver/source/touchscreen.c driver/source/lld_i2c5.c driver/source/ad5282.c driver/source/mlx90614.c driver/source/adc.c driver/source/clock.c driver/source/gpio.c driver/source/i2c.c driver/source/intr.c driver/source/lld_i2c1.c driver/source/rtc.c driver/source/systick.c driver/source/lld_spi3.c driver/source/spi.c driver/source/s25fl.c esolid-base/port/pic32-none-gcc/mips-m4k/intr.c esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c esolid-base/src/debug.c esolid-base/src/prio_queue.c esolid-base/src/error.c esolid-base/src/base.c esolid-eds/src/epa.c esolid-eds/src/event.c esolid-eds/src/smp.c esolid-mem/src/heap.c esolid-mem/src/static.c esolid-mem/src/mem_class.c esolid-mem/src/pool.c esolid-vtimer/src/vtimer.c mla/Common/TimeDelay.c mla/MDD/FSIO.c mla/USB/usb_host_msd.c mla/USB/usb_host_msd_scsi.c mla/USB/usb_host.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX675F512H
MP_LINKER_FILE_OPTION=,--script="p32MX675F512H.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/application/source/dejavusansbold9.o: application/source/dejavusansbold9.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o.d 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/dejavusansbold9.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/dejavusansbold9.o.d" -o ${OBJECTDIR}/application/source/dejavusansbold9.o application/source/dejavusansbold9.c   -save-temps=obj
	
${OBJECTDIR}/application/source/verdanabold14.o: application/source/verdanabold14.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o.d 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/verdanabold14.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/verdanabold14.o.d" -o ${OBJECTDIR}/application/source/verdanabold14.o application/source/verdanabold14.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_edit_page.o: application/source/draw_edit_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_edit_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_edit_page.o.d" -o ${OBJECTDIR}/application/source/draw_edit_page.o application/source/draw_edit_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_main_page.o: application/source/draw_main_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_main_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_main_page.o.d" -o ${OBJECTDIR}/application/source/draw_main_page.o application/source/draw_main_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/gui.o: application/source/gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/gui.o.d 
	@${RM} ${OBJECTDIR}/application/source/gui.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/gui.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/gui.o.d" -o ${OBJECTDIR}/application/source/gui.o application/source/gui.c   -save-temps=obj
	
${OBJECTDIR}/application/source/drawing.o: application/source/drawing.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/drawing.o.d 
	@${RM} ${OBJECTDIR}/application/source/drawing.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/drawing.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/drawing.o.d" -o ${OBJECTDIR}/application/source/drawing.o application/source/drawing.c   -save-temps=obj
	
${OBJECTDIR}/application/source/lcd_adc.o: application/source/lcd_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_adc.o.d" -o ${OBJECTDIR}/application/source/lcd_adc.o application/source/lcd_adc.c   -save-temps=obj
	
${OBJECTDIR}/application/source/lcd_gpio.o: application/source/lcd_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_gpio.o.d" -o ${OBJECTDIR}/application/source/lcd_gpio.o application/source/lcd_gpio.c   -save-temps=obj
	
${OBJECTDIR}/application/source/sm_gui.o: application/source/sm_gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/sm_gui.o.d 
	@${RM} ${OBJECTDIR}/application/source/sm_gui.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/sm_gui.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/sm_gui.o.d" -o ${OBJECTDIR}/application/source/sm_gui.o application/source/sm_gui.c   -save-temps=obj
	
${OBJECTDIR}/application/source/app_timer.o: application/source/app_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/app_timer.o.d 
	@${RM} ${OBJECTDIR}/application/source/app_timer.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/app_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/app_timer.o.d" -o ${OBJECTDIR}/application/source/app_timer.o application/source/app_timer.c   -save-temps=obj
	
${OBJECTDIR}/application/source/usb_config.o: application/source/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/usb_config.o.d 
	@${RM} ${OBJECTDIR}/application/source/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/usb_config.o.d" -o ${OBJECTDIR}/application/source/usb_config.o application/source/usb_config.c   -save-temps=obj
	
${OBJECTDIR}/application/source/sm_voc.o: application/source/sm_voc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/sm_voc.o.d 
	@${RM} ${OBJECTDIR}/application/source/sm_voc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/sm_voc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/sm_voc.o.d" -o ${OBJECTDIR}/application/source/sm_voc.o application/source/sm_voc.c   -save-temps=obj
	
${OBJECTDIR}/application/source/app_voc.o: application/source/app_voc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/app_voc.o.d 
	@${RM} ${OBJECTDIR}/application/source/app_voc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/app_voc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/app_voc.o.d" -o ${OBJECTDIR}/application/source/app_voc.o application/source/app_voc.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_meas_page.o: application/source/draw_meas_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_meas_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_meas_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_meas_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_meas_page.o.d" -o ${OBJECTDIR}/application/source/draw_meas_page.o application/source/draw_meas_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/voc_heater.o: application/source/voc_heater.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/voc_heater.o.d 
	@${RM} ${OBJECTDIR}/application/source/voc_heater.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/voc_heater.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/voc_heater.o.d" -o ${OBJECTDIR}/application/source/voc_heater.o application/source/voc_heater.c   -save-temps=obj
	
${OBJECTDIR}/app_buzzer.o: app_buzzer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_buzzer.o.d 
	@${RM} ${OBJECTDIR}/app_buzzer.o 
	@${FIXDEPS} "${OBJECTDIR}/app_buzzer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/app_buzzer.o.d" -o ${OBJECTDIR}/app_buzzer.o app_buzzer.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_rtc_page.o: application/source/draw_rtc_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_rtc_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_rtc_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_rtc_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_rtc_page.o.d" -o ${OBJECTDIR}/application/source/draw_rtc_page.o application/source/draw_rtc_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/support.o: application/source/support.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/support.o.d 
	@${RM} ${OBJECTDIR}/application/source/support.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/support.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/support.o.d" -o ${OBJECTDIR}/application/source/support.o application/source/support.c   -save-temps=obj
	
${OBJECTDIR}/application/source/main.o: application/source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/main.o.d 
	@${RM} ${OBJECTDIR}/application/source/main.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/main.o.d" -o ${OBJECTDIR}/application/source/main.o application/source/main.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_init_log_page.o: application/source/draw_init_log_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_init_log_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_init_log_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_init_log_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_init_log_page.o.d" -o ${OBJECTDIR}/application/source/draw_init_log_page.o application/source/draw_init_log_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/flash_log.o: application/source/flash_log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/flash_log.o.d 
	@${RM} ${OBJECTDIR}/application/source/flash_log.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/flash_log.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/flash_log.o.d" -o ${OBJECTDIR}/application/source/flash_log.o application/source/flash_log.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/ina219.o: driver/source/ina219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ina219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ina219.o.d" -o ${OBJECTDIR}/driver/source/ina219.o driver/source/ina219.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/ILI9341.o: driver/source/ILI9341.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ILI9341.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ILI9341.o.d" -o ${OBJECTDIR}/driver/source/ILI9341.o driver/source/ILI9341.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/eeprom.o: driver/source/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o.d 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/eeprom.o.d" -o ${OBJECTDIR}/driver/source/eeprom.o driver/source/eeprom.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/touchscreen.o: driver/source/touchscreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o.d 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/touchscreen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/touchscreen.o.d" -o ${OBJECTDIR}/driver/source/touchscreen.o driver/source/touchscreen.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/lld_i2c5.o: driver/source/lld_i2c5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_i2c5.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_i2c5.o.d" -o ${OBJECTDIR}/driver/source/lld_i2c5.o driver/source/lld_i2c5.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/ad5282.o: driver/source/ad5282.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ad5282.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ad5282.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ad5282.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ad5282.o.d" -o ${OBJECTDIR}/driver/source/ad5282.o driver/source/ad5282.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/mlx90614.o: driver/source/mlx90614.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/mlx90614.o.d 
	@${RM} ${OBJECTDIR}/driver/source/mlx90614.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/mlx90614.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/mlx90614.o.d" -o ${OBJECTDIR}/driver/source/mlx90614.o driver/source/mlx90614.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/adc.o: driver/source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/adc.o.d 
	@${RM} ${OBJECTDIR}/driver/source/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/adc.o.d" -o ${OBJECTDIR}/driver/source/adc.o driver/source/adc.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/clock.o: driver/source/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/clock.o.d 
	@${RM} ${OBJECTDIR}/driver/source/clock.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/clock.o.d" -o ${OBJECTDIR}/driver/source/clock.o driver/source/clock.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/gpio.o: driver/source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/gpio.o.d 
	@${RM} ${OBJECTDIR}/driver/source/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/gpio.o.d" -o ${OBJECTDIR}/driver/source/gpio.o driver/source/gpio.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/i2c.o: driver/source/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/i2c.o.d 
	@${RM} ${OBJECTDIR}/driver/source/i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/i2c.o.d" -o ${OBJECTDIR}/driver/source/i2c.o driver/source/i2c.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/intr.o: driver/source/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/intr.o.d 
	@${RM} ${OBJECTDIR}/driver/source/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/intr.o.d" -o ${OBJECTDIR}/driver/source/intr.o driver/source/intr.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/lld_i2c1.o: driver/source/lld_i2c1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c1.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c1.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_i2c1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_i2c1.o.d" -o ${OBJECTDIR}/driver/source/lld_i2c1.o driver/source/lld_i2c1.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/rtc.o: driver/source/rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/rtc.o.d 
	@${RM} ${OBJECTDIR}/driver/source/rtc.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/rtc.o.d" -o ${OBJECTDIR}/driver/source/rtc.o driver/source/rtc.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/systick.o: driver/source/systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/systick.o.d 
	@${RM} ${OBJECTDIR}/driver/source/systick.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/systick.o.d" -o ${OBJECTDIR}/driver/source/systick.o driver/source/systick.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/lld_spi3.o: driver/source/lld_spi3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_spi3.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_spi3.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_spi3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_spi3.o.d" -o ${OBJECTDIR}/driver/source/lld_spi3.o driver/source/lld_spi3.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/spi.o: driver/source/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/spi.o.d 
	@${RM} ${OBJECTDIR}/driver/source/spi.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/spi.o.d" -o ${OBJECTDIR}/driver/source/spi.o driver/source/spi.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/s25fl.o: driver/source/s25fl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/s25fl.o.d 
	@${RM} ${OBJECTDIR}/driver/source/s25fl.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/s25fl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/s25fl.o.d" -o ${OBJECTDIR}/driver/source/s25fl.o driver/source/s25fl.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o: esolid-base/port/pic32-none-gcc/mips-m4k/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k" 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d" -o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o esolid-base/port/pic32-none-gcc/mips-m4k/intr.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o: esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k" 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d" -o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o: esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k" 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d" -o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/debug.o: esolid-base/src/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/debug.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/debug.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/debug.o.d" -o ${OBJECTDIR}/esolid-base/src/debug.o esolid-base/src/debug.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/prio_queue.o: esolid-base/src/prio_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/prio_queue.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/prio_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/prio_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/prio_queue.o.d" -o ${OBJECTDIR}/esolid-base/src/prio_queue.o esolid-base/src/prio_queue.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/error.o: esolid-base/src/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/error.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/error.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/error.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/error.o.d" -o ${OBJECTDIR}/esolid-base/src/error.o esolid-base/src/error.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/base.o: esolid-base/src/base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/base.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/base.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/base.o.d" -o ${OBJECTDIR}/esolid-base/src/base.o esolid-base/src/base.c   -save-temps=obj
	
${OBJECTDIR}/esolid-eds/src/epa.o: esolid-eds/src/epa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-eds/src" 
	@${RM} ${OBJECTDIR}/esolid-eds/src/epa.o.d 
	@${RM} ${OBJECTDIR}/esolid-eds/src/epa.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-eds/src/epa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-eds/src/epa.o.d" -o ${OBJECTDIR}/esolid-eds/src/epa.o esolid-eds/src/epa.c   -save-temps=obj
	
${OBJECTDIR}/esolid-eds/src/event.o: esolid-eds/src/event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-eds/src" 
	@${RM} ${OBJECTDIR}/esolid-eds/src/event.o.d 
	@${RM} ${OBJECTDIR}/esolid-eds/src/event.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-eds/src/event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-eds/src/event.o.d" -o ${OBJECTDIR}/esolid-eds/src/event.o esolid-eds/src/event.c   -save-temps=obj
	
${OBJECTDIR}/esolid-eds/src/smp.o: esolid-eds/src/smp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-eds/src" 
	@${RM} ${OBJECTDIR}/esolid-eds/src/smp.o.d 
	@${RM} ${OBJECTDIR}/esolid-eds/src/smp.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-eds/src/smp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-eds/src/smp.o.d" -o ${OBJECTDIR}/esolid-eds/src/smp.o esolid-eds/src/smp.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/heap.o: esolid-mem/src/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/heap.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/heap.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/heap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/heap.o.d" -o ${OBJECTDIR}/esolid-mem/src/heap.o esolid-mem/src/heap.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/static.o: esolid-mem/src/static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/static.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/static.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/static.o.d" -o ${OBJECTDIR}/esolid-mem/src/static.o esolid-mem/src/static.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/mem_class.o: esolid-mem/src/mem_class.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/mem_class.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/mem_class.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/mem_class.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/mem_class.o.d" -o ${OBJECTDIR}/esolid-mem/src/mem_class.o esolid-mem/src/mem_class.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/pool.o: esolid-mem/src/pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/pool.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/pool.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/pool.o.d" -o ${OBJECTDIR}/esolid-mem/src/pool.o esolid-mem/src/pool.c   -save-temps=obj
	
${OBJECTDIR}/esolid-vtimer/src/vtimer.o: esolid-vtimer/src/vtimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-vtimer/src" 
	@${RM} ${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d 
	@${RM} ${OBJECTDIR}/esolid-vtimer/src/vtimer.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d" -o ${OBJECTDIR}/esolid-vtimer/src/vtimer.o esolid-vtimer/src/vtimer.c   -save-temps=obj
	
${OBJECTDIR}/mla/Common/TimeDelay.o: mla/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/Common" 
	@${RM} ${OBJECTDIR}/mla/Common/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/mla/Common/TimeDelay.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/Common/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/Common/TimeDelay.o.d" -o ${OBJECTDIR}/mla/Common/TimeDelay.o mla/Common/TimeDelay.c   -save-temps=obj
	
${OBJECTDIR}/mla/MDD/FSIO.o: mla/MDD/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/MDD" 
	@${RM} ${OBJECTDIR}/mla/MDD/FSIO.o.d 
	@${RM} ${OBJECTDIR}/mla/MDD/FSIO.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/MDD/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/MDD/FSIO.o.d" -o ${OBJECTDIR}/mla/MDD/FSIO.o mla/MDD/FSIO.c   -save-temps=obj
	
${OBJECTDIR}/mla/USB/usb_host_msd.o: mla/USB/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/USB" 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/USB/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/USB/usb_host_msd.o.d" -o ${OBJECTDIR}/mla/USB/usb_host_msd.o mla/USB/usb_host_msd.c   -save-temps=obj
	
${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o: mla/USB/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/USB" 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o mla/USB/usb_host_msd_scsi.c   -save-temps=obj
	
${OBJECTDIR}/mla/USB/usb_host.o: mla/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/USB" 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/USB/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/USB/usb_host.o.d" -o ${OBJECTDIR}/mla/USB/usb_host.o mla/USB/usb_host.c   -save-temps=obj
	
else
${OBJECTDIR}/application/source/dejavusansbold9.o: application/source/dejavusansbold9.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o.d 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/dejavusansbold9.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/dejavusansbold9.o.d" -o ${OBJECTDIR}/application/source/dejavusansbold9.o application/source/dejavusansbold9.c   -save-temps=obj
	
${OBJECTDIR}/application/source/verdanabold14.o: application/source/verdanabold14.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o.d 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/verdanabold14.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/verdanabold14.o.d" -o ${OBJECTDIR}/application/source/verdanabold14.o application/source/verdanabold14.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_edit_page.o: application/source/draw_edit_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_edit_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_edit_page.o.d" -o ${OBJECTDIR}/application/source/draw_edit_page.o application/source/draw_edit_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_main_page.o: application/source/draw_main_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_main_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_main_page.o.d" -o ${OBJECTDIR}/application/source/draw_main_page.o application/source/draw_main_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/gui.o: application/source/gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/gui.o.d 
	@${RM} ${OBJECTDIR}/application/source/gui.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/gui.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/gui.o.d" -o ${OBJECTDIR}/application/source/gui.o application/source/gui.c   -save-temps=obj
	
${OBJECTDIR}/application/source/drawing.o: application/source/drawing.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/drawing.o.d 
	@${RM} ${OBJECTDIR}/application/source/drawing.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/drawing.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/drawing.o.d" -o ${OBJECTDIR}/application/source/drawing.o application/source/drawing.c   -save-temps=obj
	
${OBJECTDIR}/application/source/lcd_adc.o: application/source/lcd_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_adc.o.d" -o ${OBJECTDIR}/application/source/lcd_adc.o application/source/lcd_adc.c   -save-temps=obj
	
${OBJECTDIR}/application/source/lcd_gpio.o: application/source/lcd_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_gpio.o.d" -o ${OBJECTDIR}/application/source/lcd_gpio.o application/source/lcd_gpio.c   -save-temps=obj
	
${OBJECTDIR}/application/source/sm_gui.o: application/source/sm_gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/sm_gui.o.d 
	@${RM} ${OBJECTDIR}/application/source/sm_gui.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/sm_gui.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/sm_gui.o.d" -o ${OBJECTDIR}/application/source/sm_gui.o application/source/sm_gui.c   -save-temps=obj
	
${OBJECTDIR}/application/source/app_timer.o: application/source/app_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/app_timer.o.d 
	@${RM} ${OBJECTDIR}/application/source/app_timer.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/app_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/app_timer.o.d" -o ${OBJECTDIR}/application/source/app_timer.o application/source/app_timer.c   -save-temps=obj
	
${OBJECTDIR}/application/source/usb_config.o: application/source/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/usb_config.o.d 
	@${RM} ${OBJECTDIR}/application/source/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/usb_config.o.d" -o ${OBJECTDIR}/application/source/usb_config.o application/source/usb_config.c   -save-temps=obj
	
${OBJECTDIR}/application/source/sm_voc.o: application/source/sm_voc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/sm_voc.o.d 
	@${RM} ${OBJECTDIR}/application/source/sm_voc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/sm_voc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/sm_voc.o.d" -o ${OBJECTDIR}/application/source/sm_voc.o application/source/sm_voc.c   -save-temps=obj
	
${OBJECTDIR}/application/source/app_voc.o: application/source/app_voc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/app_voc.o.d 
	@${RM} ${OBJECTDIR}/application/source/app_voc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/app_voc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/app_voc.o.d" -o ${OBJECTDIR}/application/source/app_voc.o application/source/app_voc.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_meas_page.o: application/source/draw_meas_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_meas_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_meas_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_meas_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_meas_page.o.d" -o ${OBJECTDIR}/application/source/draw_meas_page.o application/source/draw_meas_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/voc_heater.o: application/source/voc_heater.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/voc_heater.o.d 
	@${RM} ${OBJECTDIR}/application/source/voc_heater.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/voc_heater.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/voc_heater.o.d" -o ${OBJECTDIR}/application/source/voc_heater.o application/source/voc_heater.c   -save-temps=obj
	
${OBJECTDIR}/app_buzzer.o: app_buzzer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_buzzer.o.d 
	@${RM} ${OBJECTDIR}/app_buzzer.o 
	@${FIXDEPS} "${OBJECTDIR}/app_buzzer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/app_buzzer.o.d" -o ${OBJECTDIR}/app_buzzer.o app_buzzer.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_rtc_page.o: application/source/draw_rtc_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_rtc_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_rtc_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_rtc_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_rtc_page.o.d" -o ${OBJECTDIR}/application/source/draw_rtc_page.o application/source/draw_rtc_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/support.o: application/source/support.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/support.o.d 
	@${RM} ${OBJECTDIR}/application/source/support.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/support.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/support.o.d" -o ${OBJECTDIR}/application/source/support.o application/source/support.c   -save-temps=obj
	
${OBJECTDIR}/application/source/main.o: application/source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/main.o.d 
	@${RM} ${OBJECTDIR}/application/source/main.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/main.o.d" -o ${OBJECTDIR}/application/source/main.o application/source/main.c   -save-temps=obj
	
${OBJECTDIR}/application/source/draw_init_log_page.o: application/source/draw_init_log_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_init_log_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_init_log_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_init_log_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_init_log_page.o.d" -o ${OBJECTDIR}/application/source/draw_init_log_page.o application/source/draw_init_log_page.c   -save-temps=obj
	
${OBJECTDIR}/application/source/flash_log.o: application/source/flash_log.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/flash_log.o.d 
	@${RM} ${OBJECTDIR}/application/source/flash_log.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/flash_log.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/application/source/flash_log.o.d" -o ${OBJECTDIR}/application/source/flash_log.o application/source/flash_log.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/ina219.o: driver/source/ina219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ina219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ina219.o.d" -o ${OBJECTDIR}/driver/source/ina219.o driver/source/ina219.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/ILI9341.o: driver/source/ILI9341.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ILI9341.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ILI9341.o.d" -o ${OBJECTDIR}/driver/source/ILI9341.o driver/source/ILI9341.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/eeprom.o: driver/source/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o.d 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/eeprom.o.d" -o ${OBJECTDIR}/driver/source/eeprom.o driver/source/eeprom.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/touchscreen.o: driver/source/touchscreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o.d 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/touchscreen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/touchscreen.o.d" -o ${OBJECTDIR}/driver/source/touchscreen.o driver/source/touchscreen.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/lld_i2c5.o: driver/source/lld_i2c5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_i2c5.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_i2c5.o.d" -o ${OBJECTDIR}/driver/source/lld_i2c5.o driver/source/lld_i2c5.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/ad5282.o: driver/source/ad5282.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ad5282.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ad5282.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ad5282.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ad5282.o.d" -o ${OBJECTDIR}/driver/source/ad5282.o driver/source/ad5282.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/mlx90614.o: driver/source/mlx90614.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/mlx90614.o.d 
	@${RM} ${OBJECTDIR}/driver/source/mlx90614.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/mlx90614.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/mlx90614.o.d" -o ${OBJECTDIR}/driver/source/mlx90614.o driver/source/mlx90614.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/adc.o: driver/source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/adc.o.d 
	@${RM} ${OBJECTDIR}/driver/source/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/adc.o.d" -o ${OBJECTDIR}/driver/source/adc.o driver/source/adc.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/clock.o: driver/source/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/clock.o.d 
	@${RM} ${OBJECTDIR}/driver/source/clock.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/clock.o.d" -o ${OBJECTDIR}/driver/source/clock.o driver/source/clock.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/gpio.o: driver/source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/gpio.o.d 
	@${RM} ${OBJECTDIR}/driver/source/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/gpio.o.d" -o ${OBJECTDIR}/driver/source/gpio.o driver/source/gpio.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/i2c.o: driver/source/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/i2c.o.d 
	@${RM} ${OBJECTDIR}/driver/source/i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/i2c.o.d" -o ${OBJECTDIR}/driver/source/i2c.o driver/source/i2c.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/intr.o: driver/source/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/intr.o.d 
	@${RM} ${OBJECTDIR}/driver/source/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/intr.o.d" -o ${OBJECTDIR}/driver/source/intr.o driver/source/intr.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/lld_i2c1.o: driver/source/lld_i2c1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c1.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c1.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_i2c1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_i2c1.o.d" -o ${OBJECTDIR}/driver/source/lld_i2c1.o driver/source/lld_i2c1.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/rtc.o: driver/source/rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/rtc.o.d 
	@${RM} ${OBJECTDIR}/driver/source/rtc.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/rtc.o.d" -o ${OBJECTDIR}/driver/source/rtc.o driver/source/rtc.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/systick.o: driver/source/systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/systick.o.d 
	@${RM} ${OBJECTDIR}/driver/source/systick.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/systick.o.d" -o ${OBJECTDIR}/driver/source/systick.o driver/source/systick.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/lld_spi3.o: driver/source/lld_spi3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_spi3.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_spi3.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_spi3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_spi3.o.d" -o ${OBJECTDIR}/driver/source/lld_spi3.o driver/source/lld_spi3.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/spi.o: driver/source/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/spi.o.d 
	@${RM} ${OBJECTDIR}/driver/source/spi.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/spi.o.d" -o ${OBJECTDIR}/driver/source/spi.o driver/source/spi.c   -save-temps=obj
	
${OBJECTDIR}/driver/source/s25fl.o: driver/source/s25fl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/s25fl.o.d 
	@${RM} ${OBJECTDIR}/driver/source/s25fl.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/s25fl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/driver/source/s25fl.o.d" -o ${OBJECTDIR}/driver/source/s25fl.o driver/source/s25fl.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o: esolid-base/port/pic32-none-gcc/mips-m4k/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k" 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o.d" -o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/intr.o esolid-base/port/pic32-none-gcc/mips-m4k/intr.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o: esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k" 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o.d" -o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.o esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o: esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k" 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o.d" -o ${OBJECTDIR}/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.o esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/debug.o: esolid-base/src/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/debug.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/debug.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/debug.o.d" -o ${OBJECTDIR}/esolid-base/src/debug.o esolid-base/src/debug.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/prio_queue.o: esolid-base/src/prio_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/prio_queue.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/prio_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/prio_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/prio_queue.o.d" -o ${OBJECTDIR}/esolid-base/src/prio_queue.o esolid-base/src/prio_queue.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/error.o: esolid-base/src/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/error.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/error.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/error.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/error.o.d" -o ${OBJECTDIR}/esolid-base/src/error.o esolid-base/src/error.c   -save-temps=obj
	
${OBJECTDIR}/esolid-base/src/base.o: esolid-base/src/base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-base/src" 
	@${RM} ${OBJECTDIR}/esolid-base/src/base.o.d 
	@${RM} ${OBJECTDIR}/esolid-base/src/base.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-base/src/base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-base/src/base.o.d" -o ${OBJECTDIR}/esolid-base/src/base.o esolid-base/src/base.c   -save-temps=obj
	
${OBJECTDIR}/esolid-eds/src/epa.o: esolid-eds/src/epa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-eds/src" 
	@${RM} ${OBJECTDIR}/esolid-eds/src/epa.o.d 
	@${RM} ${OBJECTDIR}/esolid-eds/src/epa.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-eds/src/epa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-eds/src/epa.o.d" -o ${OBJECTDIR}/esolid-eds/src/epa.o esolid-eds/src/epa.c   -save-temps=obj
	
${OBJECTDIR}/esolid-eds/src/event.o: esolid-eds/src/event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-eds/src" 
	@${RM} ${OBJECTDIR}/esolid-eds/src/event.o.d 
	@${RM} ${OBJECTDIR}/esolid-eds/src/event.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-eds/src/event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-eds/src/event.o.d" -o ${OBJECTDIR}/esolid-eds/src/event.o esolid-eds/src/event.c   -save-temps=obj
	
${OBJECTDIR}/esolid-eds/src/smp.o: esolid-eds/src/smp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-eds/src" 
	@${RM} ${OBJECTDIR}/esolid-eds/src/smp.o.d 
	@${RM} ${OBJECTDIR}/esolid-eds/src/smp.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-eds/src/smp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-eds/src/smp.o.d" -o ${OBJECTDIR}/esolid-eds/src/smp.o esolid-eds/src/smp.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/heap.o: esolid-mem/src/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/heap.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/heap.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/heap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/heap.o.d" -o ${OBJECTDIR}/esolid-mem/src/heap.o esolid-mem/src/heap.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/static.o: esolid-mem/src/static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/static.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/static.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/static.o.d" -o ${OBJECTDIR}/esolid-mem/src/static.o esolid-mem/src/static.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/mem_class.o: esolid-mem/src/mem_class.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/mem_class.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/mem_class.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/mem_class.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/mem_class.o.d" -o ${OBJECTDIR}/esolid-mem/src/mem_class.o esolid-mem/src/mem_class.c   -save-temps=obj
	
${OBJECTDIR}/esolid-mem/src/pool.o: esolid-mem/src/pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-mem/src" 
	@${RM} ${OBJECTDIR}/esolid-mem/src/pool.o.d 
	@${RM} ${OBJECTDIR}/esolid-mem/src/pool.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-mem/src/pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-mem/src/pool.o.d" -o ${OBJECTDIR}/esolid-mem/src/pool.o esolid-mem/src/pool.c   -save-temps=obj
	
${OBJECTDIR}/esolid-vtimer/src/vtimer.o: esolid-vtimer/src/vtimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/esolid-vtimer/src" 
	@${RM} ${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d 
	@${RM} ${OBJECTDIR}/esolid-vtimer/src/vtimer.o 
	@${FIXDEPS} "${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/esolid-vtimer/src/vtimer.o.d" -o ${OBJECTDIR}/esolid-vtimer/src/vtimer.o esolid-vtimer/src/vtimer.c   -save-temps=obj
	
${OBJECTDIR}/mla/Common/TimeDelay.o: mla/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/Common" 
	@${RM} ${OBJECTDIR}/mla/Common/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/mla/Common/TimeDelay.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/Common/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/Common/TimeDelay.o.d" -o ${OBJECTDIR}/mla/Common/TimeDelay.o mla/Common/TimeDelay.c   -save-temps=obj
	
${OBJECTDIR}/mla/MDD/FSIO.o: mla/MDD/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/MDD" 
	@${RM} ${OBJECTDIR}/mla/MDD/FSIO.o.d 
	@${RM} ${OBJECTDIR}/mla/MDD/FSIO.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/MDD/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/MDD/FSIO.o.d" -o ${OBJECTDIR}/mla/MDD/FSIO.o mla/MDD/FSIO.c   -save-temps=obj
	
${OBJECTDIR}/mla/USB/usb_host_msd.o: mla/USB/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/USB" 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/USB/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/USB/usb_host_msd.o.d" -o ${OBJECTDIR}/mla/USB/usb_host_msd.o mla/USB/usb_host_msd.c   -save-temps=obj
	
${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o: mla/USB/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/USB" 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/mla/USB/usb_host_msd_scsi.o mla/USB/usb_host_msd_scsi.c   -save-temps=obj
	
${OBJECTDIR}/mla/USB/usb_host.o: mla/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/USB" 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla/USB/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/USB/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Common" -I"mla/USB" -I"mla" -Wall -MMD -MF "${OBJECTDIR}/mla/USB/usb_host.o.d" -o ${OBJECTDIR}/mla/USB/usb_host.o mla/USB/usb_host.c   -save-temps=obj
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    p32MX675F512H.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}         -save-temps=obj  -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=4096,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--cref
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   p32MX675F512H.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}         -save-temps=obj -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=4096,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--cref
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
