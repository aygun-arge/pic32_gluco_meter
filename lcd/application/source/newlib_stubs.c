/*************************************************************************************************
 * This file is part of pc-tst-printf
 *
 * Template version: 1.1.11 (28.03.2012)
 *
 * Copyright (C) 2011, 2012 - Nedexis Technology Inc.
 *
 *************************************************************************************************/


/*********************************************************************************************//**
 * @file
 * @author      Administrator
 * @brief       Implementation of newlib_stubs.
 * @details     Detailed description
 * @note        Notes
 * ------------------------------------------------------------------------------------------------
 * @addtogroup  module_impl
 * @brief		Implementation of newlib_stubs module.
 * @section		sec_name Section name
 ****************************************************************************************//** @{ */
                                                                                                  
/*============================================================================  INCLUDE FILES  ==*/
#include <errno.h>
#include <sys/unistd.h>
#include "main.h"
/*============================================================================  LOCAL DEFINES  ==*/
#ifndef STDOUT_USART
#define STDOUT_USART 1
#endif

#ifndef STDERR_USART
#define STDERR_USART 1
#endif

#ifndef STDIN_USART
#define STDIN_USART 1
#endif

#undef errno
extern int errno;
/*============================================================================  LOCAL MACRO's  ==*/
/*=========================================================================  LOCAL DATA TYPES  ==*/
/*================================================================  LOCAL FUNCTION PROTOTYPES  ==*/
/*==========================================================================  LOCAL VARIABLES  ==*/
/*=========================================================================  GLOBAL VARIABLES  ==*/
/*
 environ
 A pointer to a list of environment variables and their values.
 For a minimal environment, this empty list is adequate:
 */
char *__env[1] = { 0 };
char **environ = __env;

/*===============================================================  LOCAL FUNCTION DEFINITIONS  ==*/
/*======================================================  GLOBAL PRIVATE FUNCTION DEFINITIONS  ==*/
/*-------------------------------------------------------------------------------------------------*/
/*
 sbrk
 Increase program data space.
 Malloc and related functions depend on this
 */
caddr_t _sbrk(int incr) {

    extern char _ebss; /*Defined by the linker*/
    static char *heap_end;
    char *prev_heap_end;
    char * stack;

    if (heap_end == 0) {
        heap_end = &_ebss;
    }
    prev_heap_end = heap_end;
    stack = (char*) __get_MSP();
     if (heap_end + incr >  stack)
     {
         errno = ENOMEM;

         return  (caddr_t) -1;
     }
    heap_end += incr;

    return (caddr_t) prev_heap_end;

}

/*===================================================*//** @cond *//*==  CONFIGURATION ERRORS  ==*/

/** @endcond *//** @} *//*************************************************************************
 * END of newlib_stubs.c
 *************************************************************************************************/
