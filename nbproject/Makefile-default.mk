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
MKDIR=mkdir -p
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
SOURCEFILES_QUOTED_IF_SPACED=/home/nenad/workspace/mplabx/gluco_meter/application/source/main.c /home/nenad/workspace/mplabx/gluco_meter/application/source/support.c application/source/voc_freq.c application/source/dejavusansbold9.c application/source/verdanabold14.c application/source/draw_edit_page.c application/source/draw_main_page.c application/source/draw_measure_page.c application/source/exe_edit_page.c application/source/exe_main_page.c application/source/exe_meassure_page.c application/source/gui.c application/source/drawing.c application/source/lcd_adc.c application/source/lcd_gpio.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/intr.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/adc.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/systick.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/gpio.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/lld_i2c1.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/clock.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/rtc.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/i2c.c driver/source/ad5242.c driver/source/ina219.c driver/source/ILI9341.c driver/source/eeprom.c driver/source/touchscreen.c driver/source/lld_i2c5.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/prio_queue.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/base.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/debug.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/error.c /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/epa.c /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/smp.c /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/event.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/heap.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/static.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/pool.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/mem_class.c /home/nenad/workspace/mplabx/gluco_meter/esolid-vtimer/src/vtimer.c mla/Microchip/Common/TimeDelay.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/843335180/main.o ${OBJECTDIR}/_ext/843335180/support.o ${OBJECTDIR}/application/source/voc_freq.o ${OBJECTDIR}/application/source/dejavusansbold9.o ${OBJECTDIR}/application/source/verdanabold14.o ${OBJECTDIR}/application/source/draw_edit_page.o ${OBJECTDIR}/application/source/draw_main_page.o ${OBJECTDIR}/application/source/draw_measure_page.o ${OBJECTDIR}/application/source/exe_edit_page.o ${OBJECTDIR}/application/source/exe_main_page.o ${OBJECTDIR}/application/source/exe_meassure_page.o ${OBJECTDIR}/application/source/gui.o ${OBJECTDIR}/application/source/drawing.o ${OBJECTDIR}/application/source/lcd_adc.o ${OBJECTDIR}/application/source/lcd_gpio.o ${OBJECTDIR}/_ext/1395779432/intr.o ${OBJECTDIR}/_ext/1395779432/adc.o ${OBJECTDIR}/_ext/1395779432/systick.o ${OBJECTDIR}/_ext/1395779432/gpio.o ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o ${OBJECTDIR}/_ext/1395779432/clock.o ${OBJECTDIR}/_ext/1395779432/rtc.o ${OBJECTDIR}/_ext/1395779432/i2c.o ${OBJECTDIR}/driver/source/ad5242.o ${OBJECTDIR}/driver/source/ina219.o ${OBJECTDIR}/driver/source/ILI9341.o ${OBJECTDIR}/driver/source/eeprom.o ${OBJECTDIR}/driver/source/touchscreen.o ${OBJECTDIR}/driver/source/lld_i2c5.o ${OBJECTDIR}/_ext/1544851922/intr.o ${OBJECTDIR}/_ext/1544851922/systimer.o ${OBJECTDIR}/_ext/1544851922/cpu.o ${OBJECTDIR}/_ext/730672077/prio_queue.o ${OBJECTDIR}/_ext/730672077/base.o ${OBJECTDIR}/_ext/730672077/debug.o ${OBJECTDIR}/_ext/730672077/error.o ${OBJECTDIR}/_ext/783622364/epa.o ${OBJECTDIR}/_ext/783622364/smp.o ${OBJECTDIR}/_ext/783622364/event.o ${OBJECTDIR}/_ext/683194755/heap.o ${OBJECTDIR}/_ext/683194755/static.o ${OBJECTDIR}/_ext/683194755/pool.o ${OBJECTDIR}/_ext/683194755/mem_class.o ${OBJECTDIR}/_ext/1908461647/vtimer.o ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/843335180/main.o.d ${OBJECTDIR}/_ext/843335180/support.o.d ${OBJECTDIR}/application/source/voc_freq.o.d ${OBJECTDIR}/application/source/dejavusansbold9.o.d ${OBJECTDIR}/application/source/verdanabold14.o.d ${OBJECTDIR}/application/source/draw_edit_page.o.d ${OBJECTDIR}/application/source/draw_main_page.o.d ${OBJECTDIR}/application/source/draw_measure_page.o.d ${OBJECTDIR}/application/source/exe_edit_page.o.d ${OBJECTDIR}/application/source/exe_main_page.o.d ${OBJECTDIR}/application/source/exe_meassure_page.o.d ${OBJECTDIR}/application/source/gui.o.d ${OBJECTDIR}/application/source/drawing.o.d ${OBJECTDIR}/application/source/lcd_adc.o.d ${OBJECTDIR}/application/source/lcd_gpio.o.d ${OBJECTDIR}/_ext/1395779432/intr.o.d ${OBJECTDIR}/_ext/1395779432/adc.o.d ${OBJECTDIR}/_ext/1395779432/systick.o.d ${OBJECTDIR}/_ext/1395779432/gpio.o.d ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d ${OBJECTDIR}/_ext/1395779432/clock.o.d ${OBJECTDIR}/_ext/1395779432/rtc.o.d ${OBJECTDIR}/_ext/1395779432/i2c.o.d ${OBJECTDIR}/driver/source/ad5242.o.d ${OBJECTDIR}/driver/source/ina219.o.d ${OBJECTDIR}/driver/source/ILI9341.o.d ${OBJECTDIR}/driver/source/eeprom.o.d ${OBJECTDIR}/driver/source/touchscreen.o.d ${OBJECTDIR}/driver/source/lld_i2c5.o.d ${OBJECTDIR}/_ext/1544851922/intr.o.d ${OBJECTDIR}/_ext/1544851922/systimer.o.d ${OBJECTDIR}/_ext/1544851922/cpu.o.d ${OBJECTDIR}/_ext/730672077/prio_queue.o.d ${OBJECTDIR}/_ext/730672077/base.o.d ${OBJECTDIR}/_ext/730672077/debug.o.d ${OBJECTDIR}/_ext/730672077/error.o.d ${OBJECTDIR}/_ext/783622364/epa.o.d ${OBJECTDIR}/_ext/783622364/smp.o.d ${OBJECTDIR}/_ext/783622364/event.o.d ${OBJECTDIR}/_ext/683194755/heap.o.d ${OBJECTDIR}/_ext/683194755/static.o.d ${OBJECTDIR}/_ext/683194755/pool.o.d ${OBJECTDIR}/_ext/683194755/mem_class.o.d ${OBJECTDIR}/_ext/1908461647/vtimer.o.d ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/843335180/main.o ${OBJECTDIR}/_ext/843335180/support.o ${OBJECTDIR}/application/source/voc_freq.o ${OBJECTDIR}/application/source/dejavusansbold9.o ${OBJECTDIR}/application/source/verdanabold14.o ${OBJECTDIR}/application/source/draw_edit_page.o ${OBJECTDIR}/application/source/draw_main_page.o ${OBJECTDIR}/application/source/draw_measure_page.o ${OBJECTDIR}/application/source/exe_edit_page.o ${OBJECTDIR}/application/source/exe_main_page.o ${OBJECTDIR}/application/source/exe_meassure_page.o ${OBJECTDIR}/application/source/gui.o ${OBJECTDIR}/application/source/drawing.o ${OBJECTDIR}/application/source/lcd_adc.o ${OBJECTDIR}/application/source/lcd_gpio.o ${OBJECTDIR}/_ext/1395779432/intr.o ${OBJECTDIR}/_ext/1395779432/adc.o ${OBJECTDIR}/_ext/1395779432/systick.o ${OBJECTDIR}/_ext/1395779432/gpio.o ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o ${OBJECTDIR}/_ext/1395779432/clock.o ${OBJECTDIR}/_ext/1395779432/rtc.o ${OBJECTDIR}/_ext/1395779432/i2c.o ${OBJECTDIR}/driver/source/ad5242.o ${OBJECTDIR}/driver/source/ina219.o ${OBJECTDIR}/driver/source/ILI9341.o ${OBJECTDIR}/driver/source/eeprom.o ${OBJECTDIR}/driver/source/touchscreen.o ${OBJECTDIR}/driver/source/lld_i2c5.o ${OBJECTDIR}/_ext/1544851922/intr.o ${OBJECTDIR}/_ext/1544851922/systimer.o ${OBJECTDIR}/_ext/1544851922/cpu.o ${OBJECTDIR}/_ext/730672077/prio_queue.o ${OBJECTDIR}/_ext/730672077/base.o ${OBJECTDIR}/_ext/730672077/debug.o ${OBJECTDIR}/_ext/730672077/error.o ${OBJECTDIR}/_ext/783622364/epa.o ${OBJECTDIR}/_ext/783622364/smp.o ${OBJECTDIR}/_ext/783622364/event.o ${OBJECTDIR}/_ext/683194755/heap.o ${OBJECTDIR}/_ext/683194755/static.o ${OBJECTDIR}/_ext/683194755/pool.o ${OBJECTDIR}/_ext/683194755/mem_class.o ${OBJECTDIR}/_ext/1908461647/vtimer.o ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o

# Source Files
SOURCEFILES=/home/nenad/workspace/mplabx/gluco_meter/application/source/main.c /home/nenad/workspace/mplabx/gluco_meter/application/source/support.c application/source/voc_freq.c application/source/dejavusansbold9.c application/source/verdanabold14.c application/source/draw_edit_page.c application/source/draw_main_page.c application/source/draw_measure_page.c application/source/exe_edit_page.c application/source/exe_main_page.c application/source/exe_meassure_page.c application/source/gui.c application/source/drawing.c application/source/lcd_adc.c application/source/lcd_gpio.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/intr.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/adc.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/systick.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/gpio.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/lld_i2c1.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/clock.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/rtc.c /home/nenad/workspace/mplabx/gluco_meter/driver/source/i2c.c driver/source/ad5242.c driver/source/ina219.c driver/source/ILI9341.c driver/source/eeprom.c driver/source/touchscreen.c driver/source/lld_i2c5.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/prio_queue.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/base.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/debug.c /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/error.c /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/epa.c /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/smp.c /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/event.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/heap.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/static.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/pool.c /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/mem_class.c /home/nenad/workspace/mplabx/gluco_meter/esolid-vtimer/src/vtimer.c mla/Microchip/Common/TimeDelay.c


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
MP_LINKER_FILE_OPTION=
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
${OBJECTDIR}/_ext/843335180/main.o: /home/nenad/workspace/mplabx/gluco_meter/application/source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843335180" 
	@${RM} ${OBJECTDIR}/_ext/843335180/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/843335180/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/843335180/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/843335180/main.o.d" -o ${OBJECTDIR}/_ext/843335180/main.o /home/nenad/workspace/mplabx/gluco_meter/application/source/main.c   
	
${OBJECTDIR}/_ext/843335180/support.o: /home/nenad/workspace/mplabx/gluco_meter/application/source/support.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843335180" 
	@${RM} ${OBJECTDIR}/_ext/843335180/support.o.d 
	@${RM} ${OBJECTDIR}/_ext/843335180/support.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/843335180/support.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/843335180/support.o.d" -o ${OBJECTDIR}/_ext/843335180/support.o /home/nenad/workspace/mplabx/gluco_meter/application/source/support.c   
	
${OBJECTDIR}/application/source/voc_freq.o: application/source/voc_freq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/voc_freq.o.d 
	@${RM} ${OBJECTDIR}/application/source/voc_freq.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/voc_freq.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/voc_freq.o.d" -o ${OBJECTDIR}/application/source/voc_freq.o application/source/voc_freq.c   
	
${OBJECTDIR}/application/source/dejavusansbold9.o: application/source/dejavusansbold9.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o.d 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/dejavusansbold9.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/dejavusansbold9.o.d" -o ${OBJECTDIR}/application/source/dejavusansbold9.o application/source/dejavusansbold9.c   
	
${OBJECTDIR}/application/source/verdanabold14.o: application/source/verdanabold14.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o.d 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/verdanabold14.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/verdanabold14.o.d" -o ${OBJECTDIR}/application/source/verdanabold14.o application/source/verdanabold14.c   
	
${OBJECTDIR}/application/source/draw_edit_page.o: application/source/draw_edit_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_edit_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_edit_page.o.d" -o ${OBJECTDIR}/application/source/draw_edit_page.o application/source/draw_edit_page.c   
	
${OBJECTDIR}/application/source/draw_main_page.o: application/source/draw_main_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_main_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_main_page.o.d" -o ${OBJECTDIR}/application/source/draw_main_page.o application/source/draw_main_page.c   
	
${OBJECTDIR}/application/source/draw_measure_page.o: application/source/draw_measure_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_measure_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_measure_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_measure_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_measure_page.o.d" -o ${OBJECTDIR}/application/source/draw_measure_page.o application/source/draw_measure_page.c   
	
${OBJECTDIR}/application/source/exe_edit_page.o: application/source/exe_edit_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/exe_edit_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/exe_edit_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/exe_edit_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/exe_edit_page.o.d" -o ${OBJECTDIR}/application/source/exe_edit_page.o application/source/exe_edit_page.c   
	
${OBJECTDIR}/application/source/exe_main_page.o: application/source/exe_main_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/exe_main_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/exe_main_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/exe_main_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/exe_main_page.o.d" -o ${OBJECTDIR}/application/source/exe_main_page.o application/source/exe_main_page.c   
	
${OBJECTDIR}/application/source/exe_meassure_page.o: application/source/exe_meassure_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/exe_meassure_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/exe_meassure_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/exe_meassure_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/exe_meassure_page.o.d" -o ${OBJECTDIR}/application/source/exe_meassure_page.o application/source/exe_meassure_page.c   
	
${OBJECTDIR}/application/source/gui.o: application/source/gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/gui.o.d 
	@${RM} ${OBJECTDIR}/application/source/gui.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/gui.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/gui.o.d" -o ${OBJECTDIR}/application/source/gui.o application/source/gui.c   
	
${OBJECTDIR}/application/source/drawing.o: application/source/drawing.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/drawing.o.d 
	@${RM} ${OBJECTDIR}/application/source/drawing.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/drawing.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/drawing.o.d" -o ${OBJECTDIR}/application/source/drawing.o application/source/drawing.c   
	
${OBJECTDIR}/application/source/lcd_adc.o: application/source/lcd_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_adc.o.d" -o ${OBJECTDIR}/application/source/lcd_adc.o application/source/lcd_adc.c   
	
${OBJECTDIR}/application/source/lcd_gpio.o: application/source/lcd_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_gpio.o.d" -o ${OBJECTDIR}/application/source/lcd_gpio.o application/source/lcd_gpio.c   
	
${OBJECTDIR}/_ext/1395779432/intr.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/intr.o.d" -o ${OBJECTDIR}/_ext/1395779432/intr.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/intr.c   
	
${OBJECTDIR}/_ext/1395779432/adc.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/adc.o.d" -o ${OBJECTDIR}/_ext/1395779432/adc.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/adc.c   
	
${OBJECTDIR}/_ext/1395779432/systick.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/systick.o.d" -o ${OBJECTDIR}/_ext/1395779432/systick.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/systick.c   
	
${OBJECTDIR}/_ext/1395779432/gpio.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/gpio.o.d" -o ${OBJECTDIR}/_ext/1395779432/gpio.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/gpio.c   
	
${OBJECTDIR}/_ext/1395779432/lld_i2c1.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/lld_i2c1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d" -o ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/lld_i2c1.c   
	
${OBJECTDIR}/_ext/1395779432/clock.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/clock.o.d" -o ${OBJECTDIR}/_ext/1395779432/clock.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/clock.c   
	
${OBJECTDIR}/_ext/1395779432/rtc.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/rtc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/rtc.o.d" -o ${OBJECTDIR}/_ext/1395779432/rtc.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/rtc.c   
	
${OBJECTDIR}/_ext/1395779432/i2c.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/i2c.o.d" -o ${OBJECTDIR}/_ext/1395779432/i2c.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/i2c.c   
	
${OBJECTDIR}/driver/source/ad5242.o: driver/source/ad5242.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ad5242.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ad5242.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ad5242.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ad5242.o.d" -o ${OBJECTDIR}/driver/source/ad5242.o driver/source/ad5242.c   
	
${OBJECTDIR}/driver/source/ina219.o: driver/source/ina219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ina219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ina219.o.d" -o ${OBJECTDIR}/driver/source/ina219.o driver/source/ina219.c   
	
${OBJECTDIR}/driver/source/ILI9341.o: driver/source/ILI9341.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ILI9341.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ILI9341.o.d" -o ${OBJECTDIR}/driver/source/ILI9341.o driver/source/ILI9341.c   
	
${OBJECTDIR}/driver/source/eeprom.o: driver/source/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o.d 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/eeprom.o.d" -o ${OBJECTDIR}/driver/source/eeprom.o driver/source/eeprom.c   
	
${OBJECTDIR}/driver/source/touchscreen.o: driver/source/touchscreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o.d 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/touchscreen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/touchscreen.o.d" -o ${OBJECTDIR}/driver/source/touchscreen.o driver/source/touchscreen.c   
	
${OBJECTDIR}/driver/source/lld_i2c5.o: driver/source/lld_i2c5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_i2c5.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_i2c5.o.d" -o ${OBJECTDIR}/driver/source/lld_i2c5.o driver/source/lld_i2c5.c   
	
${OBJECTDIR}/_ext/1544851922/intr.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1544851922" 
	@${RM} ${OBJECTDIR}/_ext/1544851922/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544851922/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1544851922/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1544851922/intr.o.d" -o ${OBJECTDIR}/_ext/1544851922/intr.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c   
	
${OBJECTDIR}/_ext/1544851922/systimer.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1544851922" 
	@${RM} ${OBJECTDIR}/_ext/1544851922/systimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544851922/systimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1544851922/systimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1544851922/systimer.o.d" -o ${OBJECTDIR}/_ext/1544851922/systimer.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c   
	
${OBJECTDIR}/_ext/1544851922/cpu.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1544851922" 
	@${RM} ${OBJECTDIR}/_ext/1544851922/cpu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544851922/cpu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1544851922/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1544851922/cpu.o.d" -o ${OBJECTDIR}/_ext/1544851922/cpu.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c   
	
${OBJECTDIR}/_ext/730672077/prio_queue.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/prio_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/prio_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/prio_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/prio_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/prio_queue.o.d" -o ${OBJECTDIR}/_ext/730672077/prio_queue.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/prio_queue.c   
	
${OBJECTDIR}/_ext/730672077/base.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/base.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/base.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/base.o.d" -o ${OBJECTDIR}/_ext/730672077/base.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/base.c   
	
${OBJECTDIR}/_ext/730672077/debug.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/debug.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/debug.o.d" -o ${OBJECTDIR}/_ext/730672077/debug.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/debug.c   
	
${OBJECTDIR}/_ext/730672077/error.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/error.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/error.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/error.o.d" -o ${OBJECTDIR}/_ext/730672077/error.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/error.c   
	
${OBJECTDIR}/_ext/783622364/epa.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/epa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783622364" 
	@${RM} ${OBJECTDIR}/_ext/783622364/epa.o.d 
	@${RM} ${OBJECTDIR}/_ext/783622364/epa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783622364/epa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/783622364/epa.o.d" -o ${OBJECTDIR}/_ext/783622364/epa.o /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/epa.c   
	
${OBJECTDIR}/_ext/783622364/smp.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/smp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783622364" 
	@${RM} ${OBJECTDIR}/_ext/783622364/smp.o.d 
	@${RM} ${OBJECTDIR}/_ext/783622364/smp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783622364/smp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/783622364/smp.o.d" -o ${OBJECTDIR}/_ext/783622364/smp.o /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/smp.c   
	
${OBJECTDIR}/_ext/783622364/event.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783622364" 
	@${RM} ${OBJECTDIR}/_ext/783622364/event.o.d 
	@${RM} ${OBJECTDIR}/_ext/783622364/event.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783622364/event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/783622364/event.o.d" -o ${OBJECTDIR}/_ext/783622364/event.o /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/event.c   
	
${OBJECTDIR}/_ext/683194755/heap.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/heap.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/heap.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/heap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/heap.o.d" -o ${OBJECTDIR}/_ext/683194755/heap.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/heap.c   
	
${OBJECTDIR}/_ext/683194755/static.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/static.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/static.o.d" -o ${OBJECTDIR}/_ext/683194755/static.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/static.c   
	
${OBJECTDIR}/_ext/683194755/pool.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/pool.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/pool.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/pool.o.d" -o ${OBJECTDIR}/_ext/683194755/pool.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/pool.c   
	
${OBJECTDIR}/_ext/683194755/mem_class.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/mem_class.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/mem_class.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/mem_class.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/mem_class.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/mem_class.o.d" -o ${OBJECTDIR}/_ext/683194755/mem_class.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/mem_class.c   
	
${OBJECTDIR}/_ext/1908461647/vtimer.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-vtimer/src/vtimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1908461647" 
	@${RM} ${OBJECTDIR}/_ext/1908461647/vtimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1908461647/vtimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1908461647/vtimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1908461647/vtimer.o.d" -o ${OBJECTDIR}/_ext/1908461647/vtimer.o /home/nenad/workspace/mplabx/gluco_meter/esolid-vtimer/src/vtimer.c   
	
${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o: mla/Microchip/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/Microchip/Common" 
	@${RM} ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d" -o ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o mla/Microchip/Common/TimeDelay.c   
	
else
${OBJECTDIR}/_ext/843335180/main.o: /home/nenad/workspace/mplabx/gluco_meter/application/source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843335180" 
	@${RM} ${OBJECTDIR}/_ext/843335180/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/843335180/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/843335180/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/843335180/main.o.d" -o ${OBJECTDIR}/_ext/843335180/main.o /home/nenad/workspace/mplabx/gluco_meter/application/source/main.c   
	
${OBJECTDIR}/_ext/843335180/support.o: /home/nenad/workspace/mplabx/gluco_meter/application/source/support.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843335180" 
	@${RM} ${OBJECTDIR}/_ext/843335180/support.o.d 
	@${RM} ${OBJECTDIR}/_ext/843335180/support.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/843335180/support.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/843335180/support.o.d" -o ${OBJECTDIR}/_ext/843335180/support.o /home/nenad/workspace/mplabx/gluco_meter/application/source/support.c   
	
${OBJECTDIR}/application/source/voc_freq.o: application/source/voc_freq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/voc_freq.o.d 
	@${RM} ${OBJECTDIR}/application/source/voc_freq.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/voc_freq.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/voc_freq.o.d" -o ${OBJECTDIR}/application/source/voc_freq.o application/source/voc_freq.c   
	
${OBJECTDIR}/application/source/dejavusansbold9.o: application/source/dejavusansbold9.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o.d 
	@${RM} ${OBJECTDIR}/application/source/dejavusansbold9.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/dejavusansbold9.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/dejavusansbold9.o.d" -o ${OBJECTDIR}/application/source/dejavusansbold9.o application/source/dejavusansbold9.c   
	
${OBJECTDIR}/application/source/verdanabold14.o: application/source/verdanabold14.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o.d 
	@${RM} ${OBJECTDIR}/application/source/verdanabold14.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/verdanabold14.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/verdanabold14.o.d" -o ${OBJECTDIR}/application/source/verdanabold14.o application/source/verdanabold14.c   
	
${OBJECTDIR}/application/source/draw_edit_page.o: application/source/draw_edit_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_edit_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_edit_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_edit_page.o.d" -o ${OBJECTDIR}/application/source/draw_edit_page.o application/source/draw_edit_page.c   
	
${OBJECTDIR}/application/source/draw_main_page.o: application/source/draw_main_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_main_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_main_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_main_page.o.d" -o ${OBJECTDIR}/application/source/draw_main_page.o application/source/draw_main_page.c   
	
${OBJECTDIR}/application/source/draw_measure_page.o: application/source/draw_measure_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/draw_measure_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/draw_measure_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/draw_measure_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/draw_measure_page.o.d" -o ${OBJECTDIR}/application/source/draw_measure_page.o application/source/draw_measure_page.c   
	
${OBJECTDIR}/application/source/exe_edit_page.o: application/source/exe_edit_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/exe_edit_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/exe_edit_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/exe_edit_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/exe_edit_page.o.d" -o ${OBJECTDIR}/application/source/exe_edit_page.o application/source/exe_edit_page.c   
	
${OBJECTDIR}/application/source/exe_main_page.o: application/source/exe_main_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/exe_main_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/exe_main_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/exe_main_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/exe_main_page.o.d" -o ${OBJECTDIR}/application/source/exe_main_page.o application/source/exe_main_page.c   
	
${OBJECTDIR}/application/source/exe_meassure_page.o: application/source/exe_meassure_page.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/exe_meassure_page.o.d 
	@${RM} ${OBJECTDIR}/application/source/exe_meassure_page.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/exe_meassure_page.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/exe_meassure_page.o.d" -o ${OBJECTDIR}/application/source/exe_meassure_page.o application/source/exe_meassure_page.c   
	
${OBJECTDIR}/application/source/gui.o: application/source/gui.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/gui.o.d 
	@${RM} ${OBJECTDIR}/application/source/gui.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/gui.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/gui.o.d" -o ${OBJECTDIR}/application/source/gui.o application/source/gui.c   
	
${OBJECTDIR}/application/source/drawing.o: application/source/drawing.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/drawing.o.d 
	@${RM} ${OBJECTDIR}/application/source/drawing.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/drawing.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/drawing.o.d" -o ${OBJECTDIR}/application/source/drawing.o application/source/drawing.c   
	
${OBJECTDIR}/application/source/lcd_adc.o: application/source/lcd_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_adc.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_adc.o.d" -o ${OBJECTDIR}/application/source/lcd_adc.o application/source/lcd_adc.c   
	
${OBJECTDIR}/application/source/lcd_gpio.o: application/source/lcd_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/application/source" 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o.d 
	@${RM} ${OBJECTDIR}/application/source/lcd_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/application/source/lcd_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/application/source/lcd_gpio.o.d" -o ${OBJECTDIR}/application/source/lcd_gpio.o application/source/lcd_gpio.c   
	
${OBJECTDIR}/_ext/1395779432/intr.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/intr.o.d" -o ${OBJECTDIR}/_ext/1395779432/intr.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/intr.c   
	
${OBJECTDIR}/_ext/1395779432/adc.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/adc.o.d" -o ${OBJECTDIR}/_ext/1395779432/adc.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/adc.c   
	
${OBJECTDIR}/_ext/1395779432/systick.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/systick.o.d" -o ${OBJECTDIR}/_ext/1395779432/systick.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/systick.c   
	
${OBJECTDIR}/_ext/1395779432/gpio.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/gpio.o.d" -o ${OBJECTDIR}/_ext/1395779432/gpio.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/gpio.c   
	
${OBJECTDIR}/_ext/1395779432/lld_i2c1.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/lld_i2c1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/lld_i2c1.o.d" -o ${OBJECTDIR}/_ext/1395779432/lld_i2c1.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/lld_i2c1.c   
	
${OBJECTDIR}/_ext/1395779432/clock.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/clock.o.d" -o ${OBJECTDIR}/_ext/1395779432/clock.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/clock.c   
	
${OBJECTDIR}/_ext/1395779432/rtc.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/rtc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/rtc.o.d" -o ${OBJECTDIR}/_ext/1395779432/rtc.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/rtc.c   
	
${OBJECTDIR}/_ext/1395779432/i2c.o: /home/nenad/workspace/mplabx/gluco_meter/driver/source/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1395779432" 
	@${RM} ${OBJECTDIR}/_ext/1395779432/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1395779432/i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1395779432/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1395779432/i2c.o.d" -o ${OBJECTDIR}/_ext/1395779432/i2c.o /home/nenad/workspace/mplabx/gluco_meter/driver/source/i2c.c   
	
${OBJECTDIR}/driver/source/ad5242.o: driver/source/ad5242.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ad5242.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ad5242.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ad5242.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ad5242.o.d" -o ${OBJECTDIR}/driver/source/ad5242.o driver/source/ad5242.c   
	
${OBJECTDIR}/driver/source/ina219.o: driver/source/ina219.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ina219.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ina219.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ina219.o.d" -o ${OBJECTDIR}/driver/source/ina219.o driver/source/ina219.c   
	
${OBJECTDIR}/driver/source/ILI9341.o: driver/source/ILI9341.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o.d 
	@${RM} ${OBJECTDIR}/driver/source/ILI9341.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/ILI9341.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/ILI9341.o.d" -o ${OBJECTDIR}/driver/source/ILI9341.o driver/source/ILI9341.c   
	
${OBJECTDIR}/driver/source/eeprom.o: driver/source/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o.d 
	@${RM} ${OBJECTDIR}/driver/source/eeprom.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/eeprom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/eeprom.o.d" -o ${OBJECTDIR}/driver/source/eeprom.o driver/source/eeprom.c   
	
${OBJECTDIR}/driver/source/touchscreen.o: driver/source/touchscreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o.d 
	@${RM} ${OBJECTDIR}/driver/source/touchscreen.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/touchscreen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/touchscreen.o.d" -o ${OBJECTDIR}/driver/source/touchscreen.o driver/source/touchscreen.c   
	
${OBJECTDIR}/driver/source/lld_i2c5.o: driver/source/lld_i2c5.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/driver/source" 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o.d 
	@${RM} ${OBJECTDIR}/driver/source/lld_i2c5.o 
	@${FIXDEPS} "${OBJECTDIR}/driver/source/lld_i2c5.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/driver/source/lld_i2c5.o.d" -o ${OBJECTDIR}/driver/source/lld_i2c5.o driver/source/lld_i2c5.c   
	
${OBJECTDIR}/_ext/1544851922/intr.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1544851922" 
	@${RM} ${OBJECTDIR}/_ext/1544851922/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544851922/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1544851922/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1544851922/intr.o.d" -o ${OBJECTDIR}/_ext/1544851922/intr.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c   
	
${OBJECTDIR}/_ext/1544851922/systimer.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1544851922" 
	@${RM} ${OBJECTDIR}/_ext/1544851922/systimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544851922/systimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1544851922/systimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1544851922/systimer.o.d" -o ${OBJECTDIR}/_ext/1544851922/systimer.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c   
	
${OBJECTDIR}/_ext/1544851922/cpu.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1544851922" 
	@${RM} ${OBJECTDIR}/_ext/1544851922/cpu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544851922/cpu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1544851922/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1544851922/cpu.o.d" -o ${OBJECTDIR}/_ext/1544851922/cpu.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c   
	
${OBJECTDIR}/_ext/730672077/prio_queue.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/prio_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/prio_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/prio_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/prio_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/prio_queue.o.d" -o ${OBJECTDIR}/_ext/730672077/prio_queue.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/prio_queue.c   
	
${OBJECTDIR}/_ext/730672077/base.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/base.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/base.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/base.o.d" -o ${OBJECTDIR}/_ext/730672077/base.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/base.c   
	
${OBJECTDIR}/_ext/730672077/debug.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/debug.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/debug.o.d" -o ${OBJECTDIR}/_ext/730672077/debug.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/debug.c   
	
${OBJECTDIR}/_ext/730672077/error.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/730672077" 
	@${RM} ${OBJECTDIR}/_ext/730672077/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/730672077/error.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/730672077/error.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/730672077/error.o.d" -o ${OBJECTDIR}/_ext/730672077/error.o /home/nenad/workspace/mplabx/gluco_meter/esolid-base/src/error.c   
	
${OBJECTDIR}/_ext/783622364/epa.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/epa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783622364" 
	@${RM} ${OBJECTDIR}/_ext/783622364/epa.o.d 
	@${RM} ${OBJECTDIR}/_ext/783622364/epa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783622364/epa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/783622364/epa.o.d" -o ${OBJECTDIR}/_ext/783622364/epa.o /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/epa.c   
	
${OBJECTDIR}/_ext/783622364/smp.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/smp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783622364" 
	@${RM} ${OBJECTDIR}/_ext/783622364/smp.o.d 
	@${RM} ${OBJECTDIR}/_ext/783622364/smp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783622364/smp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/783622364/smp.o.d" -o ${OBJECTDIR}/_ext/783622364/smp.o /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/smp.c   
	
${OBJECTDIR}/_ext/783622364/event.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/783622364" 
	@${RM} ${OBJECTDIR}/_ext/783622364/event.o.d 
	@${RM} ${OBJECTDIR}/_ext/783622364/event.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/783622364/event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/783622364/event.o.d" -o ${OBJECTDIR}/_ext/783622364/event.o /home/nenad/workspace/mplabx/gluco_meter/esolid-eds/src/event.c   
	
${OBJECTDIR}/_ext/683194755/heap.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/heap.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/heap.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/heap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/heap.o.d" -o ${OBJECTDIR}/_ext/683194755/heap.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/heap.c   
	
${OBJECTDIR}/_ext/683194755/static.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/static.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/static.o.d" -o ${OBJECTDIR}/_ext/683194755/static.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/static.c   
	
${OBJECTDIR}/_ext/683194755/pool.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/pool.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/pool.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/pool.o.d" -o ${OBJECTDIR}/_ext/683194755/pool.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/pool.c   
	
${OBJECTDIR}/_ext/683194755/mem_class.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/mem_class.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/683194755" 
	@${RM} ${OBJECTDIR}/_ext/683194755/mem_class.o.d 
	@${RM} ${OBJECTDIR}/_ext/683194755/mem_class.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/683194755/mem_class.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/683194755/mem_class.o.d" -o ${OBJECTDIR}/_ext/683194755/mem_class.o /home/nenad/workspace/mplabx/gluco_meter/esolid-mem/src/mem_class.c   
	
${OBJECTDIR}/_ext/1908461647/vtimer.o: /home/nenad/workspace/mplabx/gluco_meter/esolid-vtimer/src/vtimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1908461647" 
	@${RM} ${OBJECTDIR}/_ext/1908461647/vtimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1908461647/vtimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1908461647/vtimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1908461647/vtimer.o.d" -o ${OBJECTDIR}/_ext/1908461647/vtimer.o /home/nenad/workspace/mplabx/gluco_meter/esolid-vtimer/src/vtimer.c   
	
${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o: mla/Microchip/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/mla/Microchip/Common" 
	@${RM} ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o 
	@${FIXDEPS} "${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -I"mla/Microchip/Include" -Wall -MMD -MF "${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o.d" -o ${OBJECTDIR}/mla/Microchip/Common/TimeDelay.o mla/Microchip/Common/TimeDelay.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/gluco_meter.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
