; ModuleID = 'set.c'
source_filename = "set.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.anon = type { i8*, i32, i32*, i32 (i32, i8*)*, i32 (i8*)* }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._IO_FILE = type opaque
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"allexport\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"braceexpand\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"emacs\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"errexit\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"errtrace\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"functrace\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"hashall\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"histexpand\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"history\00", align 1
@enable_history_list = external global i32, align 4
@.str.9 = private unnamed_addr constant [10 x i8] c"ignoreeof\00", align 1
@ignoreeof = external global i32, align 4
@.str.10 = private unnamed_addr constant [21 x i8] c"interactive-comments\00", align 1
@interactive_comments = external global i32, align 4
@.str.11 = private unnamed_addr constant [8 x i8] c"keyword\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"noclobber\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"noexec\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"noglob\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"nolog\00", align 1
@dont_save_function_defs = external global i32, align 4
@.str.16 = private unnamed_addr constant [8 x i8] c"nounset\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"onecmd\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"physical\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"pipefail\00", align 1
@pipefail_opt = external global i32, align 4
@.str.20 = private unnamed_addr constant [6 x i8] c"posix\00", align 1
@posixly_correct = external global i32, align 4
@.str.21 = private unnamed_addr constant [11 x i8] c"privileged\00", align 1
@.str.22 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"vi\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"xtrace\00", align 1
@o_options = constant [26 x %struct.anon] [%struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 97, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 66, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i32 0, i32* null, i32 (i32, i8*)* @set_edit_mode, i32 (i8*)* @get_edit_mode }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 101, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i32 69, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i32 84, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 104, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 72, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0), i32 0, i32* @enable_history_list, i32 (i32, i8*)* @bash_set_history, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0), i32 0, i32* @ignoreeof, i32 (i32, i8*)* @set_ignoreeof, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i32 0, i32 0), i32 0, i32* @interactive_comments, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.11, i32 0, i32 0), i32 107, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12, i32 0, i32 0), i32 67, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), i32 110, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0), i32 102, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0), i32 0, i32* @dont_save_function_defs, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i32 0, i32 0), i32 117, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 116, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.18, i32 0, i32 0), i32 80, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.19, i32 0, i32 0), i32 0, i32* @pipefail_opt, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.20, i32 0, i32 0), i32 0, i32* @posixly_correct, i32 (i32, i8*)* @set_posix_mode, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0), i32 112, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0), i32 118, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i32 0, i32* null, i32 (i32, i8*)* @set_edit_mode, i32 (i8*)* @get_edit_mode }, %struct.anon { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i32 120, i32* null, i32 (i32, i8*)* null, i32 (i8*)* null }, %struct.anon zeroinitializer], align 4
@.str.25 = private unnamed_addr constant [10 x i8] c"./set.def\00", align 1
@previous_option_value = internal global i32 0, align 4
@.str.26 = private unnamed_addr constant [10 x i8] c"SHELLOPTS\00", align 1
@mark_modified_vars = external global i32, align 4
@remember_on_history = external global i32, align 4
@optflags = external global [0 x i8], align 1
@list_opttype = external global i32, align 4
@list_optopt = external global i32, align 4
@.str.27 = private unnamed_addr constant [4 x i8] c"fnv\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.28 = private unnamed_addr constant [54 x i8] c"cannot simultaneously unset a function and a variable\00", align 1
@.str.29 = private unnamed_addr constant [17 x i8] c"%s: cannot unset\00", align 1
@.str.30 = private unnamed_addr constant [30 x i8] c"%s: cannot unset: readonly %s\00", align 1
@.str.31 = private unnamed_addr constant [9 x i8] c"function\00", align 1
@.str.32 = private unnamed_addr constant [9 x i8] c"variable\00", align 1
@.str.33 = private unnamed_addr constant [26 x i8] c"%s: not an array variable\00", align 1
@.str.34 = private unnamed_addr constant [10 x i8] c"%-15s\09%s\0A\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"on\00", align 1
@.str.36 = private unnamed_addr constant [4 x i8] c"off\00", align 1
@.str.37 = private unnamed_addr constant [12 x i8] c"set %co %s\0A\00", align 1
@.str.38 = private unnamed_addr constant [10 x i8] c"IGNOREEOF\00", align 1
@.str.39 = private unnamed_addr constant [3 x i8] c"10\00", align 1
@.str.40 = private unnamed_addr constant [16 x i8] c"POSIXLY_CORRECT\00", align 1
@.str.41 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.42 = private unnamed_addr constant [13 x i8] c"editing-mode\00", align 1
@interactive = external global i32, align 4
@no_line_editing = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@stdin = external constant %struct._IO_FILE*, align 4
@.str.43 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@history_lines_this_session = external global i32, align 4

; Function Attrs: noinline nounwind
define internal i32 @set_edit_mode(i32 %on_or_off, i8* %option_name) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  %option_name.addr = alloca i8*, align 4
  %isemacs = alloca i32, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  %0 = load i32, i32* %on_or_off.addr, align 4
  %cmp = icmp eq i32 %0, 45
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %option_name.addr, align 4
  %call = call i32 @rl_variable_bind(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.42, i32 0, i32 0), i8* %1)
  %2 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  call void @with_input_from_stdin()
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store i32 0, i32* @no_line_editing, align 4
  br label %if.end17

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @rl_editing_mode, align 4
  %cmp2 = icmp eq i32 %3, 1
  %conv = zext i1 %cmp2 to i32
  store i32 %conv, i32* %isemacs, align 4
  %4 = load i32, i32* %isemacs, align 4
  %tobool3 = icmp ne i32 %4, 0
  br i1 %tobool3, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %if.else
  %5 = load i8*, i8** %option_name.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 101
  br i1 %cmp5, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %if.else
  %7 = load i32, i32* %isemacs, align 4
  %tobool7 = icmp ne i32 %7, 0
  br i1 %tobool7, label %if.end16, label %land.lhs.true8

land.lhs.true8:                                   ; preds = %lor.lhs.false
  %8 = load i8*, i8** %option_name.addr, align 4
  %9 = load i8, i8* %8, align 1
  %conv9 = sext i8 %9 to i32
  %cmp10 = icmp eq i32 %conv9, 118
  br i1 %cmp10, label %if.then12, label %if.end16

if.then12:                                        ; preds = %land.lhs.true8, %land.lhs.true
  %10 = load i32, i32* @interactive, align 4
  %tobool13 = icmp ne i32 %10, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  call void @with_input_from_stream(%struct._IO_FILE* %11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.43, i32 0, i32 0))
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.then12
  store i32 1, i32* @no_line_editing, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %land.lhs.true8, %lor.lhs.false
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end
  %12 = load i32, i32* @no_line_editing, align 4
  %sub = sub nsw i32 1, %12
  ret i32 %sub
}

; Function Attrs: noinline nounwind
define internal i32 @get_edit_mode(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 101
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* @no_line_editing, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.true
  %3 = load i32, i32* @rl_editing_mode, align 4
  %cmp4 = icmp eq i32 %3, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.true
  %4 = phi i1 [ false, %cond.true ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load i32, i32* @no_line_editing, align 4
  %cmp6 = icmp eq i32 %5, 0
  br i1 %cmp6, label %land.rhs8, label %land.end11

land.rhs8:                                        ; preds = %cond.false
  %6 = load i32, i32* @rl_editing_mode, align 4
  %cmp9 = icmp eq i32 %6, 0
  br label %land.end11

land.end11:                                       ; preds = %land.rhs8, %cond.false
  %7 = phi i1 [ false, %cond.false ], [ %cmp9, %land.rhs8 ]
  %land.ext12 = zext i1 %7 to i32
  br label %cond.end

cond.end:                                         ; preds = %land.end11, %land.end
  %cond = phi i32 [ %land.ext, %land.end ], [ %land.ext12, %land.end11 ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define internal i32 @bash_set_history(i32 %on_or_off, i8* %option_name) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  %option_name.addr = alloca i8*, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  %0 = load i32, i32* %on_or_off.addr, align 4
  %cmp = icmp eq i32 %0, 45
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* @enable_history_list, align 4
  call void @bash_history_enable()
  %1 = load i32, i32* @history_lines_this_session, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @load_history()
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3

if.else:                                          ; preds = %entry
  store i32 0, i32* @enable_history_list, align 4
  call void @bash_history_disable()
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.end
  %2 = load i32, i32* @enable_history_list, align 4
  %sub = sub nsw i32 1, %2
  ret i32 %sub
}

; Function Attrs: noinline nounwind
define internal i32 @set_ignoreeof(i32 %on_or_off, i8* %option_name) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  %option_name.addr = alloca i8*, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  %0 = load i32, i32* %on_or_off.addr, align 4
  %cmp = icmp eq i32 %0, 45
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @ignoreeof, align 4
  %call = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0))
  %1 = load i32, i32* @ignoreeof, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.39, i32 0, i32 0), i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.38, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @sv_ignoreeof(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.38, i32 0, i32 0))
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @set_posix_mode(i32 %on_or_off, i8* %option_name) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  %option_name.addr = alloca i8*, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  %0 = load i32, i32* %on_or_off.addr, align 4
  %cmp = icmp eq i32 %0, 45
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @posixly_correct, align 4
  %1 = load i32, i32* @posixly_correct, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.40, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call3 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.41, i32 0, i32 0), i32 0)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @sv_strict_posix(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.40, i32 0, i32 0))
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @minus_o_option_value(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %on_or_off = alloca i32*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %3 to i32
  %4 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %4
  %name4 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx3, i32 0, i32 0
  %5 = load i8*, i8** %name4, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, %conv6
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load i8*, i8** %name.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %8
  %name9 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx8, i32 0, i32 0
  %9 = load i8*, i8** %name9, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %10
  %letter = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx12, i32 0, i32 1
  %11 = load i32, i32* %letter, align 4
  %tobool13 = icmp ne i32 %11, 0
  br i1 %tobool13, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.then
  %12 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %12
  %letter16 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx15, i32 0, i32 1
  %13 = load i32, i32* %letter16, align 4
  %call17 = call i32* @find_flag(i32 %13)
  store i32* %call17, i32** %on_or_off, align 4
  %14 = load i32*, i32** %on_or_off, align 4
  %cmp18 = icmp eq i32* %14, null
  br i1 %cmp18, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then14
  br label %cond.end

cond.false:                                       ; preds = %if.then14
  %15 = load i32*, i32** %on_or_off, align 4
  %16 = load i32, i32* %15, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %16, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %17 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %17
  %get_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx20, i32 0, i32 4
  %18 = load i32 (i8*)*, i32 (i8*)** %get_func, align 4
  %tobool21 = icmp ne i32 (i8*)* %18, null
  br i1 %tobool21, label %cond.true22, label %cond.false26

cond.true22:                                      ; preds = %if.else
  %19 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %19
  %get_func24 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx23, i32 0, i32 4
  %20 = load i32 (i8*)*, i32 (i8*)** %get_func24, align 4
  %21 = load i8*, i8** %name.addr, align 4
  %call25 = call i32 %20(i8* %21)
  br label %cond.end28

cond.false26:                                     ; preds = %if.else
  %22 = load i32, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %22
  %variable = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx27, i32 0, i32 2
  %23 = load i32*, i32** %variable, align 4
  %24 = load i32, i32* %23, align 4
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false26, %cond.true22
  %cond29 = phi i32 [ %call25, %cond.true22 ], [ %24, %cond.false26 ]
  store i32 %cond29, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %cond.end28, %cond.end
  %26 = load i32, i32* %retval, align 4
  ret i32 %26
}

declare i32 @strcmp(i8*, i8*) #1

declare i32* @find_flag(i32) #1

; Function Attrs: noinline nounwind
define void @list_minus_o_opts(i32 %mode, i32 %reusable) #0 {
entry:
  %mode.addr = alloca i32, align 4
  %reusable.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %on_or_off = alloca i32*, align 4
  %value = alloca i32, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %reusable, i32* %reusable.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %2
  %letter = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 1
  %3 = load i32, i32* %letter, align 4
  %tobool2 = icmp ne i32 %3, 0
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 0, i32* %value, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %4
  %letter4 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx3, i32 0, i32 1
  %5 = load i32, i32* %letter4, align 4
  %call = call i32* @find_flag(i32 %5)
  store i32* %call, i32** %on_or_off, align 4
  %6 = load i32*, i32** %on_or_off, align 4
  %cmp = icmp eq i32* %6, null
  br i1 %cmp, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i32* %value, i32** %on_or_off, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  %7 = load i32, i32* %mode.addr, align 4
  %cmp6 = icmp eq i32 %7, -1
  br i1 %cmp6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %8 = load i32, i32* %mode.addr, align 4
  %9 = load i32*, i32** %on_or_off, align 4
  %10 = load i32, i32* %9, align 4
  %cmp7 = icmp eq i32 %8, %10
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %lor.lhs.false, %if.end
  %11 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %11
  %name10 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx9, i32 0, i32 0
  %12 = load i8*, i8** %name10, align 4
  %13 = load i32*, i32** %on_or_off, align 4
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %reusable.addr, align 4
  call void @print_minus_o_option(i8* %12, i32 %14, i32 %15)
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %lor.lhs.false
  br label %if.end27

if.else:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %16
  %get_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx12, i32 0, i32 4
  %17 = load i32 (i8*)*, i32 (i8*)** %get_func, align 4
  %tobool13 = icmp ne i32 (i8*)* %17, null
  br i1 %tobool13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %18 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %18
  %get_func15 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx14, i32 0, i32 4
  %19 = load i32 (i8*)*, i32 (i8*)** %get_func15, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %20
  %name17 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx16, i32 0, i32 0
  %21 = load i8*, i8** %name17, align 4
  %call18 = call i32 %19(i8* %21)
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %22 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %22
  %variable = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx19, i32 0, i32 2
  %23 = load i32*, i32** %variable, align 4
  %24 = load i32, i32* %23, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call18, %cond.true ], [ %24, %cond.false ]
  store i32 %cond, i32* %value, align 4
  %25 = load i32, i32* %mode.addr, align 4
  %cmp20 = icmp eq i32 %25, -1
  br i1 %cmp20, label %if.then23, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %cond.end
  %26 = load i32, i32* %mode.addr, align 4
  %27 = load i32, i32* %value, align 4
  %cmp22 = icmp eq i32 %26, %27
  br i1 %cmp22, label %if.then23, label %if.end26

if.then23:                                        ; preds = %lor.lhs.false21, %cond.end
  %28 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %28
  %name25 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx24, i32 0, i32 0
  %29 = load i8*, i8** %name25, align 4
  %30 = load i32, i32* %value, align 4
  %31 = load i32, i32* %reusable.addr, align 4
  call void @print_minus_o_option(i8* %29, i32 %30, i32 %31)
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %lor.lhs.false21
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end11
  br label %for.inc

for.inc:                                          ; preds = %if.end27
  %32 = load i32, i32* %i, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_minus_o_option(i8* %name, i32 %value, i32 %pflag) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i32, align 4
  %pflag.addr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %value, i32* %value.addr, align 4
  store i32 %pflag, i32* %pflag.addr, align 4
  %0 = load i32, i32* %pflag.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i32, i32* %value.addr, align 4
  %tobool = icmp ne i32 %2, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0)
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.34, i32 0, i32 0), i8* %1, i8* %cond)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %value.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  %cond2 = select i1 %tobool1, i32 45, i32 43
  %4 = load i8*, i8** %name.addr, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.37, i32 0, i32 0), i32 %cond2, i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i8** @get_minus_o_opts() #0 {
entry:
  %ret = alloca i8**, align 4
  %i = alloca i32, align 4
  %call = call i8** @strvec_create(i32 27)
  store i8** %call, i8*** %ret, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %2
  %name2 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 0
  %3 = load i8*, i8** %name2, align 4
  %4 = load i8**, i8*** %ret, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i32 %5
  store i8* %3, i8** %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i8**, i8*** %ret, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %7, i32 %8
  store i8* null, i8** %arrayidx4, align 4
  %9 = load i8**, i8*** %ret, align 4
  ret i8** %9
}

declare i8** @strvec_create(i32) #1

; Function Attrs: noinline nounwind
define i8* @get_current_options() #0 {
entry:
  %temp = alloca i8*, align 4
  %i = alloca i32, align 4
  %call = call i8* @sh_xmalloc(i32 27, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 335)
  store i8* %call, i8** %temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %2
  %letter = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 1
  %3 = load i32, i32* %letter, align 4
  %tobool2 = icmp ne i32 %3, 0
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %4
  %letter4 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx3, i32 0, i32 1
  %5 = load i32, i32* %letter4, align 4
  %call5 = call i32* @find_flag(i32 %5)
  %6 = load i32, i32* %call5, align 4
  %conv = trunc i32 %6 to i8
  %7 = load i8*, i8** %temp, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 %8
  store i8 %conv, i8* %arrayidx6, align 1
  br label %if.end

if.else:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %9
  %get_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx7, i32 0, i32 4
  %10 = load i32 (i8*)*, i32 (i8*)** %get_func, align 4
  %tobool8 = icmp ne i32 (i8*)* %10, null
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %11 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %11
  %get_func10 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx9, i32 0, i32 4
  %12 = load i32 (i8*)*, i32 (i8*)** %get_func10, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %13
  %name12 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx11, i32 0, i32 0
  %14 = load i8*, i8** %name12, align 4
  %call13 = call i32 %12(i8* %14)
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %15 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %15
  %variable = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx14, i32 0, i32 2
  %16 = load i32*, i32** %variable, align 4
  %17 = load i32, i32* %16, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call13, %cond.true ], [ %17, %cond.false ]
  %conv15 = trunc i32 %cond to i8
  %18 = load i8*, i8** %temp, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 %conv15, i8* %arrayidx16, align 1
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load i8*, i8** %temp, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %21, i32 %22
  store i8 0, i8* %arrayidx17, align 1
  %23 = load i8*, i8** %temp, align 4
  ret i8* %23
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @set_current_options(i8* %bitmap) #0 {
entry:
  %bitmap.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %bitmap, i8** %bitmap.addr, align 4
  %0 = load i8*, i8** %bitmap.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %1
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %3
  %letter = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 1
  %4 = load i32, i32* %letter, align 4
  %tobool2 = icmp ne i32 %4, 0
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %5
  %letter5 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx4, i32 0, i32 1
  %6 = load i32, i32* %letter5, align 4
  %7 = load i8*, i8** %bitmap.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx6, align 1
  %conv = sext i8 %9 to i32
  %tobool7 = icmp ne i32 %conv, 0
  %cond = select i1 %tobool7, i32 45, i32 43
  %call = call i32 @change_flag(i32 %6, i32 %cond)
  br label %if.end25

if.else:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %10
  %set_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx8, i32 0, i32 3
  %11 = load i32 (i32, i8*)*, i32 (i32, i8*)** %set_func, align 4
  %tobool9 = icmp ne i32 (i32, i8*)* %11, null
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %12 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %12
  %set_func11 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx10, i32 0, i32 3
  %13 = load i32 (i32, i8*)*, i32 (i32, i8*)** %set_func11, align 4
  %14 = load i8*, i8** %bitmap.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %16 to i32
  %tobool14 = icmp ne i32 %conv13, 0
  %cond15 = select i1 %tobool14, i32 45, i32 43
  %17 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %17
  %name17 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx16, i32 0, i32 0
  %18 = load i8*, i8** %name17, align 4
  %call18 = call i32 %13(i32 %cond15, i8* %18)
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %19 = load i8*, i8** %bitmap.addr, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %21 to i32
  %tobool21 = icmp ne i32 %conv20, 0
  %cond22 = select i1 %tobool21, i32 45, i32 0
  %22 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %22
  %variable = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx23, i32 0, i32 2
  %23 = load i32*, i32** %variable, align 4
  store i32 %cond22, i32* %23, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond24 = phi i32 [ %call18, %cond.true ], [ %cond22, %cond.false ]
  br label %if.end25

if.end25:                                         ; preds = %cond.end, %if.then3
  br label %for.inc

for.inc:                                          ; preds = %if.end25
  %24 = load i32, i32* %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

declare i32 @change_flag(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @set_minus_o_option(i32 %on_or_off, i8* %option_name) #0 {
entry:
  %retval = alloca i32, align 4
  %on_or_off.addr = alloca i32, align 4
  %option_name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %option_name.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %3 to i32
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %4
  %name3 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx2, i32 0, i32 0
  %5 = load i8*, i8** %name3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load i8*, i8** %option_name.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %8
  %name8 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx7, i32 0, i32 0
  %9 = load i8*, i8** %name8, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  %cmp9 = icmp eq i32 %call, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %10
  %letter = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx11, i32 0, i32 1
  %11 = load i32, i32* %letter, align 4
  %cmp12 = icmp eq i32 %11, 0
  br i1 %cmp12, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.then
  %12 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %12
  %get_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx15, i32 0, i32 4
  %13 = load i32 (i8*)*, i32 (i8*)** %get_func, align 4
  %tobool16 = icmp ne i32 (i8*)* %13, null
  br i1 %tobool16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then14
  %14 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %14
  %get_func18 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx17, i32 0, i32 4
  %15 = load i32 (i8*)*, i32 (i8*)** %get_func18, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %16
  %name20 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx19, i32 0, i32 0
  %17 = load i8*, i8** %name20, align 4
  %call21 = call i32 %15(i8* %17)
  br label %cond.end

cond.false:                                       ; preds = %if.then14
  %18 = load i32, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %18
  %variable = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx22, i32 0, i32 2
  %19 = load i32*, i32** %variable, align 4
  %20 = load i32, i32* %19, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call21, %cond.true ], [ %20, %cond.false ]
  store i32 %cond, i32* @previous_option_value, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %21
  %set_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx23, i32 0, i32 3
  %22 = load i32 (i32, i8*)*, i32 (i32, i8*)** %set_func, align 4
  %tobool24 = icmp ne i32 (i32, i8*)* %22, null
  br i1 %tobool24, label %cond.true25, label %cond.false29

cond.true25:                                      ; preds = %cond.end
  %23 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %23
  %set_func27 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx26, i32 0, i32 3
  %24 = load i32 (i32, i8*)*, i32 (i32, i8*)** %set_func27, align 4
  %25 = load i32, i32* %on_or_off.addr, align 4
  %26 = load i8*, i8** %option_name.addr, align 4
  %call28 = call i32 %24(i32 %25, i8* %26)
  br label %cond.end34

cond.false29:                                     ; preds = %cond.end
  %27 = load i32, i32* %on_or_off.addr, align 4
  %cmp30 = icmp eq i32 %27, 45
  %conv31 = zext i1 %cmp30 to i32
  %28 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %28
  %variable33 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx32, i32 0, i32 2
  %29 = load i32*, i32** %variable33, align 4
  store i32 %conv31, i32* %29, align 4
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false29, %cond.true25
  %cond35 = phi i32 [ %call28, %cond.true25 ], [ %conv31, %cond.false29 ]
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %30 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %30
  %letter37 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx36, i32 0, i32 1
  %31 = load i32, i32* %letter37, align 4
  %32 = load i32, i32* %on_or_off.addr, align 4
  %call38 = call i32 @change_flag(i32 %31, i32 %32)
  store i32 %call38, i32* @previous_option_value, align 4
  %cmp39 = icmp eq i32 %call38, -1
  br i1 %cmp39, label %if.then41, label %if.else42

if.then41:                                        ; preds = %if.else
  %33 = load i8*, i8** %option_name.addr, align 4
  call void @sh_invalidoptname(i8* %33)
  store i32 1, i32* %retval, align 4
  br label %return

if.else42:                                        ; preds = %if.else
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %34 = load i32, i32* %i, align 4
  %inc = add nsw i32 %34, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %35 = load i8*, i8** %option_name.addr, align 4
  call void @sh_invalidoptname(i8* %35)
  store i32 258, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.else42, %if.then41, %cond.end34
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

declare void @sh_invalidoptname(i8*) #1

; Function Attrs: noinline nounwind
define void @set_shellopts() #0 {
entry:
  %value = alloca i8*, align 4
  %tflag = alloca [26 x i8], align 1
  %vsize = alloca i32, align 4
  %i = alloca i32, align 4
  %vptr = alloca i32, align 4
  %ip = alloca i32*, align 4
  %exported = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %vsize, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [26 x i8], [26 x i8]* %tflag, i32 0, i32 %2
  store i8 0, i8* %arrayidx1, align 1
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %3
  %letter = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx2, i32 0, i32 1
  %4 = load i32, i32* %letter, align 4
  %tobool3 = icmp ne i32 %4, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %5
  %letter5 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx4, i32 0, i32 1
  %6 = load i32, i32* %letter5, align 4
  %call = call i32* @find_flag(i32 %6)
  store i32* %call, i32** %ip, align 4
  %7 = load i32*, i32** %ip, align 4
  %tobool6 = icmp ne i32* %7, null
  br i1 %tobool6, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %8 = load i32*, i32** %ip, align 4
  %9 = load i32, i32* %8, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %if.then8, label %if.end

if.then8:                                         ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %10
  %name10 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx9, i32 0, i32 0
  %11 = load i8*, i8** %name10, align 4
  %call11 = call i32 @strlen(i8* %11)
  %add = add i32 %call11, 1
  %12 = load i32, i32* %vsize, align 4
  %add12 = add i32 %12, %add
  store i32 %add12, i32* %vsize, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds [26 x i8], [26 x i8]* %tflag, i32 0, i32 %13
  store i8 1, i8* %arrayidx13, align 1
  br label %if.end

if.end:                                           ; preds = %if.then8, %land.lhs.true, %if.then
  br label %if.end32

if.else:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %14
  %get_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx14, i32 0, i32 4
  %15 = load i32 (i8*)*, i32 (i8*)** %get_func, align 4
  %tobool15 = icmp ne i32 (i8*)* %15, null
  br i1 %tobool15, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %16 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %16
  %get_func17 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx16, i32 0, i32 4
  %17 = load i32 (i8*)*, i32 (i8*)** %get_func17, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %18
  %name19 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx18, i32 0, i32 0
  %19 = load i8*, i8** %name19, align 4
  %call20 = call i32 %17(i8* %19)
  %tobool21 = icmp ne i32 %call20, 0
  br i1 %tobool21, label %if.then24, label %if.end31

cond.false:                                       ; preds = %if.else
  %20 = load i32, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %20
  %variable = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx22, i32 0, i32 2
  %21 = load i32*, i32** %variable, align 4
  %22 = load i32, i32* %21, align 4
  %tobool23 = icmp ne i32 %22, 0
  br i1 %tobool23, label %if.then24, label %if.end31

if.then24:                                        ; preds = %cond.false, %cond.true
  %23 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %23
  %name26 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx25, i32 0, i32 0
  %24 = load i8*, i8** %name26, align 4
  %call27 = call i32 @strlen(i8* %24)
  %add28 = add i32 %call27, 1
  %25 = load i32, i32* %vsize, align 4
  %add29 = add i32 %25, %add28
  store i32 %add29, i32* %vsize, align 4
  %26 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds [26 x i8], [26 x i8]* %tflag, i32 0, i32 %26
  store i8 1, i8* %arrayidx30, align 1
  br label %if.end31

if.end31:                                         ; preds = %if.then24, %cond.false, %cond.true
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end32
  %27 = load i32, i32* %i, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %28 = load i32, i32* %vsize, align 4
  %add33 = add nsw i32 %28, 1
  %call34 = call i8* @sh_xmalloc(i32 %add33, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 541)
  store i8* %call34, i8** %value, align 4
  store i32 0, i32* %vptr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc53, %for.end
  %29 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %29
  %name37 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx36, i32 0, i32 0
  %30 = load i8*, i8** %name37, align 4
  %tobool38 = icmp ne i8* %30, null
  br i1 %tobool38, label %for.body39, label %for.end55

for.body39:                                       ; preds = %for.cond35
  %31 = load i32, i32* %i, align 4
  %arrayidx40 = getelementptr inbounds [26 x i8], [26 x i8]* %tflag, i32 0, i32 %31
  %32 = load i8, i8* %arrayidx40, align 1
  %tobool41 = icmp ne i8 %32, 0
  br i1 %tobool41, label %if.then42, label %if.end52

if.then42:                                        ; preds = %for.body39
  %33 = load i8*, i8** %value, align 4
  %34 = load i32, i32* %vptr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i32, i32* %i, align 4
  %arrayidx43 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %35
  %name44 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx43, i32 0, i32 0
  %36 = load i8*, i8** %name44, align 4
  %call45 = call i8* @strcpy(i8* %add.ptr, i8* %36)
  %37 = load i32, i32* %i, align 4
  %arrayidx46 = getelementptr inbounds [26 x %struct.anon], [26 x %struct.anon]* @o_options, i32 0, i32 %37
  %name47 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx46, i32 0, i32 0
  %38 = load i8*, i8** %name47, align 4
  %call48 = call i32 @strlen(i8* %38)
  %39 = load i32, i32* %vptr, align 4
  %add49 = add i32 %39, %call48
  store i32 %add49, i32* %vptr, align 4
  %40 = load i8*, i8** %value, align 4
  %41 = load i32, i32* %vptr, align 4
  %inc50 = add nsw i32 %41, 1
  store i32 %inc50, i32* %vptr, align 4
  %arrayidx51 = getelementptr inbounds i8, i8* %40, i32 %41
  store i8 58, i8* %arrayidx51, align 1
  br label %if.end52

if.end52:                                         ; preds = %if.then42, %for.body39
  br label %for.inc53

for.inc53:                                        ; preds = %if.end52
  %42 = load i32, i32* %i, align 4
  %inc54 = add nsw i32 %42, 1
  store i32 %inc54, i32* %i, align 4
  br label %for.cond35

for.end55:                                        ; preds = %for.cond35
  %43 = load i32, i32* %vptr, align 4
  %tobool56 = icmp ne i32 %43, 0
  br i1 %tobool56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %for.end55
  %44 = load i32, i32* %vptr, align 4
  %dec = add nsw i32 %44, -1
  store i32 %dec, i32* %vptr, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %for.end55
  %45 = load i8*, i8** %value, align 4
  %46 = load i32, i32* %vptr, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %45, i32 %46
  store i8 0, i8* %arrayidx59, align 1
  %call60 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0))
  store %struct.variable* %call60, %struct.variable** %v, align 4
  %47 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool61 = icmp ne %struct.variable* %47, null
  br i1 %tobool61, label %if.then62, label %if.else65

if.then62:                                        ; preds = %if.end58
  %48 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %48, i32 0, i32 5
  %49 = load i32, i32* %attributes, align 4
  %and = and i32 %49, -3
  store i32 %and, i32* %attributes, align 4
  %50 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes63 = getelementptr inbounds %struct.variable, %struct.variable* %50, i32 0, i32 5
  %51 = load i32, i32* %attributes63, align 4
  %and64 = and i32 %51, 1
  store i32 %and64, i32* %exported, align 4
  br label %if.end66

if.else65:                                        ; preds = %if.end58
  store i32 0, i32* %exported, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.else65, %if.then62
  %52 = load i8*, i8** %value, align 4
  %call67 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0), i8* %52, i32 0)
  store %struct.variable* %call67, %struct.variable** %v, align 4
  %53 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes68 = getelementptr inbounds %struct.variable, %struct.variable* %53, i32 0, i32 5
  %54 = load i32, i32* %attributes68, align 4
  %or = or i32 %54, 2
  store i32 %or, i32* %attributes68, align 4
  %55 = load i32, i32* @mark_modified_vars, align 4
  %tobool69 = icmp ne i32 %55, 0
  br i1 %tobool69, label %land.lhs.true70, label %if.end78

land.lhs.true70:                                  ; preds = %if.end66
  %56 = load i32, i32* %exported, align 4
  %cmp = icmp eq i32 %56, 0
  br i1 %cmp, label %land.lhs.true71, label %if.end78

land.lhs.true71:                                  ; preds = %land.lhs.true70
  %57 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes72 = getelementptr inbounds %struct.variable, %struct.variable* %57, i32 0, i32 5
  %58 = load i32, i32* %attributes72, align 4
  %and73 = and i32 %58, 1
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %if.then75, label %if.end78

if.then75:                                        ; preds = %land.lhs.true71
  %59 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes76 = getelementptr inbounds %struct.variable, %struct.variable* %59, i32 0, i32 5
  %60 = load i32, i32* %attributes76, align 4
  %and77 = and i32 %60, -2
  store i32 %and77, i32* %attributes76, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.then75, %land.lhs.true71, %land.lhs.true70, %if.end66
  %61 = load i8*, i8** %value, align 4
  call void @sh_xfree(i8* %61, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 578)
  ret void
}

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare %struct.variable* @find_variable(i8*) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @parse_shellopts(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  %vname = alloca i8*, align 4
  %vptr = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 0, i32* %vptr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %value.addr, align 4
  %call = call i8* @extract_colon_unit(i8* %0, i32* %vptr)
  store i8* %call, i8** %vname, align 4
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** %vname, align 4
  %call1 = call i32 @set_minus_o_option(i32 45, i8* %1)
  %2 = load i8*, i8** %vname, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 592)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare i8* @extract_colon_unit(i8*, i32*) #1

; Function Attrs: noinline nounwind
define void @initialize_shell_options(i32 %no_shellopts) #0 {
entry:
  %no_shellopts.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i32 %no_shellopts, i32* %no_shellopts.addr, align 4
  %0 = load i32, i32* %no_shellopts.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end16

if.then:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.then
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 32768
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then2, label %if.end15

if.then2:                                         ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %5, 4
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then2
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %7, 64
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.then2
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 1
  %9 = load i8*, i8** %value, align 4
  %call9 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call9
  %call10 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 609)
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %value11 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 1
  %11 = load i8*, i8** %value11, align 4
  %call12 = call i8* @strcpy(i8* %call10, i8* %11)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ null, %cond.true ], [ %call12, %cond.false ]
  store i8* %cond, i8** %temp, align 4
  %12 = load i8*, i8** %temp, align 4
  %tobool13 = icmp ne i8* %12, null
  br i1 %tobool13, label %if.then14, label %if.end

if.then14:                                        ; preds = %cond.end
  %13 = load i8*, i8** %temp, align 4
  call void @parse_shellopts(i8* %13)
  %14 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 613)
  br label %if.end

if.end:                                           ; preds = %if.then14, %cond.end
  br label %if.end15

if.end15:                                         ; preds = %if.end, %land.lhs.true, %if.then
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %entry
  call void @set_shellopts()
  ret void
}

; Function Attrs: noinline nounwind
define void @reset_shell_options() #0 {
entry:
  store i32 0, i32* @pipefail_opt, align 4
  store i32 0, i32* @ignoreeof, align 4
  store i32 0, i32* @posixly_correct, align 4
  store i32 0, i32* @dont_save_function_defs, align 4
  store i32 1, i32* @enable_history_list, align 4
  store i32 1, i32* @remember_on_history, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @set_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %on_or_off = alloca i32, align 4
  %flag_name = alloca i32, align 4
  %force_assignment = alloca i32, align 4
  %opts_changed = alloca i32, align 4
  %rv = alloca i32, align 4
  %r = alloca i32, align 4
  %arg = alloca i8*, align 4
  %s = alloca [3 x i8], align 1
  %option_name = alloca i8*, align 4
  %opt = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @print_all_shell_variables()
  %call = call i32 @sh_chkwrite(i32 0)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %rv, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call1 = call i32 @internal_getopt(%struct.word_list* %1, i8* getelementptr inbounds ([0 x i8], [0 x i8]* @optflags, i32 0, i32 0))
  store i32 %call1, i32* %flag_name, align 4
  %cmp2 = icmp ne i32 %call1, -1
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %flag_name, align 4
  switch i32 %2, label %sw.default [
    i32 105, label %sw.bb
    i32 -99, label %sw.bb5
    i32 63, label %sw.bb6
  ]

sw.bb:                                            ; preds = %while.body
  %3 = load i32, i32* @list_opttype, align 4
  %conv = trunc i32 %3 to i8
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  %arrayidx3 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 1
  store i8 105, i8* %arrayidx3, align 1
  %arrayidx4 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 2
  store i8 0, i8* %arrayidx4, align 1
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 0
  call void @sh_invalidopt(i8* %arraydecay)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb5:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb6:                                           ; preds = %while.body
  call void @builtin_usage()
  %4 = load i32, i32* @list_optopt, align 4
  %cmp7 = icmp eq i32 %4, 63
  %cond = select i1 %cmp7, i32 0, i32 258
  store i32 %cond, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %opts_changed, align 4
  store i32 0, i32* %force_assignment, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end103, %while.end
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %5, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 1
  %7 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word9, align 4
  store i8* %8, i8** %arg, align 4
  %9 = load i8*, i8** %arg, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %10 to i32
  %cmp12 = icmp eq i32 %conv11, 45
  br i1 %cmp12, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %for.body
  %11 = load i8*, i8** %arg, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i32 1
  %12 = load i8, i8* %arrayidx14, align 1
  %tobool15 = icmp ne i8 %12, 0
  br i1 %tobool15, label %lor.lhs.false, label %if.then23

lor.lhs.false:                                    ; preds = %land.lhs.true
  %13 = load i8*, i8** %arg, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %14 to i32
  %cmp18 = icmp eq i32 %conv17, 45
  br i1 %cmp18, label %land.lhs.true20, label %if.end32

land.lhs.true20:                                  ; preds = %lor.lhs.false
  %15 = load i8*, i8** %arg, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %15, i32 2
  %16 = load i8, i8* %arrayidx21, align 1
  %tobool22 = icmp ne i8 %16, 0
  br i1 %tobool22, label %if.end32, label %if.then23

if.then23:                                        ; preds = %land.lhs.true20, %land.lhs.true
  %17 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %17, i32 0, i32 0
  %18 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %18, %struct.word_list** %list.addr, align 4
  %19 = load i8*, i8** %arg, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %19, i32 1
  %20 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %20 to i32
  %cmp26 = icmp eq i32 %conv25, 45
  br i1 %cmp26, label %if.then28, label %if.else

if.then28:                                        ; preds = %if.then23
  store i32 1, i32* %force_assignment, align 4
  br label %if.end31

if.else:                                          ; preds = %if.then23
  %call29 = call i32 @change_flag(i32 120, i32 43)
  %call30 = call i32 @change_flag(i32 118, i32 43)
  store i32 1, i32* %opts_changed, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then28
  br label %for.end

if.end32:                                         ; preds = %land.lhs.true20, %lor.lhs.false, %for.body
  %21 = load i8*, i8** %arg, align 4
  %22 = load i8, i8* %21, align 1
  %conv33 = sext i8 %22 to i32
  store i32 %conv33, i32* %on_or_off, align 4
  %tobool34 = icmp ne i32 %conv33, 0
  br i1 %tobool34, label %land.lhs.true35, label %if.else102

land.lhs.true35:                                  ; preds = %if.end32
  %23 = load i32, i32* %on_or_off, align 4
  %cmp36 = icmp eq i32 %23, 45
  br i1 %cmp36, label %if.then41, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %land.lhs.true35
  %24 = load i32, i32* %on_or_off, align 4
  %cmp39 = icmp eq i32 %24, 43
  br i1 %cmp39, label %if.then41, label %if.else102

if.then41:                                        ; preds = %lor.lhs.false38, %land.lhs.true35
  br label %while.cond42

while.cond42:                                     ; preds = %if.end100, %if.then77, %if.then56, %if.then41
  %25 = load i8*, i8** %arg, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr, i8** %arg, align 4
  %26 = load i8, i8* %incdec.ptr, align 1
  %conv43 = sext i8 %26 to i32
  store i32 %conv43, i32* %flag_name, align 4
  %tobool44 = icmp ne i32 %conv43, 0
  br i1 %tobool44, label %while.body45, label %while.end101

while.body45:                                     ; preds = %while.cond42
  %27 = load i32, i32* %flag_name, align 4
  %cmp46 = icmp eq i32 %27, 63
  br i1 %cmp46, label %if.then48, label %if.else49

if.then48:                                        ; preds = %while.body45
  call void @builtin_usage()
  store i32 0, i32* %retval, align 4
  br label %return

if.else49:                                        ; preds = %while.body45
  %28 = load i32, i32* %flag_name, align 4
  %cmp50 = icmp eq i32 %28, 111
  br i1 %cmp50, label %if.then52, label %if.else87

if.then52:                                        ; preds = %if.else49
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next53 = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 0
  %30 = load %struct.word_list*, %struct.word_list** %next53, align 4
  store %struct.word_list* %30, %struct.word_list** %opt, align 4
  %31 = load %struct.word_list*, %struct.word_list** %opt, align 4
  %cmp54 = icmp eq %struct.word_list* %31, null
  br i1 %cmp54, label %if.then56, label %if.end60

if.then56:                                        ; preds = %if.then52
  %32 = load i32, i32* %on_or_off, align 4
  %cmp57 = icmp eq i32 %32, 43
  %conv58 = zext i1 %cmp57 to i32
  call void @list_minus_o_opts(i32 -1, i32 %conv58)
  %33 = load i32, i32* %rv, align 4
  %call59 = call i32 @sh_chkwrite(i32 %33)
  store i32 %call59, i32* %rv, align 4
  br label %while.cond42

if.end60:                                         ; preds = %if.then52
  %34 = load %struct.word_list*, %struct.word_list** %opt, align 4
  %word61 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word61, align 4
  %word62 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %35, i32 0, i32 0
  %36 = load i8*, i8** %word62, align 4
  store i8* %36, i8** %option_name, align 4
  %37 = load i8*, i8** %option_name, align 4
  %cmp63 = icmp eq i8* %37, null
  br i1 %cmp63, label %if.then77, label %lor.lhs.false65

lor.lhs.false65:                                  ; preds = %if.end60
  %38 = load i8*, i8** %option_name, align 4
  %39 = load i8, i8* %38, align 1
  %conv66 = sext i8 %39 to i32
  %cmp67 = icmp eq i32 %conv66, 0
  br i1 %cmp67, label %if.then77, label %lor.lhs.false69

lor.lhs.false69:                                  ; preds = %lor.lhs.false65
  %40 = load i8*, i8** %option_name, align 4
  %41 = load i8, i8* %40, align 1
  %conv70 = sext i8 %41 to i32
  %cmp71 = icmp eq i32 %conv70, 45
  br i1 %cmp71, label %if.then77, label %lor.lhs.false73

lor.lhs.false73:                                  ; preds = %lor.lhs.false69
  %42 = load i8*, i8** %option_name, align 4
  %43 = load i8, i8* %42, align 1
  %conv74 = sext i8 %43 to i32
  %cmp75 = icmp eq i32 %conv74, 43
  br i1 %cmp75, label %if.then77, label %if.end80

if.then77:                                        ; preds = %lor.lhs.false73, %lor.lhs.false69, %lor.lhs.false65, %if.end60
  %44 = load i32, i32* %on_or_off, align 4
  %cmp78 = icmp eq i32 %44, 43
  %conv79 = zext i1 %cmp78 to i32
  call void @list_minus_o_opts(i32 -1, i32 %conv79)
  br label %while.cond42

if.end80:                                         ; preds = %lor.lhs.false73
  %45 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next81 = getelementptr inbounds %struct.word_list, %struct.word_list* %45, i32 0, i32 0
  %46 = load %struct.word_list*, %struct.word_list** %next81, align 4
  store %struct.word_list* %46, %struct.word_list** %list.addr, align 4
  store i32 1, i32* %opts_changed, align 4
  %47 = load i32, i32* %on_or_off, align 4
  %48 = load i8*, i8** %option_name, align 4
  %call82 = call i32 @set_minus_o_option(i32 %47, i8* %48)
  store i32 %call82, i32* %r, align 4
  %cmp83 = icmp ne i32 %call82, 0
  br i1 %cmp83, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end80
  call void @set_shellopts()
  %49 = load i32, i32* %r, align 4
  store i32 %49, i32* %retval, align 4
  br label %return

if.end86:                                         ; preds = %if.end80
  br label %if.end99

if.else87:                                        ; preds = %if.else49
  %50 = load i32, i32* %flag_name, align 4
  %51 = load i32, i32* %on_or_off, align 4
  %call88 = call i32 @change_flag(i32 %50, i32 %51)
  %cmp89 = icmp eq i32 %call88, -1
  br i1 %cmp89, label %if.then91, label %if.end98

if.then91:                                        ; preds = %if.else87
  %52 = load i32, i32* %on_or_off, align 4
  %conv92 = trunc i32 %52 to i8
  %arrayidx93 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 0
  store i8 %conv92, i8* %arrayidx93, align 1
  %53 = load i32, i32* %flag_name, align 4
  %conv94 = trunc i32 %53 to i8
  %arrayidx95 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 1
  store i8 %conv94, i8* %arrayidx95, align 1
  %arrayidx96 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 2
  store i8 0, i8* %arrayidx96, align 1
  %arraydecay97 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 0
  call void @sh_invalidopt(i8* %arraydecay97)
  call void @builtin_usage()
  call void @set_shellopts()
  store i32 1, i32* %retval, align 4
  br label %return

if.end98:                                         ; preds = %if.else87
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.end86
  br label %if.end100

if.end100:                                        ; preds = %if.end99
  store i32 1, i32* %opts_changed, align 4
  br label %while.cond42

while.end101:                                     ; preds = %while.cond42
  br label %if.end103

if.else102:                                       ; preds = %lor.lhs.false38, %if.end32
  br label %for.end

if.end103:                                        ; preds = %while.end101
  %54 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next104 = getelementptr inbounds %struct.word_list, %struct.word_list* %54, i32 0, i32 0
  %55 = load %struct.word_list*, %struct.word_list** %next104, align 4
  store %struct.word_list* %55, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %if.else102, %if.end31, %for.cond
  %56 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool105 = icmp ne %struct.word_list* %56, null
  br i1 %tobool105, label %if.then108, label %lor.lhs.false106

lor.lhs.false106:                                 ; preds = %for.end
  %57 = load i32, i32* %force_assignment, align 4
  %tobool107 = icmp ne i32 %57, 0
  br i1 %tobool107, label %if.then108, label %if.end109

if.then108:                                       ; preds = %lor.lhs.false106, %for.end
  %58 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  call void @remember_args(%struct.word_list* %58, i32 1)
  br label %if.end109

if.end109:                                        ; preds = %if.then108, %lor.lhs.false106
  %59 = load i32, i32* %opts_changed, align 4
  %tobool110 = icmp ne i32 %59, 0
  br i1 %tobool110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end109
  call void @set_shellopts()
  br label %if.end112

if.end112:                                        ; preds = %if.then111, %if.end109
  %60 = load i32, i32* %rv, align 4
  store i32 %60, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end112, %if.then91, %if.then85, %if.then48, %sw.bb6, %sw.bb5, %sw.bb, %if.then
  %61 = load i32, i32* %retval, align 4
  ret i32 %61
}

; Function Attrs: noinline nounwind
define internal void @print_all_shell_variables() #0 {
entry:
  %vars = alloca %struct.variable**, align 4
  %call = call %struct.variable** @all_shell_variables()
  store %struct.variable** %call, %struct.variable*** %vars, align 4
  %0 = load %struct.variable**, %struct.variable*** %vars, align 4
  %tobool = icmp ne %struct.variable** %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.variable**, %struct.variable*** %vars, align 4
  call void @print_var_list(%struct.variable** %1)
  %2 = load %struct.variable**, %struct.variable*** %vars, align 4
  %3 = bitcast %struct.variable** %2 to i8*
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 498)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* @posixly_correct, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then1, label %if.end6

if.then1:                                         ; preds = %if.end
  %call2 = call %struct.variable** @all_shell_functions()
  store %struct.variable** %call2, %struct.variable*** %vars, align 4
  %5 = load %struct.variable**, %struct.variable*** %vars, align 4
  %tobool3 = icmp ne %struct.variable** %5, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then1
  %6 = load %struct.variable**, %struct.variable*** %vars, align 4
  call void @print_func_list(%struct.variable** %6)
  %7 = load %struct.variable**, %struct.variable*** %vars, align 4
  %8 = bitcast %struct.variable** %7 to i8*
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 509)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.then1
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  ret void
}

declare i32 @sh_chkwrite(i32) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @sh_invalidopt(i8*) #1

declare void @builtin_usage() #1

declare void @builtin_help() #1

declare void @remember_args(%struct.word_list*, i32) #1

; Function Attrs: noinline nounwind
define i32 @unset_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %unset_function = alloca i32, align 4
  %unset_variable = alloca i32, align 4
  %unset_array = alloca i32, align 4
  %opt = alloca i32, align 4
  %nameref = alloca i32, align 4
  %any_failed = alloca i32, align 4
  %global_unset_func = alloca i32, align 4
  %global_unset_var = alloca i32, align 4
  %name = alloca i8*, align 4
  %tname = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %tem = alloca i32, align 4
  %t = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %any_failed, align 4
  store i32 0, i32* %nameref, align 4
  store i32 0, i32* %unset_array, align 4
  store i32 0, i32* %unset_variable, align 4
  store i32 0, i32* %unset_function, align 4
  store i32 0, i32* %global_unset_var, align 4
  store i32 0, i32* %global_unset_func, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 102, label %sw.bb
    i32 118, label %sw.bb1
    i32 110, label %sw.bb2
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %global_unset_func, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 1, i32* %global_unset_var, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  store i32 1, i32* %nameref, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb2, %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %2, %struct.word_list** %list.addr, align 4
  %3 = load i32, i32* %global_unset_func, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.end
  %4 = load i32, i32* %global_unset_var, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %call5 = call i8* @libintl_gettext(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.28, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call5)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %while.end
  %5 = load i32, i32* %unset_function, align 4
  %tobool6 = icmp ne i32 %5, 0
  br i1 %tobool6, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %if.else
  %6 = load i32, i32* %nameref, align 4
  %tobool8 = icmp ne i32 %6, 0
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %land.lhs.true7
  store i32 0, i32* %nameref, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %land.lhs.true7, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end
  br label %while.cond11

while.cond11:                                     ; preds = %if.end204, %if.then120, %if.then95, %if.then48, %if.then31, %if.end10
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool12 = icmp ne %struct.word_list* %7, null
  br i1 %tobool12, label %while.body13, label %while.end206

while.body13:                                     ; preds = %while.cond11
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word14, align 4
  store i8* %10, i8** %name, align 4
  %11 = load i32, i32* %global_unset_func, align 4
  store i32 %11, i32* %unset_function, align 4
  %12 = load i32, i32* %global_unset_var, align 4
  store i32 %12, i32* %unset_variable, align 4
  store i32 0, i32* %unset_array, align 4
  %13 = load i32, i32* %unset_function, align 4
  %tobool15 = icmp ne i32 %13, 0
  br i1 %tobool15, label %if.end23, label %land.lhs.true16

land.lhs.true16:                                  ; preds = %while.body13
  %14 = load i32, i32* %nameref, align 4
  %cmp17 = icmp eq i32 %14, 0
  br i1 %cmp17, label %land.lhs.true18, label %if.end23

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %15 = load i8*, i8** %name, align 4
  %call19 = call i32 @valid_array_reference(i8* %15, i32 0)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %land.lhs.true18
  %16 = load i8*, i8** %name, align 4
  %call22 = call i8* @strchr(i8* %16, i32 91)
  store i8* %call22, i8** %t, align 4
  %17 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  store i8 0, i8* %17, align 1
  %18 = load i32, i32* %unset_array, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %unset_array, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %land.lhs.true18, %land.lhs.true16, %while.body13
  %19 = load i32, i32* %unset_function, align 4
  %tobool24 = icmp ne i32 %19, 0
  br i1 %tobool24, label %land.lhs.true25, label %lor.lhs.false

land.lhs.true25:                                  ; preds = %if.end23
  %20 = load i32, i32* @posixly_correct, align 4
  %tobool26 = icmp ne i32 %20, 0
  br i1 %tobool26, label %land.lhs.true28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true25, %if.end23
  %21 = load i32, i32* %unset_function, align 4
  %tobool27 = icmp ne i32 %21, 0
  br i1 %tobool27, label %if.end33, label %land.lhs.true28

land.lhs.true28:                                  ; preds = %lor.lhs.false, %land.lhs.true25
  %22 = load i8*, i8** %name, align 4
  %call29 = call i32 @legal_identifier(i8* %22)
  %cmp30 = icmp eq i32 %call29, 0
  br i1 %cmp30, label %if.then31, label %if.end33

if.then31:                                        ; preds = %land.lhs.true28
  %23 = load i8*, i8** %name, align 4
  call void @sh_invalidid(i8* %23)
  %24 = load i32, i32* %any_failed, align 4
  %inc32 = add nsw i32 %24, 1
  store i32 %inc32, i32* %any_failed, align 4
  %25 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 0
  %26 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %26, %struct.word_list** %list.addr, align 4
  br label %while.cond11

if.end33:                                         ; preds = %land.lhs.true28, %lor.lhs.false
  %27 = load i32, i32* %unset_function, align 4
  %tobool34 = icmp ne i32 %27, 0
  br i1 %tobool34, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end33
  %28 = load i8*, i8** %name, align 4
  %call35 = call %struct.variable* @find_function(i8* %28)
  br label %cond.end41

cond.false:                                       ; preds = %if.end33
  %29 = load i32, i32* %nameref, align 4
  %tobool36 = icmp ne i32 %29, 0
  br i1 %tobool36, label %cond.true37, label %cond.false39

cond.true37:                                      ; preds = %cond.false
  %30 = load i8*, i8** %name, align 4
  %call38 = call %struct.variable* @find_variable_last_nameref(i8* %30, i32 0)
  br label %cond.end

cond.false39:                                     ; preds = %cond.false
  %31 = load i8*, i8** %name, align 4
  %call40 = call %struct.variable* @find_variable(i8* %31)
  br label %cond.end

cond.end:                                         ; preds = %cond.false39, %cond.true37
  %cond = phi %struct.variable* [ %call38, %cond.true37 ], [ %call40, %cond.false39 ]
  br label %cond.end41

cond.end41:                                       ; preds = %cond.end, %cond.true
  %cond42 = phi %struct.variable* [ %call35, %cond.true ], [ %cond, %cond.end ]
  store %struct.variable* %cond42, %struct.variable** %var, align 4
  %32 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool43 = icmp ne %struct.variable* %32, null
  br i1 %tobool43, label %land.lhs.true44, label %if.end52

land.lhs.true44:                                  ; preds = %cond.end41
  %33 = load i32, i32* %unset_function, align 4
  %cmp45 = icmp eq i32 %33, 0
  br i1 %cmp45, label %land.lhs.true46, label %if.end52

land.lhs.true46:                                  ; preds = %land.lhs.true44
  %34 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 5
  %35 = load i32, i32* %attributes, align 4
  %and = and i32 %35, 8192
  %tobool47 = icmp ne i32 %and, 0
  br i1 %tobool47, label %if.then48, label %if.end52

if.then48:                                        ; preds = %land.lhs.true46
  %call49 = call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.29, i32 0, i32 0))
  %36 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call49, i8* %36)
  %37 = load i32, i32* %any_failed, align 4
  %inc50 = add nsw i32 %37, 1
  store i32 %inc50, i32* %any_failed, align 4
  %38 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next51 = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 0
  %39 = load %struct.word_list*, %struct.word_list** %next51, align 4
  store %struct.word_list* %39, %struct.word_list** %list.addr, align 4
  br label %while.cond11

if.end52:                                         ; preds = %land.lhs.true46, %land.lhs.true44, %cond.end41
  %40 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool53 = icmp ne %struct.variable* %40, null
  br i1 %tobool53, label %land.lhs.true54, label %if.end72

land.lhs.true54:                                  ; preds = %if.end52
  %41 = load i32, i32* %unset_function, align 4
  %cmp55 = icmp eq i32 %41, 0
  br i1 %cmp55, label %land.lhs.true56, label %if.end72

land.lhs.true56:                                  ; preds = %land.lhs.true54
  %42 = load i32, i32* %nameref, align 4
  %cmp57 = icmp eq i32 %42, 0
  br i1 %cmp57, label %land.lhs.true58, label %if.end72

land.lhs.true58:                                  ; preds = %land.lhs.true56
  %43 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %43, i32 0
  %44 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %44 to i32
  %45 = load %struct.variable*, %struct.variable** %var, align 4
  %name59 = getelementptr inbounds %struct.variable, %struct.variable* %45, i32 0, i32 0
  %46 = load i8*, i8** %name59, align 4
  %arrayidx60 = getelementptr inbounds i8, i8* %46, i32 0
  %47 = load i8, i8* %arrayidx60, align 1
  %conv61 = sext i8 %47 to i32
  %cmp62 = icmp eq i32 %conv, %conv61
  br i1 %cmp62, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true58
  %48 = load i8*, i8** %name, align 4
  %49 = load %struct.variable*, %struct.variable** %var, align 4
  %name64 = getelementptr inbounds %struct.variable, %struct.variable* %49, i32 0, i32 0
  %50 = load i8*, i8** %name64, align 4
  %call65 = call i32 @strcmp(i8* %48, i8* %50)
  %cmp66 = icmp eq i32 %call65, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true58
  %51 = phi i1 [ false, %land.lhs.true58 ], [ %cmp66, %land.rhs ]
  %land.ext = zext i1 %51 to i32
  %cmp68 = icmp eq i32 %land.ext, 0
  br i1 %cmp68, label %if.then70, label %if.end72

if.then70:                                        ; preds = %land.end
  %52 = load %struct.variable*, %struct.variable** %var, align 4
  %name71 = getelementptr inbounds %struct.variable, %struct.variable* %52, i32 0, i32 0
  %53 = load i8*, i8** %name71, align 4
  store i8* %53, i8** %name, align 4
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %land.end, %land.lhs.true56, %land.lhs.true54, %if.end52
  %54 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp73 = icmp eq %struct.variable* %54, null
  br i1 %cmp73, label %land.lhs.true75, label %if.end89

land.lhs.true75:                                  ; preds = %if.end72
  %55 = load i32, i32* %nameref, align 4
  %cmp76 = icmp eq i32 %55, 0
  br i1 %cmp76, label %land.lhs.true78, label %if.end89

land.lhs.true78:                                  ; preds = %land.lhs.true75
  %56 = load i32, i32* %unset_variable, align 4
  %cmp79 = icmp eq i32 %56, 0
  br i1 %cmp79, label %land.lhs.true81, label %if.end89

land.lhs.true81:                                  ; preds = %land.lhs.true78
  %57 = load i32, i32* %unset_function, align 4
  %cmp82 = icmp eq i32 %57, 0
  br i1 %cmp82, label %if.then84, label %if.end89

if.then84:                                        ; preds = %land.lhs.true81
  %58 = load i8*, i8** %name, align 4
  %call85 = call %struct.variable* @find_function(i8* %58)
  store %struct.variable* %call85, %struct.variable** %var, align 4
  %tobool86 = icmp ne %struct.variable* %call85, null
  br i1 %tobool86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.then84
  store i32 1, i32* %unset_function, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.then84
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %land.lhs.true81, %land.lhs.true78, %land.lhs.true75, %if.end72
  %59 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool90 = icmp ne %struct.variable* %59, null
  br i1 %tobool90, label %land.lhs.true91, label %if.end102

land.lhs.true91:                                  ; preds = %if.end89
  %60 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes92 = getelementptr inbounds %struct.variable, %struct.variable* %60, i32 0, i32 5
  %61 = load i32, i32* %attributes92, align 4
  %and93 = and i32 %61, 2
  %tobool94 = icmp ne i32 %and93, 0
  br i1 %tobool94, label %if.then95, label %if.end102

if.then95:                                        ; preds = %land.lhs.true91
  %call96 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.30, i32 0, i32 0))
  %62 = load %struct.variable*, %struct.variable** %var, align 4
  %name97 = getelementptr inbounds %struct.variable, %struct.variable* %62, i32 0, i32 0
  %63 = load i8*, i8** %name97, align 4
  %64 = load i32, i32* %unset_function, align 4
  %tobool98 = icmp ne i32 %64, 0
  %cond99 = select i1 %tobool98, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.32, i32 0, i32 0)
  call void (i8*, ...) @builtin_error(i8* %call96, i8* %63, i8* %cond99)
  %65 = load i32, i32* %any_failed, align 4
  %inc100 = add nsw i32 %65, 1
  store i32 %inc100, i32* %any_failed, align 4
  %66 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next101 = getelementptr inbounds %struct.word_list, %struct.word_list* %66, i32 0, i32 0
  %67 = load %struct.word_list*, %struct.word_list** %next101, align 4
  store %struct.word_list* %67, %struct.word_list** %list.addr, align 4
  br label %while.cond11

if.end102:                                        ; preds = %land.lhs.true91, %if.end89
  %68 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool103 = icmp ne %struct.variable* %68, null
  br i1 %tobool103, label %land.lhs.true104, label %if.else132

land.lhs.true104:                                 ; preds = %if.end102
  %69 = load i32, i32* %unset_array, align 4
  %tobool105 = icmp ne i32 %69, 0
  br i1 %tobool105, label %if.then106, label %if.else132

if.then106:                                       ; preds = %land.lhs.true104
  %70 = load %struct.variable*, %struct.variable** %var, align 4
  %71 = load i8*, i8** %t, align 4
  %call107 = call i32 @unbind_array_element(%struct.variable* %70, i8* %71)
  store i32 %call107, i32* %tem, align 4
  %72 = load i32, i32* %tem, align 4
  %cmp108 = icmp eq i32 %72, -2
  br i1 %cmp108, label %land.lhs.true110, label %if.else125

land.lhs.true110:                                 ; preds = %if.then106
  %73 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes111 = getelementptr inbounds %struct.variable, %struct.variable* %73, i32 0, i32 5
  %74 = load i32, i32* %attributes111, align 4
  %and112 = and i32 %74, 4
  %cmp113 = icmp eq i32 %and112, 0
  br i1 %cmp113, label %land.lhs.true115, label %if.else125

land.lhs.true115:                                 ; preds = %land.lhs.true110
  %75 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes116 = getelementptr inbounds %struct.variable, %struct.variable* %75, i32 0, i32 5
  %76 = load i32, i32* %attributes116, align 4
  %and117 = and i32 %76, 64
  %cmp118 = icmp eq i32 %and117, 0
  br i1 %cmp118, label %if.then120, label %if.else125

if.then120:                                       ; preds = %land.lhs.true115
  %call121 = call i8* @libintl_gettext(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.33, i32 0, i32 0))
  %77 = load %struct.variable*, %struct.variable** %var, align 4
  %name122 = getelementptr inbounds %struct.variable, %struct.variable* %77, i32 0, i32 0
  %78 = load i8*, i8** %name122, align 4
  call void (i8*, ...) @builtin_error(i8* %call121, i8* %78)
  %79 = load i32, i32* %any_failed, align 4
  %inc123 = add nsw i32 %79, 1
  store i32 %inc123, i32* %any_failed, align 4
  %80 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next124 = getelementptr inbounds %struct.word_list, %struct.word_list* %80, i32 0, i32 0
  %81 = load %struct.word_list*, %struct.word_list** %next124, align 4
  store %struct.word_list* %81, %struct.word_list** %list.addr, align 4
  br label %while.cond11

if.else125:                                       ; preds = %land.lhs.true115, %land.lhs.true110, %if.then106
  %82 = load i32, i32* %tem, align 4
  %cmp126 = icmp slt i32 %82, 0
  br i1 %cmp126, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.else125
  %83 = load i32, i32* %any_failed, align 4
  %inc129 = add nsw i32 %83, 1
  store i32 %inc129, i32* %any_failed, align 4
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.else125
  br label %if.end131

if.end131:                                        ; preds = %if.end130
  br label %if.end184

if.else132:                                       ; preds = %land.lhs.true104, %if.end102
  %84 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp133 = icmp eq %struct.variable* %84, null
  br i1 %cmp133, label %land.lhs.true135, label %if.else169

land.lhs.true135:                                 ; preds = %if.else132
  %85 = load i32, i32* %nameref, align 4
  %cmp136 = icmp eq i32 %85, 0
  br i1 %cmp136, label %land.lhs.true138, label %if.else169

land.lhs.true138:                                 ; preds = %land.lhs.true135
  %86 = load i32, i32* %unset_function, align 4
  %cmp139 = icmp eq i32 %86, 0
  br i1 %cmp139, label %if.then141, label %if.else169

if.then141:                                       ; preds = %land.lhs.true138
  %87 = load i8*, i8** %name, align 4
  %call142 = call %struct.variable* @find_variable_last_nameref(i8* %87, i32 0)
  store %struct.variable* %call142, %struct.variable** %var, align 4
  %88 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool143 = icmp ne %struct.variable* %88, null
  br i1 %tobool143, label %land.lhs.true144, label %if.else166

land.lhs.true144:                                 ; preds = %if.then141
  %89 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes145 = getelementptr inbounds %struct.variable, %struct.variable* %89, i32 0, i32 5
  %90 = load i32, i32* %attributes145, align 4
  %and146 = and i32 %90, 2048
  %tobool147 = icmp ne i32 %and146, 0
  br i1 %tobool147, label %if.then148, label %if.else166

if.then148:                                       ; preds = %land.lhs.true144
  %91 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %91, i32 0, i32 1
  %92 = load i8*, i8** %value, align 4
  %call149 = call i32 @valid_array_reference(i8* %92, i32 0)
  %tobool150 = icmp ne i32 %call149, 0
  br i1 %tobool150, label %if.then151, label %if.else162

if.then151:                                       ; preds = %if.then148
  %93 = load %struct.variable*, %struct.variable** %var, align 4
  %value152 = getelementptr inbounds %struct.variable, %struct.variable* %93, i32 0, i32 1
  %94 = load i8*, i8** %value152, align 4
  %call153 = call i32 @strlen(i8* %94)
  %add = add i32 1, %call153
  %call154 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 940)
  %95 = load %struct.variable*, %struct.variable** %var, align 4
  %value155 = getelementptr inbounds %struct.variable, %struct.variable* %95, i32 0, i32 1
  %96 = load i8*, i8** %value155, align 4
  %call156 = call i8* @strcpy(i8* %call154, i8* %96)
  store i8* %call156, i8** %tname, align 4
  %97 = load i8*, i8** %tname, align 4
  %call157 = call %struct.variable* @array_variable_part(i8* %97, i8** %t, i32* null)
  store %struct.variable* %call157, %struct.variable** %var, align 4
  %tobool158 = icmp ne %struct.variable* %call157, null
  br i1 %tobool158, label %if.then159, label %if.end161

if.then159:                                       ; preds = %if.then151
  %98 = load %struct.variable*, %struct.variable** %var, align 4
  %99 = load i8*, i8** %t, align 4
  %call160 = call i32 @unbind_array_element(%struct.variable* %98, i8* %99)
  store i32 %call160, i32* %tem, align 4
  br label %if.end161

if.end161:                                        ; preds = %if.then159, %if.then151
  %100 = load i8*, i8** %tname, align 4
  call void @sh_xfree(i8* %100, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.25, i32 0, i32 0), i32 943)
  br label %if.end165

if.else162:                                       ; preds = %if.then148
  %101 = load %struct.variable*, %struct.variable** %var, align 4
  %value163 = getelementptr inbounds %struct.variable, %struct.variable* %101, i32 0, i32 1
  %102 = load i8*, i8** %value163, align 4
  %call164 = call i32 @unbind_variable(i8* %102)
  store i32 %call164, i32* %tem, align 4
  br label %if.end165

if.end165:                                        ; preds = %if.else162, %if.end161
  br label %if.end168

if.else166:                                       ; preds = %land.lhs.true144, %if.then141
  %103 = load i8*, i8** %name, align 4
  %call167 = call i32 @unbind_variable(i8* %103)
  store i32 %call167, i32* %tem, align 4
  br label %if.end168

if.end168:                                        ; preds = %if.else166, %if.end165
  br label %if.end183

if.else169:                                       ; preds = %land.lhs.true138, %land.lhs.true135, %if.else132
  %104 = load i32, i32* %unset_function, align 4
  %tobool170 = icmp ne i32 %104, 0
  br i1 %tobool170, label %cond.true171, label %cond.false173

cond.true171:                                     ; preds = %if.else169
  %105 = load i8*, i8** %name, align 4
  %call172 = call i32 @unbind_func(i8* %105)
  br label %cond.end181

cond.false173:                                    ; preds = %if.else169
  %106 = load i32, i32* %nameref, align 4
  %tobool174 = icmp ne i32 %106, 0
  br i1 %tobool174, label %cond.true175, label %cond.false177

cond.true175:                                     ; preds = %cond.false173
  %107 = load i8*, i8** %name, align 4
  %call176 = call i32 @unbind_nameref(i8* %107)
  br label %cond.end179

cond.false177:                                    ; preds = %cond.false173
  %108 = load i8*, i8** %name, align 4
  %call178 = call i32 @unbind_variable(i8* %108)
  br label %cond.end179

cond.end179:                                      ; preds = %cond.false177, %cond.true175
  %cond180 = phi i32 [ %call176, %cond.true175 ], [ %call178, %cond.false177 ]
  br label %cond.end181

cond.end181:                                      ; preds = %cond.end179, %cond.true171
  %cond182 = phi i32 [ %call172, %cond.true171 ], [ %cond180, %cond.end179 ]
  store i32 %cond182, i32* %tem, align 4
  br label %if.end183

if.end183:                                        ; preds = %cond.end181, %if.end168
  br label %if.end184

if.end184:                                        ; preds = %if.end183, %if.end131
  %109 = load i32, i32* %tem, align 4
  %cmp185 = icmp eq i32 %109, -1
  br i1 %cmp185, label %land.lhs.true187, label %if.end198

land.lhs.true187:                                 ; preds = %if.end184
  %110 = load i32, i32* %nameref, align 4
  %cmp188 = icmp eq i32 %110, 0
  br i1 %cmp188, label %land.lhs.true190, label %if.end198

land.lhs.true190:                                 ; preds = %land.lhs.true187
  %111 = load i32, i32* %unset_function, align 4
  %cmp191 = icmp eq i32 %111, 0
  br i1 %cmp191, label %land.lhs.true193, label %if.end198

land.lhs.true193:                                 ; preds = %land.lhs.true190
  %112 = load i32, i32* %unset_variable, align 4
  %cmp194 = icmp eq i32 %112, 0
  br i1 %cmp194, label %if.then196, label %if.end198

if.then196:                                       ; preds = %land.lhs.true193
  %113 = load i8*, i8** %name, align 4
  %call197 = call i32 @unbind_func(i8* %113)
  store i32 %call197, i32* %tem, align 4
  br label %if.end198

if.end198:                                        ; preds = %if.then196, %land.lhs.true193, %land.lhs.true190, %land.lhs.true187, %if.end184
  %114 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word199 = getelementptr inbounds %struct.word_list, %struct.word_list* %114, i32 0, i32 1
  %115 = load %struct.word_desc*, %struct.word_desc** %word199, align 4
  %word200 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %115, i32 0, i32 0
  %116 = load i8*, i8** %word200, align 4
  store i8* %116, i8** %name, align 4
  %117 = load i32, i32* %unset_function, align 4
  %cmp201 = icmp eq i32 %117, 0
  br i1 %cmp201, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end198
  %118 = load i8*, i8** %name, align 4
  call void @stupidly_hack_special_variables(i8* %118)
  br label %if.end204

if.end204:                                        ; preds = %if.then203, %if.end198
  %119 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next205 = getelementptr inbounds %struct.word_list, %struct.word_list* %119, i32 0, i32 0
  %120 = load %struct.word_list*, %struct.word_list** %next205, align 4
  store %struct.word_list* %120, %struct.word_list** %list.addr, align 4
  br label %while.cond11

while.end206:                                     ; preds = %while.cond11
  %121 = load i32, i32* %any_failed, align 4
  %tobool207 = icmp ne i32 %121, 0
  %cond208 = select i1 %tobool207, i32 1, i32 0
  store i32 %cond208, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end206, %if.then, %sw.default, %sw.bb3
  %122 = load i32, i32* %retval, align 4
  ret i32 %122
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @valid_array_reference(i8*, i32) #1

declare i8* @strchr(i8*, i32) #1

declare i32 @legal_identifier(i8*) #1

declare void @sh_invalidid(i8*) #1

declare %struct.variable* @find_function(i8*) #1

declare %struct.variable* @find_variable_last_nameref(i8*, i32) #1

declare i32 @unbind_array_element(%struct.variable*, i8*) #1

declare %struct.variable* @array_variable_part(i8*, i8**, i32*) #1

declare i32 @unbind_variable(i8*) #1

declare i32 @unbind_func(i8*) #1

declare i32 @unbind_nameref(i8*) #1

declare void @stupidly_hack_special_variables(i8*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @unbind_variable_noref(i8*) #1

declare void @sv_ignoreeof(i8*) #1

declare void @sv_strict_posix(i8*) #1

declare i32 @rl_variable_bind(i8*, i8*) #1

declare void @with_input_from_stdin() #1

declare void @with_input_from_stream(%struct._IO_FILE*, i8*) #1

declare void @bash_history_enable() #1

declare void @load_history() #1

declare void @bash_history_disable() #1

declare %struct.variable** @all_shell_variables() #1

declare void @print_var_list(%struct.variable**) #1

declare %struct.variable** @all_shell_functions() #1

declare void @print_func_list(%struct.variable**) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
