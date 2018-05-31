; ModuleID = 'flags.c'
source_filename = "flags.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.flags_alist = type { i8, i32* }

@mark_modified_vars = global i32 0, align 4
@asynchronous_notification = global i32 0, align 4
@errexit_flag = global i32 0, align 4
@exit_immediately_on_error = global i32 0, align 4
@disallow_filename_globbing = global i32 0, align 4
@place_keywords_in_env = global i32 0, align 4
@read_but_dont_execute = global i32 0, align 4
@just_one_command = global i32 0, align 4
@noclobber = global i32 0, align 4
@unbound_vars_is_error = global i32 0, align 4
@echo_input_at_read = global i32 0, align 4
@verbose_flag = global i32 0, align 4
@echo_command_at_execute = global i32 0, align 4
@jobs_m_flag = global i32 0, align 4
@forced_interactive = global i32 0, align 4
@no_symbolic_links = global i32 0, align 4
@no_invisible_vars = global i32 0, align 4
@hashing_enabled = global i32 1, align 4
@history_expansion = global i32 1, align 4
@interactive_comments = global i32 1, align 4
@restricted = global i32 0, align 4
@restricted_shell = global i32 0, align 4
@privileged_mode = global i32 0, align 4
@brace_expansion = global i32 1, align 4
@function_trace_mode = global i32 0, align 4
@error_trace_mode = global i32 0, align 4
@pipefail_opt = global i32 0, align 4
@shell_flags = constant [21 x %struct.flags_alist] [%struct.flags_alist { i8 97, i32* @mark_modified_vars }, %struct.flags_alist { i8 101, i32* @errexit_flag }, %struct.flags_alist { i8 102, i32* @disallow_filename_globbing }, %struct.flags_alist { i8 104, i32* @hashing_enabled }, %struct.flags_alist { i8 105, i32* @forced_interactive }, %struct.flags_alist { i8 107, i32* @place_keywords_in_env }, %struct.flags_alist { i8 110, i32* @read_but_dont_execute }, %struct.flags_alist { i8 112, i32* @privileged_mode }, %struct.flags_alist { i8 114, i32* @restricted }, %struct.flags_alist { i8 116, i32* @just_one_command }, %struct.flags_alist { i8 117, i32* @unbound_vars_is_error }, %struct.flags_alist { i8 118, i32* @verbose_flag }, %struct.flags_alist { i8 120, i32* @echo_command_at_execute }, %struct.flags_alist { i8 66, i32* @brace_expansion }, %struct.flags_alist { i8 67, i32* @noclobber }, %struct.flags_alist { i8 69, i32* @error_trace_mode }, %struct.flags_alist { i8 72, i32* @history_expansion }, %struct.flags_alist { i8 73, i32* @no_invisible_vars }, %struct.flags_alist { i8 80, i32* @no_symbolic_links }, %struct.flags_alist { i8 84, i32* @function_trace_mode }, %struct.flags_alist zeroinitializer], align 4
@optflags = global [25 x i8] c"+\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@builtin_ignoring_errexit = external global i32, align 4
@interactive_shell = external global i32, align 4
@shell_initialized = external global i32, align 4
@shell_name = external global i8*, align 4
@read_from_stdin = external global i32, align 4
@want_pending_command = external global i32, align 4
@.str = private unnamed_addr constant [8 x i8] c"flags.c\00", align 1

; Function Attrs: noinline nounwind
define i32* @find_flag(i32 %name) #0 {
entry:
  %retval = alloca i32*, align 4
  %name.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %name, i32* %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx, i32 0, i32 0
  %1 = load i8, i8* %name1, align 4
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %2
  %name3 = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx2, i32 0, i32 0
  %3 = load i8, i8* %name3, align 4
  %conv = sext i8 %3 to i32
  %4 = load i32, i32* %name.addr, align 4
  %cmp = icmp eq i32 %conv, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %5
  %value = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx5, i32 0, i32 1
  %6 = load i32*, i32** %value, align 4
  store i32* %6, i32** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32* null, i32** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32*, i32** %retval, align 4
  ret i32* %8
}

; Function Attrs: noinline nounwind
define i32 @change_flag(i32 %flag, i32 %on_or_off) #0 {
entry:
  %retval = alloca i32, align 4
  %flag.addr = alloca i32, align 4
  %on_or_off.addr = alloca i32, align 4
  %value = alloca i32*, align 4
  %old_value = alloca i32, align 4
  store i32 %flag, i32* %flag.addr, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  %0 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %flag.addr, align 4
  %cmp = icmp eq i32 %1, 114
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* %on_or_off.addr, align 4
  %cmp2 = icmp eq i32 %2, 43
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true1
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true1, %land.lhs.true, %entry
  %3 = load i32, i32* %flag.addr, align 4
  %call = call i32* @find_flag(i32 %3)
  store i32* %call, i32** %value, align 4
  %4 = load i32*, i32** %value, align 4
  %cmp3 = icmp eq i32* %4, null
  br i1 %cmp3, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i32, i32* %on_or_off.addr, align 4
  %cmp4 = icmp ne i32 %5, 45
  br i1 %cmp4, label %land.lhs.true5, label %if.end8

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %6 = load i32, i32* %on_or_off.addr, align 4
  %cmp6 = icmp ne i32 %6, 43
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %land.lhs.true5, %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  %7 = load i32*, i32** %value, align 4
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %old_value, align 4
  %9 = load i32, i32* %on_or_off.addr, align 4
  %cmp9 = icmp eq i32 %9, 45
  %cond = select i1 %cmp9, i32 1, i32 0
  %10 = load i32*, i32** %value, align 4
  store i32 %cond, i32* %10, align 4
  %11 = load i32, i32* %flag.addr, align 4
  switch i32 %11, label %sw.epilog [
    i32 72, label %sw.bb
    i32 101, label %sw.bb13
    i32 110, label %sw.bb17
    i32 112, label %sw.bb21
    i32 114, label %sw.bb25
    i32 118, label %sw.bb32
  ]

sw.bb:                                            ; preds = %if.end8
  %12 = load i32, i32* %on_or_off.addr, align 4
  %cmp10 = icmp eq i32 %12, 45
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %sw.bb
  call void @bash_initialize_history()
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %sw.bb
  br label %sw.epilog

sw.bb13:                                          ; preds = %if.end8
  %13 = load i32, i32* @builtin_ignoring_errexit, align 4
  %cmp14 = icmp eq i32 %13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %sw.bb13
  %14 = load i32, i32* @errexit_flag, align 4
  store i32 %14, i32* @exit_immediately_on_error, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %sw.bb13
  br label %sw.epilog

sw.bb17:                                          ; preds = %if.end8
  %15 = load i32, i32* @interactive_shell, align 4
  %tobool18 = icmp ne i32 %15, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %sw.bb17
  store i32 0, i32* @read_but_dont_execute, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %sw.bb17
  br label %sw.epilog

sw.bb21:                                          ; preds = %if.end8
  %16 = load i32, i32* %on_or_off.addr, align 4
  %cmp22 = icmp eq i32 %16, 43
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %sw.bb21
  call void @disable_priv_mode()
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %sw.bb21
  br label %sw.epilog

sw.bb25:                                          ; preds = %if.end8
  %17 = load i32, i32* %on_or_off.addr, align 4
  %cmp26 = icmp eq i32 %17, 45
  br i1 %cmp26, label %land.lhs.true27, label %if.end31

land.lhs.true27:                                  ; preds = %sw.bb25
  %18 = load i32, i32* @shell_initialized, align 4
  %tobool28 = icmp ne i32 %18, 0
  br i1 %tobool28, label %if.then29, label %if.end31

if.then29:                                        ; preds = %land.lhs.true27
  %19 = load i8*, i8** @shell_name, align 4
  %call30 = call i32 @maybe_make_restricted(i8* %19)
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %land.lhs.true27, %sw.bb25
  br label %sw.epilog

sw.bb32:                                          ; preds = %if.end8
  %20 = load i32, i32* @verbose_flag, align 4
  store i32 %20, i32* @echo_input_at_read, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end8, %sw.bb32, %if.end31, %if.end24, %if.end20, %if.end16, %if.end12
  %21 = load i32, i32* %old_value, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then7, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

declare void @bash_initialize_history() #1

declare void @disable_priv_mode() #1

declare i32 @maybe_make_restricted(i8*) #1

; Function Attrs: noinline nounwind
define i8* @which_set_flags() #0 {
entry:
  %temp = alloca i8*, align 4
  %i = alloca i32, align 4
  %string_index = alloca i32, align 4
  %0 = load i32, i32* @read_from_stdin, align 4
  %add = add i32 22, %0
  %1 = load i32, i32* @want_pending_command, align 4
  %add1 = add i32 %add, %1
  %call = call i8* @sh_xmalloc(i32 %add1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 317)
  store i8* %call, i8** %temp, align 4
  store i32 0, i32* %string_index, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %2
  %name = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx, i32 0, i32 0
  %3 = load i8, i8* %name, align 4
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %4
  %value = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx2, i32 0, i32 1
  %5 = load i32*, i32** %value, align 4
  %6 = load i32, i32* %5, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %7
  %name5 = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx4, i32 0, i32 0
  %8 = load i8, i8* %name5, align 4
  %9 = load i8*, i8** %temp, align 4
  %10 = load i32, i32* %string_index, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %string_index, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i32 %10
  store i8 %8, i8* %arrayidx6, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %11, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* @want_pending_command, align 4
  %tobool8 = icmp ne i32 %12, 0
  br i1 %tobool8, label %if.then9, label %if.end12

if.then9:                                         ; preds = %for.end
  %13 = load i8*, i8** %temp, align 4
  %14 = load i32, i32* %string_index, align 4
  %inc10 = add nsw i32 %14, 1
  store i32 %inc10, i32* %string_index, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  store i8 99, i8* %arrayidx11, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.then9, %for.end
  %15 = load i32, i32* @read_from_stdin, align 4
  %tobool13 = icmp ne i32 %15, 0
  br i1 %tobool13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.end12
  %16 = load i8*, i8** %temp, align 4
  %17 = load i32, i32* %string_index, align 4
  %inc15 = add nsw i32 %17, 1
  store i32 %inc15, i32* %string_index, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i32 %17
  store i8 115, i8* %arrayidx16, align 1
  br label %if.end17

if.end17:                                         ; preds = %if.then14, %if.end12
  %18 = load i8*, i8** %temp, align 4
  %19 = load i32, i32* %string_index, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 0, i8* %arrayidx18, align 1
  %20 = load i8*, i8** %temp, align 4
  ret i8* %20
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @get_current_flags() #0 {
entry:
  %temp = alloca i8*, align 4
  %i = alloca i32, align 4
  %call = call i8* @sh_xmalloc(i32 22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 337)
  store i8* %call, i8** %temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %0
  %name = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx, i32 0, i32 0
  %1 = load i8, i8* %name, align 4
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %2
  %value = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx1, i32 0, i32 1
  %3 = load i32*, i32** %value, align 4
  %4 = load i32, i32* %3, align 4
  %conv = trunc i32 %4 to i8
  %5 = load i8*, i8** %temp, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i32 %6
  store i8 %conv, i8* %arrayidx2, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %temp, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx3, align 1
  %10 = load i8*, i8** %temp, align 4
  ret i8* %10
}

; Function Attrs: noinline nounwind
define void @set_current_flags(i8* %bitmap) #0 {
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
  %arrayidx = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %1
  %name = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx, i32 0, i32 0
  %2 = load i8, i8* %name, align 4
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %bitmap.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %6
  %value = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx2, i32 0, i32 1
  %7 = load i32*, i32** %value, align 4
  store i32 %conv, i32* %7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @reset_shell_flags() #0 {
entry:
  store i32 0, i32* @disallow_filename_globbing, align 4
  store i32 0, i32* @mark_modified_vars, align 4
  store i32 0, i32* @just_one_command, align 4
  store i32 0, i32* @read_but_dont_execute, align 4
  store i32 0, i32* @place_keywords_in_env, align 4
  store i32 0, i32* @unbound_vars_is_error, align 4
  store i32 0, i32* @noclobber, align 4
  store i32 0, i32* @forced_interactive, align 4
  store i32 0, i32* @jobs_m_flag, align 4
  store i32 0, i32* @echo_command_at_execute, align 4
  store i32 0, i32* @no_invisible_vars, align 4
  store i32 0, i32* @no_symbolic_links, align 4
  store i32 0, i32* @pipefail_opt, align 4
  store i32 0, i32* @privileged_mode, align 4
  store i32 0, i32* @function_trace_mode, align 4
  store i32 0, i32* @error_trace_mode, align 4
  store i32 0, i32* @errexit_flag, align 4
  store i32 0, i32* @exit_immediately_on_error, align 4
  store i32 0, i32* @verbose_flag, align 4
  store i32 0, i32* @echo_input_at_read, align 4
  store i32 1, i32* @interactive_comments, align 4
  store i32 1, i32* @hashing_enabled, align 4
  store i32 1, i32* @history_expansion, align 4
  store i32 1, i32* @brace_expansion, align 4
  store i32 0, i32* @restricted, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @initialize_flags() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %0
  %name = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx, i32 0, i32 0
  %1 = load i8, i8* %name, align 4
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [21 x %struct.flags_alist], [21 x %struct.flags_alist]* @shell_flags, i32 0, i32 %2
  %name2 = getelementptr inbounds %struct.flags_alist, %struct.flags_alist* %arrayidx1, i32 0, i32 0
  %3 = load i8, i8* %name2, align 4
  %4 = load i32, i32* %i, align 4
  %add = add nsw i32 %4, 1
  %arrayidx3 = getelementptr inbounds [25 x i8], [25 x i8]* @optflags, i32 0, i32 %add
  store i8 %3, i8* %arrayidx3, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %i, align 4
  %inc4 = add nsw i32 %6, 1
  store i32 %inc4, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [25 x i8], [25 x i8]* @optflags, i32 0, i32 %inc4
  store i8 111, i8* %arrayidx5, align 1
  %7 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %7, 1
  store i32 %inc6, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [25 x i8], [25 x i8]* @optflags, i32 0, i32 %inc6
  store i8 59, i8* %arrayidx7, align 1
  %8 = load i32, i32* %i, align 4
  %add8 = add nsw i32 %8, 1
  %arrayidx9 = getelementptr inbounds [25 x i8], [25 x i8]* @optflags, i32 0, i32 %add8
  store i8 0, i8* %arrayidx9, align 1
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
