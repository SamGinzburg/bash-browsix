; ModuleID = 'evalfile.c'
source_filename = "evalfile.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.func_array_state = type { %struct.array*, %struct.variable*, %struct.array*, %struct.variable*, %struct.array*, %struct.variable* }

@sourcelevel = global i32 0, align 4
@.str = private unnamed_addr constant [11 x i8] c"evalfile.c\00", align 1
@posixly_correct = external global i32, align 4
@interactive_shell = external global i32, align 4
@executing_command_builtin = external global i32, align 4
@.str.1 = private unnamed_addr constant [9 x i8] c"FUNCNAME\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"BASH_LINENO\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"BASH_ARGV\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"BASH_ARGC\00", align 1
@last_command_exit_value = external global i32, align 4
@.str.6 = private unnamed_addr constant [19 x i8] c"%s: is a directory\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"%s: not a regular file\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"%s: file is too large\00", align 1
@.str.9 = private unnamed_addr constant [31 x i8] c"%s: cannot execute binary file\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"_evalfile\00", align 1
@return_catch_flag = external global i32, align 4
@return_catch = external global [1 x %struct.__jmp_buf_tag], align 4
@interactive = external global i32, align 4
@.str.11 = private unnamed_addr constant [7 x i8] c"source\00", align 1
@return_catch_value = external global i32, align 4
@current_token = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @maybe_execute_file(i8* %fname, i32 %force_noninteractive) #0 {
entry:
  %fname.addr = alloca i8*, align 4
  %force_noninteractive.addr = alloca i32, align 4
  %filename = alloca i8*, align 4
  %result = alloca i32, align 4
  %flags = alloca i32, align 4
  store i8* %fname, i8** %fname.addr, align 4
  store i32 %force_noninteractive, i32* %force_noninteractive.addr, align 4
  %0 = load i8*, i8** %fname.addr, align 4
  %call = call i8* @bash_tilde_expand(i8* %0, i32 0)
  store i8* %call, i8** %filename, align 4
  store i32 1, i32* %flags, align 4
  %1 = load i32, i32* %force_noninteractive.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %flags, align 4
  %or = or i32 %2, 8
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %filename, align 4
  %4 = load i32, i32* %flags, align 4
  %call1 = call i32 @_evalfile(i8* %3, i32 %4)
  store i32 %call1, i32* %result, align 4
  %5 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 335)
  %6 = load i32, i32* %result, align 4
  ret i32 %6
}

declare i8* @bash_tilde_expand(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @_evalfile(i8* %filename, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %old_interactive = alloca i32, align 4
  %old_return_catch = alloca [1 x %struct.__jmp_buf_tag], align 4
  %return_val = alloca i32, align 4
  %fd = alloca i32, align 4
  %result = alloca i32, align 4
  %pflags = alloca i32, align 4
  %i = alloca i32, align 4
  %nnull = alloca i32, align 4
  %nr = alloca i32, align 4
  %string = alloca i8*, align 4
  %finfo = alloca %struct.stat, align 8
  %file_size = alloca i32, align 4
  %errfunc = alloca void (i8*, ...)*, align 4
  %funcname_v = alloca %struct.variable*, align 4
  %nfv = alloca %struct.variable*, align 4
  %bash_source_v = alloca %struct.variable*, align 4
  %bash_lineno_v = alloca %struct.variable*, align 4
  %funcname_a = alloca %struct.array*, align 4
  %bash_source_a = alloca %struct.array*, align 4
  %bash_lineno_a = alloca %struct.array*, align 4
  %fa = alloca %struct.func_array_state*, align 4
  %bash_argv_v = alloca %struct.variable*, align 4
  %bash_argc_v = alloca %struct.variable*, align 4
  %bash_argv_a = alloca %struct.array*, align 4
  %bash_argc_a = alloca %struct.array*, align 4
  %t = alloca i8*, align 4
  %tt = alloca [2 x i8], align 1
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %funcname_v, align 4
  %0 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %do.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %5, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %funcname_a, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %call3 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0))
  store %struct.variable* %call3, %struct.variable** %bash_source_v, align 4
  %6 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %tobool4 = icmp ne %struct.variable* %6, null
  br i1 %tobool4, label %land.lhs.true5, label %cond.false11

land.lhs.true5:                                   ; preds = %do.body2
  %7 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %8, 4
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %land.lhs.true5
  %9 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %value10 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value10, align 4
  %11 = bitcast i8* %10 to %struct.array*
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true5, %do.body2
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi %struct.array* [ %11, %cond.true9 ], [ null, %cond.false11 ]
  store %struct.array* %cond13, %struct.array** %bash_source_a, align 4
  br label %do.end14

do.end14:                                         ; preds = %cond.end12
  br label %do.body15

do.body15:                                        ; preds = %do.end14
  %call16 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  store %struct.variable* %call16, %struct.variable** %bash_lineno_v, align 4
  %12 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %tobool17 = icmp ne %struct.variable* %12, null
  br i1 %tobool17, label %land.lhs.true18, label %cond.false24

land.lhs.true18:                                  ; preds = %do.body15
  %13 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %attributes19 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes19, align 4
  %and20 = and i32 %14, 4
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %cond.true22, label %cond.false24

cond.true22:                                      ; preds = %land.lhs.true18
  %15 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %value23 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 1
  %16 = load i8*, i8** %value23, align 4
  %17 = bitcast i8* %16 to %struct.array*
  br label %cond.end25

cond.false24:                                     ; preds = %land.lhs.true18, %do.body15
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false24, %cond.true22
  %cond26 = phi %struct.array* [ %17, %cond.true22 ], [ null, %cond.false24 ]
  store %struct.array* %cond26, %struct.array** %bash_lineno_a, align 4
  br label %do.end27

do.end27:                                         ; preds = %cond.end25
  br label %do.body28

do.body28:                                        ; preds = %do.end27
  %call29 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0))
  store %struct.variable* %call29, %struct.variable** %bash_argv_v, align 4
  %18 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %tobool30 = icmp ne %struct.variable* %18, null
  br i1 %tobool30, label %land.lhs.true31, label %cond.false37

land.lhs.true31:                                  ; preds = %do.body28
  %19 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %attributes32 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes32, align 4
  %and33 = and i32 %20, 4
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %cond.true35, label %cond.false37

cond.true35:                                      ; preds = %land.lhs.true31
  %21 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %value36 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value36, align 4
  %23 = bitcast i8* %22 to %struct.array*
  br label %cond.end38

cond.false37:                                     ; preds = %land.lhs.true31, %do.body28
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false37, %cond.true35
  %cond39 = phi %struct.array* [ %23, %cond.true35 ], [ null, %cond.false37 ]
  store %struct.array* %cond39, %struct.array** %bash_argv_a, align 4
  br label %do.end40

do.end40:                                         ; preds = %cond.end38
  br label %do.body41

do.body41:                                        ; preds = %do.end40
  %call42 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0))
  store %struct.variable* %call42, %struct.variable** %bash_argc_v, align 4
  %24 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %tobool43 = icmp ne %struct.variable* %24, null
  br i1 %tobool43, label %land.lhs.true44, label %cond.false50

land.lhs.true44:                                  ; preds = %do.body41
  %25 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %attributes45 = getelementptr inbounds %struct.variable, %struct.variable* %25, i32 0, i32 5
  %26 = load i32, i32* %attributes45, align 4
  %and46 = and i32 %26, 4
  %tobool47 = icmp ne i32 %and46, 0
  br i1 %tobool47, label %cond.true48, label %cond.false50

cond.true48:                                      ; preds = %land.lhs.true44
  %27 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %value49 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 1
  %28 = load i8*, i8** %value49, align 4
  %29 = bitcast i8* %28 to %struct.array*
  br label %cond.end51

cond.false50:                                     ; preds = %land.lhs.true44, %do.body41
  br label %cond.end51

cond.end51:                                       ; preds = %cond.false50, %cond.true48
  %cond52 = phi %struct.array* [ %29, %cond.true48 ], [ null, %cond.false50 ]
  store %struct.array* %cond52, %struct.array** %bash_argc_a, align 4
  br label %do.end53

do.end53:                                         ; preds = %cond.end51
  %30 = load i8*, i8** %filename.addr, align 4
  %call54 = call i32 (i8*, i32, ...) @open(i8* %30, i32 0)
  store i32 %call54, i32* %fd, align 4
  %31 = load i32, i32* %fd, align 4
  %cmp = icmp slt i32 %31, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end53
  %32 = load i32, i32* %fd, align 4
  %call55 = call i32 @fstat(i32 %32, %struct.stat* %finfo)
  %cmp56 = icmp eq i32 %call55, -1
  br i1 %cmp56, label %if.then, label %if.end84

if.then:                                          ; preds = %lor.lhs.false, %do.end53
  %call57 = call i32* @__errno_location()
  %33 = load i32, i32* %call57, align 4
  store i32 %33, i32* %i, align 4
  %34 = load i32, i32* %fd, align 4
  %cmp58 = icmp sge i32 %34, 0
  br i1 %cmp58, label %if.then59, label %if.end

if.then59:                                        ; preds = %if.then
  %35 = load i32, i32* %fd, align 4
  %call60 = call i32 @close(i32 %35)
  br label %if.end

if.end:                                           ; preds = %if.then59, %if.then
  %36 = load i32, i32* %i, align 4
  %call61 = call i32* @__errno_location()
  store i32 %36, i32* %call61, align 4
  br label %file_error_and_exit

file_error_and_exit:                              ; preds = %if.then148, %if.end
  %37 = load i32, i32* %flags.addr, align 4
  %and62 = and i32 %37, 1
  %cmp63 = icmp eq i32 %and62, 0
  br i1 %cmp63, label %if.then67, label %lor.lhs.false64

lor.lhs.false64:                                  ; preds = %file_error_and_exit
  %call65 = call i32* @__errno_location()
  %38 = load i32, i32* %call65, align 4
  %cmp66 = icmp ne i32 %38, 2
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %lor.lhs.false64, %file_error_and_exit
  %39 = load i8*, i8** %filename.addr, align 4
  call void @file_error(i8* %39)
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %lor.lhs.false64
  %40 = load i32, i32* %flags.addr, align 4
  %and69 = and i32 %40, 16
  %tobool70 = icmp ne i32 %and69, 0
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  store i32 1, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 3) #5
  unreachable

if.end72:                                         ; preds = %if.end68
  %41 = load i32, i32* %flags.addr, align 4
  %and73 = and i32 %41, 2
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %cond.true75, label %cond.false76

cond.true75:                                      ; preds = %if.end72
  br label %cond.end82

cond.false76:                                     ; preds = %if.end72
  %call77 = call i32* @__errno_location()
  %42 = load i32, i32* %call77, align 4
  %cmp78 = icmp eq i32 %42, 2
  br i1 %cmp78, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.false76
  %43 = load i32, i32* %flags.addr, align 4
  %and79 = and i32 %43, 1
  %cmp80 = icmp ne i32 %and79, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false76
  %44 = phi i1 [ false, %cond.false76 ], [ %cmp80, %land.rhs ]
  %cond81 = select i1 %44, i32 0, i32 -1
  br label %cond.end82

cond.end82:                                       ; preds = %land.end, %cond.true75
  %cond83 = phi i32 [ 1, %cond.true75 ], [ %cond81, %land.end ]
  store i32 %cond83, i32* %retval, align 4
  br label %return

if.end84:                                         ; preds = %lor.lhs.false
  %45 = load i32, i32* %flags.addr, align 4
  %and85 = and i32 %45, 2
  %tobool86 = icmp ne i32 %and85, 0
  %cond87 = select i1 %tobool86, void (i8*, ...)* @builtin_error, void (i8*, ...)* @internal_error
  store void (i8*, ...)* %cond87, void (i8*, ...)** %errfunc, align 4
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %46 = load i32, i32* %st_mode, align 8
  %and88 = and i32 %46, 61440
  %cmp89 = icmp eq i32 %and88, 16384
  br i1 %cmp89, label %if.then90, label %if.else

if.then90:                                        ; preds = %if.end84
  %47 = load void (i8*, ...)*, void (i8*, ...)** %errfunc, align 4
  %call91 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i32 0, i32 0))
  %48 = load i8*, i8** %filename.addr, align 4
  call void (i8*, ...) %47(i8* %call91, i8* %48)
  %49 = load i32, i32* %fd, align 4
  %call92 = call i32 @close(i32 %49)
  %50 = load i32, i32* %flags.addr, align 4
  %and93 = and i32 %50, 2
  %tobool94 = icmp ne i32 %and93, 0
  %cond95 = select i1 %tobool94, i32 1, i32 -1
  store i32 %cond95, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end84
  %51 = load i32, i32* %flags.addr, align 4
  %and96 = and i32 %51, 128
  %tobool97 = icmp ne i32 %and96, 0
  br i1 %tobool97, label %land.lhs.true98, label %if.end110

land.lhs.true98:                                  ; preds = %if.else
  %st_mode99 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %52 = load i32, i32* %st_mode99, align 8
  %and100 = and i32 %52, 61440
  %cmp101 = icmp eq i32 %and100, 32768
  %conv = zext i1 %cmp101 to i32
  %cmp102 = icmp eq i32 %conv, 0
  br i1 %cmp102, label %if.then104, label %if.end110

if.then104:                                       ; preds = %land.lhs.true98
  %53 = load void (i8*, ...)*, void (i8*, ...)** %errfunc, align 4
  %call105 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %54 = load i8*, i8** %filename.addr, align 4
  call void (i8*, ...) %53(i8* %call105, i8* %54)
  %55 = load i32, i32* %fd, align 4
  %call106 = call i32 @close(i32 %55)
  %56 = load i32, i32* %flags.addr, align 4
  %and107 = and i32 %56, 2
  %tobool108 = icmp ne i32 %and107, 0
  %cond109 = select i1 %tobool108, i32 1, i32 -1
  store i32 %cond109, i32* %retval, align 4
  br label %return

if.end110:                                        ; preds = %land.lhs.true98, %if.else
  br label %if.end111

if.end111:                                        ; preds = %if.end110
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %57 = load i32, i32* %st_size, align 8
  store i32 %57, i32* %file_size, align 4
  %58 = load i32, i32* %file_size, align 4
  %st_size112 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %59 = load i32, i32* %st_size112, align 8
  %cmp113 = icmp ne i32 %58, %59
  br i1 %cmp113, label %if.then118, label %lor.lhs.false115

lor.lhs.false115:                                 ; preds = %if.end111
  %60 = load i32, i32* %file_size, align 4
  %add = add i32 %60, 1
  %61 = load i32, i32* %file_size, align 4
  %cmp116 = icmp ult i32 %add, %61
  br i1 %cmp116, label %if.then118, label %if.end124

if.then118:                                       ; preds = %lor.lhs.false115, %if.end111
  %62 = load void (i8*, ...)*, void (i8*, ...)** %errfunc, align 4
  %call119 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0))
  %63 = load i8*, i8** %filename.addr, align 4
  call void (i8*, ...) %62(i8* %call119, i8* %63)
  %64 = load i32, i32* %fd, align 4
  %call120 = call i32 @close(i32 %64)
  %65 = load i32, i32* %flags.addr, align 4
  %and121 = and i32 %65, 2
  %tobool122 = icmp ne i32 %and121, 0
  %cond123 = select i1 %tobool122, i32 1, i32 -1
  store i32 %cond123, i32* %retval, align 4
  br label %return

if.end124:                                        ; preds = %lor.lhs.false115
  %st_mode125 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %66 = load i32, i32* %st_mode125, align 8
  %and126 = and i32 %66, 61440
  %cmp127 = icmp eq i32 %and126, 32768
  br i1 %cmp127, label %land.lhs.true129, label %if.else140

land.lhs.true129:                                 ; preds = %if.end124
  %67 = load i32, i32* %file_size, align 4
  %cmp130 = icmp ule i32 %67, 2147483647
  br i1 %cmp130, label %if.then132, label %if.else140

if.then132:                                       ; preds = %land.lhs.true129
  %68 = load i32, i32* %file_size, align 4
  %add133 = add i32 1, %68
  %call134 = call i8* @sh_xmalloc(i32 %add133, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 166)
  store i8* %call134, i8** %string, align 4
  %69 = load i32, i32* %fd, align 4
  %70 = load i8*, i8** %string, align 4
  %71 = load i32, i32* %file_size, align 4
  %call135 = call i32 @read(i32 %69, i8* %70, i32 %71)
  store i32 %call135, i32* %nr, align 4
  %72 = load i32, i32* %nr, align 4
  %cmp136 = icmp sge i32 %72, 0
  br i1 %cmp136, label %if.then138, label %if.end139

if.then138:                                       ; preds = %if.then132
  %73 = load i8*, i8** %string, align 4
  %74 = load i32, i32* %nr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %73, i32 %74
  store i8 0, i8* %arrayidx, align 1
  br label %if.end139

if.end139:                                        ; preds = %if.then138, %if.then132
  br label %if.end142

if.else140:                                       ; preds = %land.lhs.true129, %if.end124
  %75 = load i32, i32* %fd, align 4
  %call141 = call i32 @zmapfd(i32 %75, i8** %string, i8* null)
  store i32 %call141, i32* %nr, align 4
  br label %if.end142

if.end142:                                        ; preds = %if.else140, %if.end139
  %call143 = call i32* @__errno_location()
  %76 = load i32, i32* %call143, align 4
  store i32 %76, i32* %return_val, align 4
  %77 = load i32, i32* %fd, align 4
  %call144 = call i32 @close(i32 %77)
  %78 = load i32, i32* %return_val, align 4
  %call145 = call i32* @__errno_location()
  store i32 %78, i32* %call145, align 4
  %79 = load i32, i32* %nr, align 4
  %cmp146 = icmp slt i32 %79, 0
  br i1 %cmp146, label %if.then148, label %if.end149

if.then148:                                       ; preds = %if.end142
  %80 = load i8*, i8** %string, align 4
  call void @sh_xfree(i8* %80, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 180)
  br label %file_error_and_exit

if.end149:                                        ; preds = %if.end142
  %81 = load i32, i32* %nr, align 4
  %cmp150 = icmp eq i32 %81, 0
  br i1 %cmp150, label %if.then152, label %if.end156

if.then152:                                       ; preds = %if.end149
  %82 = load i8*, i8** %string, align 4
  call void @sh_xfree(i8* %82, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 186)
  %83 = load i32, i32* %flags.addr, align 4
  %and153 = and i32 %83, 2
  %tobool154 = icmp ne i32 %and153, 0
  %cond155 = select i1 %tobool154, i32 0, i32 1
  store i32 %cond155, i32* %retval, align 4
  br label %return

if.end156:                                        ; preds = %if.end149
  %84 = load i32, i32* %flags.addr, align 4
  %and157 = and i32 %84, 64
  %tobool158 = icmp ne i32 %and157, 0
  br i1 %tobool158, label %land.lhs.true159, label %if.end173

land.lhs.true159:                                 ; preds = %if.end156
  %85 = load i8*, i8** %string, align 4
  %86 = load i32, i32* %nr, align 4
  %cmp160 = icmp sgt i32 %86, 80
  br i1 %cmp160, label %cond.true162, label %cond.false163

cond.true162:                                     ; preds = %land.lhs.true159
  br label %cond.end164

cond.false163:                                    ; preds = %land.lhs.true159
  %87 = load i32, i32* %nr, align 4
  br label %cond.end164

cond.end164:                                      ; preds = %cond.false163, %cond.true162
  %cond165 = phi i32 [ 80, %cond.true162 ], [ %87, %cond.false163 ]
  %call166 = call i32 @check_binary_file(i8* %85, i32 %cond165)
  %tobool167 = icmp ne i32 %call166, 0
  br i1 %tobool167, label %if.then168, label %if.end173

if.then168:                                       ; preds = %cond.end164
  %88 = load i8*, i8** %string, align 4
  call void @sh_xfree(i8* %88, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 193)
  %89 = load void (i8*, ...)*, void (i8*, ...)** %errfunc, align 4
  %call169 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.9, i32 0, i32 0))
  %90 = load i8*, i8** %filename.addr, align 4
  call void (i8*, ...) %89(i8* %call169, i8* %90)
  %91 = load i32, i32* %flags.addr, align 4
  %and170 = and i32 %91, 2
  %tobool171 = icmp ne i32 %and170, 0
  %cond172 = select i1 %tobool171, i32 126, i32 -1
  store i32 %cond172, i32* %retval, align 4
  br label %return

if.end173:                                        ; preds = %cond.end164, %if.end156
  %92 = load i8*, i8** %string, align 4
  %call174 = call i32 @strlen(i8* %92)
  store i32 %call174, i32* %i, align 4
  %93 = load i32, i32* %i, align 4
  %94 = load i32, i32* %nr, align 4
  %cmp175 = icmp slt i32 %93, %94
  br i1 %cmp175, label %if.then177, label %if.end200

if.then177:                                       ; preds = %if.end173
  store i32 0, i32* %i, align 4
  store i32 0, i32* %nnull, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then177
  %95 = load i32, i32* %i, align 4
  %96 = load i32, i32* %nr, align 4
  %cmp178 = icmp slt i32 %95, %96
  br i1 %cmp178, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %97 = load i8*, i8** %string, align 4
  %98 = load i32, i32* %i, align 4
  %arrayidx180 = getelementptr inbounds i8, i8* %97, i32 %98
  %99 = load i8, i8* %arrayidx180, align 1
  %conv181 = sext i8 %99 to i32
  %cmp182 = icmp eq i32 %conv181, 0
  br i1 %cmp182, label %if.then184, label %if.end198

if.then184:                                       ; preds = %for.body
  %100 = load i8*, i8** %string, align 4
  %101 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %100, i32 %101
  %102 = load i8*, i8** %string, align 4
  %103 = load i32, i32* %i, align 4
  %add.ptr185 = getelementptr inbounds i8, i8* %102, i32 %103
  %add.ptr186 = getelementptr inbounds i8, i8* %add.ptr185, i32 1
  %104 = load i32, i32* %nr, align 4
  %105 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %104, %105
  call void @llvm.memmove.p0i8.p0i8.i32(i8* %add.ptr, i8* %add.ptr186, i32 %sub, i32 1, i1 false)
  %106 = load i32, i32* %nr, align 4
  %dec = add nsw i32 %106, -1
  store i32 %dec, i32* %nr, align 4
  %107 = load i32, i32* %flags.addr, align 4
  %and187 = and i32 %107, 2
  %tobool188 = icmp ne i32 %and187, 0
  br i1 %tobool188, label %land.lhs.true189, label %if.end197

land.lhs.true189:                                 ; preds = %if.then184
  %108 = load i32, i32* %nnull, align 4
  %inc = add nsw i32 %108, 1
  store i32 %inc, i32* %nnull, align 4
  %cmp190 = icmp sgt i32 %inc, 256
  br i1 %cmp190, label %if.then192, label %if.end197

if.then192:                                       ; preds = %land.lhs.true189
  %109 = load i8*, i8** %string, align 4
  call void @sh_xfree(i8* %109, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 211)
  %110 = load void (i8*, ...)*, void (i8*, ...)** %errfunc, align 4
  %call193 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.9, i32 0, i32 0))
  %111 = load i8*, i8** %filename.addr, align 4
  call void (i8*, ...) %110(i8* %call193, i8* %111)
  %112 = load i32, i32* %flags.addr, align 4
  %and194 = and i32 %112, 2
  %tobool195 = icmp ne i32 %and194, 0
  %cond196 = select i1 %tobool195, i32 126, i32 -1
  store i32 %cond196, i32* %retval, align 4
  br label %return

if.end197:                                        ; preds = %land.lhs.true189, %if.then184
  br label %if.end198

if.end198:                                        ; preds = %if.end197, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end198
  %113 = load i32, i32* %i, align 4
  %inc199 = add nsw i32 %113, 1
  store i32 %inc199, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end200

if.end200:                                        ; preds = %for.end, %if.end173
  %114 = load i32, i32* %flags.addr, align 4
  %and201 = and i32 %114, 4
  %tobool202 = icmp ne i32 %and201, 0
  br i1 %tobool202, label %if.then203, label %if.else208

if.then203:                                       ; preds = %if.end200
  call void @begin_unwind_frame(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i32 0, i32 0))
  call void @unwind_protect_mem(i8* bitcast (i32* @return_catch_flag to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i32 156)
  %115 = load i32, i32* %flags.addr, align 4
  %and204 = and i32 %115, 8
  %tobool205 = icmp ne i32 %and204, 0
  br i1 %tobool205, label %if.then206, label %if.end207

if.then206:                                       ; preds = %if.then203
  call void @unwind_protect_mem(i8* bitcast (i32* @interactive to i8*), i32 4)
  br label %if.end207

if.end207:                                        ; preds = %if.then206, %if.then203
  call void @unwind_protect_mem(i8* bitcast (i32* @sourcelevel to i8*), i32 4)
  br label %if.end213

if.else208:                                       ; preds = %if.end200
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %old_return_catch, i32 0, i32 0
  %116 = bitcast %struct.__jmp_buf_tag* %arraydecay to i8*
  call void @xbcopy(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i8* %116, i32 156)
  %117 = load i32, i32* %flags.addr, align 4
  %and209 = and i32 %117, 8
  %tobool210 = icmp ne i32 %and209, 0
  br i1 %tobool210, label %if.then211, label %if.end212

if.then211:                                       ; preds = %if.else208
  %118 = load i32, i32* @interactive, align 4
  store volatile i32 %118, i32* %old_interactive, align 4
  br label %if.end212

if.end212:                                        ; preds = %if.then211, %if.else208
  br label %if.end213

if.end213:                                        ; preds = %if.end212, %if.end207
  %119 = load i32, i32* %flags.addr, align 4
  %and214 = and i32 %119, 8
  %tobool215 = icmp ne i32 %and214, 0
  br i1 %tobool215, label %if.then216, label %if.end217

if.then216:                                       ; preds = %if.end213
  store i32 0, i32* @interactive, align 4
  br label %if.end217

if.end217:                                        ; preds = %if.then216, %if.end213
  %120 = load i32, i32* @return_catch_flag, align 4
  %inc218 = add nsw i32 %120, 1
  store i32 %inc218, i32* @return_catch_flag, align 4
  %121 = load i32, i32* @sourcelevel, align 4
  %inc219 = add nsw i32 %121, 1
  store i32 %inc219, i32* @sourcelevel, align 4
  br label %do.body220

do.body220:                                       ; preds = %if.end217
  %122 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %123 = load i8*, i8** %filename.addr, align 4
  %call221 = call i32 @array_rshift(%struct.array* %122, i32 1, i8* %123)
  br label %do.end222

do.end222:                                        ; preds = %do.body220
  %call223 = call i32 @executing_line_number()
  %conv224 = sext i32 %call223 to i64
  %call225 = call i8* @itos(i64 %conv224)
  store i8* %call225, i8** %t, align 4
  br label %do.body226

do.body226:                                       ; preds = %do.end222
  %124 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %125 = load i8*, i8** %t, align 4
  %call227 = call i32 @array_rshift(%struct.array* %124, i32 1, i8* %125)
  br label %do.end228

do.end228:                                        ; preds = %do.body226
  %126 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %126, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 245)
  br label %do.body229

do.body229:                                       ; preds = %do.end228
  %127 = load %struct.array*, %struct.array** %funcname_a, align 4
  %call230 = call i32 @array_rshift(%struct.array* %127, i32 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.11, i32 0, i32 0))
  br label %do.end231

do.end231:                                        ; preds = %do.body229
  %call232 = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 248)
  %128 = bitcast i8* %call232 to %struct.func_array_state*
  store %struct.func_array_state* %128, %struct.func_array_state** %fa, align 4
  %129 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %130 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %source_a = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %130, i32 0, i32 2
  store %struct.array* %129, %struct.array** %source_a, align 4
  %131 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %132 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %source_v = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %132, i32 0, i32 3
  store %struct.variable* %131, %struct.variable** %source_v, align 4
  %133 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %134 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %lineno_a = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %134, i32 0, i32 4
  store %struct.array* %133, %struct.array** %lineno_a, align 4
  %135 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %136 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %lineno_v = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %136, i32 0, i32 5
  store %struct.variable* %135, %struct.variable** %lineno_v, align 4
  %137 = load %struct.array*, %struct.array** %funcname_a, align 4
  %138 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %funcname_a233 = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %138, i32 0, i32 0
  store %struct.array* %137, %struct.array** %funcname_a233, align 4
  %139 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %140 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %funcname_v234 = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %140, i32 0, i32 1
  store %struct.variable* %139, %struct.variable** %funcname_v234, align 4
  %141 = load i32, i32* %flags.addr, align 4
  %and235 = and i32 %141, 4
  %tobool236 = icmp ne i32 %and235, 0
  br i1 %tobool236, label %if.then237, label %if.end238

if.then237:                                       ; preds = %do.end231
  %142 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.func_array_state*)*, %struct.func_array_state*)*)(void (%struct.func_array_state*)* @restore_funcarray_state, %struct.func_array_state* %142)
  br label %if.end238

if.end238:                                        ; preds = %if.then237, %do.end231
  %143 = load i32, i32* %flags.addr, align 4
  %and239 = and i32 %143, 256
  %cmp240 = icmp eq i32 %and239, 0
  br i1 %cmp240, label %if.then242, label %if.end256

if.then242:                                       ; preds = %if.end238
  br label %do.body243

do.body243:                                       ; preds = %if.then242
  %144 = load %struct.array*, %struct.array** %bash_argv_a, align 4
  %145 = load i8*, i8** %filename.addr, align 4
  %call244 = call i32 @array_rshift(%struct.array* %144, i32 1, i8* %145)
  br label %do.end245

do.end245:                                        ; preds = %do.body243
  %arrayidx246 = getelementptr inbounds [2 x i8], [2 x i8]* %tt, i32 0, i32 0
  store i8 49, i8* %arrayidx246, align 1
  %arrayidx247 = getelementptr inbounds [2 x i8], [2 x i8]* %tt, i32 0, i32 1
  store i8 0, i8* %arrayidx247, align 1
  br label %do.body248

do.body248:                                       ; preds = %do.end245
  %146 = load %struct.array*, %struct.array** %bash_argc_a, align 4
  %arraydecay249 = getelementptr inbounds [2 x i8], [2 x i8]* %tt, i32 0, i32 0
  %call250 = call i32 @array_rshift(%struct.array* %146, i32 1, i8* %arraydecay249)
  br label %do.end251

do.end251:                                        ; preds = %do.body248
  %147 = load i32, i32* %flags.addr, align 4
  %and252 = and i32 %147, 4
  %tobool253 = icmp ne i32 %and252, 0
  br i1 %tobool253, label %if.then254, label %if.end255

if.then254:                                       ; preds = %do.end251
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i32)*)(void ()* @pop_args, i32 0)
  br label %if.end255

if.end255:                                        ; preds = %if.then254, %do.end251
  br label %if.end256

if.end256:                                        ; preds = %if.end255, %if.end238
  store i32 16, i32* %pflags, align 4
  %148 = load i32, i32* %flags.addr, align 4
  %and257 = and i32 %148, 32
  %tobool258 = icmp ne i32 %and257, 0
  %cond259 = select i1 %tobool258, i32 0, i32 4
  %149 = load i32, i32* %pflags, align 4
  %or = or i32 %149, %cond259
  store i32 %or, i32* %pflags, align 4
  %150 = load i32, i32* %flags.addr, align 4
  %and260 = and i32 %150, 2
  %tobool261 = icmp ne i32 %and260, 0
  br i1 %tobool261, label %if.then262, label %if.end263

if.then262:                                       ; preds = %if.end256
  store i32 0, i32* %result, align 4
  br label %if.end263

if.end263:                                        ; preds = %if.then262, %if.end256
  %call264 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #6
  store i32 %call264, i32* %return_val, align 4
  %151 = load i32, i32* %return_val, align 4
  %tobool265 = icmp ne i32 %151, 0
  br i1 %tobool265, label %if.then266, label %if.else267

if.then266:                                       ; preds = %if.end263
  call void @parse_and_execute_cleanup()
  %152 = load i32, i32* @return_catch_value, align 4
  store i32 %152, i32* %result, align 4
  br label %if.end269

if.else267:                                       ; preds = %if.end263
  %153 = load i8*, i8** %string, align 4
  %154 = load i8*, i8** %filename.addr, align 4
  %155 = load i32, i32* %pflags, align 4
  %call268 = call i32 @parse_and_execute(i8* %153, i8* %154, i32 %155)
  store i32 %call268, i32* %result, align 4
  br label %if.end269

if.end269:                                        ; preds = %if.else267, %if.then266
  %156 = load i32, i32* %flags.addr, align 4
  %and270 = and i32 %156, 4
  %tobool271 = icmp ne i32 %and270, 0
  br i1 %tobool271, label %if.then272, label %if.else273

if.then272:                                       ; preds = %if.end269
  call void @run_unwind_frame(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end292

if.else273:                                       ; preds = %if.end269
  %157 = load i32, i32* %flags.addr, align 4
  %and274 = and i32 %157, 8
  %tobool275 = icmp ne i32 %and274, 0
  br i1 %tobool275, label %if.then276, label %if.end277

if.then276:                                       ; preds = %if.else273
  %158 = load volatile i32, i32* %old_interactive, align 4
  store i32 %158, i32* @interactive, align 4
  br label %if.end277

if.end277:                                        ; preds = %if.then276, %if.else273
  %159 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  call void @restore_funcarray_state(%struct.func_array_state* %159)
  %160 = load i32, i32* %flags.addr, align 4
  %and278 = and i32 %160, 256
  %cmp279 = icmp eq i32 %and278, 0
  br i1 %cmp279, label %if.then281, label %if.end288

if.then281:                                       ; preds = %if.end277
  br label %do.body282

do.body282:                                       ; preds = %if.then281
  %161 = load %struct.array*, %struct.array** %bash_argc_a, align 4
  %call283 = call %struct.array_element* @array_shift(%struct.array* %161, i32 1, i32 0)
  call void @array_dispose_element(%struct.array_element* %call283)
  br label %do.end284

do.end284:                                        ; preds = %do.body282
  br label %do.body285

do.body285:                                       ; preds = %do.end284
  %162 = load %struct.array*, %struct.array** %bash_argv_a, align 4
  %call286 = call %struct.array_element* @array_shift(%struct.array* %162, i32 1, i32 0)
  call void @array_dispose_element(%struct.array_element* %call286)
  br label %do.end287

do.end287:                                        ; preds = %do.body285
  br label %if.end288

if.end288:                                        ; preds = %do.end287, %if.end277
  %163 = load i32, i32* @return_catch_flag, align 4
  %dec289 = add nsw i32 %163, -1
  store i32 %dec289, i32* @return_catch_flag, align 4
  %164 = load i32, i32* @sourcelevel, align 4
  %dec290 = add nsw i32 %164, -1
  store i32 %dec290, i32* @sourcelevel, align 4
  %arraydecay291 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %old_return_catch, i32 0, i32 0
  %165 = bitcast %struct.__jmp_buf_tag* %arraydecay291 to i8*
  call void @xbcopy(i8* %165, i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i32 156)
  br label %if.end292

if.end292:                                        ; preds = %if.end288, %if.then272
  %166 = load i32, i32* @current_token, align 4
  %cmp293 = icmp eq i32 %166, 303
  br i1 %cmp293, label %if.then295, label %if.end296

if.then295:                                       ; preds = %if.end292
  call void @push_token(i32 10)
  br label %if.end296

if.end296:                                        ; preds = %if.then295, %if.end292
  %167 = load i32, i32* %flags.addr, align 4
  %and297 = and i32 %167, 2
  %tobool298 = icmp ne i32 %and297, 0
  br i1 %tobool298, label %cond.true299, label %cond.false300

cond.true299:                                     ; preds = %if.end296
  %168 = load i32, i32* %result, align 4
  br label %cond.end301

cond.false300:                                    ; preds = %if.end296
  br label %cond.end301

cond.end301:                                      ; preds = %cond.false300, %cond.true299
  %cond302 = phi i32 [ %168, %cond.true299 ], [ 1, %cond.false300 ]
  store i32 %cond302, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end301, %if.then192, %if.then168, %if.then152, %if.then118, %if.then104, %if.then90, %cond.end82
  %169 = load i32, i32* %retval, align 4
  ret i32 %169
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @force_execute_file(i8* %fname, i32 %force_noninteractive) #0 {
entry:
  %fname.addr = alloca i8*, align 4
  %force_noninteractive.addr = alloca i32, align 4
  %filename = alloca i8*, align 4
  %result = alloca i32, align 4
  %flags = alloca i32, align 4
  store i8* %fname, i8** %fname.addr, align 4
  store i32 %force_noninteractive, i32* %force_noninteractive.addr, align 4
  %0 = load i8*, i8** %fname.addr, align 4
  %call = call i8* @bash_tilde_expand(i8* %0, i32 0)
  store i8* %call, i8** %filename, align 4
  store i32 0, i32* %flags, align 4
  %1 = load i32, i32* %force_noninteractive.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %flags, align 4
  %or = or i32 %2, 8
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %filename, align 4
  %4 = load i32, i32* %flags, align 4
  %call1 = call i32 @_evalfile(i8* %3, i32 %4)
  store i32 %call1, i32* %result, align 4
  %5 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 352)
  %6 = load i32, i32* %result, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @fc_execute_file(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %flags = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 163, i32* %flags, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %1 = load i32, i32* %flags, align 4
  %call = call i32 @_evalfile(i8* %0, i32 %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @source_file(i8* %filename, i32 %sflags) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %sflags.addr = alloca i32, align 4
  %flags = alloca i32, align 4
  %rval = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %sflags, i32* %sflags.addr, align 4
  store i32 14, i32* %flags, align 4
  %0 = load i32, i32* %sflags.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %flags, align 4
  %or = or i32 %1, 256
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @posixly_correct, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* @interactive_shell, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %land.lhs.true2, label %if.end6

land.lhs.true2:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* @executing_command_builtin, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %land.lhs.true2
  %5 = load i32, i32* %flags, align 4
  %or5 = or i32 %5, 16
  store i32 %or5, i32* %flags, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %land.lhs.true2, %land.lhs.true, %if.end
  %6 = load i8*, i8** %filename.addr, align 4
  %7 = load i32, i32* %flags, align 4
  %call = call i32 @_evalfile(i8* %6, i32 %7)
  store i32 %call, i32* %rval, align 4
  call void @run_return_trap()
  %8 = load i32, i32* %rval, align 4
  ret i32 %8
}

declare void @run_return_trap() #1

declare %struct.variable* @find_variable(i8*) #1

declare i32 @open(i8*, i32, ...) #1

declare i32 @fstat(i32, %struct.stat*) #1

declare i32* @__errno_location() #1

declare i32 @close(i32) #1

declare void @file_error(i8*) #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #2

declare void @builtin_error(i8*, ...) #1

declare void @internal_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @read(i32, i8*, i32) #1

declare i32 @zmapfd(i32, i8**, i8*) #1

declare i32 @check_binary_file(i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #3

declare void @begin_unwind_frame(i8*) #1

declare void @unwind_protect_mem(i8*, i32) #1

declare void @xbcopy(i8*, i8*, i32) #1

declare i32 @array_rshift(%struct.array*, i32, i8*) #1

declare i8* @itos(i64) #1

declare i32 @executing_line_number() #1

declare void @add_unwind_protect(...) #1

declare void @restore_funcarray_state(%struct.func_array_state*) #1

declare void @pop_args() #1

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #4

declare void @parse_and_execute_cleanup() #1

declare i32 @parse_and_execute(i8*, i8*, i32) #1

declare void @run_unwind_frame(i8*) #1

declare void @array_dispose_element(%struct.array_element*) #1

declare %struct.array_element* @array_shift(%struct.array*, i32, i32) #1

declare void @push_token(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }
attributes #6 = { returns_twice }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
