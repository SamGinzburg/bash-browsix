; ModuleID = 'smatch.c'
source_filename = "smatch.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._collsym = type { i8*, i8 }
%struct._collwcsym = type { i32*, i32 }
%struct.__mbstate_t = type { i32, i32 }

@glob_asciirange = global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"smatch.c\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"?*+@!\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"./sm_loop.c\00", align 1
@cclass_name = internal constant [15 x i8*] [i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0)], align 4
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"ascii\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"alnum\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"alpha\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"blank\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"cntrl\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"digit\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"graph\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"lower\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"print\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"punct\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"space\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"upper\00", align 1
@.str.16 = private unnamed_addr constant [5 x i8] c"word\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"xdigit\00", align 1
@posix_collsyms = internal global [96 x %struct._collsym] [%struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8 0 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i8 1 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8 2 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.21, i32 0, i32 0), i8 3 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8 4 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i8 5 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i32 0, i32 0), i8 6 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.25, i32 0, i32 0), i8 7 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i8 8 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.27, i32 0, i32 0), i8 8 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8 9 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.29, i32 0, i32 0), i8 9 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.30, i32 0, i32 0), i8 10 }, %struct._collsym { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.31, i32 0, i32 0), i8 10 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0), i8 11 }, %struct._collsym { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.33, i32 0, i32 0), i8 11 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0), i8 12 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i32 0, i32 0), i8 12 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8 13 }, %struct._collsym { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.37, i32 0, i32 0), i8 13 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8 14 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.39, i32 0, i32 0), i8 15 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.40, i32 0, i32 0), i8 16 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.41, i32 0, i32 0), i8 17 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.42, i32 0, i32 0), i8 18 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.43, i32 0, i32 0), i8 19 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.44, i32 0, i32 0), i8 20 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.45, i32 0, i32 0), i8 21 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.46, i32 0, i32 0), i8 22 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.47, i32 0, i32 0), i8 23 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8 24 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i32 0, i32 0), i8 25 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.50, i32 0, i32 0), i8 26 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i32 0, i32 0), i8 27 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.52, i32 0, i32 0), i8 28 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.53, i32 0, i32 0), i8 28 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.54, i32 0, i32 0), i8 29 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0), i8 29 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.56, i32 0, i32 0), i8 30 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.57, i32 0, i32 0), i8 30 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.58, i32 0, i32 0), i8 31 }, %struct._collsym { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.59, i32 0, i32 0), i8 31 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), i8 32 }, %struct._collsym { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.60, i32 0, i32 0), i8 33 }, %struct._collsym { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.61, i32 0, i32 0), i8 34 }, %struct._collsym { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.62, i32 0, i32 0), i8 35 }, %struct._collsym { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.63, i32 0, i32 0), i8 36 }, %struct._collsym { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.64, i32 0, i32 0), i8 37 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.65, i32 0, i32 0), i8 38 }, %struct._collsym { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.66, i32 0, i32 0), i8 39 }, %struct._collsym { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.67, i32 0, i32 0), i8 40 }, %struct._collsym { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.68, i32 0, i32 0), i8 41 }, %struct._collsym { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.69, i32 0, i32 0), i8 42 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.70, i32 0, i32 0), i8 43 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.71, i32 0, i32 0), i8 44 }, %struct._collsym { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i8 45 }, %struct._collsym { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.73, i32 0, i32 0), i8 45 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.74, i32 0, i32 0), i8 45 }, %struct._collsym { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.75, i32 0, i32 0), i8 45 }, %struct._collsym { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.76, i32 0, i32 0), i8 46 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.77, i32 0, i32 0), i8 46 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.78, i32 0, i32 0), i8 47 }, %struct._collsym { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.79, i32 0, i32 0), i8 47 }, %struct._collsym { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.80, i32 0, i32 0), i8 48 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.81, i32 0, i32 0), i8 49 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.82, i32 0, i32 0), i8 50 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.83, i32 0, i32 0), i8 51 }, %struct._collsym { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.84, i32 0, i32 0), i8 52 }, %struct._collsym { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.85, i32 0, i32 0), i8 53 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.86, i32 0, i32 0), i8 54 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.87, i32 0, i32 0), i8 55 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.88, i32 0, i32 0), i8 56 }, %struct._collsym { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.89, i32 0, i32 0), i8 57 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.90, i32 0, i32 0), i8 58 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.91, i32 0, i32 0), i8 59 }, %struct._collsym { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.92, i32 0, i32 0), i8 60 }, %struct._collsym { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.93, i32 0, i32 0), i8 61 }, %struct._collsym { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.94, i32 0, i32 0), i8 62 }, %struct._collsym { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.95, i32 0, i32 0), i8 63 }, %struct._collsym { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.96, i32 0, i32 0), i8 64 }, %struct._collsym { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.97, i32 0, i32 0), i8 91 }, %struct._collsym { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.98, i32 0, i32 0), i8 92 }, %struct._collsym { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.99, i32 0, i32 0), i8 92 }, %struct._collsym { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.100, i32 0, i32 0), i8 93 }, %struct._collsym { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.101, i32 0, i32 0), i8 94 }, %struct._collsym { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.102, i32 0, i32 0), i8 94 }, %struct._collsym { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.103, i32 0, i32 0), i8 95 }, %struct._collsym { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.104, i32 0, i32 0), i8 96 }, %struct._collsym { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.105, i32 0, i32 0), i8 123 }, %struct._collsym { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.106, i32 0, i32 0), i8 123 }, %struct._collsym { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.107, i32 0, i32 0), i8 124 }, %struct._collsym { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.108, i32 0, i32 0), i8 125 }, %struct._collsym { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.109, i32 0, i32 0), i8 125 }, %struct._collsym { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.110, i32 0, i32 0), i8 126 }, %struct._collsym { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.111, i32 0, i32 0), i8 127 }, %struct._collsym zeroinitializer], align 4
@.str.18 = private unnamed_addr constant [4 x i8] c"NUL\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"SOH\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"STX\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"ETX\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"EOT\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"ENQ\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"ACK\00", align 1
@.str.25 = private unnamed_addr constant [6 x i8] c"alert\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"BS\00", align 1
@.str.27 = private unnamed_addr constant [10 x i8] c"backspace\00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"HT\00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"tab\00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"LF\00", align 1
@.str.31 = private unnamed_addr constant [8 x i8] c"newline\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"VT\00", align 1
@.str.33 = private unnamed_addr constant [13 x i8] c"vertical-tab\00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"FF\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"form-feed\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"CR\00", align 1
@.str.37 = private unnamed_addr constant [16 x i8] c"carriage-return\00", align 1
@.str.38 = private unnamed_addr constant [3 x i8] c"SO\00", align 1
@.str.39 = private unnamed_addr constant [3 x i8] c"SI\00", align 1
@.str.40 = private unnamed_addr constant [4 x i8] c"DLE\00", align 1
@.str.41 = private unnamed_addr constant [4 x i8] c"DC1\00", align 1
@.str.42 = private unnamed_addr constant [4 x i8] c"DC2\00", align 1
@.str.43 = private unnamed_addr constant [4 x i8] c"DC3\00", align 1
@.str.44 = private unnamed_addr constant [4 x i8] c"DC4\00", align 1
@.str.45 = private unnamed_addr constant [4 x i8] c"NAK\00", align 1
@.str.46 = private unnamed_addr constant [4 x i8] c"SYN\00", align 1
@.str.47 = private unnamed_addr constant [4 x i8] c"ETB\00", align 1
@.str.48 = private unnamed_addr constant [4 x i8] c"CAN\00", align 1
@.str.49 = private unnamed_addr constant [3 x i8] c"EM\00", align 1
@.str.50 = private unnamed_addr constant [4 x i8] c"SUB\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"ESC\00", align 1
@.str.52 = private unnamed_addr constant [4 x i8] c"IS4\00", align 1
@.str.53 = private unnamed_addr constant [3 x i8] c"FS\00", align 1
@.str.54 = private unnamed_addr constant [4 x i8] c"IS3\00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c"GS\00", align 1
@.str.56 = private unnamed_addr constant [4 x i8] c"IS2\00", align 1
@.str.57 = private unnamed_addr constant [3 x i8] c"RS\00", align 1
@.str.58 = private unnamed_addr constant [4 x i8] c"IS1\00", align 1
@.str.59 = private unnamed_addr constant [3 x i8] c"US\00", align 1
@.str.60 = private unnamed_addr constant [17 x i8] c"exclamation-mark\00", align 1
@.str.61 = private unnamed_addr constant [15 x i8] c"quotation-mark\00", align 1
@.str.62 = private unnamed_addr constant [12 x i8] c"number-sign\00", align 1
@.str.63 = private unnamed_addr constant [12 x i8] c"dollar-sign\00", align 1
@.str.64 = private unnamed_addr constant [13 x i8] c"percent-sign\00", align 1
@.str.65 = private unnamed_addr constant [10 x i8] c"ampersand\00", align 1
@.str.66 = private unnamed_addr constant [11 x i8] c"apostrophe\00", align 1
@.str.67 = private unnamed_addr constant [17 x i8] c"left-parenthesis\00", align 1
@.str.68 = private unnamed_addr constant [18 x i8] c"right-parenthesis\00", align 1
@.str.69 = private unnamed_addr constant [9 x i8] c"asterisk\00", align 1
@.str.70 = private unnamed_addr constant [10 x i8] c"plus-sign\00", align 1
@.str.71 = private unnamed_addr constant [6 x i8] c"comma\00", align 1
@.str.72 = private unnamed_addr constant [7 x i8] c"hyphen\00", align 1
@.str.73 = private unnamed_addr constant [13 x i8] c"hyphen-minus\00", align 1
@.str.74 = private unnamed_addr constant [6 x i8] c"minus\00", align 1
@.str.75 = private unnamed_addr constant [5 x i8] c"dash\00", align 1
@.str.76 = private unnamed_addr constant [7 x i8] c"period\00", align 1
@.str.77 = private unnamed_addr constant [10 x i8] c"full-stop\00", align 1
@.str.78 = private unnamed_addr constant [6 x i8] c"slash\00", align 1
@.str.79 = private unnamed_addr constant [8 x i8] c"solidus\00", align 1
@.str.80 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.81 = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.82 = private unnamed_addr constant [4 x i8] c"two\00", align 1
@.str.83 = private unnamed_addr constant [6 x i8] c"three\00", align 1
@.str.84 = private unnamed_addr constant [5 x i8] c"four\00", align 1
@.str.85 = private unnamed_addr constant [5 x i8] c"five\00", align 1
@.str.86 = private unnamed_addr constant [4 x i8] c"six\00", align 1
@.str.87 = private unnamed_addr constant [6 x i8] c"seven\00", align 1
@.str.88 = private unnamed_addr constant [6 x i8] c"eight\00", align 1
@.str.89 = private unnamed_addr constant [5 x i8] c"nine\00", align 1
@.str.90 = private unnamed_addr constant [6 x i8] c"colon\00", align 1
@.str.91 = private unnamed_addr constant [10 x i8] c"semicolon\00", align 1
@.str.92 = private unnamed_addr constant [15 x i8] c"less-than-sign\00", align 1
@.str.93 = private unnamed_addr constant [12 x i8] c"equals-sign\00", align 1
@.str.94 = private unnamed_addr constant [18 x i8] c"greater-than-sign\00", align 1
@.str.95 = private unnamed_addr constant [14 x i8] c"question-mark\00", align 1
@.str.96 = private unnamed_addr constant [14 x i8] c"commercial-at\00", align 1
@.str.97 = private unnamed_addr constant [20 x i8] c"left-square-bracket\00", align 1
@.str.98 = private unnamed_addr constant [10 x i8] c"backslash\00", align 1
@.str.99 = private unnamed_addr constant [16 x i8] c"reverse-solidus\00", align 1
@.str.100 = private unnamed_addr constant [21 x i8] c"right-square-bracket\00", align 1
@.str.101 = private unnamed_addr constant [11 x i8] c"circumflex\00", align 1
@.str.102 = private unnamed_addr constant [18 x i8] c"circumflex-accent\00", align 1
@.str.103 = private unnamed_addr constant [11 x i8] c"underscore\00", align 1
@.str.104 = private unnamed_addr constant [13 x i8] c"grave-accent\00", align 1
@.str.105 = private unnamed_addr constant [11 x i8] c"left-brace\00", align 1
@.str.106 = private unnamed_addr constant [19 x i8] c"left-curly-bracket\00", align 1
@.str.107 = private unnamed_addr constant [14 x i8] c"vertical-line\00", align 1
@.str.108 = private unnamed_addr constant [12 x i8] c"right-brace\00", align 1
@.str.109 = private unnamed_addr constant [20 x i8] c"right-curly-bracket\00", align 1
@.str.110 = private unnamed_addr constant [6 x i8] c"tilde\00", align 1
@.str.111 = private unnamed_addr constant [4 x i8] c"DEL\00", align 1
@rangecmp.s1 = internal global [2 x i8] c" \00", align 1
@rangecmp.s2 = internal global [2 x i8] c" \00", align 1
@.str.112 = private unnamed_addr constant [6 x i32] [i32 63, i32 42, i32 43, i32 64, i32 33, i32 0], align 4
@.str.113 = private unnamed_addr constant [6 x i32] [i32 97, i32 115, i32 99, i32 105, i32 105, i32 0], align 4
@.str.114 = private unnamed_addr constant [5 x i32] [i32 119, i32 111, i32 114, i32 100, i32 0], align 4
@.str.115 = private unnamed_addr constant [6 x i32] [i32 97, i32 108, i32 110, i32 117, i32 109, i32 0], align 4
@posix_collwcsyms = internal global [96 x %struct._collwcsym] [%struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.116, i32 0, i32 0), i32 0 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.117, i32 0, i32 0), i32 1 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.118, i32 0, i32 0), i32 2 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.119, i32 0, i32 0), i32 3 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.120, i32 0, i32 0), i32 4 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.121, i32 0, i32 0), i32 5 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.122, i32 0, i32 0), i32 6 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.123, i32 0, i32 0), i32 7 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.124, i32 0, i32 0), i32 8 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.125, i32 0, i32 0), i32 8 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.126, i32 0, i32 0), i32 9 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.127, i32 0, i32 0), i32 9 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.128, i32 0, i32 0), i32 10 }, %struct._collwcsym { i32* getelementptr inbounds ([8 x i32], [8 x i32]* @.str.129, i32 0, i32 0), i32 10 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.130, i32 0, i32 0), i32 11 }, %struct._collwcsym { i32* getelementptr inbounds ([13 x i32], [13 x i32]* @.str.131, i32 0, i32 0), i32 11 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.132, i32 0, i32 0), i32 12 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.133, i32 0, i32 0), i32 12 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.134, i32 0, i32 0), i32 13 }, %struct._collwcsym { i32* getelementptr inbounds ([16 x i32], [16 x i32]* @.str.135, i32 0, i32 0), i32 13 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.136, i32 0, i32 0), i32 14 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.137, i32 0, i32 0), i32 15 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.138, i32 0, i32 0), i32 16 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.139, i32 0, i32 0), i32 17 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.140, i32 0, i32 0), i32 18 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.141, i32 0, i32 0), i32 19 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.142, i32 0, i32 0), i32 20 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.143, i32 0, i32 0), i32 21 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.144, i32 0, i32 0), i32 22 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.145, i32 0, i32 0), i32 23 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.146, i32 0, i32 0), i32 24 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.147, i32 0, i32 0), i32 25 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.148, i32 0, i32 0), i32 26 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.149, i32 0, i32 0), i32 27 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.150, i32 0, i32 0), i32 28 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.151, i32 0, i32 0), i32 28 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.152, i32 0, i32 0), i32 29 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.153, i32 0, i32 0), i32 29 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.154, i32 0, i32 0), i32 30 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.155, i32 0, i32 0), i32 30 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.156, i32 0, i32 0), i32 31 }, %struct._collwcsym { i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.157, i32 0, i32 0), i32 31 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.158, i32 0, i32 0), i32 32 }, %struct._collwcsym { i32* getelementptr inbounds ([17 x i32], [17 x i32]* @.str.159, i32 0, i32 0), i32 33 }, %struct._collwcsym { i32* getelementptr inbounds ([15 x i32], [15 x i32]* @.str.160, i32 0, i32 0), i32 34 }, %struct._collwcsym { i32* getelementptr inbounds ([12 x i32], [12 x i32]* @.str.161, i32 0, i32 0), i32 35 }, %struct._collwcsym { i32* getelementptr inbounds ([12 x i32], [12 x i32]* @.str.162, i32 0, i32 0), i32 36 }, %struct._collwcsym { i32* getelementptr inbounds ([13 x i32], [13 x i32]* @.str.163, i32 0, i32 0), i32 37 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.164, i32 0, i32 0), i32 38 }, %struct._collwcsym { i32* getelementptr inbounds ([11 x i32], [11 x i32]* @.str.165, i32 0, i32 0), i32 39 }, %struct._collwcsym { i32* getelementptr inbounds ([17 x i32], [17 x i32]* @.str.166, i32 0, i32 0), i32 40 }, %struct._collwcsym { i32* getelementptr inbounds ([18 x i32], [18 x i32]* @.str.167, i32 0, i32 0), i32 41 }, %struct._collwcsym { i32* getelementptr inbounds ([9 x i32], [9 x i32]* @.str.168, i32 0, i32 0), i32 42 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.169, i32 0, i32 0), i32 43 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.170, i32 0, i32 0), i32 44 }, %struct._collwcsym { i32* getelementptr inbounds ([7 x i32], [7 x i32]* @.str.171, i32 0, i32 0), i32 45 }, %struct._collwcsym { i32* getelementptr inbounds ([13 x i32], [13 x i32]* @.str.172, i32 0, i32 0), i32 45 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.173, i32 0, i32 0), i32 45 }, %struct._collwcsym { i32* getelementptr inbounds ([5 x i32], [5 x i32]* @.str.174, i32 0, i32 0), i32 45 }, %struct._collwcsym { i32* getelementptr inbounds ([7 x i32], [7 x i32]* @.str.175, i32 0, i32 0), i32 46 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.176, i32 0, i32 0), i32 46 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.177, i32 0, i32 0), i32 47 }, %struct._collwcsym { i32* getelementptr inbounds ([8 x i32], [8 x i32]* @.str.178, i32 0, i32 0), i32 47 }, %struct._collwcsym { i32* getelementptr inbounds ([5 x i32], [5 x i32]* @.str.179, i32 0, i32 0), i32 48 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.180, i32 0, i32 0), i32 49 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.181, i32 0, i32 0), i32 50 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.182, i32 0, i32 0), i32 51 }, %struct._collwcsym { i32* getelementptr inbounds ([5 x i32], [5 x i32]* @.str.183, i32 0, i32 0), i32 52 }, %struct._collwcsym { i32* getelementptr inbounds ([5 x i32], [5 x i32]* @.str.184, i32 0, i32 0), i32 53 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.185, i32 0, i32 0), i32 54 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.186, i32 0, i32 0), i32 55 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.187, i32 0, i32 0), i32 56 }, %struct._collwcsym { i32* getelementptr inbounds ([5 x i32], [5 x i32]* @.str.188, i32 0, i32 0), i32 57 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.189, i32 0, i32 0), i32 58 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.190, i32 0, i32 0), i32 59 }, %struct._collwcsym { i32* getelementptr inbounds ([15 x i32], [15 x i32]* @.str.191, i32 0, i32 0), i32 60 }, %struct._collwcsym { i32* getelementptr inbounds ([12 x i32], [12 x i32]* @.str.192, i32 0, i32 0), i32 61 }, %struct._collwcsym { i32* getelementptr inbounds ([18 x i32], [18 x i32]* @.str.193, i32 0, i32 0), i32 62 }, %struct._collwcsym { i32* getelementptr inbounds ([14 x i32], [14 x i32]* @.str.194, i32 0, i32 0), i32 63 }, %struct._collwcsym { i32* getelementptr inbounds ([14 x i32], [14 x i32]* @.str.195, i32 0, i32 0), i32 64 }, %struct._collwcsym { i32* getelementptr inbounds ([20 x i32], [20 x i32]* @.str.196, i32 0, i32 0), i32 91 }, %struct._collwcsym { i32* getelementptr inbounds ([10 x i32], [10 x i32]* @.str.197, i32 0, i32 0), i32 92 }, %struct._collwcsym { i32* getelementptr inbounds ([16 x i32], [16 x i32]* @.str.198, i32 0, i32 0), i32 92 }, %struct._collwcsym { i32* getelementptr inbounds ([21 x i32], [21 x i32]* @.str.199, i32 0, i32 0), i32 93 }, %struct._collwcsym { i32* getelementptr inbounds ([11 x i32], [11 x i32]* @.str.200, i32 0, i32 0), i32 94 }, %struct._collwcsym { i32* getelementptr inbounds ([18 x i32], [18 x i32]* @.str.201, i32 0, i32 0), i32 94 }, %struct._collwcsym { i32* getelementptr inbounds ([11 x i32], [11 x i32]* @.str.202, i32 0, i32 0), i32 95 }, %struct._collwcsym { i32* getelementptr inbounds ([13 x i32], [13 x i32]* @.str.203, i32 0, i32 0), i32 96 }, %struct._collwcsym { i32* getelementptr inbounds ([11 x i32], [11 x i32]* @.str.204, i32 0, i32 0), i32 123 }, %struct._collwcsym { i32* getelementptr inbounds ([19 x i32], [19 x i32]* @.str.205, i32 0, i32 0), i32 123 }, %struct._collwcsym { i32* getelementptr inbounds ([14 x i32], [14 x i32]* @.str.206, i32 0, i32 0), i32 124 }, %struct._collwcsym { i32* getelementptr inbounds ([12 x i32], [12 x i32]* @.str.207, i32 0, i32 0), i32 125 }, %struct._collwcsym { i32* getelementptr inbounds ([20 x i32], [20 x i32]* @.str.208, i32 0, i32 0), i32 125 }, %struct._collwcsym { i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.209, i32 0, i32 0), i32 126 }, %struct._collwcsym { i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.210, i32 0, i32 0), i32 127 }, %struct._collwcsym zeroinitializer], align 4
@.str.116 = private unnamed_addr constant [4 x i32] [i32 78, i32 85, i32 76, i32 0], align 4
@.str.117 = private unnamed_addr constant [4 x i32] [i32 83, i32 79, i32 72, i32 0], align 4
@.str.118 = private unnamed_addr constant [4 x i32] [i32 83, i32 84, i32 88, i32 0], align 4
@.str.119 = private unnamed_addr constant [4 x i32] [i32 69, i32 84, i32 88, i32 0], align 4
@.str.120 = private unnamed_addr constant [4 x i32] [i32 69, i32 79, i32 84, i32 0], align 4
@.str.121 = private unnamed_addr constant [4 x i32] [i32 69, i32 78, i32 81, i32 0], align 4
@.str.122 = private unnamed_addr constant [4 x i32] [i32 65, i32 67, i32 75, i32 0], align 4
@.str.123 = private unnamed_addr constant [6 x i32] [i32 97, i32 108, i32 101, i32 114, i32 116, i32 0], align 4
@.str.124 = private unnamed_addr constant [3 x i32] [i32 66, i32 83, i32 0], align 4
@.str.125 = private unnamed_addr constant [10 x i32] [i32 98, i32 97, i32 99, i32 107, i32 115, i32 112, i32 97, i32 99, i32 101, i32 0], align 4
@.str.126 = private unnamed_addr constant [3 x i32] [i32 72, i32 84, i32 0], align 4
@.str.127 = private unnamed_addr constant [4 x i32] [i32 116, i32 97, i32 98, i32 0], align 4
@.str.128 = private unnamed_addr constant [3 x i32] [i32 76, i32 70, i32 0], align 4
@.str.129 = private unnamed_addr constant [8 x i32] [i32 110, i32 101, i32 119, i32 108, i32 105, i32 110, i32 101, i32 0], align 4
@.str.130 = private unnamed_addr constant [3 x i32] [i32 86, i32 84, i32 0], align 4
@.str.131 = private unnamed_addr constant [13 x i32] [i32 118, i32 101, i32 114, i32 116, i32 105, i32 99, i32 97, i32 108, i32 45, i32 116, i32 97, i32 98, i32 0], align 4
@.str.132 = private unnamed_addr constant [3 x i32] [i32 70, i32 70, i32 0], align 4
@.str.133 = private unnamed_addr constant [10 x i32] [i32 102, i32 111, i32 114, i32 109, i32 45, i32 102, i32 101, i32 101, i32 100, i32 0], align 4
@.str.134 = private unnamed_addr constant [3 x i32] [i32 67, i32 82, i32 0], align 4
@.str.135 = private unnamed_addr constant [16 x i32] [i32 99, i32 97, i32 114, i32 114, i32 105, i32 97, i32 103, i32 101, i32 45, i32 114, i32 101, i32 116, i32 117, i32 114, i32 110, i32 0], align 4
@.str.136 = private unnamed_addr constant [3 x i32] [i32 83, i32 79, i32 0], align 4
@.str.137 = private unnamed_addr constant [3 x i32] [i32 83, i32 73, i32 0], align 4
@.str.138 = private unnamed_addr constant [4 x i32] [i32 68, i32 76, i32 69, i32 0], align 4
@.str.139 = private unnamed_addr constant [4 x i32] [i32 68, i32 67, i32 49, i32 0], align 4
@.str.140 = private unnamed_addr constant [4 x i32] [i32 68, i32 67, i32 50, i32 0], align 4
@.str.141 = private unnamed_addr constant [4 x i32] [i32 68, i32 67, i32 51, i32 0], align 4
@.str.142 = private unnamed_addr constant [4 x i32] [i32 68, i32 67, i32 52, i32 0], align 4
@.str.143 = private unnamed_addr constant [4 x i32] [i32 78, i32 65, i32 75, i32 0], align 4
@.str.144 = private unnamed_addr constant [4 x i32] [i32 83, i32 89, i32 78, i32 0], align 4
@.str.145 = private unnamed_addr constant [4 x i32] [i32 69, i32 84, i32 66, i32 0], align 4
@.str.146 = private unnamed_addr constant [4 x i32] [i32 67, i32 65, i32 78, i32 0], align 4
@.str.147 = private unnamed_addr constant [3 x i32] [i32 69, i32 77, i32 0], align 4
@.str.148 = private unnamed_addr constant [4 x i32] [i32 83, i32 85, i32 66, i32 0], align 4
@.str.149 = private unnamed_addr constant [4 x i32] [i32 69, i32 83, i32 67, i32 0], align 4
@.str.150 = private unnamed_addr constant [4 x i32] [i32 73, i32 83, i32 52, i32 0], align 4
@.str.151 = private unnamed_addr constant [3 x i32] [i32 70, i32 83, i32 0], align 4
@.str.152 = private unnamed_addr constant [4 x i32] [i32 73, i32 83, i32 51, i32 0], align 4
@.str.153 = private unnamed_addr constant [3 x i32] [i32 71, i32 83, i32 0], align 4
@.str.154 = private unnamed_addr constant [4 x i32] [i32 73, i32 83, i32 50, i32 0], align 4
@.str.155 = private unnamed_addr constant [3 x i32] [i32 82, i32 83, i32 0], align 4
@.str.156 = private unnamed_addr constant [4 x i32] [i32 73, i32 83, i32 49, i32 0], align 4
@.str.157 = private unnamed_addr constant [3 x i32] [i32 85, i32 83, i32 0], align 4
@.str.158 = private unnamed_addr constant [6 x i32] [i32 115, i32 112, i32 97, i32 99, i32 101, i32 0], align 4
@.str.159 = private unnamed_addr constant [17 x i32] [i32 101, i32 120, i32 99, i32 108, i32 97, i32 109, i32 97, i32 116, i32 105, i32 111, i32 110, i32 45, i32 109, i32 97, i32 114, i32 107, i32 0], align 4
@.str.160 = private unnamed_addr constant [15 x i32] [i32 113, i32 117, i32 111, i32 116, i32 97, i32 116, i32 105, i32 111, i32 110, i32 45, i32 109, i32 97, i32 114, i32 107, i32 0], align 4
@.str.161 = private unnamed_addr constant [12 x i32] [i32 110, i32 117, i32 109, i32 98, i32 101, i32 114, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.162 = private unnamed_addr constant [12 x i32] [i32 100, i32 111, i32 108, i32 108, i32 97, i32 114, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.163 = private unnamed_addr constant [13 x i32] [i32 112, i32 101, i32 114, i32 99, i32 101, i32 110, i32 116, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.164 = private unnamed_addr constant [10 x i32] [i32 97, i32 109, i32 112, i32 101, i32 114, i32 115, i32 97, i32 110, i32 100, i32 0], align 4
@.str.165 = private unnamed_addr constant [11 x i32] [i32 97, i32 112, i32 111, i32 115, i32 116, i32 114, i32 111, i32 112, i32 104, i32 101, i32 0], align 4
@.str.166 = private unnamed_addr constant [17 x i32] [i32 108, i32 101, i32 102, i32 116, i32 45, i32 112, i32 97, i32 114, i32 101, i32 110, i32 116, i32 104, i32 101, i32 115, i32 105, i32 115, i32 0], align 4
@.str.167 = private unnamed_addr constant [18 x i32] [i32 114, i32 105, i32 103, i32 104, i32 116, i32 45, i32 112, i32 97, i32 114, i32 101, i32 110, i32 116, i32 104, i32 101, i32 115, i32 105, i32 115, i32 0], align 4
@.str.168 = private unnamed_addr constant [9 x i32] [i32 97, i32 115, i32 116, i32 101, i32 114, i32 105, i32 115, i32 107, i32 0], align 4
@.str.169 = private unnamed_addr constant [10 x i32] [i32 112, i32 108, i32 117, i32 115, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.170 = private unnamed_addr constant [6 x i32] [i32 99, i32 111, i32 109, i32 109, i32 97, i32 0], align 4
@.str.171 = private unnamed_addr constant [7 x i32] [i32 104, i32 121, i32 112, i32 104, i32 101, i32 110, i32 0], align 4
@.str.172 = private unnamed_addr constant [13 x i32] [i32 104, i32 121, i32 112, i32 104, i32 101, i32 110, i32 45, i32 109, i32 105, i32 110, i32 117, i32 115, i32 0], align 4
@.str.173 = private unnamed_addr constant [6 x i32] [i32 109, i32 105, i32 110, i32 117, i32 115, i32 0], align 4
@.str.174 = private unnamed_addr constant [5 x i32] [i32 100, i32 97, i32 115, i32 104, i32 0], align 4
@.str.175 = private unnamed_addr constant [7 x i32] [i32 112, i32 101, i32 114, i32 105, i32 111, i32 100, i32 0], align 4
@.str.176 = private unnamed_addr constant [10 x i32] [i32 102, i32 117, i32 108, i32 108, i32 45, i32 115, i32 116, i32 111, i32 112, i32 0], align 4
@.str.177 = private unnamed_addr constant [6 x i32] [i32 115, i32 108, i32 97, i32 115, i32 104, i32 0], align 4
@.str.178 = private unnamed_addr constant [8 x i32] [i32 115, i32 111, i32 108, i32 105, i32 100, i32 117, i32 115, i32 0], align 4
@.str.179 = private unnamed_addr constant [5 x i32] [i32 122, i32 101, i32 114, i32 111, i32 0], align 4
@.str.180 = private unnamed_addr constant [4 x i32] [i32 111, i32 110, i32 101, i32 0], align 4
@.str.181 = private unnamed_addr constant [4 x i32] [i32 116, i32 119, i32 111, i32 0], align 4
@.str.182 = private unnamed_addr constant [6 x i32] [i32 116, i32 104, i32 114, i32 101, i32 101, i32 0], align 4
@.str.183 = private unnamed_addr constant [5 x i32] [i32 102, i32 111, i32 117, i32 114, i32 0], align 4
@.str.184 = private unnamed_addr constant [5 x i32] [i32 102, i32 105, i32 118, i32 101, i32 0], align 4
@.str.185 = private unnamed_addr constant [4 x i32] [i32 115, i32 105, i32 120, i32 0], align 4
@.str.186 = private unnamed_addr constant [6 x i32] [i32 115, i32 101, i32 118, i32 101, i32 110, i32 0], align 4
@.str.187 = private unnamed_addr constant [6 x i32] [i32 101, i32 105, i32 103, i32 104, i32 116, i32 0], align 4
@.str.188 = private unnamed_addr constant [5 x i32] [i32 110, i32 105, i32 110, i32 101, i32 0], align 4
@.str.189 = private unnamed_addr constant [6 x i32] [i32 99, i32 111, i32 108, i32 111, i32 110, i32 0], align 4
@.str.190 = private unnamed_addr constant [10 x i32] [i32 115, i32 101, i32 109, i32 105, i32 99, i32 111, i32 108, i32 111, i32 110, i32 0], align 4
@.str.191 = private unnamed_addr constant [15 x i32] [i32 108, i32 101, i32 115, i32 115, i32 45, i32 116, i32 104, i32 97, i32 110, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.192 = private unnamed_addr constant [12 x i32] [i32 101, i32 113, i32 117, i32 97, i32 108, i32 115, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.193 = private unnamed_addr constant [18 x i32] [i32 103, i32 114, i32 101, i32 97, i32 116, i32 101, i32 114, i32 45, i32 116, i32 104, i32 97, i32 110, i32 45, i32 115, i32 105, i32 103, i32 110, i32 0], align 4
@.str.194 = private unnamed_addr constant [14 x i32] [i32 113, i32 117, i32 101, i32 115, i32 116, i32 105, i32 111, i32 110, i32 45, i32 109, i32 97, i32 114, i32 107, i32 0], align 4
@.str.195 = private unnamed_addr constant [14 x i32] [i32 99, i32 111, i32 109, i32 109, i32 101, i32 114, i32 99, i32 105, i32 97, i32 108, i32 45, i32 97, i32 116, i32 0], align 4
@.str.196 = private unnamed_addr constant [20 x i32] [i32 108, i32 101, i32 102, i32 116, i32 45, i32 115, i32 113, i32 117, i32 97, i32 114, i32 101, i32 45, i32 98, i32 114, i32 97, i32 99, i32 107, i32 101, i32 116, i32 0], align 4
@.str.197 = private unnamed_addr constant [10 x i32] [i32 98, i32 97, i32 99, i32 107, i32 115, i32 108, i32 97, i32 115, i32 104, i32 0], align 4
@.str.198 = private unnamed_addr constant [16 x i32] [i32 114, i32 101, i32 118, i32 101, i32 114, i32 115, i32 101, i32 45, i32 115, i32 111, i32 108, i32 105, i32 100, i32 117, i32 115, i32 0], align 4
@.str.199 = private unnamed_addr constant [21 x i32] [i32 114, i32 105, i32 103, i32 104, i32 116, i32 45, i32 115, i32 113, i32 117, i32 97, i32 114, i32 101, i32 45, i32 98, i32 114, i32 97, i32 99, i32 107, i32 101, i32 116, i32 0], align 4
@.str.200 = private unnamed_addr constant [11 x i32] [i32 99, i32 105, i32 114, i32 99, i32 117, i32 109, i32 102, i32 108, i32 101, i32 120, i32 0], align 4
@.str.201 = private unnamed_addr constant [18 x i32] [i32 99, i32 105, i32 114, i32 99, i32 117, i32 109, i32 102, i32 108, i32 101, i32 120, i32 45, i32 97, i32 99, i32 99, i32 101, i32 110, i32 116, i32 0], align 4
@.str.202 = private unnamed_addr constant [11 x i32] [i32 117, i32 110, i32 100, i32 101, i32 114, i32 115, i32 99, i32 111, i32 114, i32 101, i32 0], align 4
@.str.203 = private unnamed_addr constant [13 x i32] [i32 103, i32 114, i32 97, i32 118, i32 101, i32 45, i32 97, i32 99, i32 99, i32 101, i32 110, i32 116, i32 0], align 4
@.str.204 = private unnamed_addr constant [11 x i32] [i32 108, i32 101, i32 102, i32 116, i32 45, i32 98, i32 114, i32 97, i32 99, i32 101, i32 0], align 4
@.str.205 = private unnamed_addr constant [19 x i32] [i32 108, i32 101, i32 102, i32 116, i32 45, i32 99, i32 117, i32 114, i32 108, i32 121, i32 45, i32 98, i32 114, i32 97, i32 99, i32 107, i32 101, i32 116, i32 0], align 4
@.str.206 = private unnamed_addr constant [14 x i32] [i32 118, i32 101, i32 114, i32 116, i32 105, i32 99, i32 97, i32 108, i32 45, i32 108, i32 105, i32 110, i32 101, i32 0], align 4
@.str.207 = private unnamed_addr constant [12 x i32] [i32 114, i32 105, i32 103, i32 104, i32 116, i32 45, i32 98, i32 114, i32 97, i32 99, i32 101, i32 0], align 4
@.str.208 = private unnamed_addr constant [20 x i32] [i32 114, i32 105, i32 103, i32 104, i32 116, i32 45, i32 99, i32 117, i32 114, i32 108, i32 121, i32 45, i32 98, i32 114, i32 97, i32 99, i32 107, i32 101, i32 116, i32 0], align 4
@.str.209 = private unnamed_addr constant [6 x i32] [i32 116, i32 105, i32 108, i32 100, i32 101, i32 0], align 4
@.str.210 = private unnamed_addr constant [4 x i32] [i32 68, i32 69, i32 76, i32 0], align 4
@rangecmp_wc.s1 = internal global [2 x i32] [i32 32, i32 0], align 4
@rangecmp_wc.s2 = internal global [2 x i32] [i32 32, i32 0], align 4

; Function Attrs: noinline nounwind
define i32 @internal_strmatch(i8* %pattern, i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %se = alloca i8*, align 4
  %pe = alloca i8*, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %pattern.addr, align 4
  %cmp1 = icmp eq i8* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 %call
  store i8* %add.ptr, i8** %se, align 4
  %4 = load i8*, i8** %pattern.addr, align 4
  %5 = load i8*, i8** %pattern.addr, align 4
  %call2 = call i32 @strlen(i8* %5)
  %add.ptr3 = getelementptr inbounds i8, i8* %4, i32 %call2
  store i8* %add.ptr3, i8** %pe, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i8*, i8** %se, align 4
  %8 = load i8*, i8** %pattern.addr, align 4
  %9 = load i8*, i8** %pe, align 4
  %10 = load i32, i32* %flags.addr, align 4
  %call4 = call i32 @gmatch(i8* %6, i8* %7, i8* %8, i8* %9, i32 %10)
  store i32 %call4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @gmatch(i8* %string, i8* %se, i8* %pattern, i8* %pe, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %se.addr = alloca i8*, align 4
  %pattern.addr = alloca i8*, align 4
  %pe.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca i8*, align 4
  %n = alloca i8*, align 4
  %c = alloca i32, align 4
  %sc = alloca i32, align 4
  %lflags = alloca i32, align 4
  %newn = alloca i8*, align 4
  %newn233 = alloca i8*, align 4
  %r = alloca i32, align 4
  %c1 = alloca i8, align 1
  %endp = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %se, i8** %se.addr, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  store i8* %pe, i8** %pe.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %pattern.addr, align 4
  store i8* %0, i8** %p, align 4
  %1 = load i8*, i8** %string.addr, align 4
  store i8* %1, i8** %n, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8*, i8** %pattern.addr, align 4
  %cmp1 = icmp eq i8* %3, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %4 = load i8*, i8** %p, align 4
  %5 = load i8*, i8** %pe.addr, align 4
  %cmp2 = icmp ult i8* %4, %5
  br i1 %cmp2, label %while.body, label %while.end531

while.body:                                       ; preds = %while.cond
  %6 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %7 = load i8, i8* %6, align 1
  %conv = zext i8 %7 to i32
  store i32 %conv, i32* %c, align 4
  %8 = load i32, i32* %flags.addr, align 4
  %and = and i32 %8, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false12

cond.true:                                        ; preds = %while.body
  %9 = load i32, i32* %c, align 4
  %conv3 = trunc i32 %9 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @isupper(i32 %conv4) #4
  %tobool5 = icmp ne i32 %call, 0
  br i1 %tobool5, label %cond.true6, label %cond.false

cond.true6:                                       ; preds = %cond.true
  %10 = load i32, i32* %c, align 4
  %conv7 = trunc i32 %10 to i8
  %conv8 = zext i8 %conv7 to i32
  %call9 = call i32 @tolower(i32 %conv8) #4
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %11 = load i32, i32* %c, align 4
  %conv10 = trunc i32 %11 to i8
  %conv11 = zext i8 %conv10 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true6
  %cond = phi i32 [ %call9, %cond.true6 ], [ %conv11, %cond.false ]
  br label %cond.end15

cond.false12:                                     ; preds = %while.body
  %12 = load i32, i32* %c, align 4
  %conv13 = trunc i32 %12 to i8
  %conv14 = zext i8 %conv13 to i32
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false12, %cond.end
  %cond16 = phi i32 [ %cond, %cond.end ], [ %conv14, %cond.false12 ]
  store i32 %cond16, i32* %c, align 4
  %13 = load i8*, i8** %n, align 4
  %14 = load i8*, i8** %se.addr, align 4
  %cmp17 = icmp ult i8* %13, %14
  br i1 %cmp17, label %cond.true19, label %cond.false21

cond.true19:                                      ; preds = %cond.end15
  %15 = load i8*, i8** %n, align 4
  %16 = load i8, i8* %15, align 1
  %conv20 = zext i8 %16 to i32
  br label %cond.end22

cond.false21:                                     ; preds = %cond.end15
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true19
  %cond23 = phi i32 [ %conv20, %cond.true19 ], [ 0, %cond.false21 ]
  store i32 %cond23, i32* %sc, align 4
  %17 = load i32, i32* %flags.addr, align 4
  %and24 = and i32 %17, 32
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %land.lhs.true, label %if.end53

land.lhs.true:                                    ; preds = %cond.end22
  %18 = load i8*, i8** %p, align 4
  %19 = load i8, i8* %18, align 1
  %conv26 = zext i8 %19 to i32
  %cmp27 = icmp eq i32 %conv26, 40
  br i1 %cmp27, label %land.lhs.true29, label %if.end53

land.lhs.true29:                                  ; preds = %land.lhs.true
  %20 = load i32, i32* %c, align 4
  %cmp30 = icmp eq i32 %20, 43
  br i1 %cmp30, label %if.then44, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %land.lhs.true29
  %21 = load i32, i32* %c, align 4
  %cmp33 = icmp eq i32 %21, 42
  br i1 %cmp33, label %if.then44, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %lor.lhs.false32
  %22 = load i32, i32* %c, align 4
  %cmp36 = icmp eq i32 %22, 63
  br i1 %cmp36, label %if.then44, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %lor.lhs.false35
  %23 = load i32, i32* %c, align 4
  %cmp39 = icmp eq i32 %23, 64
  br i1 %cmp39, label %if.then44, label %lor.lhs.false41

lor.lhs.false41:                                  ; preds = %lor.lhs.false38
  %24 = load i32, i32* %c, align 4
  %cmp42 = icmp eq i32 %24, 33
  br i1 %cmp42, label %if.then44, label %if.end53

if.then44:                                        ; preds = %lor.lhs.false41, %lor.lhs.false38, %lor.lhs.false35, %lor.lhs.false32, %land.lhs.true29
  %25 = load i8*, i8** %n, align 4
  %26 = load i8*, i8** %string.addr, align 4
  %cmp45 = icmp eq i8* %25, %26
  br i1 %cmp45, label %cond.true47, label %cond.false48

cond.true47:                                      ; preds = %if.then44
  %27 = load i32, i32* %flags.addr, align 4
  br label %cond.end50

cond.false48:                                     ; preds = %if.then44
  %28 = load i32, i32* %flags.addr, align 4
  %and49 = and i32 %28, -5
  br label %cond.end50

cond.end50:                                       ; preds = %cond.false48, %cond.true47
  %cond51 = phi i32 [ %27, %cond.true47 ], [ %and49, %cond.false48 ]
  store i32 %cond51, i32* %lflags, align 4
  %29 = load i32, i32* %c, align 4
  %30 = load i8*, i8** %n, align 4
  %31 = load i8*, i8** %se.addr, align 4
  %32 = load i8*, i8** %p, align 4
  %33 = load i8*, i8** %pe.addr, align 4
  %34 = load i32, i32* %lflags, align 4
  %call52 = call i32 @extmatch(i32 %29, i8* %30, i8* %31, i8* %32, i8* %33, i32 %34)
  store i32 %call52, i32* %retval, align 4
  br label %return

if.end53:                                         ; preds = %lor.lhs.false41, %land.lhs.true, %cond.end22
  %35 = load i32, i32* %c, align 4
  switch i32 %35, label %sw.default [
    i32 63, label %sw.bb
    i32 92, label %sw.bb83
    i32 42, label %sw.bb147
    i32 91, label %sw.bb471
  ]

sw.bb:                                            ; preds = %if.end53
  %36 = load i32, i32* %sc, align 4
  %cmp54 = icmp eq i32 %36, 0
  br i1 %cmp54, label %if.then56, label %if.else

if.then56:                                        ; preds = %sw.bb
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %sw.bb
  %37 = load i32, i32* %flags.addr, align 4
  %and57 = and i32 %37, 1
  %tobool58 = icmp ne i32 %and57, 0
  br i1 %tobool58, label %land.lhs.true59, label %if.else63

land.lhs.true59:                                  ; preds = %if.else
  %38 = load i32, i32* %sc, align 4
  %cmp60 = icmp eq i32 %38, 47
  br i1 %cmp60, label %if.then62, label %if.else63

if.then62:                                        ; preds = %land.lhs.true59
  store i32 1, i32* %retval, align 4
  br label %return

if.else63:                                        ; preds = %land.lhs.true59, %if.else
  %39 = load i32, i32* %flags.addr, align 4
  %and64 = and i32 %39, 4
  %tobool65 = icmp ne i32 %and64, 0
  br i1 %tobool65, label %land.lhs.true66, label %if.end80

land.lhs.true66:                                  ; preds = %if.else63
  %40 = load i32, i32* %sc, align 4
  %cmp67 = icmp eq i32 %40, 46
  br i1 %cmp67, label %land.lhs.true69, label %if.end80

land.lhs.true69:                                  ; preds = %land.lhs.true66
  %41 = load i8*, i8** %n, align 4
  %42 = load i8*, i8** %string.addr, align 4
  %cmp70 = icmp eq i8* %41, %42
  br i1 %cmp70, label %if.then79, label %lor.lhs.false72

lor.lhs.false72:                                  ; preds = %land.lhs.true69
  %43 = load i32, i32* %flags.addr, align 4
  %and73 = and i32 %43, 1
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %land.lhs.true75, label %if.end80

land.lhs.true75:                                  ; preds = %lor.lhs.false72
  %44 = load i8*, i8** %n, align 4
  %arrayidx = getelementptr inbounds i8, i8* %44, i32 -1
  %45 = load i8, i8* %arrayidx, align 1
  %conv76 = zext i8 %45 to i32
  %cmp77 = icmp eq i32 %conv76, 47
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %land.lhs.true75, %land.lhs.true69
  store i32 1, i32* %retval, align 4
  br label %return

if.end80:                                         ; preds = %land.lhs.true75, %lor.lhs.false72, %land.lhs.true66, %if.else63
  br label %if.end81

if.end81:                                         ; preds = %if.end80
  br label %if.end82

if.end82:                                         ; preds = %if.end81
  br label %sw.epilog

sw.bb83:                                          ; preds = %if.end53
  %46 = load i8*, i8** %p, align 4
  %47 = load i8*, i8** %pe.addr, align 4
  %cmp84 = icmp eq i8* %46, %47
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %sw.bb83
  store i32 1, i32* %retval, align 4
  br label %return

if.end87:                                         ; preds = %sw.bb83
  %48 = load i32, i32* %flags.addr, align 4
  %and88 = and i32 %48, 2
  %cmp89 = icmp eq i32 %and88, 0
  br i1 %cmp89, label %if.then91, label %if.end119

if.then91:                                        ; preds = %if.end87
  %49 = load i8*, i8** %p, align 4
  %incdec.ptr92 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr92, i8** %p, align 4
  %50 = load i8, i8* %49, align 1
  %conv93 = zext i8 %50 to i32
  store i32 %conv93, i32* %c, align 4
  %51 = load i8*, i8** %p, align 4
  %52 = load i8*, i8** %pe.addr, align 4
  %cmp94 = icmp ugt i8* %51, %52
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.then91
  store i32 1, i32* %retval, align 4
  br label %return

if.end97:                                         ; preds = %if.then91
  %53 = load i32, i32* %flags.addr, align 4
  %and98 = and i32 %53, 16
  %tobool99 = icmp ne i32 %and98, 0
  br i1 %tobool99, label %cond.true100, label %cond.false114

cond.true100:                                     ; preds = %if.end97
  %54 = load i32, i32* %c, align 4
  %conv101 = trunc i32 %54 to i8
  %conv102 = zext i8 %conv101 to i32
  %call103 = call i32 @isupper(i32 %conv102) #4
  %tobool104 = icmp ne i32 %call103, 0
  br i1 %tobool104, label %cond.true105, label %cond.false109

cond.true105:                                     ; preds = %cond.true100
  %55 = load i32, i32* %c, align 4
  %conv106 = trunc i32 %55 to i8
  %conv107 = zext i8 %conv106 to i32
  %call108 = call i32 @tolower(i32 %conv107) #4
  br label %cond.end112

cond.false109:                                    ; preds = %cond.true100
  %56 = load i32, i32* %c, align 4
  %conv110 = trunc i32 %56 to i8
  %conv111 = zext i8 %conv110 to i32
  br label %cond.end112

cond.end112:                                      ; preds = %cond.false109, %cond.true105
  %cond113 = phi i32 [ %call108, %cond.true105 ], [ %conv111, %cond.false109 ]
  br label %cond.end117

cond.false114:                                    ; preds = %if.end97
  %57 = load i32, i32* %c, align 4
  %conv115 = trunc i32 %57 to i8
  %conv116 = zext i8 %conv115 to i32
  br label %cond.end117

cond.end117:                                      ; preds = %cond.false114, %cond.end112
  %cond118 = phi i32 [ %cond113, %cond.end112 ], [ %conv116, %cond.false114 ]
  store i32 %cond118, i32* %c, align 4
  br label %if.end119

if.end119:                                        ; preds = %cond.end117, %if.end87
  %58 = load i32, i32* %flags.addr, align 4
  %and120 = and i32 %58, 16
  %tobool121 = icmp ne i32 %and120, 0
  br i1 %tobool121, label %cond.true122, label %cond.false136

cond.true122:                                     ; preds = %if.end119
  %59 = load i32, i32* %sc, align 4
  %conv123 = trunc i32 %59 to i8
  %conv124 = zext i8 %conv123 to i32
  %call125 = call i32 @isupper(i32 %conv124) #4
  %tobool126 = icmp ne i32 %call125, 0
  br i1 %tobool126, label %cond.true127, label %cond.false131

cond.true127:                                     ; preds = %cond.true122
  %60 = load i32, i32* %sc, align 4
  %conv128 = trunc i32 %60 to i8
  %conv129 = zext i8 %conv128 to i32
  %call130 = call i32 @tolower(i32 %conv129) #4
  br label %cond.end134

cond.false131:                                    ; preds = %cond.true122
  %61 = load i32, i32* %sc, align 4
  %conv132 = trunc i32 %61 to i8
  %conv133 = zext i8 %conv132 to i32
  br label %cond.end134

cond.end134:                                      ; preds = %cond.false131, %cond.true127
  %cond135 = phi i32 [ %call130, %cond.true127 ], [ %conv133, %cond.false131 ]
  br label %cond.end139

cond.false136:                                    ; preds = %if.end119
  %62 = load i32, i32* %sc, align 4
  %conv137 = trunc i32 %62 to i8
  %conv138 = zext i8 %conv137 to i32
  br label %cond.end139

cond.end139:                                      ; preds = %cond.false136, %cond.end134
  %cond140 = phi i32 [ %cond135, %cond.end134 ], [ %conv138, %cond.false136 ]
  %63 = load i32, i32* %c, align 4
  %conv141 = trunc i32 %63 to i8
  %conv142 = zext i8 %conv141 to i32
  %cmp143 = icmp ne i32 %cond140, %conv142
  br i1 %cmp143, label %if.then145, label %if.end146

if.then145:                                       ; preds = %cond.end139
  store i32 1, i32* %retval, align 4
  br label %return

if.end146:                                        ; preds = %cond.end139
  br label %sw.epilog

sw.bb147:                                         ; preds = %if.end53
  %64 = load i32, i32* %flags.addr, align 4
  %and148 = and i32 %64, 4
  %tobool149 = icmp ne i32 %and148, 0
  br i1 %tobool149, label %land.lhs.true150, label %if.end165

land.lhs.true150:                                 ; preds = %sw.bb147
  %65 = load i32, i32* %sc, align 4
  %cmp151 = icmp eq i32 %65, 46
  br i1 %cmp151, label %land.lhs.true153, label %if.end165

land.lhs.true153:                                 ; preds = %land.lhs.true150
  %66 = load i8*, i8** %n, align 4
  %67 = load i8*, i8** %string.addr, align 4
  %cmp154 = icmp eq i8* %66, %67
  br i1 %cmp154, label %if.then164, label %lor.lhs.false156

lor.lhs.false156:                                 ; preds = %land.lhs.true153
  %68 = load i32, i32* %flags.addr, align 4
  %and157 = and i32 %68, 1
  %tobool158 = icmp ne i32 %and157, 0
  br i1 %tobool158, label %land.lhs.true159, label %if.end165

land.lhs.true159:                                 ; preds = %lor.lhs.false156
  %69 = load i8*, i8** %n, align 4
  %arrayidx160 = getelementptr inbounds i8, i8* %69, i32 -1
  %70 = load i8, i8* %arrayidx160, align 1
  %conv161 = zext i8 %70 to i32
  %cmp162 = icmp eq i32 %conv161, 47
  br i1 %cmp162, label %if.then164, label %if.end165

if.then164:                                       ; preds = %land.lhs.true159, %land.lhs.true153
  store i32 1, i32* %retval, align 4
  br label %return

if.end165:                                        ; preds = %land.lhs.true159, %lor.lhs.false156, %land.lhs.true150, %sw.bb147
  %71 = load i8*, i8** %p, align 4
  %72 = load i8*, i8** %pe.addr, align 4
  %cmp166 = icmp eq i8* %71, %72
  br i1 %cmp166, label %if.then168, label %if.end169

if.then168:                                       ; preds = %if.end165
  store i32 0, i32* %retval, align 4
  br label %return

if.end169:                                        ; preds = %if.end165
  %73 = load i8*, i8** %p, align 4
  %incdec.ptr170 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %incdec.ptr170, i8** %p, align 4
  %74 = load i8, i8* %73, align 1
  %conv171 = zext i8 %74 to i32
  store i32 %conv171, i32* %c, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc256, %if.end169
  %75 = load i32, i32* %c, align 4
  %cmp172 = icmp eq i32 %75, 63
  br i1 %cmp172, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.cond
  %76 = load i32, i32* %c, align 4
  %cmp174 = icmp eq i32 %76, 42
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %77 = phi i1 [ true, %for.cond ], [ %cmp174, %lor.rhs ]
  br i1 %77, label %for.body, label %for.end259

for.body:                                         ; preds = %lor.end
  %78 = load i32, i32* %flags.addr, align 4
  %and176 = and i32 %78, 1
  %tobool177 = icmp ne i32 %and176, 0
  br i1 %tobool177, label %land.lhs.true178, label %if.else182

land.lhs.true178:                                 ; preds = %for.body
  %79 = load i32, i32* %sc, align 4
  %cmp179 = icmp eq i32 %79, 47
  br i1 %cmp179, label %if.then181, label %if.else182

if.then181:                                       ; preds = %land.lhs.true178
  store i32 1, i32* %retval, align 4
  br label %return

if.else182:                                       ; preds = %land.lhs.true178, %for.body
  %80 = load i32, i32* %flags.addr, align 4
  %and183 = and i32 %80, 32
  %tobool184 = icmp ne i32 %and183, 0
  br i1 %tobool184, label %land.lhs.true185, label %if.else204

land.lhs.true185:                                 ; preds = %if.else182
  %81 = load i32, i32* %c, align 4
  %cmp186 = icmp eq i32 %81, 63
  br i1 %cmp186, label %land.lhs.true188, label %if.else204

land.lhs.true188:                                 ; preds = %land.lhs.true185
  %82 = load i8*, i8** %p, align 4
  %83 = load i8, i8* %82, align 1
  %conv189 = zext i8 %83 to i32
  %cmp190 = icmp eq i32 %conv189, 40
  br i1 %cmp190, label %if.then192, label %if.else204

if.then192:                                       ; preds = %land.lhs.true188
  %84 = load i32, i32* %c, align 4
  %85 = load i8*, i8** %n, align 4
  %86 = load i8*, i8** %se.addr, align 4
  %87 = load i8*, i8** %p, align 4
  %88 = load i8*, i8** %pe.addr, align 4
  %89 = load i32, i32* %flags.addr, align 4
  %call193 = call i32 @extmatch(i32 %84, i8* %85, i8* %86, i8* %87, i8* %88, i32 %89)
  %cmp194 = icmp eq i32 %call193, 0
  br i1 %cmp194, label %if.then196, label %if.end197

if.then196:                                       ; preds = %if.then192
  store i32 0, i32* %retval, align 4
  br label %return

if.end197:                                        ; preds = %if.then192
  %90 = load i8*, i8** %p, align 4
  %add.ptr = getelementptr inbounds i8, i8* %90, i32 1
  %91 = load i8*, i8** %pe.addr, align 4
  %call198 = call i8* @glob_patscan(i8* %add.ptr, i8* %91, i32 0)
  store i8* %call198, i8** %newn, align 4
  %92 = load i8*, i8** %newn, align 4
  %tobool199 = icmp ne i8* %92, null
  br i1 %tobool199, label %cond.true200, label %cond.false201

cond.true200:                                     ; preds = %if.end197
  %93 = load i8*, i8** %newn, align 4
  br label %cond.end202

cond.false201:                                    ; preds = %if.end197
  %94 = load i8*, i8** %pe.addr, align 4
  br label %cond.end202

cond.end202:                                      ; preds = %cond.false201, %cond.true200
  %cond203 = phi i8* [ %93, %cond.true200 ], [ %94, %cond.false201 ]
  store i8* %cond203, i8** %p, align 4
  br label %if.end221

if.else204:                                       ; preds = %land.lhs.true188, %land.lhs.true185, %if.else182
  %95 = load i32, i32* %c, align 4
  %cmp205 = icmp eq i32 %95, 63
  br i1 %cmp205, label %if.then207, label %if.end220

if.then207:                                       ; preds = %if.else204
  %96 = load i32, i32* %sc, align 4
  %cmp208 = icmp eq i32 %96, 0
  br i1 %cmp208, label %if.then210, label %if.end211

if.then210:                                       ; preds = %if.then207
  store i32 1, i32* %retval, align 4
  br label %return

if.end211:                                        ; preds = %if.then207
  %97 = load i8*, i8** %n, align 4
  %incdec.ptr212 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %incdec.ptr212, i8** %n, align 4
  %98 = load i8*, i8** %n, align 4
  %99 = load i8*, i8** %se.addr, align 4
  %cmp213 = icmp ult i8* %98, %99
  br i1 %cmp213, label %cond.true215, label %cond.false217

cond.true215:                                     ; preds = %if.end211
  %100 = load i8*, i8** %n, align 4
  %101 = load i8, i8* %100, align 1
  %conv216 = zext i8 %101 to i32
  br label %cond.end218

cond.false217:                                    ; preds = %if.end211
  br label %cond.end218

cond.end218:                                      ; preds = %cond.false217, %cond.true215
  %cond219 = phi i32 [ %conv216, %cond.true215 ], [ 0, %cond.false217 ]
  store i32 %cond219, i32* %sc, align 4
  br label %if.end220

if.end220:                                        ; preds = %cond.end218, %if.else204
  br label %if.end221

if.end221:                                        ; preds = %if.end220, %cond.end202
  br label %if.end222

if.end222:                                        ; preds = %if.end221
  %102 = load i32, i32* %flags.addr, align 4
  %and223 = and i32 %102, 32
  %tobool224 = icmp ne i32 %and223, 0
  br i1 %tobool224, label %land.lhs.true225, label %if.end251

land.lhs.true225:                                 ; preds = %if.end222
  %103 = load i32, i32* %c, align 4
  %cmp226 = icmp eq i32 %103, 42
  br i1 %cmp226, label %land.lhs.true228, label %if.end251

land.lhs.true228:                                 ; preds = %land.lhs.true225
  %104 = load i8*, i8** %p, align 4
  %105 = load i8, i8* %104, align 1
  %conv229 = zext i8 %105 to i32
  %cmp230 = icmp eq i32 %conv229, 40
  br i1 %cmp230, label %if.then232, label %if.end251

if.then232:                                       ; preds = %land.lhs.true228
  %106 = load i8*, i8** %n, align 4
  store i8* %106, i8** %newn233, align 4
  br label %for.cond234

for.cond234:                                      ; preds = %for.inc, %if.then232
  %107 = load i8*, i8** %newn233, align 4
  %108 = load i8*, i8** %se.addr, align 4
  %cmp235 = icmp ult i8* %107, %108
  br i1 %cmp235, label %for.body237, label %for.end

for.body237:                                      ; preds = %for.cond234
  %109 = load i32, i32* %c, align 4
  %110 = load i8*, i8** %newn233, align 4
  %111 = load i8*, i8** %se.addr, align 4
  %112 = load i8*, i8** %p, align 4
  %113 = load i8*, i8** %pe.addr, align 4
  %114 = load i32, i32* %flags.addr, align 4
  %call238 = call i32 @extmatch(i32 %109, i8* %110, i8* %111, i8* %112, i8* %113, i32 %114)
  %cmp239 = icmp eq i32 %call238, 0
  br i1 %cmp239, label %if.then241, label %if.end242

if.then241:                                       ; preds = %for.body237
  store i32 0, i32* %retval, align 4
  br label %return

if.end242:                                        ; preds = %for.body237
  br label %for.inc

for.inc:                                          ; preds = %if.end242
  %115 = load i8*, i8** %newn233, align 4
  %incdec.ptr243 = getelementptr inbounds i8, i8* %115, i32 1
  store i8* %incdec.ptr243, i8** %newn233, align 4
  br label %for.cond234

for.end:                                          ; preds = %for.cond234
  %116 = load i8*, i8** %p, align 4
  %add.ptr244 = getelementptr inbounds i8, i8* %116, i32 1
  %117 = load i8*, i8** %pe.addr, align 4
  %call245 = call i8* @glob_patscan(i8* %add.ptr244, i8* %117, i32 0)
  store i8* %call245, i8** %newn233, align 4
  %118 = load i8*, i8** %newn233, align 4
  %tobool246 = icmp ne i8* %118, null
  br i1 %tobool246, label %cond.true247, label %cond.false248

cond.true247:                                     ; preds = %for.end
  %119 = load i8*, i8** %newn233, align 4
  br label %cond.end249

cond.false248:                                    ; preds = %for.end
  %120 = load i8*, i8** %pe.addr, align 4
  br label %cond.end249

cond.end249:                                      ; preds = %cond.false248, %cond.true247
  %cond250 = phi i8* [ %119, %cond.true247 ], [ %120, %cond.false248 ]
  store i8* %cond250, i8** %p, align 4
  br label %if.end251

if.end251:                                        ; preds = %cond.end249, %land.lhs.true228, %land.lhs.true225, %if.end222
  %121 = load i8*, i8** %p, align 4
  %122 = load i8*, i8** %pe.addr, align 4
  %cmp252 = icmp eq i8* %121, %122
  br i1 %cmp252, label %if.then254, label %if.end255

if.then254:                                       ; preds = %if.end251
  br label %for.end259

if.end255:                                        ; preds = %if.end251
  br label %for.inc256

for.inc256:                                       ; preds = %if.end255
  %123 = load i8*, i8** %p, align 4
  %incdec.ptr257 = getelementptr inbounds i8, i8* %123, i32 1
  store i8* %incdec.ptr257, i8** %p, align 4
  %124 = load i8, i8* %123, align 1
  %conv258 = zext i8 %124 to i32
  store i32 %conv258, i32* %c, align 4
  br label %for.cond

for.end259:                                       ; preds = %if.then254, %lor.end
  %125 = load i32, i32* %c, align 4
  %cmp260 = icmp eq i32 %125, 0
  br i1 %cmp260, label %if.then262, label %if.end281

if.then262:                                       ; preds = %for.end259
  %126 = load i32, i32* %flags.addr, align 4
  %and263 = and i32 %126, 1
  %cmp264 = icmp eq i32 %and263, 0
  %cond266 = select i1 %cmp264, i32 0, i32 1
  store i32 %cond266, i32* %r, align 4
  %127 = load i32, i32* %flags.addr, align 4
  %and267 = and i32 %127, 1
  %tobool268 = icmp ne i32 %and267, 0
  br i1 %tobool268, label %if.then269, label %if.end280

if.then269:                                       ; preds = %if.then262
  %128 = load i32, i32* %flags.addr, align 4
  %and270 = and i32 %128, 8
  %tobool271 = icmp ne i32 %and270, 0
  br i1 %tobool271, label %if.then272, label %if.else273

if.then272:                                       ; preds = %if.then269
  store i32 0, i32* %r, align 4
  br label %if.end279

if.else273:                                       ; preds = %if.then269
  %129 = load i8*, i8** %n, align 4
  %130 = load i8*, i8** %se.addr, align 4
  %131 = load i8*, i8** %n, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %130 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %131 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call274 = call i8* @memchr(i8* %129, i32 47, i32 %sub.ptr.sub)
  %cmp275 = icmp eq i8* %call274, null
  br i1 %cmp275, label %if.then277, label %if.end278

if.then277:                                       ; preds = %if.else273
  store i32 0, i32* %r, align 4
  br label %if.end278

if.end278:                                        ; preds = %if.then277, %if.else273
  br label %if.end279

if.end279:                                        ; preds = %if.end278, %if.then272
  br label %if.end280

if.end280:                                        ; preds = %if.end279, %if.then262
  %132 = load i32, i32* %r, align 4
  store i32 %132, i32* %retval, align 4
  br label %return

if.end281:                                        ; preds = %for.end259
  %133 = load i8*, i8** %p, align 4
  %134 = load i8*, i8** %pe.addr, align 4
  %cmp282 = icmp eq i8* %133, %134
  br i1 %cmp282, label %land.lhs.true284, label %if.end291

land.lhs.true284:                                 ; preds = %if.end281
  %135 = load i32, i32* %c, align 4
  %cmp285 = icmp eq i32 %135, 63
  br i1 %cmp285, label %if.then290, label %lor.lhs.false287

lor.lhs.false287:                                 ; preds = %land.lhs.true284
  %136 = load i32, i32* %c, align 4
  %cmp288 = icmp eq i32 %136, 42
  br i1 %cmp288, label %if.then290, label %if.end291

if.then290:                                       ; preds = %lor.lhs.false287, %land.lhs.true284
  store i32 0, i32* %retval, align 4
  br label %return

if.end291:                                        ; preds = %lor.lhs.false287, %if.end281
  %137 = load i8*, i8** %n, align 4
  %138 = load i8*, i8** %se.addr, align 4
  %cmp292 = icmp eq i8* %137, %138
  br i1 %cmp292, label %land.lhs.true294, label %if.end320

land.lhs.true294:                                 ; preds = %if.end291
  %139 = load i32, i32* %flags.addr, align 4
  %and295 = and i32 %139, 32
  %tobool296 = icmp ne i32 %and295, 0
  br i1 %tobool296, label %land.lhs.true297, label %if.end320

land.lhs.true297:                                 ; preds = %land.lhs.true294
  %140 = load i32, i32* %c, align 4
  %cmp298 = icmp eq i32 %140, 33
  br i1 %cmp298, label %land.lhs.true303, label %lor.lhs.false300

lor.lhs.false300:                                 ; preds = %land.lhs.true297
  %141 = load i32, i32* %c, align 4
  %cmp301 = icmp eq i32 %141, 63
  br i1 %cmp301, label %land.lhs.true303, label %if.end320

land.lhs.true303:                                 ; preds = %lor.lhs.false300, %land.lhs.true297
  %142 = load i8*, i8** %p, align 4
  %143 = load i8, i8* %142, align 1
  %conv304 = zext i8 %143 to i32
  %cmp305 = icmp eq i32 %conv304, 40
  br i1 %cmp305, label %if.then307, label %if.end320

if.then307:                                       ; preds = %land.lhs.true303
  %144 = load i8*, i8** %p, align 4
  %incdec.ptr308 = getelementptr inbounds i8, i8* %144, i32 -1
  store i8* %incdec.ptr308, i8** %p, align 4
  %145 = load i32, i32* %c, align 4
  %146 = load i8*, i8** %n, align 4
  %147 = load i8*, i8** %se.addr, align 4
  %148 = load i8*, i8** %p, align 4
  %149 = load i8*, i8** %pe.addr, align 4
  %150 = load i32, i32* %flags.addr, align 4
  %call309 = call i32 @extmatch(i32 %145, i8* %146, i8* %147, i8* %148, i8* %149, i32 %150)
  %cmp310 = icmp eq i32 %call309, 0
  br i1 %cmp310, label %if.then312, label %if.end316

if.then312:                                       ; preds = %if.then307
  %151 = load i32, i32* %c, align 4
  %cmp313 = icmp eq i32 %151, 33
  %cond315 = select i1 %cmp313, i32 1, i32 0
  store i32 %cond315, i32* %retval, align 4
  br label %return

if.end316:                                        ; preds = %if.then307
  %152 = load i32, i32* %c, align 4
  %cmp317 = icmp eq i32 %152, 33
  %cond319 = select i1 %cmp317, i32 0, i32 1
  store i32 %cond319, i32* %retval, align 4
  br label %return

if.end320:                                        ; preds = %land.lhs.true303, %lor.lhs.false300, %land.lhs.true294, %if.end291
  %153 = load i32, i32* %c, align 4
  %cmp321 = icmp eq i32 %153, 47
  br i1 %cmp321, label %land.lhs.true323, label %if.end348

land.lhs.true323:                                 ; preds = %if.end320
  %154 = load i32, i32* %flags.addr, align 4
  %and324 = and i32 %154, 1
  %tobool325 = icmp ne i32 %and324, 0
  br i1 %tobool325, label %if.then326, label %if.end348

if.then326:                                       ; preds = %land.lhs.true323
  br label %while.cond327

while.cond327:                                    ; preds = %while.body333, %if.then326
  %155 = load i8*, i8** %n, align 4
  %156 = load i8*, i8** %se.addr, align 4
  %cmp328 = icmp ult i8* %155, %156
  br i1 %cmp328, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond327
  %157 = load i8*, i8** %n, align 4
  %158 = load i8, i8* %157, align 1
  %conv330 = zext i8 %158 to i32
  %cmp331 = icmp ne i32 %conv330, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond327
  %159 = phi i1 [ false, %while.cond327 ], [ %cmp331, %land.rhs ]
  br i1 %159, label %while.body333, label %while.end

while.body333:                                    ; preds = %land.end
  %160 = load i8*, i8** %n, align 4
  %incdec.ptr334 = getelementptr inbounds i8, i8* %160, i32 1
  store i8* %incdec.ptr334, i8** %n, align 4
  br label %while.cond327

while.end:                                        ; preds = %land.end
  %161 = load i8*, i8** %n, align 4
  %162 = load i8*, i8** %se.addr, align 4
  %cmp335 = icmp ult i8* %161, %162
  br i1 %cmp335, label %land.lhs.true337, label %if.end347

land.lhs.true337:                                 ; preds = %while.end
  %163 = load i8*, i8** %n, align 4
  %164 = load i8, i8* %163, align 1
  %conv338 = zext i8 %164 to i32
  %cmp339 = icmp eq i32 %conv338, 47
  br i1 %cmp339, label %land.lhs.true341, label %if.end347

land.lhs.true341:                                 ; preds = %land.lhs.true337
  %165 = load i8*, i8** %n, align 4
  %add.ptr342 = getelementptr inbounds i8, i8* %165, i32 1
  %166 = load i8*, i8** %se.addr, align 4
  %167 = load i8*, i8** %p, align 4
  %168 = load i8*, i8** %pe.addr, align 4
  %169 = load i32, i32* %flags.addr, align 4
  %call343 = call i32 @gmatch(i8* %add.ptr342, i8* %166, i8* %167, i8* %168, i32 %169)
  %cmp344 = icmp eq i32 %call343, 0
  br i1 %cmp344, label %if.then346, label %if.end347

if.then346:                                       ; preds = %land.lhs.true341
  store i32 0, i32* %retval, align 4
  br label %return

if.end347:                                        ; preds = %land.lhs.true341, %land.lhs.true337, %while.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end348:                                        ; preds = %land.lhs.true323, %if.end320
  %170 = load i8*, i8** %n, align 4
  %171 = load i32, i32* %flags.addr, align 4
  %and349 = and i32 %171, 1
  %tobool350 = icmp ne i32 %and349, 0
  %cond351 = select i1 %tobool350, i32 47, i32 0
  %172 = load i8*, i8** %se.addr, align 4
  %173 = load i8*, i8** %n, align 4
  %sub.ptr.lhs.cast352 = ptrtoint i8* %172 to i32
  %sub.ptr.rhs.cast353 = ptrtoint i8* %173 to i32
  %sub.ptr.sub354 = sub i32 %sub.ptr.lhs.cast352, %sub.ptr.rhs.cast353
  %call355 = call i8* @memchr(i8* %170, i32 %cond351, i32 %sub.ptr.sub354)
  store i8* %call355, i8** %endp, align 4
  %174 = load i8*, i8** %endp, align 4
  %cmp356 = icmp eq i8* %174, null
  br i1 %cmp356, label %if.then358, label %if.end359

if.then358:                                       ; preds = %if.end348
  %175 = load i8*, i8** %se.addr, align 4
  store i8* %175, i8** %endp, align 4
  br label %if.end359

if.end359:                                        ; preds = %if.then358, %if.end348
  %176 = load i32, i32* %flags.addr, align 4
  %and360 = and i32 %176, 2
  %cmp361 = icmp eq i32 %and360, 0
  br i1 %cmp361, label %land.lhs.true363, label %cond.false368

land.lhs.true363:                                 ; preds = %if.end359
  %177 = load i32, i32* %c, align 4
  %cmp364 = icmp eq i32 %177, 92
  br i1 %cmp364, label %cond.true366, label %cond.false368

cond.true366:                                     ; preds = %land.lhs.true363
  %178 = load i8*, i8** %p, align 4
  %179 = load i8, i8* %178, align 1
  %conv367 = zext i8 %179 to i32
  br label %cond.end369

cond.false368:                                    ; preds = %land.lhs.true363, %if.end359
  %180 = load i32, i32* %c, align 4
  br label %cond.end369

cond.end369:                                      ; preds = %cond.false368, %cond.true366
  %cond370 = phi i32 [ %conv367, %cond.true366 ], [ %180, %cond.false368 ]
  %conv371 = trunc i32 %cond370 to i8
  store i8 %conv371, i8* %c1, align 1
  %181 = load i32, i32* %flags.addr, align 4
  %and372 = and i32 %181, 16
  %tobool373 = icmp ne i32 %and372, 0
  br i1 %tobool373, label %cond.true374, label %cond.false385

cond.true374:                                     ; preds = %cond.end369
  %182 = load i8, i8* %c1, align 1
  %conv375 = zext i8 %182 to i32
  %call376 = call i32 @isupper(i32 %conv375) #4
  %tobool377 = icmp ne i32 %call376, 0
  br i1 %tobool377, label %cond.true378, label %cond.false381

cond.true378:                                     ; preds = %cond.true374
  %183 = load i8, i8* %c1, align 1
  %conv379 = zext i8 %183 to i32
  %call380 = call i32 @tolower(i32 %conv379) #4
  br label %cond.end383

cond.false381:                                    ; preds = %cond.true374
  %184 = load i8, i8* %c1, align 1
  %conv382 = zext i8 %184 to i32
  br label %cond.end383

cond.end383:                                      ; preds = %cond.false381, %cond.true378
  %cond384 = phi i32 [ %call380, %cond.true378 ], [ %conv382, %cond.false381 ]
  br label %cond.end387

cond.false385:                                    ; preds = %cond.end369
  %185 = load i8, i8* %c1, align 1
  %conv386 = zext i8 %185 to i32
  br label %cond.end387

cond.end387:                                      ; preds = %cond.false385, %cond.end383
  %cond388 = phi i32 [ %cond384, %cond.end383 ], [ %conv386, %cond.false385 ]
  %conv389 = trunc i32 %cond388 to i8
  store i8 %conv389, i8* %c1, align 1
  %186 = load i8*, i8** %p, align 4
  %incdec.ptr390 = getelementptr inbounds i8, i8* %186, i32 -1
  store i8* %incdec.ptr390, i8** %p, align 4
  br label %for.cond391

for.cond391:                                      ; preds = %for.inc468, %cond.end387
  %187 = load i8*, i8** %n, align 4
  %188 = load i8*, i8** %endp, align 4
  %cmp392 = icmp ult i8* %187, %188
  br i1 %cmp392, label %for.body394, label %for.end470

for.body394:                                      ; preds = %for.cond391
  %189 = load i32, i32* %flags.addr, align 4
  %and395 = and i32 %189, 32
  %cmp396 = icmp eq i32 %and395, 0
  br i1 %cmp396, label %land.lhs.true398, label %if.end423

land.lhs.true398:                                 ; preds = %for.body394
  %190 = load i32, i32* %c, align 4
  %cmp399 = icmp ne i32 %190, 91
  br i1 %cmp399, label %land.lhs.true401, label %if.end423

land.lhs.true401:                                 ; preds = %land.lhs.true398
  %191 = load i32, i32* %flags.addr, align 4
  %and402 = and i32 %191, 16
  %tobool403 = icmp ne i32 %and402, 0
  br i1 %tobool403, label %cond.true404, label %cond.false415

cond.true404:                                     ; preds = %land.lhs.true401
  %192 = load i8*, i8** %n, align 4
  %193 = load i8, i8* %192, align 1
  %conv405 = zext i8 %193 to i32
  %call406 = call i32 @isupper(i32 %conv405) #4
  %tobool407 = icmp ne i32 %call406, 0
  br i1 %tobool407, label %cond.true408, label %cond.false411

cond.true408:                                     ; preds = %cond.true404
  %194 = load i8*, i8** %n, align 4
  %195 = load i8, i8* %194, align 1
  %conv409 = zext i8 %195 to i32
  %call410 = call i32 @tolower(i32 %conv409) #4
  br label %cond.end413

cond.false411:                                    ; preds = %cond.true404
  %196 = load i8*, i8** %n, align 4
  %197 = load i8, i8* %196, align 1
  %conv412 = zext i8 %197 to i32
  br label %cond.end413

cond.end413:                                      ; preds = %cond.false411, %cond.true408
  %cond414 = phi i32 [ %call410, %cond.true408 ], [ %conv412, %cond.false411 ]
  br label %cond.end417

cond.false415:                                    ; preds = %land.lhs.true401
  %198 = load i8*, i8** %n, align 4
  %199 = load i8, i8* %198, align 1
  %conv416 = zext i8 %199 to i32
  br label %cond.end417

cond.end417:                                      ; preds = %cond.false415, %cond.end413
  %cond418 = phi i32 [ %cond414, %cond.end413 ], [ %conv416, %cond.false415 ]
  %200 = load i8, i8* %c1, align 1
  %conv419 = zext i8 %200 to i32
  %cmp420 = icmp ne i32 %cond418, %conv419
  br i1 %cmp420, label %if.then422, label %if.end423

if.then422:                                       ; preds = %cond.end417
  br label %for.inc468

if.end423:                                        ; preds = %cond.end417, %land.lhs.true398, %for.body394
  %201 = load i32, i32* %flags.addr, align 4
  %and424 = and i32 %201, 32
  %tobool425 = icmp ne i32 %and424, 0
  br i1 %tobool425, label %land.lhs.true426, label %if.end461

land.lhs.true426:                                 ; preds = %if.end423
  %202 = load i8*, i8** %p, align 4
  %arrayidx427 = getelementptr inbounds i8, i8* %202, i32 1
  %203 = load i8, i8* %arrayidx427, align 1
  %conv428 = zext i8 %203 to i32
  %cmp429 = icmp ne i32 %conv428, 40
  br i1 %cmp429, label %land.lhs.true431, label %if.end461

land.lhs.true431:                                 ; preds = %land.lhs.true426
  %204 = load i8*, i8** %p, align 4
  %205 = load i8, i8* %204, align 1
  %conv432 = zext i8 %205 to i32
  %call433 = call i8* @strchr(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %conv432)
  %cmp434 = icmp eq i8* %call433, null
  br i1 %cmp434, label %land.lhs.true436, label %if.end461

land.lhs.true436:                                 ; preds = %land.lhs.true431
  %206 = load i32, i32* %c, align 4
  %cmp437 = icmp ne i32 %206, 91
  br i1 %cmp437, label %land.lhs.true439, label %if.end461

land.lhs.true439:                                 ; preds = %land.lhs.true436
  %207 = load i32, i32* %flags.addr, align 4
  %and440 = and i32 %207, 16
  %tobool441 = icmp ne i32 %and440, 0
  br i1 %tobool441, label %cond.true442, label %cond.false453

cond.true442:                                     ; preds = %land.lhs.true439
  %208 = load i8*, i8** %n, align 4
  %209 = load i8, i8* %208, align 1
  %conv443 = zext i8 %209 to i32
  %call444 = call i32 @isupper(i32 %conv443) #4
  %tobool445 = icmp ne i32 %call444, 0
  br i1 %tobool445, label %cond.true446, label %cond.false449

cond.true446:                                     ; preds = %cond.true442
  %210 = load i8*, i8** %n, align 4
  %211 = load i8, i8* %210, align 1
  %conv447 = zext i8 %211 to i32
  %call448 = call i32 @tolower(i32 %conv447) #4
  br label %cond.end451

cond.false449:                                    ; preds = %cond.true442
  %212 = load i8*, i8** %n, align 4
  %213 = load i8, i8* %212, align 1
  %conv450 = zext i8 %213 to i32
  br label %cond.end451

cond.end451:                                      ; preds = %cond.false449, %cond.true446
  %cond452 = phi i32 [ %call448, %cond.true446 ], [ %conv450, %cond.false449 ]
  br label %cond.end455

cond.false453:                                    ; preds = %land.lhs.true439
  %214 = load i8*, i8** %n, align 4
  %215 = load i8, i8* %214, align 1
  %conv454 = zext i8 %215 to i32
  br label %cond.end455

cond.end455:                                      ; preds = %cond.false453, %cond.end451
  %cond456 = phi i32 [ %cond452, %cond.end451 ], [ %conv454, %cond.false453 ]
  %216 = load i8, i8* %c1, align 1
  %conv457 = zext i8 %216 to i32
  %cmp458 = icmp ne i32 %cond456, %conv457
  br i1 %cmp458, label %if.then460, label %if.end461

if.then460:                                       ; preds = %cond.end455
  br label %for.inc468

if.end461:                                        ; preds = %cond.end455, %land.lhs.true436, %land.lhs.true431, %land.lhs.true426, %if.end423
  %217 = load i8*, i8** %n, align 4
  %218 = load i8*, i8** %se.addr, align 4
  %219 = load i8*, i8** %p, align 4
  %220 = load i8*, i8** %pe.addr, align 4
  %221 = load i32, i32* %flags.addr, align 4
  %and462 = and i32 %221, -5
  %call463 = call i32 @gmatch(i8* %217, i8* %218, i8* %219, i8* %220, i32 %and462)
  %cmp464 = icmp eq i32 %call463, 0
  br i1 %cmp464, label %if.then466, label %if.end467

if.then466:                                       ; preds = %if.end461
  store i32 0, i32* %retval, align 4
  br label %return

if.end467:                                        ; preds = %if.end461
  br label %for.inc468

for.inc468:                                       ; preds = %if.end467, %if.then460, %if.then422
  %222 = load i8*, i8** %n, align 4
  %incdec.ptr469 = getelementptr inbounds i8, i8* %222, i32 1
  store i8* %incdec.ptr469, i8** %n, align 4
  br label %for.cond391

for.end470:                                       ; preds = %for.cond391
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb471:                                         ; preds = %if.end53
  %223 = load i32, i32* %sc, align 4
  %cmp472 = icmp eq i32 %223, 0
  br i1 %cmp472, label %if.then477, label %lor.lhs.false474

lor.lhs.false474:                                 ; preds = %sw.bb471
  %224 = load i8*, i8** %n, align 4
  %225 = load i8*, i8** %se.addr, align 4
  %cmp475 = icmp eq i8* %224, %225
  br i1 %cmp475, label %if.then477, label %if.end478

if.then477:                                       ; preds = %lor.lhs.false474, %sw.bb471
  store i32 1, i32* %retval, align 4
  br label %return

if.end478:                                        ; preds = %lor.lhs.false474
  %226 = load i32, i32* %flags.addr, align 4
  %and479 = and i32 %226, 4
  %tobool480 = icmp ne i32 %and479, 0
  br i1 %tobool480, label %land.lhs.true481, label %if.end496

land.lhs.true481:                                 ; preds = %if.end478
  %227 = load i32, i32* %sc, align 4
  %cmp482 = icmp eq i32 %227, 46
  br i1 %cmp482, label %land.lhs.true484, label %if.end496

land.lhs.true484:                                 ; preds = %land.lhs.true481
  %228 = load i8*, i8** %n, align 4
  %229 = load i8*, i8** %string.addr, align 4
  %cmp485 = icmp eq i8* %228, %229
  br i1 %cmp485, label %if.then495, label %lor.lhs.false487

lor.lhs.false487:                                 ; preds = %land.lhs.true484
  %230 = load i32, i32* %flags.addr, align 4
  %and488 = and i32 %230, 1
  %tobool489 = icmp ne i32 %and488, 0
  br i1 %tobool489, label %land.lhs.true490, label %if.end496

land.lhs.true490:                                 ; preds = %lor.lhs.false487
  %231 = load i8*, i8** %n, align 4
  %arrayidx491 = getelementptr inbounds i8, i8* %231, i32 -1
  %232 = load i8, i8* %arrayidx491, align 1
  %conv492 = zext i8 %232 to i32
  %cmp493 = icmp eq i32 %conv492, 47
  br i1 %cmp493, label %if.then495, label %if.end496

if.then495:                                       ; preds = %land.lhs.true490, %land.lhs.true484
  store i32 1, i32* %retval, align 4
  br label %return

if.end496:                                        ; preds = %land.lhs.true490, %lor.lhs.false487, %land.lhs.true481, %if.end478
  %233 = load i8*, i8** %p, align 4
  %234 = load i32, i32* %sc, align 4
  %conv497 = trunc i32 %234 to i8
  %235 = load i32, i32* %flags.addr, align 4
  %call498 = call i8* @brackmatch(i8* %233, i8 zeroext %conv497, i32 %235)
  store i8* %call498, i8** %p, align 4
  %236 = load i8*, i8** %p, align 4
  %cmp499 = icmp eq i8* %236, null
  br i1 %cmp499, label %if.then501, label %if.end502

if.then501:                                       ; preds = %if.end496
  store i32 1, i32* %retval, align 4
  br label %return

if.end502:                                        ; preds = %if.end496
  br label %sw.epilog

sw.default:                                       ; preds = %if.end53
  %237 = load i32, i32* %c, align 4
  %conv503 = trunc i32 %237 to i8
  %conv504 = zext i8 %conv503 to i32
  %238 = load i32, i32* %flags.addr, align 4
  %and505 = and i32 %238, 16
  %tobool506 = icmp ne i32 %and505, 0
  br i1 %tobool506, label %cond.true507, label %cond.false521

cond.true507:                                     ; preds = %sw.default
  %239 = load i32, i32* %sc, align 4
  %conv508 = trunc i32 %239 to i8
  %conv509 = zext i8 %conv508 to i32
  %call510 = call i32 @isupper(i32 %conv509) #4
  %tobool511 = icmp ne i32 %call510, 0
  br i1 %tobool511, label %cond.true512, label %cond.false516

cond.true512:                                     ; preds = %cond.true507
  %240 = load i32, i32* %sc, align 4
  %conv513 = trunc i32 %240 to i8
  %conv514 = zext i8 %conv513 to i32
  %call515 = call i32 @tolower(i32 %conv514) #4
  br label %cond.end519

cond.false516:                                    ; preds = %cond.true507
  %241 = load i32, i32* %sc, align 4
  %conv517 = trunc i32 %241 to i8
  %conv518 = zext i8 %conv517 to i32
  br label %cond.end519

cond.end519:                                      ; preds = %cond.false516, %cond.true512
  %cond520 = phi i32 [ %call515, %cond.true512 ], [ %conv518, %cond.false516 ]
  br label %cond.end524

cond.false521:                                    ; preds = %sw.default
  %242 = load i32, i32* %sc, align 4
  %conv522 = trunc i32 %242 to i8
  %conv523 = zext i8 %conv522 to i32
  br label %cond.end524

cond.end524:                                      ; preds = %cond.false521, %cond.end519
  %cond525 = phi i32 [ %cond520, %cond.end519 ], [ %conv523, %cond.false521 ]
  %cmp526 = icmp ne i32 %conv504, %cond525
  br i1 %cmp526, label %if.then528, label %if.end529

if.then528:                                       ; preds = %cond.end524
  store i32 1, i32* %retval, align 4
  br label %return

if.end529:                                        ; preds = %cond.end524
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end529, %if.end502, %if.end146, %if.end82
  %243 = load i8*, i8** %n, align 4
  %incdec.ptr530 = getelementptr inbounds i8, i8* %243, i32 1
  store i8* %incdec.ptr530, i8** %n, align 4
  br label %while.cond

while.end531:                                     ; preds = %while.cond
  %244 = load i8*, i8** %n, align 4
  %245 = load i8*, i8** %se.addr, align 4
  %cmp532 = icmp eq i8* %244, %245
  br i1 %cmp532, label %if.then534, label %if.end535

if.then534:                                       ; preds = %while.end531
  store i32 0, i32* %retval, align 4
  br label %return

if.end535:                                        ; preds = %while.end531
  %246 = load i32, i32* %flags.addr, align 4
  %and536 = and i32 %246, 8
  %tobool537 = icmp ne i32 %and536, 0
  br i1 %tobool537, label %land.lhs.true538, label %if.end543

land.lhs.true538:                                 ; preds = %if.end535
  %247 = load i8*, i8** %n, align 4
  %248 = load i8, i8* %247, align 1
  %conv539 = zext i8 %248 to i32
  %cmp540 = icmp eq i32 %conv539, 47
  br i1 %cmp540, label %if.then542, label %if.end543

if.then542:                                       ; preds = %land.lhs.true538
  store i32 0, i32* %retval, align 4
  br label %return

if.end543:                                        ; preds = %land.lhs.true538, %if.end535
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end543, %if.then542, %if.then534, %if.then528, %if.then501, %if.then495, %if.then477, %for.end470, %if.then466, %if.end347, %if.then346, %if.end316, %if.then312, %if.then290, %if.end280, %if.then241, %if.then210, %if.then196, %if.then181, %if.then168, %if.then164, %if.then145, %if.then96, %if.then86, %if.then79, %if.then62, %if.then56, %cond.end50, %if.then
  %249 = load i32, i32* %retval, align 4
  ret i32 %249
}

; Function Attrs: noinline nounwind
define i8* @glob_patscan(i8* %string, i8* %end, i32 %delim) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %end.addr = alloca i8*, align 4
  %delim.addr = alloca i32, align 4
  %pnest = alloca i32, align 4
  %bnest = alloca i32, align 4
  %skip = alloca i32, align 4
  %cchar = alloca i32, align 4
  %s = alloca i8*, align 4
  %c = alloca i8, align 1
  %bfirst = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %end, i8** %end.addr, align 4
  store i32 %delim, i32* %delim.addr, align 4
  store i32 0, i32* %skip, align 4
  store i32 0, i32* %bnest, align 4
  store i32 0, i32* %pnest, align 4
  store i32 0, i32* %cchar, align 4
  store i8* null, i8** %bfirst, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i8*, i8** %end.addr, align 4
  %cmp = icmp eq i8* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  store i8* %2, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8*, i8** %s, align 4
  %4 = load i8, i8* %3, align 1
  store i8 %4, i8* %c, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %s, align 4
  %6 = load i8*, i8** %end.addr, align 4
  %cmp1 = icmp uge i8* %5, %6
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.body
  %7 = load i8*, i8** %s, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %for.body
  %8 = load i32, i32* %skip, align 4
  %tobool4 = icmp ne i32 %8, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  store i32 0, i32* %skip, align 4
  br label %for.inc

if.end6:                                          ; preds = %if.end3
  %9 = load i8, i8* %c, align 1
  %conv = zext i8 %9 to i32
  switch i32 %conv, label %sw.epilog [
    i32 92, label %sw.bb
    i32 0, label %sw.bb7
    i32 91, label %sw.bb8
    i32 93, label %sw.bb38
    i32 40, label %sw.bb54
    i32 41, label %sw.bb60
    i32 124, label %sw.bb70
  ]

sw.bb:                                            ; preds = %if.end6
  store i32 1, i32* %skip, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %if.end6
  store i8* null, i8** %retval, align 4
  br label %return

sw.bb8:                                           ; preds = %if.end6
  %10 = load i32, i32* %bnest, align 4
  %cmp9 = icmp eq i32 %10, 0
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %sw.bb8
  %11 = load i8*, i8** %s, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %add.ptr, i8** %bfirst, align 4
  %12 = load i8*, i8** %bfirst, align 4
  %13 = load i8, i8* %12, align 1
  %conv12 = zext i8 %13 to i32
  %cmp13 = icmp eq i32 %conv12, 33
  br i1 %cmp13, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then11
  %14 = load i8*, i8** %bfirst, align 4
  %15 = load i8, i8* %14, align 1
  %conv15 = zext i8 %15 to i32
  %cmp16 = icmp eq i32 %conv15, 94
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false, %if.then11
  %16 = load i8*, i8** %bfirst, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr, i8** %bfirst, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %lor.lhs.false
  %17 = load i32, i32* %bnest, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %bnest, align 4
  br label %if.end37

if.else:                                          ; preds = %sw.bb8
  %18 = load i8*, i8** %s, align 4
  %arrayidx = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx, align 1
  %conv20 = zext i8 %19 to i32
  %cmp21 = icmp eq i32 %conv20, 58
  br i1 %cmp21, label %if.then33, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %if.else
  %20 = load i8*, i8** %s, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %20, i32 1
  %21 = load i8, i8* %arrayidx24, align 1
  %conv25 = zext i8 %21 to i32
  %cmp26 = icmp eq i32 %conv25, 46
  br i1 %cmp26, label %if.then33, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %lor.lhs.false23
  %22 = load i8*, i8** %s, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx29, align 1
  %conv30 = zext i8 %23 to i32
  %cmp31 = icmp eq i32 %conv30, 61
  br i1 %cmp31, label %if.then33, label %if.end36

if.then33:                                        ; preds = %lor.lhs.false28, %lor.lhs.false23, %if.else
  %24 = load i8*, i8** %s, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %24, i32 1
  %25 = load i8, i8* %arrayidx34, align 1
  %conv35 = zext i8 %25 to i32
  store i32 %conv35, i32* %cchar, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then33, %lor.lhs.false28
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.end19
  br label %sw.epilog

sw.bb38:                                          ; preds = %if.end6
  %26 = load i32, i32* %bnest, align 4
  %tobool39 = icmp ne i32 %26, 0
  br i1 %tobool39, label %if.then40, label %if.end53

if.then40:                                        ; preds = %sw.bb38
  %27 = load i32, i32* %cchar, align 4
  %tobool41 = icmp ne i32 %27, 0
  br i1 %tobool41, label %land.lhs.true, label %if.else47

land.lhs.true:                                    ; preds = %if.then40
  %28 = load i8*, i8** %s, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %28, i32 -1
  %29 = load i8, i8* %arrayidx42, align 1
  %conv43 = zext i8 %29 to i32
  %30 = load i32, i32* %cchar, align 4
  %cmp44 = icmp eq i32 %conv43, %30
  br i1 %cmp44, label %if.then46, label %if.else47

if.then46:                                        ; preds = %land.lhs.true
  store i32 0, i32* %cchar, align 4
  br label %if.end52

if.else47:                                        ; preds = %land.lhs.true, %if.then40
  %31 = load i8*, i8** %s, align 4
  %32 = load i8*, i8** %bfirst, align 4
  %cmp48 = icmp ne i8* %31, %32
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.else47
  %33 = load i32, i32* %bnest, align 4
  %dec = add nsw i32 %33, -1
  store i32 %dec, i32* %bnest, align 4
  store i8* null, i8** %bfirst, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %if.else47
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then46
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %sw.bb38
  br label %sw.epilog

sw.bb54:                                          ; preds = %if.end6
  %34 = load i32, i32* %bnest, align 4
  %cmp55 = icmp eq i32 %34, 0
  br i1 %cmp55, label %if.then57, label %if.end59

if.then57:                                        ; preds = %sw.bb54
  %35 = load i32, i32* %pnest, align 4
  %inc58 = add nsw i32 %35, 1
  store i32 %inc58, i32* %pnest, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then57, %sw.bb54
  br label %sw.epilog

sw.bb60:                                          ; preds = %if.end6
  %36 = load i32, i32* %bnest, align 4
  %cmp61 = icmp eq i32 %36, 0
  br i1 %cmp61, label %land.lhs.true63, label %if.end69

land.lhs.true63:                                  ; preds = %sw.bb60
  %37 = load i32, i32* %pnest, align 4
  %dec64 = add nsw i32 %37, -1
  store i32 %dec64, i32* %pnest, align 4
  %cmp65 = icmp sle i32 %37, 0
  br i1 %cmp65, label %if.then67, label %if.end69

if.then67:                                        ; preds = %land.lhs.true63
  %38 = load i8*, i8** %s, align 4
  %incdec.ptr68 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr68, i8** %s, align 4
  store i8* %incdec.ptr68, i8** %retval, align 4
  br label %return

if.end69:                                         ; preds = %land.lhs.true63, %sw.bb60
  br label %sw.epilog

sw.bb70:                                          ; preds = %if.end6
  %39 = load i32, i32* %bnest, align 4
  %cmp71 = icmp eq i32 %39, 0
  br i1 %cmp71, label %land.lhs.true73, label %if.end81

land.lhs.true73:                                  ; preds = %sw.bb70
  %40 = load i32, i32* %pnest, align 4
  %cmp74 = icmp eq i32 %40, 0
  br i1 %cmp74, label %land.lhs.true76, label %if.end81

land.lhs.true76:                                  ; preds = %land.lhs.true73
  %41 = load i32, i32* %delim.addr, align 4
  %cmp77 = icmp eq i32 %41, 124
  br i1 %cmp77, label %if.then79, label %if.end81

if.then79:                                        ; preds = %land.lhs.true76
  %42 = load i8*, i8** %s, align 4
  %incdec.ptr80 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr80, i8** %s, align 4
  store i8* %incdec.ptr80, i8** %retval, align 4
  br label %return

if.end81:                                         ; preds = %land.lhs.true76, %land.lhs.true73, %sw.bb70
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end6, %if.end81, %if.end69, %if.end59, %if.end53, %if.end37, %sw.bb
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog, %if.then5
  %43 = load i8*, i8** %s, align 4
  %incdec.ptr82 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %incdec.ptr82, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then79, %if.then67, %sw.bb7, %if.then2, %if.then
  %44 = load i8*, i8** %retval, align 4
  ret i8* %44
}

; Function Attrs: noinline nounwind
define i32 @internal_wstrmatch(i32* %pattern, i32* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i32*, align 4
  %string.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  %se = alloca i32*, align 4
  %pe = alloca i32*, align 4
  store i32* %pattern, i32** %pattern.addr, align 4
  store i32* %string, i32** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %string.addr, align 4
  %cmp = icmp eq i32* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32*, i32** %pattern.addr, align 4
  %cmp1 = icmp eq i32* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32*, i32** %string.addr, align 4
  %3 = load i32*, i32** %string.addr, align 4
  %call = call i32 @wcslen(i32* %3)
  %add.ptr = getelementptr inbounds i32, i32* %2, i32 %call
  store i32* %add.ptr, i32** %se, align 4
  %4 = load i32*, i32** %pattern.addr, align 4
  %5 = load i32*, i32** %pattern.addr, align 4
  %call2 = call i32 @wcslen(i32* %5)
  %add.ptr3 = getelementptr inbounds i32, i32* %4, i32 %call2
  store i32* %add.ptr3, i32** %pe, align 4
  %6 = load i32*, i32** %string.addr, align 4
  %7 = load i32*, i32** %se, align 4
  %8 = load i32*, i32** %pattern.addr, align 4
  %9 = load i32*, i32** %pe, align 4
  %10 = load i32, i32* %flags.addr, align 4
  %call4 = call i32 @gmatch_wc(i32* %6, i32* %7, i32* %8, i32* %9, i32 %10)
  store i32 %call4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare i32 @wcslen(i32*) #1

; Function Attrs: noinline nounwind
define internal i32 @gmatch_wc(i32* %string, i32* %se, i32* %pattern, i32* %pe, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i32*, align 4
  %se.addr = alloca i32*, align 4
  %pattern.addr = alloca i32*, align 4
  %pe.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca i32*, align 4
  %n = alloca i32*, align 4
  %c = alloca i32, align 4
  %sc = alloca i32, align 4
  %lflags = alloca i32, align 4
  %newn = alloca i32*, align 4
  %newn157 = alloca i32*, align 4
  %r = alloca i32, align 4
  %c1 = alloca i32, align 4
  %endp = alloca i32*, align 4
  store i32* %string, i32** %string.addr, align 4
  store i32* %se, i32** %se.addr, align 4
  store i32* %pattern, i32** %pattern.addr, align 4
  store i32* %pe, i32** %pe.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %pattern.addr, align 4
  store i32* %0, i32** %p, align 4
  %1 = load i32*, i32** %string.addr, align 4
  store i32* %1, i32** %n, align 4
  %2 = load i32*, i32** %string.addr, align 4
  %cmp = icmp eq i32* %2, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32*, i32** %pattern.addr, align 4
  %cmp1 = icmp eq i32* %3, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %4 = load i32*, i32** %p, align 4
  %5 = load i32*, i32** %pe.addr, align 4
  %cmp2 = icmp ult i32* %4, %5
  br i1 %cmp2, label %while.body, label %while.end368

while.body:                                       ; preds = %while.cond
  %6 = load i32*, i32** %p, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %p, align 4
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %c, align 4
  %8 = load i32, i32* %flags.addr, align 4
  %and = and i32 %8, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %while.body
  %9 = load i32, i32* %c, align 4
  %call = call i32 @iswupper(i32 %9)
  %tobool3 = icmp ne i32 %call, 0
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load i32, i32* %c, align 4
  %call4 = call i32 @towlower(i32 %10)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %while.body
  %11 = load i32, i32* %c, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call4, %cond.true ], [ %11, %cond.false ]
  store i32 %cond, i32* %c, align 4
  %12 = load i32*, i32** %n, align 4
  %13 = load i32*, i32** %se.addr, align 4
  %cmp5 = icmp ult i32* %12, %13
  br i1 %cmp5, label %cond.true6, label %cond.false7

cond.true6:                                       ; preds = %cond.end
  %14 = load i32*, i32** %n, align 4
  %15 = load i32, i32* %14, align 4
  br label %cond.end8

cond.false7:                                      ; preds = %cond.end
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false7, %cond.true6
  %cond9 = phi i32 [ %15, %cond.true6 ], [ 0, %cond.false7 ]
  store i32 %cond9, i32* %sc, align 4
  %16 = load i32, i32* %flags.addr, align 4
  %and10 = and i32 %16, 32
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %land.lhs.true12, label %if.end32

land.lhs.true12:                                  ; preds = %cond.end8
  %17 = load i32*, i32** %p, align 4
  %18 = load i32, i32* %17, align 4
  %cmp13 = icmp eq i32 %18, 40
  br i1 %cmp13, label %land.lhs.true14, label %if.end32

land.lhs.true14:                                  ; preds = %land.lhs.true12
  %19 = load i32, i32* %c, align 4
  %cmp15 = icmp eq i32 %19, 43
  br i1 %cmp15, label %if.then24, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %land.lhs.true14
  %20 = load i32, i32* %c, align 4
  %cmp17 = icmp eq i32 %20, 42
  br i1 %cmp17, label %if.then24, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false16
  %21 = load i32, i32* %c, align 4
  %cmp19 = icmp eq i32 %21, 63
  br i1 %cmp19, label %if.then24, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false18
  %22 = load i32, i32* %c, align 4
  %cmp21 = icmp eq i32 %22, 64
  br i1 %cmp21, label %if.then24, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false20
  %23 = load i32, i32* %c, align 4
  %cmp23 = icmp eq i32 %23, 33
  br i1 %cmp23, label %if.then24, label %if.end32

if.then24:                                        ; preds = %lor.lhs.false22, %lor.lhs.false20, %lor.lhs.false18, %lor.lhs.false16, %land.lhs.true14
  %24 = load i32*, i32** %n, align 4
  %25 = load i32*, i32** %string.addr, align 4
  %cmp25 = icmp eq i32* %24, %25
  br i1 %cmp25, label %cond.true26, label %cond.false27

cond.true26:                                      ; preds = %if.then24
  %26 = load i32, i32* %flags.addr, align 4
  br label %cond.end29

cond.false27:                                     ; preds = %if.then24
  %27 = load i32, i32* %flags.addr, align 4
  %and28 = and i32 %27, -5
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false27, %cond.true26
  %cond30 = phi i32 [ %26, %cond.true26 ], [ %and28, %cond.false27 ]
  store i32 %cond30, i32* %lflags, align 4
  %28 = load i32, i32* %c, align 4
  %29 = load i32*, i32** %n, align 4
  %30 = load i32*, i32** %se.addr, align 4
  %31 = load i32*, i32** %p, align 4
  %32 = load i32*, i32** %pe.addr, align 4
  %33 = load i32, i32* %lflags, align 4
  %call31 = call i32 @extmatch_wc(i32 %28, i32* %29, i32* %30, i32* %31, i32* %32, i32 %33)
  store i32 %call31, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %lor.lhs.false22, %land.lhs.true12, %cond.end8
  %34 = load i32, i32* %c, align 4
  switch i32 %34, label %sw.default [
    i32 63, label %sw.bb
    i32 92, label %sw.bb56
    i32 42, label %sw.bb91
    i32 91, label %sw.bb330
  ]

sw.bb:                                            ; preds = %if.end32
  %35 = load i32, i32* %sc, align 4
  %cmp33 = icmp eq i32 %35, 0
  br i1 %cmp33, label %if.then34, label %if.else

if.then34:                                        ; preds = %sw.bb
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %sw.bb
  %36 = load i32, i32* %flags.addr, align 4
  %and35 = and i32 %36, 1
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %land.lhs.true37, label %if.else40

land.lhs.true37:                                  ; preds = %if.else
  %37 = load i32, i32* %sc, align 4
  %cmp38 = icmp eq i32 %37, 47
  br i1 %cmp38, label %if.then39, label %if.else40

if.then39:                                        ; preds = %land.lhs.true37
  store i32 1, i32* %retval, align 4
  br label %return

if.else40:                                        ; preds = %land.lhs.true37, %if.else
  %38 = load i32, i32* %flags.addr, align 4
  %and41 = and i32 %38, 4
  %tobool42 = icmp ne i32 %and41, 0
  br i1 %tobool42, label %land.lhs.true43, label %if.end53

land.lhs.true43:                                  ; preds = %if.else40
  %39 = load i32, i32* %sc, align 4
  %cmp44 = icmp eq i32 %39, 46
  br i1 %cmp44, label %land.lhs.true45, label %if.end53

land.lhs.true45:                                  ; preds = %land.lhs.true43
  %40 = load i32*, i32** %n, align 4
  %41 = load i32*, i32** %string.addr, align 4
  %cmp46 = icmp eq i32* %40, %41
  br i1 %cmp46, label %if.then52, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %land.lhs.true45
  %42 = load i32, i32* %flags.addr, align 4
  %and48 = and i32 %42, 1
  %tobool49 = icmp ne i32 %and48, 0
  br i1 %tobool49, label %land.lhs.true50, label %if.end53

land.lhs.true50:                                  ; preds = %lor.lhs.false47
  %43 = load i32*, i32** %n, align 4
  %arrayidx = getelementptr inbounds i32, i32* %43, i32 -1
  %44 = load i32, i32* %arrayidx, align 4
  %cmp51 = icmp eq i32 %44, 47
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %land.lhs.true50, %land.lhs.true45
  store i32 1, i32* %retval, align 4
  br label %return

if.end53:                                         ; preds = %land.lhs.true50, %lor.lhs.false47, %land.lhs.true43, %if.else40
  br label %if.end54

if.end54:                                         ; preds = %if.end53
  br label %if.end55

if.end55:                                         ; preds = %if.end54
  br label %sw.epilog

sw.bb56:                                          ; preds = %if.end32
  %45 = load i32*, i32** %p, align 4
  %46 = load i32*, i32** %pe.addr, align 4
  %cmp57 = icmp eq i32* %45, %46
  br i1 %cmp57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %sw.bb56
  store i32 1, i32* %retval, align 4
  br label %return

if.end59:                                         ; preds = %sw.bb56
  %47 = load i32, i32* %flags.addr, align 4
  %and60 = and i32 %47, 2
  %cmp61 = icmp eq i32 %and60, 0
  br i1 %cmp61, label %if.then62, label %if.end77

if.then62:                                        ; preds = %if.end59
  %48 = load i32*, i32** %p, align 4
  %incdec.ptr63 = getelementptr inbounds i32, i32* %48, i32 1
  store i32* %incdec.ptr63, i32** %p, align 4
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %c, align 4
  %50 = load i32*, i32** %p, align 4
  %51 = load i32*, i32** %pe.addr, align 4
  %cmp64 = icmp ugt i32* %50, %51
  br i1 %cmp64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.then62
  store i32 1, i32* %retval, align 4
  br label %return

if.end66:                                         ; preds = %if.then62
  %52 = load i32, i32* %flags.addr, align 4
  %and67 = and i32 %52, 16
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %land.lhs.true69, label %cond.false74

land.lhs.true69:                                  ; preds = %if.end66
  %53 = load i32, i32* %c, align 4
  %call70 = call i32 @iswupper(i32 %53)
  %tobool71 = icmp ne i32 %call70, 0
  br i1 %tobool71, label %cond.true72, label %cond.false74

cond.true72:                                      ; preds = %land.lhs.true69
  %54 = load i32, i32* %c, align 4
  %call73 = call i32 @towlower(i32 %54)
  br label %cond.end75

cond.false74:                                     ; preds = %land.lhs.true69, %if.end66
  %55 = load i32, i32* %c, align 4
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false74, %cond.true72
  %cond76 = phi i32 [ %call73, %cond.true72 ], [ %55, %cond.false74 ]
  store i32 %cond76, i32* %c, align 4
  br label %if.end77

if.end77:                                         ; preds = %cond.end75, %if.end59
  %56 = load i32, i32* %flags.addr, align 4
  %and78 = and i32 %56, 16
  %tobool79 = icmp ne i32 %and78, 0
  br i1 %tobool79, label %land.lhs.true80, label %cond.false85

land.lhs.true80:                                  ; preds = %if.end77
  %57 = load i32, i32* %sc, align 4
  %call81 = call i32 @iswupper(i32 %57)
  %tobool82 = icmp ne i32 %call81, 0
  br i1 %tobool82, label %cond.true83, label %cond.false85

cond.true83:                                      ; preds = %land.lhs.true80
  %58 = load i32, i32* %sc, align 4
  %call84 = call i32 @towlower(i32 %58)
  br label %cond.end86

cond.false85:                                     ; preds = %land.lhs.true80, %if.end77
  %59 = load i32, i32* %sc, align 4
  br label %cond.end86

cond.end86:                                       ; preds = %cond.false85, %cond.true83
  %cond87 = phi i32 [ %call84, %cond.true83 ], [ %59, %cond.false85 ]
  %60 = load i32, i32* %c, align 4
  %cmp88 = icmp ne i32 %cond87, %60
  br i1 %cmp88, label %if.then89, label %if.end90

if.then89:                                        ; preds = %cond.end86
  store i32 1, i32* %retval, align 4
  br label %return

if.end90:                                         ; preds = %cond.end86
  br label %sw.epilog

sw.bb91:                                          ; preds = %if.end32
  %61 = load i32, i32* %flags.addr, align 4
  %and92 = and i32 %61, 4
  %tobool93 = icmp ne i32 %and92, 0
  br i1 %tobool93, label %land.lhs.true94, label %if.end105

land.lhs.true94:                                  ; preds = %sw.bb91
  %62 = load i32, i32* %sc, align 4
  %cmp95 = icmp eq i32 %62, 46
  br i1 %cmp95, label %land.lhs.true96, label %if.end105

land.lhs.true96:                                  ; preds = %land.lhs.true94
  %63 = load i32*, i32** %n, align 4
  %64 = load i32*, i32** %string.addr, align 4
  %cmp97 = icmp eq i32* %63, %64
  br i1 %cmp97, label %if.then104, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %land.lhs.true96
  %65 = load i32, i32* %flags.addr, align 4
  %and99 = and i32 %65, 1
  %tobool100 = icmp ne i32 %and99, 0
  br i1 %tobool100, label %land.lhs.true101, label %if.end105

land.lhs.true101:                                 ; preds = %lor.lhs.false98
  %66 = load i32*, i32** %n, align 4
  %arrayidx102 = getelementptr inbounds i32, i32* %66, i32 -1
  %67 = load i32, i32* %arrayidx102, align 4
  %cmp103 = icmp eq i32 %67, 47
  br i1 %cmp103, label %if.then104, label %if.end105

if.then104:                                       ; preds = %land.lhs.true101, %land.lhs.true96
  store i32 1, i32* %retval, align 4
  br label %return

if.end105:                                        ; preds = %land.lhs.true101, %lor.lhs.false98, %land.lhs.true94, %sw.bb91
  %68 = load i32*, i32** %p, align 4
  %69 = load i32*, i32** %pe.addr, align 4
  %cmp106 = icmp eq i32* %68, %69
  br i1 %cmp106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end105
  store i32 0, i32* %retval, align 4
  br label %return

if.end108:                                        ; preds = %if.end105
  %70 = load i32*, i32** %p, align 4
  %incdec.ptr109 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %incdec.ptr109, i32** %p, align 4
  %71 = load i32, i32* %70, align 4
  store i32 %71, i32* %c, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc177, %if.end108
  %72 = load i32, i32* %c, align 4
  %cmp110 = icmp eq i32 %72, 63
  br i1 %cmp110, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.cond
  %73 = load i32, i32* %c, align 4
  %cmp111 = icmp eq i32 %73, 42
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %74 = phi i1 [ true, %for.cond ], [ %cmp111, %lor.rhs ]
  br i1 %74, label %for.body, label %for.end179

for.body:                                         ; preds = %lor.end
  %75 = load i32, i32* %flags.addr, align 4
  %and112 = and i32 %75, 1
  %tobool113 = icmp ne i32 %and112, 0
  br i1 %tobool113, label %land.lhs.true114, label %if.else117

land.lhs.true114:                                 ; preds = %for.body
  %76 = load i32, i32* %sc, align 4
  %cmp115 = icmp eq i32 %76, 47
  br i1 %cmp115, label %if.then116, label %if.else117

if.then116:                                       ; preds = %land.lhs.true114
  store i32 1, i32* %retval, align 4
  br label %return

if.else117:                                       ; preds = %land.lhs.true114, %for.body
  %77 = load i32, i32* %flags.addr, align 4
  %and118 = and i32 %77, 32
  %tobool119 = icmp ne i32 %and118, 0
  br i1 %tobool119, label %land.lhs.true120, label %if.else135

land.lhs.true120:                                 ; preds = %if.else117
  %78 = load i32, i32* %c, align 4
  %cmp121 = icmp eq i32 %78, 63
  br i1 %cmp121, label %land.lhs.true122, label %if.else135

land.lhs.true122:                                 ; preds = %land.lhs.true120
  %79 = load i32*, i32** %p, align 4
  %80 = load i32, i32* %79, align 4
  %cmp123 = icmp eq i32 %80, 40
  br i1 %cmp123, label %if.then124, label %if.else135

if.then124:                                       ; preds = %land.lhs.true122
  %81 = load i32, i32* %c, align 4
  %82 = load i32*, i32** %n, align 4
  %83 = load i32*, i32** %se.addr, align 4
  %84 = load i32*, i32** %p, align 4
  %85 = load i32*, i32** %pe.addr, align 4
  %86 = load i32, i32* %flags.addr, align 4
  %call125 = call i32 @extmatch_wc(i32 %81, i32* %82, i32* %83, i32* %84, i32* %85, i32 %86)
  %cmp126 = icmp eq i32 %call125, 0
  br i1 %cmp126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.then124
  store i32 0, i32* %retval, align 4
  br label %return

if.end128:                                        ; preds = %if.then124
  %87 = load i32*, i32** %p, align 4
  %add.ptr = getelementptr inbounds i32, i32* %87, i32 1
  %88 = load i32*, i32** %pe.addr, align 4
  %call129 = call i32* @glob_patscan_wc(i32* %add.ptr, i32* %88, i32 0)
  store i32* %call129, i32** %newn, align 4
  %89 = load i32*, i32** %newn, align 4
  %tobool130 = icmp ne i32* %89, null
  br i1 %tobool130, label %cond.true131, label %cond.false132

cond.true131:                                     ; preds = %if.end128
  %90 = load i32*, i32** %newn, align 4
  br label %cond.end133

cond.false132:                                    ; preds = %if.end128
  %91 = load i32*, i32** %pe.addr, align 4
  br label %cond.end133

cond.end133:                                      ; preds = %cond.false132, %cond.true131
  %cond134 = phi i32* [ %90, %cond.true131 ], [ %91, %cond.false132 ]
  store i32* %cond134, i32** %p, align 4
  br label %if.end148

if.else135:                                       ; preds = %land.lhs.true122, %land.lhs.true120, %if.else117
  %92 = load i32, i32* %c, align 4
  %cmp136 = icmp eq i32 %92, 63
  br i1 %cmp136, label %if.then137, label %if.end147

if.then137:                                       ; preds = %if.else135
  %93 = load i32, i32* %sc, align 4
  %cmp138 = icmp eq i32 %93, 0
  br i1 %cmp138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.then137
  store i32 1, i32* %retval, align 4
  br label %return

if.end140:                                        ; preds = %if.then137
  %94 = load i32*, i32** %n, align 4
  %incdec.ptr141 = getelementptr inbounds i32, i32* %94, i32 1
  store i32* %incdec.ptr141, i32** %n, align 4
  %95 = load i32*, i32** %n, align 4
  %96 = load i32*, i32** %se.addr, align 4
  %cmp142 = icmp ult i32* %95, %96
  br i1 %cmp142, label %cond.true143, label %cond.false144

cond.true143:                                     ; preds = %if.end140
  %97 = load i32*, i32** %n, align 4
  %98 = load i32, i32* %97, align 4
  br label %cond.end145

cond.false144:                                    ; preds = %if.end140
  br label %cond.end145

cond.end145:                                      ; preds = %cond.false144, %cond.true143
  %cond146 = phi i32 [ %98, %cond.true143 ], [ 0, %cond.false144 ]
  store i32 %cond146, i32* %sc, align 4
  br label %if.end147

if.end147:                                        ; preds = %cond.end145, %if.else135
  br label %if.end148

if.end148:                                        ; preds = %if.end147, %cond.end133
  br label %if.end149

if.end149:                                        ; preds = %if.end148
  %99 = load i32, i32* %flags.addr, align 4
  %and150 = and i32 %99, 32
  %tobool151 = icmp ne i32 %and150, 0
  br i1 %tobool151, label %land.lhs.true152, label %if.end173

land.lhs.true152:                                 ; preds = %if.end149
  %100 = load i32, i32* %c, align 4
  %cmp153 = icmp eq i32 %100, 42
  br i1 %cmp153, label %land.lhs.true154, label %if.end173

land.lhs.true154:                                 ; preds = %land.lhs.true152
  %101 = load i32*, i32** %p, align 4
  %102 = load i32, i32* %101, align 4
  %cmp155 = icmp eq i32 %102, 40
  br i1 %cmp155, label %if.then156, label %if.end173

if.then156:                                       ; preds = %land.lhs.true154
  %103 = load i32*, i32** %n, align 4
  store i32* %103, i32** %newn157, align 4
  br label %for.cond158

for.cond158:                                      ; preds = %for.inc, %if.then156
  %104 = load i32*, i32** %newn157, align 4
  %105 = load i32*, i32** %se.addr, align 4
  %cmp159 = icmp ult i32* %104, %105
  br i1 %cmp159, label %for.body160, label %for.end

for.body160:                                      ; preds = %for.cond158
  %106 = load i32, i32* %c, align 4
  %107 = load i32*, i32** %newn157, align 4
  %108 = load i32*, i32** %se.addr, align 4
  %109 = load i32*, i32** %p, align 4
  %110 = load i32*, i32** %pe.addr, align 4
  %111 = load i32, i32* %flags.addr, align 4
  %call161 = call i32 @extmatch_wc(i32 %106, i32* %107, i32* %108, i32* %109, i32* %110, i32 %111)
  %cmp162 = icmp eq i32 %call161, 0
  br i1 %cmp162, label %if.then163, label %if.end164

if.then163:                                       ; preds = %for.body160
  store i32 0, i32* %retval, align 4
  br label %return

if.end164:                                        ; preds = %for.body160
  br label %for.inc

for.inc:                                          ; preds = %if.end164
  %112 = load i32*, i32** %newn157, align 4
  %incdec.ptr165 = getelementptr inbounds i32, i32* %112, i32 1
  store i32* %incdec.ptr165, i32** %newn157, align 4
  br label %for.cond158

for.end:                                          ; preds = %for.cond158
  %113 = load i32*, i32** %p, align 4
  %add.ptr166 = getelementptr inbounds i32, i32* %113, i32 1
  %114 = load i32*, i32** %pe.addr, align 4
  %call167 = call i32* @glob_patscan_wc(i32* %add.ptr166, i32* %114, i32 0)
  store i32* %call167, i32** %newn157, align 4
  %115 = load i32*, i32** %newn157, align 4
  %tobool168 = icmp ne i32* %115, null
  br i1 %tobool168, label %cond.true169, label %cond.false170

cond.true169:                                     ; preds = %for.end
  %116 = load i32*, i32** %newn157, align 4
  br label %cond.end171

cond.false170:                                    ; preds = %for.end
  %117 = load i32*, i32** %pe.addr, align 4
  br label %cond.end171

cond.end171:                                      ; preds = %cond.false170, %cond.true169
  %cond172 = phi i32* [ %116, %cond.true169 ], [ %117, %cond.false170 ]
  store i32* %cond172, i32** %p, align 4
  br label %if.end173

if.end173:                                        ; preds = %cond.end171, %land.lhs.true154, %land.lhs.true152, %if.end149
  %118 = load i32*, i32** %p, align 4
  %119 = load i32*, i32** %pe.addr, align 4
  %cmp174 = icmp eq i32* %118, %119
  br i1 %cmp174, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.end173
  br label %for.end179

if.end176:                                        ; preds = %if.end173
  br label %for.inc177

for.inc177:                                       ; preds = %if.end176
  %120 = load i32*, i32** %p, align 4
  %incdec.ptr178 = getelementptr inbounds i32, i32* %120, i32 1
  store i32* %incdec.ptr178, i32** %p, align 4
  %121 = load i32, i32* %120, align 4
  store i32 %121, i32* %c, align 4
  br label %for.cond

for.end179:                                       ; preds = %if.then175, %lor.end
  %122 = load i32, i32* %c, align 4
  %cmp180 = icmp eq i32 %122, 0
  br i1 %cmp180, label %if.then181, label %if.end198

if.then181:                                       ; preds = %for.end179
  %123 = load i32, i32* %flags.addr, align 4
  %and182 = and i32 %123, 1
  %cmp183 = icmp eq i32 %and182, 0
  %cond184 = select i1 %cmp183, i32 0, i32 1
  store i32 %cond184, i32* %r, align 4
  %124 = load i32, i32* %flags.addr, align 4
  %and185 = and i32 %124, 1
  %tobool186 = icmp ne i32 %and185, 0
  br i1 %tobool186, label %if.then187, label %if.end197

if.then187:                                       ; preds = %if.then181
  %125 = load i32, i32* %flags.addr, align 4
  %and188 = and i32 %125, 8
  %tobool189 = icmp ne i32 %and188, 0
  br i1 %tobool189, label %if.then190, label %if.else191

if.then190:                                       ; preds = %if.then187
  store i32 0, i32* %r, align 4
  br label %if.end196

if.else191:                                       ; preds = %if.then187
  %126 = load i32*, i32** %n, align 4
  %127 = load i32*, i32** %se.addr, align 4
  %128 = load i32*, i32** %n, align 4
  %sub.ptr.lhs.cast = ptrtoint i32* %127 to i32
  %sub.ptr.rhs.cast = ptrtoint i32* %128 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 4
  %call192 = call i32* @wmemchr(i32* %126, i32 47, i32 %sub.ptr.div)
  %cmp193 = icmp eq i32* %call192, null
  br i1 %cmp193, label %if.then194, label %if.end195

if.then194:                                       ; preds = %if.else191
  store i32 0, i32* %r, align 4
  br label %if.end195

if.end195:                                        ; preds = %if.then194, %if.else191
  br label %if.end196

if.end196:                                        ; preds = %if.end195, %if.then190
  br label %if.end197

if.end197:                                        ; preds = %if.end196, %if.then181
  %129 = load i32, i32* %r, align 4
  store i32 %129, i32* %retval, align 4
  br label %return

if.end198:                                        ; preds = %for.end179
  %130 = load i32*, i32** %p, align 4
  %131 = load i32*, i32** %pe.addr, align 4
  %cmp199 = icmp eq i32* %130, %131
  br i1 %cmp199, label %land.lhs.true200, label %if.end205

land.lhs.true200:                                 ; preds = %if.end198
  %132 = load i32, i32* %c, align 4
  %cmp201 = icmp eq i32 %132, 63
  br i1 %cmp201, label %if.then204, label %lor.lhs.false202

lor.lhs.false202:                                 ; preds = %land.lhs.true200
  %133 = load i32, i32* %c, align 4
  %cmp203 = icmp eq i32 %133, 42
  br i1 %cmp203, label %if.then204, label %if.end205

if.then204:                                       ; preds = %lor.lhs.false202, %land.lhs.true200
  store i32 0, i32* %retval, align 4
  br label %return

if.end205:                                        ; preds = %lor.lhs.false202, %if.end198
  %134 = load i32*, i32** %n, align 4
  %135 = load i32*, i32** %se.addr, align 4
  %cmp206 = icmp eq i32* %134, %135
  br i1 %cmp206, label %land.lhs.true207, label %if.end226

land.lhs.true207:                                 ; preds = %if.end205
  %136 = load i32, i32* %flags.addr, align 4
  %and208 = and i32 %136, 32
  %tobool209 = icmp ne i32 %and208, 0
  br i1 %tobool209, label %land.lhs.true210, label %if.end226

land.lhs.true210:                                 ; preds = %land.lhs.true207
  %137 = load i32, i32* %c, align 4
  %cmp211 = icmp eq i32 %137, 33
  br i1 %cmp211, label %land.lhs.true214, label %lor.lhs.false212

lor.lhs.false212:                                 ; preds = %land.lhs.true210
  %138 = load i32, i32* %c, align 4
  %cmp213 = icmp eq i32 %138, 63
  br i1 %cmp213, label %land.lhs.true214, label %if.end226

land.lhs.true214:                                 ; preds = %lor.lhs.false212, %land.lhs.true210
  %139 = load i32*, i32** %p, align 4
  %140 = load i32, i32* %139, align 4
  %cmp215 = icmp eq i32 %140, 40
  br i1 %cmp215, label %if.then216, label %if.end226

if.then216:                                       ; preds = %land.lhs.true214
  %141 = load i32*, i32** %p, align 4
  %incdec.ptr217 = getelementptr inbounds i32, i32* %141, i32 -1
  store i32* %incdec.ptr217, i32** %p, align 4
  %142 = load i32, i32* %c, align 4
  %143 = load i32*, i32** %n, align 4
  %144 = load i32*, i32** %se.addr, align 4
  %145 = load i32*, i32** %p, align 4
  %146 = load i32*, i32** %pe.addr, align 4
  %147 = load i32, i32* %flags.addr, align 4
  %call218 = call i32 @extmatch_wc(i32 %142, i32* %143, i32* %144, i32* %145, i32* %146, i32 %147)
  %cmp219 = icmp eq i32 %call218, 0
  br i1 %cmp219, label %if.then220, label %if.end223

if.then220:                                       ; preds = %if.then216
  %148 = load i32, i32* %c, align 4
  %cmp221 = icmp eq i32 %148, 33
  %cond222 = select i1 %cmp221, i32 1, i32 0
  store i32 %cond222, i32* %retval, align 4
  br label %return

if.end223:                                        ; preds = %if.then216
  %149 = load i32, i32* %c, align 4
  %cmp224 = icmp eq i32 %149, 33
  %cond225 = select i1 %cmp224, i32 0, i32 1
  store i32 %cond225, i32* %retval, align 4
  br label %return

if.end226:                                        ; preds = %land.lhs.true214, %lor.lhs.false212, %land.lhs.true207, %if.end205
  %150 = load i32, i32* %c, align 4
  %cmp227 = icmp eq i32 %150, 47
  br i1 %cmp227, label %land.lhs.true228, label %if.end246

land.lhs.true228:                                 ; preds = %if.end226
  %151 = load i32, i32* %flags.addr, align 4
  %and229 = and i32 %151, 1
  %tobool230 = icmp ne i32 %and229, 0
  br i1 %tobool230, label %if.then231, label %if.end246

if.then231:                                       ; preds = %land.lhs.true228
  br label %while.cond232

while.cond232:                                    ; preds = %while.body235, %if.then231
  %152 = load i32*, i32** %n, align 4
  %153 = load i32*, i32** %se.addr, align 4
  %cmp233 = icmp ult i32* %152, %153
  br i1 %cmp233, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond232
  %154 = load i32*, i32** %n, align 4
  %155 = load i32, i32* %154, align 4
  %cmp234 = icmp ne i32 %155, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond232
  %156 = phi i1 [ false, %while.cond232 ], [ %cmp234, %land.rhs ]
  br i1 %156, label %while.body235, label %while.end

while.body235:                                    ; preds = %land.end
  %157 = load i32*, i32** %n, align 4
  %incdec.ptr236 = getelementptr inbounds i32, i32* %157, i32 1
  store i32* %incdec.ptr236, i32** %n, align 4
  br label %while.cond232

while.end:                                        ; preds = %land.end
  %158 = load i32*, i32** %n, align 4
  %159 = load i32*, i32** %se.addr, align 4
  %cmp237 = icmp ult i32* %158, %159
  br i1 %cmp237, label %land.lhs.true238, label %if.end245

land.lhs.true238:                                 ; preds = %while.end
  %160 = load i32*, i32** %n, align 4
  %161 = load i32, i32* %160, align 4
  %cmp239 = icmp eq i32 %161, 47
  br i1 %cmp239, label %land.lhs.true240, label %if.end245

land.lhs.true240:                                 ; preds = %land.lhs.true238
  %162 = load i32*, i32** %n, align 4
  %add.ptr241 = getelementptr inbounds i32, i32* %162, i32 1
  %163 = load i32*, i32** %se.addr, align 4
  %164 = load i32*, i32** %p, align 4
  %165 = load i32*, i32** %pe.addr, align 4
  %166 = load i32, i32* %flags.addr, align 4
  %call242 = call i32 @gmatch_wc(i32* %add.ptr241, i32* %163, i32* %164, i32* %165, i32 %166)
  %cmp243 = icmp eq i32 %call242, 0
  br i1 %cmp243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %land.lhs.true240
  store i32 0, i32* %retval, align 4
  br label %return

if.end245:                                        ; preds = %land.lhs.true240, %land.lhs.true238, %while.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end246:                                        ; preds = %land.lhs.true228, %if.end226
  %167 = load i32*, i32** %n, align 4
  %168 = load i32, i32* %flags.addr, align 4
  %and247 = and i32 %168, 1
  %tobool248 = icmp ne i32 %and247, 0
  %cond249 = select i1 %tobool248, i32 47, i32 0
  %169 = load i32*, i32** %se.addr, align 4
  %170 = load i32*, i32** %n, align 4
  %sub.ptr.lhs.cast250 = ptrtoint i32* %169 to i32
  %sub.ptr.rhs.cast251 = ptrtoint i32* %170 to i32
  %sub.ptr.sub252 = sub i32 %sub.ptr.lhs.cast250, %sub.ptr.rhs.cast251
  %sub.ptr.div253 = sdiv exact i32 %sub.ptr.sub252, 4
  %call254 = call i32* @wmemchr(i32* %167, i32 %cond249, i32 %sub.ptr.div253)
  store i32* %call254, i32** %endp, align 4
  %171 = load i32*, i32** %endp, align 4
  %cmp255 = icmp eq i32* %171, null
  br i1 %cmp255, label %if.then256, label %if.end257

if.then256:                                       ; preds = %if.end246
  %172 = load i32*, i32** %se.addr, align 4
  store i32* %172, i32** %endp, align 4
  br label %if.end257

if.end257:                                        ; preds = %if.then256, %if.end246
  %173 = load i32, i32* %flags.addr, align 4
  %and258 = and i32 %173, 2
  %cmp259 = icmp eq i32 %and258, 0
  br i1 %cmp259, label %land.lhs.true260, label %cond.false263

land.lhs.true260:                                 ; preds = %if.end257
  %174 = load i32, i32* %c, align 4
  %cmp261 = icmp eq i32 %174, 92
  br i1 %cmp261, label %cond.true262, label %cond.false263

cond.true262:                                     ; preds = %land.lhs.true260
  %175 = load i32*, i32** %p, align 4
  %176 = load i32, i32* %175, align 4
  br label %cond.end264

cond.false263:                                    ; preds = %land.lhs.true260, %if.end257
  %177 = load i32, i32* %c, align 4
  br label %cond.end264

cond.end264:                                      ; preds = %cond.false263, %cond.true262
  %cond265 = phi i32 [ %176, %cond.true262 ], [ %177, %cond.false263 ]
  store i32 %cond265, i32* %c1, align 4
  %178 = load i32, i32* %flags.addr, align 4
  %and266 = and i32 %178, 16
  %tobool267 = icmp ne i32 %and266, 0
  br i1 %tobool267, label %land.lhs.true268, label %cond.false273

land.lhs.true268:                                 ; preds = %cond.end264
  %179 = load i32, i32* %c1, align 4
  %call269 = call i32 @iswupper(i32 %179)
  %tobool270 = icmp ne i32 %call269, 0
  br i1 %tobool270, label %cond.true271, label %cond.false273

cond.true271:                                     ; preds = %land.lhs.true268
  %180 = load i32, i32* %c1, align 4
  %call272 = call i32 @towlower(i32 %180)
  br label %cond.end274

cond.false273:                                    ; preds = %land.lhs.true268, %cond.end264
  %181 = load i32, i32* %c1, align 4
  br label %cond.end274

cond.end274:                                      ; preds = %cond.false273, %cond.true271
  %cond275 = phi i32 [ %call272, %cond.true271 ], [ %181, %cond.false273 ]
  store i32 %cond275, i32* %c1, align 4
  %182 = load i32*, i32** %p, align 4
  %incdec.ptr276 = getelementptr inbounds i32, i32* %182, i32 -1
  store i32* %incdec.ptr276, i32** %p, align 4
  br label %for.cond277

for.cond277:                                      ; preds = %for.inc327, %cond.end274
  %183 = load i32*, i32** %n, align 4
  %184 = load i32*, i32** %endp, align 4
  %cmp278 = icmp ult i32* %183, %184
  br i1 %cmp278, label %for.body279, label %for.end329

for.body279:                                      ; preds = %for.cond277
  %185 = load i32, i32* %flags.addr, align 4
  %and280 = and i32 %185, 32
  %cmp281 = icmp eq i32 %and280, 0
  br i1 %cmp281, label %land.lhs.true282, label %if.end297

land.lhs.true282:                                 ; preds = %for.body279
  %186 = load i32, i32* %c, align 4
  %cmp283 = icmp ne i32 %186, 91
  br i1 %cmp283, label %land.lhs.true284, label %if.end297

land.lhs.true284:                                 ; preds = %land.lhs.true282
  %187 = load i32, i32* %flags.addr, align 4
  %and285 = and i32 %187, 16
  %tobool286 = icmp ne i32 %and285, 0
  br i1 %tobool286, label %land.lhs.true287, label %cond.false292

land.lhs.true287:                                 ; preds = %land.lhs.true284
  %188 = load i32*, i32** %n, align 4
  %189 = load i32, i32* %188, align 4
  %call288 = call i32 @iswupper(i32 %189)
  %tobool289 = icmp ne i32 %call288, 0
  br i1 %tobool289, label %cond.true290, label %cond.false292

cond.true290:                                     ; preds = %land.lhs.true287
  %190 = load i32*, i32** %n, align 4
  %191 = load i32, i32* %190, align 4
  %call291 = call i32 @towlower(i32 %191)
  br label %cond.end293

cond.false292:                                    ; preds = %land.lhs.true287, %land.lhs.true284
  %192 = load i32*, i32** %n, align 4
  %193 = load i32, i32* %192, align 4
  br label %cond.end293

cond.end293:                                      ; preds = %cond.false292, %cond.true290
  %cond294 = phi i32 [ %call291, %cond.true290 ], [ %193, %cond.false292 ]
  %194 = load i32, i32* %c1, align 4
  %cmp295 = icmp ne i32 %cond294, %194
  br i1 %cmp295, label %if.then296, label %if.end297

if.then296:                                       ; preds = %cond.end293
  br label %for.inc327

if.end297:                                        ; preds = %cond.end293, %land.lhs.true282, %for.body279
  %195 = load i32, i32* %flags.addr, align 4
  %and298 = and i32 %195, 32
  %tobool299 = icmp ne i32 %and298, 0
  br i1 %tobool299, label %land.lhs.true300, label %if.end321

land.lhs.true300:                                 ; preds = %if.end297
  %196 = load i32*, i32** %p, align 4
  %arrayidx301 = getelementptr inbounds i32, i32* %196, i32 1
  %197 = load i32, i32* %arrayidx301, align 4
  %cmp302 = icmp ne i32 %197, 40
  br i1 %cmp302, label %land.lhs.true303, label %if.end321

land.lhs.true303:                                 ; preds = %land.lhs.true300
  %198 = load i32*, i32** %p, align 4
  %199 = load i32, i32* %198, align 4
  %call304 = call i32* @wcschr(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.112, i32 0, i32 0), i32 %199)
  %cmp305 = icmp eq i32* %call304, null
  br i1 %cmp305, label %land.lhs.true306, label %if.end321

land.lhs.true306:                                 ; preds = %land.lhs.true303
  %200 = load i32, i32* %c, align 4
  %cmp307 = icmp ne i32 %200, 91
  br i1 %cmp307, label %land.lhs.true308, label %if.end321

land.lhs.true308:                                 ; preds = %land.lhs.true306
  %201 = load i32, i32* %flags.addr, align 4
  %and309 = and i32 %201, 16
  %tobool310 = icmp ne i32 %and309, 0
  br i1 %tobool310, label %land.lhs.true311, label %cond.false316

land.lhs.true311:                                 ; preds = %land.lhs.true308
  %202 = load i32*, i32** %n, align 4
  %203 = load i32, i32* %202, align 4
  %call312 = call i32 @iswupper(i32 %203)
  %tobool313 = icmp ne i32 %call312, 0
  br i1 %tobool313, label %cond.true314, label %cond.false316

cond.true314:                                     ; preds = %land.lhs.true311
  %204 = load i32*, i32** %n, align 4
  %205 = load i32, i32* %204, align 4
  %call315 = call i32 @towlower(i32 %205)
  br label %cond.end317

cond.false316:                                    ; preds = %land.lhs.true311, %land.lhs.true308
  %206 = load i32*, i32** %n, align 4
  %207 = load i32, i32* %206, align 4
  br label %cond.end317

cond.end317:                                      ; preds = %cond.false316, %cond.true314
  %cond318 = phi i32 [ %call315, %cond.true314 ], [ %207, %cond.false316 ]
  %208 = load i32, i32* %c1, align 4
  %cmp319 = icmp ne i32 %cond318, %208
  br i1 %cmp319, label %if.then320, label %if.end321

if.then320:                                       ; preds = %cond.end317
  br label %for.inc327

if.end321:                                        ; preds = %cond.end317, %land.lhs.true306, %land.lhs.true303, %land.lhs.true300, %if.end297
  %209 = load i32*, i32** %n, align 4
  %210 = load i32*, i32** %se.addr, align 4
  %211 = load i32*, i32** %p, align 4
  %212 = load i32*, i32** %pe.addr, align 4
  %213 = load i32, i32* %flags.addr, align 4
  %and322 = and i32 %213, -5
  %call323 = call i32 @gmatch_wc(i32* %209, i32* %210, i32* %211, i32* %212, i32 %and322)
  %cmp324 = icmp eq i32 %call323, 0
  br i1 %cmp324, label %if.then325, label %if.end326

if.then325:                                       ; preds = %if.end321
  store i32 0, i32* %retval, align 4
  br label %return

if.end326:                                        ; preds = %if.end321
  br label %for.inc327

for.inc327:                                       ; preds = %if.end326, %if.then320, %if.then296
  %214 = load i32*, i32** %n, align 4
  %incdec.ptr328 = getelementptr inbounds i32, i32* %214, i32 1
  store i32* %incdec.ptr328, i32** %n, align 4
  br label %for.cond277

for.end329:                                       ; preds = %for.cond277
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb330:                                         ; preds = %if.end32
  %215 = load i32, i32* %sc, align 4
  %cmp331 = icmp eq i32 %215, 0
  br i1 %cmp331, label %if.then334, label %lor.lhs.false332

lor.lhs.false332:                                 ; preds = %sw.bb330
  %216 = load i32*, i32** %n, align 4
  %217 = load i32*, i32** %se.addr, align 4
  %cmp333 = icmp eq i32* %216, %217
  br i1 %cmp333, label %if.then334, label %if.end335

if.then334:                                       ; preds = %lor.lhs.false332, %sw.bb330
  store i32 1, i32* %retval, align 4
  br label %return

if.end335:                                        ; preds = %lor.lhs.false332
  %218 = load i32, i32* %flags.addr, align 4
  %and336 = and i32 %218, 4
  %tobool337 = icmp ne i32 %and336, 0
  br i1 %tobool337, label %land.lhs.true338, label %if.end349

land.lhs.true338:                                 ; preds = %if.end335
  %219 = load i32, i32* %sc, align 4
  %cmp339 = icmp eq i32 %219, 46
  br i1 %cmp339, label %land.lhs.true340, label %if.end349

land.lhs.true340:                                 ; preds = %land.lhs.true338
  %220 = load i32*, i32** %n, align 4
  %221 = load i32*, i32** %string.addr, align 4
  %cmp341 = icmp eq i32* %220, %221
  br i1 %cmp341, label %if.then348, label %lor.lhs.false342

lor.lhs.false342:                                 ; preds = %land.lhs.true340
  %222 = load i32, i32* %flags.addr, align 4
  %and343 = and i32 %222, 1
  %tobool344 = icmp ne i32 %and343, 0
  br i1 %tobool344, label %land.lhs.true345, label %if.end349

land.lhs.true345:                                 ; preds = %lor.lhs.false342
  %223 = load i32*, i32** %n, align 4
  %arrayidx346 = getelementptr inbounds i32, i32* %223, i32 -1
  %224 = load i32, i32* %arrayidx346, align 4
  %cmp347 = icmp eq i32 %224, 47
  br i1 %cmp347, label %if.then348, label %if.end349

if.then348:                                       ; preds = %land.lhs.true345, %land.lhs.true340
  store i32 1, i32* %retval, align 4
  br label %return

if.end349:                                        ; preds = %land.lhs.true345, %lor.lhs.false342, %land.lhs.true338, %if.end335
  %225 = load i32*, i32** %p, align 4
  %226 = load i32, i32* %sc, align 4
  %227 = load i32, i32* %flags.addr, align 4
  %call350 = call i32* @brackmatch_wc(i32* %225, i32 %226, i32 %227)
  store i32* %call350, i32** %p, align 4
  %228 = load i32*, i32** %p, align 4
  %cmp351 = icmp eq i32* %228, null
  br i1 %cmp351, label %if.then352, label %if.end353

if.then352:                                       ; preds = %if.end349
  store i32 1, i32* %retval, align 4
  br label %return

if.end353:                                        ; preds = %if.end349
  br label %sw.epilog

sw.default:                                       ; preds = %if.end32
  %229 = load i32, i32* %c, align 4
  %230 = load i32, i32* %flags.addr, align 4
  %and354 = and i32 %230, 16
  %tobool355 = icmp ne i32 %and354, 0
  br i1 %tobool355, label %land.lhs.true356, label %cond.false361

land.lhs.true356:                                 ; preds = %sw.default
  %231 = load i32, i32* %sc, align 4
  %call357 = call i32 @iswupper(i32 %231)
  %tobool358 = icmp ne i32 %call357, 0
  br i1 %tobool358, label %cond.true359, label %cond.false361

cond.true359:                                     ; preds = %land.lhs.true356
  %232 = load i32, i32* %sc, align 4
  %call360 = call i32 @towlower(i32 %232)
  br label %cond.end362

cond.false361:                                    ; preds = %land.lhs.true356, %sw.default
  %233 = load i32, i32* %sc, align 4
  br label %cond.end362

cond.end362:                                      ; preds = %cond.false361, %cond.true359
  %cond363 = phi i32 [ %call360, %cond.true359 ], [ %233, %cond.false361 ]
  %cmp364 = icmp ne i32 %229, %cond363
  br i1 %cmp364, label %if.then365, label %if.end366

if.then365:                                       ; preds = %cond.end362
  store i32 1, i32* %retval, align 4
  br label %return

if.end366:                                        ; preds = %cond.end362
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end366, %if.end353, %if.end90, %if.end55
  %234 = load i32*, i32** %n, align 4
  %incdec.ptr367 = getelementptr inbounds i32, i32* %234, i32 1
  store i32* %incdec.ptr367, i32** %n, align 4
  br label %while.cond

while.end368:                                     ; preds = %while.cond
  %235 = load i32*, i32** %n, align 4
  %236 = load i32*, i32** %se.addr, align 4
  %cmp369 = icmp eq i32* %235, %236
  br i1 %cmp369, label %if.then370, label %if.end371

if.then370:                                       ; preds = %while.end368
  store i32 0, i32* %retval, align 4
  br label %return

if.end371:                                        ; preds = %while.end368
  %237 = load i32, i32* %flags.addr, align 4
  %and372 = and i32 %237, 8
  %tobool373 = icmp ne i32 %and372, 0
  br i1 %tobool373, label %land.lhs.true374, label %if.end377

land.lhs.true374:                                 ; preds = %if.end371
  %238 = load i32*, i32** %n, align 4
  %239 = load i32, i32* %238, align 4
  %cmp375 = icmp eq i32 %239, 47
  br i1 %cmp375, label %if.then376, label %if.end377

if.then376:                                       ; preds = %land.lhs.true374
  store i32 0, i32* %retval, align 4
  br label %return

if.end377:                                        ; preds = %land.lhs.true374, %if.end371
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end377, %if.then376, %if.then370, %if.then365, %if.then352, %if.then348, %if.then334, %for.end329, %if.then325, %if.end245, %if.then244, %if.end223, %if.then220, %if.then204, %if.end197, %if.then163, %if.then139, %if.then127, %if.then116, %if.then107, %if.then104, %if.then89, %if.then65, %if.then58, %if.then52, %if.then39, %if.then34, %cond.end29, %if.then
  %240 = load i32, i32* %retval, align 4
  ret i32 %240
}

; Function Attrs: noinline nounwind
define i32* @glob_patscan_wc(i32* %string, i32* %end, i32 %delim) #0 {
entry:
  %retval = alloca i32*, align 4
  %string.addr = alloca i32*, align 4
  %end.addr = alloca i32*, align 4
  %delim.addr = alloca i32, align 4
  %pnest = alloca i32, align 4
  %bnest = alloca i32, align 4
  %skip = alloca i32, align 4
  %cchar = alloca i32, align 4
  %s = alloca i32*, align 4
  %c = alloca i32, align 4
  %bfirst = alloca i32*, align 4
  store i32* %string, i32** %string.addr, align 4
  store i32* %end, i32** %end.addr, align 4
  store i32 %delim, i32* %delim.addr, align 4
  store i32 0, i32* %skip, align 4
  store i32 0, i32* %bnest, align 4
  store i32 0, i32* %pnest, align 4
  store i32 0, i32* %cchar, align 4
  store i32* null, i32** %bfirst, align 4
  %0 = load i32*, i32** %string.addr, align 4
  %1 = load i32*, i32** %end.addr, align 4
  %cmp = icmp eq i32* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32* null, i32** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %string.addr, align 4
  store i32* %2, i32** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32*, i32** %s, align 4
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %c, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %s, align 4
  %6 = load i32*, i32** %end.addr, align 4
  %cmp1 = icmp uge i32* %5, %6
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.body
  %7 = load i32*, i32** %s, align 4
  store i32* %7, i32** %retval, align 4
  br label %return

if.end3:                                          ; preds = %for.body
  %8 = load i32, i32* %skip, align 4
  %tobool4 = icmp ne i32 %8, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  store i32 0, i32* %skip, align 4
  br label %for.inc

if.end6:                                          ; preds = %if.end3
  %9 = load i32, i32* %c, align 4
  switch i32 %9, label %sw.epilog [
    i32 92, label %sw.bb
    i32 0, label %sw.bb7
    i32 91, label %sw.bb8
    i32 93, label %sw.bb26
    i32 40, label %sw.bb39
    i32 41, label %sw.bb44
    i32 124, label %sw.bb52
  ]

sw.bb:                                            ; preds = %if.end6
  store i32 1, i32* %skip, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %if.end6
  store i32* null, i32** %retval, align 4
  br label %return

sw.bb8:                                           ; preds = %if.end6
  %10 = load i32, i32* %bnest, align 4
  %cmp9 = icmp eq i32 %10, 0
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %sw.bb8
  %11 = load i32*, i32** %s, align 4
  %add.ptr = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %add.ptr, i32** %bfirst, align 4
  %12 = load i32*, i32** %bfirst, align 4
  %13 = load i32, i32* %12, align 4
  %cmp11 = icmp eq i32 %13, 33
  br i1 %cmp11, label %if.then13, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then10
  %14 = load i32*, i32** %bfirst, align 4
  %15 = load i32, i32* %14, align 4
  %cmp12 = icmp eq i32 %15, 94
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %lor.lhs.false, %if.then10
  %16 = load i32*, i32** %bfirst, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %16, i32 1
  store i32* %incdec.ptr, i32** %bfirst, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %lor.lhs.false
  %17 = load i32, i32* %bnest, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %bnest, align 4
  br label %if.end25

if.else:                                          ; preds = %sw.bb8
  %18 = load i32*, i32** %s, align 4
  %arrayidx = getelementptr inbounds i32, i32* %18, i32 1
  %19 = load i32, i32* %arrayidx, align 4
  %cmp15 = icmp eq i32 %19, 58
  br i1 %cmp15, label %if.then22, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %if.else
  %20 = load i32*, i32** %s, align 4
  %arrayidx17 = getelementptr inbounds i32, i32* %20, i32 1
  %21 = load i32, i32* %arrayidx17, align 4
  %cmp18 = icmp eq i32 %21, 46
  br i1 %cmp18, label %if.then22, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false16
  %22 = load i32*, i32** %s, align 4
  %arrayidx20 = getelementptr inbounds i32, i32* %22, i32 1
  %23 = load i32, i32* %arrayidx20, align 4
  %cmp21 = icmp eq i32 %23, 61
  br i1 %cmp21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %lor.lhs.false19, %lor.lhs.false16, %if.else
  %24 = load i32*, i32** %s, align 4
  %arrayidx23 = getelementptr inbounds i32, i32* %24, i32 1
  %25 = load i32, i32* %arrayidx23, align 4
  store i32 %25, i32* %cchar, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %lor.lhs.false19
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.end14
  br label %sw.epilog

sw.bb26:                                          ; preds = %if.end6
  %26 = load i32, i32* %bnest, align 4
  %tobool27 = icmp ne i32 %26, 0
  br i1 %tobool27, label %if.then28, label %if.end38

if.then28:                                        ; preds = %sw.bb26
  %27 = load i32, i32* %cchar, align 4
  %tobool29 = icmp ne i32 %27, 0
  br i1 %tobool29, label %land.lhs.true, label %if.else33

land.lhs.true:                                    ; preds = %if.then28
  %28 = load i32*, i32** %s, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %28, i32 -1
  %29 = load i32, i32* %arrayidx30, align 4
  %30 = load i32, i32* %cchar, align 4
  %cmp31 = icmp eq i32 %29, %30
  br i1 %cmp31, label %if.then32, label %if.else33

if.then32:                                        ; preds = %land.lhs.true
  store i32 0, i32* %cchar, align 4
  br label %if.end37

if.else33:                                        ; preds = %land.lhs.true, %if.then28
  %31 = load i32*, i32** %s, align 4
  %32 = load i32*, i32** %bfirst, align 4
  %cmp34 = icmp ne i32* %31, %32
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.else33
  %33 = load i32, i32* %bnest, align 4
  %dec = add nsw i32 %33, -1
  store i32 %dec, i32* %bnest, align 4
  store i32* null, i32** %bfirst, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.else33
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then32
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %sw.bb26
  br label %sw.epilog

sw.bb39:                                          ; preds = %if.end6
  %34 = load i32, i32* %bnest, align 4
  %cmp40 = icmp eq i32 %34, 0
  br i1 %cmp40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %sw.bb39
  %35 = load i32, i32* %pnest, align 4
  %inc42 = add nsw i32 %35, 1
  store i32 %inc42, i32* %pnest, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %sw.bb39
  br label %sw.epilog

sw.bb44:                                          ; preds = %if.end6
  %36 = load i32, i32* %bnest, align 4
  %cmp45 = icmp eq i32 %36, 0
  br i1 %cmp45, label %land.lhs.true46, label %if.end51

land.lhs.true46:                                  ; preds = %sw.bb44
  %37 = load i32, i32* %pnest, align 4
  %dec47 = add nsw i32 %37, -1
  store i32 %dec47, i32* %pnest, align 4
  %cmp48 = icmp sle i32 %37, 0
  br i1 %cmp48, label %if.then49, label %if.end51

if.then49:                                        ; preds = %land.lhs.true46
  %38 = load i32*, i32** %s, align 4
  %incdec.ptr50 = getelementptr inbounds i32, i32* %38, i32 1
  store i32* %incdec.ptr50, i32** %s, align 4
  store i32* %incdec.ptr50, i32** %retval, align 4
  br label %return

if.end51:                                         ; preds = %land.lhs.true46, %sw.bb44
  br label %sw.epilog

sw.bb52:                                          ; preds = %if.end6
  %39 = load i32, i32* %bnest, align 4
  %cmp53 = icmp eq i32 %39, 0
  br i1 %cmp53, label %land.lhs.true54, label %if.end60

land.lhs.true54:                                  ; preds = %sw.bb52
  %40 = load i32, i32* %pnest, align 4
  %cmp55 = icmp eq i32 %40, 0
  br i1 %cmp55, label %land.lhs.true56, label %if.end60

land.lhs.true56:                                  ; preds = %land.lhs.true54
  %41 = load i32, i32* %delim.addr, align 4
  %cmp57 = icmp eq i32 %41, 124
  br i1 %cmp57, label %if.then58, label %if.end60

if.then58:                                        ; preds = %land.lhs.true56
  %42 = load i32*, i32** %s, align 4
  %incdec.ptr59 = getelementptr inbounds i32, i32* %42, i32 1
  store i32* %incdec.ptr59, i32** %s, align 4
  store i32* %incdec.ptr59, i32** %retval, align 4
  br label %return

if.end60:                                         ; preds = %land.lhs.true56, %land.lhs.true54, %sw.bb52
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end6, %if.end60, %if.end51, %if.end43, %if.end38, %if.end25, %sw.bb
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog, %if.then5
  %43 = load i32*, i32** %s, align 4
  %incdec.ptr61 = getelementptr inbounds i32, i32* %43, i32 1
  store i32* %incdec.ptr61, i32** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32* null, i32** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then58, %if.then49, %sw.bb7, %if.then2, %if.then
  %44 = load i32*, i32** %retval, align 4
  ret i32* %44
}

; Function Attrs: noinline nounwind
define i32 @xstrmatch(i8* %pattern, i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  %n = alloca i32, align 4
  %wpattern = alloca i32*, align 4
  %wstring = alloca i32*, align 4
  %plen = alloca i32, align 4
  %slen = alloca i32, align 4
  %mplen = alloca i32, align 4
  %mslen = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i8* @mbsmbchar(i8* %0)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %pattern.addr, align 4
  %call1 = call i8* @mbsmbchar(i8* %1)
  %cmp2 = icmp eq i8* %call1, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** %pattern.addr, align 4
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %call3 = call i32 @internal_strmatch(i8* %2, i8* %3, i32 %4)
  store i32 %call3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %call4 = call i32 @__ctype_get_mb_cur_max()
  %cmp5 = icmp eq i32 %call4, 1
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %5 = load i8*, i8** %pattern.addr, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %flags.addr, align 4
  %call7 = call i32 @internal_strmatch(i8* %5, i8* %6, i32 %7)
  store i32 %call7, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  %8 = load i8*, i8** %pattern.addr, align 4
  %call9 = call i32 @xdupmbstowcs(i32** %wpattern, i8*** null, i8* %8)
  store i32 %call9, i32* %n, align 4
  %9 = load i32, i32* %n, align 4
  %cmp10 = icmp eq i32 %9, -1
  br i1 %cmp10, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end8
  %10 = load i32, i32* %n, align 4
  %cmp11 = icmp eq i32 %10, -2
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %lor.lhs.false, %if.end8
  %11 = load i8*, i8** %pattern.addr, align 4
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %flags.addr, align 4
  %call13 = call i32 @internal_strmatch(i8* %11, i8* %12, i32 %13)
  store i32 %call13, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %lor.lhs.false
  %14 = load i8*, i8** %string.addr, align 4
  %call15 = call i32 @xdupmbstowcs(i32** %wstring, i8*** null, i8* %14)
  store i32 %call15, i32* %n, align 4
  %15 = load i32, i32* %n, align 4
  %cmp16 = icmp eq i32 %15, -1
  br i1 %cmp16, label %if.then19, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.end14
  %16 = load i32, i32* %n, align 4
  %cmp18 = icmp eq i32 %16, -2
  br i1 %cmp18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %lor.lhs.false17, %if.end14
  %17 = load i32*, i32** %wpattern, align 4
  %18 = bitcast i32* %17 to i8*
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 406)
  %19 = load i8*, i8** %pattern.addr, align 4
  %20 = load i8*, i8** %string.addr, align 4
  %21 = load i32, i32* %flags.addr, align 4
  %call20 = call i32 @internal_strmatch(i8* %19, i8* %20, i32 %21)
  store i32 %call20, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %lor.lhs.false17
  %22 = load i32*, i32** %wpattern, align 4
  %23 = load i32*, i32** %wstring, align 4
  %24 = load i32, i32* %flags.addr, align 4
  %call22 = call i32 @internal_wstrmatch(i32* %22, i32* %23, i32 %24)
  store i32 %call22, i32* %ret, align 4
  %25 = load i32*, i32** %wpattern, align 4
  %26 = bitcast i32* %25 to i8*
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 412)
  %27 = load i32*, i32** %wstring, align 4
  %28 = bitcast i32* %27 to i8*
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 413)
  %29 = load i32, i32* %ret, align 4
  store i32 %29, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.then19, %if.then12, %if.then6, %if.then
  %30 = load i32, i32* %retval, align 4
  ret i32 %30
}

declare i8* @mbsmbchar(i8*) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @xdupmbstowcs(i32**, i8***, i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #2

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #2

; Function Attrs: noinline nounwind
define internal i32 @extmatch(i32 %xc, i8* %s, i8* %se, i8* %p, i8* %pe, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %xc.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %se.addr = alloca i8*, align 4
  %p.addr = alloca i8*, align 4
  %pe.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %prest = alloca i8*, align 4
  %psub = alloca i8*, align 4
  %pnext = alloca i8*, align 4
  %srest = alloca i8*, align 4
  %m1 = alloca i32, align 4
  %m2 = alloca i32, align 4
  %xflags = alloca i32, align 4
  store i32 %xc, i32* %xc.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %se, i8** %se.addr, align 4
  store i8* %p, i8** %p.addr, align 4
  store i8* %pe, i8** %pe.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %p.addr, align 4
  %1 = load i8*, i8** %p.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = zext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 40
  %conv1 = zext i1 %cmp to i32
  %add.ptr = getelementptr inbounds i8, i8* %0, i32 %conv1
  %3 = load i8*, i8** %pe.addr, align 4
  %call = call i8* @glob_patscan(i8* %add.ptr, i8* %3, i32 0)
  store i8* %call, i8** %prest, align 4
  %4 = load i8*, i8** %prest, align 4
  %cmp2 = icmp eq i8* %4, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i8*, i8** %p.addr, align 4
  %add.ptr4 = getelementptr inbounds i8, i8* %5, i32 -1
  %6 = load i8*, i8** %pe.addr, align 4
  %7 = load i8*, i8** %s.addr, align 4
  %8 = load i8*, i8** %se.addr, align 4
  %call5 = call i32 @strcompare(i8* %add.ptr4, i8* %6, i8* %7, i8* %8)
  store i32 %call5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %9 = load i32, i32* %xc.addr, align 4
  switch i32 %9, label %sw.epilog [
    i32 43, label %sw.bb
    i32 42, label %sw.bb
    i32 63, label %sw.bb46
    i32 64, label %sw.bb46
    i32 33, label %sw.bb94
  ]

sw.bb:                                            ; preds = %if.end, %if.end
  %10 = load i32, i32* %xc.addr, align 4
  %cmp6 = icmp eq i32 %10, 42
  br i1 %cmp6, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %sw.bb
  %11 = load i8*, i8** %s.addr, align 4
  %12 = load i8*, i8** %se.addr, align 4
  %13 = load i8*, i8** %prest, align 4
  %14 = load i8*, i8** %pe.addr, align 4
  %15 = load i32, i32* %flags.addr, align 4
  %call8 = call i32 @gmatch(i8* %11, i8* %12, i8* %13, i8* %14, i32 %15)
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %land.lhs.true, %sw.bb
  %16 = load i8*, i8** %p.addr, align 4
  %add.ptr13 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %add.ptr13, i8** %psub, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc44, %if.end12
  %17 = load i8*, i8** %psub, align 4
  %18 = load i8*, i8** %pe.addr, align 4
  %call14 = call i8* @glob_patscan(i8* %17, i8* %18, i32 124)
  store i8* %call14, i8** %pnext, align 4
  %19 = load i8*, i8** %s.addr, align 4
  store i8* %19, i8** %srest, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc, %for.cond
  %20 = load i8*, i8** %srest, align 4
  %21 = load i8*, i8** %se.addr, align 4
  %cmp16 = icmp ule i8* %20, %21
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond15
  %22 = load i8*, i8** %s.addr, align 4
  %23 = load i8*, i8** %srest, align 4
  %24 = load i8*, i8** %psub, align 4
  %25 = load i8*, i8** %pnext, align 4
  %add.ptr18 = getelementptr inbounds i8, i8* %25, i32 -1
  %26 = load i32, i32* %flags.addr, align 4
  %call19 = call i32 @gmatch(i8* %22, i8* %23, i8* %24, i8* %add.ptr18, i32 %26)
  %cmp20 = icmp eq i32 %call19, 0
  %conv21 = zext i1 %cmp20 to i32
  store i32 %conv21, i32* %m1, align 4
  %27 = load i32, i32* %m1, align 4
  %tobool = icmp ne i32 %27, 0
  br i1 %tobool, label %if.then22, label %if.end34

if.then22:                                        ; preds = %for.body
  %28 = load i8*, i8** %srest, align 4
  %29 = load i8*, i8** %s.addr, align 4
  %cmp23 = icmp ugt i8* %28, %29
  br i1 %cmp23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then22
  %30 = load i32, i32* %flags.addr, align 4
  %and = and i32 %30, -5
  br label %cond.end

cond.false:                                       ; preds = %if.then22
  %31 = load i32, i32* %flags.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %and, %cond.true ], [ %31, %cond.false ]
  store i32 %cond, i32* %xflags, align 4
  %32 = load i8*, i8** %srest, align 4
  %33 = load i8*, i8** %se.addr, align 4
  %34 = load i8*, i8** %prest, align 4
  %35 = load i8*, i8** %pe.addr, align 4
  %36 = load i32, i32* %xflags, align 4
  %call25 = call i32 @gmatch(i8* %32, i8* %33, i8* %34, i8* %35, i32 %36)
  %cmp26 = icmp eq i32 %call25, 0
  br i1 %cmp26, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %cond.end
  %37 = load i8*, i8** %s.addr, align 4
  %38 = load i8*, i8** %srest, align 4
  %cmp28 = icmp ne i8* %37, %38
  br i1 %cmp28, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %39 = load i8*, i8** %srest, align 4
  %40 = load i8*, i8** %se.addr, align 4
  %41 = load i8*, i8** %p.addr, align 4
  %add.ptr30 = getelementptr inbounds i8, i8* %41, i32 -1
  %42 = load i8*, i8** %pe.addr, align 4
  %43 = load i32, i32* %xflags, align 4
  %call31 = call i32 @gmatch(i8* %39, i8* %40, i8* %add.ptr30, i8* %42, i32 %43)
  %cmp32 = icmp eq i32 %call31, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %44 = phi i1 [ false, %lor.rhs ], [ %cmp32, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %cond.end
  %45 = phi i1 [ true, %cond.end ], [ %44, %land.end ]
  %lor.ext = zext i1 %45 to i32
  store i32 %lor.ext, i32* %m2, align 4
  br label %if.end34

if.end34:                                         ; preds = %lor.end, %for.body
  %46 = load i32, i32* %m1, align 4
  %tobool35 = icmp ne i32 %46, 0
  br i1 %tobool35, label %land.lhs.true36, label %if.end39

land.lhs.true36:                                  ; preds = %if.end34
  %47 = load i32, i32* %m2, align 4
  %tobool37 = icmp ne i32 %47, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %land.lhs.true36
  store i32 0, i32* %retval, align 4
  br label %return

if.end39:                                         ; preds = %land.lhs.true36, %if.end34
  br label %for.inc

for.inc:                                          ; preds = %if.end39
  %48 = load i8*, i8** %srest, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr, i8** %srest, align 4
  br label %for.cond15

for.end:                                          ; preds = %for.cond15
  %49 = load i8*, i8** %pnext, align 4
  %50 = load i8*, i8** %prest, align 4
  %cmp40 = icmp eq i8* %49, %50
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %for.end
  br label %for.end45

if.end43:                                         ; preds = %for.end
  br label %for.inc44

for.inc44:                                        ; preds = %if.end43
  %51 = load i8*, i8** %pnext, align 4
  store i8* %51, i8** %psub, align 4
  br label %for.cond

for.end45:                                        ; preds = %if.then42
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb46:                                          ; preds = %if.end, %if.end
  %52 = load i32, i32* %xc.addr, align 4
  %cmp47 = icmp eq i32 %52, 63
  br i1 %cmp47, label %land.lhs.true49, label %if.end54

land.lhs.true49:                                  ; preds = %sw.bb46
  %53 = load i8*, i8** %s.addr, align 4
  %54 = load i8*, i8** %se.addr, align 4
  %55 = load i8*, i8** %prest, align 4
  %56 = load i8*, i8** %pe.addr, align 4
  %57 = load i32, i32* %flags.addr, align 4
  %call50 = call i32 @gmatch(i8* %53, i8* %54, i8* %55, i8* %56, i32 %57)
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %land.lhs.true49
  store i32 0, i32* %retval, align 4
  br label %return

if.end54:                                         ; preds = %land.lhs.true49, %sw.bb46
  %58 = load i8*, i8** %p.addr, align 4
  %add.ptr55 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %add.ptr55, i8** %psub, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc92, %if.end54
  %59 = load i8*, i8** %psub, align 4
  %60 = load i8*, i8** %pe.addr, align 4
  %call57 = call i8* @glob_patscan(i8* %59, i8* %60, i32 124)
  store i8* %call57, i8** %pnext, align 4
  %61 = load i8*, i8** %prest, align 4
  %62 = load i8*, i8** %pe.addr, align 4
  %cmp58 = icmp eq i8* %61, %62
  br i1 %cmp58, label %cond.true60, label %cond.false61

cond.true60:                                      ; preds = %for.cond56
  %63 = load i8*, i8** %se.addr, align 4
  br label %cond.end62

cond.false61:                                     ; preds = %for.cond56
  %64 = load i8*, i8** %s.addr, align 4
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false61, %cond.true60
  %cond63 = phi i8* [ %63, %cond.true60 ], [ %64, %cond.false61 ]
  store i8* %cond63, i8** %srest, align 4
  br label %for.cond64

for.cond64:                                       ; preds = %for.inc85, %cond.end62
  %65 = load i8*, i8** %srest, align 4
  %66 = load i8*, i8** %se.addr, align 4
  %cmp65 = icmp ule i8* %65, %66
  br i1 %cmp65, label %for.body67, label %for.end87

for.body67:                                       ; preds = %for.cond64
  %67 = load i8*, i8** %srest, align 4
  %68 = load i8*, i8** %s.addr, align 4
  %cmp68 = icmp ugt i8* %67, %68
  br i1 %cmp68, label %cond.true70, label %cond.false72

cond.true70:                                      ; preds = %for.body67
  %69 = load i32, i32* %flags.addr, align 4
  %and71 = and i32 %69, -5
  br label %cond.end73

cond.false72:                                     ; preds = %for.body67
  %70 = load i32, i32* %flags.addr, align 4
  br label %cond.end73

cond.end73:                                       ; preds = %cond.false72, %cond.true70
  %cond74 = phi i32 [ %and71, %cond.true70 ], [ %70, %cond.false72 ]
  store i32 %cond74, i32* %xflags, align 4
  %71 = load i8*, i8** %s.addr, align 4
  %72 = load i8*, i8** %srest, align 4
  %73 = load i8*, i8** %psub, align 4
  %74 = load i8*, i8** %pnext, align 4
  %add.ptr75 = getelementptr inbounds i8, i8* %74, i32 -1
  %75 = load i32, i32* %flags.addr, align 4
  %call76 = call i32 @gmatch(i8* %71, i8* %72, i8* %73, i8* %add.ptr75, i32 %75)
  %cmp77 = icmp eq i32 %call76, 0
  br i1 %cmp77, label %land.lhs.true79, label %if.end84

land.lhs.true79:                                  ; preds = %cond.end73
  %76 = load i8*, i8** %srest, align 4
  %77 = load i8*, i8** %se.addr, align 4
  %78 = load i8*, i8** %prest, align 4
  %79 = load i8*, i8** %pe.addr, align 4
  %80 = load i32, i32* %xflags, align 4
  %call80 = call i32 @gmatch(i8* %76, i8* %77, i8* %78, i8* %79, i32 %80)
  %cmp81 = icmp eq i32 %call80, 0
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %land.lhs.true79
  store i32 0, i32* %retval, align 4
  br label %return

if.end84:                                         ; preds = %land.lhs.true79, %cond.end73
  br label %for.inc85

for.inc85:                                        ; preds = %if.end84
  %81 = load i8*, i8** %srest, align 4
  %incdec.ptr86 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %incdec.ptr86, i8** %srest, align 4
  br label %for.cond64

for.end87:                                        ; preds = %for.cond64
  %82 = load i8*, i8** %pnext, align 4
  %83 = load i8*, i8** %prest, align 4
  %cmp88 = icmp eq i8* %82, %83
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %for.end87
  br label %for.end93

if.end91:                                         ; preds = %for.end87
  br label %for.inc92

for.inc92:                                        ; preds = %if.end91
  %84 = load i8*, i8** %pnext, align 4
  store i8* %84, i8** %psub, align 4
  br label %for.cond56

for.end93:                                        ; preds = %if.then90
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb94:                                          ; preds = %if.end
  %85 = load i8*, i8** %s.addr, align 4
  store i8* %85, i8** %srest, align 4
  br label %for.cond95

for.cond95:                                       ; preds = %for.inc129, %sw.bb94
  %86 = load i8*, i8** %srest, align 4
  %87 = load i8*, i8** %se.addr, align 4
  %cmp96 = icmp ule i8* %86, %87
  br i1 %cmp96, label %for.body98, label %for.end131

for.body98:                                       ; preds = %for.cond95
  store i32 0, i32* %m1, align 4
  %88 = load i8*, i8** %p.addr, align 4
  %add.ptr99 = getelementptr inbounds i8, i8* %88, i32 1
  store i8* %add.ptr99, i8** %psub, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc112, %for.body98
  %89 = load i8*, i8** %psub, align 4
  %90 = load i8*, i8** %pe.addr, align 4
  %call101 = call i8* @glob_patscan(i8* %89, i8* %90, i32 124)
  store i8* %call101, i8** %pnext, align 4
  %91 = load i8*, i8** %s.addr, align 4
  %92 = load i8*, i8** %srest, align 4
  %93 = load i8*, i8** %psub, align 4
  %94 = load i8*, i8** %pnext, align 4
  %add.ptr102 = getelementptr inbounds i8, i8* %94, i32 -1
  %95 = load i32, i32* %flags.addr, align 4
  %call103 = call i32 @gmatch(i8* %91, i8* %92, i8* %93, i8* %add.ptr102, i32 %95)
  %cmp104 = icmp eq i32 %call103, 0
  %conv105 = zext i1 %cmp104 to i32
  store i32 %conv105, i32* %m1, align 4
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %for.cond100
  br label %for.end113

if.end107:                                        ; preds = %for.cond100
  %96 = load i8*, i8** %pnext, align 4
  %97 = load i8*, i8** %prest, align 4
  %cmp108 = icmp eq i8* %96, %97
  br i1 %cmp108, label %if.then110, label %if.end111

if.then110:                                       ; preds = %if.end107
  br label %for.end113

if.end111:                                        ; preds = %if.end107
  br label %for.inc112

for.inc112:                                       ; preds = %if.end111
  %98 = load i8*, i8** %pnext, align 4
  store i8* %98, i8** %psub, align 4
  br label %for.cond100

for.end113:                                       ; preds = %if.then110, %if.then106
  %99 = load i8*, i8** %srest, align 4
  %100 = load i8*, i8** %s.addr, align 4
  %cmp114 = icmp ugt i8* %99, %100
  br i1 %cmp114, label %cond.true116, label %cond.false118

cond.true116:                                     ; preds = %for.end113
  %101 = load i32, i32* %flags.addr, align 4
  %and117 = and i32 %101, -5
  br label %cond.end119

cond.false118:                                    ; preds = %for.end113
  %102 = load i32, i32* %flags.addr, align 4
  br label %cond.end119

cond.end119:                                      ; preds = %cond.false118, %cond.true116
  %cond120 = phi i32 [ %and117, %cond.true116 ], [ %102, %cond.false118 ]
  store i32 %cond120, i32* %xflags, align 4
  %103 = load i32, i32* %m1, align 4
  %cmp121 = icmp eq i32 %103, 0
  br i1 %cmp121, label %land.lhs.true123, label %if.end128

land.lhs.true123:                                 ; preds = %cond.end119
  %104 = load i8*, i8** %srest, align 4
  %105 = load i8*, i8** %se.addr, align 4
  %106 = load i8*, i8** %prest, align 4
  %107 = load i8*, i8** %pe.addr, align 4
  %108 = load i32, i32* %xflags, align 4
  %call124 = call i32 @gmatch(i8* %104, i8* %105, i8* %106, i8* %107, i32 %108)
  %cmp125 = icmp eq i32 %call124, 0
  br i1 %cmp125, label %if.then127, label %if.end128

if.then127:                                       ; preds = %land.lhs.true123
  store i32 0, i32* %retval, align 4
  br label %return

if.end128:                                        ; preds = %land.lhs.true123, %cond.end119
  br label %for.inc129

for.inc129:                                       ; preds = %if.end128
  %109 = load i8*, i8** %srest, align 4
  %incdec.ptr130 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %incdec.ptr130, i8** %srest, align 4
  br label %for.cond95

for.end131:                                       ; preds = %for.cond95
  store i32 1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %for.end131, %if.then127, %for.end93, %if.then83, %if.then53, %for.end45, %if.then38, %if.then11, %if.then
  %110 = load i32, i32* %retval, align 4
  ret i32 %110
}

declare i8* @memchr(i8*, i32, i32) #1

declare i8* @strchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @brackmatch(i8* %p, i8 zeroext %test, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %p.addr = alloca i8*, align 4
  %test.addr = alloca i8, align 1
  %flags.addr = alloca i32, align 4
  %cstart = alloca i8, align 1
  %cend = alloca i8, align 1
  %c = alloca i8, align 1
  %not = alloca i32, align 4
  %brcnt = alloca i32, align 4
  %forcecoll = alloca i32, align 4
  %pc = alloca i32, align 4
  %savep = alloca i8*, align 4
  %close = alloca i8*, align 4
  %ccname = alloca i8*, align 4
  store i8* %p, i8** %p.addr, align 4
  store i8 %test, i8* %test.addr, align 1
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false6

cond.true:                                        ; preds = %entry
  %1 = load i8, i8* %test.addr, align 1
  %conv = zext i8 %1 to i32
  %call = call i32 @isupper(i32 %conv) #4
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %cond.true2, label %cond.false

cond.true2:                                       ; preds = %cond.true
  %2 = load i8, i8* %test.addr, align 1
  %conv3 = zext i8 %2 to i32
  %call4 = call i32 @tolower(i32 %conv3) #4
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %3 = load i8, i8* %test.addr, align 1
  %conv5 = zext i8 %3 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true2
  %cond = phi i32 [ %call4, %cond.true2 ], [ %conv5, %cond.false ]
  br label %cond.end8

cond.false6:                                      ; preds = %entry
  %4 = load i8, i8* %test.addr, align 1
  %conv7 = zext i8 %4 to i32
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.end
  %cond9 = phi i32 [ %cond, %cond.end ], [ %conv7, %cond.false6 ]
  %conv10 = trunc i32 %cond9 to i8
  store i8 %conv10, i8* %test.addr, align 1
  %5 = load i8*, i8** %p.addr, align 4
  store i8* %5, i8** %savep, align 4
  %6 = load i8*, i8** %p.addr, align 4
  %7 = load i8, i8* %6, align 1
  %conv11 = zext i8 %7 to i32
  %cmp = icmp eq i32 %conv11, 33
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %cond.end8
  %8 = load i8*, i8** %p.addr, align 4
  %9 = load i8, i8* %8, align 1
  %conv13 = zext i8 %9 to i32
  %cmp14 = icmp eq i32 %conv13, 94
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %cond.end8
  %10 = phi i1 [ true, %cond.end8 ], [ %cmp14, %lor.rhs ]
  %lor.ext = zext i1 %10 to i32
  store i32 %lor.ext, i32* %not, align 4
  br i1 %10, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  %11 = load i8*, i8** %p.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %p.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.end
  %12 = load i8*, i8** %p.addr, align 4
  %incdec.ptr16 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr16, i8** %p.addr, align 4
  %13 = load i8, i8* %12, align 1
  store i8 %13, i8* %c, align 1
  br label %for.cond

for.cond:                                         ; preds = %if.end396, %cond.end374, %cond.end182, %cond.end87, %if.end
  %14 = load i8, i8* %c, align 1
  store i8 %14, i8* %cend, align 1
  store i8 %14, i8* %cstart, align 1
  store i32 0, i32* %forcecoll, align 4
  %15 = load i8, i8* %c, align 1
  %conv17 = zext i8 %15 to i32
  %cmp18 = icmp eq i32 %conv17, 91
  br i1 %cmp18, label %land.lhs.true, label %if.end90

land.lhs.true:                                    ; preds = %for.cond
  %16 = load i8*, i8** %p.addr, align 4
  %17 = load i8, i8* %16, align 1
  %conv20 = zext i8 %17 to i32
  %cmp21 = icmp eq i32 %conv20, 61
  br i1 %cmp21, label %land.lhs.true23, label %if.end90

land.lhs.true23:                                  ; preds = %land.lhs.true
  %18 = load i8*, i8** %p.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %18, i32 2
  %19 = load i8, i8* %arrayidx, align 1
  %conv24 = zext i8 %19 to i32
  %cmp25 = icmp eq i32 %conv24, 61
  br i1 %cmp25, label %land.lhs.true27, label %if.end90

land.lhs.true27:                                  ; preds = %land.lhs.true23
  %20 = load i8*, i8** %p.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %20, i32 3
  %21 = load i8, i8* %arrayidx28, align 1
  %conv29 = zext i8 %21 to i32
  %cmp30 = icmp eq i32 %conv29, 93
  br i1 %cmp30, label %if.then32, label %if.end90

if.then32:                                        ; preds = %land.lhs.true27
  %22 = load i32, i32* %flags.addr, align 4
  %and33 = and i32 %22, 16
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %cond.true35, label %cond.false49

cond.true35:                                      ; preds = %if.then32
  %23 = load i8*, i8** %p.addr, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %23, i32 1
  %24 = load i8, i8* %arrayidx36, align 1
  %conv37 = zext i8 %24 to i32
  %call38 = call i32 @isupper(i32 %conv37) #4
  %tobool39 = icmp ne i32 %call38, 0
  br i1 %tobool39, label %cond.true40, label %cond.false44

cond.true40:                                      ; preds = %cond.true35
  %25 = load i8*, i8** %p.addr, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %25, i32 1
  %26 = load i8, i8* %arrayidx41, align 1
  %conv42 = zext i8 %26 to i32
  %call43 = call i32 @tolower(i32 %conv42) #4
  br label %cond.end47

cond.false44:                                     ; preds = %cond.true35
  %27 = load i8*, i8** %p.addr, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %27, i32 1
  %28 = load i8, i8* %arrayidx45, align 1
  %conv46 = zext i8 %28 to i32
  br label %cond.end47

cond.end47:                                       ; preds = %cond.false44, %cond.true40
  %cond48 = phi i32 [ %call43, %cond.true40 ], [ %conv46, %cond.false44 ]
  br label %cond.end52

cond.false49:                                     ; preds = %if.then32
  %29 = load i8*, i8** %p.addr, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %29, i32 1
  %30 = load i8, i8* %arrayidx50, align 1
  %conv51 = zext i8 %30 to i32
  br label %cond.end52

cond.end52:                                       ; preds = %cond.false49, %cond.end47
  %cond53 = phi i32 [ %cond48, %cond.end47 ], [ %conv51, %cond.false49 ]
  store i32 %cond53, i32* %pc, align 4
  %31 = load i8*, i8** %p.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %31, i32 4
  store i8* %add.ptr, i8** %p.addr, align 4
  %32 = load i8, i8* %test.addr, align 1
  %conv54 = zext i8 %32 to i32
  %33 = load i32, i32* %pc, align 4
  %call55 = call i32 @collequiv(i32 %conv54, i32 %33)
  %tobool56 = icmp ne i32 %call55, 0
  br i1 %tobool56, label %if.then57, label %if.else

if.then57:                                        ; preds = %cond.end52
  %34 = load i8*, i8** %p.addr, align 4
  %incdec.ptr58 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr58, i8** %p.addr, align 4
  br label %matched

if.else:                                          ; preds = %cond.end52
  %35 = load i8*, i8** %p.addr, align 4
  %incdec.ptr59 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr59, i8** %p.addr, align 4
  %36 = load i8, i8* %35, align 1
  store i8 %36, i8* %c, align 1
  %37 = load i8, i8* %c, align 1
  %conv60 = zext i8 %37 to i32
  %cmp61 = icmp eq i32 %conv60, 0
  br i1 %cmp61, label %if.then63, label %if.end71

if.then63:                                        ; preds = %if.else
  %38 = load i8, i8* %test.addr, align 1
  %conv64 = zext i8 %38 to i32
  %cmp65 = icmp eq i32 %conv64, 91
  br i1 %cmp65, label %cond.true67, label %cond.false68

cond.true67:                                      ; preds = %if.then63
  %39 = load i8*, i8** %savep, align 4
  br label %cond.end69

cond.false68:                                     ; preds = %if.then63
  br label %cond.end69

cond.end69:                                       ; preds = %cond.false68, %cond.true67
  %cond70 = phi i8* [ %39, %cond.true67 ], [ null, %cond.false68 ]
  store i8* %cond70, i8** %retval, align 4
  br label %return

if.end71:                                         ; preds = %if.else
  %40 = load i32, i32* %flags.addr, align 4
  %and72 = and i32 %40, 16
  %tobool73 = icmp ne i32 %and72, 0
  br i1 %tobool73, label %cond.true74, label %cond.false85

cond.true74:                                      ; preds = %if.end71
  %41 = load i8, i8* %c, align 1
  %conv75 = zext i8 %41 to i32
  %call76 = call i32 @isupper(i32 %conv75) #4
  %tobool77 = icmp ne i32 %call76, 0
  br i1 %tobool77, label %cond.true78, label %cond.false81

cond.true78:                                      ; preds = %cond.true74
  %42 = load i8, i8* %c, align 1
  %conv79 = zext i8 %42 to i32
  %call80 = call i32 @tolower(i32 %conv79) #4
  br label %cond.end83

cond.false81:                                     ; preds = %cond.true74
  %43 = load i8, i8* %c, align 1
  %conv82 = zext i8 %43 to i32
  br label %cond.end83

cond.end83:                                       ; preds = %cond.false81, %cond.true78
  %cond84 = phi i32 [ %call80, %cond.true78 ], [ %conv82, %cond.false81 ]
  br label %cond.end87

cond.false85:                                     ; preds = %if.end71
  %44 = load i8, i8* %c, align 1
  %conv86 = zext i8 %44 to i32
  br label %cond.end87

cond.end87:                                       ; preds = %cond.false85, %cond.end83
  %cond88 = phi i32 [ %cond84, %cond.end83 ], [ %conv86, %cond.false85 ]
  %conv89 = trunc i32 %cond88 to i8
  store i8 %conv89, i8* %c, align 1
  br label %for.cond

if.end90:                                         ; preds = %land.lhs.true27, %land.lhs.true23, %land.lhs.true, %for.cond
  %45 = load i8, i8* %c, align 1
  %conv91 = zext i8 %45 to i32
  %cmp92 = icmp eq i32 %conv91, 91
  br i1 %cmp92, label %land.lhs.true94, label %if.end185

land.lhs.true94:                                  ; preds = %if.end90
  %46 = load i8*, i8** %p.addr, align 4
  %47 = load i8, i8* %46, align 1
  %conv95 = zext i8 %47 to i32
  %cmp96 = icmp eq i32 %conv95, 58
  br i1 %cmp96, label %if.then98, label %if.end185

if.then98:                                        ; preds = %land.lhs.true94
  store i32 0, i32* %pc, align 4
  %48 = load i8*, i8** %p.addr, align 4
  %add.ptr99 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %add.ptr99, i8** %close, align 4
  br label %for.cond100

for.cond100:                                      ; preds = %for.inc, %if.then98
  %49 = load i8*, i8** %close, align 4
  %50 = load i8, i8* %49, align 1
  %conv101 = zext i8 %50 to i32
  %cmp102 = icmp ne i32 %conv101, 0
  br i1 %cmp102, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond100
  %51 = load i8*, i8** %close, align 4
  %52 = load i8, i8* %51, align 1
  %conv104 = zext i8 %52 to i32
  %cmp105 = icmp eq i32 %conv104, 58
  br i1 %cmp105, label %land.lhs.true107, label %if.end113

land.lhs.true107:                                 ; preds = %for.body
  %53 = load i8*, i8** %close, align 4
  %add.ptr108 = getelementptr inbounds i8, i8* %53, i32 1
  %54 = load i8, i8* %add.ptr108, align 1
  %conv109 = zext i8 %54 to i32
  %cmp110 = icmp eq i32 %conv109, 93
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %land.lhs.true107
  br label %for.end

if.end113:                                        ; preds = %land.lhs.true107, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end113
  %55 = load i8*, i8** %close, align 4
  %incdec.ptr114 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr114, i8** %close, align 4
  br label %for.cond100

for.end:                                          ; preds = %if.then112, %for.cond100
  %56 = load i8*, i8** %close, align 4
  %57 = load i8, i8* %56, align 1
  %conv115 = zext i8 %57 to i32
  %cmp116 = icmp ne i32 %conv115, 0
  br i1 %cmp116, label %if.then118, label %if.end143

if.then118:                                       ; preds = %for.end
  %58 = load i8*, i8** %close, align 4
  %59 = load i8*, i8** %p.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %58 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %59 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %mul = mul i32 %sub.ptr.sub, 1
  %call119 = call i8* @malloc(i32 %mul)
  store i8* %call119, i8** %ccname, align 4
  %60 = load i8*, i8** %ccname, align 4
  %cmp120 = icmp eq i8* %60, null
  br i1 %cmp120, label %if.then122, label %if.else123

if.then122:                                       ; preds = %if.then118
  store i32 0, i32* %pc, align 4
  br label %if.end136

if.else123:                                       ; preds = %if.then118
  %61 = load i8*, i8** %p.addr, align 4
  %add.ptr124 = getelementptr inbounds i8, i8* %61, i32 1
  %62 = load i8*, i8** %ccname, align 4
  %63 = load i8*, i8** %close, align 4
  %64 = load i8*, i8** %p.addr, align 4
  %sub.ptr.lhs.cast125 = ptrtoint i8* %63 to i32
  %sub.ptr.rhs.cast126 = ptrtoint i8* %64 to i32
  %sub.ptr.sub127 = sub i32 %sub.ptr.lhs.cast125, %sub.ptr.rhs.cast126
  %sub = sub nsw i32 %sub.ptr.sub127, 1
  %mul128 = mul i32 %sub, 1
  call void @bcopy(i8* %add.ptr124, i8* %62, i32 %mul128)
  %65 = load i8*, i8** %ccname, align 4
  %66 = load i8*, i8** %close, align 4
  %67 = load i8*, i8** %p.addr, align 4
  %sub.ptr.lhs.cast129 = ptrtoint i8* %66 to i32
  %sub.ptr.rhs.cast130 = ptrtoint i8* %67 to i32
  %sub.ptr.sub131 = sub i32 %sub.ptr.lhs.cast129, %sub.ptr.rhs.cast130
  %sub132 = sub nsw i32 %sub.ptr.sub131, 1
  %add.ptr133 = getelementptr inbounds i8, i8* %65, i32 %sub132
  store i8 0, i8* %add.ptr133, align 1
  %68 = load i8, i8* %test.addr, align 1
  %conv134 = zext i8 %68 to i32
  %69 = load i8*, i8** %ccname, align 4
  %call135 = call i32 @is_cclass(i32 %conv134, i8* %69)
  store i32 %call135, i32* %pc, align 4
  br label %if.end136

if.end136:                                        ; preds = %if.else123, %if.then122
  %70 = load i32, i32* %pc, align 4
  %cmp137 = icmp eq i32 %70, -1
  br i1 %cmp137, label %if.then139, label %if.else140

if.then139:                                       ; preds = %if.end136
  store i32 0, i32* %pc, align 4
  br label %if.end142

if.else140:                                       ; preds = %if.end136
  %71 = load i8*, i8** %close, align 4
  %add.ptr141 = getelementptr inbounds i8, i8* %71, i32 2
  store i8* %add.ptr141, i8** %p.addr, align 4
  br label %if.end142

if.end142:                                        ; preds = %if.else140, %if.then139
  %72 = load i8*, i8** %ccname, align 4
  call void @sh_xfree(i8* %72, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 434)
  br label %if.end143

if.end143:                                        ; preds = %if.end142, %for.end
  %73 = load i32, i32* %pc, align 4
  %tobool144 = icmp ne i32 %73, 0
  br i1 %tobool144, label %if.then145, label %if.else147

if.then145:                                       ; preds = %if.end143
  %74 = load i8*, i8** %p.addr, align 4
  %incdec.ptr146 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %incdec.ptr146, i8** %p.addr, align 4
  br label %matched

if.else147:                                       ; preds = %if.end143
  %75 = load i8*, i8** %p.addr, align 4
  %incdec.ptr148 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %incdec.ptr148, i8** %p.addr, align 4
  %76 = load i8, i8* %75, align 1
  store i8 %76, i8* %c, align 1
  %77 = load i8, i8* %c, align 1
  %conv149 = zext i8 %77 to i32
  %cmp150 = icmp eq i32 %conv149, 0
  br i1 %cmp150, label %if.then152, label %if.else160

if.then152:                                       ; preds = %if.else147
  %78 = load i8, i8* %test.addr, align 1
  %conv153 = zext i8 %78 to i32
  %cmp154 = icmp eq i32 %conv153, 91
  br i1 %cmp154, label %cond.true156, label %cond.false157

cond.true156:                                     ; preds = %if.then152
  %79 = load i8*, i8** %savep, align 4
  br label %cond.end158

cond.false157:                                    ; preds = %if.then152
  br label %cond.end158

cond.end158:                                      ; preds = %cond.false157, %cond.true156
  %cond159 = phi i8* [ %79, %cond.true156 ], [ null, %cond.false157 ]
  store i8* %cond159, i8** %retval, align 4
  br label %return

if.else160:                                       ; preds = %if.else147
  %80 = load i8, i8* %c, align 1
  %conv161 = zext i8 %80 to i32
  %cmp162 = icmp eq i32 %conv161, 93
  br i1 %cmp162, label %if.then164, label %if.end165

if.then164:                                       ; preds = %if.else160
  br label %for.end397

if.end165:                                        ; preds = %if.else160
  br label %if.end166

if.end166:                                        ; preds = %if.end165
  %81 = load i32, i32* %flags.addr, align 4
  %and167 = and i32 %81, 16
  %tobool168 = icmp ne i32 %and167, 0
  br i1 %tobool168, label %cond.true169, label %cond.false180

cond.true169:                                     ; preds = %if.end166
  %82 = load i8, i8* %c, align 1
  %conv170 = zext i8 %82 to i32
  %call171 = call i32 @isupper(i32 %conv170) #4
  %tobool172 = icmp ne i32 %call171, 0
  br i1 %tobool172, label %cond.true173, label %cond.false176

cond.true173:                                     ; preds = %cond.true169
  %83 = load i8, i8* %c, align 1
  %conv174 = zext i8 %83 to i32
  %call175 = call i32 @tolower(i32 %conv174) #4
  br label %cond.end178

cond.false176:                                    ; preds = %cond.true169
  %84 = load i8, i8* %c, align 1
  %conv177 = zext i8 %84 to i32
  br label %cond.end178

cond.end178:                                      ; preds = %cond.false176, %cond.true173
  %cond179 = phi i32 [ %call175, %cond.true173 ], [ %conv177, %cond.false176 ]
  br label %cond.end182

cond.false180:                                    ; preds = %if.end166
  %85 = load i8, i8* %c, align 1
  %conv181 = zext i8 %85 to i32
  br label %cond.end182

cond.end182:                                      ; preds = %cond.false180, %cond.end178
  %cond183 = phi i32 [ %cond179, %cond.end178 ], [ %conv181, %cond.false180 ]
  %conv184 = trunc i32 %cond183 to i8
  store i8 %conv184, i8* %c, align 1
  br label %for.cond

if.end185:                                        ; preds = %land.lhs.true94, %if.end90
  %86 = load i8, i8* %c, align 1
  %conv186 = zext i8 %86 to i32
  %cmp187 = icmp eq i32 %conv186, 91
  br i1 %cmp187, label %land.lhs.true189, label %if.end203

land.lhs.true189:                                 ; preds = %if.end185
  %87 = load i8*, i8** %p.addr, align 4
  %88 = load i8, i8* %87, align 1
  %conv190 = zext i8 %88 to i32
  %cmp191 = icmp eq i32 %conv190, 46
  br i1 %cmp191, label %if.then193, label %if.end203

if.then193:                                       ; preds = %land.lhs.true189
  %89 = load i8*, i8** %p.addr, align 4
  %call194 = call i8* @parse_collsym(i8* %89, i32* %pc)
  store i8* %call194, i8** %p.addr, align 4
  %90 = load i32, i32* %pc, align 4
  %cmp195 = icmp eq i32 %90, -1
  br i1 %cmp195, label %cond.true197, label %cond.false199

cond.true197:                                     ; preds = %if.then193
  %91 = load i8, i8* %test.addr, align 1
  %conv198 = zext i8 %91 to i32
  %add = add nsw i32 %conv198, 1
  br label %cond.end200

cond.false199:                                    ; preds = %if.then193
  %92 = load i32, i32* %pc, align 4
  br label %cond.end200

cond.end200:                                      ; preds = %cond.false199, %cond.true197
  %cond201 = phi i32 [ %add, %cond.true197 ], [ %92, %cond.false199 ]
  %conv202 = trunc i32 %cond201 to i8
  store i8 %conv202, i8* %cstart, align 1
  store i32 1, i32* %forcecoll, align 4
  br label %if.end203

if.end203:                                        ; preds = %cond.end200, %land.lhs.true189, %if.end185
  %93 = load i32, i32* %flags.addr, align 4
  %and204 = and i32 %93, 2
  %tobool205 = icmp ne i32 %and204, 0
  br i1 %tobool205, label %if.end217, label %land.lhs.true206

land.lhs.true206:                                 ; preds = %if.end203
  %94 = load i8, i8* %c, align 1
  %conv207 = zext i8 %94 to i32
  %cmp208 = icmp eq i32 %conv207, 92
  br i1 %cmp208, label %if.then210, label %if.end217

if.then210:                                       ; preds = %land.lhs.true206
  %95 = load i8*, i8** %p.addr, align 4
  %96 = load i8, i8* %95, align 1
  %conv211 = zext i8 %96 to i32
  %cmp212 = icmp eq i32 %conv211, 0
  br i1 %cmp212, label %if.then214, label %if.end215

if.then214:                                       ; preds = %if.then210
  store i8* null, i8** %retval, align 4
  br label %return

if.end215:                                        ; preds = %if.then210
  %97 = load i8*, i8** %p.addr, align 4
  %incdec.ptr216 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %incdec.ptr216, i8** %p.addr, align 4
  %98 = load i8, i8* %97, align 1
  store i8 %98, i8* %cend, align 1
  store i8 %98, i8* %cstart, align 1
  br label %if.end217

if.end217:                                        ; preds = %if.end215, %land.lhs.true206, %if.end203
  %99 = load i32, i32* %flags.addr, align 4
  %and218 = and i32 %99, 16
  %tobool219 = icmp ne i32 %and218, 0
  br i1 %tobool219, label %cond.true220, label %cond.false231

cond.true220:                                     ; preds = %if.end217
  %100 = load i8, i8* %cstart, align 1
  %conv221 = zext i8 %100 to i32
  %call222 = call i32 @isupper(i32 %conv221) #4
  %tobool223 = icmp ne i32 %call222, 0
  br i1 %tobool223, label %cond.true224, label %cond.false227

cond.true224:                                     ; preds = %cond.true220
  %101 = load i8, i8* %cstart, align 1
  %conv225 = zext i8 %101 to i32
  %call226 = call i32 @tolower(i32 %conv225) #4
  br label %cond.end229

cond.false227:                                    ; preds = %cond.true220
  %102 = load i8, i8* %cstart, align 1
  %conv228 = zext i8 %102 to i32
  br label %cond.end229

cond.end229:                                      ; preds = %cond.false227, %cond.true224
  %cond230 = phi i32 [ %call226, %cond.true224 ], [ %conv228, %cond.false227 ]
  br label %cond.end233

cond.false231:                                    ; preds = %if.end217
  %103 = load i8, i8* %cstart, align 1
  %conv232 = zext i8 %103 to i32
  br label %cond.end233

cond.end233:                                      ; preds = %cond.false231, %cond.end229
  %cond234 = phi i32 [ %cond230, %cond.end229 ], [ %conv232, %cond.false231 ]
  %conv235 = trunc i32 %cond234 to i8
  store i8 %conv235, i8* %cend, align 1
  store i8 %conv235, i8* %cstart, align 1
  %104 = load i8, i8* %c, align 1
  %conv236 = zext i8 %104 to i32
  %cmp237 = icmp eq i32 %conv236, 0
  br i1 %cmp237, label %if.then239, label %if.end247

if.then239:                                       ; preds = %cond.end233
  %105 = load i8, i8* %test.addr, align 1
  %conv240 = zext i8 %105 to i32
  %cmp241 = icmp eq i32 %conv240, 91
  br i1 %cmp241, label %cond.true243, label %cond.false244

cond.true243:                                     ; preds = %if.then239
  %106 = load i8*, i8** %savep, align 4
  br label %cond.end245

cond.false244:                                    ; preds = %if.then239
  br label %cond.end245

cond.end245:                                      ; preds = %cond.false244, %cond.true243
  %cond246 = phi i8* [ %106, %cond.true243 ], [ null, %cond.false244 ]
  store i8* %cond246, i8** %retval, align 4
  br label %return

if.end247:                                        ; preds = %cond.end233
  %107 = load i8*, i8** %p.addr, align 4
  %incdec.ptr248 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %incdec.ptr248, i8** %p.addr, align 4
  %108 = load i8, i8* %107, align 1
  store i8 %108, i8* %c, align 1
  %109 = load i32, i32* %flags.addr, align 4
  %and249 = and i32 %109, 16
  %tobool250 = icmp ne i32 %and249, 0
  br i1 %tobool250, label %cond.true251, label %cond.false262

cond.true251:                                     ; preds = %if.end247
  %110 = load i8, i8* %c, align 1
  %conv252 = zext i8 %110 to i32
  %call253 = call i32 @isupper(i32 %conv252) #4
  %tobool254 = icmp ne i32 %call253, 0
  br i1 %tobool254, label %cond.true255, label %cond.false258

cond.true255:                                     ; preds = %cond.true251
  %111 = load i8, i8* %c, align 1
  %conv256 = zext i8 %111 to i32
  %call257 = call i32 @tolower(i32 %conv256) #4
  br label %cond.end260

cond.false258:                                    ; preds = %cond.true251
  %112 = load i8, i8* %c, align 1
  %conv259 = zext i8 %112 to i32
  br label %cond.end260

cond.end260:                                      ; preds = %cond.false258, %cond.true255
  %cond261 = phi i32 [ %call257, %cond.true255 ], [ %conv259, %cond.false258 ]
  br label %cond.end264

cond.false262:                                    ; preds = %if.end247
  %113 = load i8, i8* %c, align 1
  %conv263 = zext i8 %113 to i32
  br label %cond.end264

cond.end264:                                      ; preds = %cond.false262, %cond.end260
  %cond265 = phi i32 [ %cond261, %cond.end260 ], [ %conv263, %cond.false262 ]
  %conv266 = trunc i32 %cond265 to i8
  store i8 %conv266, i8* %c, align 1
  %114 = load i8, i8* %c, align 1
  %conv267 = zext i8 %114 to i32
  %cmp268 = icmp eq i32 %conv267, 0
  br i1 %cmp268, label %if.then270, label %if.end278

if.then270:                                       ; preds = %cond.end264
  %115 = load i8, i8* %test.addr, align 1
  %conv271 = zext i8 %115 to i32
  %cmp272 = icmp eq i32 %conv271, 91
  br i1 %cmp272, label %cond.true274, label %cond.false275

cond.true274:                                     ; preds = %if.then270
  %116 = load i8*, i8** %savep, align 4
  br label %cond.end276

cond.false275:                                    ; preds = %if.then270
  br label %cond.end276

cond.end276:                                      ; preds = %cond.false275, %cond.true274
  %cond277 = phi i8* [ %116, %cond.true274 ], [ null, %cond.false275 ]
  store i8* %cond277, i8** %retval, align 4
  br label %return

if.end278:                                        ; preds = %cond.end264
  %117 = load i32, i32* %flags.addr, align 4
  %and279 = and i32 %117, 1
  %tobool280 = icmp ne i32 %and279, 0
  br i1 %tobool280, label %land.lhs.true281, label %if.end286

land.lhs.true281:                                 ; preds = %if.end278
  %118 = load i8, i8* %c, align 1
  %conv282 = zext i8 %118 to i32
  %cmp283 = icmp eq i32 %conv282, 47
  br i1 %cmp283, label %if.then285, label %if.end286

if.then285:                                       ; preds = %land.lhs.true281
  store i8* null, i8** %retval, align 4
  br label %return

if.end286:                                        ; preds = %land.lhs.true281, %if.end278
  %119 = load i8, i8* %c, align 1
  %conv287 = zext i8 %119 to i32
  %cmp288 = icmp eq i32 %conv287, 45
  br i1 %cmp288, label %land.lhs.true290, label %if.end378

land.lhs.true290:                                 ; preds = %if.end286
  %120 = load i8*, i8** %p.addr, align 4
  %121 = load i8, i8* %120, align 1
  %conv291 = zext i8 %121 to i32
  %cmp292 = icmp ne i32 %conv291, 93
  br i1 %cmp292, label %if.then294, label %if.end378

if.then294:                                       ; preds = %land.lhs.true290
  %122 = load i8*, i8** %p.addr, align 4
  %incdec.ptr295 = getelementptr inbounds i8, i8* %122, i32 1
  store i8* %incdec.ptr295, i8** %p.addr, align 4
  %123 = load i8, i8* %122, align 1
  store i8 %123, i8* %cend, align 1
  %124 = load i32, i32* %flags.addr, align 4
  %and296 = and i32 %124, 2
  %tobool297 = icmp ne i32 %and296, 0
  br i1 %tobool297, label %if.end304, label %land.lhs.true298

land.lhs.true298:                                 ; preds = %if.then294
  %125 = load i8, i8* %cend, align 1
  %conv299 = zext i8 %125 to i32
  %cmp300 = icmp eq i32 %conv299, 92
  br i1 %cmp300, label %if.then302, label %if.end304

if.then302:                                       ; preds = %land.lhs.true298
  %126 = load i8*, i8** %p.addr, align 4
  %incdec.ptr303 = getelementptr inbounds i8, i8* %126, i32 1
  store i8* %incdec.ptr303, i8** %p.addr, align 4
  %127 = load i8, i8* %126, align 1
  store i8 %127, i8* %cend, align 1
  br label %if.end304

if.end304:                                        ; preds = %if.then302, %land.lhs.true298, %if.then294
  %128 = load i8, i8* %cend, align 1
  %conv305 = zext i8 %128 to i32
  %cmp306 = icmp eq i32 %conv305, 0
  br i1 %cmp306, label %if.then308, label %if.end309

if.then308:                                       ; preds = %if.end304
  store i8* null, i8** %retval, align 4
  br label %return

if.end309:                                        ; preds = %if.end304
  %129 = load i8, i8* %cend, align 1
  %conv310 = zext i8 %129 to i32
  %cmp311 = icmp eq i32 %conv310, 91
  br i1 %cmp311, label %land.lhs.true313, label %if.end328

land.lhs.true313:                                 ; preds = %if.end309
  %130 = load i8*, i8** %p.addr, align 4
  %131 = load i8, i8* %130, align 1
  %conv314 = zext i8 %131 to i32
  %cmp315 = icmp eq i32 %conv314, 46
  br i1 %cmp315, label %if.then317, label %if.end328

if.then317:                                       ; preds = %land.lhs.true313
  %132 = load i8*, i8** %p.addr, align 4
  %call318 = call i8* @parse_collsym(i8* %132, i32* %pc)
  store i8* %call318, i8** %p.addr, align 4
  %133 = load i32, i32* %pc, align 4
  %cmp319 = icmp eq i32 %133, -1
  br i1 %cmp319, label %cond.true321, label %cond.false324

cond.true321:                                     ; preds = %if.then317
  %134 = load i8, i8* %test.addr, align 1
  %conv322 = zext i8 %134 to i32
  %sub323 = sub nsw i32 %conv322, 1
  br label %cond.end325

cond.false324:                                    ; preds = %if.then317
  %135 = load i32, i32* %pc, align 4
  br label %cond.end325

cond.end325:                                      ; preds = %cond.false324, %cond.true321
  %cond326 = phi i32 [ %sub323, %cond.true321 ], [ %135, %cond.false324 ]
  %conv327 = trunc i32 %cond326 to i8
  store i8 %conv327, i8* %cend, align 1
  store i32 1, i32* %forcecoll, align 4
  br label %if.end328

if.end328:                                        ; preds = %cond.end325, %land.lhs.true313, %if.end309
  %136 = load i32, i32* %flags.addr, align 4
  %and329 = and i32 %136, 16
  %tobool330 = icmp ne i32 %and329, 0
  br i1 %tobool330, label %cond.true331, label %cond.false342

cond.true331:                                     ; preds = %if.end328
  %137 = load i8, i8* %cend, align 1
  %conv332 = zext i8 %137 to i32
  %call333 = call i32 @isupper(i32 %conv332) #4
  %tobool334 = icmp ne i32 %call333, 0
  br i1 %tobool334, label %cond.true335, label %cond.false338

cond.true335:                                     ; preds = %cond.true331
  %138 = load i8, i8* %cend, align 1
  %conv336 = zext i8 %138 to i32
  %call337 = call i32 @tolower(i32 %conv336) #4
  br label %cond.end340

cond.false338:                                    ; preds = %cond.true331
  %139 = load i8, i8* %cend, align 1
  %conv339 = zext i8 %139 to i32
  br label %cond.end340

cond.end340:                                      ; preds = %cond.false338, %cond.true335
  %cond341 = phi i32 [ %call337, %cond.true335 ], [ %conv339, %cond.false338 ]
  br label %cond.end344

cond.false342:                                    ; preds = %if.end328
  %140 = load i8, i8* %cend, align 1
  %conv343 = zext i8 %140 to i32
  br label %cond.end344

cond.end344:                                      ; preds = %cond.false342, %cond.end340
  %cond345 = phi i32 [ %cond341, %cond.end340 ], [ %conv343, %cond.false342 ]
  %conv346 = trunc i32 %cond345 to i8
  store i8 %conv346, i8* %cend, align 1
  %141 = load i8*, i8** %p.addr, align 4
  %incdec.ptr347 = getelementptr inbounds i8, i8* %141, i32 1
  store i8* %incdec.ptr347, i8** %p.addr, align 4
  %142 = load i8, i8* %141, align 1
  store i8 %142, i8* %c, align 1
  %143 = load i8, i8* %cstart, align 1
  %conv348 = zext i8 %143 to i32
  %144 = load i8, i8* %cend, align 1
  %conv349 = zext i8 %144 to i32
  %145 = load i32, i32* %forcecoll, align 4
  %call350 = call i32 @rangecmp(i32 %conv348, i32 %conv349, i32 %145)
  %cmp351 = icmp sgt i32 %call350, 0
  br i1 %cmp351, label %if.then353, label %if.end377

if.then353:                                       ; preds = %cond.end344
  %146 = load i8, i8* %c, align 1
  %conv354 = zext i8 %146 to i32
  %cmp355 = icmp eq i32 %conv354, 93
  br i1 %cmp355, label %if.then357, label %if.end358

if.then357:                                       ; preds = %if.then353
  br label %for.end397

if.end358:                                        ; preds = %if.then353
  %147 = load i32, i32* %flags.addr, align 4
  %and359 = and i32 %147, 16
  %tobool360 = icmp ne i32 %and359, 0
  br i1 %tobool360, label %cond.true361, label %cond.false372

cond.true361:                                     ; preds = %if.end358
  %148 = load i8, i8* %c, align 1
  %conv362 = zext i8 %148 to i32
  %call363 = call i32 @isupper(i32 %conv362) #4
  %tobool364 = icmp ne i32 %call363, 0
  br i1 %tobool364, label %cond.true365, label %cond.false368

cond.true365:                                     ; preds = %cond.true361
  %149 = load i8, i8* %c, align 1
  %conv366 = zext i8 %149 to i32
  %call367 = call i32 @tolower(i32 %conv366) #4
  br label %cond.end370

cond.false368:                                    ; preds = %cond.true361
  %150 = load i8, i8* %c, align 1
  %conv369 = zext i8 %150 to i32
  br label %cond.end370

cond.end370:                                      ; preds = %cond.false368, %cond.true365
  %cond371 = phi i32 [ %call367, %cond.true365 ], [ %conv369, %cond.false368 ]
  br label %cond.end374

cond.false372:                                    ; preds = %if.end358
  %151 = load i8, i8* %c, align 1
  %conv373 = zext i8 %151 to i32
  br label %cond.end374

cond.end374:                                      ; preds = %cond.false372, %cond.end370
  %cond375 = phi i32 [ %cond371, %cond.end370 ], [ %conv373, %cond.false372 ]
  %conv376 = trunc i32 %cond375 to i8
  store i8 %conv376, i8* %c, align 1
  br label %for.cond

if.end377:                                        ; preds = %cond.end344
  br label %if.end378

if.end378:                                        ; preds = %if.end377, %land.lhs.true290, %if.end286
  %152 = load i8, i8* %test.addr, align 1
  %conv379 = zext i8 %152 to i32
  %153 = load i8, i8* %cstart, align 1
  %conv380 = zext i8 %153 to i32
  %154 = load i32, i32* %forcecoll, align 4
  %call381 = call i32 @rangecmp(i32 %conv379, i32 %conv380, i32 %154)
  %cmp382 = icmp sge i32 %call381, 0
  br i1 %cmp382, label %land.lhs.true384, label %if.end391

land.lhs.true384:                                 ; preds = %if.end378
  %155 = load i8, i8* %test.addr, align 1
  %conv385 = zext i8 %155 to i32
  %156 = load i8, i8* %cend, align 1
  %conv386 = zext i8 %156 to i32
  %157 = load i32, i32* %forcecoll, align 4
  %call387 = call i32 @rangecmp(i32 %conv385, i32 %conv386, i32 %157)
  %cmp388 = icmp sle i32 %call387, 0
  br i1 %cmp388, label %if.then390, label %if.end391

if.then390:                                       ; preds = %land.lhs.true384
  br label %matched

if.end391:                                        ; preds = %land.lhs.true384, %if.end378
  %158 = load i8, i8* %c, align 1
  %conv392 = zext i8 %158 to i32
  %cmp393 = icmp eq i32 %conv392, 93
  br i1 %cmp393, label %if.then395, label %if.end396

if.then395:                                       ; preds = %if.end391
  br label %for.end397

if.end396:                                        ; preds = %if.end391
  br label %for.cond

for.end397:                                       ; preds = %if.then395, %if.then357, %if.then164
  %159 = load i32, i32* %not, align 4
  %tobool398 = icmp ne i32 %159, 0
  br i1 %tobool398, label %cond.false400, label %cond.true399

cond.true399:                                     ; preds = %for.end397
  br label %cond.end401

cond.false400:                                    ; preds = %for.end397
  %160 = load i8*, i8** %p.addr, align 4
  br label %cond.end401

cond.end401:                                      ; preds = %cond.false400, %cond.true399
  %cond402 = phi i8* [ null, %cond.true399 ], [ %160, %cond.false400 ]
  store i8* %cond402, i8** %retval, align 4
  br label %return

matched:                                          ; preds = %if.then390, %if.then145, %if.then57
  %161 = load i8*, i8** %p.addr, align 4
  %incdec.ptr403 = getelementptr inbounds i8, i8* %161, i32 -1
  store i8* %incdec.ptr403, i8** %p.addr, align 4
  %162 = load i8, i8* %incdec.ptr403, align 1
  store i8 %162, i8* %c, align 1
  store i32 1, i32* %brcnt, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end455, %matched
  %163 = load i32, i32* %brcnt, align 4
  %cmp404 = icmp sgt i32 %163, 0
  br i1 %cmp404, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %164 = load i8, i8* %c, align 1
  %conv406 = zext i8 %164 to i32
  %cmp407 = icmp eq i32 %conv406, 0
  br i1 %cmp407, label %if.then409, label %if.end417

if.then409:                                       ; preds = %while.body
  %165 = load i8, i8* %test.addr, align 1
  %conv410 = zext i8 %165 to i32
  %cmp411 = icmp eq i32 %conv410, 91
  br i1 %cmp411, label %cond.true413, label %cond.false414

cond.true413:                                     ; preds = %if.then409
  %166 = load i8*, i8** %savep, align 4
  br label %cond.end415

cond.false414:                                    ; preds = %if.then409
  br label %cond.end415

cond.end415:                                      ; preds = %cond.false414, %cond.true413
  %cond416 = phi i8* [ %166, %cond.true413 ], [ null, %cond.false414 ]
  store i8* %cond416, i8** %retval, align 4
  br label %return

if.end417:                                        ; preds = %while.body
  %167 = load i8*, i8** %p.addr, align 4
  %incdec.ptr418 = getelementptr inbounds i8, i8* %167, i32 1
  store i8* %incdec.ptr418, i8** %p.addr, align 4
  %168 = load i8, i8* %167, align 1
  store i8 %168, i8* %c, align 1
  %169 = load i8, i8* %c, align 1
  %conv419 = zext i8 %169 to i32
  %cmp420 = icmp eq i32 %conv419, 91
  br i1 %cmp420, label %land.lhs.true422, label %if.else434

land.lhs.true422:                                 ; preds = %if.end417
  %170 = load i8*, i8** %p.addr, align 4
  %171 = load i8, i8* %170, align 1
  %conv423 = zext i8 %171 to i32
  %cmp424 = icmp eq i32 %conv423, 61
  br i1 %cmp424, label %if.then433, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true422
  %172 = load i8*, i8** %p.addr, align 4
  %173 = load i8, i8* %172, align 1
  %conv426 = zext i8 %173 to i32
  %cmp427 = icmp eq i32 %conv426, 58
  br i1 %cmp427, label %if.then433, label %lor.lhs.false429

lor.lhs.false429:                                 ; preds = %lor.lhs.false
  %174 = load i8*, i8** %p.addr, align 4
  %175 = load i8, i8* %174, align 1
  %conv430 = zext i8 %175 to i32
  %cmp431 = icmp eq i32 %conv430, 46
  br i1 %cmp431, label %if.then433, label %if.else434

if.then433:                                       ; preds = %lor.lhs.false429, %lor.lhs.false, %land.lhs.true422
  %176 = load i32, i32* %brcnt, align 4
  %inc = add nsw i32 %176, 1
  store i32 %inc, i32* %brcnt, align 4
  br label %if.end455

if.else434:                                       ; preds = %lor.lhs.false429, %if.end417
  %177 = load i8, i8* %c, align 1
  %conv435 = zext i8 %177 to i32
  %cmp436 = icmp eq i32 %conv435, 93
  br i1 %cmp436, label %if.then438, label %if.else439

if.then438:                                       ; preds = %if.else434
  %178 = load i32, i32* %brcnt, align 4
  %dec = add nsw i32 %178, -1
  store i32 %dec, i32* %brcnt, align 4
  br label %if.end454

if.else439:                                       ; preds = %if.else434
  %179 = load i32, i32* %flags.addr, align 4
  %and440 = and i32 %179, 2
  %tobool441 = icmp ne i32 %and440, 0
  br i1 %tobool441, label %if.end453, label %land.lhs.true442

land.lhs.true442:                                 ; preds = %if.else439
  %180 = load i8, i8* %c, align 1
  %conv443 = zext i8 %180 to i32
  %cmp444 = icmp eq i32 %conv443, 92
  br i1 %cmp444, label %if.then446, label %if.end453

if.then446:                                       ; preds = %land.lhs.true442
  %181 = load i8*, i8** %p.addr, align 4
  %182 = load i8, i8* %181, align 1
  %conv447 = zext i8 %182 to i32
  %cmp448 = icmp eq i32 %conv447, 0
  br i1 %cmp448, label %if.then450, label %if.end451

if.then450:                                       ; preds = %if.then446
  store i8* null, i8** %retval, align 4
  br label %return

if.end451:                                        ; preds = %if.then446
  %183 = load i8*, i8** %p.addr, align 4
  %incdec.ptr452 = getelementptr inbounds i8, i8* %183, i32 1
  store i8* %incdec.ptr452, i8** %p.addr, align 4
  br label %if.end453

if.end453:                                        ; preds = %if.end451, %land.lhs.true442, %if.else439
  br label %if.end454

if.end454:                                        ; preds = %if.end453, %if.then438
  br label %if.end455

if.end455:                                        ; preds = %if.end454, %if.then433
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %184 = load i32, i32* %not, align 4
  %tobool456 = icmp ne i32 %184, 0
  br i1 %tobool456, label %cond.true457, label %cond.false458

cond.true457:                                     ; preds = %while.end
  br label %cond.end459

cond.false458:                                    ; preds = %while.end
  %185 = load i8*, i8** %p.addr, align 4
  br label %cond.end459

cond.end459:                                      ; preds = %cond.false458, %cond.true457
  %cond460 = phi i8* [ null, %cond.true457 ], [ %185, %cond.false458 ]
  store i8* %cond460, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end459, %if.then450, %cond.end415, %cond.end401, %if.then308, %if.then285, %cond.end276, %cond.end245, %if.then214, %cond.end158, %cond.end69
  %186 = load i8*, i8** %retval, align 4
  ret i8* %186
}

; Function Attrs: noinline nounwind
define internal i32 @strcompare(i8* %p, i8* %pe, i8* %s, i8* %se) #0 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca i8*, align 4
  %pe.addr = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %se.addr = alloca i8*, align 4
  %ret = alloca i32, align 4
  %c1 = alloca i8, align 1
  %c2 = alloca i8, align 1
  %l1 = alloca i32, align 4
  %l2 = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 4
  store i8* %pe, i8** %pe.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %se, i8** %se.addr, align 4
  %0 = load i8*, i8** %pe.addr, align 4
  %1 = load i8*, i8** %p.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %0 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %1 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %l1, align 4
  %2 = load i8*, i8** %se.addr, align 4
  %3 = load i8*, i8** %s.addr, align 4
  %sub.ptr.lhs.cast1 = ptrtoint i8* %2 to i32
  %sub.ptr.rhs.cast2 = ptrtoint i8* %3 to i32
  %sub.ptr.sub3 = sub i32 %sub.ptr.lhs.cast1, %sub.ptr.rhs.cast2
  store i32 %sub.ptr.sub3, i32* %l2, align 4
  %4 = load i32, i32* %l1, align 4
  %5 = load i32, i32* %l2, align 4
  %cmp = icmp ne i32 %4, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i8*, i8** %pe.addr, align 4
  %7 = load i8, i8* %6, align 1
  store i8 %7, i8* %c1, align 1
  %8 = load i8*, i8** %se.addr, align 4
  %9 = load i8, i8* %8, align 1
  store i8 %9, i8* %c2, align 1
  %10 = load i8, i8* %c1, align 1
  %conv = zext i8 %10 to i32
  %cmp4 = icmp ne i32 %conv, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %11 = load i8*, i8** %pe.addr, align 4
  store i8 0, i8* %11, align 1
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %12 = load i8, i8* %c2, align 1
  %conv8 = zext i8 %12 to i32
  %cmp9 = icmp ne i32 %conv8, 0
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end7
  %13 = load i8*, i8** %se.addr, align 4
  store i8 0, i8* %13, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end7
  %14 = load i8*, i8** %p.addr, align 4
  %15 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strcoll(i8* %14, i8* %15)
  store i32 %call, i32* %ret, align 4
  %16 = load i8, i8* %c1, align 1
  %conv13 = zext i8 %16 to i32
  %cmp14 = icmp ne i32 %conv13, 0
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end12
  %17 = load i8, i8* %c1, align 1
  %18 = load i8*, i8** %pe.addr, align 4
  store i8 %17, i8* %18, align 1
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end12
  %19 = load i8, i8* %c2, align 1
  %conv18 = zext i8 %19 to i32
  %cmp19 = icmp ne i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end17
  %20 = load i8, i8* %c2, align 1
  %21 = load i8*, i8** %se.addr, align 4
  store i8 %20, i8* %21, align 1
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end17
  %22 = load i32, i32* %ret, align 4
  %cmp23 = icmp eq i32 %22, 0
  br i1 %cmp23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end22
  %23 = load i32, i32* %ret, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end22
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %23, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare i32 @strcoll(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @collequiv(i32 %c1, i32 %c2) #0 {
entry:
  %c1.addr = alloca i32, align 4
  %c2.addr = alloca i32, align 4
  store i32 %c1, i32* %c1.addr, align 4
  store i32 %c2, i32* %c2.addr, align 4
  %0 = load i32, i32* %c1.addr, align 4
  %1 = load i32, i32* %c2.addr, align 4
  %call = call i32 @rangecmp(i32 %0, i32 %1, i32 1)
  %cmp = icmp eq i32 %call, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare i8* @malloc(i32) #1

declare void @bcopy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @is_cclass(i32 %c, i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %char_class = alloca i32, align 4
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %char_class, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 15
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [15 x i8*], [15 x i8*]* @cclass_name, i32 0, i32 %3
  %4 = load i8*, i8** %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %5 to i32
  %cmp4 = icmp eq i32 %conv, %conv3
  br i1 %cmp4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %6 = load i8*, i8** %name.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds [15 x i8*], [15 x i8*]* @cclass_name, i32 0, i32 %7
  %8 = load i8*, i8** %arrayidx6, align 4
  %call = call i32 @strcmp(i8* %6, i8* %8)
  %cmp7 = icmp eq i32 %call, 0
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %9 = load i32, i32* %i, align 4
  store i32 %9, i32* %char_class, align 4
  br label %for.end

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %11 = load i32, i32* %char_class, align 4
  %cmp9 = icmp eq i32 %11, 0
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %for.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %for.end
  %12 = load i32, i32* %char_class, align 4
  switch i32 %12, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb15
    i32 3, label %sw.bb19
    i32 4, label %sw.bb25
    i32 5, label %sw.bb31
    i32 6, label %sw.bb37
    i32 7, label %sw.bb43
    i32 8, label %sw.bb47
    i32 9, label %sw.bb53
    i32 10, label %sw.bb59
    i32 11, label %sw.bb65
    i32 12, label %sw.bb71
    i32 13, label %sw.bb77
    i32 14, label %sw.bb84
  ]

sw.bb:                                            ; preds = %if.end12
  %13 = load i32, i32* %c.addr, align 4
  %cmp13 = icmp ult i32 %13, 128
  %conv14 = zext i1 %cmp13 to i32
  store i32 %conv14, i32* %result, align 4
  br label %sw.epilog

sw.bb15:                                          ; preds = %if.end12
  %14 = load i32, i32* %c.addr, align 4
  %conv16 = trunc i32 %14 to i8
  %conv17 = zext i8 %conv16 to i32
  %call18 = call i32 @isalnum(i32 %conv17) #4
  %tobool = icmp ne i32 %call18, 0
  %land.ext = zext i1 %tobool to i32
  store i32 %land.ext, i32* %result, align 4
  br label %sw.epilog

sw.bb19:                                          ; preds = %if.end12
  %15 = load i32, i32* %c.addr, align 4
  %conv20 = trunc i32 %15 to i8
  %conv21 = zext i8 %conv20 to i32
  %call22 = call i32 @isalpha(i32 %conv21) #4
  %tobool23 = icmp ne i32 %call22, 0
  %land.ext24 = zext i1 %tobool23 to i32
  store i32 %land.ext24, i32* %result, align 4
  br label %sw.epilog

sw.bb25:                                          ; preds = %if.end12
  %16 = load i32, i32* %c.addr, align 4
  %conv26 = trunc i32 %16 to i8
  %conv27 = zext i8 %conv26 to i32
  %call28 = call i32 @isblank(i32 %conv27) #4
  %tobool29 = icmp ne i32 %call28, 0
  %land.ext30 = zext i1 %tobool29 to i32
  store i32 %land.ext30, i32* %result, align 4
  br label %sw.epilog

sw.bb31:                                          ; preds = %if.end12
  %17 = load i32, i32* %c.addr, align 4
  %conv32 = trunc i32 %17 to i8
  %conv33 = zext i8 %conv32 to i32
  %call34 = call i32 @iscntrl(i32 %conv33) #4
  %tobool35 = icmp ne i32 %call34, 0
  %land.ext36 = zext i1 %tobool35 to i32
  store i32 %land.ext36, i32* %result, align 4
  br label %sw.epilog

sw.bb37:                                          ; preds = %if.end12
  %18 = load i32, i32* %c.addr, align 4
  %conv38 = trunc i32 %18 to i8
  %conv39 = zext i8 %conv38 to i32
  %call40 = call i32 @isdigit(i32 %conv39) #4
  %tobool41 = icmp ne i32 %call40, 0
  %land.ext42 = zext i1 %tobool41 to i32
  store i32 %land.ext42, i32* %result, align 4
  br label %sw.epilog

sw.bb43:                                          ; preds = %if.end12
  %19 = load i32, i32* %c.addr, align 4
  %call44 = call i32 @isgraph(i32 %19) #4
  %tobool45 = icmp ne i32 %call44, 0
  %land.ext46 = zext i1 %tobool45 to i32
  store i32 %land.ext46, i32* %result, align 4
  br label %sw.epilog

sw.bb47:                                          ; preds = %if.end12
  %20 = load i32, i32* %c.addr, align 4
  %conv48 = trunc i32 %20 to i8
  %conv49 = zext i8 %conv48 to i32
  %call50 = call i32 @islower(i32 %conv49) #4
  %tobool51 = icmp ne i32 %call50, 0
  %land.ext52 = zext i1 %tobool51 to i32
  store i32 %land.ext52, i32* %result, align 4
  br label %sw.epilog

sw.bb53:                                          ; preds = %if.end12
  %21 = load i32, i32* %c.addr, align 4
  %conv54 = trunc i32 %21 to i8
  %conv55 = zext i8 %conv54 to i32
  %call56 = call i32 @isprint(i32 %conv55) #4
  %tobool57 = icmp ne i32 %call56, 0
  %land.ext58 = zext i1 %tobool57 to i32
  store i32 %land.ext58, i32* %result, align 4
  br label %sw.epilog

sw.bb59:                                          ; preds = %if.end12
  %22 = load i32, i32* %c.addr, align 4
  %conv60 = trunc i32 %22 to i8
  %conv61 = zext i8 %conv60 to i32
  %call62 = call i32 @ispunct(i32 %conv61) #4
  %tobool63 = icmp ne i32 %call62, 0
  %land.ext64 = zext i1 %tobool63 to i32
  store i32 %land.ext64, i32* %result, align 4
  br label %sw.epilog

sw.bb65:                                          ; preds = %if.end12
  %23 = load i32, i32* %c.addr, align 4
  %conv66 = trunc i32 %23 to i8
  %conv67 = zext i8 %conv66 to i32
  %call68 = call i32 @isspace(i32 %conv67) #4
  %tobool69 = icmp ne i32 %call68, 0
  %land.ext70 = zext i1 %tobool69 to i32
  store i32 %land.ext70, i32* %result, align 4
  br label %sw.epilog

sw.bb71:                                          ; preds = %if.end12
  %24 = load i32, i32* %c.addr, align 4
  %conv72 = trunc i32 %24 to i8
  %conv73 = zext i8 %conv72 to i32
  %call74 = call i32 @isupper(i32 %conv73) #4
  %tobool75 = icmp ne i32 %call74, 0
  %land.ext76 = zext i1 %tobool75 to i32
  store i32 %land.ext76, i32* %result, align 4
  br label %sw.epilog

sw.bb77:                                          ; preds = %if.end12
  %25 = load i32, i32* %c.addr, align 4
  %conv78 = trunc i32 %25 to i8
  %conv79 = zext i8 %conv78 to i32
  %call80 = call i32 @isalnum(i32 %conv79) #4
  %tobool81 = icmp ne i32 %call80, 0
  br i1 %tobool81, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %sw.bb77
  %26 = load i32, i32* %c.addr, align 4
  %cmp82 = icmp eq i32 %26, 95
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %sw.bb77
  %27 = phi i1 [ true, %sw.bb77 ], [ %cmp82, %lor.rhs ]
  %lor.ext = zext i1 %27 to i32
  store i32 %lor.ext, i32* %result, align 4
  br label %sw.epilog

sw.bb84:                                          ; preds = %if.end12
  %28 = load i32, i32* %c.addr, align 4
  %conv85 = trunc i32 %28 to i8
  %conv86 = zext i8 %conv85 to i32
  %call87 = call i32 @isxdigit(i32 %conv86) #4
  %tobool88 = icmp ne i32 %call87, 0
  %land.ext89 = zext i1 %tobool88 to i32
  store i32 %land.ext89, i32* %result, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end12
  store i32 -1, i32* %result, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb84, %lor.end, %sw.bb71, %sw.bb65, %sw.bb59, %sw.bb53, %sw.bb47, %sw.bb43, %sw.bb37, %sw.bb31, %sw.bb25, %sw.bb19, %sw.bb15, %sw.bb
  %29 = load i32, i32* %result, align 4
  store i32 %29, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then11
  %30 = load i32, i32* %retval, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind
define internal i8* @parse_collsym(i8* %p, i32* %vp) #0 {
entry:
  %retval = alloca i8*, align 4
  %p.addr = alloca i8*, align 4
  %vp.addr = alloca i32*, align 4
  %pc = alloca i32, align 4
  %val = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 4
  store i32* %vp, i32** %vp.addr, align 4
  %0 = load i8*, i8** %p.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %0, i32 1
  store i8* %incdec.ptr, i8** %p.addr, align 4
  store i32 0, i32* %pc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p.addr, align 4
  %2 = load i32, i32* %pc, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %p.addr, align 4
  %5 = load i32, i32* %pc, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx1, align 1
  %conv = zext i8 %6 to i32
  %cmp = icmp eq i32 %conv, 46
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load i8*, i8** %p.addr, align 4
  %8 = load i32, i32* %pc, align 4
  %add = add nsw i32 %8, 1
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i32 %add
  %9 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 93
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %for.end

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %pc, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %pc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %11 = load i8*, i8** %p.addr, align 4
  %12 = load i32, i32* %pc, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %13 to i32
  %cmp9 = icmp eq i32 %conv8, 0
  br i1 %cmp9, label %if.then11, label %if.end15

if.then11:                                        ; preds = %for.end
  %14 = load i32*, i32** %vp.addr, align 4
  %tobool12 = icmp ne i32* %14, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.then11
  %15 = load i32*, i32** %vp.addr, align 4
  store i32 -1, i32* %15, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.then11
  %16 = load i8*, i8** %p.addr, align 4
  %17 = load i32, i32* %pc, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 %17
  store i8* %add.ptr, i8** %retval, align 4
  br label %return

if.end15:                                         ; preds = %for.end
  %18 = load i8*, i8** %p.addr, align 4
  %19 = load i32, i32* %pc, align 4
  %call = call i32 @collsym(i8* %18, i32 %19)
  store i32 %call, i32* %val, align 4
  %20 = load i32*, i32** %vp.addr, align 4
  %tobool16 = icmp ne i32* %20, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  %21 = load i32, i32* %val, align 4
  %22 = load i32*, i32** %vp.addr, align 4
  store i32 %21, i32* %22, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end15
  %23 = load i8*, i8** %p.addr, align 4
  %24 = load i32, i32* %pc, align 4
  %add.ptr19 = getelementptr inbounds i8, i8* %23, i32 %24
  %add.ptr20 = getelementptr inbounds i8, i8* %add.ptr19, i32 2
  store i8* %add.ptr20, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.end14
  %25 = load i8*, i8** %retval, align 4
  ret i8* %25
}

; Function Attrs: noinline nounwind
define internal i32 @rangecmp(i32 %c1, i32 %c2, i32 %forcecoll) #0 {
entry:
  %retval = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %c2.addr = alloca i32, align 4
  %forcecoll.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %c1, i32* %c1.addr, align 4
  store i32 %c2, i32* %c2.addr, align 4
  store i32 %forcecoll, i32* %forcecoll.addr, align 4
  %0 = load i32, i32* %c1.addr, align 4
  %and = and i32 %0, 255
  store i32 %and, i32* %c1.addr, align 4
  %1 = load i32, i32* %c2.addr, align 4
  %and1 = and i32 %1, 255
  store i32 %and1, i32* %c2.addr, align 4
  %2 = load i32, i32* %c1.addr, align 4
  %3 = load i32, i32* %c2.addr, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %forcecoll.addr, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %5 = load i32, i32* @glob_asciirange, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %c1.addr, align 4
  %7 = load i32, i32* %c2.addr, align 4
  %sub = sub nsw i32 %6, %7
  store i32 %sub, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %land.lhs.true, %if.end
  %8 = load i32, i32* %c1.addr, align 4
  %conv = trunc i32 %8 to i8
  store i8 %conv, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @rangecmp.s1, i32 0, i32 0), align 1
  %9 = load i32, i32* %c2.addr, align 4
  %conv5 = trunc i32 %9 to i8
  store i8 %conv5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @rangecmp.s2, i32 0, i32 0), align 1
  %call = call i32 @strcoll(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @rangecmp.s1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @rangecmp.s2, i32 0, i32 0))
  store i32 %call, i32* %ret, align 4
  %cmp6 = icmp ne i32 %call, 0
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %10 = load i32, i32* %ret, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end4
  %11 = load i32, i32* %c1.addr, align 4
  %12 = load i32, i32* %c2.addr, align 4
  %sub10 = sub nsw i32 %11, %12
  store i32 %sub10, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @isalnum(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isblank(i32) #2

; Function Attrs: nounwind readonly
declare i32 @iscntrl(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isgraph(i32) #2

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isprint(i32) #2

; Function Attrs: nounwind readonly
declare i32 @ispunct(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isspace(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isxdigit(i32) #2

; Function Attrs: noinline nounwind
define internal i32 @collsym(i8* %s, i32 %len) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %csp = alloca %struct._collsym*, align 4
  %x = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  store i8* %0, i8** %x, align 4
  store %struct._collsym* getelementptr inbounds ([96 x %struct._collsym], [96 x %struct._collsym]* @posix_collsyms, i32 0, i32 0), %struct._collsym** %csp, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct._collsym*, %struct._collsym** %csp, align 4
  %name = getelementptr inbounds %struct._collsym, %struct._collsym* %1, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._collsym*, %struct._collsym** %csp, align 4
  %name1 = getelementptr inbounds %struct._collsym, %struct._collsym* %3, i32 0, i32 0
  %4 = load i8*, i8** %name1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %6 = load i8*, i8** %x, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv3
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %8 = load %struct._collsym*, %struct._collsym** %csp, align 4
  %name5 = getelementptr inbounds %struct._collsym, %struct._collsym* %8, i32 0, i32 0
  %9 = load i8*, i8** %name5, align 4
  %10 = load i8*, i8** %x, align 4
  %11 = load i32, i32* %len.addr, align 4
  %call = call i32 @strncmp(i8* %9, i8* %10, i32 %11)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true
  %12 = load %struct._collsym*, %struct._collsym** %csp, align 4
  %name9 = getelementptr inbounds %struct._collsym, %struct._collsym* %12, i32 0, i32 0
  %13 = load i8*, i8** %name9, align 4
  %14 = load i32, i32* %len.addr, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %15 to i32
  %cmp12 = icmp eq i32 %conv11, 0
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true8
  %16 = load %struct._collsym*, %struct._collsym** %csp, align 4
  %code = getelementptr inbounds %struct._collsym, %struct._collsym* %16, i32 0, i32 1
  %17 = load i8, i8* %code, align 4
  %conv14 = zext i8 %17 to i32
  store i32 %conv14, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true8, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %18 = load %struct._collsym*, %struct._collsym** %csp, align 4
  %incdec.ptr = getelementptr inbounds %struct._collsym, %struct._collsym* %18, i32 1
  store %struct._collsym* %incdec.ptr, %struct._collsym** %csp, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load i32, i32* %len.addr, align 4
  %cmp15 = icmp eq i32 %19, 1
  br i1 %cmp15, label %if.then17, label %if.end20

if.then17:                                        ; preds = %for.end
  %20 = load i8*, i8** %s.addr, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx18, align 1
  %conv19 = zext i8 %21 to i32
  store i32 %conv19, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %for.end
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end20, %if.then17, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @iswupper(i32) #1

declare i32 @towlower(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @extmatch_wc(i32 %xc, i32* %s, i32* %se, i32* %p, i32* %pe, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %xc.addr = alloca i32, align 4
  %s.addr = alloca i32*, align 4
  %se.addr = alloca i32*, align 4
  %p.addr = alloca i32*, align 4
  %pe.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  %prest = alloca i32*, align 4
  %psub = alloca i32*, align 4
  %pnext = alloca i32*, align 4
  %srest = alloca i32*, align 4
  %m1 = alloca i32, align 4
  %m2 = alloca i32, align 4
  %xflags = alloca i32, align 4
  store i32 %xc, i32* %xc.addr, align 4
  store i32* %s, i32** %s.addr, align 4
  store i32* %se, i32** %se.addr, align 4
  store i32* %p, i32** %p.addr, align 4
  store i32* %pe, i32** %pe.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %p.addr, align 4
  %1 = load i32*, i32** %p.addr, align 4
  %2 = load i32, i32* %1, align 4
  %cmp = icmp eq i32 %2, 40
  %conv = zext i1 %cmp to i32
  %add.ptr = getelementptr inbounds i32, i32* %0, i32 %conv
  %3 = load i32*, i32** %pe.addr, align 4
  %call = call i32* @glob_patscan_wc(i32* %add.ptr, i32* %3, i32 0)
  store i32* %call, i32** %prest, align 4
  %4 = load i32*, i32** %prest, align 4
  %cmp1 = icmp eq i32* %4, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %p.addr, align 4
  %add.ptr3 = getelementptr inbounds i32, i32* %5, i32 -1
  %6 = load i32*, i32** %pe.addr, align 4
  %7 = load i32*, i32** %s.addr, align 4
  %8 = load i32*, i32** %se.addr, align 4
  %call4 = call i32 @wscompare(i32* %add.ptr3, i32* %6, i32* %7, i32* %8)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %9 = load i32, i32* %xc.addr, align 4
  switch i32 %9, label %sw.epilog [
    i32 43, label %sw.bb
    i32 42, label %sw.bb
    i32 63, label %sw.bb45
    i32 64, label %sw.bb45
    i32 33, label %sw.bb93
  ]

sw.bb:                                            ; preds = %if.end, %if.end
  %10 = load i32, i32* %xc.addr, align 4
  %cmp5 = icmp eq i32 %10, 42
  br i1 %cmp5, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %sw.bb
  %11 = load i32*, i32** %s.addr, align 4
  %12 = load i32*, i32** %se.addr, align 4
  %13 = load i32*, i32** %prest, align 4
  %14 = load i32*, i32** %pe.addr, align 4
  %15 = load i32, i32* %flags.addr, align 4
  %call7 = call i32 @gmatch_wc(i32* %11, i32* %12, i32* %13, i32* %14, i32 %15)
  %cmp8 = icmp eq i32 %call7, 0
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %land.lhs.true, %sw.bb
  %16 = load i32*, i32** %p.addr, align 4
  %add.ptr12 = getelementptr inbounds i32, i32* %16, i32 1
  store i32* %add.ptr12, i32** %psub, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %if.end11
  %17 = load i32*, i32** %psub, align 4
  %18 = load i32*, i32** %pe.addr, align 4
  %call13 = call i32* @glob_patscan_wc(i32* %17, i32* %18, i32 124)
  store i32* %call13, i32** %pnext, align 4
  %19 = load i32*, i32** %s.addr, align 4
  store i32* %19, i32** %srest, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %for.cond
  %20 = load i32*, i32** %srest, align 4
  %21 = load i32*, i32** %se.addr, align 4
  %cmp15 = icmp ule i32* %20, %21
  br i1 %cmp15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond14
  %22 = load i32*, i32** %s.addr, align 4
  %23 = load i32*, i32** %srest, align 4
  %24 = load i32*, i32** %psub, align 4
  %25 = load i32*, i32** %pnext, align 4
  %add.ptr17 = getelementptr inbounds i32, i32* %25, i32 -1
  %26 = load i32, i32* %flags.addr, align 4
  %call18 = call i32 @gmatch_wc(i32* %22, i32* %23, i32* %24, i32* %add.ptr17, i32 %26)
  %cmp19 = icmp eq i32 %call18, 0
  %conv20 = zext i1 %cmp19 to i32
  store i32 %conv20, i32* %m1, align 4
  %27 = load i32, i32* %m1, align 4
  %tobool = icmp ne i32 %27, 0
  br i1 %tobool, label %if.then21, label %if.end33

if.then21:                                        ; preds = %for.body
  %28 = load i32*, i32** %srest, align 4
  %29 = load i32*, i32** %s.addr, align 4
  %cmp22 = icmp ugt i32* %28, %29
  br i1 %cmp22, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then21
  %30 = load i32, i32* %flags.addr, align 4
  %and = and i32 %30, -5
  br label %cond.end

cond.false:                                       ; preds = %if.then21
  %31 = load i32, i32* %flags.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %and, %cond.true ], [ %31, %cond.false ]
  store i32 %cond, i32* %xflags, align 4
  %32 = load i32*, i32** %srest, align 4
  %33 = load i32*, i32** %se.addr, align 4
  %34 = load i32*, i32** %prest, align 4
  %35 = load i32*, i32** %pe.addr, align 4
  %36 = load i32, i32* %xflags, align 4
  %call24 = call i32 @gmatch_wc(i32* %32, i32* %33, i32* %34, i32* %35, i32 %36)
  %cmp25 = icmp eq i32 %call24, 0
  br i1 %cmp25, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %cond.end
  %37 = load i32*, i32** %s.addr, align 4
  %38 = load i32*, i32** %srest, align 4
  %cmp27 = icmp ne i32* %37, %38
  br i1 %cmp27, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %39 = load i32*, i32** %srest, align 4
  %40 = load i32*, i32** %se.addr, align 4
  %41 = load i32*, i32** %p.addr, align 4
  %add.ptr29 = getelementptr inbounds i32, i32* %41, i32 -1
  %42 = load i32*, i32** %pe.addr, align 4
  %43 = load i32, i32* %xflags, align 4
  %call30 = call i32 @gmatch_wc(i32* %39, i32* %40, i32* %add.ptr29, i32* %42, i32 %43)
  %cmp31 = icmp eq i32 %call30, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %44 = phi i1 [ false, %lor.rhs ], [ %cmp31, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %cond.end
  %45 = phi i1 [ true, %cond.end ], [ %44, %land.end ]
  %lor.ext = zext i1 %45 to i32
  store i32 %lor.ext, i32* %m2, align 4
  br label %if.end33

if.end33:                                         ; preds = %lor.end, %for.body
  %46 = load i32, i32* %m1, align 4
  %tobool34 = icmp ne i32 %46, 0
  br i1 %tobool34, label %land.lhs.true35, label %if.end38

land.lhs.true35:                                  ; preds = %if.end33
  %47 = load i32, i32* %m2, align 4
  %tobool36 = icmp ne i32 %47, 0
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %land.lhs.true35
  store i32 0, i32* %retval, align 4
  br label %return

if.end38:                                         ; preds = %land.lhs.true35, %if.end33
  br label %for.inc

for.inc:                                          ; preds = %if.end38
  %48 = load i32*, i32** %srest, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %48, i32 1
  store i32* %incdec.ptr, i32** %srest, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  %49 = load i32*, i32** %pnext, align 4
  %50 = load i32*, i32** %prest, align 4
  %cmp39 = icmp eq i32* %49, %50
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %for.end
  br label %for.end44

if.end42:                                         ; preds = %for.end
  br label %for.inc43

for.inc43:                                        ; preds = %if.end42
  %51 = load i32*, i32** %pnext, align 4
  store i32* %51, i32** %psub, align 4
  br label %for.cond

for.end44:                                        ; preds = %if.then41
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb45:                                          ; preds = %if.end, %if.end
  %52 = load i32, i32* %xc.addr, align 4
  %cmp46 = icmp eq i32 %52, 63
  br i1 %cmp46, label %land.lhs.true48, label %if.end53

land.lhs.true48:                                  ; preds = %sw.bb45
  %53 = load i32*, i32** %s.addr, align 4
  %54 = load i32*, i32** %se.addr, align 4
  %55 = load i32*, i32** %prest, align 4
  %56 = load i32*, i32** %pe.addr, align 4
  %57 = load i32, i32* %flags.addr, align 4
  %call49 = call i32 @gmatch_wc(i32* %53, i32* %54, i32* %55, i32* %56, i32 %57)
  %cmp50 = icmp eq i32 %call49, 0
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %land.lhs.true48
  store i32 0, i32* %retval, align 4
  br label %return

if.end53:                                         ; preds = %land.lhs.true48, %sw.bb45
  %58 = load i32*, i32** %p.addr, align 4
  %add.ptr54 = getelementptr inbounds i32, i32* %58, i32 1
  store i32* %add.ptr54, i32** %psub, align 4
  br label %for.cond55

for.cond55:                                       ; preds = %for.inc91, %if.end53
  %59 = load i32*, i32** %psub, align 4
  %60 = load i32*, i32** %pe.addr, align 4
  %call56 = call i32* @glob_patscan_wc(i32* %59, i32* %60, i32 124)
  store i32* %call56, i32** %pnext, align 4
  %61 = load i32*, i32** %prest, align 4
  %62 = load i32*, i32** %pe.addr, align 4
  %cmp57 = icmp eq i32* %61, %62
  br i1 %cmp57, label %cond.true59, label %cond.false60

cond.true59:                                      ; preds = %for.cond55
  %63 = load i32*, i32** %se.addr, align 4
  br label %cond.end61

cond.false60:                                     ; preds = %for.cond55
  %64 = load i32*, i32** %s.addr, align 4
  br label %cond.end61

cond.end61:                                       ; preds = %cond.false60, %cond.true59
  %cond62 = phi i32* [ %63, %cond.true59 ], [ %64, %cond.false60 ]
  store i32* %cond62, i32** %srest, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc84, %cond.end61
  %65 = load i32*, i32** %srest, align 4
  %66 = load i32*, i32** %se.addr, align 4
  %cmp64 = icmp ule i32* %65, %66
  br i1 %cmp64, label %for.body66, label %for.end86

for.body66:                                       ; preds = %for.cond63
  %67 = load i32*, i32** %srest, align 4
  %68 = load i32*, i32** %s.addr, align 4
  %cmp67 = icmp ugt i32* %67, %68
  br i1 %cmp67, label %cond.true69, label %cond.false71

cond.true69:                                      ; preds = %for.body66
  %69 = load i32, i32* %flags.addr, align 4
  %and70 = and i32 %69, -5
  br label %cond.end72

cond.false71:                                     ; preds = %for.body66
  %70 = load i32, i32* %flags.addr, align 4
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false71, %cond.true69
  %cond73 = phi i32 [ %and70, %cond.true69 ], [ %70, %cond.false71 ]
  store i32 %cond73, i32* %xflags, align 4
  %71 = load i32*, i32** %s.addr, align 4
  %72 = load i32*, i32** %srest, align 4
  %73 = load i32*, i32** %psub, align 4
  %74 = load i32*, i32** %pnext, align 4
  %add.ptr74 = getelementptr inbounds i32, i32* %74, i32 -1
  %75 = load i32, i32* %flags.addr, align 4
  %call75 = call i32 @gmatch_wc(i32* %71, i32* %72, i32* %73, i32* %add.ptr74, i32 %75)
  %cmp76 = icmp eq i32 %call75, 0
  br i1 %cmp76, label %land.lhs.true78, label %if.end83

land.lhs.true78:                                  ; preds = %cond.end72
  %76 = load i32*, i32** %srest, align 4
  %77 = load i32*, i32** %se.addr, align 4
  %78 = load i32*, i32** %prest, align 4
  %79 = load i32*, i32** %pe.addr, align 4
  %80 = load i32, i32* %xflags, align 4
  %call79 = call i32 @gmatch_wc(i32* %76, i32* %77, i32* %78, i32* %79, i32 %80)
  %cmp80 = icmp eq i32 %call79, 0
  br i1 %cmp80, label %if.then82, label %if.end83

if.then82:                                        ; preds = %land.lhs.true78
  store i32 0, i32* %retval, align 4
  br label %return

if.end83:                                         ; preds = %land.lhs.true78, %cond.end72
  br label %for.inc84

for.inc84:                                        ; preds = %if.end83
  %81 = load i32*, i32** %srest, align 4
  %incdec.ptr85 = getelementptr inbounds i32, i32* %81, i32 1
  store i32* %incdec.ptr85, i32** %srest, align 4
  br label %for.cond63

for.end86:                                        ; preds = %for.cond63
  %82 = load i32*, i32** %pnext, align 4
  %83 = load i32*, i32** %prest, align 4
  %cmp87 = icmp eq i32* %82, %83
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %for.end86
  br label %for.end92

if.end90:                                         ; preds = %for.end86
  br label %for.inc91

for.inc91:                                        ; preds = %if.end90
  %84 = load i32*, i32** %pnext, align 4
  store i32* %84, i32** %psub, align 4
  br label %for.cond55

for.end92:                                        ; preds = %if.then89
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb93:                                          ; preds = %if.end
  %85 = load i32*, i32** %s.addr, align 4
  store i32* %85, i32** %srest, align 4
  br label %for.cond94

for.cond94:                                       ; preds = %for.inc128, %sw.bb93
  %86 = load i32*, i32** %srest, align 4
  %87 = load i32*, i32** %se.addr, align 4
  %cmp95 = icmp ule i32* %86, %87
  br i1 %cmp95, label %for.body97, label %for.end130

for.body97:                                       ; preds = %for.cond94
  store i32 0, i32* %m1, align 4
  %88 = load i32*, i32** %p.addr, align 4
  %add.ptr98 = getelementptr inbounds i32, i32* %88, i32 1
  store i32* %add.ptr98, i32** %psub, align 4
  br label %for.cond99

for.cond99:                                       ; preds = %for.inc111, %for.body97
  %89 = load i32*, i32** %psub, align 4
  %90 = load i32*, i32** %pe.addr, align 4
  %call100 = call i32* @glob_patscan_wc(i32* %89, i32* %90, i32 124)
  store i32* %call100, i32** %pnext, align 4
  %91 = load i32*, i32** %s.addr, align 4
  %92 = load i32*, i32** %srest, align 4
  %93 = load i32*, i32** %psub, align 4
  %94 = load i32*, i32** %pnext, align 4
  %add.ptr101 = getelementptr inbounds i32, i32* %94, i32 -1
  %95 = load i32, i32* %flags.addr, align 4
  %call102 = call i32 @gmatch_wc(i32* %91, i32* %92, i32* %93, i32* %add.ptr101, i32 %95)
  %cmp103 = icmp eq i32 %call102, 0
  %conv104 = zext i1 %cmp103 to i32
  store i32 %conv104, i32* %m1, align 4
  br i1 %cmp103, label %if.then105, label %if.end106

if.then105:                                       ; preds = %for.cond99
  br label %for.end112

if.end106:                                        ; preds = %for.cond99
  %96 = load i32*, i32** %pnext, align 4
  %97 = load i32*, i32** %prest, align 4
  %cmp107 = icmp eq i32* %96, %97
  br i1 %cmp107, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end106
  br label %for.end112

if.end110:                                        ; preds = %if.end106
  br label %for.inc111

for.inc111:                                       ; preds = %if.end110
  %98 = load i32*, i32** %pnext, align 4
  store i32* %98, i32** %psub, align 4
  br label %for.cond99

for.end112:                                       ; preds = %if.then109, %if.then105
  %99 = load i32*, i32** %srest, align 4
  %100 = load i32*, i32** %s.addr, align 4
  %cmp113 = icmp ugt i32* %99, %100
  br i1 %cmp113, label %cond.true115, label %cond.false117

cond.true115:                                     ; preds = %for.end112
  %101 = load i32, i32* %flags.addr, align 4
  %and116 = and i32 %101, -5
  br label %cond.end118

cond.false117:                                    ; preds = %for.end112
  %102 = load i32, i32* %flags.addr, align 4
  br label %cond.end118

cond.end118:                                      ; preds = %cond.false117, %cond.true115
  %cond119 = phi i32 [ %and116, %cond.true115 ], [ %102, %cond.false117 ]
  store i32 %cond119, i32* %xflags, align 4
  %103 = load i32, i32* %m1, align 4
  %cmp120 = icmp eq i32 %103, 0
  br i1 %cmp120, label %land.lhs.true122, label %if.end127

land.lhs.true122:                                 ; preds = %cond.end118
  %104 = load i32*, i32** %srest, align 4
  %105 = load i32*, i32** %se.addr, align 4
  %106 = load i32*, i32** %prest, align 4
  %107 = load i32*, i32** %pe.addr, align 4
  %108 = load i32, i32* %xflags, align 4
  %call123 = call i32 @gmatch_wc(i32* %104, i32* %105, i32* %106, i32* %107, i32 %108)
  %cmp124 = icmp eq i32 %call123, 0
  br i1 %cmp124, label %if.then126, label %if.end127

if.then126:                                       ; preds = %land.lhs.true122
  store i32 0, i32* %retval, align 4
  br label %return

if.end127:                                        ; preds = %land.lhs.true122, %cond.end118
  br label %for.inc128

for.inc128:                                       ; preds = %if.end127
  %109 = load i32*, i32** %srest, align 4
  %incdec.ptr129 = getelementptr inbounds i32, i32* %109, i32 1
  store i32* %incdec.ptr129, i32** %srest, align 4
  br label %for.cond94

for.end130:                                       ; preds = %for.cond94
  store i32 1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %for.end130, %if.then126, %for.end92, %if.then82, %if.then52, %for.end44, %if.then37, %if.then10, %if.then
  %110 = load i32, i32* %retval, align 4
  ret i32 %110
}

declare i32* @wmemchr(i32*, i32, i32) #1

declare i32* @wcschr(i32*, i32) #1

; Function Attrs: noinline nounwind
define internal i32* @brackmatch_wc(i32* %p, i32 %test, i32 %flags) #0 {
entry:
  %retval = alloca i32*, align 4
  %p.addr = alloca i32*, align 4
  %test.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %cstart = alloca i32, align 4
  %cend = alloca i32, align 4
  %c = alloca i32, align 4
  %not = alloca i32, align 4
  %brcnt = alloca i32, align 4
  %forcecoll = alloca i32, align 4
  %pc = alloca i32, align 4
  %savep = alloca i32*, align 4
  %close = alloca i32*, align 4
  %ccname = alloca i32*, align 4
  store i32* %p, i32** %p.addr, align 4
  store i32 %test, i32* %test.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %test.addr, align 4
  %call = call i32 @iswupper(i32 %1)
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %2 = load i32, i32* %test.addr, align 4
  %call2 = call i32 @towlower(i32 %2)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* %test.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, i32* %test.addr, align 4
  %4 = load i32*, i32** %p.addr, align 4
  store i32* %4, i32** %savep, align 4
  %5 = load i32*, i32** %p.addr, align 4
  %6 = load i32, i32* %5, align 4
  %cmp = icmp eq i32 %6, 33
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %cond.end
  %7 = load i32*, i32** %p.addr, align 4
  %8 = load i32, i32* %7, align 4
  %cmp3 = icmp eq i32 %8, 94
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %cond.end
  %9 = phi i1 [ true, %cond.end ], [ %cmp3, %lor.rhs ]
  %lor.ext = zext i1 %9 to i32
  store i32 %lor.ext, i32* %not, align 4
  br i1 %9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  %10 = load i32*, i32** %p.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %10, i32 1
  store i32* %incdec.ptr, i32** %p.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.end
  %11 = load i32*, i32** %p.addr, align 4
  %incdec.ptr4 = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %incdec.ptr4, i32** %p.addr, align 4
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %c, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end248, %cond.end235, %cond.end116, %cond.end48, %if.end
  %13 = load i32, i32* %c, align 4
  store i32 %13, i32* %cend, align 4
  store i32 %13, i32* %cstart, align 4
  store i32 0, i32* %forcecoll, align 4
  %14 = load i32, i32* %c, align 4
  %cmp5 = icmp eq i32 %14, 91
  br i1 %cmp5, label %land.lhs.true6, label %if.end50

land.lhs.true6:                                   ; preds = %for.cond
  %15 = load i32*, i32** %p.addr, align 4
  %16 = load i32, i32* %15, align 4
  %cmp7 = icmp eq i32 %16, 61
  br i1 %cmp7, label %land.lhs.true8, label %if.end50

land.lhs.true8:                                   ; preds = %land.lhs.true6
  %17 = load i32*, i32** %p.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %17, i32 2
  %18 = load i32, i32* %arrayidx, align 4
  %cmp9 = icmp eq i32 %18, 61
  br i1 %cmp9, label %land.lhs.true10, label %if.end50

land.lhs.true10:                                  ; preds = %land.lhs.true8
  %19 = load i32*, i32** %p.addr, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %19, i32 3
  %20 = load i32, i32* %arrayidx11, align 4
  %cmp12 = icmp eq i32 %20, 93
  br i1 %cmp12, label %if.then13, label %if.end50

if.then13:                                        ; preds = %land.lhs.true10
  %21 = load i32, i32* %flags.addr, align 4
  %and14 = and i32 %21, 16
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %land.lhs.true16, label %cond.false23

land.lhs.true16:                                  ; preds = %if.then13
  %22 = load i32*, i32** %p.addr, align 4
  %arrayidx17 = getelementptr inbounds i32, i32* %22, i32 1
  %23 = load i32, i32* %arrayidx17, align 4
  %call18 = call i32 @iswupper(i32 %23)
  %tobool19 = icmp ne i32 %call18, 0
  br i1 %tobool19, label %cond.true20, label %cond.false23

cond.true20:                                      ; preds = %land.lhs.true16
  %24 = load i32*, i32** %p.addr, align 4
  %arrayidx21 = getelementptr inbounds i32, i32* %24, i32 1
  %25 = load i32, i32* %arrayidx21, align 4
  %call22 = call i32 @towlower(i32 %25)
  br label %cond.end25

cond.false23:                                     ; preds = %land.lhs.true16, %if.then13
  %26 = load i32*, i32** %p.addr, align 4
  %arrayidx24 = getelementptr inbounds i32, i32* %26, i32 1
  %27 = load i32, i32* %arrayidx24, align 4
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false23, %cond.true20
  %cond26 = phi i32 [ %call22, %cond.true20 ], [ %27, %cond.false23 ]
  store i32 %cond26, i32* %pc, align 4
  %28 = load i32*, i32** %p.addr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %28, i32 4
  store i32* %add.ptr, i32** %p.addr, align 4
  %29 = load i32, i32* %test.addr, align 4
  %30 = load i32, i32* %pc, align 4
  %call27 = call i32 @collequiv_wc(i32 %29, i32 %30)
  %tobool28 = icmp ne i32 %call27, 0
  br i1 %tobool28, label %if.then29, label %if.else

if.then29:                                        ; preds = %cond.end25
  %31 = load i32*, i32** %p.addr, align 4
  %incdec.ptr30 = getelementptr inbounds i32, i32* %31, i32 1
  store i32* %incdec.ptr30, i32** %p.addr, align 4
  br label %matched

if.else:                                          ; preds = %cond.end25
  %32 = load i32*, i32** %p.addr, align 4
  %incdec.ptr31 = getelementptr inbounds i32, i32* %32, i32 1
  store i32* %incdec.ptr31, i32** %p.addr, align 4
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %c, align 4
  %34 = load i32, i32* %c, align 4
  %cmp32 = icmp eq i32 %34, 0
  br i1 %cmp32, label %if.then33, label %if.end39

if.then33:                                        ; preds = %if.else
  %35 = load i32, i32* %test.addr, align 4
  %cmp34 = icmp eq i32 %35, 91
  br i1 %cmp34, label %cond.true35, label %cond.false36

cond.true35:                                      ; preds = %if.then33
  %36 = load i32*, i32** %savep, align 4
  br label %cond.end37

cond.false36:                                     ; preds = %if.then33
  br label %cond.end37

cond.end37:                                       ; preds = %cond.false36, %cond.true35
  %cond38 = phi i32* [ %36, %cond.true35 ], [ null, %cond.false36 ]
  store i32* %cond38, i32** %retval, align 4
  br label %return

if.end39:                                         ; preds = %if.else
  %37 = load i32, i32* %flags.addr, align 4
  %and40 = and i32 %37, 16
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %land.lhs.true42, label %cond.false47

land.lhs.true42:                                  ; preds = %if.end39
  %38 = load i32, i32* %c, align 4
  %call43 = call i32 @iswupper(i32 %38)
  %tobool44 = icmp ne i32 %call43, 0
  br i1 %tobool44, label %cond.true45, label %cond.false47

cond.true45:                                      ; preds = %land.lhs.true42
  %39 = load i32, i32* %c, align 4
  %call46 = call i32 @towlower(i32 %39)
  br label %cond.end48

cond.false47:                                     ; preds = %land.lhs.true42, %if.end39
  %40 = load i32, i32* %c, align 4
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false47, %cond.true45
  %cond49 = phi i32 [ %call46, %cond.true45 ], [ %40, %cond.false47 ]
  store i32 %cond49, i32* %c, align 4
  br label %for.cond

if.end50:                                         ; preds = %land.lhs.true10, %land.lhs.true8, %land.lhs.true6, %for.cond
  %41 = load i32, i32* %c, align 4
  %cmp51 = icmp eq i32 %41, 91
  br i1 %cmp51, label %land.lhs.true52, label %if.end118

land.lhs.true52:                                  ; preds = %if.end50
  %42 = load i32*, i32** %p.addr, align 4
  %43 = load i32, i32* %42, align 4
  %cmp53 = icmp eq i32 %43, 58
  br i1 %cmp53, label %if.then54, label %if.end118

if.then54:                                        ; preds = %land.lhs.true52
  store i32 0, i32* %pc, align 4
  %44 = load i32*, i32** %p.addr, align 4
  %add.ptr55 = getelementptr inbounds i32, i32* %44, i32 1
  store i32* %add.ptr55, i32** %close, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc, %if.then54
  %45 = load i32*, i32** %close, align 4
  %46 = load i32, i32* %45, align 4
  %cmp57 = icmp ne i32 %46, 0
  br i1 %cmp57, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond56
  %47 = load i32*, i32** %close, align 4
  %48 = load i32, i32* %47, align 4
  %cmp58 = icmp eq i32 %48, 58
  br i1 %cmp58, label %land.lhs.true59, label %if.end63

land.lhs.true59:                                  ; preds = %for.body
  %49 = load i32*, i32** %close, align 4
  %add.ptr60 = getelementptr inbounds i32, i32* %49, i32 1
  %50 = load i32, i32* %add.ptr60, align 4
  %cmp61 = icmp eq i32 %50, 93
  br i1 %cmp61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %land.lhs.true59
  br label %for.end

if.end63:                                         ; preds = %land.lhs.true59, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end63
  %51 = load i32*, i32** %close, align 4
  %incdec.ptr64 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %incdec.ptr64, i32** %close, align 4
  br label %for.cond56

for.end:                                          ; preds = %if.then62, %for.cond56
  %52 = load i32*, i32** %close, align 4
  %53 = load i32, i32* %52, align 4
  %cmp65 = icmp ne i32 %53, 0
  br i1 %cmp65, label %if.then66, label %if.end90

if.then66:                                        ; preds = %for.end
  %54 = load i32*, i32** %close, align 4
  %55 = load i32*, i32** %p.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i32* %54 to i32
  %sub.ptr.rhs.cast = ptrtoint i32* %55 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 4
  %mul = mul i32 %sub.ptr.div, 4
  %call67 = call i8* @malloc(i32 %mul)
  %56 = bitcast i8* %call67 to i32*
  store i32* %56, i32** %ccname, align 4
  %57 = load i32*, i32** %ccname, align 4
  %cmp68 = icmp eq i32* %57, null
  br i1 %cmp68, label %if.then69, label %if.else70

if.then69:                                        ; preds = %if.then66
  store i32 0, i32* %pc, align 4
  br label %if.end84

if.else70:                                        ; preds = %if.then66
  %58 = load i32*, i32** %p.addr, align 4
  %add.ptr71 = getelementptr inbounds i32, i32* %58, i32 1
  %59 = bitcast i32* %add.ptr71 to i8*
  %60 = load i32*, i32** %ccname, align 4
  %61 = bitcast i32* %60 to i8*
  %62 = load i32*, i32** %close, align 4
  %63 = load i32*, i32** %p.addr, align 4
  %sub.ptr.lhs.cast72 = ptrtoint i32* %62 to i32
  %sub.ptr.rhs.cast73 = ptrtoint i32* %63 to i32
  %sub.ptr.sub74 = sub i32 %sub.ptr.lhs.cast72, %sub.ptr.rhs.cast73
  %sub.ptr.div75 = sdiv exact i32 %sub.ptr.sub74, 4
  %sub = sub nsw i32 %sub.ptr.div75, 1
  %mul76 = mul i32 %sub, 4
  call void @bcopy(i8* %59, i8* %61, i32 %mul76)
  %64 = load i32*, i32** %ccname, align 4
  %65 = load i32*, i32** %close, align 4
  %66 = load i32*, i32** %p.addr, align 4
  %sub.ptr.lhs.cast77 = ptrtoint i32* %65 to i32
  %sub.ptr.rhs.cast78 = ptrtoint i32* %66 to i32
  %sub.ptr.sub79 = sub i32 %sub.ptr.lhs.cast77, %sub.ptr.rhs.cast78
  %sub.ptr.div80 = sdiv exact i32 %sub.ptr.sub79, 4
  %sub81 = sub nsw i32 %sub.ptr.div80, 1
  %add.ptr82 = getelementptr inbounds i32, i32* %64, i32 %sub81
  store i32 0, i32* %add.ptr82, align 4
  %67 = load i32, i32* %test.addr, align 4
  %68 = load i32*, i32** %ccname, align 4
  %call83 = call i32 @is_wcclass(i32 %67, i32* %68)
  store i32 %call83, i32* %pc, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.else70, %if.then69
  %69 = load i32, i32* %pc, align 4
  %cmp85 = icmp eq i32 %69, -1
  br i1 %cmp85, label %if.then86, label %if.else87

if.then86:                                        ; preds = %if.end84
  store i32 0, i32* %pc, align 4
  br label %if.end89

if.else87:                                        ; preds = %if.end84
  %70 = load i32*, i32** %close, align 4
  %add.ptr88 = getelementptr inbounds i32, i32* %70, i32 2
  store i32* %add.ptr88, i32** %p.addr, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else87, %if.then86
  %71 = load i32*, i32** %ccname, align 4
  %72 = bitcast i32* %71 to i8*
  call void @sh_xfree(i8* %72, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 434)
  br label %if.end90

if.end90:                                         ; preds = %if.end89, %for.end
  %73 = load i32, i32* %pc, align 4
  %tobool91 = icmp ne i32 %73, 0
  br i1 %tobool91, label %if.then92, label %if.else94

if.then92:                                        ; preds = %if.end90
  %74 = load i32*, i32** %p.addr, align 4
  %incdec.ptr93 = getelementptr inbounds i32, i32* %74, i32 1
  store i32* %incdec.ptr93, i32** %p.addr, align 4
  br label %matched

if.else94:                                        ; preds = %if.end90
  %75 = load i32*, i32** %p.addr, align 4
  %incdec.ptr95 = getelementptr inbounds i32, i32* %75, i32 1
  store i32* %incdec.ptr95, i32** %p.addr, align 4
  %76 = load i32, i32* %75, align 4
  store i32 %76, i32* %c, align 4
  %77 = load i32, i32* %c, align 4
  %cmp96 = icmp eq i32 %77, 0
  br i1 %cmp96, label %if.then97, label %if.else103

if.then97:                                        ; preds = %if.else94
  %78 = load i32, i32* %test.addr, align 4
  %cmp98 = icmp eq i32 %78, 91
  br i1 %cmp98, label %cond.true99, label %cond.false100

cond.true99:                                      ; preds = %if.then97
  %79 = load i32*, i32** %savep, align 4
  br label %cond.end101

cond.false100:                                    ; preds = %if.then97
  br label %cond.end101

cond.end101:                                      ; preds = %cond.false100, %cond.true99
  %cond102 = phi i32* [ %79, %cond.true99 ], [ null, %cond.false100 ]
  store i32* %cond102, i32** %retval, align 4
  br label %return

if.else103:                                       ; preds = %if.else94
  %80 = load i32, i32* %c, align 4
  %cmp104 = icmp eq i32 %80, 93
  br i1 %cmp104, label %if.then105, label %if.end106

if.then105:                                       ; preds = %if.else103
  br label %for.end249

if.end106:                                        ; preds = %if.else103
  br label %if.end107

if.end107:                                        ; preds = %if.end106
  %81 = load i32, i32* %flags.addr, align 4
  %and108 = and i32 %81, 16
  %tobool109 = icmp ne i32 %and108, 0
  br i1 %tobool109, label %land.lhs.true110, label %cond.false115

land.lhs.true110:                                 ; preds = %if.end107
  %82 = load i32, i32* %c, align 4
  %call111 = call i32 @iswupper(i32 %82)
  %tobool112 = icmp ne i32 %call111, 0
  br i1 %tobool112, label %cond.true113, label %cond.false115

cond.true113:                                     ; preds = %land.lhs.true110
  %83 = load i32, i32* %c, align 4
  %call114 = call i32 @towlower(i32 %83)
  br label %cond.end116

cond.false115:                                    ; preds = %land.lhs.true110, %if.end107
  %84 = load i32, i32* %c, align 4
  br label %cond.end116

cond.end116:                                      ; preds = %cond.false115, %cond.true113
  %cond117 = phi i32 [ %call114, %cond.true113 ], [ %84, %cond.false115 ]
  store i32 %cond117, i32* %c, align 4
  br label %for.cond

if.end118:                                        ; preds = %land.lhs.true52, %if.end50
  %85 = load i32, i32* %c, align 4
  %cmp119 = icmp eq i32 %85, 91
  br i1 %cmp119, label %land.lhs.true120, label %if.end129

land.lhs.true120:                                 ; preds = %if.end118
  %86 = load i32*, i32** %p.addr, align 4
  %87 = load i32, i32* %86, align 4
  %cmp121 = icmp eq i32 %87, 46
  br i1 %cmp121, label %if.then122, label %if.end129

if.then122:                                       ; preds = %land.lhs.true120
  %88 = load i32*, i32** %p.addr, align 4
  %call123 = call i32* @parse_collwcsym(i32* %88, i32* %pc)
  store i32* %call123, i32** %p.addr, align 4
  %89 = load i32, i32* %pc, align 4
  %cmp124 = icmp eq i32 %89, -1
  br i1 %cmp124, label %cond.true125, label %cond.false126

cond.true125:                                     ; preds = %if.then122
  %90 = load i32, i32* %test.addr, align 4
  %add = add i32 %90, 1
  br label %cond.end127

cond.false126:                                    ; preds = %if.then122
  %91 = load i32, i32* %pc, align 4
  br label %cond.end127

cond.end127:                                      ; preds = %cond.false126, %cond.true125
  %cond128 = phi i32 [ %add, %cond.true125 ], [ %91, %cond.false126 ]
  store i32 %cond128, i32* %cstart, align 4
  store i32 1, i32* %forcecoll, align 4
  br label %if.end129

if.end129:                                        ; preds = %cond.end127, %land.lhs.true120, %if.end118
  %92 = load i32, i32* %flags.addr, align 4
  %and130 = and i32 %92, 2
  %tobool131 = icmp ne i32 %and130, 0
  br i1 %tobool131, label %if.end139, label %land.lhs.true132

land.lhs.true132:                                 ; preds = %if.end129
  %93 = load i32, i32* %c, align 4
  %cmp133 = icmp eq i32 %93, 92
  br i1 %cmp133, label %if.then134, label %if.end139

if.then134:                                       ; preds = %land.lhs.true132
  %94 = load i32*, i32** %p.addr, align 4
  %95 = load i32, i32* %94, align 4
  %cmp135 = icmp eq i32 %95, 0
  br i1 %cmp135, label %if.then136, label %if.end137

if.then136:                                       ; preds = %if.then134
  store i32* null, i32** %retval, align 4
  br label %return

if.end137:                                        ; preds = %if.then134
  %96 = load i32*, i32** %p.addr, align 4
  %incdec.ptr138 = getelementptr inbounds i32, i32* %96, i32 1
  store i32* %incdec.ptr138, i32** %p.addr, align 4
  %97 = load i32, i32* %96, align 4
  store i32 %97, i32* %cend, align 4
  store i32 %97, i32* %cstart, align 4
  br label %if.end139

if.end139:                                        ; preds = %if.end137, %land.lhs.true132, %if.end129
  %98 = load i32, i32* %flags.addr, align 4
  %and140 = and i32 %98, 16
  %tobool141 = icmp ne i32 %and140, 0
  br i1 %tobool141, label %land.lhs.true142, label %cond.false147

land.lhs.true142:                                 ; preds = %if.end139
  %99 = load i32, i32* %cstart, align 4
  %call143 = call i32 @iswupper(i32 %99)
  %tobool144 = icmp ne i32 %call143, 0
  br i1 %tobool144, label %cond.true145, label %cond.false147

cond.true145:                                     ; preds = %land.lhs.true142
  %100 = load i32, i32* %cstart, align 4
  %call146 = call i32 @towlower(i32 %100)
  br label %cond.end148

cond.false147:                                    ; preds = %land.lhs.true142, %if.end139
  %101 = load i32, i32* %cstart, align 4
  br label %cond.end148

cond.end148:                                      ; preds = %cond.false147, %cond.true145
  %cond149 = phi i32 [ %call146, %cond.true145 ], [ %101, %cond.false147 ]
  store i32 %cond149, i32* %cend, align 4
  store i32 %cond149, i32* %cstart, align 4
  %102 = load i32, i32* %c, align 4
  %cmp150 = icmp eq i32 %102, 0
  br i1 %cmp150, label %if.then151, label %if.end157

if.then151:                                       ; preds = %cond.end148
  %103 = load i32, i32* %test.addr, align 4
  %cmp152 = icmp eq i32 %103, 91
  br i1 %cmp152, label %cond.true153, label %cond.false154

cond.true153:                                     ; preds = %if.then151
  %104 = load i32*, i32** %savep, align 4
  br label %cond.end155

cond.false154:                                    ; preds = %if.then151
  br label %cond.end155

cond.end155:                                      ; preds = %cond.false154, %cond.true153
  %cond156 = phi i32* [ %104, %cond.true153 ], [ null, %cond.false154 ]
  store i32* %cond156, i32** %retval, align 4
  br label %return

if.end157:                                        ; preds = %cond.end148
  %105 = load i32*, i32** %p.addr, align 4
  %incdec.ptr158 = getelementptr inbounds i32, i32* %105, i32 1
  store i32* %incdec.ptr158, i32** %p.addr, align 4
  %106 = load i32, i32* %105, align 4
  store i32 %106, i32* %c, align 4
  %107 = load i32, i32* %flags.addr, align 4
  %and159 = and i32 %107, 16
  %tobool160 = icmp ne i32 %and159, 0
  br i1 %tobool160, label %land.lhs.true161, label %cond.false166

land.lhs.true161:                                 ; preds = %if.end157
  %108 = load i32, i32* %c, align 4
  %call162 = call i32 @iswupper(i32 %108)
  %tobool163 = icmp ne i32 %call162, 0
  br i1 %tobool163, label %cond.true164, label %cond.false166

cond.true164:                                     ; preds = %land.lhs.true161
  %109 = load i32, i32* %c, align 4
  %call165 = call i32 @towlower(i32 %109)
  br label %cond.end167

cond.false166:                                    ; preds = %land.lhs.true161, %if.end157
  %110 = load i32, i32* %c, align 4
  br label %cond.end167

cond.end167:                                      ; preds = %cond.false166, %cond.true164
  %cond168 = phi i32 [ %call165, %cond.true164 ], [ %110, %cond.false166 ]
  store i32 %cond168, i32* %c, align 4
  %111 = load i32, i32* %c, align 4
  %cmp169 = icmp eq i32 %111, 0
  br i1 %cmp169, label %if.then170, label %if.end176

if.then170:                                       ; preds = %cond.end167
  %112 = load i32, i32* %test.addr, align 4
  %cmp171 = icmp eq i32 %112, 91
  br i1 %cmp171, label %cond.true172, label %cond.false173

cond.true172:                                     ; preds = %if.then170
  %113 = load i32*, i32** %savep, align 4
  br label %cond.end174

cond.false173:                                    ; preds = %if.then170
  br label %cond.end174

cond.end174:                                      ; preds = %cond.false173, %cond.true172
  %cond175 = phi i32* [ %113, %cond.true172 ], [ null, %cond.false173 ]
  store i32* %cond175, i32** %retval, align 4
  br label %return

if.end176:                                        ; preds = %cond.end167
  %114 = load i32, i32* %flags.addr, align 4
  %and177 = and i32 %114, 1
  %tobool178 = icmp ne i32 %and177, 0
  br i1 %tobool178, label %land.lhs.true179, label %if.end182

land.lhs.true179:                                 ; preds = %if.end176
  %115 = load i32, i32* %c, align 4
  %cmp180 = icmp eq i32 %115, 47
  br i1 %cmp180, label %if.then181, label %if.end182

if.then181:                                       ; preds = %land.lhs.true179
  store i32* null, i32** %retval, align 4
  br label %return

if.end182:                                        ; preds = %land.lhs.true179, %if.end176
  %116 = load i32, i32* %c, align 4
  %cmp183 = icmp eq i32 %116, 45
  br i1 %cmp183, label %land.lhs.true184, label %if.end238

land.lhs.true184:                                 ; preds = %if.end182
  %117 = load i32*, i32** %p.addr, align 4
  %118 = load i32, i32* %117, align 4
  %cmp185 = icmp ne i32 %118, 93
  br i1 %cmp185, label %if.then186, label %if.end238

if.then186:                                       ; preds = %land.lhs.true184
  %119 = load i32*, i32** %p.addr, align 4
  %incdec.ptr187 = getelementptr inbounds i32, i32* %119, i32 1
  store i32* %incdec.ptr187, i32** %p.addr, align 4
  %120 = load i32, i32* %119, align 4
  store i32 %120, i32* %cend, align 4
  %121 = load i32, i32* %flags.addr, align 4
  %and188 = and i32 %121, 2
  %tobool189 = icmp ne i32 %and188, 0
  br i1 %tobool189, label %if.end194, label %land.lhs.true190

land.lhs.true190:                                 ; preds = %if.then186
  %122 = load i32, i32* %cend, align 4
  %cmp191 = icmp eq i32 %122, 92
  br i1 %cmp191, label %if.then192, label %if.end194

if.then192:                                       ; preds = %land.lhs.true190
  %123 = load i32*, i32** %p.addr, align 4
  %incdec.ptr193 = getelementptr inbounds i32, i32* %123, i32 1
  store i32* %incdec.ptr193, i32** %p.addr, align 4
  %124 = load i32, i32* %123, align 4
  store i32 %124, i32* %cend, align 4
  br label %if.end194

if.end194:                                        ; preds = %if.then192, %land.lhs.true190, %if.then186
  %125 = load i32, i32* %cend, align 4
  %cmp195 = icmp eq i32 %125, 0
  br i1 %cmp195, label %if.then196, label %if.end197

if.then196:                                       ; preds = %if.end194
  store i32* null, i32** %retval, align 4
  br label %return

if.end197:                                        ; preds = %if.end194
  %126 = load i32, i32* %cend, align 4
  %cmp198 = icmp eq i32 %126, 91
  br i1 %cmp198, label %land.lhs.true199, label %if.end209

land.lhs.true199:                                 ; preds = %if.end197
  %127 = load i32*, i32** %p.addr, align 4
  %128 = load i32, i32* %127, align 4
  %cmp200 = icmp eq i32 %128, 46
  br i1 %cmp200, label %if.then201, label %if.end209

if.then201:                                       ; preds = %land.lhs.true199
  %129 = load i32*, i32** %p.addr, align 4
  %call202 = call i32* @parse_collwcsym(i32* %129, i32* %pc)
  store i32* %call202, i32** %p.addr, align 4
  %130 = load i32, i32* %pc, align 4
  %cmp203 = icmp eq i32 %130, -1
  br i1 %cmp203, label %cond.true204, label %cond.false206

cond.true204:                                     ; preds = %if.then201
  %131 = load i32, i32* %test.addr, align 4
  %sub205 = sub i32 %131, 1
  br label %cond.end207

cond.false206:                                    ; preds = %if.then201
  %132 = load i32, i32* %pc, align 4
  br label %cond.end207

cond.end207:                                      ; preds = %cond.false206, %cond.true204
  %cond208 = phi i32 [ %sub205, %cond.true204 ], [ %132, %cond.false206 ]
  store i32 %cond208, i32* %cend, align 4
  store i32 1, i32* %forcecoll, align 4
  br label %if.end209

if.end209:                                        ; preds = %cond.end207, %land.lhs.true199, %if.end197
  %133 = load i32, i32* %flags.addr, align 4
  %and210 = and i32 %133, 16
  %tobool211 = icmp ne i32 %and210, 0
  br i1 %tobool211, label %land.lhs.true212, label %cond.false217

land.lhs.true212:                                 ; preds = %if.end209
  %134 = load i32, i32* %cend, align 4
  %call213 = call i32 @iswupper(i32 %134)
  %tobool214 = icmp ne i32 %call213, 0
  br i1 %tobool214, label %cond.true215, label %cond.false217

cond.true215:                                     ; preds = %land.lhs.true212
  %135 = load i32, i32* %cend, align 4
  %call216 = call i32 @towlower(i32 %135)
  br label %cond.end218

cond.false217:                                    ; preds = %land.lhs.true212, %if.end209
  %136 = load i32, i32* %cend, align 4
  br label %cond.end218

cond.end218:                                      ; preds = %cond.false217, %cond.true215
  %cond219 = phi i32 [ %call216, %cond.true215 ], [ %136, %cond.false217 ]
  store i32 %cond219, i32* %cend, align 4
  %137 = load i32*, i32** %p.addr, align 4
  %incdec.ptr220 = getelementptr inbounds i32, i32* %137, i32 1
  store i32* %incdec.ptr220, i32** %p.addr, align 4
  %138 = load i32, i32* %137, align 4
  store i32 %138, i32* %c, align 4
  %139 = load i32, i32* %cstart, align 4
  %140 = load i32, i32* %cend, align 4
  %141 = load i32, i32* %forcecoll, align 4
  %call221 = call i32 @rangecmp_wc(i32 %139, i32 %140, i32 %141)
  %cmp222 = icmp sgt i32 %call221, 0
  br i1 %cmp222, label %if.then223, label %if.end237

if.then223:                                       ; preds = %cond.end218
  %142 = load i32, i32* %c, align 4
  %cmp224 = icmp eq i32 %142, 93
  br i1 %cmp224, label %if.then225, label %if.end226

if.then225:                                       ; preds = %if.then223
  br label %for.end249

if.end226:                                        ; preds = %if.then223
  %143 = load i32, i32* %flags.addr, align 4
  %and227 = and i32 %143, 16
  %tobool228 = icmp ne i32 %and227, 0
  br i1 %tobool228, label %land.lhs.true229, label %cond.false234

land.lhs.true229:                                 ; preds = %if.end226
  %144 = load i32, i32* %c, align 4
  %call230 = call i32 @iswupper(i32 %144)
  %tobool231 = icmp ne i32 %call230, 0
  br i1 %tobool231, label %cond.true232, label %cond.false234

cond.true232:                                     ; preds = %land.lhs.true229
  %145 = load i32, i32* %c, align 4
  %call233 = call i32 @towlower(i32 %145)
  br label %cond.end235

cond.false234:                                    ; preds = %land.lhs.true229, %if.end226
  %146 = load i32, i32* %c, align 4
  br label %cond.end235

cond.end235:                                      ; preds = %cond.false234, %cond.true232
  %cond236 = phi i32 [ %call233, %cond.true232 ], [ %146, %cond.false234 ]
  store i32 %cond236, i32* %c, align 4
  br label %for.cond

if.end237:                                        ; preds = %cond.end218
  br label %if.end238

if.end238:                                        ; preds = %if.end237, %land.lhs.true184, %if.end182
  %147 = load i32, i32* %test.addr, align 4
  %148 = load i32, i32* %cstart, align 4
  %149 = load i32, i32* %forcecoll, align 4
  %call239 = call i32 @rangecmp_wc(i32 %147, i32 %148, i32 %149)
  %cmp240 = icmp sge i32 %call239, 0
  br i1 %cmp240, label %land.lhs.true241, label %if.end245

land.lhs.true241:                                 ; preds = %if.end238
  %150 = load i32, i32* %test.addr, align 4
  %151 = load i32, i32* %cend, align 4
  %152 = load i32, i32* %forcecoll, align 4
  %call242 = call i32 @rangecmp_wc(i32 %150, i32 %151, i32 %152)
  %cmp243 = icmp sle i32 %call242, 0
  br i1 %cmp243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %land.lhs.true241
  br label %matched

if.end245:                                        ; preds = %land.lhs.true241, %if.end238
  %153 = load i32, i32* %c, align 4
  %cmp246 = icmp eq i32 %153, 93
  br i1 %cmp246, label %if.then247, label %if.end248

if.then247:                                       ; preds = %if.end245
  br label %for.end249

if.end248:                                        ; preds = %if.end245
  br label %for.cond

for.end249:                                       ; preds = %if.then247, %if.then225, %if.then105
  %154 = load i32, i32* %not, align 4
  %tobool250 = icmp ne i32 %154, 0
  br i1 %tobool250, label %cond.false252, label %cond.true251

cond.true251:                                     ; preds = %for.end249
  br label %cond.end253

cond.false252:                                    ; preds = %for.end249
  %155 = load i32*, i32** %p.addr, align 4
  br label %cond.end253

cond.end253:                                      ; preds = %cond.false252, %cond.true251
  %cond254 = phi i32* [ null, %cond.true251 ], [ %155, %cond.false252 ]
  store i32* %cond254, i32** %retval, align 4
  br label %return

matched:                                          ; preds = %if.then244, %if.then92, %if.then29
  %156 = load i32*, i32** %p.addr, align 4
  %incdec.ptr255 = getelementptr inbounds i32, i32* %156, i32 -1
  store i32* %incdec.ptr255, i32** %p.addr, align 4
  %157 = load i32, i32* %incdec.ptr255, align 4
  store i32 %157, i32* %c, align 4
  store i32 1, i32* %brcnt, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end288, %matched
  %158 = load i32, i32* %brcnt, align 4
  %cmp256 = icmp sgt i32 %158, 0
  br i1 %cmp256, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %159 = load i32, i32* %c, align 4
  %cmp257 = icmp eq i32 %159, 0
  br i1 %cmp257, label %if.then258, label %if.end264

if.then258:                                       ; preds = %while.body
  %160 = load i32, i32* %test.addr, align 4
  %cmp259 = icmp eq i32 %160, 91
  br i1 %cmp259, label %cond.true260, label %cond.false261

cond.true260:                                     ; preds = %if.then258
  %161 = load i32*, i32** %savep, align 4
  br label %cond.end262

cond.false261:                                    ; preds = %if.then258
  br label %cond.end262

cond.end262:                                      ; preds = %cond.false261, %cond.true260
  %cond263 = phi i32* [ %161, %cond.true260 ], [ null, %cond.false261 ]
  store i32* %cond263, i32** %retval, align 4
  br label %return

if.end264:                                        ; preds = %while.body
  %162 = load i32*, i32** %p.addr, align 4
  %incdec.ptr265 = getelementptr inbounds i32, i32* %162, i32 1
  store i32* %incdec.ptr265, i32** %p.addr, align 4
  %163 = load i32, i32* %162, align 4
  store i32 %163, i32* %c, align 4
  %164 = load i32, i32* %c, align 4
  %cmp266 = icmp eq i32 %164, 91
  br i1 %cmp266, label %land.lhs.true267, label %if.else273

land.lhs.true267:                                 ; preds = %if.end264
  %165 = load i32*, i32** %p.addr, align 4
  %166 = load i32, i32* %165, align 4
  %cmp268 = icmp eq i32 %166, 61
  br i1 %cmp268, label %if.then272, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true267
  %167 = load i32*, i32** %p.addr, align 4
  %168 = load i32, i32* %167, align 4
  %cmp269 = icmp eq i32 %168, 58
  br i1 %cmp269, label %if.then272, label %lor.lhs.false270

lor.lhs.false270:                                 ; preds = %lor.lhs.false
  %169 = load i32*, i32** %p.addr, align 4
  %170 = load i32, i32* %169, align 4
  %cmp271 = icmp eq i32 %170, 46
  br i1 %cmp271, label %if.then272, label %if.else273

if.then272:                                       ; preds = %lor.lhs.false270, %lor.lhs.false, %land.lhs.true267
  %171 = load i32, i32* %brcnt, align 4
  %inc = add nsw i32 %171, 1
  store i32 %inc, i32* %brcnt, align 4
  br label %if.end288

if.else273:                                       ; preds = %lor.lhs.false270, %if.end264
  %172 = load i32, i32* %c, align 4
  %cmp274 = icmp eq i32 %172, 93
  br i1 %cmp274, label %if.then275, label %if.else276

if.then275:                                       ; preds = %if.else273
  %173 = load i32, i32* %brcnt, align 4
  %dec = add nsw i32 %173, -1
  store i32 %dec, i32* %brcnt, align 4
  br label %if.end287

if.else276:                                       ; preds = %if.else273
  %174 = load i32, i32* %flags.addr, align 4
  %and277 = and i32 %174, 2
  %tobool278 = icmp ne i32 %and277, 0
  br i1 %tobool278, label %if.end286, label %land.lhs.true279

land.lhs.true279:                                 ; preds = %if.else276
  %175 = load i32, i32* %c, align 4
  %cmp280 = icmp eq i32 %175, 92
  br i1 %cmp280, label %if.then281, label %if.end286

if.then281:                                       ; preds = %land.lhs.true279
  %176 = load i32*, i32** %p.addr, align 4
  %177 = load i32, i32* %176, align 4
  %cmp282 = icmp eq i32 %177, 0
  br i1 %cmp282, label %if.then283, label %if.end284

if.then283:                                       ; preds = %if.then281
  store i32* null, i32** %retval, align 4
  br label %return

if.end284:                                        ; preds = %if.then281
  %178 = load i32*, i32** %p.addr, align 4
  %incdec.ptr285 = getelementptr inbounds i32, i32* %178, i32 1
  store i32* %incdec.ptr285, i32** %p.addr, align 4
  br label %if.end286

if.end286:                                        ; preds = %if.end284, %land.lhs.true279, %if.else276
  br label %if.end287

if.end287:                                        ; preds = %if.end286, %if.then275
  br label %if.end288

if.end288:                                        ; preds = %if.end287, %if.then272
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %179 = load i32, i32* %not, align 4
  %tobool289 = icmp ne i32 %179, 0
  br i1 %tobool289, label %cond.true290, label %cond.false291

cond.true290:                                     ; preds = %while.end
  br label %cond.end292

cond.false291:                                    ; preds = %while.end
  %180 = load i32*, i32** %p.addr, align 4
  br label %cond.end292

cond.end292:                                      ; preds = %cond.false291, %cond.true290
  %cond293 = phi i32* [ null, %cond.true290 ], [ %180, %cond.false291 ]
  store i32* %cond293, i32** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end292, %if.then283, %cond.end262, %cond.end253, %if.then196, %if.then181, %cond.end174, %cond.end155, %if.then136, %cond.end101, %cond.end37
  %181 = load i32*, i32** %retval, align 4
  ret i32* %181
}

; Function Attrs: noinline nounwind
define internal i32 @wscompare(i32* %p, i32* %pe, i32* %s, i32* %se) #0 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca i32*, align 4
  %pe.addr = alloca i32*, align 4
  %s.addr = alloca i32*, align 4
  %se.addr = alloca i32*, align 4
  %ret = alloca i32, align 4
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  %l1 = alloca i32, align 4
  %l2 = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 4
  store i32* %pe, i32** %pe.addr, align 4
  store i32* %s, i32** %s.addr, align 4
  store i32* %se, i32** %se.addr, align 4
  %0 = load i32*, i32** %pe.addr, align 4
  %1 = load i32*, i32** %p.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i32* %0 to i32
  %sub.ptr.rhs.cast = ptrtoint i32* %1 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 4
  store i32 %sub.ptr.div, i32* %l1, align 4
  %2 = load i32*, i32** %se.addr, align 4
  %3 = load i32*, i32** %s.addr, align 4
  %sub.ptr.lhs.cast1 = ptrtoint i32* %2 to i32
  %sub.ptr.rhs.cast2 = ptrtoint i32* %3 to i32
  %sub.ptr.sub3 = sub i32 %sub.ptr.lhs.cast1, %sub.ptr.rhs.cast2
  %sub.ptr.div4 = sdiv exact i32 %sub.ptr.sub3, 4
  store i32 %sub.ptr.div4, i32* %l2, align 4
  %4 = load i32, i32* %l1, align 4
  %5 = load i32, i32* %l2, align 4
  %cmp = icmp ne i32 %4, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32*, i32** %pe.addr, align 4
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %c1, align 4
  %8 = load i32*, i32** %se.addr, align 4
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %c2, align 4
  %10 = load i32, i32* %c1, align 4
  %cmp5 = icmp ne i32 %10, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %11 = load i32*, i32** %pe.addr, align 4
  store i32 0, i32* %11, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %12 = load i32, i32* %c2, align 4
  %cmp8 = icmp ne i32 %12, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  %13 = load i32*, i32** %se.addr, align 4
  store i32 0, i32* %13, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  %14 = load i32*, i32** %p.addr, align 4
  %15 = load i32*, i32** %s.addr, align 4
  %call = call i32 @wcscoll(i32* %14, i32* %15)
  store i32 %call, i32* %ret, align 4
  %16 = load i32, i32* %c1, align 4
  %cmp11 = icmp ne i32 %16, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  %17 = load i32, i32* %c1, align 4
  %18 = load i32*, i32** %pe.addr, align 4
  store i32 %17, i32* %18, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  %19 = load i32, i32* %c2, align 4
  %cmp14 = icmp ne i32 %19, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %20 = load i32, i32* %c2, align 4
  %21 = load i32*, i32** %se.addr, align 4
  store i32 %20, i32* %21, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %22 = load i32, i32* %ret, align 4
  %cmp17 = icmp eq i32 %22, 0
  br i1 %cmp17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end16
  %23 = load i32, i32* %ret, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end16
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %23, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare i32 @wcscoll(i32*, i32*) #1

; Function Attrs: noinline nounwind
define internal i32 @collequiv_wc(i32 %c, i32 %equiv) #0 {
entry:
  %c.addr = alloca i32, align 4
  %equiv.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %equiv, i32* %equiv.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %1 = load i32, i32* %equiv.addr, align 4
  %cmp = icmp eq i32 %0, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define internal i32 @is_wcclass(i32 %wc, i32* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %wc.addr = alloca i32, align 4
  %name.addr = alloca i32*, align 4
  %mbs = alloca i8*, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %mbslength = alloca i32, align 4
  %desc = alloca i32, align 4
  %want_word = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  store i32* %name, i32** %name.addr, align 4
  %call = call i32 @wctype(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0))
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i32*, i32** %name.addr, align 4
  %call1 = call i32 @wcscmp(i32* %0, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.113, i32 0, i32 0))
  %cmp2 = icmp eq i32 %call1, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = load i32, i32* %wc.addr, align 4
  %call3 = call i32 @wctob(i32 %1)
  store i32 %call3, i32* %c, align 4
  %cmp4 = icmp eq i32 %call3, -1
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %c, align 4
  %cmp6 = icmp sle i32 %2, 127
  %conv = zext i1 %cmp6 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %3 = load i32*, i32** %name.addr, align 4
  %call7 = call i32 @wcscmp(i32* %3, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @.str.114, i32 0, i32 0))
  %cmp8 = icmp eq i32 %call7, 0
  %conv9 = zext i1 %cmp8 to i32
  store i32 %conv9, i32* %want_word, align 4
  %4 = load i32, i32* %want_word, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  store i32* getelementptr inbounds ([6 x i32], [6 x i32]* @.str.115, i32 0, i32 0), i32** %name.addr, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  %5 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %5, i8 0, i32 8, i32 4, i1 false)
  %6 = load i32*, i32** %name.addr, align 4
  %call12 = call i32 @wcslen(i32* %6)
  %call13 = call i32 @__ctype_get_mb_cur_max()
  %mul = mul i32 %call12, %call13
  %add = add i32 %mul, 1
  %call14 = call i8* @malloc(i32 %add)
  store i8* %call14, i8** %mbs, align 4
  %7 = load i8*, i8** %mbs, align 4
  %cmp15 = icmp eq i8* %7, null
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end11
  store i32 -1, i32* %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end11
  %8 = load i8*, i8** %mbs, align 4
  %9 = load i32*, i32** %name.addr, align 4
  %call19 = call i32 @wcslen(i32* %9)
  %call20 = call i32 @__ctype_get_mb_cur_max()
  %mul21 = mul i32 %call19, %call20
  %add22 = add i32 %mul21, 1
  %call23 = call i32 @wcsrtombs(i8* %8, i32** %name.addr, i32 %add22, %struct.__mbstate_t* %state)
  store i32 %call23, i32* %mbslength, align 4
  %10 = load i32, i32* %mbslength, align 4
  %cmp24 = icmp eq i32 %10, -1
  br i1 %cmp24, label %if.then28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end18
  %11 = load i32, i32* %mbslength, align 4
  %cmp26 = icmp eq i32 %11, -2
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %lor.lhs.false, %if.end18
  %12 = load i8*, i8** %mbs, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 343)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %lor.lhs.false
  %13 = load i8*, i8** %mbs, align 4
  %call30 = call i32 @wctype(i8* %13)
  store i32 %call30, i32* %desc, align 4
  %14 = load i8*, i8** %mbs, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 347)
  %15 = load i32, i32* %desc, align 4
  %cmp31 = icmp eq i32 %15, 0
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end29
  store i32 -1, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %if.end29
  %16 = load i32, i32* %want_word, align 4
  %tobool35 = icmp ne i32 %16, 0
  br i1 %tobool35, label %if.then36, label %if.else41

if.then36:                                        ; preds = %if.end34
  %17 = load i32, i32* %wc.addr, align 4
  %18 = load i32, i32* %desc, align 4
  %call37 = call i32 @iswctype(i32 %17, i32 %18)
  %tobool38 = icmp ne i32 %call37, 0
  br i1 %tobool38, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then36
  %19 = load i32, i32* %wc.addr, align 4
  %cmp39 = icmp eq i32 %19, 95
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then36
  %20 = phi i1 [ true, %if.then36 ], [ %cmp39, %lor.rhs ]
  %lor.ext = zext i1 %20 to i32
  store i32 %lor.ext, i32* %retval, align 4
  br label %return

if.else41:                                        ; preds = %if.end34
  %21 = load i32, i32* %wc.addr, align 4
  %22 = load i32, i32* %desc, align 4
  %call42 = call i32 @iswctype(i32 %21, i32 %22)
  store i32 %call42, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else41, %lor.end, %if.then33, %if.then28, %if.then17, %if.else, %if.then5
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind
define internal i32* @parse_collwcsym(i32* %p, i32* %vp) #0 {
entry:
  %retval = alloca i32*, align 4
  %p.addr = alloca i32*, align 4
  %vp.addr = alloca i32*, align 4
  %pc = alloca i32, align 4
  %val = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 4
  store i32* %vp, i32** %vp.addr, align 4
  %0 = load i32*, i32** %p.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %0, i32 1
  store i32* %incdec.ptr, i32** %p.addr, align 4
  store i32 0, i32* %pc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32*, i32** %p.addr, align 4
  %2 = load i32, i32* %pc, align 4
  %arrayidx = getelementptr inbounds i32, i32* %1, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %p.addr, align 4
  %5 = load i32, i32* %pc, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i32 %5
  %6 = load i32, i32* %arrayidx1, align 4
  %cmp = icmp eq i32 %6, 46
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32*, i32** %p.addr, align 4
  %8 = load i32, i32* %pc, align 4
  %add = add nsw i32 %8, 1
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i32 %add
  %9 = load i32, i32* %arrayidx2, align 4
  %cmp3 = icmp eq i32 %9, 93
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %for.end

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %pc, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %pc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %11 = load i32*, i32** %p.addr, align 4
  %12 = load i32, i32* %pc, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i32 %12
  %13 = load i32, i32* %arrayidx4, align 4
  %cmp5 = icmp eq i32 %13, 0
  br i1 %cmp5, label %if.then6, label %if.end10

if.then6:                                         ; preds = %for.end
  %14 = load i32*, i32** %vp.addr, align 4
  %tobool7 = icmp ne i32* %14, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then6
  %15 = load i32*, i32** %vp.addr, align 4
  store i32 -1, i32* %15, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then6
  %16 = load i32*, i32** %p.addr, align 4
  %17 = load i32, i32* %pc, align 4
  %add.ptr = getelementptr inbounds i32, i32* %16, i32 %17
  store i32* %add.ptr, i32** %retval, align 4
  br label %return

if.end10:                                         ; preds = %for.end
  %18 = load i32*, i32** %p.addr, align 4
  %19 = load i32, i32* %pc, align 4
  %call = call i32 @collwcsym(i32* %18, i32 %19)
  store i32 %call, i32* %val, align 4
  %20 = load i32*, i32** %vp.addr, align 4
  %tobool11 = icmp ne i32* %20, null
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  %21 = load i32, i32* %val, align 4
  %22 = load i32*, i32** %vp.addr, align 4
  store i32 %21, i32* %22, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  %23 = load i32*, i32** %p.addr, align 4
  %24 = load i32, i32* %pc, align 4
  %add.ptr14 = getelementptr inbounds i32, i32* %23, i32 %24
  %add.ptr15 = getelementptr inbounds i32, i32* %add.ptr14, i32 2
  store i32* %add.ptr15, i32** %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.end9
  %25 = load i32*, i32** %retval, align 4
  ret i32* %25
}

; Function Attrs: noinline nounwind
define internal i32 @rangecmp_wc(i32 %c1, i32 %c2, i32 %forcecoll) #0 {
entry:
  %retval = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %c2.addr = alloca i32, align 4
  %forcecoll.addr = alloca i32, align 4
  store i32 %c1, i32* %c1.addr, align 4
  store i32 %c2, i32* %c2.addr, align 4
  store i32 %forcecoll, i32* %forcecoll.addr, align 4
  %0 = load i32, i32* %c1.addr, align 4
  %1 = load i32, i32* %c2.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %forcecoll.addr, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* @glob_asciirange, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true2, label %if.end7

land.lhs.true2:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* %c1.addr, align 4
  %cmp3 = icmp ule i32 %4, 255
  br i1 %cmp3, label %land.lhs.true4, label %if.end7

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %5 = load i32, i32* %c2.addr, align 4
  %cmp5 = icmp ule i32 %5, 255
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true4
  %6 = load i32, i32* %c1.addr, align 4
  %7 = load i32, i32* %c2.addr, align 4
  %sub = sub i32 %6, %7
  store i32 %sub, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %if.end
  %8 = load i32, i32* %c1.addr, align 4
  store i32 %8, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @rangecmp_wc.s1, i32 0, i32 0), align 4
  %9 = load i32, i32* %c2.addr, align 4
  store i32 %9, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @rangecmp_wc.s2, i32 0, i32 0), align 4
  %call = call i32 @wcscoll(i32* getelementptr inbounds ([2 x i32], [2 x i32]* @rangecmp_wc.s1, i32 0, i32 0), i32* getelementptr inbounds ([2 x i32], [2 x i32]* @rangecmp_wc.s2, i32 0, i32 0))
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then6, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare i32 @wctype(i8*) #1

declare i32 @wcscmp(i32*, i32*) #1

declare i32 @wctob(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #3

declare i32 @wcsrtombs(i8*, i32**, i32, %struct.__mbstate_t*) #1

declare i32 @iswctype(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @collwcsym(i32* %s, i32 %len) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i32*, align 4
  %len.addr = alloca i32, align 4
  %csp = alloca %struct._collwcsym*, align 4
  store i32* %s, i32** %s.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store %struct._collwcsym* getelementptr inbounds ([96 x %struct._collwcsym], [96 x %struct._collwcsym]* @posix_collwcsyms, i32 0, i32 0), %struct._collwcsym** %csp, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct._collwcsym*, %struct._collwcsym** %csp, align 4
  %name = getelementptr inbounds %struct._collwcsym, %struct._collwcsym* %0, i32 0, i32 0
  %1 = load i32*, i32** %name, align 4
  %tobool = icmp ne i32* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._collwcsym*, %struct._collwcsym** %csp, align 4
  %name1 = getelementptr inbounds %struct._collwcsym, %struct._collwcsym* %2, i32 0, i32 0
  %3 = load i32*, i32** %name1, align 4
  %arrayidx = getelementptr inbounds i32, i32* %3, i32 0
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32*, i32** %s.addr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i32 0
  %6 = load i32, i32* %arrayidx2, align 4
  %cmp = icmp eq i32 %4, %6
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load %struct._collwcsym*, %struct._collwcsym** %csp, align 4
  %name3 = getelementptr inbounds %struct._collwcsym, %struct._collwcsym* %7, i32 0, i32 0
  %8 = load i32*, i32** %name3, align 4
  %9 = load i32*, i32** %s.addr, align 4
  %10 = load i32, i32* %len.addr, align 4
  %call = call i32 @wcsncmp(i32* %8, i32* %9, i32 %10)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %land.lhs.true5, label %if.end

land.lhs.true5:                                   ; preds = %land.lhs.true
  %11 = load %struct._collwcsym*, %struct._collwcsym** %csp, align 4
  %name6 = getelementptr inbounds %struct._collwcsym, %struct._collwcsym* %11, i32 0, i32 0
  %12 = load i32*, i32** %name6, align 4
  %13 = load i32, i32* %len.addr, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i32 %13
  %14 = load i32, i32* %arrayidx7, align 4
  %cmp8 = icmp eq i32 %14, 0
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true5
  %15 = load %struct._collwcsym*, %struct._collwcsym** %csp, align 4
  %code = getelementptr inbounds %struct._collwcsym, %struct._collwcsym* %15, i32 0, i32 1
  %16 = load i32, i32* %code, align 4
  store i32 %16, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true5, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load %struct._collwcsym*, %struct._collwcsym** %csp, align 4
  %incdec.ptr = getelementptr inbounds %struct._collwcsym, %struct._collwcsym* %17, i32 1
  store %struct._collwcsym* %incdec.ptr, %struct._collwcsym** %csp, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %len.addr, align 4
  %cmp9 = icmp eq i32 %18, 1
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %for.end
  %19 = load i32*, i32** %s.addr, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %19, i32 0
  %20 = load i32, i32* %arrayidx11, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %for.end
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end12, %if.then10, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare i32 @wcsncmp(i32*, i32*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
