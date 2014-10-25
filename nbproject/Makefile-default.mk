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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=/home/nenad/workspace/mplabx/gluko_tester.X/application/source/main.c /home/nenad/workspace/mplabx/gluko_tester.X/application/source/support.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/intr.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/adc.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/systick.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/gpio.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/lld_i2c1.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/clock.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/rtc.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/i2c.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/prio_queue.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/base.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/debug.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/error.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/epa.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/smp.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/event.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/heap.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/static.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/pool.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/mem_class.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-vtimer/src/vtimer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1114155812/main.o ${OBJECTDIR}/_ext/1114155812/support.o ${OBJECTDIR}/_ext/2065627192/intr.o ${OBJECTDIR}/_ext/2065627192/adc.o ${OBJECTDIR}/_ext/2065627192/systick.o ${OBJECTDIR}/_ext/2065627192/gpio.o ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o ${OBJECTDIR}/_ext/2065627192/clock.o ${OBJECTDIR}/_ext/2065627192/rtc.o ${OBJECTDIR}/_ext/2065627192/i2c.o ${OBJECTDIR}/_ext/1649639170/intr.o ${OBJECTDIR}/_ext/1649639170/systimer.o ${OBJECTDIR}/_ext/1649639170/cpu.o ${OBJECTDIR}/_ext/1252069117/prio_queue.o ${OBJECTDIR}/_ext/1252069117/base.o ${OBJECTDIR}/_ext/1252069117/debug.o ${OBJECTDIR}/_ext/1252069117/error.o ${OBJECTDIR}/_ext/74066444/epa.o ${OBJECTDIR}/_ext/74066444/smp.o ${OBJECTDIR}/_ext/74066444/event.o ${OBJECTDIR}/_ext/1392750675/heap.o ${OBJECTDIR}/_ext/1392750675/static.o ${OBJECTDIR}/_ext/1392750675/pool.o ${OBJECTDIR}/_ext/1392750675/mem_class.o ${OBJECTDIR}/_ext/459843455/vtimer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1114155812/main.o.d ${OBJECTDIR}/_ext/1114155812/support.o.d ${OBJECTDIR}/_ext/2065627192/intr.o.d ${OBJECTDIR}/_ext/2065627192/adc.o.d ${OBJECTDIR}/_ext/2065627192/systick.o.d ${OBJECTDIR}/_ext/2065627192/gpio.o.d ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d ${OBJECTDIR}/_ext/2065627192/clock.o.d ${OBJECTDIR}/_ext/2065627192/rtc.o.d ${OBJECTDIR}/_ext/2065627192/i2c.o.d ${OBJECTDIR}/_ext/1649639170/intr.o.d ${OBJECTDIR}/_ext/1649639170/systimer.o.d ${OBJECTDIR}/_ext/1649639170/cpu.o.d ${OBJECTDIR}/_ext/1252069117/prio_queue.o.d ${OBJECTDIR}/_ext/1252069117/base.o.d ${OBJECTDIR}/_ext/1252069117/debug.o.d ${OBJECTDIR}/_ext/1252069117/error.o.d ${OBJECTDIR}/_ext/74066444/epa.o.d ${OBJECTDIR}/_ext/74066444/smp.o.d ${OBJECTDIR}/_ext/74066444/event.o.d ${OBJECTDIR}/_ext/1392750675/heap.o.d ${OBJECTDIR}/_ext/1392750675/static.o.d ${OBJECTDIR}/_ext/1392750675/pool.o.d ${OBJECTDIR}/_ext/1392750675/mem_class.o.d ${OBJECTDIR}/_ext/459843455/vtimer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1114155812/main.o ${OBJECTDIR}/_ext/1114155812/support.o ${OBJECTDIR}/_ext/2065627192/intr.o ${OBJECTDIR}/_ext/2065627192/adc.o ${OBJECTDIR}/_ext/2065627192/systick.o ${OBJECTDIR}/_ext/2065627192/gpio.o ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o ${OBJECTDIR}/_ext/2065627192/clock.o ${OBJECTDIR}/_ext/2065627192/rtc.o ${OBJECTDIR}/_ext/2065627192/i2c.o ${OBJECTDIR}/_ext/1649639170/intr.o ${OBJECTDIR}/_ext/1649639170/systimer.o ${OBJECTDIR}/_ext/1649639170/cpu.o ${OBJECTDIR}/_ext/1252069117/prio_queue.o ${OBJECTDIR}/_ext/1252069117/base.o ${OBJECTDIR}/_ext/1252069117/debug.o ${OBJECTDIR}/_ext/1252069117/error.o ${OBJECTDIR}/_ext/74066444/epa.o ${OBJECTDIR}/_ext/74066444/smp.o ${OBJECTDIR}/_ext/74066444/event.o ${OBJECTDIR}/_ext/1392750675/heap.o ${OBJECTDIR}/_ext/1392750675/static.o ${OBJECTDIR}/_ext/1392750675/pool.o ${OBJECTDIR}/_ext/1392750675/mem_class.o ${OBJECTDIR}/_ext/459843455/vtimer.o

# Source Files
SOURCEFILES=/home/nenad/workspace/mplabx/gluko_tester.X/application/source/main.c /home/nenad/workspace/mplabx/gluko_tester.X/application/source/support.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/intr.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/adc.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/systick.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/gpio.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/lld_i2c1.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/clock.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/rtc.c /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/i2c.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/prio_queue.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/base.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/debug.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/error.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/epa.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/smp.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/event.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/heap.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/static.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/pool.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/mem_class.c /home/nenad/workspace/mplabx/gluko_tester.X/esolid-vtimer/src/vtimer.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/1114155812/main.o: /home/nenad/workspace/mplabx/gluko_tester.X/application/source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1114155812 
	@${RM} ${OBJECTDIR}/_ext/1114155812/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1114155812/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1114155812/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1114155812/main.o.d" -o ${OBJECTDIR}/_ext/1114155812/main.o /home/nenad/workspace/mplabx/gluko_tester.X/application/source/main.c   
	
${OBJECTDIR}/_ext/1114155812/support.o: /home/nenad/workspace/mplabx/gluko_tester.X/application/source/support.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1114155812 
	@${RM} ${OBJECTDIR}/_ext/1114155812/support.o.d 
	@${RM} ${OBJECTDIR}/_ext/1114155812/support.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1114155812/support.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1114155812/support.o.d" -o ${OBJECTDIR}/_ext/1114155812/support.o /home/nenad/workspace/mplabx/gluko_tester.X/application/source/support.c   
	
${OBJECTDIR}/_ext/2065627192/intr.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/intr.o.d" -o ${OBJECTDIR}/_ext/2065627192/intr.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/intr.c   
	
${OBJECTDIR}/_ext/2065627192/adc.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/adc.o.d" -o ${OBJECTDIR}/_ext/2065627192/adc.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/adc.c   
	
${OBJECTDIR}/_ext/2065627192/systick.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/systick.o.d" -o ${OBJECTDIR}/_ext/2065627192/systick.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/systick.c   
	
${OBJECTDIR}/_ext/2065627192/gpio.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/gpio.o.d" -o ${OBJECTDIR}/_ext/2065627192/gpio.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/gpio.c   
	
${OBJECTDIR}/_ext/2065627192/lld_i2c1.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/lld_i2c1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d" -o ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/lld_i2c1.c   
	
${OBJECTDIR}/_ext/2065627192/clock.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/clock.o.d" -o ${OBJECTDIR}/_ext/2065627192/clock.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/clock.c   
	
${OBJECTDIR}/_ext/2065627192/rtc.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/rtc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/rtc.o.d" -o ${OBJECTDIR}/_ext/2065627192/rtc.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/rtc.c   
	
${OBJECTDIR}/_ext/2065627192/i2c.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/i2c.o.d" -o ${OBJECTDIR}/_ext/2065627192/i2c.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/i2c.c   
	
${OBJECTDIR}/_ext/1649639170/intr.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1649639170 
	@${RM} ${OBJECTDIR}/_ext/1649639170/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649639170/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649639170/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1649639170/intr.o.d" -o ${OBJECTDIR}/_ext/1649639170/intr.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c   
	
${OBJECTDIR}/_ext/1649639170/systimer.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1649639170 
	@${RM} ${OBJECTDIR}/_ext/1649639170/systimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649639170/systimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649639170/systimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1649639170/systimer.o.d" -o ${OBJECTDIR}/_ext/1649639170/systimer.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c   
	
${OBJECTDIR}/_ext/1649639170/cpu.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1649639170 
	@${RM} ${OBJECTDIR}/_ext/1649639170/cpu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649639170/cpu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649639170/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1649639170/cpu.o.d" -o ${OBJECTDIR}/_ext/1649639170/cpu.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c   
	
${OBJECTDIR}/_ext/1252069117/prio_queue.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/prio_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/prio_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/prio_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/prio_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/prio_queue.o.d" -o ${OBJECTDIR}/_ext/1252069117/prio_queue.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/prio_queue.c   
	
${OBJECTDIR}/_ext/1252069117/base.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/base.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/base.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/base.o.d" -o ${OBJECTDIR}/_ext/1252069117/base.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/base.c   
	
${OBJECTDIR}/_ext/1252069117/debug.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/debug.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/debug.o.d" -o ${OBJECTDIR}/_ext/1252069117/debug.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/debug.c   
	
${OBJECTDIR}/_ext/1252069117/error.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/error.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/error.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/error.o.d" -o ${OBJECTDIR}/_ext/1252069117/error.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/error.c   
	
${OBJECTDIR}/_ext/74066444/epa.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/epa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/74066444 
	@${RM} ${OBJECTDIR}/_ext/74066444/epa.o.d 
	@${RM} ${OBJECTDIR}/_ext/74066444/epa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/74066444/epa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/74066444/epa.o.d" -o ${OBJECTDIR}/_ext/74066444/epa.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/epa.c   
	
${OBJECTDIR}/_ext/74066444/smp.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/smp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/74066444 
	@${RM} ${OBJECTDIR}/_ext/74066444/smp.o.d 
	@${RM} ${OBJECTDIR}/_ext/74066444/smp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/74066444/smp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/74066444/smp.o.d" -o ${OBJECTDIR}/_ext/74066444/smp.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/smp.c   
	
${OBJECTDIR}/_ext/74066444/event.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/74066444 
	@${RM} ${OBJECTDIR}/_ext/74066444/event.o.d 
	@${RM} ${OBJECTDIR}/_ext/74066444/event.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/74066444/event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/74066444/event.o.d" -o ${OBJECTDIR}/_ext/74066444/event.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/event.c   
	
${OBJECTDIR}/_ext/1392750675/heap.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/heap.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/heap.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/heap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/heap.o.d" -o ${OBJECTDIR}/_ext/1392750675/heap.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/heap.c   
	
${OBJECTDIR}/_ext/1392750675/static.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/static.o.d" -o ${OBJECTDIR}/_ext/1392750675/static.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/static.c   
	
${OBJECTDIR}/_ext/1392750675/pool.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/pool.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/pool.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/pool.o.d" -o ${OBJECTDIR}/_ext/1392750675/pool.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/pool.c   
	
${OBJECTDIR}/_ext/1392750675/mem_class.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/mem_class.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/mem_class.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/mem_class.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/mem_class.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/mem_class.o.d" -o ${OBJECTDIR}/_ext/1392750675/mem_class.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/mem_class.c   
	
${OBJECTDIR}/_ext/459843455/vtimer.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-vtimer/src/vtimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/459843455 
	@${RM} ${OBJECTDIR}/_ext/459843455/vtimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/459843455/vtimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/459843455/vtimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/459843455/vtimer.o.d" -o ${OBJECTDIR}/_ext/459843455/vtimer.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-vtimer/src/vtimer.c   
	
else
${OBJECTDIR}/_ext/1114155812/main.o: /home/nenad/workspace/mplabx/gluko_tester.X/application/source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1114155812 
	@${RM} ${OBJECTDIR}/_ext/1114155812/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1114155812/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1114155812/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1114155812/main.o.d" -o ${OBJECTDIR}/_ext/1114155812/main.o /home/nenad/workspace/mplabx/gluko_tester.X/application/source/main.c   
	
${OBJECTDIR}/_ext/1114155812/support.o: /home/nenad/workspace/mplabx/gluko_tester.X/application/source/support.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1114155812 
	@${RM} ${OBJECTDIR}/_ext/1114155812/support.o.d 
	@${RM} ${OBJECTDIR}/_ext/1114155812/support.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1114155812/support.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1114155812/support.o.d" -o ${OBJECTDIR}/_ext/1114155812/support.o /home/nenad/workspace/mplabx/gluko_tester.X/application/source/support.c   
	
${OBJECTDIR}/_ext/2065627192/intr.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/intr.o.d" -o ${OBJECTDIR}/_ext/2065627192/intr.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/intr.c   
	
${OBJECTDIR}/_ext/2065627192/adc.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/adc.o.d" -o ${OBJECTDIR}/_ext/2065627192/adc.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/adc.c   
	
${OBJECTDIR}/_ext/2065627192/systick.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/systick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/systick.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/systick.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/systick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/systick.o.d" -o ${OBJECTDIR}/_ext/2065627192/systick.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/systick.c   
	
${OBJECTDIR}/_ext/2065627192/gpio.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/gpio.o.d" -o ${OBJECTDIR}/_ext/2065627192/gpio.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/gpio.c   
	
${OBJECTDIR}/_ext/2065627192/lld_i2c1.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/lld_i2c1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/lld_i2c1.o.d" -o ${OBJECTDIR}/_ext/2065627192/lld_i2c1.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/lld_i2c1.c   
	
${OBJECTDIR}/_ext/2065627192/clock.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/clock.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/clock.o.d" -o ${OBJECTDIR}/_ext/2065627192/clock.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/clock.c   
	
${OBJECTDIR}/_ext/2065627192/rtc.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/rtc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/rtc.o.d" -o ${OBJECTDIR}/_ext/2065627192/rtc.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/rtc.c   
	
${OBJECTDIR}/_ext/2065627192/i2c.o: /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2065627192 
	@${RM} ${OBJECTDIR}/_ext/2065627192/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/2065627192/i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2065627192/i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/2065627192/i2c.o.d" -o ${OBJECTDIR}/_ext/2065627192/i2c.o /home/nenad/workspace/mplabx/gluko_tester.X/driver/source/i2c.c   
	
${OBJECTDIR}/_ext/1649639170/intr.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1649639170 
	@${RM} ${OBJECTDIR}/_ext/1649639170/intr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649639170/intr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649639170/intr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1649639170/intr.o.d" -o ${OBJECTDIR}/_ext/1649639170/intr.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/intr.c   
	
${OBJECTDIR}/_ext/1649639170/systimer.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1649639170 
	@${RM} ${OBJECTDIR}/_ext/1649639170/systimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649639170/systimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649639170/systimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1649639170/systimer.o.d" -o ${OBJECTDIR}/_ext/1649639170/systimer.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/systimer.c   
	
${OBJECTDIR}/_ext/1649639170/cpu.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1649639170 
	@${RM} ${OBJECTDIR}/_ext/1649639170/cpu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1649639170/cpu.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1649639170/cpu.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1649639170/cpu.o.d" -o ${OBJECTDIR}/_ext/1649639170/cpu.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/port/pic32-none-gcc/mips-m4k/cpu.c   
	
${OBJECTDIR}/_ext/1252069117/prio_queue.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/prio_queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/prio_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/prio_queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/prio_queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/prio_queue.o.d" -o ${OBJECTDIR}/_ext/1252069117/prio_queue.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/prio_queue.c   
	
${OBJECTDIR}/_ext/1252069117/base.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/base.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/base.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/base.o.d" -o ${OBJECTDIR}/_ext/1252069117/base.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/base.c   
	
${OBJECTDIR}/_ext/1252069117/debug.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/debug.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/debug.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/debug.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/debug.o.d" -o ${OBJECTDIR}/_ext/1252069117/debug.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/debug.c   
	
${OBJECTDIR}/_ext/1252069117/error.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1252069117 
	@${RM} ${OBJECTDIR}/_ext/1252069117/error.o.d 
	@${RM} ${OBJECTDIR}/_ext/1252069117/error.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1252069117/error.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1252069117/error.o.d" -o ${OBJECTDIR}/_ext/1252069117/error.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-base/src/error.c   
	
${OBJECTDIR}/_ext/74066444/epa.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/epa.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/74066444 
	@${RM} ${OBJECTDIR}/_ext/74066444/epa.o.d 
	@${RM} ${OBJECTDIR}/_ext/74066444/epa.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/74066444/epa.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/74066444/epa.o.d" -o ${OBJECTDIR}/_ext/74066444/epa.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/epa.c   
	
${OBJECTDIR}/_ext/74066444/smp.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/smp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/74066444 
	@${RM} ${OBJECTDIR}/_ext/74066444/smp.o.d 
	@${RM} ${OBJECTDIR}/_ext/74066444/smp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/74066444/smp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/74066444/smp.o.d" -o ${OBJECTDIR}/_ext/74066444/smp.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/smp.c   
	
${OBJECTDIR}/_ext/74066444/event.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/74066444 
	@${RM} ${OBJECTDIR}/_ext/74066444/event.o.d 
	@${RM} ${OBJECTDIR}/_ext/74066444/event.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/74066444/event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/74066444/event.o.d" -o ${OBJECTDIR}/_ext/74066444/event.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-eds/src/event.c   
	
${OBJECTDIR}/_ext/1392750675/heap.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/heap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/heap.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/heap.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/heap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/heap.o.d" -o ${OBJECTDIR}/_ext/1392750675/heap.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/heap.c   
	
${OBJECTDIR}/_ext/1392750675/static.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/static.o.d" -o ${OBJECTDIR}/_ext/1392750675/static.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/static.c   
	
${OBJECTDIR}/_ext/1392750675/pool.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/pool.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/pool.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/pool.o.d" -o ${OBJECTDIR}/_ext/1392750675/pool.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/pool.c   
	
${OBJECTDIR}/_ext/1392750675/mem_class.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/mem_class.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1392750675 
	@${RM} ${OBJECTDIR}/_ext/1392750675/mem_class.o.d 
	@${RM} ${OBJECTDIR}/_ext/1392750675/mem_class.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1392750675/mem_class.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/1392750675/mem_class.o.d" -o ${OBJECTDIR}/_ext/1392750675/mem_class.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-mem/src/mem_class.c   
	
${OBJECTDIR}/_ext/459843455/vtimer.o: /home/nenad/workspace/mplabx/gluko_tester.X/esolid-vtimer/src/vtimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/459843455 
	@${RM} ${OBJECTDIR}/_ext/459843455/vtimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/459843455/vtimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/459843455/vtimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -I"driver/include" -I"application/include" -I"esolid-base/inc" -I"esolid-base/port/pic32-none-gcc/common" -I"esolid-base/port/pic32-none-gcc/mips-m4k" -I"esolid-base/port/pic32-none-gcc/pic32mx675f512h" -I"esolid-eds/inc" -I"esolid-mem/inc" -I"esolid-vtimer/inc" -Wall -MMD -MF "${OBJECTDIR}/_ext/459843455/vtimer.o.d" -o ${OBJECTDIR}/_ext/459843455/vtimer.o /home/nenad/workspace/mplabx/gluko_tester.X/esolid-vtimer/src/vtimer.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}           -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/gluko_tester.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
