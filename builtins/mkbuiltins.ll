; ModuleID = 'mkbuiltins.c'
source_filename = "mkbuiltins.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.ARRAY = type { i32, i32, i32, i32, i8** }
%struct.HANDLER_ENTRY = type { i8*, i32 (i8*, %struct.DEF_FILE*, i8*)* }
%struct.DEF_FILE = type { i8*, %struct.ARRAY*, i32, i8*, %struct._IO_FILE*, %struct.ARRAY* }
%struct.BUILTIN_DESC = type { i8*, i8*, i8*, i8*, %struct.ARRAY*, %struct.ARRAY*, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@documentation_file = global %struct._IO_FILE* null, align 4
@only_documentation = global i32 0, align 4
@inhibit_production = global i32 0, align 4
@inhibit_functions = global i32 0, align 4
@separate_helpfiles = global i32 0, align 4
@single_longdoc_strings = global i32 1, align 4
@error_directory = global i8* null, align 4
@struct_filename = global i8* null, align 4
@extern_filename = global i8* null, align 4
@saved_builtins = global %struct.ARRAY* null, align 4
@.str = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"source\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"eval\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"exec\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"export\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"readonly\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"set\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"shift\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"times\00", align 1
@.str.14 = private unnamed_addr constant [5 x i8] c"trap\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"unset\00", align 1
@special_builtins = global [17 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i8* null], align 4
@.str.16 = private unnamed_addr constant [6 x i8] c"alias\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"declare\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"local\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"typeset\00", align 1
@assignment_builtins = global [7 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0), i8* null], align 4
@localvar_builtins = global [4 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0), i8* null], align 4
@.str.20 = private unnamed_addr constant [3 x i8] c"bg\00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"cd\00", align 1
@.str.22 = private unnamed_addr constant [8 x i8] c"command\00", align 1
@.str.23 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"fc\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"fg\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"getopts\00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c"jobs\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c"kill\00", align 1
@.str.29 = private unnamed_addr constant [7 x i8] c"newgrp\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"pwd\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"read\00", align 1
@.str.32 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.33 = private unnamed_addr constant [6 x i8] c"umask\00", align 1
@.str.34 = private unnamed_addr constant [8 x i8] c"unalias\00", align 1
@.str.35 = private unnamed_addr constant [5 x i8] c"wait\00", align 1
@posix_builtins = global [18 x i8*] [i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.35, i32 0, i32 0), i8* null], align 4
@.str.36 = private unnamed_addr constant [14 x i8] c"builtins.texi\00", align 1
@.str.37 = private unnamed_addr constant [12 x i8] c"-externfile\00", align 1
@.str.38 = private unnamed_addr constant [12 x i8] c"-structfile\00", align 1
@.str.39 = private unnamed_addr constant [14 x i8] c"-noproduction\00", align 1
@.str.40 = private unnamed_addr constant [13 x i8] c"-nofunctions\00", align 1
@.str.41 = private unnamed_addr constant [10 x i8] c"-document\00", align 1
@.str.42 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c"-D\00", align 1
@.str.44 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.45 = private unnamed_addr constant [14 x i8] c"-documentonly\00", align 1
@.str.46 = private unnamed_addr constant [3 x i8] c"-H\00", align 1
@helpfile_directory = common global i8* null, align 4
@.str.47 = private unnamed_addr constant [3 x i8] c"-S\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.48 = private unnamed_addr constant [22 x i8] c"%s: Unknown flag %s.\0A\00", align 1
@.str.49 = private unnamed_addr constant [7 x i8] c"mk-%ld\00", align 1
@.str.50 = private unnamed_addr constant [39 x i8] c"@c Table of builtins created with %s.\0A\00", align 1
@.str.51 = private unnamed_addr constant [15 x i8] c"@ftable @asis\0A\00", align 1
@.str.52 = private unnamed_addr constant [13 x i8] c"@end ftable\0A\00", align 1
@.str.53 = private unnamed_addr constant [8 x i8] c"BUILTIN\00", align 1
@.str.54 = private unnamed_addr constant [8 x i8] c"DOCNAME\00", align 1
@.str.55 = private unnamed_addr constant [9 x i8] c"FUNCTION\00", align 1
@.str.56 = private unnamed_addr constant [10 x i8] c"SHORT_DOC\00", align 1
@.str.57 = private unnamed_addr constant [2 x i8] c"$\00", align 1
@.str.58 = private unnamed_addr constant [8 x i8] c"COMMENT\00", align 1
@.str.59 = private unnamed_addr constant [11 x i8] c"DEPENDS_ON\00", align 1
@.str.60 = private unnamed_addr constant [9 x i8] c"PRODUCES\00", align 1
@.str.61 = private unnamed_addr constant [4 x i8] c"END\00", align 1
@handlers = global [10 x %struct.HANDLER_ENTRY] [%struct.HANDLER_ENTRY { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.53, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @builtin_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.54, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @docname_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.55, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @function_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.56, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @short_doc_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.57, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @comment_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.58, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @comment_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.59, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @depends_on_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @produces_handler }, %struct.HANDLER_ENTRY { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.61, i32 0, i32 0), i32 (i8*, %struct.DEF_FILE*, i8*)* @end_handler }, %struct.HANDLER_ENTRY zeroinitializer], align 4
@output_cpp_line_info = global i32 0, align 4
@.str.62 = private unnamed_addr constant [43 x i8] c"mkbuiltins: %s: skipping zero-length file\0A\00", align 1
@.str.63 = private unnamed_addr constant [23 x i8] c"Unknown directive `%s'\00", align 1
@building_builtin = internal global i32 0, align 4
@.str.64 = private unnamed_addr constant [15 x i8] c"#line %d \22%s\22\0A\00", align 1
@.str.65 = private unnamed_addr constant [17 x i8] c"#line %d \22%s%s\22\0A\00", align 1
@.str.66 = private unnamed_addr constant [3 x i8] c"./\00", align 1
@.str.67 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.68 = private unnamed_addr constant [24 x i8] c"%s requires an argument\00", align 1
@.str.69 = private unnamed_addr constant [38 x i8] c"%s must be inside of a $BUILTIN block\00", align 1
@.str.70 = private unnamed_addr constant [18 x i8] c"(implied LONGDOC)\00", align 1
@.str.71 = private unnamed_addr constant [21 x i8] c"%s found before $END\00", align 1
@.str.72 = private unnamed_addr constant [57 x i8] c"syntax error: no current builtin for $FUNCTION directive\00", align 1
@.str.73 = private unnamed_addr constant [31 x i8] c"%s already has a function (%s)\00", align 1
@.str.74 = private unnamed_addr constant [30 x i8] c"%s already had a docname (%s)\00", align 1
@.str.75 = private unnamed_addr constant [40 x i8] c"%s already has short documentation (%s)\00", align 1
@.str.76 = private unnamed_addr constant [31 x i8] c"%s already has a %s definition\00", align 1
@.str.77 = private unnamed_addr constant [28 x i8] c"/* %s, created from %s. */\0A\00", align 1
@.str.78 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.79 = private unnamed_addr constant [7 x i8] c"%s:%d:\00", align 1
@.str.80 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.81 = private unnamed_addr constant [49 x i8] c"/* builtins.c -- the built in shell commands. */\00", align 1
@.str.82 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.83 = private unnamed_addr constant [64 x i8] c"/* This file is manufactured by ./mkbuiltins, and should not be\00", align 1
@.str.84 = private unnamed_addr constant [65 x i8] c"   edited by hand.  See the source to mkbuiltins for details. */\00", align 1
@.str.85 = private unnamed_addr constant [58 x i8] c"/* Copyright (C) 1987-2015 Free Software Foundation, Inc.\00", align 1
@.str.86 = private unnamed_addr constant [58 x i8] c"   This file is part of GNU Bash, the Bourne Again SHell.\00", align 1
@.str.87 = private unnamed_addr constant [64 x i8] c"   Bash is free software: you can redistribute it and/or modify\00", align 1
@.str.88 = private unnamed_addr constant [72 x i8] c"   it under the terms of the GNU General Public License as published by\00", align 1
@.str.89 = private unnamed_addr constant [69 x i8] c"   the Free Software Foundation, either version 3 of the License, or\00", align 1
@.str.90 = private unnamed_addr constant [39 x i8] c"   (at your option) any later version.\00", align 1
@.str.91 = private unnamed_addr constant [59 x i8] c"   Bash is distributed in the hope that it will be useful,\00", align 1
@.str.92 = private unnamed_addr constant [66 x i8] c"   but WITHOUT ANY WARRANTY; without even the implied warranty of\00", align 1
@.str.93 = private unnamed_addr constant [65 x i8] c"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\00", align 1
@.str.94 = private unnamed_addr constant [48 x i8] c"   GNU General Public License for more details.\00", align 1
@.str.95 = private unnamed_addr constant [69 x i8] c"   You should have received a copy of the GNU General Public License\00", align 1
@.str.96 = private unnamed_addr constant [65 x i8] c"   along with Bash.  If not, see <http://www.gnu.org/licenses/>.\00", align 1
@.str.97 = private unnamed_addr constant [3 x i8] c"*/\00", align 1
@.str.98 = private unnamed_addr constant [71 x i8] c"/* The list of shell builtins.  Each element is name, function, flags,\00", align 1
@.str.99 = private unnamed_addr constant [75 x i8] c"   long-doc, short-doc.  The long-doc field contains a pointer to an array\00", align 1
@.str.100 = private unnamed_addr constant [75 x i8] c"   of help lines.  The function takes a WORD_LIST *; the first word in the\00", align 1
@.str.101 = private unnamed_addr constant [72 x i8] c"   list is the first arg to the command.  The list has already had word\00", align 1
@.str.102 = private unnamed_addr constant [24 x i8] c"   expansion performed.\00", align 1
@.str.103 = private unnamed_addr constant [66 x i8] c"   Functions which need to look at only the simple commands (e.g.\00", align 1
@.str.104 = private unnamed_addr constant [55 x i8] c"   the enable_builtin ()), should ignore entries where\00", align 1
@.str.105 = private unnamed_addr constant [75 x i8] c"   (array[i].function == (sh_builtin_func_t *)NULL).  Such entries are for\00", align 1
@.str.106 = private unnamed_addr constant [73 x i8] c"   the list of shell reserved control structures, like `if' and `while'.\00", align 1
@.str.107 = private unnamed_addr constant [61 x i8] c"   The end of the list is denoted with a NULL name field. */\00", align 1
@.str.108 = private unnamed_addr constant [73 x i8] c"/* TRANSLATORS: Please do not translate command names in descriptions */\00", align 1
@.str.109 = private unnamed_addr constant [25 x i8] c"#include \22../builtins.h\22\00", align 1
@structfile_header = global [39 x i8*] [i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.81, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.83, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.84, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.85, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.87, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.88, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.90, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.92, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.95, i32 0, i32 0), i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.97, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.98, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.99, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.100, i32 0, i32 0), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.101, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.105, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.106, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.107, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.108, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.109, i32 0, i32 0), i8* null], align 4
@.str.110 = private unnamed_addr constant [87 x i8] c"  { (char *)0x0, (sh_builtin_func_t *)0x0, 0, (char **)0x0, (char *)0x0, (char *)0x0 }\00", align 1
@.str.111 = private unnamed_addr constant [3 x i8] c"};\00", align 1
@.str.112 = private unnamed_addr constant [56 x i8] c"struct builtin *shell_builtins = static_shell_builtins;\00", align 1
@.str.113 = private unnamed_addr constant [33 x i8] c"struct builtin *current_builtin;\00", align 1
@.str.114 = private unnamed_addr constant [25 x i8] c"int num_shell_builtins =\00", align 1
@.str.115 = private unnamed_addr constant [63 x i8] c"\09sizeof (static_shell_builtins) / sizeof (struct builtin) - 1;\00", align 1
@structfile_footer = global [9 x i8*] [i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.110, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.111, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.112, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.113, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.114, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.115, i32 0, i32 0), i8* null], align 4
@.str.116 = private unnamed_addr constant [15 x i8] c"#include \22%s\22\0A\00", align 1
@.str.117 = private unnamed_addr constant [11 x i8] c"builtext.h\00", align 1
@.str.118 = private unnamed_addr constant [23 x i8] c"#include \22bashintl.h\22\0A\00", align 1
@.str.119 = private unnamed_addr constant [45 x i8] c"\0Astruct builtin static_shell_builtins[] = {\0A\00", align 1
@.str.120 = private unnamed_addr constant [57 x i8] c"/* %s - The list of builtins found in libbuiltins.a. */\0A\00", align 1
@.str.121 = private unnamed_addr constant [35 x i8] c"extern int %s __P((WORD_LIST *));\0A\00", align 1
@.str.122 = private unnamed_addr constant [31 x i8] c"extern char * const %s_doc[];\0A\00", align 1
@.str.123 = private unnamed_addr constant [11 x i8] c"  { \22%s\22, \00", align 1
@.str.124 = private unnamed_addr constant [5 x i8] c"%s, \00", align 1
@.str.125 = private unnamed_addr constant [27 x i8] c"(sh_builtin_func_t *)0x0, \00", align 1
@.str.126 = private unnamed_addr constant [21 x i8] c"%s%s%s%s%s, %s_doc,\0A\00", align 1
@.str.127 = private unnamed_addr constant [33 x i8] c"BUILTIN_ENABLED | STATIC_BUILTIN\00", align 1
@.str.128 = private unnamed_addr constant [19 x i8] c" | SPECIAL_BUILTIN\00", align 1
@.str.129 = private unnamed_addr constant [22 x i8] c" | ASSIGNMENT_BUILTIN\00", align 1
@.str.130 = private unnamed_addr constant [20 x i8] c" | LOCALVAR_BUILTIN\00", align 1
@.str.131 = private unnamed_addr constant [17 x i8] c" | POSIX_BUILTIN\00", align 1
@.str.132 = private unnamed_addr constant [20 x i8] c"     \22%s\22, \22%s\22 },\0A\00", align 1
@.str.133 = private unnamed_addr constant [28 x i8] c"     \22%s\22, (char *)NULL },\0A\00", align 1
@.str.134 = private unnamed_addr constant [24 x i8] c"     N_(\22%s\22), \22%s\22 },\0A\00", align 1
@.str.135 = private unnamed_addr constant [32 x i8] c"     N_(\22%s\22), (char *)NULL },\0A\00", align 1
@.str.136 = private unnamed_addr constant [10 x i8] c"@item %s\0A\00", align 1
@.str.137 = private unnamed_addr constant [24 x i8] c"char * const %s_doc[] =\00", align 1
@.str.138 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1
@.str.139 = private unnamed_addr constant [27 x i8] c"int %s () { return (0); }\0A\00", align 1
@.str.140 = private unnamed_addr constant [5 x i8] c"#if \00", align 1
@.str.141 = private unnamed_addr constant [14 x i8] c"!defined (%s)\00", align 1
@.str.142 = private unnamed_addr constant [13 x i8] c"defined (%s)\00", align 1
@.str.143 = private unnamed_addr constant [5 x i8] c" && \00", align 1
@.str.144 = private unnamed_addr constant [11 x i8] c"#endif /* \00", align 1
@.str.145 = private unnamed_addr constant [5 x i8] c" */\0A\00", align 1
@.str.146 = private unnamed_addr constant [31 x i8] c" {\0A#if defined (HELP_BUILTIN)\0A\00", align 1
@.str.147 = private unnamed_addr constant [5 x i8] c"N_(\22\00", align 1
@.str.148 = private unnamed_addr constant [6 x i8] c"N_(\22 \00", align 1
@.str.149 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@.str.150 = private unnamed_addr constant [7 x i8] c"  N_(\22\00", align 1
@.str.151 = private unnamed_addr constant [8 x i8] c"  N_(\22 \00", align 1
@.str.152 = private unnamed_addr constant [4 x i8] c"  \22\00", align 1
@.str.153 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.154 = private unnamed_addr constant [4 x i8] c"\5C%c\00", align 1
@.str.155 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.156 = private unnamed_addr constant [5 x i8] c"\22),\0A\00", align 1
@.str.157 = private unnamed_addr constant [4 x i8] c"\22,\0A\00", align 1
@.str.158 = private unnamed_addr constant [5 x i8] c"\5Cn\5C\0A\00", align 1
@.str.159 = private unnamed_addr constant [4 x i8] c"@%c\00", align 1
@.str.160 = private unnamed_addr constant [45 x i8] c"#endif /* HELP_BUILTIN */\0A  (char *)NULL\0A};\0A\00", align 1
@.str.161 = private unnamed_addr constant [10 x i8] c"helpfiles\00", align 1
@.str.162 = private unnamed_addr constant [53 x i8] c"write_helpfiles: helpfiles: cannot create directory\0A\00", align 1
@.str.163 = private unnamed_addr constant [13 x i8] c"helpfiles/%s\00", align 1
@.str.164 = private unnamed_addr constant [33 x i8] c"write_helpfiles: cannot open %s\0A\00", align 1
@.str.165 = private unnamed_addr constant [35 x i8] c"mkbuiltins: out of virtual memory\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %arg_index = alloca i32, align 4
  %structfile = alloca %struct._IO_FILE*, align 4
  %externfile = alloca %struct._IO_FILE*, align 4
  %documentation_filename = alloca i8*, align 4
  %temp_struct_filename = alloca i8*, align 4
  %arg = alloca i8*, align 4
  %len = alloca i32, align 4
  %arg116 = alloca i8*, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i32 1, i32* %arg_index, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** %externfile, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** %structfile, align 4
  store i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.36, i32 0, i32 0), i8** %documentation_filename, align 4
  store i8* null, i8** %temp_struct_filename, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end81, %entry
  %0 = load i32, i32* %arg_index, align 4
  %1 = load i32, i32* %argc.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load i8**, i8*** %argv.addr, align 4
  %3 = load i32, i32* %arg_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %7 = load i8**, i8*** %argv.addr, align 4
  %8 = load i32, i32* %arg_index, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %arg_index, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %7, i32 %8
  %9 = load i8*, i8** %arrayidx4, align 4
  store i8* %9, i8** %arg, align 4
  %10 = load i8*, i8** %arg, align 4
  %call = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.37, i32 0, i32 0))
  %cmp5 = icmp eq i32 %call, 0
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %11 = load i8**, i8*** %argv.addr, align 4
  %12 = load i32, i32* %arg_index, align 4
  %inc7 = add nsw i32 %12, 1
  store i32 %inc7, i32* %arg_index, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx8, align 4
  store i8* %13, i8** @extern_filename, align 4
  br label %if.end81

if.else:                                          ; preds = %while.body
  %14 = load i8*, i8** %arg, align 4
  %call9 = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.38, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then12, label %if.else15

if.then12:                                        ; preds = %if.else
  %15 = load i8**, i8*** %argv.addr, align 4
  %16 = load i32, i32* %arg_index, align 4
  %inc13 = add nsw i32 %16, 1
  store i32 %inc13, i32* %arg_index, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %15, i32 %16
  %17 = load i8*, i8** %arrayidx14, align 4
  store i8* %17, i8** @struct_filename, align 4
  br label %if.end80

if.else15:                                        ; preds = %if.else
  %18 = load i8*, i8** %arg, align 4
  %call16 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.39, i32 0, i32 0))
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then19, label %if.else20

if.then19:                                        ; preds = %if.else15
  store i32 1, i32* @inhibit_production, align 4
  br label %if.end79

if.else20:                                        ; preds = %if.else15
  %19 = load i8*, i8** %arg, align 4
  %call21 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.40, i32 0, i32 0))
  %cmp22 = icmp eq i32 %call21, 0
  br i1 %cmp22, label %if.then24, label %if.else25

if.then24:                                        ; preds = %if.else20
  store i32 1, i32* @inhibit_functions, align 4
  br label %if.end78

if.else25:                                        ; preds = %if.else20
  %20 = load i8*, i8** %arg, align 4
  %call26 = call i32 @strcmp(i8* %20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.41, i32 0, i32 0))
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %if.then29, label %if.else31

if.then29:                                        ; preds = %if.else25
  %21 = load i8*, i8** %documentation_filename, align 4
  %call30 = call %struct._IO_FILE* @fopen(i8* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  store %struct._IO_FILE* %call30, %struct._IO_FILE** @documentation_file, align 4
  br label %if.end77

if.else31:                                        ; preds = %if.else25
  %22 = load i8*, i8** %arg, align 4
  %call32 = call i32 @strcmp(i8* %22, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0))
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then35, label %if.else52

if.then35:                                        ; preds = %if.else31
  %23 = load i8*, i8** @error_directory, align 4
  %tobool = icmp ne i8* %23, null
  br i1 %tobool, label %if.then36, label %if.end

if.then36:                                        ; preds = %if.then35
  %24 = load i8*, i8** @error_directory, align 4
  call void @free(i8* %24)
  br label %if.end

if.end:                                           ; preds = %if.then36, %if.then35
  %25 = load i8**, i8*** %argv.addr, align 4
  %26 = load i32, i32* %arg_index, align 4
  %arrayidx37 = getelementptr inbounds i8*, i8** %25, i32 %26
  %27 = load i8*, i8** %arrayidx37, align 4
  %call38 = call i32 @strlen(i8* %27)
  %add = add i32 2, %call38
  %call39 = call i8* @xmalloc(i32 %add)
  store i8* %call39, i8** @error_directory, align 4
  %28 = load i8*, i8** @error_directory, align 4
  %29 = load i8**, i8*** %argv.addr, align 4
  %30 = load i32, i32* %arg_index, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %29, i32 %30
  %31 = load i8*, i8** %arrayidx40, align 4
  %call41 = call i8* @strcpy(i8* %28, i8* %31)
  %32 = load i8*, i8** @error_directory, align 4
  %call42 = call i32 @strlen(i8* %32)
  store i32 %call42, i32* %len, align 4
  %33 = load i32, i32* %len, align 4
  %tobool43 = icmp ne i32 %33, 0
  br i1 %tobool43, label %land.lhs.true, label %if.end50

land.lhs.true:                                    ; preds = %if.end
  %34 = load i8*, i8** @error_directory, align 4
  %35 = load i32, i32* %len, align 4
  %sub = sub nsw i32 %35, 1
  %arrayidx44 = getelementptr inbounds i8, i8* %34, i32 %sub
  %36 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %36 to i32
  %cmp46 = icmp ne i32 %conv45, 47
  br i1 %cmp46, label %if.then48, label %if.end50

if.then48:                                        ; preds = %land.lhs.true
  %37 = load i8*, i8** @error_directory, align 4
  %call49 = call i8* @strcat(i8* %37, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.44, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %land.lhs.true, %if.end
  %38 = load i32, i32* %arg_index, align 4
  %inc51 = add nsw i32 %38, 1
  store i32 %inc51, i32* %arg_index, align 4
  br label %if.end76

if.else52:                                        ; preds = %if.else31
  %39 = load i8*, i8** %arg, align 4
  %call53 = call i32 @strcmp(i8* %39, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.45, i32 0, i32 0))
  %cmp54 = icmp eq i32 %call53, 0
  br i1 %cmp54, label %if.then56, label %if.else58

if.then56:                                        ; preds = %if.else52
  store i32 1, i32* @only_documentation, align 4
  %40 = load i8*, i8** %documentation_filename, align 4
  %call57 = call %struct._IO_FILE* @fopen(i8* %40, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  store %struct._IO_FILE* %call57, %struct._IO_FILE** @documentation_file, align 4
  br label %if.end75

if.else58:                                        ; preds = %if.else52
  %41 = load i8*, i8** %arg, align 4
  %call59 = call i32 @strcmp(i8* %41, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.46, i32 0, i32 0))
  %cmp60 = icmp eq i32 %call59, 0
  br i1 %cmp60, label %if.then62, label %if.else65

if.then62:                                        ; preds = %if.else58
  store i32 1, i32* @separate_helpfiles, align 4
  %42 = load i8**, i8*** %argv.addr, align 4
  %43 = load i32, i32* %arg_index, align 4
  %inc63 = add nsw i32 %43, 1
  store i32 %inc63, i32* %arg_index, align 4
  %arrayidx64 = getelementptr inbounds i8*, i8** %42, i32 %43
  %44 = load i8*, i8** %arrayidx64, align 4
  store i8* %44, i8** @helpfile_directory, align 4
  br label %if.end74

if.else65:                                        ; preds = %if.else58
  %45 = load i8*, i8** %arg, align 4
  %call66 = call i32 @strcmp(i8* %45, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.47, i32 0, i32 0))
  %cmp67 = icmp eq i32 %call66, 0
  br i1 %cmp67, label %if.then69, label %if.else70

if.then69:                                        ; preds = %if.else65
  store i32 0, i32* @single_longdoc_strings, align 4
  br label %if.end73

if.else70:                                        ; preds = %if.else65
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %47 = load i8**, i8*** %argv.addr, align 4
  %arrayidx71 = getelementptr inbounds i8*, i8** %47, i32 0
  %48 = load i8*, i8** %arrayidx71, align 4
  %49 = load i8*, i8** %arg, align 4
  %call72 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.48, i32 0, i32 0), i8* %48, i8* %49)
  call void @exit(i32 2) #3
  unreachable

if.end73:                                         ; preds = %if.then69
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.then62
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.then56
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %if.end50
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.then29
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.then24
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.then19
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %if.then12
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.then
  br label %while.cond

while.end:                                        ; preds = %land.end
  %50 = load i32, i32* %arg_index, align 4
  %51 = load i32, i32* %argc.addr, align 4
  %cmp82 = icmp eq i32 %50, %51
  br i1 %cmp82, label %if.then84, label %if.end85

if.then84:                                        ; preds = %while.end
  call void @exit(i32 0) #3
  unreachable

if.end85:                                         ; preds = %while.end
  %52 = load i32, i32* @only_documentation, align 4
  %tobool86 = icmp ne i32 %52, 0
  br i1 %tobool86, label %if.end105, label %if.then87

if.then87:                                        ; preds = %if.end85
  %53 = load i8*, i8** @struct_filename, align 4
  %tobool88 = icmp ne i8* %53, null
  br i1 %tobool88, label %if.then89, label %if.end97

if.then89:                                        ; preds = %if.then87
  %call90 = call i8* @xmalloc(i32 15)
  store i8* %call90, i8** %temp_struct_filename, align 4
  %54 = load i8*, i8** %temp_struct_filename, align 4
  %call91 = call i32 @getpid()
  %call92 = call i32 (i8*, i8*, ...) @sprintf(i8* %54, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.49, i32 0, i32 0), i32 %call91)
  %55 = load i8*, i8** %temp_struct_filename, align 4
  %call93 = call %struct._IO_FILE* @fopen(i8* %55, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  store %struct._IO_FILE* %call93, %struct._IO_FILE** %structfile, align 4
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %tobool94 = icmp ne %struct._IO_FILE* %56, null
  br i1 %tobool94, label %if.end96, label %if.then95

if.then95:                                        ; preds = %if.then89
  %57 = load i8*, i8** %temp_struct_filename, align 4
  call void @file_error(i8* %57)
  br label %if.end96

if.end96:                                         ; preds = %if.then95, %if.then89
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %if.then87
  %58 = load i8*, i8** @extern_filename, align 4
  %tobool98 = icmp ne i8* %58, null
  br i1 %tobool98, label %if.then99, label %if.end104

if.then99:                                        ; preds = %if.end97
  %59 = load i8*, i8** @extern_filename, align 4
  %call100 = call %struct._IO_FILE* @fopen(i8* %59, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  store %struct._IO_FILE* %call100, %struct._IO_FILE** %externfile, align 4
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile, align 4
  %tobool101 = icmp ne %struct._IO_FILE* %60, null
  br i1 %tobool101, label %if.end103, label %if.then102

if.then102:                                       ; preds = %if.then99
  %61 = load i8*, i8** @extern_filename, align 4
  call void @file_error(i8* %61)
  br label %if.end103

if.end103:                                        ; preds = %if.then102, %if.then99
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end97
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile, align 4
  call void @write_file_headers(%struct._IO_FILE* %62, %struct._IO_FILE* %63)
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %if.end85
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %tobool106 = icmp ne %struct._IO_FILE* %64, null
  br i1 %tobool106, label %if.then107, label %if.end111

if.then107:                                       ; preds = %if.end105
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %66 = load i8**, i8*** %argv.addr, align 4
  %arrayidx108 = getelementptr inbounds i8*, i8** %66, i32 0
  %67 = load i8*, i8** %arrayidx108, align 4
  %call109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.50, i32 0, i32 0), i8* %67)
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %call110 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end111

if.end111:                                        ; preds = %if.then107, %if.end105
  br label %while.cond112

while.cond112:                                    ; preds = %while.body115, %if.end111
  %69 = load i32, i32* %arg_index, align 4
  %70 = load i32, i32* %argc.addr, align 4
  %cmp113 = icmp slt i32 %69, %70
  br i1 %cmp113, label %while.body115, label %while.end119

while.body115:                                    ; preds = %while.cond112
  %71 = load i8**, i8*** %argv.addr, align 4
  %72 = load i32, i32* %arg_index, align 4
  %inc117 = add nsw i32 %72, 1
  store i32 %inc117, i32* %arg_index, align 4
  %arrayidx118 = getelementptr inbounds i8*, i8** %71, i32 %72
  %73 = load i8*, i8** %arrayidx118, align 4
  store i8* %73, i8** %arg116, align 4
  %74 = load i8*, i8** %arg116, align 4
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile, align 4
  call void @extract_info(i8* %74, %struct._IO_FILE* %75, %struct._IO_FILE* %76)
  br label %while.cond112

while.end119:                                     ; preds = %while.cond112
  %77 = load i32, i32* @only_documentation, align 4
  %tobool120 = icmp ne i32 %77, 0
  br i1 %tobool120, label %if.end131, label %if.then121

if.then121:                                       ; preds = %while.end119
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile, align 4
  call void @write_file_footers(%struct._IO_FILE* %78, %struct._IO_FILE* %79)
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %tobool122 = icmp ne %struct._IO_FILE* %80, null
  br i1 %tobool122, label %if.then123, label %if.end126

if.then123:                                       ; preds = %if.then121
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %82 = load %struct.ARRAY*, %struct.ARRAY** @saved_builtins, align 4
  call void @write_longdocs(%struct._IO_FILE* %81, %struct.ARRAY* %82)
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile, align 4
  %call124 = call i32 @fclose(%struct._IO_FILE* %83)
  %84 = load i8*, i8** %temp_struct_filename, align 4
  %85 = load i8*, i8** @struct_filename, align 4
  %call125 = call i32 @rename(i8* %84, i8* %85)
  br label %if.end126

if.end126:                                        ; preds = %if.then123, %if.then121
  %86 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile, align 4
  %tobool127 = icmp ne %struct._IO_FILE* %86, null
  br i1 %tobool127, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.end126
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile, align 4
  %call129 = call i32 @fclose(%struct._IO_FILE* %87)
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.end126
  br label %if.end131

if.end131:                                        ; preds = %if.end130, %while.end119
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %tobool132 = icmp ne %struct._IO_FILE* %88, null
  br i1 %tobool132, label %if.then133, label %if.end136

if.then133:                                       ; preds = %if.end131
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %call134 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.52, i32 0, i32 0))
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %call135 = call i32 @fclose(%struct._IO_FILE* %90)
  br label %if.end136

if.end136:                                        ; preds = %if.then133, %if.end131
  call void @exit(i32 0) #3
  unreachable

return:                                           ; No predecessors!
  %91 = load i32, i32* %retval, align 4
  ret i32 %91
}

declare i32 @strcmp(i8*, i8*) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare void @free(i8*) #1

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @strcat(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @getpid() #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @rename(i8*, i8*) #1

; Function Attrs: noinline nounwind
define %struct.ARRAY* @array_create(i32 %width) #0 {
entry:
  %width.addr = alloca i32, align 4
  %array = alloca %struct.ARRAY*, align 4
  store i32 %width, i32* %width.addr, align 4
  %call = call i8* @xmalloc(i32 20)
  %0 = bitcast i8* %call to %struct.ARRAY*
  store %struct.ARRAY* %0, %struct.ARRAY** %array, align 4
  %1 = load %struct.ARRAY*, %struct.ARRAY** %array, align 4
  %size = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %1, i32 0, i32 0
  store i32 0, i32* %size, align 4
  %2 = load %struct.ARRAY*, %struct.ARRAY** %array, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %2, i32 0, i32 1
  store i32 0, i32* %sindex, align 4
  %3 = load i32, i32* %width.addr, align 4
  %4 = load %struct.ARRAY*, %struct.ARRAY** %array, align 4
  %width1 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %4, i32 0, i32 2
  store i32 %3, i32* %width1, align 4
  %5 = load %struct.ARRAY*, %struct.ARRAY** %array, align 4
  %growth_rate = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %5, i32 0, i32 3
  store i32 20, i32* %growth_rate, align 4
  %6 = load %struct.ARRAY*, %struct.ARRAY** %array, align 4
  %array2 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %6, i32 0, i32 4
  store i8** null, i8*** %array2, align 4
  %7 = load %struct.ARRAY*, %struct.ARRAY** %array, align 4
  ret %struct.ARRAY* %7
}

; Function Attrs: noinline nounwind
define %struct.ARRAY* @copy_string_array(%struct.ARRAY* %array) #0 {
entry:
  %retval = alloca %struct.ARRAY*, align 4
  %array.addr = alloca %struct.ARRAY*, align 4
  %i = alloca i32, align 4
  %copy = alloca %struct.ARRAY*, align 4
  store %struct.ARRAY* %array, %struct.ARRAY** %array.addr, align 4
  %0 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %tobool = icmp ne %struct.ARRAY* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store %struct.ARRAY* null, %struct.ARRAY** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call %struct.ARRAY* @array_create(i32 4)
  store %struct.ARRAY* %call, %struct.ARRAY** %copy, align 4
  %1 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %size = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %1, i32 0, i32 0
  %2 = load i32, i32* %size, align 4
  %3 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  %size1 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %3, i32 0, i32 0
  store i32 %2, i32* %size1, align 4
  %4 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %4, i32 0, i32 1
  %5 = load i32, i32* %sindex, align 4
  %6 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  %sindex2 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %6, i32 0, i32 1
  store i32 %5, i32* %sindex2, align 4
  %7 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %width = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %7, i32 0, i32 2
  %8 = load i32, i32* %width, align 4
  %9 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  %width3 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %9, i32 0, i32 2
  store i32 %8, i32* %width3, align 4
  %10 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %sindex4 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %10, i32 0, i32 1
  %11 = load i32, i32* %sindex4, align 4
  %add = add nsw i32 1, %11
  %mul = mul i32 %add, 4
  %call5 = call i8* @xmalloc(i32 %mul)
  %12 = bitcast i8* %call5 to i8**
  %13 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  %array6 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %13, i32 0, i32 4
  store i8** %12, i8*** %array6, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %14 = load i32, i32* %i, align 4
  %15 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %sindex7 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %15, i32 0, i32 1
  %16 = load i32, i32* %sindex7, align 4
  %cmp = icmp slt i32 %14, %16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array8 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %17, i32 0, i32 4
  %18 = load i8**, i8*** %array8, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %18, i32 %19
  %20 = load i8*, i8** %arrayidx, align 4
  %call9 = call i32 @strlen(i8* %20)
  %add10 = add i32 1, %call9
  %call11 = call i8* @xmalloc(i32 %add10)
  %21 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array12 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %21, i32 0, i32 4
  %22 = load i8**, i8*** %array12, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx13, align 4
  %call14 = call i8* @strcpy(i8* %call11, i8* %24)
  %25 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  %array15 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %25, i32 0, i32 4
  %26 = load i8**, i8*** %array15, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8*, i8** %26, i32 %27
  store i8* %call14, i8** %arrayidx16, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %29 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  %array17 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %29, i32 0, i32 4
  %30 = load i8**, i8*** %array17, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %30, i32 %31
  store i8* null, i8** %arrayidx18, align 4
  %32 = load %struct.ARRAY*, %struct.ARRAY** %copy, align 4
  store %struct.ARRAY* %32, %struct.ARRAY** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %33 = load %struct.ARRAY*, %struct.ARRAY** %retval, align 4
  ret %struct.ARRAY* %33
}

; Function Attrs: noinline nounwind
define void @array_add(i8* %element, %struct.ARRAY* %array) #0 {
entry:
  %element.addr = alloca i8*, align 4
  %array.addr = alloca %struct.ARRAY*, align 4
  store i8* %element, i8** %element.addr, align 4
  store %struct.ARRAY* %array, %struct.ARRAY** %array.addr, align 4
  %0 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %0, i32 0, i32 1
  %1 = load i32, i32* %sindex, align 4
  %add = add nsw i32 %1, 2
  %2 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %size = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %2, i32 0, i32 0
  %3 = load i32, i32* %size, align 4
  %cmp = icmp sgt i32 %add, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array1 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %4, i32 0, i32 4
  %5 = load i8**, i8*** %array1, align 4
  %6 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %growth_rate = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %6, i32 0, i32 3
  %7 = load i32, i32* %growth_rate, align 4
  %8 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %size2 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %8, i32 0, i32 0
  %9 = load i32, i32* %size2, align 4
  %add3 = add nsw i32 %9, %7
  store i32 %add3, i32* %size2, align 4
  %10 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %width = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %10, i32 0, i32 2
  %11 = load i32, i32* %width, align 4
  %mul = mul nsw i32 %add3, %11
  %call = call i8* bitcast (i8* (i8*, i32)* @xrealloc to i8* (i8**, i32)*)(i8** %5, i32 %mul)
  %12 = bitcast i8* %call to i8**
  %13 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array4 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %13, i32 0, i32 4
  store i8** %12, i8*** %array4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i8*, i8** %element.addr, align 4
  %15 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array5 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %15, i32 0, i32 4
  %16 = load i8**, i8*** %array5, align 4
  %17 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %sindex6 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %17, i32 0, i32 1
  %18 = load i32, i32* %sindex6, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %sindex6, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %16, i32 %18
  store i8* %14, i8** %arrayidx, align 4
  %19 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array7 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %19, i32 0, i32 4
  %20 = load i8**, i8*** %array7, align 4
  %21 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %sindex8 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %21, i32 0, i32 1
  %22 = load i32, i32* %sindex8, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %20, i32 %22
  store i8* null, i8** %arrayidx9, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @array_free(%struct.ARRAY* %array) #0 {
entry:
  %array.addr = alloca %struct.ARRAY*, align 4
  store %struct.ARRAY* %array, %struct.ARRAY** %array.addr, align 4
  %0 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array1 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %0, i32 0, i32 4
  %1 = load i8**, i8*** %array1, align 4
  %tobool = icmp ne i8** %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %array2 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %2, i32 0, i32 4
  %3 = load i8**, i8*** %array2, align 4
  %4 = bitcast i8** %3 to i8*
  call void @free(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.ARRAY*, %struct.ARRAY** %array.addr, align 4
  %6 = bitcast %struct.ARRAY* %5 to i8*
  call void @free(i8* %6)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @builtin_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %retval = alloca i32, align 4
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  %new = alloca %struct.BUILTIN_DESC*, align 4
  %name = alloca i8*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i32, i32* @building_builtin, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %2 = load i8*, i8** %self.addr, align 4
  call void bitcast (void (%struct.DEF_FILE*, i8*, i8*, i8*)* @line_error to void (%struct.DEF_FILE*, i8*, i8*)*)(%struct.DEF_FILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.71, i32 0, i32 0), i8* %2)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @output_cpp_line_info, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @output_cpp_line_info, align 4
  %4 = load i8*, i8** %self.addr, align 4
  %5 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %6 = load i8*, i8** %arg.addr, align 4
  %call = call i8* @get_arg(i8* %4, %struct.DEF_FILE* %5, i8* %6)
  store i8* %call, i8** %name, align 4
  %7 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %7, i32 0, i32 5
  %8 = load %struct.ARRAY*, %struct.ARRAY** %builtins, align 4
  %tobool1 = icmp ne %struct.ARRAY* %8, null
  br i1 %tobool1, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.end
  %call3 = call %struct.ARRAY* @array_create(i32 4)
  %9 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins4 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %9, i32 0, i32 5
  store %struct.ARRAY* %call3, %struct.ARRAY** %builtins4, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  %call6 = call i8* @xmalloc(i32 28)
  %10 = bitcast i8* %call6 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %10, %struct.BUILTIN_DESC** %new, align 4
  %11 = load i8*, i8** %name, align 4
  %12 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %name7 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %12, i32 0, i32 0
  store i8* %11, i8** %name7, align 4
  %13 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %function = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %13, i32 0, i32 1
  store i8* null, i8** %function, align 4
  %14 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %shortdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %14, i32 0, i32 2
  store i8* null, i8** %shortdoc, align 4
  %15 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %15, i32 0, i32 3
  store i8* null, i8** %docname, align 4
  %16 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %16, i32 0, i32 4
  store %struct.ARRAY* null, %struct.ARRAY** %longdoc, align 4
  %17 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %dependencies = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %17, i32 0, i32 5
  store %struct.ARRAY* null, %struct.ARRAY** %dependencies, align 4
  %18 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %flags = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %18, i32 0, i32 6
  store i32 0, i32* %flags, align 4
  %19 = load i8*, i8** %name, align 4
  %call8 = call i32 @is_special_builtin(i8* %19)
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end5
  %20 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %flags11 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %20, i32 0, i32 6
  %21 = load i32, i32* %flags11, align 4
  %or = or i32 %21, 1
  store i32 %or, i32* %flags11, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end5
  %22 = load i8*, i8** %name, align 4
  %call13 = call i32 @is_assignment_builtin(i8* %22)
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then15, label %if.end18

if.then15:                                        ; preds = %if.end12
  %23 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %flags16 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %23, i32 0, i32 6
  %24 = load i32, i32* %flags16, align 4
  %or17 = or i32 %24, 2
  store i32 %or17, i32* %flags16, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then15, %if.end12
  %25 = load i8*, i8** %name, align 4
  %call19 = call i32 @is_localvar_builtin(i8* %25)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %if.then21, label %if.end24

if.then21:                                        ; preds = %if.end18
  %26 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %flags22 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %26, i32 0, i32 6
  %27 = load i32, i32* %flags22, align 4
  %or23 = or i32 %27, 4
  store i32 %or23, i32* %flags22, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %if.end18
  %28 = load i8*, i8** %name, align 4
  %call25 = call i32 @is_posix_builtin(i8* %28)
  %tobool26 = icmp ne i32 %call25, 0
  br i1 %tobool26, label %if.then27, label %if.end30

if.then27:                                        ; preds = %if.end24
  %29 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %flags28 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %29, i32 0, i32 6
  %30 = load i32, i32* %flags28, align 4
  %or29 = or i32 %30, 8
  store i32 %or29, i32* %flags28, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %if.end24
  %31 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %32 = bitcast %struct.BUILTIN_DESC* %31 to i8*
  %33 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins31 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %33, i32 0, i32 5
  %34 = load %struct.ARRAY*, %struct.ARRAY** %builtins31, align 4
  call void @array_add(i8* %32, %struct.ARRAY* %34)
  store i32 1, i32* @building_builtin, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind
define i32 @docname_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %self.addr, align 4
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %call = call %struct.BUILTIN_DESC* @current_builtin(i8* %0, %struct.DEF_FILE* %1)
  store %struct.BUILTIN_DESC* %call, %struct.BUILTIN_DESC** %builtin, align 4
  %2 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %2, i32 0, i32 3
  %3 = load i8*, i8** %docname, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %5 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %5, i32 0, i32 0
  %6 = load i8*, i8** %name, align 4
  %7 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname1 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %7, i32 0, i32 3
  %8 = load i8*, i8** %docname1, align 4
  call void @line_error(%struct.DEF_FILE* %4, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.74, i32 0, i32 0), i8* %6, i8* %8)
  br label %if.end

if.else:                                          ; preds = %entry
  %9 = load i8*, i8** %self.addr, align 4
  %10 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %11 = load i8*, i8** %arg.addr, align 4
  %call2 = call i8* @get_arg(i8* %9, %struct.DEF_FILE* %10, i8* %11)
  %12 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname3 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %12, i32 0, i32 3
  store i8* %call2, i8** %docname3, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @function_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %self.addr, align 4
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %call = call %struct.BUILTIN_DESC* @current_builtin(i8* %0, %struct.DEF_FILE* %1)
  store %struct.BUILTIN_DESC* %call, %struct.BUILTIN_DESC** %builtin, align 4
  %2 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %cmp = icmp eq %struct.BUILTIN_DESC* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  call void bitcast (void (%struct.DEF_FILE*, i8*, i8*, i8*)* @line_error to void (%struct.DEF_FILE*, i8*)*)(%struct.DEF_FILE* %3, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.72, i32 0, i32 0))
  call void @exit(i32 1) #3
  unreachable

if.end:                                           ; preds = %entry
  %4 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %4, i32 0, i32 1
  %5 = load i8*, i8** %function, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %6 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %7 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %7, i32 0, i32 0
  %8 = load i8*, i8** %name, align 4
  %9 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function2 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %9, i32 0, i32 1
  %10 = load i8*, i8** %function2, align 4
  call void @line_error(%struct.DEF_FILE* %6, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.73, i32 0, i32 0), i8* %8, i8* %10)
  br label %if.end5

if.else:                                          ; preds = %if.end
  %11 = load i8*, i8** %self.addr, align 4
  %12 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %13 = load i8*, i8** %arg.addr, align 4
  %call3 = call i8* @get_arg(i8* %11, %struct.DEF_FILE* %12, i8* %13)
  %14 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function4 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %14, i32 0, i32 1
  store i8* %call3, i8** %function4, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then1
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @short_doc_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %self.addr, align 4
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %call = call %struct.BUILTIN_DESC* @current_builtin(i8* %0, %struct.DEF_FILE* %1)
  store %struct.BUILTIN_DESC* %call, %struct.BUILTIN_DESC** %builtin, align 4
  %2 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %2, i32 0, i32 2
  %3 = load i8*, i8** %shortdoc, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %5 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %5, i32 0, i32 0
  %6 = load i8*, i8** %name, align 4
  %7 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc1 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %7, i32 0, i32 2
  %8 = load i8*, i8** %shortdoc1, align 4
  call void @line_error(%struct.DEF_FILE* %4, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.75, i32 0, i32 0), i8* %6, i8* %8)
  br label %if.end

if.else:                                          ; preds = %entry
  %9 = load i8*, i8** %self.addr, align 4
  %10 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %11 = load i8*, i8** %arg.addr, align 4
  %call2 = call i8* @get_arg(i8* %9, %struct.DEF_FILE* %10, i8* %11)
  %12 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc3 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %12, i32 0, i32 2
  store i8* %call2, i8** %shortdoc3, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @comment_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @depends_on_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  %dependent = alloca i8*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %self.addr, align 4
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %call = call %struct.BUILTIN_DESC* @current_builtin(i8* %0, %struct.DEF_FILE* %1)
  store %struct.BUILTIN_DESC* %call, %struct.BUILTIN_DESC** %builtin, align 4
  %2 = load i8*, i8** %self.addr, align 4
  %3 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %4 = load i8*, i8** %arg.addr, align 4
  %call1 = call i8* @get_arg(i8* %2, %struct.DEF_FILE* %3, i8* %4)
  store i8* %call1, i8** %dependent, align 4
  %5 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %5, i32 0, i32 5
  %6 = load %struct.ARRAY*, %struct.ARRAY** %dependencies, align 4
  %tobool = icmp ne %struct.ARRAY* %6, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call2 = call %struct.ARRAY* @array_create(i32 4)
  %7 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies3 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %7, i32 0, i32 5
  store %struct.ARRAY* %call2, %struct.ARRAY** %dependencies3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load i8*, i8** %dependent, align 4
  %9 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies4 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %9, i32 0, i32 5
  %10 = load %struct.ARRAY*, %struct.ARRAY** %dependencies4, align 4
  call void @array_add(i8* %8, %struct.ARRAY* %10)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @produces_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %retval = alloca i32, align 4
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i32, i32* @only_documentation, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @output_cpp_line_info, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @output_cpp_line_info, align 4
  %2 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %2, i32 0, i32 3
  %3 = load i8*, i8** %production, align 4
  %tobool1 = icmp ne i8* %3, null
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %4 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %5 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %filename = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %5, i32 0, i32 0
  %6 = load i8*, i8** %filename, align 4
  %7 = load i8*, i8** %self.addr, align 4
  call void @line_error(%struct.DEF_FILE* %4, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.76, i32 0, i32 0), i8* %6, i8* %7)
  br label %if.end18

if.else:                                          ; preds = %if.end
  %8 = load i8*, i8** %self.addr, align 4
  %9 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %10 = load i8*, i8** %arg.addr, align 4
  %call = call i8* @get_arg(i8* %8, %struct.DEF_FILE* %9, i8* %10)
  %11 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production3 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %11, i32 0, i32 3
  store i8* %call, i8** %production3, align 4
  %12 = load i32, i32* @inhibit_production, align 4
  %tobool4 = icmp ne i32 %12, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.else
  %13 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production7 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %13, i32 0, i32 3
  %14 = load i8*, i8** %production7, align 4
  %call8 = call %struct._IO_FILE* @fopen(i8* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  %15 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %output = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %15, i32 0, i32 4
  store %struct._IO_FILE* %call8, %struct._IO_FILE** %output, align 4
  %16 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %output9 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %16, i32 0, i32 4
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %output9, align 4
  %tobool10 = icmp ne %struct._IO_FILE* %17, null
  br i1 %tobool10, label %if.end13, label %if.then11

if.then11:                                        ; preds = %if.end6
  %18 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production12 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %18, i32 0, i32 3
  %19 = load i8*, i8** %production12, align 4
  call void @file_error(i8* %19)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end6
  %20 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %output14 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %20, i32 0, i32 4
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %output14, align 4
  %22 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production15 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %22, i32 0, i32 3
  %23 = load i8*, i8** %production15, align 4
  %24 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %filename16 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %24, i32 0, i32 0
  %25 = load i8*, i8** %filename16, align 4
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.77, i32 0, i32 0), i8* %23, i8* %25)
  br label %if.end18

if.end18:                                         ; preds = %if.end13, %if.then2
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then5, %if.then
  %26 = load i32, i32* %retval, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind
define i32 @end_handler(i8* %self, %struct.DEF_FILE* %defs, i8* %arg) #0 {
entry:
  %self.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %arg.addr = alloca i8*, align 4
  store i8* %self, i8** %self.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %self.addr, align 4
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  call void @must_be_building(i8* %0, %struct.DEF_FILE* %1)
  store i32 0, i32* @building_builtin, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define %struct.HANDLER_ENTRY* @find_directive(i8* %directive) #0 {
entry:
  %retval = alloca %struct.HANDLER_ENTRY*, align 4
  %directive.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %directive, i8** %directive.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [10 x %struct.HANDLER_ENTRY], [10 x %struct.HANDLER_ENTRY]* @handlers, i32 0, i32 %0
  %directive1 = getelementptr inbounds %struct.HANDLER_ENTRY, %struct.HANDLER_ENTRY* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %directive1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [10 x %struct.HANDLER_ENTRY], [10 x %struct.HANDLER_ENTRY]* @handlers, i32 0, i32 %2
  %directive3 = getelementptr inbounds %struct.HANDLER_ENTRY, %struct.HANDLER_ENTRY* %arrayidx2, i32 0, i32 0
  %3 = load i8*, i8** %directive3, align 4
  %4 = load i8*, i8** %directive.addr, align 4
  %call = call i32 @strcmp(i8* %3, i8* %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [10 x %struct.HANDLER_ENTRY], [10 x %struct.HANDLER_ENTRY]* @handlers, i32 0, i32 %5
  store %struct.HANDLER_ENTRY* %arrayidx4, %struct.HANDLER_ENTRY** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.HANDLER_ENTRY* null, %struct.HANDLER_ENTRY** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load %struct.HANDLER_ENTRY*, %struct.HANDLER_ENTRY** %retval, align 4
  ret %struct.HANDLER_ENTRY* %7
}

; Function Attrs: noinline nounwind
define void @extract_info(i8* %filename, %struct._IO_FILE* %structfile, %struct._IO_FILE* %externfile) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %structfile.addr = alloca %struct._IO_FILE*, align 4
  %externfile.addr = alloca %struct._IO_FILE*, align 4
  %i = alloca i32, align 4
  %defs = alloca %struct.DEF_FILE*, align 4
  %finfo = alloca %struct.stat, align 8
  %file_size = alloca i32, align 4
  %buffer = alloca i8*, align 4
  %line = alloca i8*, align 4
  %fd = alloca i32, align 4
  %nr = alloca i32, align 4
  %j = alloca i32, align 4
  %directive = alloca i8*, align 4
  %handler = alloca %struct.HANDLER_ENTRY*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store %struct._IO_FILE* %structfile, %struct._IO_FILE** %structfile.addr, align 4
  store %struct._IO_FILE* %externfile, %struct._IO_FILE** %externfile.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %finfo)
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 4
  call void @file_error(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %filename.addr, align 4
  %call1 = call i32 (i8*, i32, ...) @open(i8* %2, i32 0, i32 438)
  store i32 %call1, i32* %fd, align 4
  %3 = load i32, i32* %fd, align 4
  %cmp2 = icmp eq i32 %3, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i8*, i8** %filename.addr, align 4
  call void @file_error(i8* %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %5 = load i32, i32* %st_size, align 8
  store i32 %5, i32* %file_size, align 4
  %6 = load i32, i32* %file_size, align 4
  %add = add i32 1, %6
  %call5 = call i8* @xmalloc(i32 %add)
  store i8* %call5, i8** %buffer, align 4
  %7 = load i32, i32* %fd, align 4
  %8 = load i8*, i8** %buffer, align 4
  %9 = load i32, i32* %file_size, align 4
  %call6 = call i32 @read(i32 %7, i8* %8, i32 %9)
  store i32 %call6, i32* %nr, align 4
  %cmp7 = icmp slt i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %10 = load i8*, i8** %filename.addr, align 4
  call void @file_error(i8* %10)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end4
  %11 = load i32, i32* %nr, align 4
  %12 = load i32, i32* %file_size, align 4
  %cmp10 = icmp ult i32 %11, %12
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  %13 = load i32, i32* %nr, align 4
  store i32 %13, i32* %file_size, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end9
  %14 = load i32, i32* %fd, align 4
  %call13 = call i32 @close(i32 %14)
  %15 = load i32, i32* %nr, align 4
  %cmp14 = icmp eq i32 %15, 0
  br i1 %cmp14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %17 = load i8*, i8** %filename.addr, align 4
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.62, i32 0, i32 0), i8* %17)
  %18 = load i8*, i8** %buffer, align 4
  call void @free(i8* %18)
  br label %return

if.end17:                                         ; preds = %if.end12
  %call18 = call i8* @xmalloc(i32 24)
  %19 = bitcast i8* %call18 to %struct.DEF_FILE*
  store %struct.DEF_FILE* %19, %struct.DEF_FILE** %defs, align 4
  %20 = load i8*, i8** %filename.addr, align 4
  %21 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %filename19 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %21, i32 0, i32 0
  store i8* %20, i8** %filename19, align 4
  %call20 = call %struct.ARRAY* @array_create(i32 4)
  %22 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %lines = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %22, i32 0, i32 1
  store %struct.ARRAY* %call20, %struct.ARRAY** %lines, align 4
  %23 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %line_number = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %23, i32 0, i32 2
  store i32 0, i32* %line_number, align 4
  %24 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %production = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %24, i32 0, i32 3
  store i8* null, i8** %production, align 4
  %25 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %25, i32 0, i32 4
  store %struct._IO_FILE* null, %struct._IO_FILE** %output, align 4
  %26 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %builtins = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %26, i32 0, i32 5
  store %struct.ARRAY* null, %struct.ARRAY** %builtins, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %if.end17
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* %file_size, align 4
  %cmp21 = icmp ult i32 %27, %28
  br i1 %cmp21, label %while.body, label %while.end31

while.body:                                       ; preds = %while.cond
  %29 = load i8*, i8** %buffer, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %lines22 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %31, i32 0, i32 1
  %32 = load %struct.ARRAY*, %struct.ARRAY** %lines22, align 4
  call void @array_add(i8* %arrayidx, %struct.ARRAY* %32)
  br label %while.cond23

while.cond23:                                     ; preds = %while.body28, %while.body
  %33 = load i32, i32* %i, align 4
  %34 = load i32, i32* %file_size, align 4
  %cmp24 = icmp ult i32 %33, %34
  br i1 %cmp24, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond23
  %35 = load i8*, i8** %buffer, align 4
  %36 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i8, i8* %arrayidx25, align 1
  %conv = sext i8 %37 to i32
  %cmp26 = icmp ne i32 %conv, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond23
  %38 = phi i1 [ false, %while.cond23 ], [ %cmp26, %land.rhs ]
  br i1 %38, label %while.body28, label %while.end

while.body28:                                     ; preds = %land.end
  %39 = load i32, i32* %i, align 4
  %inc = add nsw i32 %39, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond23

while.end:                                        ; preds = %land.end
  %40 = load i8*, i8** %buffer, align 4
  %41 = load i32, i32* %i, align 4
  %inc29 = add nsw i32 %41, 1
  store i32 %inc29, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %40, i32 %41
  store i8 0, i8* %arrayidx30, align 1
  br label %while.cond

while.end31:                                      ; preds = %while.cond
  store i32 1, i32* @output_cpp_line_info, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc113, %while.end31
  %42 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %lines32 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %42, i32 0, i32 1
  %43 = load %struct.ARRAY*, %struct.ARRAY** %lines32, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %43, i32 0, i32 4
  %44 = load i8**, i8*** %array, align 4
  %45 = load i32, i32* %i, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %44, i32 %45
  %46 = load i8*, i8** %arrayidx33, align 4
  store i8* %46, i8** %line, align 4
  %tobool = icmp ne i8* %46, null
  br i1 %tobool, label %for.body, label %for.end115

for.body:                                         ; preds = %for.cond
  %47 = load i32, i32* %i, align 4
  %48 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %line_number34 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %48, i32 0, i32 2
  store i32 %47, i32* %line_number34, align 4
  %49 = load i8*, i8** %line, align 4
  %50 = load i8, i8* %49, align 1
  %conv35 = sext i8 %50 to i32
  %cmp36 = icmp eq i32 %conv35, 36
  br i1 %cmp36, label %if.then38, label %if.else79

if.then38:                                        ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc, %if.then38
  %51 = load i8*, i8** %line, align 4
  %52 = load i32, i32* %j, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %53 to i32
  %tobool42 = icmp ne i32 %conv41, 0
  br i1 %tobool42, label %land.rhs43, label %land.end52

land.rhs43:                                       ; preds = %for.cond39
  %54 = load i8*, i8** %line, align 4
  %55 = load i32, i32* %j, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %54, i32 %55
  %56 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %56 to i32
  %cmp46 = icmp eq i32 %conv45, 32
  br i1 %cmp46, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs43
  %57 = load i8*, i8** %line, align 4
  %58 = load i32, i32* %j, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %57, i32 %58
  %59 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %59 to i32
  %cmp50 = icmp eq i32 %conv49, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs43
  %60 = phi i1 [ true, %land.rhs43 ], [ %cmp50, %lor.rhs ]
  %lnot = xor i1 %60, true
  br label %land.end52

land.end52:                                       ; preds = %lor.end, %for.cond39
  %61 = phi i1 [ false, %for.cond39 ], [ %lnot, %lor.end ]
  br i1 %61, label %for.body53, label %for.end

for.body53:                                       ; preds = %land.end52
  br label %for.inc

for.inc:                                          ; preds = %for.body53
  %62 = load i32, i32* %j, align 4
  %inc54 = add nsw i32 %62, 1
  store i32 %inc54, i32* %j, align 4
  br label %for.cond39

for.end:                                          ; preds = %land.end52
  %63 = load i32, i32* %j, align 4
  %call55 = call i8* @xmalloc(i32 %63)
  store i8* %call55, i8** %directive, align 4
  %64 = load i8*, i8** %directive, align 4
  %65 = load i8*, i8** %line, align 4
  %add.ptr = getelementptr inbounds i8, i8* %65, i32 1
  %66 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %66, 1
  %call56 = call i8* @strncpy(i8* %64, i8* %add.ptr, i32 %sub)
  %67 = load i8*, i8** %directive, align 4
  %68 = load i32, i32* %j, align 4
  %sub57 = sub nsw i32 %68, 1
  %arrayidx58 = getelementptr inbounds i8, i8* %67, i32 %sub57
  store i8 0, i8* %arrayidx58, align 1
  %69 = load i8*, i8** %directive, align 4
  %call59 = call %struct.HANDLER_ENTRY* @find_directive(i8* %69)
  store %struct.HANDLER_ENTRY* %call59, %struct.HANDLER_ENTRY** %handler, align 4
  %70 = load %struct.HANDLER_ENTRY*, %struct.HANDLER_ENTRY** %handler, align 4
  %tobool60 = icmp ne %struct.HANDLER_ENTRY* %70, null
  br i1 %tobool60, label %if.else, label %if.then61

if.then61:                                        ; preds = %for.end
  %71 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %72 = load i8*, i8** %directive, align 4
  call void bitcast (void (%struct.DEF_FILE*, i8*, i8*, i8*)* @line_error to void (%struct.DEF_FILE*, i8*, i8*)*)(%struct.DEF_FILE* %71, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.63, i32 0, i32 0), i8* %72)
  %73 = load i8*, i8** %directive, align 4
  call void @free(i8* %73)
  br label %for.inc113

if.else:                                          ; preds = %for.end
  br label %while.cond62

while.cond62:                                     ; preds = %while.body73, %if.else
  %74 = load i8*, i8** %line, align 4
  %75 = load i32, i32* %j, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %74, i32 %75
  %76 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %76 to i32
  %cmp65 = icmp eq i32 %conv64, 32
  br i1 %cmp65, label %lor.end72, label %lor.rhs67

lor.rhs67:                                        ; preds = %while.cond62
  %77 = load i8*, i8** %line, align 4
  %78 = load i32, i32* %j, align 4
  %arrayidx68 = getelementptr inbounds i8, i8* %77, i32 %78
  %79 = load i8, i8* %arrayidx68, align 1
  %conv69 = sext i8 %79 to i32
  %cmp70 = icmp eq i32 %conv69, 9
  br label %lor.end72

lor.end72:                                        ; preds = %lor.rhs67, %while.cond62
  %80 = phi i1 [ true, %while.cond62 ], [ %cmp70, %lor.rhs67 ]
  br i1 %80, label %while.body73, label %while.end75

while.body73:                                     ; preds = %lor.end72
  %81 = load i32, i32* %j, align 4
  %inc74 = add nsw i32 %81, 1
  store i32 %inc74, i32* %j, align 4
  br label %while.cond62

while.end75:                                      ; preds = %lor.end72
  %82 = load %struct.HANDLER_ENTRY*, %struct.HANDLER_ENTRY** %handler, align 4
  %function = getelementptr inbounds %struct.HANDLER_ENTRY, %struct.HANDLER_ENTRY* %82, i32 0, i32 1
  %83 = load i32 (i8*, %struct.DEF_FILE*, i8*)*, i32 (i8*, %struct.DEF_FILE*, i8*)** %function, align 4
  %84 = load i8*, i8** %directive, align 4
  %85 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %86 = load i8*, i8** %line, align 4
  %87 = load i32, i32* %j, align 4
  %add.ptr76 = getelementptr inbounds i8, i8* %86, i32 %87
  %call77 = call i32 %83(i8* %84, %struct.DEF_FILE* %85, i8* %add.ptr76)
  br label %if.end78

if.end78:                                         ; preds = %while.end75
  %88 = load i8*, i8** %directive, align 4
  call void @free(i8* %88)
  br label %if.end112

if.else79:                                        ; preds = %for.body
  %89 = load i32, i32* @building_builtin, align 4
  %tobool80 = icmp ne i32 %89, 0
  br i1 %tobool80, label %if.then81, label %if.else82

if.then81:                                        ; preds = %if.else79
  %90 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %91 = load i8*, i8** %line, align 4
  call void @add_documentation(%struct.DEF_FILE* %90, i8* %91)
  br label %if.end111

if.else82:                                        ; preds = %if.else79
  %92 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output83 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %92, i32 0, i32 4
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** %output83, align 4
  %tobool84 = icmp ne %struct._IO_FILE* %93, null
  br i1 %tobool84, label %if.then85, label %if.end110

if.then85:                                        ; preds = %if.else82
  %94 = load i32, i32* @output_cpp_line_info, align 4
  %tobool86 = icmp ne i32 %94, 0
  br i1 %tobool86, label %if.then87, label %if.end107

if.then87:                                        ; preds = %if.then85
  %95 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %filename88 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %95, i32 0, i32 0
  %96 = load i8*, i8** %filename88, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %96, i32 0
  %97 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %97 to i32
  %cmp91 = icmp eq i32 %conv90, 47
  br i1 %cmp91, label %if.then93, label %if.else99

if.then93:                                        ; preds = %if.then87
  %98 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output94 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %98, i32 0, i32 4
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** %output94, align 4
  %100 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %line_number95 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %100, i32 0, i32 2
  %101 = load i32, i32* %line_number95, align 4
  %add96 = add nsw i32 %101, 1
  %102 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %filename97 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %102, i32 0, i32 0
  %103 = load i8*, i8** %filename97, align 4
  %call98 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %99, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.64, i32 0, i32 0), i32 %add96, i8* %103)
  br label %if.end106

if.else99:                                        ; preds = %if.then87
  %104 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output100 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %104, i32 0, i32 4
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** %output100, align 4
  %106 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %line_number101 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %106, i32 0, i32 2
  %107 = load i32, i32* %line_number101, align 4
  %add102 = add nsw i32 %107, 1
  %108 = load i8*, i8** @error_directory, align 4
  %tobool103 = icmp ne i8* %108, null
  br i1 %tobool103, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else99
  %109 = load i8*, i8** @error_directory, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.else99
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %109, %cond.true ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0), %cond.false ]
  %110 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %filename104 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %110, i32 0, i32 0
  %111 = load i8*, i8** %filename104, align 4
  %call105 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.65, i32 0, i32 0), i32 %add102, i8* %cond, i8* %111)
  br label %if.end106

if.end106:                                        ; preds = %cond.end, %if.then93
  store i32 0, i32* @output_cpp_line_info, align 4
  br label %if.end107

if.end107:                                        ; preds = %if.end106, %if.then85
  %112 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output108 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %112, i32 0, i32 4
  %113 = load %struct._IO_FILE*, %struct._IO_FILE** %output108, align 4
  %114 = load i8*, i8** %line, align 4
  %call109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %113, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i32 0, i32 0), i8* %114)
  br label %if.end110

if.end110:                                        ; preds = %if.end107, %if.else82
  br label %if.end111

if.end111:                                        ; preds = %if.end110, %if.then81
  br label %if.end112

if.end112:                                        ; preds = %if.end111, %if.end78
  br label %for.inc113

for.inc113:                                       ; preds = %if.end112, %if.then61
  %115 = load i32, i32* %i, align 4
  %inc114 = add nsw i32 %115, 1
  store i32 %inc114, i32* %i, align 4
  br label %for.cond

for.end115:                                       ; preds = %for.cond
  %116 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output116 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %116, i32 0, i32 4
  %117 = load %struct._IO_FILE*, %struct._IO_FILE** %output116, align 4
  %tobool117 = icmp ne %struct._IO_FILE* %117, null
  br i1 %tobool117, label %if.then118, label %if.end121

if.then118:                                       ; preds = %for.end115
  %118 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %output119 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %118, i32 0, i32 4
  %119 = load %struct._IO_FILE*, %struct._IO_FILE** %output119, align 4
  %call120 = call i32 @fclose(%struct._IO_FILE* %119)
  br label %if.end121

if.end121:                                        ; preds = %if.then118, %for.end115
  %120 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %122 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  call void @write_builtins(%struct.DEF_FILE* %120, %struct._IO_FILE* %121, %struct._IO_FILE* %122)
  %123 = load i8*, i8** %buffer, align 4
  call void @free(i8* %123)
  %124 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs, align 4
  call void @free_defs(%struct.DEF_FILE* %124)
  br label %return

return:                                           ; preds = %if.end121, %if.then15
  ret void
}

declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @open(i8*, i32, ...) #1

declare i32 @read(i32, i8*, i32) #1

declare i32 @close(i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @free_defs(%struct.DEF_FILE* %defs) #0 {
entry:
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %i = alloca i32, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  %0 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %0, i32 0, i32 3
  %1 = load i8*, i8** %production, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %production1 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %2, i32 0, i32 3
  %3 = load i8*, i8** %production1, align 4
  call void @free(i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %lines = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %4, i32 0, i32 1
  %5 = load %struct.ARRAY*, %struct.ARRAY** %lines, align 4
  %tobool2 = icmp ne %struct.ARRAY* %5, null
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %6 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %lines4 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %6, i32 0, i32 1
  %7 = load %struct.ARRAY*, %struct.ARRAY** %lines4, align 4
  call void @array_free(%struct.ARRAY* %7)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %8 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %8, i32 0, i32 5
  %9 = load %struct.ARRAY*, %struct.ARRAY** %builtins, align 4
  %tobool6 = icmp ne %struct.ARRAY* %9, null
  br i1 %tobool6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.end5
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then7
  %10 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins8 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %10, i32 0, i32 5
  %11 = load %struct.ARRAY*, %struct.ARRAY** %builtins8, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %11, i32 0, i32 4
  %12 = load i8**, i8*** %array, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %12, i32 %13
  %14 = load i8*, i8** %arrayidx, align 4
  %15 = bitcast i8* %14 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %15, %struct.BUILTIN_DESC** %builtin, align 4
  %tobool9 = icmp ne %struct.BUILTIN_DESC* %15, null
  br i1 %tobool9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  call void @free_builtin(%struct.BUILTIN_DESC* %16)
  %17 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %18 = bitcast %struct.BUILTIN_DESC* %17 to i8*
  call void @free(i8* %18)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins10 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %20, i32 0, i32 5
  %21 = load %struct.ARRAY*, %struct.ARRAY** %builtins10, align 4
  call void @array_free(%struct.ARRAY* %21)
  br label %if.end11

if.end11:                                         ; preds = %for.end, %if.end5
  %22 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %23 = bitcast %struct.DEF_FILE* %22 to i8*
  call void @free(i8* %23)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @free_builtin(%struct.BUILTIN_DESC* %builtin) #0 {
entry:
  %builtin.addr = alloca %struct.BUILTIN_DESC*, align 4
  %i = alloca i32, align 4
  store %struct.BUILTIN_DESC* %builtin, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %0 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %0, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %name1 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %2, i32 0, i32 0
  %3 = load i8*, i8** %name1, align 4
  call void @free(i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %function = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %4, i32 0, i32 1
  %5 = load i8*, i8** %function, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %6 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %function4 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %6, i32 0, i32 1
  %7 = load i8*, i8** %function4, align 4
  call void @free(i8* %7)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %8 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %shortdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %8, i32 0, i32 2
  %9 = load i8*, i8** %shortdoc, align 4
  %tobool6 = icmp ne i8* %9, null
  br i1 %tobool6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end5
  %10 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %shortdoc8 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %10, i32 0, i32 2
  %11 = load i8*, i8** %shortdoc8, align 4
  call void @free(i8* %11)
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end5
  %12 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %12, i32 0, i32 3
  %13 = load i8*, i8** %docname, align 4
  %tobool10 = icmp ne i8* %13, null
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end9
  %14 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %docname12 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %14, i32 0, i32 3
  %15 = load i8*, i8** %docname12, align 4
  call void @free(i8* %15)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end9
  %16 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %16, i32 0, i32 4
  %17 = load %struct.ARRAY*, %struct.ARRAY** %longdoc, align 4
  %tobool14 = icmp ne %struct.ARRAY* %17, null
  br i1 %tobool14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end13
  %18 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %longdoc16 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %18, i32 0, i32 4
  %19 = load %struct.ARRAY*, %struct.ARRAY** %longdoc16, align 4
  call void @array_free(%struct.ARRAY* %19)
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end13
  %20 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %dependencies = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %20, i32 0, i32 5
  %21 = load %struct.ARRAY*, %struct.ARRAY** %dependencies, align 4
  %tobool18 = icmp ne %struct.ARRAY* %21, null
  br i1 %tobool18, label %if.then19, label %if.end26

if.then19:                                        ; preds = %if.end17
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then19
  %22 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %dependencies20 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %22, i32 0, i32 5
  %23 = load %struct.ARRAY*, %struct.ARRAY** %dependencies20, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %23, i32 0, i32 4
  %24 = load i8**, i8*** %array, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx, align 4
  %tobool21 = icmp ne i8* %26, null
  br i1 %tobool21, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %27 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %dependencies22 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %27, i32 0, i32 5
  %28 = load %struct.ARRAY*, %struct.ARRAY** %dependencies22, align 4
  %array23 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %28, i32 0, i32 4
  %29 = load i8**, i8*** %array23, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds i8*, i8** %29, i32 %30
  %31 = load i8*, i8** %arrayidx24, align 4
  call void @free(i8* %31)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %i, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %33 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %dependencies25 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %33, i32 0, i32 5
  %34 = load %struct.ARRAY*, %struct.ARRAY** %dependencies25, align 4
  call void @array_free(%struct.ARRAY* %34)
  br label %if.end26

if.end26:                                         ; preds = %for.end, %if.end17
  ret void
}

; Function Attrs: noinline nounwind
define i8* @strip_whitespace(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv2, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %4 = phi i1 [ true, %while.cond ], [ %cmp3, %lor.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %5 = load i8*, i8** %string.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %incdec.ptr, i8** %string.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %6 = load i8*, i8** %string.addr, align 4
  call void @remove_trailing_whitespace(i8* %6)
  %7 = load i8*, i8** %string.addr, align 4
  ret i8* %7
}

; Function Attrs: noinline nounwind
define void @remove_trailing_whitespace(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %sub = sub i32 %call, 1
  store i32 %sub, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %8 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %9 = phi i1 [ false, %while.cond ], [ %8, %lor.end ]
  br i1 %9, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %10 = load i32, i32* %i, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i32 %inc
  store i8 0, i8* %arrayidx7, align 1
  ret void
}

; Function Attrs: noinline nounwind
define i8* @get_arg(i8* %for_whom, %struct.DEF_FILE* %defs, i8* %string) #0 {
entry:
  %for_whom.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %string.addr = alloca i8*, align 4
  %new = alloca i8*, align 4
  store i8* %for_whom, i8** %for_whom.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i8* @strip_whitespace(i8* %0)
  store i8* %call, i8** %new, align 4
  %1 = load i8*, i8** %new, align 4
  %2 = load i8, i8* %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %3 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %4 = load i8*, i8** %for_whom.addr, align 4
  call void bitcast (void (%struct.DEF_FILE*, i8*, i8*, i8*)* @line_error to void (%struct.DEF_FILE*, i8*, i8*)*)(%struct.DEF_FILE* %3, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.68, i32 0, i32 0), i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %new, align 4
  %call1 = call i32 @strlen(i8* %5)
  %add = add i32 1, %call1
  %call2 = call i8* @xmalloc(i32 %add)
  %6 = load i8*, i8** %new, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %6)
  ret i8* %call3
}

; Function Attrs: noinline nounwind
define void @must_be_building(i8* %directive, %struct.DEF_FILE* %defs) #0 {
entry:
  %directive.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  store i8* %directive, i8** %directive.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  %0 = load i32, i32* @building_builtin, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %2 = load i8*, i8** %directive.addr, align 4
  call void bitcast (void (%struct.DEF_FILE*, i8*, i8*, i8*)* @line_error to void (%struct.DEF_FILE*, i8*, i8*)*)(%struct.DEF_FILE* %1, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.69, i32 0, i32 0), i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define %struct.BUILTIN_DESC* @current_builtin(i8* %directive, %struct.DEF_FILE* %defs) #0 {
entry:
  %retval = alloca %struct.BUILTIN_DESC*, align 4
  %directive.addr = alloca i8*, align 4
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  store i8* %directive, i8** %directive.addr, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  %0 = load i8*, i8** %directive.addr, align 4
  %1 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  call void @must_be_building(i8* %0, %struct.DEF_FILE* %1)
  %2 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %2, i32 0, i32 5
  %3 = load %struct.ARRAY*, %struct.ARRAY** %builtins, align 4
  %tobool = icmp ne %struct.ARRAY* %3, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins1 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %4, i32 0, i32 5
  %5 = load %struct.ARRAY*, %struct.ARRAY** %builtins1, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %5, i32 0, i32 4
  %6 = load i8**, i8*** %array, align 4
  %7 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins2 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %7, i32 0, i32 5
  %8 = load %struct.ARRAY*, %struct.ARRAY** %builtins2, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %8, i32 0, i32 1
  %9 = load i32, i32* %sindex, align 4
  %sub = sub nsw i32 %9, 1
  %arrayidx = getelementptr inbounds i8*, i8** %6, i32 %sub
  %10 = load i8*, i8** %arrayidx, align 4
  %11 = bitcast i8* %10 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %11, %struct.BUILTIN_DESC** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  store %struct.BUILTIN_DESC* null, %struct.BUILTIN_DESC** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %12 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %retval, align 4
  ret %struct.BUILTIN_DESC* %12
}

; Function Attrs: noinline nounwind
define void @add_documentation(%struct.DEF_FILE* %defs, i8* %line) #0 {
entry:
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %line.addr = alloca i8*, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %call = call %struct.BUILTIN_DESC* @current_builtin(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.70, i32 0, i32 0), %struct.DEF_FILE* %0)
  store %struct.BUILTIN_DESC* %call, %struct.BUILTIN_DESC** %builtin, align 4
  %1 = load i8*, i8** %line.addr, align 4
  call void @remove_trailing_whitespace(i8* %1)
  %2 = load i8*, i8** %line.addr, align 4
  %3 = load i8, i8* %2, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %4 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %4, i32 0, i32 4
  %5 = load %struct.ARRAY*, %struct.ARRAY** %longdoc, align 4
  %tobool1 = icmp ne %struct.ARRAY* %5, null
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %6 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc2 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %6, i32 0, i32 4
  %7 = load %struct.ARRAY*, %struct.ARRAY** %longdoc2, align 4
  %tobool3 = icmp ne %struct.ARRAY* %7, null
  br i1 %tobool3, label %if.end7, label %if.then4

if.then4:                                         ; preds = %if.end
  %call5 = call %struct.ARRAY* @array_create(i32 4)
  %8 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc6 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %8, i32 0, i32 4
  store %struct.ARRAY* %call5, %struct.ARRAY** %longdoc6, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %9 = load i8*, i8** %line.addr, align 4
  %10 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc8 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %10, i32 0, i32 4
  %11 = load %struct.ARRAY*, %struct.ARRAY** %longdoc8, align 4
  call void @array_add(i8* %9, %struct.ARRAY* %11)
  br label %return

return:                                           ; preds = %if.end7, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @line_error(%struct.DEF_FILE* %defs, i8* %format, i8* %arg1, i8* %arg2) #0 {
entry:
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %format.addr = alloca i8*, align 4
  %arg1.addr = alloca i8*, align 4
  %arg2.addr = alloca i8*, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store i8* %format, i8** %format.addr, align 4
  store i8* %arg1, i8** %arg1.addr, align 4
  store i8* %arg2, i8** %arg2.addr, align 4
  %0 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %filename = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %0, i32 0, i32 0
  %1 = load i8*, i8** %filename, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 47
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %4 = load i8*, i8** @error_directory, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %5 = load i8*, i8** @error_directory, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %5, %cond.true ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0), %cond.false ]
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.78, i32 0, i32 0), i8* %cond)
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %7 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %filename2 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %7, i32 0, i32 0
  %8 = load i8*, i8** %filename2, align 4
  %9 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %line_number = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %9, i32 0, i32 2
  %10 = load i32, i32* %line_number, align 4
  %add = add nsw i32 %10, 1
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.79, i32 0, i32 0), i8* %8, i32 %add)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %12 = load i8*, i8** %format.addr, align 4
  %13 = load i8*, i8** %arg1.addr, align 4
  %14 = load i8*, i8** %arg2.addr, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* %12, i8* %13, i8* %14)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.80, i32 0, i32 0))
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call6 = call i32 @fflush(%struct._IO_FILE* %16)
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define void @file_error(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  call void @perror(i8* %0)
  call void @exit(i32 2) #3
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @perror(i8*) #1

; Function Attrs: noinline nounwind
define %struct.BUILTIN_DESC* @copy_builtin(%struct.BUILTIN_DESC* %builtin) #0 {
entry:
  %builtin.addr = alloca %struct.BUILTIN_DESC*, align 4
  %new = alloca %struct.BUILTIN_DESC*, align 4
  store %struct.BUILTIN_DESC* %builtin, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %call = call i8* @xmalloc(i32 28)
  %0 = bitcast i8* %call to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %0, %struct.BUILTIN_DESC** %new, align 4
  %1 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %1, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %call1 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call1
  %call2 = call i8* @xmalloc(i32 %add)
  %3 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %name3 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %3, i32 0, i32 0
  %4 = load i8*, i8** %name3, align 4
  %call4 = call i8* @strcpy(i8* %call2, i8* %4)
  %5 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %name5 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %5, i32 0, i32 0
  store i8* %call4, i8** %name5, align 4
  %6 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %shortdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %6, i32 0, i32 2
  %7 = load i8*, i8** %shortdoc, align 4
  %call6 = call i32 @strlen(i8* %7)
  %add7 = add i32 1, %call6
  %call8 = call i8* @xmalloc(i32 %add7)
  %8 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %shortdoc9 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %8, i32 0, i32 2
  %9 = load i8*, i8** %shortdoc9, align 4
  %call10 = call i8* @strcpy(i8* %call8, i8* %9)
  %10 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %shortdoc11 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %10, i32 0, i32 2
  store i8* %call10, i8** %shortdoc11, align 4
  %11 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %11, i32 0, i32 4
  %12 = load %struct.ARRAY*, %struct.ARRAY** %longdoc, align 4
  %call12 = call %struct.ARRAY* @copy_string_array(%struct.ARRAY* %12)
  %13 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %longdoc13 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %13, i32 0, i32 4
  store %struct.ARRAY* %call12, %struct.ARRAY** %longdoc13, align 4
  %14 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %dependencies = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %14, i32 0, i32 5
  %15 = load %struct.ARRAY*, %struct.ARRAY** %dependencies, align 4
  %call14 = call %struct.ARRAY* @copy_string_array(%struct.ARRAY* %15)
  %16 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %dependencies15 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %16, i32 0, i32 5
  store %struct.ARRAY* %call14, %struct.ARRAY** %dependencies15, align 4
  %17 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %function = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %17, i32 0, i32 1
  %18 = load i8*, i8** %function, align 4
  %tobool = icmp ne i8* %18, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %19 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %function16 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %19, i32 0, i32 1
  %20 = load i8*, i8** %function16, align 4
  %call17 = call i32 @strlen(i8* %20)
  %add18 = add i32 1, %call17
  %call19 = call i8* @xmalloc(i32 %add18)
  %21 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %function20 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %21, i32 0, i32 1
  %22 = load i8*, i8** %function20, align 4
  %call21 = call i8* @strcpy(i8* %call19, i8* %22)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call21, %cond.true ], [ null, %cond.false ]
  %23 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %function22 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %23, i32 0, i32 1
  store i8* %cond, i8** %function22, align 4
  %24 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %24, i32 0, i32 3
  %25 = load i8*, i8** %docname, align 4
  %tobool23 = icmp ne i8* %25, null
  br i1 %tobool23, label %cond.true24, label %cond.false31

cond.true24:                                      ; preds = %cond.end
  %26 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %docname25 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %26, i32 0, i32 3
  %27 = load i8*, i8** %docname25, align 4
  %call26 = call i32 @strlen(i8* %27)
  %add27 = add i32 1, %call26
  %call28 = call i8* @xmalloc(i32 %add27)
  %28 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %docname29 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %28, i32 0, i32 3
  %29 = load i8*, i8** %docname29, align 4
  %call30 = call i8* @strcpy(i8* %call28, i8* %29)
  br label %cond.end32

cond.false31:                                     ; preds = %cond.end
  br label %cond.end32

cond.end32:                                       ; preds = %cond.false31, %cond.true24
  %cond33 = phi i8* [ %call30, %cond.true24 ], [ null, %cond.false31 ]
  %30 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  %docname34 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %30, i32 0, i32 3
  store i8* %cond33, i8** %docname34, align 4
  %31 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %new, align 4
  ret %struct.BUILTIN_DESC* %31
}

; Function Attrs: noinline nounwind
define void @save_builtin(%struct.BUILTIN_DESC* %builtin) #0 {
entry:
  %builtin.addr = alloca %struct.BUILTIN_DESC*, align 4
  %newbuiltin = alloca %struct.BUILTIN_DESC*, align 4
  store %struct.BUILTIN_DESC* %builtin, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %0 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin.addr, align 4
  %call = call %struct.BUILTIN_DESC* @copy_builtin(%struct.BUILTIN_DESC* %0)
  store %struct.BUILTIN_DESC* %call, %struct.BUILTIN_DESC** %newbuiltin, align 4
  %1 = load %struct.ARRAY*, %struct.ARRAY** @saved_builtins, align 4
  %tobool = icmp ne %struct.ARRAY* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call %struct.ARRAY* @array_create(i32 4)
  store %struct.ARRAY* %call1, %struct.ARRAY** @saved_builtins, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %newbuiltin, align 4
  %3 = bitcast %struct.BUILTIN_DESC* %2 to i8*
  %4 = load %struct.ARRAY*, %struct.ARRAY** @saved_builtins, align 4
  call void @array_add(i8* %3, %struct.ARRAY* %4)
  ret void
}

; Function Attrs: noinline nounwind
define void @write_file_headers(%struct._IO_FILE* %structfile, %struct._IO_FILE* %externfile) #0 {
entry:
  %structfile.addr = alloca %struct._IO_FILE*, align 4
  %externfile.addr = alloca %struct._IO_FILE*, align 4
  %i = alloca i32, align 4
  store %struct._IO_FILE* %structfile, %struct._IO_FILE** %structfile.addr, align 4
  store %struct._IO_FILE* %externfile, %struct._IO_FILE** %externfile.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [39 x i8*], [39 x i8*]* @structfile_header, i32 0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [39 x i8*], [39 x i8*]* @structfile_header, i32 0, i32 %4
  %5 = load i8*, i8** %arrayidx2, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i32 0, i32 0), i8* %5)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %8 = load i8*, i8** @extern_filename, align 4
  %tobool3 = icmp ne i8* %8, null
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %9 = load i8*, i8** @extern_filename, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %9, %cond.true ], [ getelementptr inbounds ([11 x i8], [11 x i8]* @.str.117, i32 0, i32 0), %cond.false ]
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.116, i32 0, i32 0), i8* %cond)
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.118, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.119, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %tobool7 = icmp ne %struct._IO_FILE* %12, null
  br i1 %tobool7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %if.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %14 = load i8*, i8** @extern_filename, align 4
  %tobool9 = icmp ne i8* %14, null
  br i1 %tobool9, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %if.then8
  %15 = load i8*, i8** @extern_filename, align 4
  br label %cond.end12

cond.false11:                                     ; preds = %if.then8
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %cond13 = phi i8* [ %15, %cond.true10 ], [ getelementptr inbounds ([11 x i8], [11 x i8]* @.str.117, i32 0, i32 0), %cond.false11 ]
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.120, i32 0, i32 0), i8* %cond13)
  br label %if.end15

if.end15:                                         ; preds = %cond.end12, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define void @write_file_footers(%struct._IO_FILE* %structfile, %struct._IO_FILE* %externfile) #0 {
entry:
  %structfile.addr = alloca %struct._IO_FILE*, align 4
  %externfile.addr = alloca %struct._IO_FILE*, align 4
  %i = alloca i32, align 4
  store %struct._IO_FILE* %structfile, %struct._IO_FILE** %structfile.addr, align 4
  store %struct._IO_FILE* %externfile, %struct._IO_FILE** %externfile.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [9 x i8*], [9 x i8*]* @structfile_footer, i32 0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [9 x i8*], [9 x i8*]* @structfile_footer, i32 0, i32 %4
  %5 = load i8*, i8** %arrayidx2, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i32 0, i32 0), i8* %5)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @write_builtins(%struct.DEF_FILE* %defs, %struct._IO_FILE* %structfile, %struct._IO_FILE* %externfile) #0 {
entry:
  %defs.addr = alloca %struct.DEF_FILE*, align 4
  %structfile.addr = alloca %struct._IO_FILE*, align 4
  %externfile.addr = alloca %struct._IO_FILE*, align 4
  %i = alloca i32, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store %struct.DEF_FILE* %defs, %struct.DEF_FILE** %defs.addr, align 4
  store %struct._IO_FILE* %structfile, %struct._IO_FILE** %structfile.addr, align 4
  store %struct._IO_FILE* %externfile, %struct._IO_FILE** %externfile.addr, align 4
  %0 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %0, i32 0, i32 5
  %1 = load %struct.ARRAY*, %struct.ARRAY** %builtins, align 4
  %tobool = icmp ne %struct.ARRAY* %1, null
  br i1 %tobool, label %if.then, label %if.end151

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4
  %3 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins1 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %3, i32 0, i32 5
  %4 = load %struct.ARRAY*, %struct.ARRAY** %builtins1, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %4, i32 0, i32 1
  %5 = load i32, i32* %sindex, align 4
  %cmp = icmp slt i32 %2, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.DEF_FILE*, %struct.DEF_FILE** %defs.addr, align 4
  %builtins2 = getelementptr inbounds %struct.DEF_FILE, %struct.DEF_FILE* %6, i32 0, i32 5
  %7 = load %struct.ARRAY*, %struct.ARRAY** %builtins2, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %7, i32 0, i32 4
  %8 = load i8**, i8*** %array, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %8, i32 %9
  %10 = load i8*, i8** %arrayidx, align 4
  %11 = bitcast i8* %10 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %11, %struct.BUILTIN_DESC** %builtin, align 4
  %12 = load i32, i32* @only_documentation, align 4
  %tobool3 = icmp ne i32 %12, 0
  br i1 %tobool3, label %if.end144, label %if.then4

if.then4:                                         ; preds = %for.body
  %13 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %13, i32 0, i32 5
  %14 = load %struct.ARRAY*, %struct.ARRAY** %dependencies, align 4
  %tobool5 = icmp ne %struct.ARRAY* %14, null
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %16 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies7 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %16, i32 0, i32 5
  %17 = load %struct.ARRAY*, %struct.ARRAY** %dependencies7, align 4
  %array8 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %17, i32 0, i32 4
  %18 = load i8**, i8*** %array8, align 4
  call void @write_ifdefs(%struct._IO_FILE* %15, i8** %18)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %20 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies9 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %20, i32 0, i32 5
  %21 = load %struct.ARRAY*, %struct.ARRAY** %dependencies9, align 4
  %array10 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %21, i32 0, i32 4
  %22 = load i8**, i8*** %array10, align 4
  call void @write_ifdefs(%struct._IO_FILE* %19, i8** %22)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %tobool11 = icmp ne %struct._IO_FILE* %23, null
  br i1 %tobool11, label %if.then12, label %if.end20

if.then12:                                        ; preds = %if.end
  %24 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %24, i32 0, i32 1
  %25 = load i8*, i8** %function, align 4
  %tobool13 = icmp ne i8* %25, null
  br i1 %tobool13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.then12
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %27 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function15 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %27, i32 0, i32 1
  %28 = load i8*, i8** %function15, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.121, i32 0, i32 0), i8* %28)
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.then12
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %30 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %30, i32 0, i32 3
  %31 = load i8*, i8** %docname, align 4
  %tobool17 = icmp ne i8* %31, null
  br i1 %tobool17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end16
  %32 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname18 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %32, i32 0, i32 3
  %33 = load i8*, i8** %docname18, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end16
  %34 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %34, i32 0, i32 0
  %35 = load i8*, i8** %name, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %33, %cond.true ], [ %35, %cond.false ]
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.122, i32 0, i32 0), i8* %cond)
  br label %if.end20

if.end20:                                         ; preds = %cond.end, %if.end
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %tobool21 = icmp ne %struct._IO_FILE* %36, null
  br i1 %tobool21, label %if.then22, label %if.end125

if.then22:                                        ; preds = %if.end20
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %38 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name23 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %38, i32 0, i32 0
  %39 = load i8*, i8** %name23, align 4
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.123, i32 0, i32 0), i8* %39)
  %40 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function25 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %40, i32 0, i32 1
  %41 = load i8*, i8** %function25, align 4
  %tobool26 = icmp ne i8* %41, null
  br i1 %tobool26, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then22
  %42 = load i32, i32* @inhibit_functions, align 4
  %cmp27 = icmp eq i32 %42, 0
  br i1 %cmp27, label %if.then28, label %if.else

if.then28:                                        ; preds = %land.lhs.true
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %44 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function29 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %44, i32 0, i32 1
  %45 = load i8*, i8** %function29, align 4
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.124, i32 0, i32 0), i8* %45)
  br label %if.end32

if.else:                                          ; preds = %land.lhs.true, %if.then22
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %call31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.125, i32 0, i32 0))
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then28
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %48 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %flags = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %48, i32 0, i32 6
  %49 = load i32, i32* %flags, align 4
  %and = and i32 %49, 1
  %tobool33 = icmp ne i32 %and, 0
  %cond34 = select i1 %tobool33, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.128, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0)
  %50 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %flags35 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %50, i32 0, i32 6
  %51 = load i32, i32* %flags35, align 4
  %and36 = and i32 %51, 2
  %tobool37 = icmp ne i32 %and36, 0
  %cond38 = select i1 %tobool37, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.129, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0)
  %52 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %flags39 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %52, i32 0, i32 6
  %53 = load i32, i32* %flags39, align 4
  %and40 = and i32 %53, 4
  %tobool41 = icmp ne i32 %and40, 0
  %cond42 = select i1 %tobool41, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.130, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0)
  %54 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %flags43 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %54, i32 0, i32 6
  %55 = load i32, i32* %flags43, align 4
  %and44 = and i32 %55, 8
  %tobool45 = icmp ne i32 %and44, 0
  %cond46 = select i1 %tobool45, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.131, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.82, i32 0, i32 0)
  %56 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname47 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %56, i32 0, i32 3
  %57 = load i8*, i8** %docname47, align 4
  %tobool48 = icmp ne i8* %57, null
  br i1 %tobool48, label %cond.true49, label %cond.false51

cond.true49:                                      ; preds = %if.end32
  %58 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname50 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %58, i32 0, i32 3
  %59 = load i8*, i8** %docname50, align 4
  br label %cond.end53

cond.false51:                                     ; preds = %if.end32
  %60 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name52 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %60, i32 0, i32 0
  %61 = load i8*, i8** %name52, align 4
  br label %cond.end53

cond.end53:                                       ; preds = %cond.false51, %cond.true49
  %cond54 = phi i8* [ %59, %cond.true49 ], [ %61, %cond.false51 ]
  %call55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.126, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.127, i32 0, i32 0), i8* %cond34, i8* %cond38, i8* %cond42, i8* %cond46, i8* %cond54)
  %62 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %62, i32 0, i32 2
  %63 = load i8*, i8** %shortdoc, align 4
  %tobool56 = icmp ne i8* %63, null
  br i1 %tobool56, label %land.lhs.true57, label %if.else93

land.lhs.true57:                                  ; preds = %cond.end53
  %64 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name58 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %64, i32 0, i32 0
  %65 = load i8*, i8** %name58, align 4
  %66 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc59 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %66, i32 0, i32 2
  %67 = load i8*, i8** %shortdoc59, align 4
  %call60 = call i32 @strcmp(i8* %65, i8* %67)
  %cmp61 = icmp eq i32 %call60, 0
  br i1 %cmp61, label %if.then62, label %if.else93

if.then62:                                        ; preds = %land.lhs.true57
  %68 = load i32, i32* @inhibit_functions, align 4
  %tobool63 = icmp ne i32 %68, 0
  br i1 %tobool63, label %if.then64, label %if.else82

if.then64:                                        ; preds = %if.then62
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %70 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc65 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %70, i32 0, i32 2
  %71 = load i8*, i8** %shortdoc65, align 4
  %tobool66 = icmp ne i8* %71, null
  br i1 %tobool66, label %cond.true67, label %cond.false69

cond.true67:                                      ; preds = %if.then64
  %72 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc68 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %72, i32 0, i32 2
  %73 = load i8*, i8** %shortdoc68, align 4
  br label %cond.end71

cond.false69:                                     ; preds = %if.then64
  %74 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name70 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %74, i32 0, i32 0
  %75 = load i8*, i8** %name70, align 4
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false69, %cond.true67
  %cond72 = phi i8* [ %73, %cond.true67 ], [ %75, %cond.false69 ]
  %76 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname73 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %76, i32 0, i32 3
  %77 = load i8*, i8** %docname73, align 4
  %tobool74 = icmp ne i8* %77, null
  br i1 %tobool74, label %cond.true75, label %cond.false77

cond.true75:                                      ; preds = %cond.end71
  %78 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname76 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %78, i32 0, i32 3
  %79 = load i8*, i8** %docname76, align 4
  br label %cond.end79

cond.false77:                                     ; preds = %cond.end71
  %80 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name78 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %80, i32 0, i32 0
  %81 = load i8*, i8** %name78, align 4
  br label %cond.end79

cond.end79:                                       ; preds = %cond.false77, %cond.true75
  %cond80 = phi i8* [ %79, %cond.true75 ], [ %81, %cond.false77 ]
  %call81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.132, i32 0, i32 0), i8* %cond72, i8* %cond80)
  br label %if.end92

if.else82:                                        ; preds = %if.then62
  %82 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %83 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc83 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %83, i32 0, i32 2
  %84 = load i8*, i8** %shortdoc83, align 4
  %tobool84 = icmp ne i8* %84, null
  br i1 %tobool84, label %cond.true85, label %cond.false87

cond.true85:                                      ; preds = %if.else82
  %85 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc86 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %85, i32 0, i32 2
  %86 = load i8*, i8** %shortdoc86, align 4
  br label %cond.end89

cond.false87:                                     ; preds = %if.else82
  %87 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name88 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %87, i32 0, i32 0
  %88 = load i8*, i8** %name88, align 4
  br label %cond.end89

cond.end89:                                       ; preds = %cond.false87, %cond.true85
  %cond90 = phi i8* [ %86, %cond.true85 ], [ %88, %cond.false87 ]
  %call91 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %82, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.133, i32 0, i32 0), i8* %cond90)
  br label %if.end92

if.end92:                                         ; preds = %cond.end89, %cond.end79
  br label %if.end124

if.else93:                                        ; preds = %land.lhs.true57, %cond.end53
  %89 = load i32, i32* @inhibit_functions, align 4
  %tobool94 = icmp ne i32 %89, 0
  br i1 %tobool94, label %if.then95, label %if.else113

if.then95:                                        ; preds = %if.else93
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %91 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc96 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %91, i32 0, i32 2
  %92 = load i8*, i8** %shortdoc96, align 4
  %tobool97 = icmp ne i8* %92, null
  br i1 %tobool97, label %cond.true98, label %cond.false100

cond.true98:                                      ; preds = %if.then95
  %93 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc99 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %93, i32 0, i32 2
  %94 = load i8*, i8** %shortdoc99, align 4
  br label %cond.end102

cond.false100:                                    ; preds = %if.then95
  %95 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name101 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %95, i32 0, i32 0
  %96 = load i8*, i8** %name101, align 4
  br label %cond.end102

cond.end102:                                      ; preds = %cond.false100, %cond.true98
  %cond103 = phi i8* [ %94, %cond.true98 ], [ %96, %cond.false100 ]
  %97 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname104 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %97, i32 0, i32 3
  %98 = load i8*, i8** %docname104, align 4
  %tobool105 = icmp ne i8* %98, null
  br i1 %tobool105, label %cond.true106, label %cond.false108

cond.true106:                                     ; preds = %cond.end102
  %99 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname107 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %99, i32 0, i32 3
  %100 = load i8*, i8** %docname107, align 4
  br label %cond.end110

cond.false108:                                    ; preds = %cond.end102
  %101 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name109 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %101, i32 0, i32 0
  %102 = load i8*, i8** %name109, align 4
  br label %cond.end110

cond.end110:                                      ; preds = %cond.false108, %cond.true106
  %cond111 = phi i8* [ %100, %cond.true106 ], [ %102, %cond.false108 ]
  %call112 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %90, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.134, i32 0, i32 0), i8* %cond103, i8* %cond111)
  br label %if.end123

if.else113:                                       ; preds = %if.else93
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %104 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc114 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %104, i32 0, i32 2
  %105 = load i8*, i8** %shortdoc114, align 4
  %tobool115 = icmp ne i8* %105, null
  br i1 %tobool115, label %cond.true116, label %cond.false118

cond.true116:                                     ; preds = %if.else113
  %106 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %shortdoc117 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %106, i32 0, i32 2
  %107 = load i8*, i8** %shortdoc117, align 4
  br label %cond.end120

cond.false118:                                    ; preds = %if.else113
  %108 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name119 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %108, i32 0, i32 0
  %109 = load i8*, i8** %name119, align 4
  br label %cond.end120

cond.end120:                                      ; preds = %cond.false118, %cond.true116
  %cond121 = phi i8* [ %107, %cond.true116 ], [ %109, %cond.false118 ]
  %call122 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.135, i32 0, i32 0), i8* %cond121)
  br label %if.end123

if.end123:                                        ; preds = %cond.end120, %cond.end110
  br label %if.end124

if.end124:                                        ; preds = %if.end123, %if.end92
  br label %if.end125

if.end125:                                        ; preds = %if.end124, %if.end20
  %110 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %tobool126 = icmp ne %struct._IO_FILE* %110, null
  br i1 %tobool126, label %if.then128, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end125
  %111 = load i32, i32* @separate_helpfiles, align 4
  %tobool127 = icmp ne i32 %111, 0
  br i1 %tobool127, label %if.then128, label %if.end129

if.then128:                                       ; preds = %lor.lhs.false, %if.end125
  %112 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  call void @save_builtin(%struct.BUILTIN_DESC* %112)
  br label %if.end129

if.end129:                                        ; preds = %if.then128, %lor.lhs.false
  %113 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies130 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %113, i32 0, i32 5
  %114 = load %struct.ARRAY*, %struct.ARRAY** %dependencies130, align 4
  %tobool131 = icmp ne %struct.ARRAY* %114, null
  br i1 %tobool131, label %if.then132, label %if.end143

if.then132:                                       ; preds = %if.end129
  %115 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %tobool133 = icmp ne %struct._IO_FILE* %115, null
  br i1 %tobool133, label %if.then134, label %if.end137

if.then134:                                       ; preds = %if.then132
  %116 = load %struct._IO_FILE*, %struct._IO_FILE** %externfile.addr, align 4
  %117 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies135 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %117, i32 0, i32 5
  %118 = load %struct.ARRAY*, %struct.ARRAY** %dependencies135, align 4
  %array136 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %118, i32 0, i32 4
  %119 = load i8**, i8*** %array136, align 4
  call void @write_endifs(%struct._IO_FILE* %116, i8** %119)
  br label %if.end137

if.end137:                                        ; preds = %if.then134, %if.then132
  %120 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %tobool138 = icmp ne %struct._IO_FILE* %120, null
  br i1 %tobool138, label %if.then139, label %if.end142

if.then139:                                       ; preds = %if.end137
  %121 = load %struct._IO_FILE*, %struct._IO_FILE** %structfile.addr, align 4
  %122 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies140 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %122, i32 0, i32 5
  %123 = load %struct.ARRAY*, %struct.ARRAY** %dependencies140, align 4
  %array141 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %123, i32 0, i32 4
  %124 = load i8**, i8*** %array141, align 4
  call void @write_endifs(%struct._IO_FILE* %121, i8** %124)
  br label %if.end142

if.end142:                                        ; preds = %if.then139, %if.end137
  br label %if.end143

if.end143:                                        ; preds = %if.end142, %if.end129
  br label %if.end144

if.end144:                                        ; preds = %if.end143, %for.body
  %125 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %tobool145 = icmp ne %struct._IO_FILE* %125, null
  br i1 %tobool145, label %if.then146, label %if.end150

if.then146:                                       ; preds = %if.end144
  %126 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %127 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name147 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %127, i32 0, i32 0
  %128 = load i8*, i8** %name147, align 4
  %call148 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %126, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.136, i32 0, i32 0), i8* %128)
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @documentation_file, align 4
  %130 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %130, i32 0, i32 4
  %131 = load %struct.ARRAY*, %struct.ARRAY** %longdoc, align 4
  %array149 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %131, i32 0, i32 4
  %132 = load i8**, i8*** %array149, align 4
  call void @write_documentation(%struct._IO_FILE* %129, i8** %132, i32 0, i32 2)
  br label %if.end150

if.end150:                                        ; preds = %if.then146, %if.end144
  br label %for.inc

for.inc:                                          ; preds = %if.end150
  %133 = load i32, i32* %i, align 4
  %inc = add nsw i32 %133, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end151

if.end151:                                        ; preds = %for.end, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @write_longdocs(%struct._IO_FILE* %stream, %struct.ARRAY* %builtins) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %builtins.addr = alloca %struct.ARRAY*, align 4
  %i = alloca i32, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  %dname = alloca i8*, align 4
  %sarray = alloca [2 x i8*], align 4
  %l = alloca i32, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  store %struct.ARRAY* %builtins, %struct.ARRAY** %builtins.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load %struct.ARRAY*, %struct.ARRAY** %builtins.addr, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %1, i32 0, i32 1
  %2 = load i32, i32* %sindex, align 4
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.ARRAY*, %struct.ARRAY** %builtins.addr, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %3, i32 0, i32 4
  %4 = load i8**, i8*** %array, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %4, i32 %5
  %6 = load i8*, i8** %arrayidx, align 4
  %7 = bitcast i8* %6 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %7, %struct.BUILTIN_DESC** %builtin, align 4
  %8 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %8, i32 0, i32 5
  %9 = load %struct.ARRAY*, %struct.ARRAY** %dependencies, align 4
  %tobool = icmp ne %struct.ARRAY* %9, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %11 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies1 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %11, i32 0, i32 5
  %12 = load %struct.ARRAY*, %struct.ARRAY** %dependencies1, align 4
  %array2 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %12, i32 0, i32 4
  %13 = load i8**, i8*** %array2, align 4
  call void @write_ifdefs(%struct._IO_FILE* %10, i8** %13)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %14 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %14, i32 0, i32 3
  %15 = load i8*, i8** %docname, align 4
  %tobool3 = icmp ne i8* %15, null
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %16 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname4 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %16, i32 0, i32 3
  %17 = load i8*, i8** %docname4, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %18 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %18, i32 0, i32 0
  %19 = load i8*, i8** %name, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %17, %cond.true ], [ %19, %cond.false ]
  store i8* %cond, i8** %dname, align 4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %21 = load i8*, i8** %dname, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.137, i32 0, i32 0), i8* %21)
  %22 = load i32, i32* @separate_helpfiles, align 4
  %tobool5 = icmp ne i32 %22, 0
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %cond.end
  %23 = load i8*, i8** @helpfile_directory, align 4
  %call7 = call i32 @strlen(i8* %23)
  %24 = load i8*, i8** %dname, align 4
  %call8 = call i32 @strlen(i8* %24)
  %add = add i32 %call7, %call8
  %add9 = add i32 %add, 1
  store i32 %add9, i32* %l, align 4
  %25 = load i32, i32* %l, align 4
  %add10 = add nsw i32 %25, 1
  %call11 = call i8* @xmalloc(i32 %add10)
  %arrayidx12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %sarray, i32 0, i32 0
  store i8* %call11, i8** %arrayidx12, align 4
  %arrayidx13 = getelementptr inbounds [2 x i8*], [2 x i8*]* %sarray, i32 0, i32 0
  %26 = load i8*, i8** %arrayidx13, align 4
  %27 = load i8*, i8** @helpfile_directory, align 4
  %28 = load i8*, i8** %dname, align 4
  %call14 = call i32 (i8*, i8*, ...) @sprintf(i8* %26, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.138, i32 0, i32 0), i8* %27, i8* %28)
  %arrayidx15 = getelementptr inbounds [2 x i8*], [2 x i8*]* %sarray, i32 0, i32 1
  store i8* null, i8** %arrayidx15, align 4
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %arraydecay = getelementptr inbounds [2 x i8*], [2 x i8*]* %sarray, i32 0, i32 0
  call void @write_documentation(%struct._IO_FILE* %29, i8** %arraydecay, i32 0, i32 9)
  %arrayidx16 = getelementptr inbounds [2 x i8*], [2 x i8*]* %sarray, i32 0, i32 0
  %30 = load i8*, i8** %arrayidx16, align 4
  call void @free(i8* %30)
  br label %if.end18

if.else:                                          ; preds = %cond.end
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %32 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %32, i32 0, i32 4
  %33 = load %struct.ARRAY*, %struct.ARRAY** %longdoc, align 4
  %array17 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %33, i32 0, i32 4
  %34 = load i8**, i8*** %array17, align 4
  call void @write_documentation(%struct._IO_FILE* %31, i8** %34, i32 0, i32 1)
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then6
  %35 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies19 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %35, i32 0, i32 5
  %36 = load %struct.ARRAY*, %struct.ARRAY** %dependencies19, align 4
  %tobool20 = icmp ne %struct.ARRAY* %36, null
  br i1 %tobool20, label %if.then21, label %if.end24

if.then21:                                        ; preds = %if.end18
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %38 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %dependencies22 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %38, i32 0, i32 5
  %39 = load %struct.ARRAY*, %struct.ARRAY** %dependencies22, align 4
  %array23 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %39, i32 0, i32 4
  %40 = load i8**, i8*** %array23, align 4
  call void @write_endifs(%struct._IO_FILE* %37, i8** %40)
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %if.end18
  br label %for.inc

for.inc:                                          ; preds = %if.end24
  %41 = load i32, i32* %i, align 4
  %inc = add nsw i32 %41, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @write_dummy_declarations(%struct._IO_FILE* %stream, %struct.ARRAY* %builtins) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %builtins.addr = alloca %struct.ARRAY*, align 4
  %i = alloca i32, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  store %struct.ARRAY* %builtins, %struct.ARRAY** %builtins.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [39 x i8*], [39 x i8*]* @structfile_header, i32 0, i32 %0
  %1 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [39 x i8*], [39 x i8*]* @structfile_header, i32 0, i32 %3
  %4 = load i8*, i8** %arrayidx1, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i32 0, i32 0), i8* %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc6, %for.end
  %6 = load i32, i32* %i, align 4
  %7 = load %struct.ARRAY*, %struct.ARRAY** %builtins.addr, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %7, i32 0, i32 1
  %8 = load i32, i32* %sindex, align 4
  %cmp = icmp slt i32 %6, %8
  br i1 %cmp, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond2
  %9 = load %struct.ARRAY*, %struct.ARRAY** %builtins.addr, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %9, i32 0, i32 4
  %10 = load i8**, i8*** %array, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx4, align 4
  %13 = bitcast i8* %12 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %13, %struct.BUILTIN_DESC** %builtin, align 4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %15 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %function = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %15, i32 0, i32 1
  %16 = load i8*, i8** %function, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.139, i32 0, i32 0), i8* %16)
  br label %for.inc6

for.inc6:                                         ; preds = %for.body3
  %17 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %17, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond2

for.end8:                                         ; preds = %for.cond2
  ret void
}

; Function Attrs: noinline nounwind
define void @write_ifdefs(%struct._IO_FILE* %stream, i8** %defines) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %defines.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  %def = alloca i8*, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  store i8** %defines, i8*** %defines.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.140, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i8**, i8*** %defines.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %tobool1 = icmp ne i8* %4, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8**, i8*** %defines.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx2, align 4
  store i8* %7, i8** %def, align 4
  %8 = load i8*, i8** %def, align 4
  %9 = load i8, i8* %8, align 1
  %conv = sext i8 %9 to i32
  %cmp = icmp eq i32 %conv, 33
  br i1 %cmp, label %if.then4, label %if.else

if.then4:                                         ; preds = %for.body
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %11 = load i8*, i8** %def, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 1
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.141, i32 0, i32 0), i8* %add.ptr)
  br label %if.end7

if.else:                                          ; preds = %for.body
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %13 = load i8*, i8** %def, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.142, i32 0, i32 0), i8* %13)
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then4
  %14 = load i8**, i8*** %defines.addr, align 4
  %15 = load i32, i32* %i, align 4
  %add = add nsw i32 %15, 1
  %arrayidx8 = getelementptr inbounds i8*, i8** %14, i32 %add
  %16 = load i8*, i8** %arrayidx8, align 4
  %tobool9 = icmp ne i8* %16, null
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.143, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end7
  br label %for.inc

for.inc:                                          ; preds = %if.end12
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.80, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @write_endifs(%struct._IO_FILE* %stream, i8** %defines) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %defines.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  store i8** %defines, i8*** %defines.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.144, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i8**, i8*** %defines.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %tobool1 = icmp ne i8* %4, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %6 = load i8**, i8*** %defines.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx2, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.78, i32 0, i32 0), i8* %8)
  %9 = load i8**, i8*** %defines.addr, align 4
  %10 = load i32, i32* %i, align 4
  %add = add nsw i32 %10, 1
  %arrayidx4 = getelementptr inbounds i8*, i8** %9, i32 %add
  %11 = load i8*, i8** %arrayidx4, align 4
  %tobool5 = icmp ne i8* %11, null
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %for.body
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.143, i32 0, i32 0))
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.145, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @write_documentation(%struct._IO_FILE* %stream, i8** %documentation, i32 %indentation, i32 %flags) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %documentation.addr = alloca i8**, align 4
  %indentation.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %line = alloca i8*, align 4
  %string_array = alloca i32, align 4
  %texinfo = alloca i32, align 4
  %base_indent = alloca i32, align 4
  %filename_p = alloca i32, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  store i8** %documentation, i8*** %documentation.addr, align 4
  store i32 %indentation, i32* %indentation.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end158

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %flags.addr, align 4
  %and = and i32 %1, 1
  store i32 %and, i32* %string_array, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %and1 = and i32 %2, 8
  store i32 %and1, i32* %filename_p, align 4
  %3 = load i32, i32* %string_array, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then2, label %if.end21

if.then2:                                         ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.146, i32 0, i32 0))
  %5 = load i32, i32* @single_longdoc_strings, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then4, label %if.end20

if.then4:                                         ; preds = %if.then2
  %6 = load i32, i32* %filename_p, align 4
  %cmp5 = icmp eq i32 %6, 0
  br i1 %cmp5, label %if.then6, label %if.else17

if.then6:                                         ; preds = %if.then4
  %7 = load i8**, i8*** %documentation.addr, align 4
  %tobool7 = icmp ne i8** %7, null
  br i1 %tobool7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then6
  %8 = load i8**, i8*** %documentation.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %8, i32 0
  %9 = load i8*, i8** %arrayidx, align 4
  %tobool8 = icmp ne i8* %9, null
  br i1 %tobool8, label %land.lhs.true9, label %if.else

land.lhs.true9:                                   ; preds = %land.lhs.true
  %10 = load i8**, i8*** %documentation.addr, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %10, i32 0
  %11 = load i8*, i8** %arrayidx10, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx11, align 1
  %conv = sext i8 %12 to i32
  %tobool12 = icmp ne i32 %conv, 0
  br i1 %tobool12, label %if.then13, label %if.else

if.then13:                                        ; preds = %land.lhs.true9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.147, i32 0, i32 0))
  br label %if.end16

if.else:                                          ; preds = %land.lhs.true9, %land.lhs.true, %if.then6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.148, i32 0, i32 0))
  br label %if.end16

if.end16:                                         ; preds = %if.else, %if.then13
  br label %if.end19

if.else17:                                        ; preds = %if.then4
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.149, i32 0, i32 0))
  br label %if.end19

if.end19:                                         ; preds = %if.else17, %if.end16
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then2
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end
  %16 = load i32, i32* %string_array, align 4
  %tobool22 = icmp ne i32 %16, 0
  br i1 %tobool22, label %land.lhs.true23, label %land.end

land.lhs.true23:                                  ; preds = %if.end21
  %17 = load i32, i32* @single_longdoc_strings, align 4
  %tobool24 = icmp ne i32 %17, 0
  br i1 %tobool24, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true23
  %18 = load i32, i32* %filename_p, align 4
  %cmp25 = icmp eq i32 %18, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true23, %if.end21
  %19 = phi i1 [ false, %land.lhs.true23 ], [ false, %if.end21 ], [ %cmp25, %land.rhs ]
  %cond = select i1 %19, i32 4, i32 0
  store i32 %cond, i32* %base_indent, align 4
  store i32 0, i32* %i, align 4
  %20 = load i32, i32* %flags.addr, align 4
  %and27 = and i32 %20, 2
  store i32 %and27, i32* %texinfo, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc140, %land.end
  %21 = load i8**, i8*** %documentation.addr, align 4
  %tobool28 = icmp ne i8** %21, null
  br i1 %tobool28, label %land.rhs29, label %land.end32

land.rhs29:                                       ; preds = %for.cond
  %22 = load i8**, i8*** %documentation.addr, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx30, align 4
  store i8* %24, i8** %line, align 4
  %tobool31 = icmp ne i8* %24, null
  br label %land.end32

land.end32:                                       ; preds = %land.rhs29, %for.cond
  %25 = phi i1 [ false, %for.cond ], [ %tobool31, %land.rhs29 ]
  br i1 %25, label %for.body, label %for.end142

for.body:                                         ; preds = %land.end32
  %26 = load i8*, i8** %line, align 4
  %27 = load i8, i8* %26, align 1
  %conv33 = sext i8 %27 to i32
  %cmp34 = icmp eq i32 %conv33, 35
  br i1 %cmp34, label %if.then36, label %if.end47

if.then36:                                        ; preds = %for.body
  %28 = load i32, i32* %string_array, align 4
  %tobool37 = icmp ne i32 %28, 0
  br i1 %tobool37, label %land.lhs.true38, label %if.end46

land.lhs.true38:                                  ; preds = %if.then36
  %29 = load i32, i32* %filename_p, align 4
  %cmp39 = icmp eq i32 %29, 0
  br i1 %cmp39, label %land.lhs.true41, label %if.end46

land.lhs.true41:                                  ; preds = %land.lhs.true38
  %30 = load i32, i32* @single_longdoc_strings, align 4
  %cmp42 = icmp eq i32 %30, 0
  br i1 %cmp42, label %if.then44, label %if.end46

if.then44:                                        ; preds = %land.lhs.true41
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %32 = load i8*, i8** %line, align 4
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i32 0, i32 0), i8* %32)
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %land.lhs.true41, %land.lhs.true38, %if.then36
  br label %for.inc140

if.end47:                                         ; preds = %for.body
  %33 = load i32, i32* %string_array, align 4
  %tobool48 = icmp ne i32 %33, 0
  br i1 %tobool48, label %land.lhs.true49, label %if.end66

land.lhs.true49:                                  ; preds = %if.end47
  %34 = load i32, i32* @single_longdoc_strings, align 4
  %cmp50 = icmp eq i32 %34, 0
  br i1 %cmp50, label %if.then52, label %if.end66

if.then52:                                        ; preds = %land.lhs.true49
  %35 = load i32, i32* %filename_p, align 4
  %cmp53 = icmp eq i32 %35, 0
  br i1 %cmp53, label %if.then55, label %if.else63

if.then55:                                        ; preds = %if.then52
  %36 = load i8*, i8** %line, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx56, align 1
  %tobool57 = icmp ne i8 %37, 0
  br i1 %tobool57, label %if.then58, label %if.else60

if.then58:                                        ; preds = %if.then55
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call59 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %38, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.150, i32 0, i32 0))
  br label %if.end62

if.else60:                                        ; preds = %if.then55
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.151, i32 0, i32 0))
  br label %if.end62

if.end62:                                         ; preds = %if.else60, %if.then58
  br label %if.end65

if.else63:                                        ; preds = %if.then52
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.152, i32 0, i32 0))
  br label %if.end65

if.end65:                                         ; preds = %if.else63, %if.end62
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %land.lhs.true49, %if.end47
  %41 = load i32, i32* %indentation.addr, align 4
  %tobool67 = icmp ne i32 %41, 0
  br i1 %tobool67, label %if.then68, label %if.end74

if.then68:                                        ; preds = %if.end66
  store i32 0, i32* %j, align 4
  br label %for.cond69

for.cond69:                                       ; preds = %for.inc, %if.then68
  %42 = load i32, i32* %j, align 4
  %43 = load i32, i32* %indentation.addr, align 4
  %cmp70 = icmp slt i32 %42, %43
  br i1 %cmp70, label %for.body72, label %for.end

for.body72:                                       ; preds = %for.cond69
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call73 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.153, i32 0, i32 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body72
  %45 = load i32, i32* %j, align 4
  %inc = add nsw i32 %45, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond69

for.end:                                          ; preds = %for.cond69
  br label %if.end74

if.end74:                                         ; preds = %for.end, %if.end66
  %46 = load i32, i32* %i, align 4
  %cmp75 = icmp eq i32 %46, 0
  br i1 %cmp75, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end74
  %47 = load i32, i32* %base_indent, align 4
  %48 = load i32, i32* %indentation.addr, align 4
  %add = add nsw i32 %48, %47
  store i32 %add, i32* %indentation.addr, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %if.end74
  %49 = load i32, i32* %string_array, align 4
  %tobool79 = icmp ne i32 %49, 0
  br i1 %tobool79, label %if.then80, label %if.else114

if.then80:                                        ; preds = %if.end78
  store i32 0, i32* %j, align 4
  br label %for.cond81

for.cond81:                                       ; preds = %for.inc93, %if.then80
  %50 = load i8*, i8** %line, align 4
  %51 = load i32, i32* %j, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %50, i32 %51
  %52 = load i8, i8* %arrayidx82, align 1
  %tobool83 = icmp ne i8 %52, 0
  br i1 %tobool83, label %for.body84, label %for.end95

for.body84:                                       ; preds = %for.cond81
  %53 = load i8*, i8** %line, align 4
  %54 = load i32, i32* %j, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %53, i32 %54
  %55 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %55 to i32
  switch i32 %conv86, label %sw.default [
    i32 92, label %sw.bb
    i32 34, label %sw.bb
  ]

sw.bb:                                            ; preds = %for.body84, %for.body84
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %57 = load i8*, i8** %line, align 4
  %58 = load i32, i32* %j, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %57, i32 %58
  %59 = load i8, i8* %arrayidx87, align 1
  %conv88 = sext i8 %59 to i32
  %call89 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.154, i32 0, i32 0), i32 %conv88)
  br label %sw.epilog

sw.default:                                       ; preds = %for.body84
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %61 = load i8*, i8** %line, align 4
  %62 = load i32, i32* %j, align 4
  %arrayidx90 = getelementptr inbounds i8, i8* %61, i32 %62
  %63 = load i8, i8* %arrayidx90, align 1
  %conv91 = sext i8 %63 to i32
  %call92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.155, i32 0, i32 0), i32 %conv91)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  br label %for.inc93

for.inc93:                                        ; preds = %sw.epilog
  %64 = load i32, i32* %j, align 4
  %inc94 = add nsw i32 %64, 1
  store i32 %inc94, i32* %j, align 4
  br label %for.cond81

for.end95:                                        ; preds = %for.cond81
  %65 = load i32, i32* @single_longdoc_strings, align 4
  %cmp96 = icmp eq i32 %65, 0
  br i1 %cmp96, label %if.then98, label %if.else106

if.then98:                                        ; preds = %for.end95
  %66 = load i32, i32* %filename_p, align 4
  %cmp99 = icmp eq i32 %66, 0
  br i1 %cmp99, label %if.then101, label %if.else103

if.then101:                                       ; preds = %if.then98
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call102 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %67, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i32 0, i32 0))
  br label %if.end105

if.else103:                                       ; preds = %if.then98
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.157, i32 0, i32 0))
  br label %if.end105

if.end105:                                        ; preds = %if.else103, %if.then101
  br label %if.end113

if.else106:                                       ; preds = %for.end95
  %69 = load i8**, i8*** %documentation.addr, align 4
  %70 = load i32, i32* %i, align 4
  %add107 = add nsw i32 %70, 1
  %arrayidx108 = getelementptr inbounds i8*, i8** %69, i32 %add107
  %71 = load i8*, i8** %arrayidx108, align 4
  %tobool109 = icmp ne i8* %71, null
  br i1 %tobool109, label %if.then110, label %if.end112

if.then110:                                       ; preds = %if.else106
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call111 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %72, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.158, i32 0, i32 0))
  br label %if.end112

if.end112:                                        ; preds = %if.then110, %if.else106
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %if.end105
  br label %if.end139

if.else114:                                       ; preds = %if.end78
  %73 = load i32, i32* %texinfo, align 4
  %tobool115 = icmp ne i32 %73, 0
  br i1 %tobool115, label %if.then116, label %if.else136

if.then116:                                       ; preds = %if.else114
  store i32 0, i32* %j, align 4
  br label %for.cond117

for.cond117:                                      ; preds = %for.inc132, %if.then116
  %74 = load i8*, i8** %line, align 4
  %75 = load i32, i32* %j, align 4
  %arrayidx118 = getelementptr inbounds i8, i8* %74, i32 %75
  %76 = load i8, i8* %arrayidx118, align 1
  %tobool119 = icmp ne i8 %76, 0
  br i1 %tobool119, label %for.body120, label %for.end134

for.body120:                                      ; preds = %for.cond117
  %77 = load i8*, i8** %line, align 4
  %78 = load i32, i32* %j, align 4
  %arrayidx121 = getelementptr inbounds i8, i8* %77, i32 %78
  %79 = load i8, i8* %arrayidx121, align 1
  %conv122 = sext i8 %79 to i32
  switch i32 %conv122, label %sw.default127 [
    i32 64, label %sw.bb123
    i32 123, label %sw.bb123
    i32 125, label %sw.bb123
  ]

sw.bb123:                                         ; preds = %for.body120, %for.body120, %for.body120
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %81 = load i8*, i8** %line, align 4
  %82 = load i32, i32* %j, align 4
  %arrayidx124 = getelementptr inbounds i8, i8* %81, i32 %82
  %83 = load i8, i8* %arrayidx124, align 1
  %conv125 = sext i8 %83 to i32
  %call126 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %80, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.159, i32 0, i32 0), i32 %conv125)
  br label %sw.epilog131

sw.default127:                                    ; preds = %for.body120
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %85 = load i8*, i8** %line, align 4
  %86 = load i32, i32* %j, align 4
  %arrayidx128 = getelementptr inbounds i8, i8* %85, i32 %86
  %87 = load i8, i8* %arrayidx128, align 1
  %conv129 = sext i8 %87 to i32
  %call130 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.155, i32 0, i32 0), i32 %conv129)
  br label %sw.epilog131

sw.epilog131:                                     ; preds = %sw.default127, %sw.bb123
  br label %for.inc132

for.inc132:                                       ; preds = %sw.epilog131
  %88 = load i32, i32* %j, align 4
  %inc133 = add nsw i32 %88, 1
  store i32 %inc133, i32* %j, align 4
  br label %for.cond117

for.end134:                                       ; preds = %for.cond117
  %89 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call135 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %89, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.80, i32 0, i32 0))
  br label %if.end138

if.else136:                                       ; preds = %if.else114
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %91 = load i8*, i8** %line, align 4
  %call137 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %90, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.67, i32 0, i32 0), i8* %91)
  br label %if.end138

if.end138:                                        ; preds = %if.else136, %for.end134
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.end113
  br label %for.inc140

for.inc140:                                       ; preds = %if.end139, %if.end46
  %92 = load i32, i32* %i, align 4
  %inc141 = add nsw i32 %92, 1
  store i32 %inc141, i32* %i, align 4
  br label %for.cond

for.end142:                                       ; preds = %land.end32
  %93 = load i32, i32* %string_array, align 4
  %tobool143 = icmp ne i32 %93, 0
  br i1 %tobool143, label %land.lhs.true144, label %if.end154

land.lhs.true144:                                 ; preds = %for.end142
  %94 = load i32, i32* @single_longdoc_strings, align 4
  %tobool145 = icmp ne i32 %94, 0
  br i1 %tobool145, label %if.then146, label %if.end154

if.then146:                                       ; preds = %land.lhs.true144
  %95 = load i32, i32* %filename_p, align 4
  %cmp147 = icmp eq i32 %95, 0
  br i1 %cmp147, label %if.then149, label %if.else151

if.then149:                                       ; preds = %if.then146
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call150 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %96, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i32 0, i32 0))
  br label %if.end153

if.else151:                                       ; preds = %if.then146
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call152 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.157, i32 0, i32 0))
  br label %if.end153

if.end153:                                        ; preds = %if.else151, %if.then149
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %land.lhs.true144, %for.end142
  %98 = load i32, i32* %string_array, align 4
  %tobool155 = icmp ne i32 %98, 0
  br i1 %tobool155, label %if.then156, label %if.end158

if.then156:                                       ; preds = %if.end154
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call157 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %99, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.160, i32 0, i32 0))
  br label %if.end158

if.end158:                                        ; preds = %if.then, %if.then156, %if.end154
  ret void
}

; Function Attrs: noinline nounwind
define i32 @write_helpfiles(%struct.ARRAY* %builtins) #0 {
entry:
  %retval = alloca i32, align 4
  %builtins.addr = alloca %struct.ARRAY*, align 4
  %helpfile = alloca i8*, align 4
  %bname = alloca i8*, align 4
  %helpfp = alloca %struct._IO_FILE*, align 4
  %i = alloca i32, align 4
  %hdlen = alloca i32, align 4
  %builtin = alloca %struct.BUILTIN_DESC*, align 4
  store %struct.ARRAY* %builtins, %struct.ARRAY** %builtins.addr, align 4
  %call = call i32 @mkdir(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.161, i32 0, i32 0), i32 511)
  store i32 %call, i32* %i, align 4
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %call1 = call i32* @__errno_location()
  %1 = load i32, i32* %call1, align 4
  %cmp2 = icmp ne i32 %1, 17
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.162, i32 0, i32 0))
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  store i32 10, i32* %hdlen, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.ARRAY*, %struct.ARRAY** %builtins.addr, align 4
  %sindex = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %4, i32 0, i32 1
  %5 = load i32, i32* %sindex, align 4
  %cmp4 = icmp slt i32 %3, %5
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.ARRAY*, %struct.ARRAY** %builtins.addr, align 4
  %array = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %6, i32 0, i32 4
  %7 = load i8**, i8*** %array, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %7, i32 %8
  %9 = load i8*, i8** %arrayidx, align 4
  %10 = bitcast i8* %9 to %struct.BUILTIN_DESC*
  store %struct.BUILTIN_DESC* %10, %struct.BUILTIN_DESC** %builtin, align 4
  %11 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %11, i32 0, i32 3
  %12 = load i8*, i8** %docname, align 4
  %tobool = icmp ne i8* %12, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %13 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %docname5 = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %13, i32 0, i32 3
  %14 = load i8*, i8** %docname5, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %15 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %name = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %15, i32 0, i32 0
  %16 = load i8*, i8** %name, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %14, %cond.true ], [ %16, %cond.false ]
  store i8* %cond, i8** %bname, align 4
  %17 = load i32, i32* %hdlen, align 4
  %18 = load i8*, i8** %bname, align 4
  %call6 = call i32 @strlen(i8* %18)
  %add = add i32 %17, %call6
  %add7 = add i32 %add, 1
  %call8 = call i8* @xmalloc(i32 %add7)
  store i8* %call8, i8** %helpfile, align 4
  %19 = load i8*, i8** %helpfile, align 4
  %20 = load i8*, i8** %bname, align 4
  %call9 = call i32 (i8*, i8*, ...) @sprintf(i8* %19, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.163, i32 0, i32 0), i8* %20)
  %21 = load i8*, i8** %helpfile, align 4
  %call10 = call %struct._IO_FILE* @fopen(i8* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0))
  store %struct._IO_FILE* %call10, %struct._IO_FILE** %helpfp, align 4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %helpfp, align 4
  %cmp11 = icmp eq %struct._IO_FILE* %22, null
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %cond.end
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %24 = load i8*, i8** %helpfile, align 4
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.164, i32 0, i32 0), i8* %24)
  %25 = load i8*, i8** %helpfile, align 4
  call void @free(i8* %25)
  br label %for.inc

if.end14:                                         ; preds = %cond.end
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %helpfp, align 4
  %27 = load %struct.BUILTIN_DESC*, %struct.BUILTIN_DESC** %builtin, align 4
  %longdoc = getelementptr inbounds %struct.BUILTIN_DESC, %struct.BUILTIN_DESC* %27, i32 0, i32 4
  %28 = load %struct.ARRAY*, %struct.ARRAY** %longdoc, align 4
  %array15 = getelementptr inbounds %struct.ARRAY, %struct.ARRAY* %28, i32 0, i32 4
  %29 = load i8**, i8*** %array15, align 4
  call void @write_documentation(%struct._IO_FILE* %26, i8** %29, i32 4, i32 4)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %helpfp, align 4
  %call16 = call i32 @fflush(%struct._IO_FILE* %30)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %helpfp, align 4
  %call17 = call i32 @fclose(%struct._IO_FILE* %31)
  %32 = load i8*, i8** %helpfile, align 4
  call void @free(i8* %32)
  br label %for.inc

for.inc:                                          ; preds = %if.end14, %if.then12
  %33 = load i32, i32* %i, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %34 = load i32, i32* %retval, align 4
  ret i32 %34
}

declare i32 @mkdir(i8*, i32) #1

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define internal i8* @xmalloc(i32 %bytes) #0 {
entry:
  %bytes.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  %0 = load i32, i32* %bytes.addr, align 4
  %call = call i8* @malloc(i32 %0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @memory_error_and_abort()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %temp, align 4
  ret i8* %2
}

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define internal void @memory_error_and_abort() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.165, i32 0, i32 0))
  call void @abort() #3
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noinline nounwind
define internal i8* @xrealloc(i8* %pointer, i32 %bytes) #0 {
entry:
  %pointer.addr = alloca i8*, align 4
  %bytes.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i8* %pointer, i8** %pointer.addr, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  %0 = load i8*, i8** %pointer.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %bytes.addr, align 4
  %call = call i8* @malloc(i32 %1)
  store i8* %call, i8** %temp, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %pointer.addr, align 4
  %3 = load i32, i32* %bytes.addr, align 4
  %call1 = call i8* @realloc(i8* %2, i32 %3)
  store i8* %call1, i8** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i8*, i8** %temp, align 4
  %tobool2 = icmp ne i8* %4, null
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @memory_error_and_abort()
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i8*, i8** %temp, align 4
  ret i8* %5
}

declare i8* @realloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @is_special_builtin(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @_find_in_table(i8* %0, i8** getelementptr inbounds ([17 x i8*], [17 x i8*]* @special_builtins, i32 0, i32 0))
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @_find_in_table(i8* %name, i8** %name_table) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %name_table.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8** %name_table, i8*** %name_table.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8**, i8*** %name_table.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i8**, i8*** %name_table.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 %5
  %6 = load i8*, i8** %arrayidx1, align 4
  %call = call i32 @strcmp(i8* %3, i8* %6)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @is_assignment_builtin(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @_find_in_table(i8* %0, i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @assignment_builtins, i32 0, i32 0))
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @is_localvar_builtin(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @_find_in_table(i8* %0, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @localvar_builtins, i32 0, i32 0))
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @is_posix_builtin(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @_find_in_table(i8* %0, i8** getelementptr inbounds ([18 x i8*], [18 x i8*]* @posix_builtins, i32 0, i32 0))
  ret i32 %call
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
