; ModuleID = 'trap.c'
source_filename = "trap.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"lp\00", align 1
@loptend = external global %struct.word_list*, align 4
@posixly_correct = external global i32, align 4
@subshell_environment = external global i32, align 4
@interactive = external global i32, align 4
@trap_list = external global [0 x i8*], align 4
@.str.1 = private unnamed_addr constant [8 x i8] c"SIGJUNK\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"unknown\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"trap -- %s %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"''\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"SIG\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"trap -- %s %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"./trap.def\00", align 1

; Function Attrs: noinline nounwind
define i32 @trap_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %list_signal_names = alloca i32, align 4
  %display = alloca i32, align 4
  %result = alloca i32, align 4
  %opt = alloca i32, align 4
  %first_arg = alloca i8*, align 4
  %operation = alloca i32, align 4
  %sig = alloca i32, align 4
  %first_signal = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %display, align 4
  store i32 0, i32* %list_signal_names, align 4
  store i32 0, i32* %result, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 108, label %sw.bb
    i32 112, label %sw.bb1
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i32, i32* %list_signal_names, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %list_signal_names, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  %3 = load i32, i32* %display, align 4
  %inc2 = add nsw i32 %3, 1
  store i32 %inc2, i32* %display, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %4, %struct.word_list** %list.addr, align 4
  store i32 3, i32* %opt, align 4
  %5 = load i32, i32* %list_signal_names, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %call4 = call i32 @display_signal_list(%struct.word_list* null, i32 1)
  %call5 = call i32 @sh_chkwrite(i32 %call4)
  store i32 %call5, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %while.end
  %6 = load i32, i32* %display, align 4
  %tobool6 = icmp ne i32 %6, 0
  br i1 %tobool6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp7 = icmp eq %struct.word_list* %7, null
  br i1 %cmp7, label %if.then8, label %if.else11

if.then8:                                         ; preds = %lor.lhs.false, %if.else
  call void @initialize_terminating_signals()
  call void @get_all_original_signals()
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call9 = call i32 @display_traps(%struct.word_list* %8)
  %call10 = call i32 @sh_chkwrite(i32 %call9)
  store i32 %call10, i32* %retval, align 4
  br label %return

if.else11:                                        ; preds = %lor.lhs.false
  store i32 0, i32* %operation, align 4
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word12 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word12, align 4
  store i8* %11, i8** %first_arg, align 4
  %12 = load i8*, i8** %first_arg, align 4
  %tobool13 = icmp ne i8* %12, null
  br i1 %tobool13, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %if.else11
  %13 = load i8*, i8** %first_arg, align 4
  %14 = load i8, i8* %13, align 1
  %conv = sext i8 %14 to i32
  %tobool14 = icmp ne i32 %conv, 0
  br i1 %tobool14, label %land.lhs.true15, label %land.end

land.lhs.true15:                                  ; preds = %land.lhs.true
  %15 = load i8*, i8** %first_arg, align 4
  %call16 = call i32 @all_digits(i8* %15)
  %tobool17 = icmp ne i32 %call16, 0
  br i1 %tobool17, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true15
  %16 = load i8*, i8** %first_arg, align 4
  %17 = load i32, i32* %opt, align 4
  %call18 = call i32 @decode_signal(i8* %16, i32 %17)
  %cmp19 = icmp ne i32 %call18, -1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true15, %land.lhs.true, %if.else11
  %18 = phi i1 [ false, %land.lhs.true15 ], [ false, %land.lhs.true ], [ false, %if.else11 ], [ %cmp19, %land.rhs ]
  %land.ext = zext i1 %18 to i32
  store i32 %land.ext, i32* %first_signal, align 4
  %19 = load i32, i32* %first_signal, align 4
  %tobool21 = icmp ne i32 %19, 0
  br i1 %tobool21, label %if.then22, label %if.else23

if.then22:                                        ; preds = %land.end
  store i32 1, i32* %operation, align 4
  br label %if.end68

if.else23:                                        ; preds = %land.end
  %20 = load i32, i32* @posixly_correct, align 4
  %cmp24 = icmp eq i32 %20, 0
  br i1 %cmp24, label %land.lhs.true26, label %if.else46

land.lhs.true26:                                  ; preds = %if.else23
  %21 = load i8*, i8** %first_arg, align 4
  %tobool27 = icmp ne i8* %21, null
  br i1 %tobool27, label %land.lhs.true28, label %if.else46

land.lhs.true28:                                  ; preds = %land.lhs.true26
  %22 = load i8*, i8** %first_arg, align 4
  %23 = load i8, i8* %22, align 1
  %conv29 = sext i8 %23 to i32
  %tobool30 = icmp ne i32 %conv29, 0
  br i1 %tobool30, label %land.lhs.true31, label %if.else46

land.lhs.true31:                                  ; preds = %land.lhs.true28
  %24 = load i8*, i8** %first_arg, align 4
  %25 = load i8, i8* %24, align 1
  %conv32 = sext i8 %25 to i32
  %cmp33 = icmp ne i32 %conv32, 45
  br i1 %cmp33, label %land.lhs.true38, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %land.lhs.true31
  %26 = load i8*, i8** %first_arg, align 4
  %arrayidx = getelementptr inbounds i8, i8* %26, i32 1
  %27 = load i8, i8* %arrayidx, align 1
  %conv36 = sext i8 %27 to i32
  %tobool37 = icmp ne i32 %conv36, 0
  br i1 %tobool37, label %land.lhs.true38, label %if.else46

land.lhs.true38:                                  ; preds = %lor.lhs.false35, %land.lhs.true31
  %28 = load i8*, i8** %first_arg, align 4
  %29 = load i32, i32* %opt, align 4
  %call39 = call i32 @decode_signal(i8* %28, i32 %29)
  %cmp40 = icmp ne i32 %call39, -1
  br i1 %cmp40, label %land.lhs.true42, label %if.else46

land.lhs.true42:                                  ; preds = %land.lhs.true38
  %30 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 0
  %31 = load %struct.word_list*, %struct.word_list** %next, align 4
  %cmp43 = icmp eq %struct.word_list* %31, null
  br i1 %cmp43, label %if.then45, label %if.else46

if.then45:                                        ; preds = %land.lhs.true42
  store i32 1, i32* %operation, align 4
  br label %if.end67

if.else46:                                        ; preds = %land.lhs.true42, %land.lhs.true38, %lor.lhs.false35, %land.lhs.true28, %land.lhs.true26, %if.else23
  %32 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next47 = getelementptr inbounds %struct.word_list, %struct.word_list* %32, i32 0, i32 0
  %33 = load %struct.word_list*, %struct.word_list** %next47, align 4
  store %struct.word_list* %33, %struct.word_list** %list.addr, align 4
  %34 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp48 = icmp eq %struct.word_list* %34, null
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.else46
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.else51:                                        ; preds = %if.else46
  %35 = load i8*, i8** %first_arg, align 4
  %36 = load i8, i8* %35, align 1
  %conv52 = sext i8 %36 to i32
  %cmp53 = icmp eq i32 %conv52, 0
  br i1 %cmp53, label %if.then55, label %if.else56

if.then55:                                        ; preds = %if.else51
  store i32 2, i32* %operation, align 4
  br label %if.end65

if.else56:                                        ; preds = %if.else51
  %37 = load i8*, i8** %first_arg, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %37, i32 0
  %38 = load i8, i8* %arrayidx57, align 1
  %conv58 = sext i8 %38 to i32
  %cmp59 = icmp eq i32 %conv58, 45
  br i1 %cmp59, label %land.lhs.true61, label %if.end

land.lhs.true61:                                  ; preds = %if.else56
  %39 = load i8*, i8** %first_arg, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %39, i32 1
  %40 = load i8, i8* %arrayidx62, align 1
  %tobool63 = icmp ne i8 %40, 0
  br i1 %tobool63, label %if.end, label %if.then64

if.then64:                                        ; preds = %land.lhs.true61
  store i32 1, i32* %operation, align 4
  br label %if.end

if.end:                                           ; preds = %if.then64, %land.lhs.true61, %if.else56
  br label %if.end65

if.end65:                                         ; preds = %if.end, %if.then55
  br label %if.end66

if.end66:                                         ; preds = %if.end65
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %if.then45
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.then22
  %41 = load i32, i32* @subshell_environment, align 4
  %and = and i32 %41, 128
  %tobool69 = icmp ne i32 %and, 0
  br i1 %tobool69, label %if.then70, label %if.end72

if.then70:                                        ; preds = %if.end68
  call void @free_trap_strings()
  %42 = load i32, i32* @subshell_environment, align 4
  %and71 = and i32 %42, -129
  store i32 %and71, i32* @subshell_environment, align 4
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %if.end68
  br label %while.cond73

while.cond73:                                     ; preds = %if.end104, %if.end72
  %43 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool74 = icmp ne %struct.word_list* %43, null
  br i1 %tobool74, label %while.body75, label %while.end106

while.body75:                                     ; preds = %while.cond73
  %44 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word76 = getelementptr inbounds %struct.word_list, %struct.word_list* %44, i32 0, i32 1
  %45 = load %struct.word_desc*, %struct.word_desc** %word76, align 4
  %word77 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %45, i32 0, i32 0
  %46 = load i8*, i8** %word77, align 4
  %47 = load i32, i32* %opt, align 4
  %call78 = call i32 @decode_signal(i8* %46, i32 %47)
  store i32 %call78, i32* %sig, align 4
  %48 = load i32, i32* %sig, align 4
  %cmp79 = icmp eq i32 %48, -1
  br i1 %cmp79, label %if.then81, label %if.else84

if.then81:                                        ; preds = %while.body75
  %49 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word82 = getelementptr inbounds %struct.word_list, %struct.word_list* %49, i32 0, i32 1
  %50 = load %struct.word_desc*, %struct.word_desc** %word82, align 4
  %word83 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %50, i32 0, i32 0
  %51 = load i8*, i8** %word83, align 4
  call void @sh_invalidsig(i8* %51)
  store i32 1, i32* %result, align 4
  br label %if.end104

if.else84:                                        ; preds = %while.body75
  %52 = load i32, i32* %operation, align 4
  switch i32 %52, label %sw.epilog103 [
    i32 0, label %sw.bb85
    i32 1, label %sw.bb86
    i32 2, label %sw.bb102
  ]

sw.bb85:                                          ; preds = %if.else84
  %53 = load i32, i32* %sig, align 4
  %54 = load i8*, i8** %first_arg, align 4
  call void @set_signal(i32 %53, i8* %54)
  br label %sw.epilog103

sw.bb86:                                          ; preds = %if.else84
  %55 = load i32, i32* %sig, align 4
  call void @restore_default_signal(i32 %55)
  %56 = load i32, i32* %sig, align 4
  switch i32 %56, label %sw.epilog101 [
    i32 2, label %sw.bb87
    i32 3, label %sw.bb94
    i32 15, label %sw.bb96
  ]

sw.bb87:                                          ; preds = %sw.bb86
  %57 = load i32, i32* @interactive, align 4
  %tobool88 = icmp ne i32 %57, 0
  br i1 %tobool88, label %if.then89, label %if.else91

if.then89:                                        ; preds = %sw.bb87
  %call90 = call void (i32)* @signal(i32 2, void (i32)* @sigint_sighandler)
  br label %if.end93

if.else91:                                        ; preds = %sw.bb87
  %call92 = call void (i32)* @signal(i32 2, void (i32)* @termsig_sighandler)
  br label %if.end93

if.end93:                                         ; preds = %if.else91, %if.then89
  br label %sw.epilog101

sw.bb94:                                          ; preds = %sw.bb86
  %call95 = call void (i32)* @signal(i32 3, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %sw.epilog101

sw.bb96:                                          ; preds = %sw.bb86
  %58 = load i32, i32* @interactive, align 4
  %tobool97 = icmp ne i32 %58, 0
  br i1 %tobool97, label %if.then98, label %if.end100

if.then98:                                        ; preds = %sw.bb96
  %59 = load i32, i32* %sig, align 4
  %call99 = call void (i32)* @signal(i32 %59, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %sw.bb96
  br label %sw.epilog101

sw.epilog101:                                     ; preds = %sw.bb86, %if.end100, %sw.bb94, %if.end93
  br label %sw.epilog103

sw.bb102:                                         ; preds = %if.else84
  %60 = load i32, i32* %sig, align 4
  call void @ignore_signal(i32 %60)
  br label %sw.epilog103

sw.epilog103:                                     ; preds = %if.else84, %sw.bb102, %sw.epilog101, %sw.bb85
  br label %if.end104

if.end104:                                        ; preds = %sw.epilog103, %if.then81
  %61 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next105 = getelementptr inbounds %struct.word_list, %struct.word_list* %61, i32 0, i32 0
  %62 = load %struct.word_list*, %struct.word_list** %next105, align 4
  store %struct.word_list* %62, %struct.word_list** %list.addr, align 4
  br label %while.cond73

while.end106:                                     ; preds = %while.cond73
  br label %if.end107

if.end107:                                        ; preds = %while.end106
  br label %if.end108

if.end108:                                        ; preds = %if.end107
  %63 = load i32, i32* %result, align 4
  store i32 %63, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end108, %if.then50, %if.then8, %if.then, %sw.default, %sw.bb3
  %64 = load i32, i32* %retval, align 4
  ret i32 %64
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i32 @sh_chkwrite(i32) #1

declare i32 @display_signal_list(%struct.word_list*, i32) #1

declare void @initialize_terminating_signals() #1

declare void @get_all_original_signals() #1

; Function Attrs: noinline nounwind
define internal i32 @display_traps(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %1, 68
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  call void @showtrap(i32 %2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %result, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc10, %if.end
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %4, null
  br i1 %tobool, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond2
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word4, align 4
  %call = call i32 @decode_signal(i8* %7, i32 3)
  store i32 %call, i32* %i, align 4
  %8 = load i32, i32* %i, align 4
  %cmp5 = icmp eq i32 %8, -1
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %for.body3
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word7 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word7, align 4
  %word8 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word8, align 4
  call void @sh_invalidsig(i8* %11)
  store i32 1, i32* %result, align 4
  br label %if.end9

if.else:                                          ; preds = %for.body3
  %12 = load i32, i32* %i, align 4
  call void @showtrap(i32 %12)
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  br label %for.inc10

for.inc10:                                        ; preds = %if.end9
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 0
  %14 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %14, %struct.word_list** %list.addr, align 4
  br label %for.cond2

for.end11:                                        ; preds = %for.cond2
  %15 = load i32, i32* %result, align 4
  store i32 %15, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end11, %for.end
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

declare i32 @all_digits(i8*) #1

declare i32 @decode_signal(i8*, i32) #1

declare void @free_trap_strings() #1

declare void @sh_invalidsig(i8*) #1

declare void @set_signal(i32, i8*) #1

declare void @restore_default_signal(i32) #1

declare void (i32)* @signal(i32, void (i32)*) #1

declare void @sigint_sighandler(i32) #1

declare void @termsig_sighandler(i32) #1

declare void @ignore_signal(i32) #1

; Function Attrs: noinline nounwind
define internal void @showtrap(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  %p = alloca i8*, align 4
  %sn = alloca i8*, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [0 x i8*], [0 x i8*]* @trap_list, i32 0, i32 %0
  %1 = load i8*, i8** %arrayidx, align 4
  store i8* %1, i8** %p, align 4
  %2 = load i8*, i8** %p, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %i.addr, align 4
  %call = call i32 @signal_is_hard_ignored(i32 %3)
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %do.end

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %i.addr, align 4
  %call2 = call i32 @signal_is_hard_ignored(i32 %4)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  store i8* null, i8** %t, align 4
  br label %if.end

if.else4:                                         ; preds = %if.else
  %5 = load i8*, i8** %p, align 4
  %cmp5 = icmp eq i8* %5, inttoptr (i32 1 to i8*)
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else4
  br label %cond.end

cond.false:                                       ; preds = %if.else4
  %6 = load i8*, i8** %p, align 4
  %call6 = call i8* @sh_single_quote(i8* %6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ null, %cond.true ], [ %call6, %cond.false ]
  store i8* %cond, i8** %t, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then3
  br label %if.end7

if.end7:                                          ; preds = %if.end
  %7 = load i32, i32* %i.addr, align 4
  %call8 = call i8* @signal_name(i32 %7)
  store i8* %call8, i8** %sn, align 4
  br i1 false, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %if.end7
  br i1 true, label %if.then30, label %lor.lhs.false

cond.false10:                                     ; preds = %if.end7
  %8 = load i8*, i8** %sn, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx11, align 1
  %conv = sext i8 %9 to i32
  %10 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), align 1
  %conv12 = sext i8 %10 to i32
  %cmp13 = icmp eq i32 %conv, %conv12
  br i1 %cmp13, label %land.lhs.true15, label %lor.lhs.false

land.lhs.true15:                                  ; preds = %cond.false10
  %11 = load i8*, i8** %sn, align 4
  %call16 = call i32 @strncmp(i8* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 7)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true15, %cond.false10, %cond.true9
  br i1 false, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %lor.lhs.false
  br i1 true, label %if.then30, label %if.else37

cond.false20:                                     ; preds = %lor.lhs.false
  %12 = load i8*, i8** %sn, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %13 to i32
  %14 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv23 = sext i8 %14 to i32
  %cmp24 = icmp eq i32 %conv22, %conv23
  br i1 %cmp24, label %land.lhs.true26, label %if.else37

land.lhs.true26:                                  ; preds = %cond.false20
  %15 = load i8*, i8** %sn, align 4
  %call27 = call i32 @strncmp(i8* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i32 7)
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then30, label %if.else37

if.then30:                                        ; preds = %land.lhs.true26, %cond.true19, %land.lhs.true15, %cond.true9
  %16 = load i8*, i8** %t, align 4
  %tobool31 = icmp ne i8* %16, null
  br i1 %tobool31, label %cond.true32, label %cond.false33

cond.true32:                                      ; preds = %if.then30
  %17 = load i8*, i8** %t, align 4
  br label %cond.end34

cond.false33:                                     ; preds = %if.then30
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false33, %cond.true32
  %cond35 = phi i8* [ %17, %cond.true32 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), %cond.false33 ]
  %18 = load i32, i32* %i.addr, align 4
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0), i8* %cond35, i32 %18)
  br label %if.end74

if.else37:                                        ; preds = %land.lhs.true26, %cond.false20, %cond.true19
  %19 = load i32, i32* @posixly_correct, align 4
  %tobool38 = icmp ne i32 %19, 0
  br i1 %tobool38, label %if.then39, label %if.else66

if.then39:                                        ; preds = %if.else37
  br i1 false, label %cond.true40, label %cond.false41

cond.true40:                                      ; preds = %if.then39
  br i1 true, label %if.then51, label %if.else58

cond.false41:                                     ; preds = %if.then39
  %20 = load i8*, i8** %sn, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %21 to i32
  %22 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), align 1
  %conv44 = sext i8 %22 to i32
  %cmp45 = icmp eq i32 %conv43, %conv44
  br i1 %cmp45, label %land.lhs.true47, label %if.else58

land.lhs.true47:                                  ; preds = %cond.false41
  %23 = load i8*, i8** %sn, align 4
  %call48 = call i32 @strncmp(i8* %23, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 3)
  %cmp49 = icmp eq i32 %call48, 0
  br i1 %cmp49, label %if.then51, label %if.else58

if.then51:                                        ; preds = %land.lhs.true47, %cond.true40
  %24 = load i8*, i8** %t, align 4
  %tobool52 = icmp ne i8* %24, null
  br i1 %tobool52, label %cond.true53, label %cond.false54

cond.true53:                                      ; preds = %if.then51
  %25 = load i8*, i8** %t, align 4
  br label %cond.end55

cond.false54:                                     ; preds = %if.then51
  br label %cond.end55

cond.end55:                                       ; preds = %cond.false54, %cond.true53
  %cond56 = phi i8* [ %25, %cond.true53 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), %cond.false54 ]
  %26 = load i8*, i8** %sn, align 4
  %add.ptr = getelementptr inbounds i8, i8* %26, i32 3
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* %cond56, i8* %add.ptr)
  br label %if.end65

if.else58:                                        ; preds = %land.lhs.true47, %cond.false41, %cond.true40
  %27 = load i8*, i8** %t, align 4
  %tobool59 = icmp ne i8* %27, null
  br i1 %tobool59, label %cond.true60, label %cond.false61

cond.true60:                                      ; preds = %if.else58
  %28 = load i8*, i8** %t, align 4
  br label %cond.end62

cond.false61:                                     ; preds = %if.else58
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false61, %cond.true60
  %cond63 = phi i8* [ %28, %cond.true60 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), %cond.false61 ]
  %29 = load i8*, i8** %sn, align 4
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* %cond63, i8* %29)
  br label %if.end65

if.end65:                                         ; preds = %cond.end62, %cond.end55
  br label %if.end73

if.else66:                                        ; preds = %if.else37
  %30 = load i8*, i8** %t, align 4
  %tobool67 = icmp ne i8* %30, null
  br i1 %tobool67, label %cond.true68, label %cond.false69

cond.true68:                                      ; preds = %if.else66
  %31 = load i8*, i8** %t, align 4
  br label %cond.end70

cond.false69:                                     ; preds = %if.else66
  br label %cond.end70

cond.end70:                                       ; preds = %cond.false69, %cond.true68
  %cond71 = phi i8* [ %31, %cond.true68 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), %cond.false69 ]
  %32 = load i8*, i8** %sn, align 4
  %call72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0), i8* %cond71, i8* %32)
  br label %if.end73

if.end73:                                         ; preds = %cond.end70, %if.end65
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %cond.end34
  br label %do.body

do.body:                                          ; preds = %if.end74
  %33 = load i8*, i8** %t, align 4
  %tobool75 = icmp ne i8* %33, null
  br i1 %tobool75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %do.body
  %34 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 276)
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %do.body
  br label %do.end

do.end:                                           ; preds = %if.then, %if.end77
  ret void
}

declare i32 @signal_is_hard_ignored(i32) #1

declare i8* @sh_single_quote(i8*) #1

declare i8* @signal_name(i32) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @printf(i8*, ...) #1

declare void @sh_xfree(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
