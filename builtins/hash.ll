; ModuleID = 'hash.c'
source_filename = "hash.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._IO_FILE = type opaque
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct._pathdata = type { i8*, i32 }

@hashing_enabled = external global i32, align 4
@.str = private unnamed_addr constant [17 x i8] c"hashing disabled\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"dlp:rt\00", align 1
@list_optarg = external global i8*, align 4
@loptend = external global %struct.word_list*, align 4
@.str.2 = private unnamed_addr constant [3 x i8] c"-t\00", align 1
@posixly_correct = external global i32, align 4
@.str.3 = private unnamed_addr constant [22 x i8] c"%s: hash table empty\0A\00", align 1
@this_command_name = external global i8*, align 4
@restricted = external global i32, align 4
@.str.4 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4
@dot_found_in_search = external global i32, align 4
@.str.5 = private unnamed_addr constant [11 x i8] c"./hash.def\00", align 1
@hashed_filenames = external global %struct.hash_table*, align 4
@.str.6 = private unnamed_addr constant [14 x i8] c"hits\09command\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"builtin hash -p %s %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"%4d\09%s\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\09\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @hash_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %expunge_hash_table = alloca i32, align 4
  %list_targets = alloca i32, align 4
  %list_portably = alloca i32, align 4
  %delete = alloca i32, align 4
  %opt = alloca i32, align 4
  %w = alloca i8*, align 4
  %pathname = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @hashing_enabled, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %delete, align 4
  store i32 0, i32* %list_portably, align 4
  store i32 0, i32* %list_targets, align 4
  store i32 0, i32* %expunge_hash_table, align 4
  store i8* null, i8** %pathname, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call1 = call i32 @internal_getopt(%struct.word_list* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0))
  store i32 %call1, i32* %opt, align 4
  %cmp2 = icmp ne i32 %call1, -1
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %opt, align 4
  switch i32 %2, label %sw.default [
    i32 100, label %sw.bb
    i32 108, label %sw.bb3
    i32 112, label %sw.bb4
    i32 114, label %sw.bb5
    i32 116, label %sw.bb6
    i32 -99, label %sw.bb7
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %delete, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  store i32 1, i32* %list_portably, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %while.body
  %3 = load i8*, i8** @list_optarg, align 4
  store i8* %3, i8** %pathname, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  store i32 1, i32* %expunge_hash_table, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %while.body
  store i32 1, i32* %list_targets, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %4, %struct.word_list** %list.addr, align 4
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp8 = icmp eq %struct.word_list* %5, null
  br i1 %cmp8, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %while.end
  %6 = load i32, i32* %list_targets, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true
  call void @sh_needarg(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %land.lhs.true, %while.end
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp11 = icmp eq %struct.word_list* %7, null
  br i1 %cmp11, label %land.lhs.true12, label %if.end23

land.lhs.true12:                                  ; preds = %if.end10
  %8 = load i32, i32* %expunge_hash_table, align 4
  %cmp13 = icmp eq i32 %8, 0
  br i1 %cmp13, label %if.then14, label %if.end23

if.then14:                                        ; preds = %land.lhs.true12
  %9 = load i32, i32* %list_portably, align 4
  %call15 = call i32 @print_hashed_commands(i32 %9)
  store i32 %call15, i32* %opt, align 4
  %10 = load i32, i32* %opt, align 4
  %cmp16 = icmp eq i32 %10, 0
  br i1 %cmp16, label %land.lhs.true17, label %if.end22

land.lhs.true17:                                  ; preds = %if.then14
  %11 = load i32, i32* @posixly_correct, align 4
  %cmp18 = icmp eq i32 %11, 0
  br i1 %cmp18, label %if.then19, label %if.end22

if.then19:                                        ; preds = %land.lhs.true17
  %call20 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0))
  %12 = load i8*, i8** @this_command_name, align 4
  %call21 = call i32 (i8*, ...) @printf(i8* %call20, i8* %12)
  br label %if.end22

if.end22:                                         ; preds = %if.then19, %land.lhs.true17, %if.then14
  store i32 0, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %land.lhs.true12, %if.end10
  %13 = load i32, i32* %expunge_hash_table, align 4
  %tobool24 = icmp ne i32 %13, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  call void @phash_flush()
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  %14 = load i32, i32* %list_targets, align 4
  %tobool27 = icmp ne i32 %14, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end26
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %16 = load i32, i32* %list_portably, align 4
  %call29 = call i32 @list_hashed_filename_targets(%struct.word_list* %15, i32 %16)
  store i32 %call29, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %if.end26
  %17 = load i32, i32* @restricted, align 4
  %tobool31 = icmp ne i32 %17, 0
  br i1 %tobool31, label %land.lhs.true32, label %if.end38

land.lhs.true32:                                  ; preds = %if.end30
  %18 = load i8*, i8** %pathname, align 4
  %tobool33 = icmp ne i8* %18, null
  br i1 %tobool33, label %land.lhs.true34, label %if.end38

land.lhs.true34:                                  ; preds = %land.lhs.true32
  %19 = load i8*, i8** %pathname, align 4
  %call35 = call i8* @strchr(i8* %19, i32 47)
  %tobool36 = icmp ne i8* %call35, null
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %land.lhs.true34
  %20 = load i8*, i8** %pathname, align 4
  call void @sh_restricted(i8* %20)
  store i32 1, i32* %retval, align 4
  br label %return

if.end38:                                         ; preds = %land.lhs.true34, %land.lhs.true32, %if.end30
  store i32 0, i32* %opt, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end38
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool39 = icmp ne %struct.word_list* %21, null
  br i1 %tobool39, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %22, i32 0, i32 1
  %23 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word40 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %23, i32 0, i32 0
  %24 = load i8*, i8** %word40, align 4
  store i8* %24, i8** %w, align 4
  %25 = load i8*, i8** %w, align 4
  %call41 = call i32 @absolute_program(i8* %25)
  %tobool42 = icmp ne i32 %call41, 0
  br i1 %tobool42, label %if.then43, label %if.else

if.then43:                                        ; preds = %for.body
  br label %for.inc

if.else:                                          ; preds = %for.body
  %26 = load i8*, i8** %pathname, align 4
  %tobool44 = icmp ne i8* %26, null
  br i1 %tobool44, label %if.then45, label %if.else52

if.then45:                                        ; preds = %if.else
  %27 = load i8*, i8** %pathname, align 4
  %call46 = call i32 @is_directory(i8* %27)
  %tobool47 = icmp ne i32 %call46, 0
  br i1 %tobool47, label %if.then48, label %if.else50

if.then48:                                        ; preds = %if.then45
  %28 = load i8*, i8** %pathname, align 4
  %call49 = call i8* @strerror(i32 21)
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* %28, i8* %call49)
  store i32 1, i32* %opt, align 4
  br label %if.end51

if.else50:                                        ; preds = %if.then45
  %29 = load i8*, i8** %w, align 4
  %30 = load i8*, i8** %pathname, align 4
  call void @phash_insert(i8* %29, i8* %30, i32 0, i32 0)
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %if.then48
  br label %if.end65

if.else52:                                        ; preds = %if.else
  %31 = load i32, i32* %delete, align 4
  %tobool53 = icmp ne i32 %31, 0
  br i1 %tobool53, label %if.then54, label %if.else59

if.then54:                                        ; preds = %if.else52
  %32 = load i8*, i8** %w, align 4
  %call55 = call i32 @phash_remove(i8* %32)
  %tobool56 = icmp ne i32 %call55, 0
  br i1 %tobool56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.then54
  %33 = load i8*, i8** %w, align 4
  call void @sh_notfound(i8* %33)
  store i32 1, i32* %opt, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %if.then54
  br label %if.end64

if.else59:                                        ; preds = %if.else52
  %34 = load i8*, i8** %w, align 4
  %call60 = call i32 @add_hashed_command(i8* %34, i32 0)
  %tobool61 = icmp ne i32 %call60, 0
  br i1 %tobool61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.else59
  store i32 1, i32* %opt, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %if.else59
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.end58
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.end51
  br label %if.end66

if.end66:                                         ; preds = %if.end65
  br label %for.inc

for.inc:                                          ; preds = %if.end66, %if.then43
  %35 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %35, i32 0, i32 0
  %36 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %36, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call67 = call i32 @fflush(%struct._IO_FILE* %37)
  %38 = load i32, i32* %opt, align 4
  store i32 %38, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then37, %if.then28, %if.end22, %if.then9, %sw.default, %sw.bb7, %if.then
  %39 = load i32, i32* %retval, align 4
  ret i32 %39
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare void @sh_needarg(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @print_hashed_commands(i32 %fmt) #0 {
entry:
  %retval = alloca i32, align 4
  %fmt.addr = alloca i32, align 4
  store i32 %fmt, i32* %fmt.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %4 = load i32, i32* %fmt.addr, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i32 0, i32 0))
  %call4 = call i32 (i8*, ...) @printf(i8* %call)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %5 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %6 = load i32, i32* %fmt.addr, align 4
  %tobool6 = icmp ne i32 %6, 0
  %cond7 = select i1 %tobool6, i32 (...)* bitcast (i32 (%struct.bucket_contents*)* @print_portable_hash_info to i32 (...)*), i32 (...)* bitcast (i32 (%struct.bucket_contents*)* @print_hash_info to i32 (...)*)
  %7 = bitcast i32 (...)* %cond7 to i32 (%struct.bucket_contents*)*
  call void @hash_walk(%struct.hash_table* %5, i32 (%struct.bucket_contents*)* %7)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @printf(i8*, ...) #1

declare void @phash_flush() #1

; Function Attrs: noinline nounwind
define internal i32 @list_hashed_filename_targets(%struct.word_list* %list, i32 %fmt) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %fmt.addr = alloca i32, align 4
  %all_found = alloca i32, align 4
  %multiple = alloca i32, align 4
  %target = alloca i8*, align 4
  %l = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %fmt, i32* %fmt.addr, align 4
  store i32 1, i32* %all_found, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %0, i32 0, i32 0
  %1 = load %struct.word_list*, %struct.word_list** %next, align 4
  %cmp = icmp ne %struct.word_list* %1, null
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %multiple, align 4
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %2, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word1, align 4
  %call = call i8* @phash_search(i8* %6)
  store i8* %call, i8** %target, align 4
  %7 = load i8*, i8** %target, align 4
  %cmp2 = icmp eq i8* %7, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 0, i32* %all_found, align 4
  %8 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word5, align 4
  call void @sh_notfound(i8* %10)
  br label %for.inc

if.end:                                           ; preds = %for.body
  %11 = load i32, i32* %fmt.addr, align 4
  %tobool6 = icmp ne i32 %11, 0
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end
  %12 = load i8*, i8** %target, align 4
  %13 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 1
  %14 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %14, i32 0, i32 0
  %15 = load i8*, i8** %word9, align 4
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i8* %12, i8* %15)
  br label %if.end18

if.else:                                          ; preds = %if.end
  %16 = load i32, i32* %multiple, align 4
  %tobool11 = icmp ne i32 %16, 0
  br i1 %tobool11, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.else
  %17 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %17, i32 0, i32 1
  %18 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %18, i32 0, i32 0
  %19 = load i8*, i8** %word14, align 4
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* %19)
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.else
  %20 = load i8*, i8** %target, align 4
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* %20)
  br label %if.end18

if.end18:                                         ; preds = %if.end16, %if.then7
  %21 = load i8*, i8** %target, align 4
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 288)
  br label %for.inc

for.inc:                                          ; preds = %if.end18, %if.then
  %22 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next19 = getelementptr inbounds %struct.word_list, %struct.word_list* %22, i32 0, i32 0
  %23 = load %struct.word_list*, %struct.word_list** %next19, align 4
  store %struct.word_list* %23, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %24 = load i32, i32* %all_found, align 4
  %tobool20 = icmp ne i32 %24, 0
  %cond = select i1 %tobool20, i32 0, i32 1
  ret i32 %cond
}

declare i8* @strchr(i8*, i32) #1

declare void @sh_restricted(i8*) #1

declare i32 @absolute_program(i8*) #1

declare i32 @is_directory(i8*) #1

declare i8* @strerror(i32) #1

declare void @phash_insert(i8*, i8*, i32, i32) #1

declare i32 @phash_remove(i8*) #1

declare void @sh_notfound(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @add_hashed_command(i8* %w, i32 %quiet) #0 {
entry:
  %w.addr = alloca i8*, align 4
  %quiet.addr = alloca i32, align 4
  %rv = alloca i32, align 4
  %full_path = alloca i8*, align 4
  store i8* %w, i8** %w.addr, align 4
  store i32 %quiet, i32* %quiet.addr, align 4
  store i32 0, i32* %rv, align 4
  %0 = load i8*, i8** %w.addr, align 4
  %call = call %struct.variable* @find_function(i8* %0)
  %cmp = icmp eq %struct.variable* %call, null
  br i1 %cmp, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %w.addr, align 4
  %call1 = call i32 (%struct.word_list*)* @find_shell_builtin(i8* %1)
  %cmp2 = icmp eq i32 (%struct.word_list*)* %call1, null
  br i1 %cmp2, label %if.then, label %if.end15

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** %w.addr, align 4
  %call3 = call i32 @phash_remove(i8* %2)
  %3 = load i8*, i8** %w.addr, align 4
  %call4 = call i8* @find_user_command(i8* %3)
  store i8* %call4, i8** %full_path, align 4
  %4 = load i8*, i8** %full_path, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.lhs.true5, label %if.else

land.lhs.true5:                                   ; preds = %if.then
  %5 = load i8*, i8** %full_path, align 4
  %call6 = call i32 @executable_file(i8* %5)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.else

if.then8:                                         ; preds = %land.lhs.true5
  %6 = load i8*, i8** %w.addr, align 4
  %7 = load i8*, i8** %full_path, align 4
  %8 = load i32, i32* @dot_found_in_search, align 4
  call void @phash_insert(i8* %6, i8* %7, i32 %8, i32 0)
  br label %if.end11

if.else:                                          ; preds = %land.lhs.true5, %if.then
  %9 = load i32, i32* %quiet.addr, align 4
  %cmp9 = icmp eq i32 %9, 0
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.else
  %10 = load i8*, i8** %w.addr, align 4
  call void @sh_notfound(i8* %10)
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.else
  %11 = load i32, i32* %rv, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %rv, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then8
  br label %do.body

do.body:                                          ; preds = %if.end11
  %12 = load i8*, i8** %full_path, align 4
  %tobool12 = icmp ne i8* %12, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %do.body
  %13 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 216)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end14
  br label %if.end15

if.end15:                                         ; preds = %do.end, %land.lhs.true, %entry
  %14 = load i32, i32* %rv, align 4
  ret i32 %14
}

declare i32 @fflush(%struct._IO_FILE*) #1

declare %struct.variable* @find_function(i8*) #1

declare i32 (%struct.word_list*)* @find_shell_builtin(i8*) #1

declare i8* @find_user_command(i8*) #1

declare i32 @executable_file(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare void @hash_walk(%struct.hash_table*, i32 (%struct.bucket_contents*)*) #1

; Function Attrs: noinline nounwind
define internal i32 @print_portable_hash_info(%struct.bucket_contents* %item) #0 {
entry:
  %item.addr = alloca %struct.bucket_contents*, align 4
  %fp = alloca i8*, align 4
  %fn = alloca i8*, align 4
  store %struct.bucket_contents* %item, %struct.bucket_contents** %item.addr, align 4
  %0 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %0, i32 0, i32 2
  %1 = load i8*, i8** %data, align 4
  %2 = bitcast i8* %1 to %struct._pathdata*
  %path = getelementptr inbounds %struct._pathdata, %struct._pathdata* %2, i32 0, i32 0
  %3 = load i8*, i8** %path, align 4
  %call = call i8* @printable_filename(i8* %3, i32 1)
  store i8* %call, i8** %fp, align 4
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 1
  %5 = load i8*, i8** %key, align 4
  %call1 = call i8* @printable_filename(i8* %5, i32 1)
  store i8* %call1, i8** %fn, align 4
  %6 = load i8*, i8** %fp, align 4
  %7 = load i8*, i8** %fn, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i8* %6, i8* %7)
  %8 = load i8*, i8** %fp, align 4
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %data3 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %9, i32 0, i32 2
  %10 = load i8*, i8** %data3, align 4
  %11 = bitcast i8* %10 to %struct._pathdata*
  %path4 = getelementptr inbounds %struct._pathdata, %struct._pathdata* %11, i32 0, i32 0
  %12 = load i8*, i8** %path4, align 4
  %cmp = icmp ne i8* %8, %12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %13 = load i8*, i8** %fp, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 240)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i8*, i8** %fn, align 4
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %key5 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 1
  %16 = load i8*, i8** %key5, align 4
  %cmp6 = icmp ne i8* %14, %16
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  %17 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 242)
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @print_hash_info(%struct.bucket_contents* %item) #0 {
entry:
  %item.addr = alloca %struct.bucket_contents*, align 4
  store %struct.bucket_contents* %item, %struct.bucket_contents** %item.addr, align 4
  %0 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %times_found = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %0, i32 0, i32 4
  %1 = load i32, i32* %times_found, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %item.addr, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %2, i32 0, i32 2
  %3 = load i8*, i8** %data, align 4
  %4 = bitcast i8* %3 to %struct._pathdata*
  %path = getelementptr inbounds %struct._pathdata, %struct._pathdata* %4, i32 0, i32 0
  %5 = load i8*, i8** %path, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i32 %1, i8* %5)
  ret i32 0
}

declare i8* @printable_filename(i8*, i32) #1

declare i8* @phash_search(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
