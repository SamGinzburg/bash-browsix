; ModuleID = 'common.c'
source_filename = "common.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._IO_FILE = type opaque
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }

@last_shell_builtin = global i32 (%struct.word_list*)* null, align 4
@this_shell_builtin = global i32 (%struct.word_list*)* null, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"warning: \00", align 1
@this_command_name = external global i8*, align 4
@.str.2 = private unnamed_addr constant [12 x i8] c"%s: usage: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@current_builtin = external global %struct.builtin*, align 4
@.str.4 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@.str.5 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"%s: option requires an argument\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"%s: numeric argument required\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"%s: not found\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"%s: invalid option\00", align 1
@.str.10 = private unnamed_addr constant [24 x i8] c"%s: invalid option name\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"`%s': not a valid identifier\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"invalid octal number\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"invalid hex number\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c"invalid number\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@.str.16 = private unnamed_addr constant [33 x i8] c"%s: invalid signal specification\00", align 1
@.str.17 = private unnamed_addr constant [34 x i8] c"`%s': not a pid or valid job spec\00", align 1
@.str.18 = private unnamed_addr constant [22 x i8] c"%s: readonly variable\00", align 1
@.str.19 = private unnamed_addr constant [20 x i8] c"%s: %s out of range\00", align 1
@.str.20 = private unnamed_addr constant [9 x i8] c"argument\00", align 1
@.str.21 = private unnamed_addr constant [16 x i8] c"%s out of range\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"%s: restricted\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"restricted\00", align 1
@.str.24 = private unnamed_addr constant [24 x i8] c"%s: not a shell builtin\00", align 1
@.str.25 = private unnamed_addr constant [16 x i8] c"write error: %s\00", align 1
@.str.26 = private unnamed_addr constant [38 x i8] c"error setting terminal attributes: %s\00", align 1
@.str.27 = private unnamed_addr constant [38 x i8] c"error getting terminal attributes: %s\00", align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@dollar_vars = external global [0 x i8*], align 4
@.str.28 = private unnamed_addr constant [9 x i8] c"common.c\00", align 1
@rest_of_args = external global %struct.word_list*, align 4
@changed_dollar_vars = internal global i32 0, align 4
@variable_context = external global i32, align 4
@.str.29 = private unnamed_addr constant [3 x i8] c"`'\00", align 1
@running_trap = external global i32, align 4
@trap_saved_exit_value = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@the_current_working_directory = global i8* null, align 4
@no_symbolic_links = external global i32, align 4
@.str.30 = private unnamed_addr constant [48 x i8] c"%s: error retrieving current directory: %s: %s\0A\00", align 1
@bash_getcwd_errstr = external constant i8*, align 4
@.str.31 = private unnamed_addr constant [8 x i8] c"SIGJUNK\00", align 1
@.str.32 = private unnamed_addr constant [8 x i8] c"Unknown\00", align 1
@posixly_correct = external global i32, align 4
@.str.33 = private unnamed_addr constant [4 x i8] c"SIG\00", align 1
@.str.34 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.35 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.36 = private unnamed_addr constant [8 x i8] c"%2d) %s\00", align 1
@.str.37 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@num_shell_builtins = external global i32, align 4
@shell_builtins = external global %struct.builtin*, align 4
@.str.39 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@interactive_shell = external global i32, align 4
@.str.40 = private unnamed_addr constant [10 x i8] c"line %d: \00", align 1

; Function Attrs: noinline nounwind
define void @builtin_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @builtin_error_prolog()
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vfprintf(%struct._IO_FILE* %0, i8* %1, i32* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay34 = bitcast i32* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

declare i32 @vfprintf(%struct._IO_FILE*, i8*, i32*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind
define void @builtin_warning(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  call void @builtin_error_prolog()
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0))
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* %call)
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay2 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay2)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %format.addr, align 4
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call4 = call i32 @vfprintf(%struct._IO_FILE* %1, i8* %2, i32* %arraydecay3)
  %arraydecay5 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay56 = bitcast i32* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  ret void
}

declare i8* @libintl_gettext(i8*) #2

; Function Attrs: noinline nounwind
define void @builtin_usage() #0 {
entry:
  %0 = load i8*, i8** @this_command_name, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @this_command_name, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0))
  %4 = load i8*, i8** @this_command_name, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* %call, i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %6 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 0, i32 4
  %7 = load i8*, i8** %short_doc, align 4
  %call3 = call i8* @libintl_gettext(i8* %7)
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* %call3)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 @fflush(%struct._IO_FILE* %8)
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind
define void @no_args(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call)
  call void @top_level_cleanup()
  call void @jump_to_top_level(i32 2) #5
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @top_level_cleanup() #2

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #3

; Function Attrs: noinline nounwind
define i32 @no_options(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %opt = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  call void @reset_internal_getopt()
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %opt, align 4
  %cmp1 = icmp eq i32 %1, -99
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @builtin_help()
  store i32 2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  call void @builtin_usage()
  store i32 1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.end, %if.then2
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare void @reset_internal_getopt() #2

declare i32 @internal_getopt(%struct.word_list*, i8*) #2

declare void @builtin_help() #2

; Function Attrs: noinline nounwind
define void @sh_needarg(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_neednumarg(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_notfound(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_invalidopt(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_invalidoptname(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.10, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_invalidid(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_invalidnum(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %msg = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 48
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %s.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx, align 1
  %conv2 = zext i8 %3 to i32
  %call = call i32 @isdigit(i32 %conv2) #6
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.12, i32 0, i32 0))
  store i8* %call3, i8** %msg, align 4
  br label %if.end16

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i8*, i8** %s.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp eq i32 %conv4, 48
  br i1 %cmp5, label %land.lhs.true7, label %if.else14

land.lhs.true7:                                   ; preds = %if.else
  %6 = load i8*, i8** %s.addr, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %7 to i32
  %cmp10 = icmp eq i32 %conv9, 120
  br i1 %cmp10, label %if.then12, label %if.else14

if.then12:                                        ; preds = %land.lhs.true7
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i32 0, i32 0))
  store i8* %call13, i8** %msg, align 4
  br label %if.end

if.else14:                                        ; preds = %land.lhs.true7, %if.else
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.14, i32 0, i32 0))
  store i8* %call15, i8** %msg, align 4
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then12
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  %8 = load i8*, i8** %s.addr, align 4
  %9 = load i8*, i8** %msg, align 4
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.15, i32 0, i32 0), i8* %8, i8* %9)
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #4

; Function Attrs: noinline nounwind
define void @sh_invalidsig(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.16, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_badpid(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.17, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_readonly(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_erange(i8* %s, i8* %desc) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %desc.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %desc, i8** %desc.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.19, i32 0, i32 0))
  %1 = load i8*, i8** %s.addr, align 4
  %2 = load i8*, i8** %desc.addr, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %3 = load i8*, i8** %desc.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %3, %cond.true ], [ %call2, %cond.false ]
  call void (i8*, ...) @builtin_error(i8* %call, i8* %1, i8* %cond)
  br label %if.end

if.else:                                          ; preds = %entry
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.21, i32 0, i32 0))
  %4 = load i8*, i8** %desc.addr, align 4
  %tobool4 = icmp ne i8* %4, null
  br i1 %tobool4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %if.else
  %5 = load i8*, i8** %desc.addr, align 4
  br label %cond.end8

cond.false6:                                      ; preds = %if.else
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.20, i32 0, i32 0))
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.true5
  %cond9 = phi i8* [ %5, %cond.true5 ], [ %call7, %cond.false6 ]
  call void (i8*, ...) @builtin_error(i8* %call3, i8* %cond9)
  br label %if.end

if.end:                                           ; preds = %cond.end8, %cond.end
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_restricted(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.22, i32 0, i32 0))
  %1 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %1)
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.23, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_notbuiltin(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.24, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sh_wrerror() #0 {
entry:
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.25, i32 0, i32 0))
  %call1 = call i32* @__errno_location()
  %0 = load i32, i32* %call1, align 4
  %call2 = call i8* @strerror(i32 %0)
  call void (i8*, ...) @builtin_error(i8* %call, i8* %call2)
  ret void
}

declare i8* @strerror(i32) #2

declare i32* @__errno_location() #2

; Function Attrs: noinline nounwind
define void @sh_ttyerror(i32 %set) #0 {
entry:
  %set.addr = alloca i32, align 4
  store i32 %set, i32* %set.addr, align 4
  %0 = load i32, i32* %set.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.26, i32 0, i32 0))
  %call1 = call i32* @__errno_location()
  %1 = load i32, i32* %call1, align 4
  %call2 = call i8* @strerror(i32 %1)
  call void (i8*, ...) @builtin_error(i8* %call, i8* %call2)
  br label %if.end

if.else:                                          ; preds = %entry
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.27, i32 0, i32 0))
  %call4 = call i32* @__errno_location()
  %2 = load i32, i32* %call4, align 4
  %call5 = call i8* @strerror(i32 %2)
  call void (i8*, ...) @builtin_error(i8* %call3, i8* %call5)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i32 @sh_chkwrite(i32 %s) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  %2 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @throw_to_top_level()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  br label %do.end

do.end:                                           ; preds = %if.end3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %3)
  br label %do.body4

do.body4:                                         ; preds = %do.end
  %4 = load volatile i32, i32* @terminating_signal, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.body4
  %5 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %5)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %do.body4
  %6 = load volatile i32, i32* @interrupt_state, align 4
  %tobool8 = icmp ne i32 %6, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  call void @throw_to_top_level()
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  br label %do.end11

do.end11:                                         ; preds = %if.end10
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call12 = call i32 @ferror(%struct._IO_FILE* %7)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end16

if.then14:                                        ; preds = %do.end11
  call void @sh_wrerror()
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call15 = call i32 @_bash_fpurge(%struct._IO_FILE* %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %9)
  store i32 1, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %do.end11
  %10 = load i32, i32* %s.addr, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.then14
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare void @termsig_handler(i32) #2

declare void @throw_to_top_level() #2

declare i32 @ferror(%struct._IO_FILE*) #2

declare i32 @_bash_fpurge(%struct._IO_FILE*) #2

declare void @clearerr(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind
define i8** @make_builtin_argv(%struct.word_list* %list, i32* %ip) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %ip.addr = alloca i32*, align 4
  %argv = alloca i8**, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32* %ip, i32** %ip.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %1 = load i32*, i32** %ip.addr, align 4
  %call = call i8** @strvec_from_word_list(%struct.word_list* %0, i32 0, i32 1, i32* %1)
  store i8** %call, i8*** %argv, align 4
  %2 = load i8*, i8** @this_command_name, align 4
  %3 = load i8**, i8*** %argv, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 0
  store i8* %2, i8** %arrayidx, align 4
  %4 = load i8**, i8*** %argv, align 4
  ret i8** %4
}

declare i8** @strvec_from_word_list(%struct.word_list*, i32, i32, i32*) #2

; Function Attrs: noinline nounwind
define void @remember_args(%struct.word_list* %list, i32 %destructive) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %destructive.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %destructive, i32* %destructive.addr, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %destructive.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool1 = icmp ne %struct.word_list* %2, null
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false, %for.body
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %tobool2 = icmp ne i8* %4, null
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %5
  %6 = load i8*, i8** %arrayidx3, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 394)
  %7 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %7
  store i8* null, i8** %arrayidx4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %lor.lhs.false
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool5 = icmp ne %struct.word_list* %8, null
  br i1 %tobool5, label %if.then6, label %if.end13

if.then6:                                         ; preds = %if.end
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word7 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word7, align 4
  %call = call i32 @strlen(i8* %11)
  %add = add i32 1, %call
  %call8 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 400)
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word9 = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word9, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word10, align 4
  %call11 = call i8* @strcpy(i8* %call8, i8* %14)
  %15 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %15
  store i8* %call11, i8** %arrayidx12, align 4
  %16 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 0
  %17 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %17, %struct.word_list** %list.addr, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then6, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end13
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load i32, i32* %destructive.addr, align 4
  %tobool14 = icmp ne i32 %19, 0
  br i1 %tobool14, label %if.then17, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %for.end
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool16 = icmp ne %struct.word_list* %20, null
  br i1 %tobool16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %lor.lhs.false15, %for.end
  %21 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  call void @dispose_words(%struct.word_list* %21)
  %22 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call18 = call %struct.word_list* @copy_word_list(%struct.word_list* %22)
  store %struct.word_list* %call18, %struct.word_list** @rest_of_args, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %lor.lhs.false15
  %23 = load i32, i32* %destructive.addr, align 4
  %tobool20 = icmp ne i32 %23, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  call void @set_dollar_vars_changed()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  call void @invalidate_cached_quoted_dollar_at()
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #2

declare i8* @strcpy(i8*, i8*) #2

declare i8* @sh_xmalloc(i32, i8*, i32) #2

declare i32 @strlen(i8*) #2

declare void @dispose_words(%struct.word_list*) #2

declare %struct.word_list* @copy_word_list(%struct.word_list*) #2

; Function Attrs: noinline nounwind
define void @set_dollar_vars_changed() #0 {
entry:
  %0 = load i32, i32* @variable_context, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @changed_dollar_vars, align 4
  %or = or i32 %1, 2
  store i32 %or, i32* @changed_dollar_vars, align 4
  br label %if.end5

if.else:                                          ; preds = %entry
  %2 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp = icmp eq i32 (%struct.word_list*)* %2, @set_builtin
  br i1 %cmp, label %if.then1, label %if.else3

if.then1:                                         ; preds = %if.else
  %3 = load i32, i32* @changed_dollar_vars, align 4
  %or2 = or i32 %3, 4
  store i32 %or2, i32* @changed_dollar_vars, align 4
  br label %if.end

if.else3:                                         ; preds = %if.else
  %4 = load i32, i32* @changed_dollar_vars, align 4
  %or4 = or i32 %4, 1
  store i32 %or4, i32* @changed_dollar_vars, align 4
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then1
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  ret void
}

declare void @invalidate_cached_quoted_dollar_at() #2

; Function Attrs: noinline nounwind
define i32 @dollar_vars_changed() #0 {
entry:
  %0 = load i32, i32* @changed_dollar_vars, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define void @set_dollar_vars_unchanged() #0 {
entry:
  store i32 0, i32* @changed_dollar_vars, align 4
  ret void
}

declare i32 @set_builtin(%struct.word_list*) #2

; Function Attrs: noinline nounwind
define i32 @get_numeric_arg(%struct.word_list* %list, i32 %fatal, i64* %count) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %fatal.addr = alloca i32, align 4
  %count.addr = alloca i64*, align 4
  %arg = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %fatal, i32* %fatal.addr, align 4
  store i64* %count, i64** %count.addr, align 4
  %0 = load i64*, i64** %count.addr, align 4
  %tobool = icmp ne i64* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64*, i64** %count.addr, align 4
  store i64 1, i64* %1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool1 = icmp ne %struct.word_list* %2, null
  br i1 %tobool1, label %land.lhs.true, label %if.end20

land.lhs.true:                                    ; preds = %if.end
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool2 = icmp ne %struct.word_desc* %4, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end20

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word5, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %land.lhs.true7, label %if.end20

land.lhs.true7:                                   ; preds = %land.lhs.true3
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word9, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx10, align 1
  %tobool11 = icmp ne i8 %12, 0
  br i1 %tobool11, label %if.end20, label %land.lhs.true12

land.lhs.true12:                                  ; preds = %land.lhs.true7
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 1
  %14 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %14, i32 0, i32 0
  %15 = load i8*, i8** %word14, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %16 to i32
  %cmp17 = icmp eq i32 %conv16, 45
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true12
  %17 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %17, i32 0, i32 0
  %18 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %18, %struct.word_list** %list.addr, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %land.lhs.true12, %land.lhs.true7, %land.lhs.true3, %land.lhs.true, %if.end
  %19 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool21 = icmp ne %struct.word_list* %19, null
  br i1 %tobool21, label %if.then22, label %if.end46

if.then22:                                        ; preds = %if.end20
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word23 = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 1
  %21 = load %struct.word_desc*, %struct.word_desc** %word23, align 4
  %word24 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word24, align 4
  store i8* %22, i8** %arg, align 4
  %23 = load i8*, i8** %arg, align 4
  %cmp25 = icmp eq i8* %23, null
  br i1 %cmp25, label %if.then29, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then22
  %24 = load i8*, i8** %arg, align 4
  %25 = load i64*, i64** %count.addr, align 4
  %call = call i32 @legal_number(i8* %24, i64* %25)
  %cmp27 = icmp eq i32 %call, 0
  br i1 %cmp27, label %if.then29, label %if.end44

if.then29:                                        ; preds = %lor.lhs.false, %if.then22
  %26 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word30 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 1
  %27 = load %struct.word_desc*, %struct.word_desc** %word30, align 4
  %word31 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %27, i32 0, i32 0
  %28 = load i8*, i8** %word31, align 4
  %tobool32 = icmp ne i8* %28, null
  br i1 %tobool32, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then29
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word33 = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 1
  %30 = load %struct.word_desc*, %struct.word_desc** %word33, align 4
  %word34 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %30, i32 0, i32 0
  %31 = load i8*, i8** %word34, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then29
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %31, %cond.true ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0), %cond.false ]
  call void @sh_neednumarg(i8* %cond)
  %32 = load i32, i32* %fatal.addr, align 4
  %cmp35 = icmp eq i32 %32, 0
  br i1 %cmp35, label %if.then37, label %if.else

if.then37:                                        ; preds = %cond.end
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %cond.end
  %33 = load i32, i32* %fatal.addr, align 4
  %cmp38 = icmp eq i32 %33, 1
  br i1 %cmp38, label %if.then40, label %if.else41

if.then40:                                        ; preds = %if.else
  call void @throw_to_top_level()
  br label %if.end42

if.else41:                                        ; preds = %if.else
  call void @top_level_cleanup()
  call void @jump_to_top_level(i32 2) #5
  unreachable

if.end42:                                         ; preds = %if.then40
  br label %if.end43

if.end43:                                         ; preds = %if.end42
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %lor.lhs.false
  %34 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next45 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 0
  %35 = load %struct.word_list*, %struct.word_list** %next45, align 4
  call void @no_args(%struct.word_list* %35)
  br label %if.end46

if.end46:                                         ; preds = %if.end44, %if.end20
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end46, %if.then37
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

declare i32 @legal_number(i8*, i64*) #2

; Function Attrs: noinline nounwind
define i32 @get_exitstat(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %status = alloca i32, align 4
  %sval = alloca i64, align 8
  %arg = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %land.lhs.true6, label %if.end

land.lhs.true6:                                   ; preds = %land.lhs.true2
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word7 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word7, align 4
  %word8 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %8, i32 0, i32 0
  %9 = load i8*, i8** %word8, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i32 2
  %10 = load i8, i8* %arrayidx9, align 1
  %tobool10 = icmp ne i8 %10, 0
  br i1 %tobool10, label %if.end, label %land.lhs.true11

land.lhs.true11:                                  ; preds = %land.lhs.true6
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word12 = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word12, align 4
  %word13 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 0
  %13 = load i8*, i8** %word13, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %14 to i32
  %cmp16 = icmp eq i32 %conv15, 45
  br i1 %cmp16, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true11
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 0
  %16 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %16, %struct.word_list** %list.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true11, %land.lhs.true6, %land.lhs.true2, %land.lhs.true, %entry
  %17 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp18 = icmp eq %struct.word_list* %17, null
  br i1 %cmp18, label %if.then20, label %if.end31

if.then20:                                        ; preds = %if.end
  %18 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp21 = icmp eq i32 (%struct.word_list*)* %18, @return_builtin
  br i1 %cmp21, label %land.lhs.true23, label %if.end30

land.lhs.true23:                                  ; preds = %if.then20
  %19 = load i32, i32* @running_trap, align 4
  %cmp24 = icmp sgt i32 %19, 0
  br i1 %cmp24, label %land.lhs.true26, label %if.end30

land.lhs.true26:                                  ; preds = %land.lhs.true23
  %20 = load i32, i32* @running_trap, align 4
  %cmp27 = icmp ne i32 %20, 66
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %land.lhs.true26
  %21 = load i32, i32* @trap_saved_exit_value, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %land.lhs.true26, %land.lhs.true23, %if.then20
  %22 = load i32, i32* @last_command_exit_value, align 4
  store i32 %22, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %if.end
  %23 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word32 = getelementptr inbounds %struct.word_list, %struct.word_list* %23, i32 0, i32 1
  %24 = load %struct.word_desc*, %struct.word_desc** %word32, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word33, align 4
  store i8* %25, i8** %arg, align 4
  %26 = load i8*, i8** %arg, align 4
  %cmp34 = icmp eq i8* %26, null
  br i1 %cmp34, label %if.then38, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end31
  %27 = load i8*, i8** %arg, align 4
  %call = call i32 @legal_number(i8* %27, i64* %sval)
  %cmp36 = icmp eq i32 %call, 0
  br i1 %cmp36, label %if.then38, label %if.end44

if.then38:                                        ; preds = %lor.lhs.false, %if.end31
  %28 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word39 = getelementptr inbounds %struct.word_list, %struct.word_list* %28, i32 0, i32 1
  %29 = load %struct.word_desc*, %struct.word_desc** %word39, align 4
  %word40 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %29, i32 0, i32 0
  %30 = load i8*, i8** %word40, align 4
  %tobool41 = icmp ne i8* %30, null
  br i1 %tobool41, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then38
  %31 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word42 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word42, align 4
  %word43 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word43, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then38
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %33, %cond.true ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0), %cond.false ]
  call void @sh_neednumarg(i8* %cond)
  store i32 2, i32* %retval, align 4
  br label %return

if.end44:                                         ; preds = %lor.lhs.false
  %34 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next45 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 0
  %35 = load %struct.word_list*, %struct.word_list** %next45, align 4
  call void @no_args(%struct.word_list* %35)
  %36 = load i64, i64* %sval, align 8
  %and = and i64 %36, 255
  %conv46 = trunc i64 %and to i32
  store i32 %conv46, i32* %status, align 4
  %37 = load i32, i32* %status, align 4
  store i32 %37, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end44, %cond.end, %if.end30, %if.then29
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

declare i32 @return_builtin(%struct.word_list*) #2

; Function Attrs: noinline nounwind
define i32 @read_octal(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %result = alloca i32, align 4
  %digits = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 0, i32* %digits, align 4
  store i32 0, i32* %result, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end7

land.rhs:                                         ; preds = %while.cond
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv1 = sext i8 %3 to i32
  %cmp = icmp sge i32 %conv1, 48
  br i1 %cmp, label %land.rhs3, label %land.end

land.rhs3:                                        ; preds = %land.rhs
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp sle i32 %conv4, 55
  br label %land.end

land.end:                                         ; preds = %land.rhs3, %land.rhs
  %6 = phi i1 [ false, %land.rhs ], [ %cmp5, %land.rhs3 ]
  br label %land.end7

land.end7:                                        ; preds = %land.end, %while.cond
  %7 = phi i1 [ false, %while.cond ], [ %6, %land.end ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %land.end7
  %8 = load i32, i32* %digits, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %digits, align 4
  %9 = load i32, i32* %result, align 4
  %mul = mul nsw i32 %9, 8
  %10 = load i8*, i8** %string.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %string.addr, align 4
  %11 = load i8, i8* %10, align 1
  %conv8 = sext i8 %11 to i32
  %sub = sub nsw i32 %conv8, 48
  %add = add nsw i32 %mul, %sub
  store i32 %add, i32* %result, align 4
  %12 = load i32, i32* %result, align 4
  %cmp9 = icmp sgt i32 %12, 511
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %land.end7
  %13 = load i32, i32* %digits, align 4
  %cmp11 = icmp eq i32 %13, 0
  br i1 %cmp11, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i8, i8* %14, align 1
  %conv13 = sext i8 %15 to i32
  %tobool14 = icmp ne i32 %conv13, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %lor.lhs.false, %while.end
  store i32 -1, i32* %result, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %lor.lhs.false
  %16 = load i32, i32* %result, align 4
  store i32 %16, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define i8* @get_working_directory(i8* %for_whom) #0 {
entry:
  %retval = alloca i8*, align 4
  %for_whom.addr = alloca i8*, align 4
  store i8* %for_whom, i8** %for_whom.addr, align 4
  %0 = load i32, i32* @no_symbolic_links, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8*, i8** @the_current_working_directory, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %2 = load i8*, i8** @the_current_working_directory, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 572)
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i8* null, i8** @the_current_working_directory, align 4
  br label %if.end3

if.end3:                                          ; preds = %do.end, %entry
  %3 = load i8*, i8** @the_current_working_directory, align 4
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %if.then4, label %if.end16

if.then4:                                         ; preds = %if.end3
  %call = call i8* @getcwd(i8* null, i32 4096)
  store i8* %call, i8** @the_current_working_directory, align 4
  %4 = load i8*, i8** @the_current_working_directory, align 4
  %cmp5 = icmp eq i8* %4, null
  br i1 %cmp5, label %if.then6, label %if.end15

if.then6:                                         ; preds = %if.then4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.30, i32 0, i32 0))
  %6 = load i8*, i8** %for_whom.addr, align 4
  %tobool8 = icmp ne i8* %6, null
  br i1 %tobool8, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then6
  %7 = load i8*, i8** %for_whom.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %tobool9 = icmp ne i32 %conv, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %9 = load i8*, i8** %for_whom.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then6
  %call10 = call i8* @get_name_for_error()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %9, %cond.true ], [ %call10, %cond.false ]
  %10 = load i8*, i8** @bash_getcwd_errstr, align 4
  %call11 = call i8* @libintl_gettext(i8* %10)
  %call12 = call i32* @__errno_location()
  %11 = load i32, i32* %call12, align 4
  %call13 = call i8* @strerror(i32 %11)
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* %call7, i8* %cond, i8* %call11, i8* %call13)
  store i8* null, i8** %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.then4
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end3
  %12 = load i8*, i8** @the_current_working_directory, align 4
  %call17 = call i32 @strlen(i8* %12)
  %add = add i32 1, %call17
  %call18 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 592)
  %13 = load i8*, i8** @the_current_working_directory, align 4
  %call19 = call i8* @strcpy(i8* %call18, i8* %13)
  store i8* %call19, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %cond.end
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

declare i8* @getcwd(i8*, i32) #2

declare i8* @get_name_for_error() #2

; Function Attrs: noinline nounwind
define void @set_working_directory(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i8*, i8** @the_current_working_directory, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** @the_current_working_directory, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 600)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strlen(i8* %2)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32 601)
  %3 = load i8*, i8** %name.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %3)
  store i8* %call2, i8** @the_current_working_directory, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @display_signal_list(%struct.word_list* %list, i32 %forcecols) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %forcecols.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %column = alloca i32, align 4
  %name = alloca i8*, align 4
  %result = alloca i32, align 4
  %signum = alloca i32, align 4
  %dflags = alloca i32, align 4
  %lsignum = alloca i64, align 8
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %forcecols, i32* %forcecols.addr, align 4
  store i32 0, i32* %result, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %if.end58, label %if.then

if.then:                                          ; preds = %entry
  store i32 1, i32* %i, align 4
  store i32 0, i32* %column, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %call = call i8* @signal_name(i32 %2)
  store i8* %call, i8** %name, align 4
  br i1 false, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br i1 true, label %if.then18, label %lor.lhs.false

cond.false:                                       ; preds = %for.body
  %3 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %5 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.31, i32 0, i32 0), align 1
  %conv1 = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, %conv1
  br i1 %cmp2, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %cond.false
  %6 = load i8*, i8** %name, align 4
  %call4 = call i32 @strncmp(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.31, i32 0, i32 0), i32 7)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %cond.false, %cond.true
  br i1 false, label %cond.true7, label %cond.false8

cond.true7:                                       ; preds = %lor.lhs.false
  br i1 true, label %if.then18, label %if.end

cond.false8:                                      ; preds = %lor.lhs.false
  %7 = load i8*, i8** %name, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %8 to i32
  %9 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), align 1
  %conv11 = sext i8 %9 to i32
  %cmp12 = icmp eq i32 %conv10, %conv11
  br i1 %cmp12, label %land.lhs.true14, label %if.end

land.lhs.true14:                                  ; preds = %cond.false8
  %10 = load i8*, i8** %name, align 4
  %call15 = call i32 @strncmp(i8* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), i32 7)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.end

if.then18:                                        ; preds = %land.lhs.true14, %cond.true7, %land.lhs.true, %cond.true
  br label %for.inc

if.end:                                           ; preds = %land.lhs.true14, %cond.false8, %cond.true7
  %11 = load i32, i32* @posixly_correct, align 4
  %tobool19 = icmp ne i32 %11, 0
  br i1 %tobool19, label %land.lhs.true20, label %if.else

land.lhs.true20:                                  ; preds = %if.end
  %12 = load i32, i32* %forcecols.addr, align 4
  %tobool21 = icmp ne i32 %12, 0
  br i1 %tobool21, label %if.else, label %if.then22

if.then22:                                        ; preds = %land.lhs.true20
  br i1 false, label %cond.true23, label %cond.false24

cond.true23:                                      ; preds = %if.then22
  br i1 true, label %if.then34, label %if.end35

cond.false24:                                     ; preds = %if.then22
  %13 = load i8*, i8** %name, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %14 to i32
  %15 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), align 1
  %conv27 = sext i8 %15 to i32
  %cmp28 = icmp eq i32 %conv26, %conv27
  br i1 %cmp28, label %land.lhs.true30, label %if.end35

land.lhs.true30:                                  ; preds = %cond.false24
  %16 = load i8*, i8** %name, align 4
  %call31 = call i32 @strncmp(i8* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.33, i32 0, i32 0), i32 3)
  %cmp32 = icmp eq i32 %call31, 0
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %land.lhs.true30, %cond.true23
  %17 = load i8*, i8** %name, align 4
  %add.ptr = getelementptr inbounds i8, i8* %17, i32 3
  store i8* %add.ptr, i8** %name, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %land.lhs.true30, %cond.false24, %cond.true23
  %18 = load i8*, i8** %name, align 4
  %19 = load i32, i32* %i, align 4
  %cmp36 = icmp eq i32 %19, 64
  %cond = select i1 %cmp36, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.35, i32 0, i32 0)
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.34, i32 0, i32 0), i8* %18, i8* %cond)
  br label %if.end47

if.else:                                          ; preds = %land.lhs.true20, %if.end
  %20 = load i32, i32* %i, align 4
  %21 = load i8*, i8** %name, align 4
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.36, i32 0, i32 0), i32 %20, i8* %21)
  %22 = load i32, i32* %column, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %column, align 4
  %cmp40 = icmp slt i32 %inc, 5
  br i1 %cmp40, label %if.then42, label %if.else44

if.then42:                                        ; preds = %if.else
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.37, i32 0, i32 0))
  br label %if.end46

if.else44:                                        ; preds = %if.else
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %column, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.else44, %if.then42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.end35
  br label %for.inc

for.inc:                                          ; preds = %if.end47, %if.then18
  %23 = load i32, i32* %i, align 4
  %inc48 = add nsw i32 %23, 1
  store i32 %inc48, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %24 = load i32, i32* @posixly_correct, align 4
  %tobool49 = icmp ne i32 %24, 0
  br i1 %tobool49, label %land.lhs.true50, label %lor.lhs.false52

land.lhs.true50:                                  ; preds = %for.end
  %25 = load i32, i32* %forcecols.addr, align 4
  %tobool51 = icmp ne i32 %25, 0
  br i1 %tobool51, label %lor.lhs.false52, label %if.then55

lor.lhs.false52:                                  ; preds = %land.lhs.true50, %for.end
  %26 = load i32, i32* %column, align 4
  %cmp53 = icmp ne i32 %26, 0
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %lor.lhs.false52, %land.lhs.true50
  %call56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %lor.lhs.false52
  %27 = load i32, i32* %result, align 4
  store i32 %27, i32* %retval, align 4
  br label %return

if.end58:                                         ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end125, %if.then119, %if.then102, %if.then73, %if.end58
  %28 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool59 = icmp ne %struct.word_list* %28, null
  br i1 %tobool59, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 1
  %30 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word60 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %30, i32 0, i32 0
  %31 = load i8*, i8** %word60, align 4
  %call61 = call i32 @legal_number(i8* %31, i64* %lsignum)
  %tobool62 = icmp ne i32 %call61, 0
  br i1 %tobool62, label %if.then63, label %if.else106

if.then63:                                        ; preds = %while.body
  %32 = load i64, i64* %lsignum, align 8
  %cmp64 = icmp sgt i64 %32, 128
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.then63
  %33 = load i64, i64* %lsignum, align 8
  %sub = sub nsw i64 %33, 128
  store i64 %sub, i64* %lsignum, align 8
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %if.then63
  %34 = load i64, i64* %lsignum, align 8
  %cmp68 = icmp slt i64 %34, 0
  br i1 %cmp68, label %if.then73, label %lor.lhs.false70

lor.lhs.false70:                                  ; preds = %if.end67
  %35 = load i64, i64* %lsignum, align 8
  %cmp71 = icmp sge i64 %35, 65
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %lor.lhs.false70, %if.end67
  %36 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word74 = getelementptr inbounds %struct.word_list, %struct.word_list* %36, i32 0, i32 1
  %37 = load %struct.word_desc*, %struct.word_desc** %word74, align 4
  %word75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %37, i32 0, i32 0
  %38 = load i8*, i8** %word75, align 4
  call void @sh_invalidsig(i8* %38)
  store i32 1, i32* %result, align 4
  %39 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %39, i32 0, i32 0
  %40 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %40, %struct.word_list** %list.addr, align 4
  br label %while.cond

if.end76:                                         ; preds = %lor.lhs.false70
  %41 = load i64, i64* %lsignum, align 8
  %conv77 = trunc i64 %41 to i32
  store i32 %conv77, i32* %signum, align 4
  %42 = load i32, i32* %signum, align 4
  %call78 = call i8* @signal_name(i32 %42)
  store i8* %call78, i8** %name, align 4
  br i1 false, label %cond.true79, label %cond.false80

cond.true79:                                      ; preds = %if.end76
  br i1 true, label %if.then102, label %lor.lhs.false90

cond.false80:                                     ; preds = %if.end76
  %43 = load i8*, i8** %name, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %43, i32 0
  %44 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %44 to i32
  %45 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.31, i32 0, i32 0), align 1
  %conv83 = sext i8 %45 to i32
  %cmp84 = icmp eq i32 %conv82, %conv83
  br i1 %cmp84, label %land.lhs.true86, label %lor.lhs.false90

land.lhs.true86:                                  ; preds = %cond.false80
  %46 = load i8*, i8** %name, align 4
  %call87 = call i32 @strncmp(i8* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.31, i32 0, i32 0), i32 7)
  %cmp88 = icmp eq i32 %call87, 0
  br i1 %cmp88, label %if.then102, label %lor.lhs.false90

lor.lhs.false90:                                  ; preds = %land.lhs.true86, %cond.false80, %cond.true79
  br i1 false, label %cond.true91, label %cond.false92

cond.true91:                                      ; preds = %lor.lhs.false90
  br i1 true, label %if.then102, label %if.end104

cond.false92:                                     ; preds = %lor.lhs.false90
  %47 = load i8*, i8** %name, align 4
  %arrayidx93 = getelementptr inbounds i8, i8* %47, i32 0
  %48 = load i8, i8* %arrayidx93, align 1
  %conv94 = sext i8 %48 to i32
  %49 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), align 1
  %conv95 = sext i8 %49 to i32
  %cmp96 = icmp eq i32 %conv94, %conv95
  br i1 %cmp96, label %land.lhs.true98, label %if.end104

land.lhs.true98:                                  ; preds = %cond.false92
  %50 = load i8*, i8** %name, align 4
  %call99 = call i32 @strncmp(i8* %50, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), i32 7)
  %cmp100 = icmp eq i32 %call99, 0
  br i1 %cmp100, label %if.then102, label %if.end104

if.then102:                                       ; preds = %land.lhs.true98, %cond.true91, %land.lhs.true86, %cond.true79
  %51 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next103 = getelementptr inbounds %struct.word_list, %struct.word_list* %51, i32 0, i32 0
  %52 = load %struct.word_list*, %struct.word_list** %next103, align 4
  store %struct.word_list* %52, %struct.word_list** %list.addr, align 4
  br label %while.cond

if.end104:                                        ; preds = %land.lhs.true98, %cond.false92, %cond.true91
  %53 = load i8*, i8** %name, align 4
  %call105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* %53)
  br label %if.end125

if.else106:                                       ; preds = %while.body
  store i32 2, i32* %dflags, align 4
  %54 = load i32, i32* @posixly_correct, align 4
  %cmp107 = icmp eq i32 %54, 0
  br i1 %cmp107, label %if.then112, label %lor.lhs.false109

lor.lhs.false109:                                 ; preds = %if.else106
  %55 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp110 = icmp ne i32 (%struct.word_list*)* %55, @kill_builtin
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %lor.lhs.false109, %if.else106
  %56 = load i32, i32* %dflags, align 4
  %or = or i32 %56, 1
  store i32 %or, i32* %dflags, align 4
  br label %if.end113

if.end113:                                        ; preds = %if.then112, %lor.lhs.false109
  %57 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word114 = getelementptr inbounds %struct.word_list, %struct.word_list* %57, i32 0, i32 1
  %58 = load %struct.word_desc*, %struct.word_desc** %word114, align 4
  %word115 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %58, i32 0, i32 0
  %59 = load i8*, i8** %word115, align 4
  %60 = load i32, i32* %dflags, align 4
  %call116 = call i32 @decode_signal(i8* %59, i32 %60)
  store i32 %call116, i32* %signum, align 4
  %61 = load i32, i32* %signum, align 4
  %cmp117 = icmp eq i32 %61, -1
  br i1 %cmp117, label %if.then119, label %if.end123

if.then119:                                       ; preds = %if.end113
  %62 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word120 = getelementptr inbounds %struct.word_list, %struct.word_list* %62, i32 0, i32 1
  %63 = load %struct.word_desc*, %struct.word_desc** %word120, align 4
  %word121 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %63, i32 0, i32 0
  %64 = load i8*, i8** %word121, align 4
  call void @sh_invalidsig(i8* %64)
  store i32 1, i32* %result, align 4
  %65 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next122 = getelementptr inbounds %struct.word_list, %struct.word_list* %65, i32 0, i32 0
  %66 = load %struct.word_list*, %struct.word_list** %next122, align 4
  store %struct.word_list* %66, %struct.word_list** %list.addr, align 4
  br label %while.cond

if.end123:                                        ; preds = %if.end113
  %67 = load i32, i32* %signum, align 4
  %call124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i32 0, i32 0), i32 %67)
  br label %if.end125

if.end125:                                        ; preds = %if.end123, %if.end104
  %68 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next126 = getelementptr inbounds %struct.word_list, %struct.word_list* %68, i32 0, i32 0
  %69 = load %struct.word_list*, %struct.word_list** %next126, align 4
  store %struct.word_list* %69, %struct.word_list** %list.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %70 = load i32, i32* %result, align 4
  store i32 %70, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.end57
  %71 = load i32, i32* %retval, align 4
  ret i32 %71
}

declare i8* @signal_name(i32) #2

declare i32 @strncmp(i8*, i8*, i32) #2

declare i32 @printf(i8*, ...) #2

declare i32 @kill_builtin(%struct.word_list*) #2

declare i32 @decode_signal(i8*, i32) #2

; Function Attrs: noinline nounwind
define %struct.builtin* @builtin_address_internal(i8* %name, i32 %disabled_okay) #0 {
entry:
  %retval = alloca %struct.builtin*, align 4
  %name.addr = alloca i8*, align 4
  %disabled_okay.addr = alloca i32, align 4
  %hi = alloca i32, align 4
  %lo = alloca i32, align 4
  %mid = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %disabled_okay, i32* %disabled_okay.addr, align 4
  %0 = load i32, i32* @num_shell_builtins, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %hi, align 4
  store i32 0, i32* %lo, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end32, %entry
  %1 = load i32, i32* %lo, align 4
  %2 = load i32, i32* %hi, align 4
  %cmp = icmp sle i32 %1, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %lo, align 4
  %4 = load i32, i32* %hi, align 4
  %add = add nsw i32 %3, %4
  %div = sdiv i32 %add, 2
  store i32 %div, i32* %mid, align 4
  %5 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %6 = load i32, i32* %mid, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %5, i32 %6
  %name1 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 0
  %7 = load i8*, i8** %name1, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %8 to i32
  %9 = load i8*, i8** %name.addr, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %10 to i32
  %sub5 = sub nsw i32 %conv, %conv4
  store i32 %sub5, i32* %j, align 4
  %11 = load i32, i32* %j, align 4
  %cmp6 = icmp eq i32 %11, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %12 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %13 = load i32, i32* %mid, align 4
  %arrayidx8 = getelementptr inbounds %struct.builtin, %struct.builtin* %12, i32 %13
  %name9 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx8, i32 0, i32 0
  %14 = load i8*, i8** %name9, align 4
  %15 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strcmp(i8* %14, i8* %15)
  store i32 %call, i32* %j, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %16 = load i32, i32* %j, align 4
  %cmp10 = icmp eq i32 %16, 0
  br i1 %cmp10, label %if.then12, label %if.end25

if.then12:                                        ; preds = %if.end
  %17 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %18 = load i32, i32* %mid, align 4
  %arrayidx13 = getelementptr inbounds %struct.builtin, %struct.builtin* %17, i32 %18
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx13, i32 0, i32 1
  %19 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %tobool = icmp ne i32 (%struct.word_list*)* %19, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then12
  %20 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %21 = load i32, i32* %mid, align 4
  %arrayidx14 = getelementptr inbounds %struct.builtin, %struct.builtin* %20, i32 %21
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx14, i32 0, i32 2
  %22 = load i32, i32* %flags, align 4
  %and = and i32 %22, 2
  %cmp15 = icmp eq i32 %and, 0
  br i1 %cmp15, label %land.lhs.true17, label %if.else

land.lhs.true17:                                  ; preds = %land.lhs.true
  %23 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %24 = load i32, i32* %mid, align 4
  %arrayidx18 = getelementptr inbounds %struct.builtin, %struct.builtin* %23, i32 %24
  %flags19 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx18, i32 0, i32 2
  %25 = load i32, i32* %flags19, align 4
  %and20 = and i32 %25, 1
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %if.then23, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true17
  %26 = load i32, i32* %disabled_okay.addr, align 4
  %tobool22 = icmp ne i32 %26, 0
  br i1 %tobool22, label %if.then23, label %if.else

if.then23:                                        ; preds = %lor.lhs.false, %land.lhs.true17
  %27 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %28 = load i32, i32* %mid, align 4
  %arrayidx24 = getelementptr inbounds %struct.builtin, %struct.builtin* %27, i32 %28
  store %struct.builtin* %arrayidx24, %struct.builtin** %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false, %land.lhs.true, %if.then12
  store %struct.builtin* null, %struct.builtin** %retval, align 4
  br label %return

if.end25:                                         ; preds = %if.end
  %29 = load i32, i32* %j, align 4
  %cmp26 = icmp sgt i32 %29, 0
  br i1 %cmp26, label %if.then28, label %if.else30

if.then28:                                        ; preds = %if.end25
  %30 = load i32, i32* %mid, align 4
  %sub29 = sub nsw i32 %30, 1
  store i32 %sub29, i32* %hi, align 4
  br label %if.end32

if.else30:                                        ; preds = %if.end25
  %31 = load i32, i32* %mid, align 4
  %add31 = add nsw i32 %31, 1
  store i32 %add31, i32* %lo, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.else30, %if.then28
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store %struct.builtin* null, %struct.builtin** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.else, %if.then23
  %32 = load %struct.builtin*, %struct.builtin** %retval, align 4
  ret %struct.builtin* %32
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind
define i32 (%struct.word_list*)* @find_shell_builtin(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.builtin* @builtin_address_internal(i8* %0, i32 0)
  store %struct.builtin* %call, %struct.builtin** @current_builtin, align 4
  %1 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %tobool = icmp ne %struct.builtin* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %2, i32 0, i32 1
  %3 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 (%struct.word_list*)* [ %3, %cond.true ], [ null, %cond.false ]
  ret i32 (%struct.word_list*)* %cond
}

; Function Attrs: noinline nounwind
define i32 (%struct.word_list*)* @builtin_address(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.builtin* @builtin_address_internal(i8* %0, i32 1)
  store %struct.builtin* %call, %struct.builtin** @current_builtin, align 4
  %1 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %tobool = icmp ne %struct.builtin* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %2, i32 0, i32 1
  %3 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 (%struct.word_list*)* [ %3, %cond.true ], [ null, %cond.false ]
  ret i32 (%struct.word_list*)* %cond
}

; Function Attrs: noinline nounwind
define i32 (%struct.word_list*)* @find_special_builtin(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.builtin* @builtin_address_internal(i8* %0, i32 0)
  store %struct.builtin* %call, %struct.builtin** @current_builtin, align 4
  %1 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %tobool = icmp ne %struct.builtin* %1, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %2, i32 0, i32 2
  %3 = load i32, i32* %flags, align 4
  %and = and i32 %3, 8
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %4 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %4, i32 0, i32 1
  %5 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 (%struct.word_list*)* [ %5, %cond.true ], [ null, %cond.false ]
  ret i32 (%struct.word_list*)* %cond
}

; Function Attrs: noinline nounwind
define void @initialize_shell_builtins() #0 {
entry:
  %0 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %1 = bitcast %struct.builtin* %0 to i8*
  %2 = load i32, i32* @num_shell_builtins, align 4
  call void @qsort(i8* %1, i32 %2, i32 24, i32 (i8*, i8*)* bitcast (i32 (%struct.builtin*, %struct.builtin*)* @shell_builtin_compare to i32 (i8*, i8*)*))
  ret void
}

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #2

; Function Attrs: noinline nounwind
define internal i32 @shell_builtin_compare(%struct.builtin* %sbp1, %struct.builtin* %sbp2) #0 {
entry:
  %sbp1.addr = alloca %struct.builtin*, align 4
  %sbp2.addr = alloca %struct.builtin*, align 4
  %result = alloca i32, align 4
  store %struct.builtin* %sbp1, %struct.builtin** %sbp1.addr, align 4
  store %struct.builtin* %sbp2, %struct.builtin** %sbp2.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** %sbp1.addr, align 4
  %name = getelementptr inbounds %struct.builtin, %struct.builtin* %0, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load %struct.builtin*, %struct.builtin** %sbp2.addr, align 4
  %name1 = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 0, i32 0
  %4 = load i8*, i8** %name1, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %5 to i32
  %sub = sub nsw i32 %conv, %conv3
  store i32 %sub, i32* %result, align 4
  %cmp = icmp eq i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load %struct.builtin*, %struct.builtin** %sbp1.addr, align 4
  %name5 = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 0, i32 0
  %7 = load i8*, i8** %name5, align 4
  %8 = load %struct.builtin*, %struct.builtin** %sbp2.addr, align 4
  %name6 = getelementptr inbounds %struct.builtin, %struct.builtin* %8, i32 0, i32 0
  %9 = load i8*, i8** %name6, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  store i32 %call, i32* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load i32, i32* %result, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal void @builtin_error_prolog() #0 {
entry:
  %name = alloca i8*, align 4
  %call = call i8* @get_name_for_error()
  store i8* %call, i8** %name, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %name, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i32 0, i32 0), i8* %1)
  %2 = load i32, i32* @interactive_shell, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.40, i32 0, i32 0))
  %call3 = call i32 @executing_line_number()
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* %call2, i32 %call3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i8*, i8** @this_command_name, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %if.end
  %5 = load i8*, i8** @this_command_name, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %tobool5 = icmp ne i32 %conv, 0
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %land.lhs.true
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %8 = load i8*, i8** @this_command_name, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i32 0, i32 0), i8* %8)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %land.lhs.true, %if.end
  ret void
}

declare i32 @executing_line_number() #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
