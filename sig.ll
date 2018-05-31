; ModuleID = 'sig.c'
source_filename = "sig.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.termsig = type { i32, void (i32)*, i32 }
%struct._IO_FILE = type opaque
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.__sigset_t = type { [32 x i32] }

@interrupt_state = global i32 0, align 4
@sigwinch_received = global i32 0, align 4
@sigterm_received = global i32 0, align 4
@terminating_signal = global i32 0, align 4
@interrupt_immediately = global i32 0, align 4
@terminate_immediately = global i32 0, align 4
@termsigs_initialized = internal global i32 0, align 4
@terminating_signals = internal global [17 x %struct.termsig] [%struct.termsig { i32 1, void (i32)* null, i32 0 }, %struct.termsig { i32 2, void (i32)* null, i32 0 }, %struct.termsig { i32 4, void (i32)* null, i32 0 }, %struct.termsig { i32 5, void (i32)* null, i32 0 }, %struct.termsig { i32 6, void (i32)* null, i32 0 }, %struct.termsig { i32 8, void (i32)* null, i32 0 }, %struct.termsig { i32 7, void (i32)* null, i32 0 }, %struct.termsig { i32 11, void (i32)* null, i32 0 }, %struct.termsig { i32 31, void (i32)* null, i32 0 }, %struct.termsig { i32 13, void (i32)* null, i32 0 }, %struct.termsig { i32 14, void (i32)* null, i32 0 }, %struct.termsig { i32 15, void (i32)* null, i32 0 }, %struct.termsig { i32 24, void (i32)* null, i32 0 }, %struct.termsig { i32 25, void (i32)* null, i32 0 }, %struct.termsig { i32 26, void (i32)* null, i32 0 }, %struct.termsig { i32 10, void (i32)* null, i32 0 }, %struct.termsig { i32 12, void (i32)* null, i32 0 }], align 4
@interactive_shell = external global i32, align 4
@parse_and_execute_level = external global i32, align 4
@funcnest = external global i32, align 4
@breaking = external global i32, align 4
@continuing = external global i32, align 4
@loop_level = external global i32, align 4
@wait_intr_flag = external global i32, align 4
@return_catch_flag = external global i32, align 4
@comsub_ignore_return = external global i32, align 4
@executing_list = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@last_command_exit_signal = external global i32, align 4
@running_trap = external global i32, align 4
@interactive = external global i32, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@shell_initialized = external global i32, align 4
@top_level = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@no_line_editing = external global i32, align 4
@rl_readline_state = external global i32, align 4
@history_lines_this_session = external global i32, align 4
@termsig_handler.handling_termsig = internal global i32 0, align 4
@remember_on_history = external global i32, align 4
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@wait_signal_received = external global i32, align 4
@old_winch = internal global void (i32)* null, align 4

; Function Attrs: noinline nounwind
define void @initialize_signals(i32 %reinit) #0 {
entry:
  %reinit.addr = alloca i32, align 4
  store i32 %reinit, i32* %reinit.addr, align 4
  call void @initialize_shell_signals()
  call void @initialize_job_signals()
  %0 = load i32, i32* %reinit.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void bitcast (void (...)* @initialize_siglist to void ()*)()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @initialize_shell_signals() #0 {
entry:
  %0 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @initialize_terminating_signals()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call void (i32)* @signal(i32 3, void (i32)* inttoptr (i32 1 to void (i32)*))
  %1 = load i32, i32* @interactive, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then2, label %if.end8

if.then2:                                         ; preds = %if.end
  %call3 = call void (i32)* @signal(i32 2, void (i32)* @sigint_sighandler)
  call void @get_original_signal(i32 15)
  %call4 = call i32 @signal_is_hard_ignored(i32 15)
  %cmp = icmp eq i32 %call4, 0
  br i1 %cmp, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.then2
  %call6 = call void (i32)* @signal(i32 15, void (i32)* @sigterm_sighandler)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.then2
  call void @set_sigwinch_handler()
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.end
  ret void
}

declare void @initialize_job_signals() #1

declare void @initialize_siglist(...) #1

; Function Attrs: noinline nounwind
define void @initialize_terminating_signals() #0 {
entry:
  %i = alloca i32, align 4
  %0 = load i32, i32* @termsigs_initialized, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %1, 17
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %2
  %signum = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx, i32 0, i32 0
  %3 = load i32, i32* %signum, align 4
  %call = call i32 @signal_is_trapped(i32 %3)
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.body
  br label %for.inc

if.end3:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %4
  %signum5 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx4, i32 0, i32 0
  %5 = load i32, i32* %signum5, align 4
  %call6 = call void (i32)* @signal(i32 %5, void (i32)* @termsig_sighandler)
  %6 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %6
  %orig_handler = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx7, i32 0, i32 1
  store void (i32)* %call6, void (i32)** %orig_handler, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %7
  %orig_flags = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx8, i32 0, i32 2
  store i32 0, i32* %orig_flags, align 4
  %8 = load i32, i32* @interactive_shell, align 4
  %cmp9 = icmp eq i32 %8, 0
  br i1 %cmp9, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %if.end3
  %9 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %9
  %orig_handler11 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx10, i32 0, i32 1
  %10 = load void (i32)*, void (i32)** %orig_handler11, align 4
  %cmp12 = icmp eq void (i32)* %10, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp12, label %if.then13, label %if.end19

if.then13:                                        ; preds = %land.lhs.true
  %11 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %11
  %signum15 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx14, i32 0, i32 0
  %12 = load i32, i32* %signum15, align 4
  %call16 = call void (i32)* @signal(i32 %12, void (i32)* inttoptr (i32 1 to void (i32)*))
  %13 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %13
  %signum18 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx17, i32 0, i32 0
  %14 = load i32, i32* %signum18, align 4
  call void @set_signal_hard_ignored(i32 %14)
  br label %if.end19

if.end19:                                         ; preds = %if.then13, %land.lhs.true, %if.end3
  %15 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %15
  %signum21 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx20, i32 0, i32 0
  %16 = load i32, i32* %signum21, align 4
  %cmp22 = icmp eq i32 %16, 27
  br i1 %cmp22, label %land.lhs.true23, label %if.end37

land.lhs.true23:                                  ; preds = %if.end19
  %17 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %17
  %orig_handler25 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx24, i32 0, i32 1
  %18 = load void (i32)*, void (i32)** %orig_handler25, align 4
  %cmp26 = icmp ne void (i32)* %18, null
  br i1 %cmp26, label %land.lhs.true27, label %if.end37

land.lhs.true27:                                  ; preds = %land.lhs.true23
  %19 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %19
  %orig_handler29 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx28, i32 0, i32 1
  %20 = load void (i32)*, void (i32)** %orig_handler29, align 4
  %cmp30 = icmp ne void (i32)* %20, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp30, label %if.then31, label %if.end37

if.then31:                                        ; preds = %land.lhs.true27
  %21 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %21
  %signum33 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx32, i32 0, i32 0
  %22 = load i32, i32* %signum33, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %23
  %orig_handler35 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx34, i32 0, i32 1
  %24 = load void (i32)*, void (i32)** %orig_handler35, align 4
  %call36 = call void (i32)* @signal(i32 %22, void (i32)* %24)
  br label %if.end37

if.end37:                                         ; preds = %if.then31, %land.lhs.true27, %land.lhs.true23, %if.end19
  br label %for.inc

for.inc:                                          ; preds = %if.end37, %if.then2
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* @termsigs_initialized, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

declare i32 @signal_is_trapped(i32) #1

declare void (i32)* @signal(i32, void (i32)*) #1

; Function Attrs: noinline nounwind
define void @termsig_sighandler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* %sig.addr, align 4
  %cmp3 = icmp ne i32 %2, 13
  br i1 %cmp3, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %3 = load i32, i32* %sig.addr, align 4
  %cmp5 = icmp ne i32 %3, 14
  br i1 %cmp5, label %land.lhs.true6, label %if.end

land.lhs.true6:                                   ; preds = %land.lhs.true4
  %4 = load i32, i32* %sig.addr, align 4
  %cmp7 = icmp ne i32 %4, 15
  br i1 %cmp7, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true6
  %5 = load i32, i32* %sig.addr, align 4
  %cmp9 = icmp ne i32 %5, 24
  br i1 %cmp9, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %land.lhs.true8
  %6 = load i32, i32* %sig.addr, align 4
  %cmp11 = icmp ne i32 %6, 25
  br i1 %cmp11, label %land.lhs.true12, label %if.end

land.lhs.true12:                                  ; preds = %land.lhs.true10
  %7 = load i32, i32* %sig.addr, align 4
  %cmp13 = icmp ne i32 %7, 26
  br i1 %cmp13, label %land.lhs.true14, label %if.end

land.lhs.true14:                                  ; preds = %land.lhs.true12
  %8 = load i32, i32* %sig.addr, align 4
  %cmp15 = icmp ne i32 %8, 10
  br i1 %cmp15, label %land.lhs.true16, label %if.end

land.lhs.true16:                                  ; preds = %land.lhs.true14
  %9 = load i32, i32* %sig.addr, align 4
  %cmp17 = icmp ne i32 %9, 12
  br i1 %cmp17, label %land.lhs.true18, label %if.end

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %10 = load i32, i32* %sig.addr, align 4
  %11 = load volatile i32, i32* @terminating_signal, align 4
  %cmp19 = icmp eq i32 %10, %11
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true18
  store i32 1, i32* @terminate_immediately, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true18, %land.lhs.true16, %land.lhs.true14, %land.lhs.true12, %land.lhs.true10, %land.lhs.true8, %land.lhs.true6, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  %12 = load i32, i32* %sig.addr, align 4
  store volatile i32 %12, i32* @terminating_signal, align 4
  %13 = load i32, i32* @terminate_immediately, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %if.then20, label %if.end33

if.then20:                                        ; preds = %if.end
  %14 = load i32, i32* @interactive_shell, align 4
  %cmp21 = icmp eq i32 %14, 0
  br i1 %cmp21, label %if.then31, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then20
  %15 = load i32, i32* @interactive, align 4
  %cmp22 = icmp eq i32 %15, 0
  br i1 %cmp22, label %if.then31, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false
  %16 = load i32, i32* %sig.addr, align 4
  %cmp24 = icmp ne i32 %16, 1
  br i1 %cmp24, label %land.lhs.true25, label %lor.lhs.false27

land.lhs.true25:                                  ; preds = %lor.lhs.false23
  %17 = load i32, i32* %sig.addr, align 4
  %cmp26 = icmp ne i32 %17, 15
  br i1 %cmp26, label %if.then31, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %land.lhs.true25, %lor.lhs.false23
  %18 = load i32, i32* @no_line_editing, align 4
  %tobool28 = icmp ne i32 %18, 0
  br i1 %tobool28, label %if.then31, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %lor.lhs.false27
  %19 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %19, 8
  %cmp30 = icmp eq i32 %and, 0
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lor.lhs.false29, %lor.lhs.false27, %land.lhs.true25, %lor.lhs.false, %if.then20
  store i32 0, i32* @history_lines_this_session, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %lor.lhs.false29
  store i32 0, i32* @terminate_immediately, align 4
  %20 = load i32, i32* %sig.addr, align 4
  call void @termsig_handler(i32 %20)
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end
  %21 = load i32, i32* @rl_readline_state, align 4
  %and34 = and i32 %21, 32768
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %if.then39, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %if.end33
  %22 = load i32, i32* @rl_readline_state, align 4
  %and37 = and i32 %22, 4
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %lor.lhs.false36, %if.end33
  call void @bashline_set_event_hook()
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %lor.lhs.false36
  ret void
}

declare void @set_signal_hard_ignored(i32) #1

; Function Attrs: noinline nounwind
define void @reset_terminating_signals() #0 {
entry:
  %i = alloca i32, align 4
  %0 = load i32, i32* @termsigs_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp ult i32 %1, 17
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %2
  %signum = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx, i32 0, i32 0
  %3 = load i32, i32* %signum, align 4
  %call = call i32 @signal_is_trapped(i32 %3)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %4
  %signum3 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx2, i32 0, i32 0
  %5 = load i32, i32* %signum3, align 4
  %call4 = call i32 @signal_is_special(i32 %5)
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %lor.lhs.false, %for.body
  br label %for.inc

if.end7:                                          ; preds = %lor.lhs.false
  %6 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %6
  %signum9 = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx8, i32 0, i32 0
  %7 = load i32, i32* %signum9, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds [17 x %struct.termsig], [17 x %struct.termsig]* @terminating_signals, i32 0, i32 %8
  %orig_handler = getelementptr inbounds %struct.termsig, %struct.termsig* %arrayidx10, i32 0, i32 1
  %9 = load void (i32)*, void (i32)** %orig_handler, align 4
  %call11 = call void (i32)* @signal(i32 %7, void (i32)* %9)
  br label %for.inc

for.inc:                                          ; preds = %if.end7, %if.then6
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @termsigs_initialized, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

declare i32 @signal_is_special(i32) #1

; Function Attrs: noinline nounwind
define void @top_level_cleanup() #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @parse_and_execute_level, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @parse_and_execute_cleanup()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @unlink_fifo_list()
  call void @run_unwind_protects()
  store i32 0, i32* @funcnest, align 4
  store i32 0, i32* @breaking, align 4
  store i32 0, i32* @continuing, align 4
  store i32 0, i32* @loop_level, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  store i32 0, i32* @return_catch_flag, align 4
  store i32 0, i32* @comsub_ignore_return, align 4
  store i32 0, i32* @executing_list, align 4
  ret void
}

declare void @parse_and_execute_cleanup() #1

declare void @unlink_fifo_list() #1

declare void @run_unwind_protects() #1

; Function Attrs: noinline nounwind
define void @throw_to_top_level() #0 {
entry:
  %print_newline = alloca i32, align 4
  store i32 0, i32* %print_newline, align 4
  %0 = load volatile i32, i32* @interrupt_state, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @last_command_exit_value, align 4
  %cmp = icmp slt i32 %1, 128
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  store i32 130, i32* @last_command_exit_value, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store i32 1, i32* %print_newline, align 4
  %2 = load volatile i32, i32* @interrupt_state, align 4
  %dec = add nsw i32 %2, -1
  store volatile i32 %dec, i32* @interrupt_state, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.end, %entry
  %3 = load volatile i32, i32* @interrupt_state, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  ret void

if.end5:                                          ; preds = %if.end2
  %4 = load i32, i32* @last_command_exit_value, align 4
  %cmp6 = icmp sgt i32 %4, 128
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end5
  %5 = load i32, i32* @last_command_exit_value, align 4
  %sub = sub nsw i32 %5, 128
  br label %cond.end

cond.false:                                       ; preds = %if.end5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* @last_command_exit_signal, align 4
  %6 = load i32, i32* @last_command_exit_value, align 4
  %or = or i32 %6, 128
  store i32 %or, i32* @last_command_exit_value, align 4
  %call = call i32 @signal_is_trapped(i32 2)
  %tobool7 = icmp ne i32 %call, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %cond.end
  call void @run_interrupt_trap(i32 1)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %cond.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end9
  %7 = load i32, i32* @parse_and_execute_level, align 4
  %tobool10 = icmp ne i32 %7, 0
  br i1 %tobool10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @parse_and_execute_cleanup()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i32, i32* @running_trap, align 4
  %cmp11 = icmp sgt i32 %8, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %while.end
  %9 = load i32, i32* @running_trap, align 4
  %sub13 = sub nsw i32 %9, 1
  call void @run_trap_cleanup(i32 %sub13)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %while.end
  call void @reset_parser()
  %10 = load i32, i32* @interactive, align 4
  %tobool15 = icmp ne i32 %10, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  call void @bashline_reset()
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end14
  call void @unlink_fifo_list()
  call void @run_unwind_protects()
  store i32 0, i32* @funcnest, align 4
  store i32 0, i32* @breaking, align 4
  store i32 0, i32* @continuing, align 4
  store i32 0, i32* @loop_level, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  store i32 0, i32* @return_catch_flag, align 4
  store i32 0, i32* @comsub_ignore_return, align 4
  store i32 0, i32* @executing_list, align 4
  %11 = load i32, i32* @interactive, align 4
  %tobool18 = icmp ne i32 %11, 0
  br i1 %tobool18, label %land.lhs.true, label %if.end24

land.lhs.true:                                    ; preds = %if.end17
  %12 = load i32, i32* %print_newline, align 4
  %tobool19 = icmp ne i32 %12, 0
  br i1 %tobool19, label %if.then20, label %if.end24

if.then20:                                        ; preds = %land.lhs.true
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call21 = call i32 @fflush(%struct._IO_FILE* %13)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call23 = call i32 @fflush(%struct._IO_FILE* %15)
  br label %if.end24

if.end24:                                         ; preds = %if.then20, %land.lhs.true, %if.end17
  %16 = load i32, i32* @interactive, align 4
  %tobool25 = icmp ne i32 %16, 0
  br i1 %tobool25, label %if.then34, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end24
  %17 = load i32, i32* @interactive_shell, align 4
  %tobool26 = icmp ne i32 %17, 0
  br i1 %tobool26, label %land.lhs.true27, label %lor.lhs.false29

land.lhs.true27:                                  ; preds = %lor.lhs.false
  %18 = load i32, i32* @shell_initialized, align 4
  %tobool28 = icmp ne i32 %18, 0
  br i1 %tobool28, label %lor.lhs.false29, label %if.then34

lor.lhs.false29:                                  ; preds = %land.lhs.true27, %lor.lhs.false
  %19 = load i32, i32* %print_newline, align 4
  %tobool30 = icmp ne i32 %19, 0
  br i1 %tobool30, label %land.lhs.true31, label %if.else

land.lhs.true31:                                  ; preds = %lor.lhs.false29
  %call32 = call i32 @signal_is_trapped(i32 2)
  %tobool33 = icmp ne i32 %call32, 0
  br i1 %tobool33, label %if.then34, label %if.else

if.then34:                                        ; preds = %land.lhs.true31, %land.lhs.true27, %if.end24
  call void @jump_to_top_level(i32 2) #4
  unreachable

if.else:                                          ; preds = %land.lhs.true31, %lor.lhs.false29
  call void @jump_to_top_level(i32 3) #4
  unreachable
}

declare void @run_interrupt_trap(i32) #1

declare void @run_trap_cleanup(i32) #1

declare void @reset_parser() #1

declare void @bashline_reset() #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline noreturn nounwind
define void @jump_to_top_level(i32 %value) #2 {
entry:
  %value.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  %0 = load i32, i32* %value.addr, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0), i32 %0) #4
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #3

; Function Attrs: noinline nounwind
define void @termsig_handler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* @termsig_handler.handling_termsig, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* @termsig_handler.handling_termsig, align 4
  store volatile i32 0, i32* @terminating_signal, align 4
  %1 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %1, 2
  br i1 %cmp, label %land.lhs.true, label %if.end3

land.lhs.true:                                    ; preds = %if.end
  %call = call i32 @signal_is_trapped(i32 2)
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %land.lhs.true
  call void @run_interrupt_trap(i32 0)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %land.lhs.true, %if.end
  %2 = load i32, i32* @interactive_shell, align 4
  %tobool4 = icmp ne i32 %2, 0
  br i1 %tobool4, label %land.lhs.true5, label %if.end14

land.lhs.true5:                                   ; preds = %if.end3
  %3 = load i32, i32* @interactive, align 4
  %tobool6 = icmp ne i32 %3, 0
  br i1 %tobool6, label %land.lhs.true7, label %if.end14

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %4 = load i32, i32* %sig.addr, align 4
  %cmp8 = icmp eq i32 %4, 1
  br i1 %cmp8, label %land.lhs.true10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true7
  %5 = load i32, i32* %sig.addr, align 4
  %cmp9 = icmp eq i32 %5, 15
  br i1 %cmp9, label %land.lhs.true10, label %if.end14

land.lhs.true10:                                  ; preds = %lor.lhs.false, %land.lhs.true7
  %6 = load i32, i32* @remember_on_history, align 4
  %tobool11 = icmp ne i32 %6, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %land.lhs.true10
  %call13 = call i32 @maybe_save_shell_history()
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %land.lhs.true10, %lor.lhs.false, %land.lhs.true5, %if.end3
  %7 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp15 = icmp eq i32 (%struct.word_list*)* %7, @read_builtin
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  call void @read_tty_cleanup()
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end14
  call void @unlink_fifo_list()
  store i32 0, i32* @funcnest, align 4
  store i32 0, i32* @breaking, align 4
  store i32 0, i32* @continuing, align 4
  store i32 0, i32* @loop_level, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  store i32 0, i32* @return_catch_flag, align 4
  store i32 0, i32* @comsub_ignore_return, align 4
  store i32 0, i32* @executing_list, align 4
  %call18 = call i32 @run_exit_trap()
  %8 = load i32, i32* %sig.addr, align 4
  %call19 = call void (i32)* @signal(i32 %8, void (i32)* null)
  %call20 = call i32 @getpid()
  %9 = load i32, i32* %sig.addr, align 4
  %call21 = call i32 @kill(i32 %call20, i32 %9)
  br label %return

return:                                           ; preds = %if.end17, %if.then
  ret void
}

declare void @bashline_set_event_hook() #1

declare i32 @maybe_save_shell_history() #1

declare i32 @read_builtin(%struct.word_list*) #1

declare void @read_tty_cleanup() #1

declare i32 @run_exit_trap() #1

declare i32 @kill(i32, i32) #1

declare i32 @getpid() #1

; Function Attrs: noinline nounwind
define void @sigint_sighandler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %call = call void (i32)* @signal(i32 %0, void (i32)* @sigint_sighandler)
  %1 = load volatile i32, i32* @interrupt_state, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load volatile i32, i32* @interrupt_state, align 4
  %inc = add nsw i32 %2, 1
  store volatile i32 %inc, i32* @interrupt_state, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* @wait_intr_flag, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %4 = load i32, i32* %sig.addr, align 4
  %add = add nsw i32 128, %4
  store i32 %add, i32* @last_command_exit_value, align 4
  %5 = load i32, i32* %sig.addr, align 4
  store i32 %5, i32* @wait_signal_received, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  %6 = load i32, i32* @interrupt_immediately, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end2
  store i32 0, i32* @interrupt_immediately, align 4
  %7 = load i32, i32* %sig.addr, align 4
  %add5 = add nsw i32 128, %7
  store i32 %add5, i32* @last_command_exit_value, align 4
  call void @throw_to_top_level()
  br label %if.end9

if.else:                                          ; preds = %if.end2
  %8 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %8, 32768
  %tobool6 = icmp ne i32 %and, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.else
  call void @bashline_set_event_hook()
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.else
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then4
  br label %return

return:                                           ; preds = %if.end9, %if.then1
  ret void
}

; Function Attrs: noinline nounwind
define void @sigwinch_sighandler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %call = call void (i32)* @signal(i32 28, void (i32)* @sigwinch_sighandler)
  store volatile i32 1, i32* @sigwinch_received, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @set_sigwinch_handler() #0 {
entry:
  %call = call void (i32)* @signal(i32 28, void (i32)* @sigwinch_sighandler)
  store void (i32)* %call, void (i32)** @old_winch, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @unset_sigwinch_handler() #0 {
entry:
  %0 = load void (i32)*, void (i32)** @old_winch, align 4
  %call = call void (i32)* @signal(i32 28, void (i32)* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sigterm_sighandler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store volatile i32 1, i32* @sigterm_received, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @sigprocmask(i32 %operation, %struct.__sigset_t* %newset, %struct.__sigset_t* %oldset) #0 {
entry:
  %operation.addr = alloca i32, align 4
  %newset.addr = alloca %struct.__sigset_t*, align 4
  %oldset.addr = alloca %struct.__sigset_t*, align 4
  store i32 %operation, i32* %operation.addr, align 4
  store %struct.__sigset_t* %newset, %struct.__sigset_t** %newset.addr, align 4
  store %struct.__sigset_t* %oldset, %struct.__sigset_t** %oldset.addr, align 4
  ret i32 0
}

declare void @get_original_signal(i32) #1

declare i32 @signal_is_hard_ignored(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
