; ModuleID = 'signals.c'
source_filename = "signals.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__sigset_t = type { [32 x i32] }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct._hist_entry = type { i8*, i8*, i8* }

@rl_catch_signals = global i32 1, align 4
@rl_catch_sigwinch = global i32 1, align 4
@_rl_interrupt_immediately = global i32 0, align 4
@_rl_caught_signal = global i32 0, align 4
@_rl_echoctl = global i32 0, align 4
@_rl_intr_char = global i32 0, align 4
@_rl_quit_char = global i32 0, align 4
@_rl_susp_char = global i32 0, align 4
@rl_signal_event_hook = external global i32 ()*, align 4
@rl_set_signals.sigmask_set = internal global i32 0, align 4
@rl_set_signals.bset = internal global %struct.__sigset_t zeroinitializer, align 4
@rl_set_signals.oset = internal global %struct.__sigset_t zeroinitializer, align 4
@signals_set_flag = internal global i32 0, align 4
@old_int = internal global %struct.sigaction zeroinitializer, align 4
@old_term = internal global %struct.sigaction zeroinitializer, align 4
@old_hup = internal global %struct.sigaction zeroinitializer, align 4
@old_quit = internal global %struct.sigaction zeroinitializer, align 4
@old_alrm = internal global %struct.sigaction zeroinitializer, align 4
@old_tstp = internal global %struct.sigaction zeroinitializer, align 4
@old_ttou = internal global %struct.sigaction zeroinitializer, align 4
@old_ttin = internal global %struct.sigaction zeroinitializer, align 4
@sigwinch_set_flag = internal global i32 0, align 4
@old_winch = internal global %struct.sigaction zeroinitializer, align 4
@rl_deprep_term_function = external global void ()*, align 4
@rl_prep_term_function = external global void (i32)*, align 4
@_rl_meta_flag = external global i32, align 4
@sigint_blocked = internal global i32 0, align 4
@sigwinch_blocked = internal global i32 0, align 4
@sigwinch_set = internal global %struct.__sigset_t zeroinitializer, align 4
@sigwinch_oset = internal global %struct.__sigset_t zeroinitializer, align 4
@_rl_echo_control_chars = external global i32, align 4
@_rl_sigcleanup = common global void (i32, i8*)* null, align 4
@_rl_sigcleanarg = common global i8* null, align 4
@rl_readline_state = external global i32, align 4

; Function Attrs: noinline nounwind
define void @_rl_signal_handler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store volatile i32 0, i32* @_rl_caught_signal, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %0, 28
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @rl_resize_terminal()
  %1 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %tobool = icmp ne i32 ()* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %call = call i32 %2()
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  br label %if.end2

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %sig.addr, align 4
  call void @_rl_handle_signal(i32 %3)
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.end
  ret void
}

declare void @rl_resize_terminal() #1

; Function Attrs: noinline nounwind
define internal void @_rl_handle_signal(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %set = alloca %struct.__sigset_t, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 32768
  store i32 %or, i32* @rl_readline_state, align 4
  %1 = load void (i32, i8*)*, void (i32, i8*)** @_rl_sigcleanup, align 4
  %tobool = icmp ne void (i32, i8*)* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load void (i32, i8*)*, void (i32, i8*)** @_rl_sigcleanup, align 4
  %3 = load i32, i32* %sig.addr, align 4
  %4 = load i8*, i8** @_rl_sigcleanarg, align 4
  call void %2(i32 %3, i8* %4)
  store void (i32, i8*)* null, void (i32, i8*)** @_rl_sigcleanup, align 4
  store i8* null, i8** @_rl_sigcleanarg, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %sig.addr, align 4
  switch i32 %5, label %sw.epilog [
    i32 2, label %sw.bb
    i32 20, label %sw.bb1
    i32 21, label %sw.bb1
    i32 22, label %sw.bb4
    i32 15, label %sw.bb4
    i32 1, label %sw.bb4
    i32 14, label %sw.bb4
    i32 3, label %sw.bb4
  ]

sw.bb:                                            ; preds = %if.end
  call void @_rl_reset_completion_state()
  call void @rl_free_line_state()
  call void @rl_callback_sigcleanup()
  br label %sw.bb1

sw.bb1:                                           ; preds = %if.end, %if.end, %sw.bb
  %call = call i32 @sigemptyset(%struct.__sigset_t* %set)
  %call2 = call i32 @sigaddset(%struct.__sigset_t* %set, i32 22)
  %call3 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* %set, %struct.__sigset_t* null)
  br label %sw.bb4

sw.bb4:                                           ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %sw.bb1
  %6 = load i32, i32* %sig.addr, align 4
  call void @rl_echo_signal_char(i32 %6)
  call void @rl_cleanup_after_signal()
  %7 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %7, 21
  br i1 %cmp, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb4
  %8 = load i32, i32* %sig.addr, align 4
  %cmp5 = icmp eq i32 %8, 20
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %lor.lhs.false, %sw.bb4
  %call7 = call i32 @sigprocmask(i32 1, %struct.__sigset_t* %set, %struct.__sigset_t* null)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %lor.lhs.false
  %call9 = call i32 @sigemptyset(%struct.__sigset_t* %set)
  %call10 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* null, %struct.__sigset_t* %set)
  %9 = load i32, i32* %sig.addr, align 4
  %call11 = call i32 @sigdelset(%struct.__sigset_t* %set, i32 %9)
  %call12 = call i32 @getpid()
  %10 = load i32, i32* %sig.addr, align 4
  %call13 = call i32 @kill(i32 %call12, i32 %10)
  %call14 = call i32 @sigprocmask(i32 2, %struct.__sigset_t* %set, %struct.__sigset_t* null)
  call void @rl_reset_after_signal()
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end8, %if.end
  %11 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %11, -32769
  store i32 %and, i32* @rl_readline_state, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_set_signals() #0 {
entry:
  %dummy = alloca %struct.sigaction, align 4
  %oh = alloca void (...)*, align 4
  %0 = load i32, i32* @rl_catch_signals, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_set_signals.sigmask_set, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i32 @sigemptyset(%struct.__sigset_t* @rl_set_signals.bset)
  %call1 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 2)
  %call2 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 15)
  %call3 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 1)
  %call4 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 3)
  %call5 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 14)
  %call6 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 20)
  %call7 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 21)
  %call8 = call i32 @sigaddset(%struct.__sigset_t* @rl_set_signals.bset, i32 22)
  store i32 1, i32* @rl_set_signals.sigmask_set, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %2 = load i32, i32* @rl_catch_signals, align 4
  %tobool9 = icmp ne i32 %2, 0
  br i1 %tobool9, label %land.lhs.true10, label %if.end27

land.lhs.true10:                                  ; preds = %if.end
  %3 = load i32, i32* @signals_set_flag, align 4
  %cmp11 = icmp eq i32 %3, 0
  br i1 %cmp11, label %if.then12, label %if.end27

if.then12:                                        ; preds = %land.lhs.true10
  %call13 = call i32 @sigemptyset(%struct.__sigset_t* @rl_set_signals.oset)
  %call14 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* @rl_set_signals.bset, %struct.__sigset_t* @rl_set_signals.oset)
  call void @rl_maybe_set_sighandler(i32 2, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_int)
  call void @rl_maybe_set_sighandler(i32 15, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_term)
  call void @rl_maybe_set_sighandler(i32 1, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_hup)
  call void @rl_maybe_set_sighandler(i32 3, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_quit)
  %call15 = call void (...)* @rl_set_sighandler(i32 14, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_alrm)
  store void (...)* %call15, void (...)** %oh, align 4
  %4 = load void (...)*, void (...)** %oh, align 4
  %cmp16 = icmp eq void (...)* %4, inttoptr (i32 1 to void (...)*)
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.then12
  %call18 = call i32 @sigaction(i32 14, %struct.sigaction* @old_alrm, %struct.sigaction* %dummy)
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.then12
  %5 = load void (...)*, void (...)** %oh, align 4
  %cmp20 = icmp ne void (...)* %5, null
  br i1 %cmp20, label %land.lhs.true21, label %if.end25

land.lhs.true21:                                  ; preds = %if.end19
  %6 = load i32, i32* getelementptr inbounds (%struct.sigaction, %struct.sigaction* @old_alrm, i32 0, i32 2), align 4
  %and = and i32 %6, 268435456
  %tobool22 = icmp ne i32 %and, 0
  br i1 %tobool22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %land.lhs.true21
  %call24 = call i32 @sigaction(i32 14, %struct.sigaction* @old_alrm, %struct.sigaction* %dummy)
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %land.lhs.true21, %if.end19
  call void @rl_maybe_set_sighandler(i32 20, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_tstp)
  call void @rl_maybe_set_sighandler(i32 22, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_ttou)
  call void @rl_maybe_set_sighandler(i32 21, void (...)* bitcast (void (i32)* @rl_signal_handler to void (...)*), %struct.sigaction* @old_ttin)
  store i32 1, i32* @signals_set_flag, align 4
  %call26 = call i32 @sigprocmask(i32 2, %struct.__sigset_t* @rl_set_signals.oset, %struct.__sigset_t* null)
  br label %if.end27

if.end27:                                         ; preds = %if.end25, %land.lhs.true10, %if.end
  %7 = load i32, i32* @rl_catch_sigwinch, align 4
  %tobool28 = icmp ne i32 %7, 0
  br i1 %tobool28, label %land.lhs.true29, label %if.end32

land.lhs.true29:                                  ; preds = %if.end27
  %8 = load i32, i32* @sigwinch_set_flag, align 4
  %cmp30 = icmp eq i32 %8, 0
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %land.lhs.true29
  call void @rl_maybe_set_sighandler(i32 28, void (...)* bitcast (void (i32)* @rl_sigwinch_handler to void (...)*), %struct.sigaction* @old_winch)
  store i32 1, i32* @sigwinch_set_flag, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %land.lhs.true29, %if.end27
  ret i32 0
}

declare i32 @sigemptyset(%struct.__sigset_t*) #1

declare i32 @sigaddset(%struct.__sigset_t*, i32) #1

declare i32 @sigprocmask(i32, %struct.__sigset_t*, %struct.__sigset_t*) #1

; Function Attrs: noinline nounwind
define internal void @rl_maybe_set_sighandler(i32 %sig, void (...)* %handler, %struct.sigaction* %ohandler) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %handler.addr = alloca void (...)*, align 4
  %ohandler.addr = alloca %struct.sigaction*, align 4
  %dummy = alloca %struct.sigaction, align 4
  %oh = alloca void (...)*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store void (...)* %handler, void (...)** %handler.addr, align 4
  store %struct.sigaction* %ohandler, %struct.sigaction** %ohandler.addr, align 4
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %dummy, i32 0, i32 1
  %call = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask)
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %dummy, i32 0, i32 2
  store i32 0, i32* %sa_flags, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %1 = load void (...)*, void (...)** %handler.addr, align 4
  %2 = load %struct.sigaction*, %struct.sigaction** %ohandler.addr, align 4
  %call1 = call void (...)* @rl_set_sighandler(i32 %0, void (...)* %1, %struct.sigaction* %2)
  store void (...)* %call1, void (...)** %oh, align 4
  %3 = load void (...)*, void (...)** %oh, align 4
  %cmp = icmp eq void (...)* %3, inttoptr (i32 1 to void (...)*)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %sig.addr, align 4
  %5 = load %struct.sigaction*, %struct.sigaction** %ohandler.addr, align 4
  %call2 = call i32 @sigaction(i32 %4, %struct.sigaction* %5, %struct.sigaction* %dummy)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @rl_signal_handler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* @_rl_interrupt_immediately, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* @_rl_interrupt_immediately, align 4
  %1 = load i32, i32* %sig.addr, align 4
  call void @_rl_handle_signal(i32 %1)
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  store volatile i32 %2, i32* @_rl_caught_signal, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void (...)* @rl_set_sighandler(i32 %sig, void (...)* %handler, %struct.sigaction* %ohandler) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %handler.addr = alloca void (...)*, align 4
  %ohandler.addr = alloca %struct.sigaction*, align 4
  %old_handler = alloca %struct.sigaction, align 4
  %act = alloca %struct.sigaction, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store void (...)* %handler, void (...)** %handler.addr, align 4
  store %struct.sigaction* %ohandler, %struct.sigaction** %ohandler.addr, align 4
  %0 = load void (...)*, void (...)** %handler.addr, align 4
  %1 = bitcast void (...)* %0 to void (i32)*
  %__sa_handler = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 0
  %sa_handler = bitcast %union.anon* %__sa_handler to void (i32)**
  store void (i32)* %1, void (i32)** %sa_handler, align 4
  %2 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %2, 28
  %cond = select i1 %cmp, i32 268435456, i32 0
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 2
  store i32 %cond, i32* %sa_flags, align 4
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %act, i32 0, i32 1
  %call = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask)
  %3 = load %struct.sigaction*, %struct.sigaction** %ohandler.addr, align 4
  %sa_mask1 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %3, i32 0, i32 1
  %call2 = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask1)
  %4 = load i32, i32* %sig.addr, align 4
  %call3 = call i32 @sigaction(i32 %4, %struct.sigaction* %act, %struct.sigaction* %old_handler)
  %5 = load void (...)*, void (...)** %handler.addr, align 4
  %cmp4 = icmp ne void (...)* %5, bitcast (void (i32)* @rl_signal_handler to void (...)*)
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %__sa_handler5 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %old_handler, i32 0, i32 0
  %sa_handler6 = bitcast %union.anon* %__sa_handler5 to void (i32)**
  %6 = load void (i32)*, void (i32)** %sa_handler6, align 4
  %cmp7 = icmp ne void (i32)* %6, @rl_signal_handler
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %7 = load %struct.sigaction*, %struct.sigaction** %ohandler.addr, align 4
  %8 = bitcast %struct.sigaction* %7 to i8*
  %9 = bitcast %struct.sigaction* %old_handler to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %8, i8* %9, i32 140, i32 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %10 = load %struct.sigaction*, %struct.sigaction** %ohandler.addr, align 4
  %__sa_handler8 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %10, i32 0, i32 0
  %sa_handler9 = bitcast %union.anon* %__sa_handler8 to void (i32)**
  %11 = load void (i32)*, void (i32)** %sa_handler9, align 4
  %12 = bitcast void (i32)* %11 to void (...)*
  ret void (...)* %12
}

declare i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*) #1

; Function Attrs: noinline nounwind
define internal void @rl_sigwinch_handler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %oh = alloca void (...)*, align 4
  %dummy_winch = alloca %struct.sigaction, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %call = call void (...)* @rl_set_sighandler(i32 28, void (...)* bitcast (void (i32)* @rl_sigwinch_handler to void (...)*), %struct.sigaction* %dummy_winch)
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 32768
  store i32 %or, i32* @rl_readline_state, align 4
  %1 = load i32, i32* %sig.addr, align 4
  store volatile i32 %1, i32* @_rl_caught_signal, align 4
  %2 = load void (i32)*, void (i32)** getelementptr inbounds (%struct.sigaction, %struct.sigaction* @old_winch, i32 0, i32 0, i32 0), align 4
  %3 = bitcast void (i32)* %2 to void (...)*
  store void (...)* %3, void (...)** %oh, align 4
  %4 = load void (...)*, void (...)** %oh, align 4
  %tobool = icmp ne void (...)* %4, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load void (...)*, void (...)** %oh, align 4
  %cmp = icmp ne void (...)* %5, inttoptr (i32 1 to void (...)*)
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %6 = load void (...)*, void (...)** %oh, align 4
  %cmp2 = icmp ne void (...)* %6, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true1
  %7 = load void (...)*, void (...)** %oh, align 4
  %8 = load i32, i32* %sig.addr, align 4
  %callee.knr.cast = bitcast void (...)* %7 to void (i32)*
  call void %callee.knr.cast(i32 %8)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true1, %land.lhs.true, %entry
  %9 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %9, -32769
  store i32 %and, i32* @rl_readline_state, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_clear_signals() #0 {
entry:
  %dummy = alloca %struct.sigaction, align 4
  %0 = load i32, i32* @rl_catch_signals, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @signals_set_flag, align 4
  %cmp = icmp eq i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %dummy, i32 0, i32 1
  %call = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask)
  call void @rl_maybe_restore_sighandler(i32 2, %struct.sigaction* @old_int)
  call void @rl_maybe_restore_sighandler(i32 15, %struct.sigaction* @old_term)
  call void @rl_maybe_restore_sighandler(i32 1, %struct.sigaction* @old_hup)
  call void @rl_maybe_restore_sighandler(i32 3, %struct.sigaction* @old_quit)
  call void @rl_maybe_restore_sighandler(i32 14, %struct.sigaction* @old_alrm)
  call void @rl_maybe_restore_sighandler(i32 20, %struct.sigaction* @old_tstp)
  call void @rl_maybe_restore_sighandler(i32 22, %struct.sigaction* @old_ttou)
  call void @rl_maybe_restore_sighandler(i32 21, %struct.sigaction* @old_ttin)
  store i32 0, i32* @signals_set_flag, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %2 = load i32, i32* @rl_catch_sigwinch, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.end8

land.lhs.true2:                                   ; preds = %if.end
  %3 = load i32, i32* @sigwinch_set_flag, align 4
  %cmp3 = icmp eq i32 %3, 1
  br i1 %cmp3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %land.lhs.true2
  %sa_mask5 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %dummy, i32 0, i32 1
  %call6 = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask5)
  %call7 = call i32 @sigaction(i32 28, %struct.sigaction* @old_winch, %struct.sigaction* %dummy)
  store i32 0, i32* @sigwinch_set_flag, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %land.lhs.true2, %if.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal void @rl_maybe_restore_sighandler(i32 %sig, %struct.sigaction* %handler) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %handler.addr = alloca %struct.sigaction*, align 4
  %dummy = alloca %struct.sigaction, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store %struct.sigaction* %handler, %struct.sigaction** %handler.addr, align 4
  %sa_mask = getelementptr inbounds %struct.sigaction, %struct.sigaction* %dummy, i32 0, i32 1
  %call = call i32 @sigemptyset(%struct.__sigset_t* %sa_mask)
  %sa_flags = getelementptr inbounds %struct.sigaction, %struct.sigaction* %dummy, i32 0, i32 2
  store i32 0, i32* %sa_flags, align 4
  %0 = load %struct.sigaction*, %struct.sigaction** %handler.addr, align 4
  %__sa_handler = getelementptr inbounds %struct.sigaction, %struct.sigaction* %0, i32 0, i32 0
  %sa_handler = bitcast %union.anon* %__sa_handler to void (i32)**
  %1 = load void (i32)*, void (i32)** %sa_handler, align 4
  %cmp = icmp ne void (i32)* %1, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  %3 = load %struct.sigaction*, %struct.sigaction** %handler.addr, align 4
  %call1 = call i32 @sigaction(i32 %2, %struct.sigaction* %3, %struct.sigaction* %dummy)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_cleanup_after_signal() #0 {
entry:
  call void @_rl_clean_up_for_exit()
  %0 = load void ()*, void ()** @rl_deprep_term_function, align 4
  %tobool = icmp ne void ()* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load void ()*, void ()** @rl_deprep_term_function, align 4
  call void %1()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 @rl_clear_pending_input()
  %call1 = call i32 @rl_clear_signals()
  ret void
}

declare void @_rl_clean_up_for_exit() #1

declare i32 @rl_clear_pending_input() #1

; Function Attrs: noinline nounwind
define void @rl_reset_after_signal() #0 {
entry:
  %0 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %tobool = icmp ne void (i32)* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %2 = load i32, i32* @_rl_meta_flag, align 4
  call void %1(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 @rl_set_signals()
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_free_line_state() #0 {
entry:
  %entry1 = alloca %struct._hist_entry*, align 4
  call void @rl_free_undo_list()
  %call = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call, %struct._hist_entry** %entry1, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %tobool = icmp ne %struct._hist_entry* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 2
  store i8* null, i8** %data, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @_rl_kill_kbd_macro()
  %call2 = call i32 @rl_clear_message()
  call void @_rl_reset_argument()
  ret void
}

declare void @rl_free_undo_list() #1

declare %struct._hist_entry* @current_history() #1

declare void @_rl_kill_kbd_macro() #1

declare i32 @rl_clear_message() #1

declare void @_rl_reset_argument() #1

; Function Attrs: noinline nounwind
define i32 @rl_pending_signal() #0 {
entry:
  %0 = load volatile i32, i32* @_rl_caught_signal, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define void @_rl_block_sigint() #0 {
entry:
  %0 = load i32, i32* @sigint_blocked, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* @sigint_blocked, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_release_sigint() #0 {
entry:
  %0 = load i32, i32* @sigint_blocked, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.end

if.end:                                           ; preds = %entry
  store i32 0, i32* @sigint_blocked, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %1 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %do.body
  %2 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %2)
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.then, %if.end2
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_block_sigwinch() #0 {
entry:
  %0 = load i32, i32* @sigwinch_blocked, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @sigemptyset(%struct.__sigset_t* @sigwinch_set)
  %call1 = call i32 @sigemptyset(%struct.__sigset_t* @sigwinch_oset)
  %call2 = call i32 @sigaddset(%struct.__sigset_t* @sigwinch_set, i32 28)
  %call3 = call i32 @sigprocmask(i32 0, %struct.__sigset_t* @sigwinch_set, %struct.__sigset_t* @sigwinch_oset)
  store i32 1, i32* @sigwinch_blocked, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_release_sigwinch() #0 {
entry:
  %0 = load i32, i32* @sigwinch_blocked, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @sigprocmask(i32 2, %struct.__sigset_t* @sigwinch_oset, %struct.__sigset_t* null)
  store i32 0, i32* @sigwinch_blocked, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_echo_signal_char(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %cstr = alloca [3 x i8], align 1
  %cslen = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* @_rl_echoctl, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @_rl_echo_control_chars, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32, i32* %sig.addr, align 4
  switch i32 %2, label %sw.default [
    i32 2, label %sw.bb
    i32 3, label %sw.bb2
    i32 20, label %sw.bb3
  ]

sw.bb:                                            ; preds = %if.end
  %3 = load i32, i32* @_rl_intr_char, align 4
  store i32 %3, i32* %c, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %if.end
  %4 = load i32, i32* @_rl_quit_char, align 4
  store i32 %4, i32* %c, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %if.end
  %5 = load i32, i32* @_rl_susp_char, align 4
  store i32 %5, i32* %c, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end
  br label %return

sw.epilog:                                        ; preds = %sw.bb3, %sw.bb2, %sw.bb
  %6 = load i32, i32* %c, align 4
  %cmp4 = icmp slt i32 %6, 32
  br i1 %cmp4, label %land.lhs.true, label %lor.lhs.false6

land.lhs.true:                                    ; preds = %sw.epilog
  %7 = load i32, i32* %c, align 4
  %and = and i32 %7, 128
  %cmp5 = icmp eq i32 %and, 0
  br i1 %cmp5, label %if.then8, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %land.lhs.true, %sw.epilog
  %8 = load i32, i32* %c, align 4
  %cmp7 = icmp eq i32 %8, 127
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %lor.lhs.false6, %land.lhs.true
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %cstr, i32 0, i32 0
  store i8 94, i8* %arrayidx, align 1
  %9 = load i32, i32* %c, align 4
  %cmp9 = icmp slt i32 %9, 32
  br i1 %cmp9, label %land.lhs.true10, label %cond.false27

land.lhs.true10:                                  ; preds = %if.then8
  %10 = load i32, i32* %c, align 4
  %and11 = and i32 %10, 128
  %cmp12 = icmp eq i32 %and11, 0
  br i1 %cmp12, label %cond.true, label %cond.false27

cond.true:                                        ; preds = %land.lhs.true10
  %11 = load i32, i32* %c, align 4
  %or = or i32 %11, 64
  %conv = trunc i32 %or to i8
  %conv13 = zext i8 %conv to i32
  %12 = load i32, i32* %c, align 4
  %or14 = or i32 %12, 64
  %cmp15 = icmp eq i32 %conv13, %or14
  br i1 %cmp15, label %land.lhs.true17, label %cond.false

land.lhs.true17:                                  ; preds = %cond.true
  %13 = load i32, i32* %c, align 4
  %or18 = or i32 %13, 64
  %conv19 = trunc i32 %or18 to i8
  %conv20 = zext i8 %conv19 to i32
  %call = call i32 @islower(i32 %conv20) #4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true21, label %cond.false

cond.true21:                                      ; preds = %land.lhs.true17
  %14 = load i32, i32* %c, align 4
  %or22 = or i32 %14, 64
  %conv23 = trunc i32 %or22 to i8
  %conv24 = zext i8 %conv23 to i32
  %call25 = call i32 @toupper(i32 %conv24) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true17, %cond.true
  %15 = load i32, i32* %c, align 4
  %or26 = or i32 %15, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true21
  %cond = phi i32 [ %call25, %cond.true21 ], [ %or26, %cond.false ]
  br label %cond.end28

cond.false27:                                     ; preds = %land.lhs.true10, %if.then8
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false27, %cond.end
  %cond29 = phi i32 [ %cond, %cond.end ], [ 63, %cond.false27 ]
  %conv30 = trunc i32 %cond29 to i8
  %arrayidx31 = getelementptr inbounds [3 x i8], [3 x i8]* %cstr, i32 0, i32 1
  store i8 %conv30, i8* %arrayidx31, align 1
  store i32 2, i32* %cslen, align 4
  %arrayidx32 = getelementptr inbounds [3 x i8], [3 x i8]* %cstr, i32 0, i32 2
  store i8 0, i8* %arrayidx32, align 1
  br label %if.end36

if.else:                                          ; preds = %lor.lhs.false6
  %16 = load i32, i32* %c, align 4
  %conv33 = trunc i32 %16 to i8
  %arrayidx34 = getelementptr inbounds [3 x i8], [3 x i8]* %cstr, i32 0, i32 0
  store i8 %conv33, i8* %arrayidx34, align 1
  store i32 1, i32* %cslen, align 4
  %arrayidx35 = getelementptr inbounds [3 x i8], [3 x i8]* %cstr, i32 0, i32 1
  store i8 0, i8* %arrayidx35, align 1
  br label %if.end36

if.end36:                                         ; preds = %if.else, %cond.end28
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %cstr, i32 0, i32 0
  %17 = load i32, i32* %cslen, align 4
  call void @_rl_output_some_chars(i8* %arraydecay, i32 %17)
  br label %return

return:                                           ; preds = %if.end36, %sw.default, %if.then
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #2

declare void @_rl_output_some_chars(i8*, i32) #1

declare void @_rl_reset_completion_state() #1

declare void @rl_callback_sigcleanup() #1

declare i32 @sigdelset(%struct.__sigset_t*, i32) #1

declare i32 @kill(i32, i32) #1

declare i32 @getpid() #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #3

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
