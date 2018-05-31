; ModuleID = 'mapfile.c'
source_filename = "mapfile.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }

@delim = internal global i32 0, align 4
@.str = private unnamed_addr constant [16 x i8] c"d:u:n:O:tC:c:s:\00", align 1
@list_optarg = external global i8*, align 4
@.str.1 = private unnamed_addr constant [42 x i8] c"%s: invalid file descriptor specification\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"%d: invalid file descriptor: %s\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"%s: invalid line count\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"%s: invalid array origin\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"%s: invalid callback quantum\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.6 = private unnamed_addr constant [8 x i8] c"MAPFILE\00", align 1
@.str.7 = private unnamed_addr constant [38 x i8] c"internal error: getting variable name\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"empty array variable name\00", align 1
@.str.9 = private unnamed_addr constant [25 x i8] c"%s: not an indexed array\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"./mapfile.def\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"%s %d %s\00", align 1

; Function Attrs: noinline nounwind
define i32 @mapfile_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %opt = alloca i32, align 4
  %code = alloca i32, align 4
  %fd = alloca i32, align 4
  %clear_array = alloca i32, align 4
  %flags = alloca i32, align 4
  %intval = alloca i64, align 8
  %lines = alloca i32, align 4
  %origin = alloca i32, align 4
  %nskip = alloca i32, align 4
  %callback_quantum = alloca i32, align 4
  %array_name = alloca i8*, align 4
  %callback = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 1, i32* %clear_array, align 4
  store i32 0, i32* %fd, align 4
  store i32 0, i32* %nskip, align 4
  store i32 0, i32* %origin, align 4
  store i32 0, i32* %lines, align 4
  store i32 1, i32* %flags, align 4
  store i32 5000, i32* %callback_quantum, align 4
  store i8* null, i8** %callback, align 4
  store i32 10, i32* @delim, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 100, label %sw.bb
    i32 117, label %sw.bb1
    i32 110, label %sw.bb22
    i32 79, label %sw.bb39
    i32 116, label %sw.bb56
    i32 67, label %sw.bb57
    i32 99, label %sw.bb58
    i32 115, label %sw.bb75
    i32 -99, label %sw.bb92
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i8*, i8** @list_optarg, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  store i32 %conv, i32* @delim, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  %4 = load i8*, i8** @list_optarg, align 4
  %call2 = call i32 @legal_number(i8* %4, i64* %intval)
  store i32 %call2, i32* %code, align 4
  %5 = load i32, i32* %code, align 4
  %cmp3 = icmp eq i32 %5, 0
  br i1 %cmp3, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb1
  %6 = load i64, i64* %intval, align 8
  %cmp5 = icmp slt i64 %6, 0
  br i1 %cmp5, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false
  %7 = load i64, i64* %intval, align 8
  %8 = load i64, i64* %intval, align 8
  %conv8 = trunc i64 %8 to i32
  %conv9 = sext i32 %conv8 to i64
  %cmp10 = icmp ne i64 %7, %conv9
  br i1 %cmp10, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false, %sw.bb1
  %call12 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i32 0, i32 0))
  %9 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call12, i8* %9)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false7
  %10 = load i64, i64* %intval, align 8
  %conv13 = trunc i64 %10 to i32
  store i32 %conv13, i32* %fd, align 4
  br label %if.end

if.end:                                           ; preds = %if.else
  %11 = load i32, i32* %fd, align 4
  %call14 = call i32 @sh_validfd(i32 %11)
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %if.then17, label %if.end21

if.then17:                                        ; preds = %if.end
  %call18 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0))
  %12 = load i32, i32* %fd, align 4
  %call19 = call i32* @__errno_location()
  %13 = load i32, i32* %call19, align 4
  %call20 = call i8* @strerror(i32 %13)
  call void (i8*, ...) @builtin_error(i8* %call18, i32 %12, i8* %call20)
  store i32 1, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end
  br label %sw.epilog

sw.bb22:                                          ; preds = %while.body
  %14 = load i8*, i8** @list_optarg, align 4
  %call23 = call i32 @legal_number(i8* %14, i64* %intval)
  store i32 %call23, i32* %code, align 4
  %15 = load i32, i32* %code, align 4
  %cmp24 = icmp eq i32 %15, 0
  br i1 %cmp24, label %if.then34, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %sw.bb22
  %16 = load i64, i64* %intval, align 8
  %cmp27 = icmp slt i64 %16, 0
  br i1 %cmp27, label %if.then34, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false26
  %17 = load i64, i64* %intval, align 8
  %18 = load i64, i64* %intval, align 8
  %conv30 = trunc i64 %18 to i32
  %conv31 = zext i32 %conv30 to i64
  %cmp32 = icmp ne i64 %17, %conv31
  br i1 %cmp32, label %if.then34, label %if.else36

if.then34:                                        ; preds = %lor.lhs.false29, %lor.lhs.false26, %sw.bb22
  %call35 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  %19 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call35, i8* %19)
  store i32 1, i32* %retval, align 4
  br label %return

if.else36:                                        ; preds = %lor.lhs.false29
  %20 = load i64, i64* %intval, align 8
  %conv37 = trunc i64 %20 to i32
  store i32 %conv37, i32* %lines, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.else36
  br label %sw.epilog

sw.bb39:                                          ; preds = %while.body
  %21 = load i8*, i8** @list_optarg, align 4
  %call40 = call i32 @legal_number(i8* %21, i64* %intval)
  store i32 %call40, i32* %code, align 4
  %22 = load i32, i32* %code, align 4
  %cmp41 = icmp eq i32 %22, 0
  br i1 %cmp41, label %if.then51, label %lor.lhs.false43

lor.lhs.false43:                                  ; preds = %sw.bb39
  %23 = load i64, i64* %intval, align 8
  %cmp44 = icmp slt i64 %23, 0
  br i1 %cmp44, label %if.then51, label %lor.lhs.false46

lor.lhs.false46:                                  ; preds = %lor.lhs.false43
  %24 = load i64, i64* %intval, align 8
  %25 = load i64, i64* %intval, align 8
  %conv47 = trunc i64 %25 to i32
  %conv48 = zext i32 %conv47 to i64
  %cmp49 = icmp ne i64 %24, %conv48
  br i1 %cmp49, label %if.then51, label %if.else53

if.then51:                                        ; preds = %lor.lhs.false46, %lor.lhs.false43, %sw.bb39
  %call52 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0))
  %26 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call52, i8* %26)
  store i32 1, i32* %retval, align 4
  br label %return

if.else53:                                        ; preds = %lor.lhs.false46
  %27 = load i64, i64* %intval, align 8
  %conv54 = trunc i64 %27 to i32
  store i32 %conv54, i32* %origin, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.else53
  %28 = load i32, i32* %flags, align 4
  %and = and i32 %28, -2
  store i32 %and, i32* %flags, align 4
  br label %sw.epilog

sw.bb56:                                          ; preds = %while.body
  %29 = load i32, i32* %flags, align 4
  %or = or i32 %29, 2
  store i32 %or, i32* %flags, align 4
  br label %sw.epilog

sw.bb57:                                          ; preds = %while.body
  %30 = load i8*, i8** @list_optarg, align 4
  store i8* %30, i8** %callback, align 4
  br label %sw.epilog

sw.bb58:                                          ; preds = %while.body
  %31 = load i8*, i8** @list_optarg, align 4
  %call59 = call i32 @legal_number(i8* %31, i64* %intval)
  store i32 %call59, i32* %code, align 4
  %32 = load i32, i32* %code, align 4
  %cmp60 = icmp eq i32 %32, 0
  br i1 %cmp60, label %if.then70, label %lor.lhs.false62

lor.lhs.false62:                                  ; preds = %sw.bb58
  %33 = load i64, i64* %intval, align 8
  %cmp63 = icmp sle i64 %33, 0
  br i1 %cmp63, label %if.then70, label %lor.lhs.false65

lor.lhs.false65:                                  ; preds = %lor.lhs.false62
  %34 = load i64, i64* %intval, align 8
  %35 = load i64, i64* %intval, align 8
  %conv66 = trunc i64 %35 to i32
  %conv67 = zext i32 %conv66 to i64
  %cmp68 = icmp ne i64 %34, %conv67
  br i1 %cmp68, label %if.then70, label %if.else72

if.then70:                                        ; preds = %lor.lhs.false65, %lor.lhs.false62, %sw.bb58
  %call71 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  %36 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call71, i8* %36)
  store i32 1, i32* %retval, align 4
  br label %return

if.else72:                                        ; preds = %lor.lhs.false65
  %37 = load i64, i64* %intval, align 8
  %conv73 = trunc i64 %37 to i32
  store i32 %conv73, i32* %callback_quantum, align 4
  br label %if.end74

if.end74:                                         ; preds = %if.else72
  br label %sw.epilog

sw.bb75:                                          ; preds = %while.body
  %38 = load i8*, i8** @list_optarg, align 4
  %call76 = call i32 @legal_number(i8* %38, i64* %intval)
  store i32 %call76, i32* %code, align 4
  %39 = load i32, i32* %code, align 4
  %cmp77 = icmp eq i32 %39, 0
  br i1 %cmp77, label %if.then87, label %lor.lhs.false79

lor.lhs.false79:                                  ; preds = %sw.bb75
  %40 = load i64, i64* %intval, align 8
  %cmp80 = icmp slt i64 %40, 0
  br i1 %cmp80, label %if.then87, label %lor.lhs.false82

lor.lhs.false82:                                  ; preds = %lor.lhs.false79
  %41 = load i64, i64* %intval, align 8
  %42 = load i64, i64* %intval, align 8
  %conv83 = trunc i64 %42 to i32
  %conv84 = zext i32 %conv83 to i64
  %cmp85 = icmp ne i64 %41, %conv84
  br i1 %cmp85, label %if.then87, label %if.else89

if.then87:                                        ; preds = %lor.lhs.false82, %lor.lhs.false79, %sw.bb75
  %call88 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  %43 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call88, i8* %43)
  store i32 1, i32* %retval, align 4
  br label %return

if.else89:                                        ; preds = %lor.lhs.false82
  %44 = load i64, i64* %intval, align 8
  %conv90 = trunc i64 %44 to i32
  store i32 %conv90, i32* %nskip, align 4
  br label %if.end91

if.end91:                                         ; preds = %if.else89
  br label %sw.epilog

sw.bb92:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end91, %if.end74, %sw.bb57, %sw.bb56, %if.end55, %if.end38, %if.end21, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %45 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %45, %struct.word_list** %list.addr, align 4
  %46 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp93 = icmp eq %struct.word_list* %46, null
  br i1 %cmp93, label %if.then95, label %if.else96

if.then95:                                        ; preds = %while.end
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i8** %array_name, align 4
  br label %if.end118

if.else96:                                        ; preds = %while.end
  %47 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %47, i32 0, i32 1
  %48 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %cmp97 = icmp eq %struct.word_desc* %48, null
  br i1 %cmp97, label %if.then104, label %lor.lhs.false99

lor.lhs.false99:                                  ; preds = %if.else96
  %49 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word100 = getelementptr inbounds %struct.word_list, %struct.word_list* %49, i32 0, i32 1
  %50 = load %struct.word_desc*, %struct.word_desc** %word100, align 4
  %word101 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %50, i32 0, i32 0
  %51 = load i8*, i8** %word101, align 4
  %cmp102 = icmp eq i8* %51, null
  br i1 %cmp102, label %if.then104, label %if.else105

if.then104:                                       ; preds = %lor.lhs.false99, %if.else96
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7, i32 0, i32 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.else105:                                       ; preds = %lor.lhs.false99
  %52 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word106 = getelementptr inbounds %struct.word_list, %struct.word_list* %52, i32 0, i32 1
  %53 = load %struct.word_desc*, %struct.word_desc** %word106, align 4
  %word107 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %53, i32 0, i32 0
  %54 = load i8*, i8** %word107, align 4
  %arrayidx = getelementptr inbounds i8, i8* %54, i32 0
  %55 = load i8, i8* %arrayidx, align 1
  %conv108 = sext i8 %55 to i32
  %cmp109 = icmp eq i32 %conv108, 0
  br i1 %cmp109, label %if.then111, label %if.else113

if.then111:                                       ; preds = %if.else105
  %call112 = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.8, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call112)
  store i32 258, i32* %retval, align 4
  br label %return

if.else113:                                       ; preds = %if.else105
  %56 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word114 = getelementptr inbounds %struct.word_list, %struct.word_list* %56, i32 0, i32 1
  %57 = load %struct.word_desc*, %struct.word_desc** %word114, align 4
  %word115 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %57, i32 0, i32 0
  %58 = load i8*, i8** %word115, align 4
  store i8* %58, i8** %array_name, align 4
  br label %if.end116

if.end116:                                        ; preds = %if.else113
  br label %if.end117

if.end117:                                        ; preds = %if.end116
  br label %if.end118

if.end118:                                        ; preds = %if.end117, %if.then95
  %59 = load i8*, i8** %array_name, align 4
  %call119 = call i32 @legal_identifier(i8* %59)
  %cmp120 = icmp eq i32 %call119, 0
  br i1 %cmp120, label %if.then122, label %if.end123

if.then122:                                       ; preds = %if.end118
  %60 = load i8*, i8** %array_name, align 4
  call void @sh_invalidid(i8* %60)
  store i32 1, i32* %retval, align 4
  br label %return

if.end123:                                        ; preds = %if.end118
  %61 = load i32, i32* %fd, align 4
  %62 = load i32, i32* %lines, align 4
  %63 = load i32, i32* %origin, align 4
  %64 = load i32, i32* %nskip, align 4
  %65 = load i32, i32* %callback_quantum, align 4
  %66 = load i8*, i8** %callback, align 4
  %67 = load i8*, i8** %array_name, align 4
  %68 = load i32, i32* @delim, align 4
  %69 = load i32, i32* %flags, align 4
  %call124 = call i32 @mapfile(i32 %61, i32 %62, i32 %63, i32 %64, i32 %65, i8* %66, i8* %67, i32 %68, i32 %69)
  store i32 %call124, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end123, %if.then122, %if.then111, %if.then104, %sw.default, %sw.bb92, %if.then87, %if.then70, %if.then51, %if.then34, %if.then17, %if.then
  %70 = load i32, i32* %retval, align 4
  ret i32 %70
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @sh_validfd(i32) #1

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i32 @legal_identifier(i8*) #1

declare void @sh_invalidid(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @mapfile(i32 %fd, i32 %line_count_goal, i32 %origin, i32 %nskip, i32 %callback_quantum, i8* %callback, i8* %array_name, i32 %delim, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %line_count_goal.addr = alloca i32, align 4
  %origin.addr = alloca i32, align 4
  %nskip.addr = alloca i32, align 4
  %callback_quantum.addr = alloca i32, align 4
  %callback.addr = alloca i8*, align 4
  %array_name.addr = alloca i8*, align 4
  %delim.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %line = alloca i8*, align 4
  %line_length = alloca i32, align 4
  %array_index = alloca i32, align 4
  %line_count = alloca i32, align 4
  %entry1 = alloca %struct.variable*, align 4
  %unbuffered_read = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %line_count_goal, i32* %line_count_goal.addr, align 4
  store i32 %origin, i32* %origin.addr, align 4
  store i32 %nskip, i32* %nskip.addr, align 4
  store i32 %callback_quantum, i32* %callback_quantum.addr, align 4
  store i8* %callback, i8** %callback.addr, align 4
  store i8* %array_name, i8** %array_name.addr, align 4
  store i32 %delim, i32* %delim.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i8* null, i8** %line, align 4
  store i32 0, i32* %line_length, align 4
  store i32 0, i32* %unbuffered_read, align 4
  %0 = load i8*, i8** %array_name.addr, align 4
  %call = call %struct.variable* @find_or_make_array_variable(i8* %0, i32 1)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %1 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %5, 16384
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %6 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool6 = icmp ne %struct.variable* %6, null
  br i1 %tobool6, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %7 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %8, 2
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %if.then10, label %if.end

if.then10:                                        ; preds = %land.lhs.true
  %9 = load i8*, i8** %array_name.addr, align 4
  call void @err_readonly(i8* %9)
  br label %if.end

if.end:                                           ; preds = %if.then10, %land.lhs.true, %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false2
  %10 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes11 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes11, align 4
  %and12 = and i32 %11, 4
  %cmp13 = icmp eq i32 %and12, 0
  br i1 %cmp13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.else
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.9, i32 0, i32 0))
  %12 = load i8*, i8** %array_name.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call15, i8* %12)
  store i32 1, i32* %retval, align 4
  br label %return

if.else16:                                        ; preds = %if.else
  %13 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes17 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes17, align 4
  %and18 = and i32 %14, 4096
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.else16
  %15 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes21 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes21, align 4
  %and22 = and i32 %16, -4097
  store i32 %and22, i32* %attributes21, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.else16
  br label %if.end24

if.end24:                                         ; preds = %if.end23
  br label %if.end25

if.end25:                                         ; preds = %if.end24
  %17 = load i32, i32* %flags.addr, align 4
  %and26 = and i32 %17, 1
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end25
  %18 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 1
  %19 = load i8*, i8** %value, align 4
  %20 = bitcast i8* %19 to %struct.array*
  call void @array_flush(%struct.array* %20)
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end25
  %21 = load i32, i32* %fd.addr, align 4
  %call30 = call i32 @lseek(i32 %21, i32 0, i32 1)
  %cmp31 = icmp slt i32 %call30, 0
  br i1 %cmp31, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end29
  %call32 = call i32* @__errno_location()
  %22 = load i32, i32* %call32, align 4
  %cmp33 = icmp eq i32 %22, 29
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end29
  %23 = phi i1 [ false, %if.end29 ], [ %cmp33, %land.rhs ]
  %land.ext = zext i1 %23 to i32
  store i32 %land.ext, i32* %unbuffered_read, align 4
  %24 = load i32, i32* %delim.addr, align 4
  %cmp34 = icmp ne i32 %24, 10
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %land.end
  store i32 1, i32* %unbuffered_read, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %land.end
  call void @zreset()
  store i32 0, i32* %line_count, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end36
  %25 = load i32, i32* %line_count, align 4
  %26 = load i32, i32* %nskip.addr, align 4
  %cmp37 = icmp ult i32 %25, %26
  br i1 %cmp37, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %27 = load i32, i32* %fd.addr, align 4
  %28 = load i32, i32* %delim.addr, align 4
  %29 = load i32, i32* %unbuffered_read, align 4
  %call38 = call i32 @zgetline(i32 %27, i8** %line, i32* %line_length, i32 %28, i32 %29)
  %cmp39 = icmp slt i32 %call38, 0
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %for.body
  br label %for.end

if.end41:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end41
  %30 = load i32, i32* %line_count, align 4
  %inc = add i32 %30, 1
  store i32 %inc, i32* %line_count, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then40, %for.cond
  store i8* null, i8** %line, align 4
  store i32 0, i32* %line_length, align 4
  %31 = load i32, i32* %origin.addr, align 4
  store i32 %31, i32* %array_index, align 4
  store i32 1, i32* %line_count, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc70, %for.end
  %32 = load i32, i32* %fd.addr, align 4
  %33 = load i32, i32* %delim.addr, align 4
  %34 = load i32, i32* %unbuffered_read, align 4
  %call43 = call i32 @zgetline(i32 %32, i8** %line, i32* %line_length, i32 %33, i32 %34)
  %cmp44 = icmp ne i32 %call43, -1
  br i1 %cmp44, label %for.body45, label %for.end72

for.body45:                                       ; preds = %for.cond42
  %35 = load i32, i32* %flags.addr, align 4
  %and46 = and i32 %35, 2
  %tobool47 = icmp ne i32 %and46, 0
  br i1 %tobool47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %for.body45
  %36 = load i8*, i8** %line, align 4
  %37 = load i32, i32* %delim.addr, align 4
  call void @do_chop(i8* %36, i32 %37)
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %for.body45
  %38 = load i8*, i8** %callback.addr, align 4
  %tobool50 = icmp ne i8* %38, null
  br i1 %tobool50, label %land.lhs.true51, label %if.end60

land.lhs.true51:                                  ; preds = %if.end49
  %39 = load i32, i32* %line_count, align 4
  %tobool52 = icmp ne i32 %39, 0
  br i1 %tobool52, label %land.lhs.true53, label %if.end60

land.lhs.true53:                                  ; preds = %land.lhs.true51
  %40 = load i32, i32* %line_count, align 4
  %41 = load i32, i32* %callback_quantum.addr, align 4
  %rem = urem i32 %40, %41
  %cmp54 = icmp eq i32 %rem, 0
  br i1 %cmp54, label %if.then55, label %if.end60

if.then55:                                        ; preds = %land.lhs.true53
  %42 = load i8*, i8** %callback.addr, align 4
  %43 = load i32, i32* %array_index, align 4
  %44 = load i8*, i8** %line, align 4
  %call56 = call i32 @run_callback(i8* %42, i32 %43, i8* %44)
  %45 = load i32, i32* %unbuffered_read, align 4
  %cmp57 = icmp eq i32 %45, 0
  br i1 %cmp57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.then55
  %46 = load i32, i32* %fd.addr, align 4
  call void @zsyncfd(i32 %46)
  br label %if.end59

if.end59:                                         ; preds = %if.then58, %if.then55
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %land.lhs.true53, %land.lhs.true51, %if.end49
  %47 = load %struct.variable*, %struct.variable** %entry1, align 4
  %48 = load i32, i32* %array_index, align 4
  %conv = zext i32 %48 to i64
  %49 = load i8*, i8** %line, align 4
  %call61 = call %struct.variable* @bind_array_element(%struct.variable* %47, i64 %conv, i8* %49, i32 0)
  %50 = load i32, i32* %line_count, align 4
  %inc62 = add i32 %50, 1
  store i32 %inc62, i32* %line_count, align 4
  %51 = load i32, i32* %line_count_goal.addr, align 4
  %cmp63 = icmp ne i32 %51, 0
  br i1 %cmp63, label %land.lhs.true65, label %if.end69

land.lhs.true65:                                  ; preds = %if.end60
  %52 = load i32, i32* %line_count, align 4
  %53 = load i32, i32* %line_count_goal.addr, align 4
  %cmp66 = icmp ugt i32 %52, %53
  br i1 %cmp66, label %if.then68, label %if.end69

if.then68:                                        ; preds = %land.lhs.true65
  br label %for.end72

if.end69:                                         ; preds = %land.lhs.true65, %if.end60
  br label %for.inc70

for.inc70:                                        ; preds = %if.end69
  %54 = load i32, i32* %array_index, align 4
  %inc71 = add i32 %54, 1
  store i32 %inc71, i32* %array_index, align 4
  br label %for.cond42

for.end72:                                        ; preds = %if.then68, %for.cond42
  %55 = load i8*, i8** %line, align 4
  call void @sh_xfree(i8* %55, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0), i32 235)
  %56 = load i32, i32* %unbuffered_read, align 4
  %cmp73 = icmp eq i32 %56, 0
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %for.end72
  %57 = load i32, i32* %fd.addr, align 4
  call void @zsyncfd(i32 %57)
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %for.end72
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end76, %if.then14, %if.end
  %58 = load i32, i32* %retval, align 4
  ret i32 %58
}

declare %struct.variable* @find_or_make_array_variable(i8*, i32) #1

declare void @err_readonly(i8*) #1

declare void @array_flush(%struct.array*) #1

declare i32 @lseek(i32, i32, i32) #1

declare void @zreset() #1

declare i32 @zgetline(i32, i8**, i32*, i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @do_chop(i8* %line, i32) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %delim.addr = alloca i8, align 1
  %length = alloca i32, align 4
  %delim = trunc i32 %0 to i8
  store i8* %line, i8** %line.addr, align 4
  store i8 %delim, i8* %delim.addr, align 1
  %1 = load i8*, i8** %line.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %length, align 4
  %2 = load i32, i32* %length, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %line.addr, align 4
  %4 = load i32, i32* %length, align 4
  %sub = sub nsw i32 %4, 1
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %sub
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %6 = load i8, i8* %delim.addr, align 1
  %conv1 = zext i8 %6 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %7 = load i8*, i8** %line.addr, align 4
  %8 = load i32, i32* %length, align 4
  %sub3 = sub nsw i32 %8, 1
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i32 %sub3
  store i8 0, i8* %arrayidx4, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @run_callback(i8* %callback, i32 %curindex, i8* %curline) #0 {
entry:
  %callback.addr = alloca i8*, align 4
  %curindex.addr = alloca i32, align 4
  %curline.addr = alloca i8*, align 4
  %execlen = alloca i32, align 4
  %execstr = alloca i8*, align 4
  %qline = alloca i8*, align 4
  %flags = alloca i32, align 4
  store i8* %callback, i8** %callback.addr, align 4
  store i32 %curindex, i32* %curindex.addr, align 4
  store i8* %curline, i8** %curline.addr, align 4
  %0 = load i8*, i8** %curline.addr, align 4
  %call = call i8* @sh_single_quote(i8* %0)
  store i8* %call, i8** %qline, align 4
  %1 = load i8*, i8** %callback.addr, align 4
  %call1 = call i32 @strlen(i8* %1)
  %2 = load i8*, i8** %qline, align 4
  %call2 = call i32 @strlen(i8* %2)
  %add = add i32 %call1, %call2
  %add3 = add i32 %add, 10
  store i32 %add3, i32* %execlen, align 4
  %3 = load i32, i32* %execlen, align 4
  %add4 = add i32 %3, 3
  store i32 %add4, i32* %execlen, align 4
  %4 = load i32, i32* %execlen, align 4
  %call5 = call i8* @sh_xmalloc(i32 %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0), i32 123)
  store i8* %call5, i8** %execstr, align 4
  store i32 4, i32* %flags, align 4
  %5 = load i8*, i8** %execstr, align 4
  %6 = load i32, i32* %execlen, align 4
  %7 = load i8*, i8** %callback.addr, align 4
  %8 = load i32, i32* %curindex.addr, align 4
  %9 = load i8*, i8** %qline, align 4
  %call6 = call i32 (i8*, i32, i8*, ...) @snprintf(i8* %5, i32 %6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0), i8* %7, i32 %8, i8* %9)
  %10 = load i8*, i8** %qline, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i32 0, i32 0), i32 131)
  %11 = load i8*, i8** %execstr, align 4
  %12 = load i32, i32* %flags, align 4
  %call7 = call i32 @evalstring(i8* %11, i8* null, i32 %12)
  ret i32 %call7
}

declare void @zsyncfd(i32) #1

declare %struct.variable* @bind_array_element(%struct.variable*, i64, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @sh_single_quote(i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @snprintf(i8*, i32, i8*, ...) #1

declare i32 @evalstring(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
