; ModuleID = 'nojobs.c'
source_filename = "nojobs.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.proc_status = type { i32, i32, i32 }
%struct._IO_FILE = type opaque
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }

@last_made_pid = global i32 -1, align 4
@last_asynchronous_pid = global i32 -1, align 4
@already_making_children = global i32 0, align 4
@shell_tty = global i32 -1, align 4
@check_window_size = global i32 0, align 4
@job_control = global i32 0, align 4
@running_in_background = global i32 0, align 4
@pid_list_size = internal global i32 0, align 4
@pid_list = internal global %struct.proc_status* null, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@interactive = external global i32, align 4
@login_shell = external global i32, align 4
@.str = private unnamed_addr constant [9 x i8] c"nojobs.c\00", align 1
@default_buffered_input = external global i32, align 4
@sigterm_received = external global i32, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"fork: retry\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"fork\00", align 1
@last_command_exit_value = external global i32, align 4
@interrupt_state = external global i32, align 4
@get_original_tty_job_signals.fetched = internal global i32 0, align 4
@interactive_shell = external global i32, align 4
@.str.3 = private unnamed_addr constant [43 x i8] c"wait: pid %ld is not a child of this shell\00", align 1
@last_command_exit_signal = external global i32, align 4
@terminating_signal = external global i32, align 4
@wait_intr_flag = external global i32, align 4
@wait_signal_received = external global i32, align 4
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@wait_intr_buf = external global [1 x %struct.__jmp_buf_tag], align 4
@.str.4 = private unnamed_addr constant [5 x i8] c"wait\00", align 1
@wait_sigint_received = internal global i32 0, align 4
@old_sigint_handler = internal global void (i32)* bitcast (void ()* @wait_for_background_pids to void (i32)*), align 4
@.str.5 = private unnamed_addr constant [18 x i8] c"wait_for(%ld): %s\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c" (core dumped)\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@subshell_environment = external global i32, align 4
@shell_tty_info = internal global %struct.termios zeroinitializer, align 4
@got_tty_state = internal global i32 0, align 4
@.str.9 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@child_max = internal global i32 -1, align 4
@interrupt_immediately = external global i32, align 4
@j_strsignal.retcode_name_buffer = internal global [64 x i8] zeroinitializer, align 1
@sys_siglist = external global [0 x i8*], align 4
@.str.10 = private unnamed_addr constant [10 x i8] c"Signal %d\00", align 1

; Function Attrs: noinline nounwind
define i32 @cleanup_dead_jobs() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @pid_list_size, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %2, i32 %3
  %flags = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 2
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 1
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %5 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %5, i32 %6
  %flags3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx2, i32 0, i32 2
  %7 = load i32, i32* %flags3, align 4
  %and4 = and i32 %7, 2
  %tobool = icmp ne i32 %and4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %8, i32 %9
  %pid = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx5, i32 0, i32 0
  store i32 -1, i32* %pid, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @coproc_reap()
  ret i32 0
}

declare void @coproc_reap() #1

; Function Attrs: noinline nounwind
define void @reap_dead_jobs() #0 {
entry:
  call void @mark_dead_jobs_as_notified(i32 0)
  %call = call i32 @cleanup_dead_jobs()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @mark_dead_jobs_as_notified(i32 %force) #0 {
entry:
  %force.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %ndead = alloca i32, align 4
  store i32 %force, i32* %force.addr, align 4
  store i32 0, i32* %ndead, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %force.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @pid_list_size, align 4
  %cmp1 = icmp slt i32 %1, %2
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %3 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ]
  br i1 %3, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %4 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %4, i32 %5
  %pid = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 0
  %6 = load i32, i32* %pid, align 4
  %cmp2 = icmp eq i32 %6, -1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %7 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %7, i32 %8
  %flags = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx3, i32 0, i32 2
  %9 = load i32, i32* %flags, align 4
  %and = and i32 %9, 1
  %cmp4 = icmp eq i32 %and, 0
  br i1 %cmp4, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end
  %10 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %10, i32 %11
  %flags6 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx5, i32 0, i32 2
  %12 = load i32, i32* %flags6, align 4
  %and7 = and i32 %12, 4
  %tobool = icmp ne i32 %and7, 0
  br i1 %tobool, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true
  %13 = load i32, i32* %ndead, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %ndead, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %land.lhs.true, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end9, %if.then
  %14 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %14, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %15 = load i32, i32* @child_max, align 4
  %cmp11 = icmp slt i32 %15, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.end
  %call = call i32 @getmaxchild()
  store i32 %call, i32* @child_max, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %for.end
  %16 = load i32, i32* @child_max, align 4
  %cmp14 = icmp slt i32 %16, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  store i32 32, i32* @child_max, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %17 = load i32, i32* %force.addr, align 4
  %cmp17 = icmp eq i32 %17, 0
  br i1 %cmp17, label %land.lhs.true18, label %if.end21

land.lhs.true18:                                  ; preds = %if.end16
  %18 = load i32, i32* %ndead, align 4
  %19 = load i32, i32* @child_max, align 4
  %cmp19 = icmp sle i32 %18, %19
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %land.lhs.true18
  br label %for.end54

if.end21:                                         ; preds = %land.lhs.true18, %if.end16
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc52, %if.end21
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* @pid_list_size, align 4
  %cmp23 = icmp slt i32 %20, %21
  br i1 %cmp23, label %for.body24, label %for.end54

for.body24:                                       ; preds = %for.cond22
  %22 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %22, i32 %23
  %pid26 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx25, i32 0, i32 0
  %24 = load i32, i32* %pid26, align 4
  %cmp27 = icmp eq i32 %24, -1
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %for.body24
  br label %for.inc52

if.end29:                                         ; preds = %for.body24
  %25 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %26 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %25, i32 %26
  %flags31 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx30, i32 0, i32 2
  %27 = load i32, i32* %flags31, align 4
  %and32 = and i32 %27, 1
  %cmp33 = icmp eq i32 %and32, 0
  br i1 %cmp33, label %land.lhs.true34, label %if.end51

land.lhs.true34:                                  ; preds = %if.end29
  %28 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %29 = load i32, i32* %i, align 4
  %arrayidx35 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %28, i32 %29
  %pid36 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx35, i32 0, i32 0
  %30 = load i32, i32* %pid36, align 4
  %31 = load volatile i32, i32* @last_asynchronous_pid, align 4
  %cmp37 = icmp ne i32 %30, %31
  br i1 %cmp37, label %if.then38, label %if.end51

if.then38:                                        ; preds = %land.lhs.true34
  %32 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %33 = load i32, i32* %i, align 4
  %arrayidx39 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %32, i32 %33
  %flags40 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx39, i32 0, i32 2
  %34 = load i32, i32* %flags40, align 4
  %or = or i32 %34, 2
  store i32 %or, i32* %flags40, align 4
  %35 = load i32, i32* %force.addr, align 4
  %cmp41 = icmp eq i32 %35, 0
  br i1 %cmp41, label %land.lhs.true42, label %if.end50

land.lhs.true42:                                  ; preds = %if.then38
  %36 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %37 = load i32, i32* %i, align 4
  %arrayidx43 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %36, i32 %37
  %flags44 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx43, i32 0, i32 2
  %38 = load i32, i32* %flags44, align 4
  %and45 = and i32 %38, 4
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %land.lhs.true47, label %if.end50

land.lhs.true47:                                  ; preds = %land.lhs.true42
  %39 = load i32, i32* %ndead, align 4
  %dec = add nsw i32 %39, -1
  store i32 %dec, i32* %ndead, align 4
  %40 = load i32, i32* @child_max, align 4
  %cmp48 = icmp sle i32 %dec, %40
  br i1 %cmp48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %land.lhs.true47
  br label %for.end54

if.end50:                                         ; preds = %land.lhs.true47, %land.lhs.true42, %if.then38
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %land.lhs.true34, %if.end29
  br label %for.inc52

for.inc52:                                        ; preds = %if.end51, %if.then28
  %41 = load i32, i32* %i, align 4
  %inc53 = add nsw i32 %41, 1
  store i32 %inc53, i32* %i, align 4
  br label %for.cond22

for.end54:                                        ; preds = %if.then20, %if.then49, %for.cond22
  ret void
}

; Function Attrs: noinline nounwind
define i32 @initialize_job_control(i32 %force) #0 {
entry:
  %force.addr = alloca i32, align 4
  store i32 %force, i32* %force.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %0)
  store i32 %call, i32* @shell_tty, align 4
  %1 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 @get_tty_state()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare i32 @fileno(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define i32 @get_tty_state() #0 {
entry:
  %tty = alloca i32, align 4
  %0 = load i32, i32* @shell_tty, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @shell_tty, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %2)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, i32* %tty, align 4
  %3 = load i32, i32* %tty, align 4
  %cmp1 = icmp ne i32 %3, -1
  br i1 %cmp1, label %if.then, label %if.end4

if.then:                                          ; preds = %cond.end
  %4 = load i32, i32* %tty, align 4
  %call2 = call i32 @ttgetattr(i32 %4, %struct.termios* @shell_tty_info)
  store i32 1, i32* @got_tty_state, align 4
  %5 = load i32, i32* @check_window_size, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @get_new_window_size(i32 0, i32* null, i32* null)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %cond.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @initialize_job_signals() #0 {
entry:
  %call = call void (i32)* @signal(i32 2, void (i32)* @sigint_sighandler)
  %0 = load i32, i32* @login_shell, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @ignore_tty_job_signals()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void (i32)* @signal(i32, void (i32)*) #1

declare void @sigint_sighandler(i32) #1

; Function Attrs: noinline nounwind
define void @ignore_tty_job_signals() #0 {
entry:
  %call = call void (i32)* @signal(i32 20, void (i32)* inttoptr (i32 1 to void (i32)*))
  %call1 = call void (i32)* @signal(i32 21, void (i32)* inttoptr (i32 1 to void (i32)*))
  %call2 = call void (i32)* @signal(i32 22, void (i32)* inttoptr (i32 1 to void (i32)*))
  ret void
}

; Function Attrs: noinline nounwind
define i32 @make_child(i8* %command, i32 %async_p) #0 {
entry:
  %command.addr = alloca i8*, align 4
  %async_p.addr = alloca i32, align 4
  %pid = alloca i32, align 4
  %forksleep = alloca i32, align 4
  store i8* %command, i8** %command.addr, align 4
  store i32 %async_p, i32* %async_p.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %command.addr, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 502)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @start_pipeline()
  %2 = load i32, i32* @default_buffered_input, align 4
  %cmp = icmp ne i32 %2, -1
  br i1 %cmp, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %async_p.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %lor.lhs.false, label %if.then3

lor.lhs.false:                                    ; preds = %land.lhs.true
  %4 = load i32, i32* @default_buffered_input, align 4
  %cmp2 = icmp sgt i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %5 = load i32, i32* @default_buffered_input, align 4
  %call = call i32 @sync_buffered_stream(i32 %5)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %lor.lhs.false, %if.end
  br label %do.body

do.body:                                          ; preds = %if.end4
  store volatile i32 0, i32* @sigterm_received, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  store i32 1, i32* %forksleep, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end16, %do.end
  %call5 = call i32 @fork()
  store i32 %call5, i32* %pid, align 4
  %cmp6 = icmp slt i32 %call5, 0
  br i1 %cmp6, label %land.lhs.true7, label %land.end

land.lhs.true7:                                   ; preds = %while.cond
  %call8 = call i32* @__errno_location()
  %6 = load i32, i32* %call8, align 4
  %cmp9 = icmp eq i32 %6, 11
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true7
  %7 = load i32, i32* %forksleep, align 4
  %cmp10 = icmp slt i32 %7, 16
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true7, %while.cond
  %8 = phi i1 [ false, %land.lhs.true7 ], [ false, %while.cond ], [ %cmp10, %land.rhs ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  call void (i8*, ...) @sys_error(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  br label %do.body11

do.body11:                                        ; preds = %while.body
  store volatile i32 0, i32* @sigterm_received, align 4
  br label %do.end12

do.end12:                                         ; preds = %do.body11
  %9 = load i32, i32* %forksleep, align 4
  %call13 = call i32 @sleep(i32 %9)
  %cmp14 = icmp ne i32 %call13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.end12
  br label %while.end

if.end16:                                         ; preds = %do.end12
  %10 = load i32, i32* %forksleep, align 4
  %shl = shl i32 %10, 1
  store i32 %shl, i32* %forksleep, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then15, %land.end
  %11 = load i32, i32* %pid, align 4
  %cmp17 = icmp ne i32 %11, 0
  br i1 %cmp17, label %if.then18, label %if.end21

if.then18:                                        ; preds = %while.end
  br label %do.body19

do.body19:                                        ; preds = %if.then18
  store volatile i32 0, i32* @sigterm_received, align 4
  br label %do.end20

do.end20:                                         ; preds = %do.body19
  br label %if.end21

if.end21:                                         ; preds = %do.end20, %while.end
  %12 = load i32, i32* %pid, align 4
  %cmp22 = icmp slt i32 %12, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  call void (i8*, ...) @sys_error(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  store i32 126, i32* @last_command_exit_value, align 4
  call void @throw_to_top_level()
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end21
  %13 = load i32, i32* %pid, align 4
  %cmp25 = icmp eq i32 %13, 0
  br i1 %cmp25, label %if.then26, label %if.else

if.then26:                                        ; preds = %if.end24
  call void @unset_bash_input(i32 0)
  store volatile i32 0, i32* @interrupt_state, align 4
  call void @default_tty_job_signals()
  br label %if.end30

if.else:                                          ; preds = %if.end24
  %14 = load i32, i32* %pid, align 4
  store volatile i32 %14, i32* @last_made_pid, align 4
  %15 = load i32, i32* %async_p.addr, align 4
  %tobool27 = icmp ne i32 %15, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.else
  %16 = load i32, i32* %pid, align 4
  store volatile i32 %16, i32* @last_asynchronous_pid, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.else
  %17 = load i32, i32* %pid, align 4
  %18 = load i32, i32* %async_p.addr, align 4
  call void @add_pid(i32 %17, i32 %18)
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then26
  %19 = load i32, i32* %pid, align 4
  ret i32 %19
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @start_pipeline() #0 {
entry:
  store i32 1, i32* @already_making_children, align 4
  ret void
}

declare i32 @sync_buffered_stream(i32) #1

declare i32 @fork() #1

declare i32* @__errno_location() #1

declare void @sys_error(i8*, ...) #1

declare i32 @sleep(i32) #1

declare void @throw_to_top_level() #1

declare void @unset_bash_input(i32) #1

; Function Attrs: noinline nounwind
define void @default_tty_job_signals() #0 {
entry:
  %call = call i32 @signal_is_trapped(i32 20)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %call1 = call i32 @signal_is_hard_ignored(i32 20)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %call2 = call void (i32)* @signal(i32 20, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  %call3 = call void (i32)* @signal(i32 20, void (i32)* null)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call4 = call i32 @signal_is_trapped(i32 21)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %land.lhs.true6, label %if.else11

land.lhs.true6:                                   ; preds = %if.end
  %call7 = call i32 @signal_is_hard_ignored(i32 21)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then9, label %if.else11

if.then9:                                         ; preds = %land.lhs.true6
  %call10 = call void (i32)* @signal(i32 21, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %if.end13

if.else11:                                        ; preds = %land.lhs.true6, %if.end
  %call12 = call void (i32)* @signal(i32 21, void (i32)* null)
  br label %if.end13

if.end13:                                         ; preds = %if.else11, %if.then9
  %call14 = call i32 @signal_is_trapped(i32 22)
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %land.lhs.true16, label %if.else21

land.lhs.true16:                                  ; preds = %if.end13
  %call17 = call i32 @signal_is_hard_ignored(i32 22)
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %if.then19, label %if.else21

if.then19:                                        ; preds = %land.lhs.true16
  %call20 = call void (i32)* @signal(i32 22, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %if.end23

if.else21:                                        ; preds = %land.lhs.true16, %if.end13
  %call22 = call void (i32)* @signal(i32 22, void (i32)* null)
  br label %if.end23

if.end23:                                         ; preds = %if.else21, %if.then19
  ret void
}

; Function Attrs: noinline nounwind
define internal void @add_pid(i32 %pid, i32 %async) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %async.addr = alloca i32, align 4
  %slot = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %async, i32* %async.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_proc_slot(i32 %0)
  store i32 %call, i32* %slot, align 4
  %1 = load i32, i32* %pid.addr, align 4
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = load i32, i32* %slot, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %2, i32 %3
  %pid1 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 0
  store i32 %1, i32* %pid1, align 4
  %4 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %5 = load i32, i32* %slot, align 4
  %arrayidx2 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %4, i32 %5
  %status = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx2, i32 0, i32 1
  store i32 -1, i32* %status, align 4
  %6 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %7 = load i32, i32* %slot, align 4
  %arrayidx3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %6, i32 %7
  %flags = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx3, i32 0, i32 2
  store i32 1, i32* %flags, align 4
  %8 = load i32, i32* %async.addr, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %10 = load i32, i32* %slot, align 4
  %arrayidx4 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %9, i32 %10
  %flags5 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx4, i32 0, i32 2
  %11 = load i32, i32* %flags5, align 4
  %or = or i32 %11, 4
  store i32 %or, i32* %flags5, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @signal_is_trapped(i32) #1

declare i32 @signal_is_hard_ignored(i32) #1

; Function Attrs: noinline nounwind
define void @get_original_tty_job_signals() #0 {
entry:
  %0 = load i32, i32* @get_original_tty_job_signals.fetched, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @interactive_shell, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  call void @set_original_signal(i32 20, void (i32)* null)
  call void @set_original_signal(i32 21, void (i32)* null)
  call void @set_original_signal(i32 22, void (i32)* null)
  br label %if.end

if.else:                                          ; preds = %if.then
  call void @get_original_signal(i32 20)
  call void @get_original_signal(i32 21)
  call void @get_original_signal(i32 22)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  store i32 1, i32* @get_original_tty_job_signals.fetched, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.end, %entry
  ret void
}

declare void @set_original_signal(i32, void (i32)*) #1

declare void @get_original_signal(i32) #1

; Function Attrs: noinline nounwind
define i32 @wait_for_single_pid(i32 %pid, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %got_pid = alloca i32, align 4
  %status = alloca i32, align 4
  %pstatus = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_status_by_pid(i32 %0)
  store i32 %call, i32* %pstatus, align 4
  %1 = load i32, i32* %pstatus, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.3, i32 0, i32 0))
  %2 = load i32, i32* %pid.addr, align 4
  call void (i8*, ...) @internal_error(i8* %call1, i32 %2)
  store i32 127, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %pstatus, align 4
  %cmp2 = icmp ne i32 %3, -2
  br i1 %cmp2, label %if.then3, label %if.end8

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* %pstatus, align 4
  %cmp4 = icmp sgt i32 %4, 128
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.then3
  %5 = load i32, i32* %pid.addr, align 4
  %call6 = call i32 @find_termsig_by_pid(i32 %5)
  store i32 %call6, i32* @last_command_exit_signal, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.then3
  %6 = load i32, i32* %pstatus, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  %call9 = call i32 @siginterrupt(i32 2, i32 1)
  br label %while.cond

while.cond:                                       ; preds = %if.end37, %if.end8
  %call10 = call i32 @wait(i32* %status)
  store i32 %call10, i32* %got_pid, align 4
  %7 = load i32, i32* %pid.addr, align 4
  %cmp11 = icmp ne i32 %call10, %7
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %do.body

do.body:                                          ; preds = %while.body
  %8 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then12, label %if.end13

if.then12:                                        ; preds = %do.body
  %9 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %9)
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end13
  br label %do.body14

do.body14:                                        ; preds = %do.end
  %10 = load i32, i32* @wait_intr_flag, align 4
  %tobool15 = icmp ne i32 %10, 0
  br i1 %tobool15, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %do.body14
  %11 = load i32, i32* @wait_signal_received, align 4
  %tobool16 = icmp ne i32 %11, 0
  br i1 %tobool16, label %land.lhs.true17, label %if.end22

land.lhs.true17:                                  ; preds = %land.lhs.true
  %12 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %tobool18 = icmp ne i32 (%struct.word_list*)* %12, null
  br i1 %tobool18, label %land.lhs.true19, label %if.end22

land.lhs.true19:                                  ; preds = %land.lhs.true17
  %13 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp20 = icmp eq i32 (%struct.word_list*)* %13, @wait_builtin
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true19
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @wait_intr_buf, i32 0, i32 0), i32 1) #3
  unreachable

if.end22:                                         ; preds = %land.lhs.true19, %land.lhs.true17, %land.lhs.true, %do.body14
  br label %do.end23

do.end23:                                         ; preds = %if.end22
  %14 = load i32, i32* %got_pid, align 4
  %cmp24 = icmp slt i32 %14, 0
  br i1 %cmp24, label %if.then25, label %if.else

if.then25:                                        ; preds = %do.end23
  %call26 = call i32* @__errno_location()
  %15 = load i32, i32* %call26, align 4
  %cmp27 = icmp ne i32 %15, 4
  br i1 %cmp27, label %land.lhs.true28, label %if.end33

land.lhs.true28:                                  ; preds = %if.then25
  %call29 = call i32* @__errno_location()
  %16 = load i32, i32* %call29, align 4
  %cmp30 = icmp ne i32 %16, 10
  br i1 %cmp30, label %if.then31, label %if.end33

if.then31:                                        ; preds = %land.lhs.true28
  %call32 = call i32 @siginterrupt(i32 2, i32 0)
  call void (i8*, ...) @sys_error(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %land.lhs.true28, %if.then25
  br label %while.end

if.else:                                          ; preds = %do.end23
  %17 = load i32, i32* %got_pid, align 4
  %cmp34 = icmp sgt i32 %17, 0
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.else
  %18 = load i32, i32* %got_pid, align 4
  %19 = load i32, i32* %status, align 4
  call void @set_pid_status(i32 %18, i32 %19)
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.else
  br label %if.end37

if.end37:                                         ; preds = %if.end36
  br label %while.cond

while.end:                                        ; preds = %if.end33, %while.cond
  %20 = load i32, i32* %got_pid, align 4
  %cmp38 = icmp sgt i32 %20, 0
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %while.end
  %21 = load i32, i32* %got_pid, align 4
  %22 = load i32, i32* %status, align 4
  call void @set_pid_status(i32 %21, i32 %22)
  %23 = load i32, i32* %got_pid, align 4
  call void @set_pid_flags(i32 %23, i32 2)
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %while.end
  %call41 = call i32 @siginterrupt(i32 2, i32 0)
  br label %do.body42

do.body42:                                        ; preds = %if.end40
  %24 = load volatile i32, i32* @terminating_signal, align 4
  %tobool43 = icmp ne i32 %24, 0
  br i1 %tobool43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %do.body42
  %25 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %25)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %do.body42
  %26 = load volatile i32, i32* @interrupt_state, align 4
  %tobool46 = icmp ne i32 %26, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end45
  call void @throw_to_top_level()
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %if.end45
  br label %do.end49

do.end49:                                         ; preds = %if.end48
  %27 = load i32, i32* %got_pid, align 4
  %cmp50 = icmp sgt i32 %27, 0
  br i1 %cmp50, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end49
  %28 = load i32, i32* %status, align 4
  %call51 = call i32 @process_exit_status(i32 %28)
  br label %cond.end

cond.false:                                       ; preds = %do.end49
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call51, %cond.true ], [ -1, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.end7, %if.then
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind
define internal i32 @find_status_by_pid(i32 %pid) #0 {
entry:
  %retval = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_index_by_pid(i32 %0)
  store i32 %call, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %2, i32 %3
  %flags = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 2
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 -2, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  %5 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %5, i32 %6
  %status = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx3, i32 0, i32 1
  %7 = load i32, i32* %status, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then1, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare void @internal_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @find_termsig_by_pid(i32 %pid) #0 {
entry:
  %retval = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_index_by_pid(i32 %0)
  store i32 %call, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %2, i32 %3
  %flags = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 2
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  %5 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %5, i32 %6
  %status = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx3, i32 0, i32 1
  %7 = load i32, i32* %status, align 4
  %call4 = call i32 @get_termsig(i32 %7)
  store i32 %call4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then1, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @siginterrupt(i32, i32) #1

declare i32 @wait(i32*) #1

declare void @termsig_handler(i32) #1

declare i32 @wait_builtin(%struct.word_list*) #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #2

; Function Attrs: noinline nounwind
define internal void @set_pid_status(i32 %pid, i32 %status) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %status.addr = alloca i32, align 4
  %slot = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %status, i32* %status.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %1 = load i32, i32* %status.addr, align 4
  call void @coproc_pidchk(i32 %0, i32 %1)
  %2 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_index_by_pid(i32 %2)
  store i32 %call, i32* %slot, align 4
  %3 = load i32, i32* %slot, align 4
  %cmp = icmp eq i32 %3, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end18

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %status.addr, align 4
  %call1 = call i32 @process_exit_status(i32 %4)
  %5 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %6 = load i32, i32* %slot, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %5, i32 %6
  %status2 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 1
  store i32 %call1, i32* %status2, align 4
  %7 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %8 = load i32, i32* %slot, align 4
  %arrayidx3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %7, i32 %8
  %flags = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx3, i32 0, i32 2
  %9 = load i32, i32* %flags, align 4
  %and = and i32 %9, -2
  store i32 %and, i32* %flags, align 4
  %10 = load i32, i32* %status.addr, align 4
  %and4 = and i32 %10, 65535
  %sub = sub i32 %and4, 1
  %cmp5 = icmp ult i32 %sub, 255
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end
  %11 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %12 = load i32, i32* %slot, align 4
  %arrayidx7 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %11, i32 %12
  %flags8 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx7, i32 0, i32 2
  %13 = load i32, i32* %flags8, align 4
  %or = or i32 %13, 16
  store i32 %or, i32* %flags8, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %if.end
  %14 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %15 = load i32, i32* %slot, align 4
  %arrayidx10 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %14, i32 %15
  %flags11 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx10, i32 0, i32 2
  %16 = load i32, i32* %flags11, align 4
  %and12 = and i32 %16, 4
  %cmp13 = icmp eq i32 %and12, 0
  br i1 %cmp13, label %if.then14, label %if.end18

if.then14:                                        ; preds = %if.end9
  %17 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %18 = load i32, i32* %slot, align 4
  %arrayidx15 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %17, i32 %18
  %flags16 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx15, i32 0, i32 2
  %19 = load i32, i32* %flags16, align 4
  %or17 = or i32 %19, 2
  store i32 %or17, i32* %flags16, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then, %if.then14, %if.end9
  ret void
}

; Function Attrs: noinline nounwind
define internal void @set_pid_flags(i32 %pid, i32 %flags) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %slot = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_index_by_pid(i32 %0)
  store i32 %call, i32* %slot, align 4
  %1 = load i32, i32* %slot, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %flags.addr, align 4
  %3 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %4 = load i32, i32* %slot, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %3, i32 %4
  %flags1 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 2
  %5 = load i32, i32* %flags1, align 4
  %or = or i32 %5, %2
  store i32 %or, i32* %flags1, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @process_exit_status(i32 %status) #0 {
entry:
  %retval = alloca i32, align 4
  %status.addr = alloca i32, align 4
  store i32 %status, i32* %status.addr, align 4
  %0 = load i32, i32* %status.addr, align 4
  %and = and i32 %0, 65535
  %sub = sub i32 %and, 1
  %cmp = icmp ult i32 %sub, 255
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %status.addr, align 4
  %and1 = and i32 %1, 127
  %add = add nsw i32 128, %and1
  store i32 %add, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %status.addr, align 4
  %and2 = and i32 %2, 65280
  %shr = ashr i32 %and2, 8
  store i32 %shr, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define void @wait_for_background_pids() #0 {
entry:
  %got_pid = alloca i32, align 4
  %status = alloca i32, align 4
  %call = call i32 @siginterrupt(i32 2, i32 1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %call1 = call i32 @wait(i32* %status)
  store i32 %call1, i32* %got_pid, align 4
  %cmp = icmp ne i32 %call1, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %0 = load i32, i32* %got_pid, align 4
  %1 = load i32, i32* %status, align 4
  call void @set_pid_status(i32 %0, i32 %1)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call2 = call i32* @__errno_location()
  %2 = load i32, i32* %call2, align 4
  %cmp3 = icmp ne i32 %2, 4
  br i1 %cmp3, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end
  %call4 = call i32* @__errno_location()
  %3 = load i32, i32* %call4, align 4
  %cmp5 = icmp ne i32 %3, 10
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call6 = call i32 @siginterrupt(i32 2, i32 0)
  call void (i8*, ...) @sys_error(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.end
  %call7 = call i32 @siginterrupt(i32 2, i32 0)
  br label %do.body

do.body:                                          ; preds = %if.end
  %4 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then8, label %if.end9

if.then8:                                         ; preds = %do.body
  %5 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %5)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %do.body
  %6 = load volatile i32, i32* @interrupt_state, align 4
  %tobool10 = icmp ne i32 %6, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  call void @throw_to_top_level()
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end9
  br label %do.end

do.end:                                           ; preds = %if.end12
  call void @mark_dead_jobs_as_notified(i32 1)
  %call13 = call i32 @cleanup_dead_jobs()
  ret void
}

; Function Attrs: noinline nounwind
define void @wait_sigint_cleanup() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind
define i32 @wait_for(i32 %pid) #0 {
entry:
  %retval = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %return_val = alloca i32, align 4
  %pstatus = alloca i32, align 4
  %got_pid = alloca i32, align 4
  %status = alloca i32, align 4
  %temp_handler = alloca void (i32)*, align 4
  store i32 %pid, i32* %pid.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_status_by_pid(i32 %0)
  store i32 %call, i32* %pstatus, align 4
  %1 = load i32, i32* %pstatus, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %pstatus, align 4
  %cmp1 = icmp ne i32 %2, -2
  br i1 %cmp1, label %if.then2, label %if.end7

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %pstatus, align 4
  %cmp3 = icmp sgt i32 %3, 128
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %pid.addr, align 4
  %call5 = call i32 @find_termsig_by_pid(i32 %4)
  store i32 %call5, i32* @last_command_exit_signal, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.then2
  %5 = load i32, i32* %pstatus, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  store i32 0, i32* @wait_sigint_received, align 4
  %6 = load i32, i32* @interactive_shell, align 4
  %cmp8 = icmp eq i32 %6, 0
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end7
  %call10 = call void (i32)* @signal(i32 2, void (i32)* @wait_sigint_handler)
  store void (i32)* %call10, void (i32)** @old_sigint_handler, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end7
  br label %while.cond

while.cond:                                       ; preds = %if.end43, %if.end11
  %call12 = call i32 @wait(i32* %status)
  store i32 %call12, i32* %got_pid, align 4
  %7 = load i32, i32* %pid.addr, align 4
  %cmp13 = icmp ne i32 %call12, %7
  br i1 %cmp13, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %do.body

do.body:                                          ; preds = %while.body
  %8 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then14, label %if.end15

if.then14:                                        ; preds = %do.body
  %9 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %9)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end15
  br label %do.body16

do.body16:                                        ; preds = %do.end
  %10 = load i32, i32* @wait_intr_flag, align 4
  %tobool17 = icmp ne i32 %10, 0
  br i1 %tobool17, label %land.lhs.true, label %if.end24

land.lhs.true:                                    ; preds = %do.body16
  %11 = load i32, i32* @wait_signal_received, align 4
  %tobool18 = icmp ne i32 %11, 0
  br i1 %tobool18, label %land.lhs.true19, label %if.end24

land.lhs.true19:                                  ; preds = %land.lhs.true
  %12 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %tobool20 = icmp ne i32 (%struct.word_list*)* %12, null
  br i1 %tobool20, label %land.lhs.true21, label %if.end24

land.lhs.true21:                                  ; preds = %land.lhs.true19
  %13 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp22 = icmp eq i32 (%struct.word_list*)* %13, @wait_builtin
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %land.lhs.true21
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @wait_intr_buf, i32 0, i32 0), i32 1) #3
  unreachable

if.end24:                                         ; preds = %land.lhs.true21, %land.lhs.true19, %land.lhs.true, %do.body16
  br label %do.end25

do.end25:                                         ; preds = %if.end24
  %14 = load i32, i32* %got_pid, align 4
  %cmp26 = icmp slt i32 %14, 0
  br i1 %cmp26, label %land.lhs.true27, label %if.else

land.lhs.true27:                                  ; preds = %do.end25
  %call28 = call i32* @__errno_location()
  %15 = load i32, i32* %call28, align 4
  %cmp29 = icmp eq i32 %15, 10
  br i1 %cmp29, label %if.then30, label %if.else

if.then30:                                        ; preds = %land.lhs.true27
  store i32 0, i32* %status, align 4
  br label %while.end

if.else:                                          ; preds = %land.lhs.true27, %do.end25
  %16 = load i32, i32* %got_pid, align 4
  %cmp31 = icmp slt i32 %16, 0
  br i1 %cmp31, label %land.lhs.true32, label %if.else38

land.lhs.true32:                                  ; preds = %if.else
  %call33 = call i32* @__errno_location()
  %17 = load i32, i32* %call33, align 4
  %cmp34 = icmp ne i32 %17, 4
  br i1 %cmp34, label %if.then35, label %if.else38

if.then35:                                        ; preds = %land.lhs.true32
  %18 = load i32, i32* %pid.addr, align 4
  %call36 = call i32* @__errno_location()
  %19 = load i32, i32* %call36, align 4
  %call37 = call i8* @strerror(i32 %19)
  call void (i8*, ...) @programming_error(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i32 0, i32 0), i32 %18, i8* %call37)
  br label %if.end42

if.else38:                                        ; preds = %land.lhs.true32, %if.else
  %20 = load i32, i32* %got_pid, align 4
  %cmp39 = icmp sgt i32 %20, 0
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.else38
  %21 = load i32, i32* %got_pid, align 4
  %22 = load i32, i32* %status, align 4
  call void @set_pid_status(i32 %21, i32 %22)
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.else38
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.then35
  br label %if.end43

if.end43:                                         ; preds = %if.end42
  br label %while.cond

while.end:                                        ; preds = %if.then30, %while.cond
  %23 = load i32, i32* %got_pid, align 4
  %cmp44 = icmp sgt i32 %23, 0
  br i1 %cmp44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %while.end
  %24 = load i32, i32* %got_pid, align 4
  %25 = load i32, i32* %status, align 4
  call void @set_pid_status(i32 %24, i32 %25)
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %while.end
  br label %do.body47

do.body47:                                        ; preds = %if.end46
  %26 = load volatile i32, i32* @terminating_signal, align 4
  %tobool48 = icmp ne i32 %26, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %do.body47
  %27 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %27)
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %do.body47
  br label %do.end51

do.end51:                                         ; preds = %if.end50
  br label %do.body52

do.body52:                                        ; preds = %do.end51
  %28 = load i32, i32* @wait_intr_flag, align 4
  %tobool53 = icmp ne i32 %28, 0
  br i1 %tobool53, label %land.lhs.true54, label %if.end61

land.lhs.true54:                                  ; preds = %do.body52
  %29 = load i32, i32* @wait_signal_received, align 4
  %tobool55 = icmp ne i32 %29, 0
  br i1 %tobool55, label %land.lhs.true56, label %if.end61

land.lhs.true56:                                  ; preds = %land.lhs.true54
  %30 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %tobool57 = icmp ne i32 (%struct.word_list*)* %30, null
  br i1 %tobool57, label %land.lhs.true58, label %if.end61

land.lhs.true58:                                  ; preds = %land.lhs.true56
  %31 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp59 = icmp eq i32 (%struct.word_list*)* %31, @wait_builtin
  br i1 %cmp59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %land.lhs.true58
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @wait_intr_buf, i32 0, i32 0), i32 1) #3
  unreachable

if.end61:                                         ; preds = %land.lhs.true58, %land.lhs.true56, %land.lhs.true54, %do.body52
  br label %do.end62

do.end62:                                         ; preds = %if.end61
  %32 = load i32, i32* @interactive_shell, align 4
  %cmp63 = icmp eq i32 %32, 0
  br i1 %cmp63, label %if.then64, label %if.end84

if.then64:                                        ; preds = %do.end62
  %33 = load void (i32)*, void (i32)** @old_sigint_handler, align 4
  store void (i32)* %33, void (i32)** %temp_handler, align 4
  call void @restore_sigint_handler()
  %34 = load i32, i32* %status, align 4
  %and = and i32 %34, 65535
  %sub = sub i32 %and, 1
  %cmp65 = icmp ult i32 %sub, 255
  br i1 %cmp65, label %land.lhs.true66, label %if.end83

land.lhs.true66:                                  ; preds = %if.then64
  %35 = load i32, i32* %status, align 4
  %and67 = and i32 %35, 127
  %cmp68 = icmp eq i32 %and67, 2
  br i1 %cmp68, label %if.then69, label %if.end83

if.then69:                                        ; preds = %land.lhs.true66
  %call70 = call i32 @maybe_call_trap_handler(i32 2)
  %cmp71 = icmp eq i32 %call70, 0
  br i1 %cmp71, label %if.then72, label %if.end82

if.then72:                                        ; preds = %if.then69
  %36 = load void (i32)*, void (i32)** %temp_handler, align 4
  %cmp73 = icmp eq void (i32)* %36, null
  br i1 %cmp73, label %if.then74, label %if.else75

if.then74:                                        ; preds = %if.then72
  call void @termsig_handler(i32 2)
  br label %if.end81

if.else75:                                        ; preds = %if.then72
  %37 = load void (i32)*, void (i32)** %temp_handler, align 4
  %cmp76 = icmp ne void (i32)* %37, bitcast (void ()* @wait_for_background_pids to void (i32)*)
  br i1 %cmp76, label %land.lhs.true77, label %if.end80

land.lhs.true77:                                  ; preds = %if.else75
  %38 = load void (i32)*, void (i32)** %temp_handler, align 4
  %cmp78 = icmp ne void (i32)* %38, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %land.lhs.true77
  %39 = load void (i32)*, void (i32)** %temp_handler, align 4
  call void %39(i32 2)
  br label %if.end80

if.end80:                                         ; preds = %if.then79, %land.lhs.true77, %if.else75
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.then74
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.then69
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %land.lhs.true66, %if.then64
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %do.end62
  %40 = load i32, i32* %status, align 4
  %call85 = call i32 @process_exit_status(i32 %40)
  store i32 %call85, i32* %return_val, align 4
  %41 = load i32, i32* %status, align 4
  %call86 = call i32 @get_termsig(i32 %41)
  store i32 %call86, i32* @last_command_exit_signal, align 4
  %42 = load i32, i32* %status, align 4
  %and87 = and i32 %42, 65535
  %mul = mul nsw i32 %and87, 65537
  %shr = ashr i32 %mul, 8
  %conv = trunc i32 %shr to i16
  %conv88 = sext i16 %conv to i32
  %cmp89 = icmp sgt i32 %conv88, 32512
  %conv90 = zext i1 %cmp89 to i32
  %cmp91 = icmp eq i32 %conv90, 0
  br i1 %cmp91, label %land.lhs.true93, label %if.end117

land.lhs.true93:                                  ; preds = %if.end84
  %43 = load i32, i32* %status, align 4
  %and94 = and i32 %43, 65535
  %sub95 = sub i32 %and94, 1
  %cmp96 = icmp ult i32 %sub95, 255
  br i1 %cmp96, label %land.lhs.true98, label %if.end117

land.lhs.true98:                                  ; preds = %land.lhs.true93
  %44 = load i32, i32* %status, align 4
  %and99 = and i32 %44, 127
  %cmp100 = icmp ne i32 %and99, 2
  br i1 %cmp100, label %land.lhs.true102, label %if.end117

land.lhs.true102:                                 ; preds = %land.lhs.true98
  %45 = load i32, i32* %status, align 4
  %and103 = and i32 %45, 127
  %cmp104 = icmp ne i32 %and103, 13
  br i1 %cmp104, label %if.then106, label %if.end117

if.then106:                                       ; preds = %land.lhs.true102
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %47 = load i32, i32* %status, align 4
  %and107 = and i32 %47, 127
  %call108 = call i8* @j_strsignal(i32 %and107)
  %call109 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* %call108)
  %48 = load i32, i32* %status, align 4
  %and110 = and i32 %48, 128
  %tobool111 = icmp ne i32 %and110, 0
  br i1 %tobool111, label %if.then112, label %if.end115

if.then112:                                       ; preds = %if.then106
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call113 = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.7, i32 0, i32 0))
  %call114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* %call113)
  br label %if.end115

if.end115:                                        ; preds = %if.then112, %if.then106
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call116 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  br label %if.end117

if.end117:                                        ; preds = %if.end115, %land.lhs.true102, %land.lhs.true98, %land.lhs.true93, %if.end84
  %51 = load i32, i32* @interactive_shell, align 4
  %tobool118 = icmp ne i32 %51, 0
  br i1 %tobool118, label %land.lhs.true119, label %if.else139

land.lhs.true119:                                 ; preds = %if.end117
  %52 = load i32, i32* @subshell_environment, align 4
  %cmp120 = icmp eq i32 %52, 0
  br i1 %cmp120, label %if.then122, label %if.else139

if.then122:                                       ; preds = %land.lhs.true119
  %53 = load i32, i32* %status, align 4
  %and123 = and i32 %53, 65535
  %sub124 = sub i32 %and123, 1
  %cmp125 = icmp ult i32 %sub124, 255
  br i1 %cmp125, label %if.then134, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then122
  %54 = load i32, i32* %status, align 4
  %and127 = and i32 %54, 65535
  %mul128 = mul nsw i32 %and127, 65537
  %shr129 = ashr i32 %mul128, 8
  %conv130 = trunc i32 %shr129 to i16
  %conv131 = sext i16 %conv130 to i32
  %cmp132 = icmp sgt i32 %conv131, 32512
  br i1 %cmp132, label %if.then134, label %if.else136

if.then134:                                       ; preds = %lor.lhs.false, %if.then122
  %call135 = call i32 @set_tty_state()
  br label %if.end138

if.else136:                                       ; preds = %lor.lhs.false
  %call137 = call i32 @get_tty_state()
  br label %if.end138

if.end138:                                        ; preds = %if.else136, %if.then134
  br label %if.end149

if.else139:                                       ; preds = %land.lhs.true119, %if.end117
  %55 = load i32, i32* @interactive_shell, align 4
  %cmp140 = icmp eq i32 %55, 0
  br i1 %cmp140, label %land.lhs.true142, label %if.end148

land.lhs.true142:                                 ; preds = %if.else139
  %56 = load i32, i32* @subshell_environment, align 4
  %cmp143 = icmp eq i32 %56, 0
  br i1 %cmp143, label %land.lhs.true145, label %if.end148

land.lhs.true145:                                 ; preds = %land.lhs.true142
  %57 = load i32, i32* @check_window_size, align 4
  %tobool146 = icmp ne i32 %57, 0
  br i1 %tobool146, label %if.then147, label %if.end148

if.then147:                                       ; preds = %land.lhs.true145
  call void @get_new_window_size(i32 0, i32* null, i32* null)
  br label %if.end148

if.end148:                                        ; preds = %if.then147, %land.lhs.true145, %land.lhs.true142, %if.else139
  br label %if.end149

if.end149:                                        ; preds = %if.end148, %if.end138
  %58 = load i32, i32* %return_val, align 4
  store i32 %58, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end149, %if.end6, %if.then
  %59 = load i32, i32* %retval, align 4
  ret i32 %59
}

; Function Attrs: noinline nounwind
define internal void @wait_sigint_handler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %sigint_handler = alloca void (i32)*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %tobool = icmp ne i32 (%struct.word_list*)* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp = icmp eq i32 (%struct.word_list*)* %1, @wait_builtin
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %call = call i32 @signal_is_trapped(i32 2)
  %tobool2 = icmp ne i32 %call, 0
  br i1 %tobool2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true1
  %call4 = call void (i32)* @trap_to_sighandler(i32 2)
  store void (i32)* %call4, void (i32)** %sigint_handler, align 4
  %cmp5 = icmp eq void (i32)* %call4, @trap_handler
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true3
  store i32 130, i32* @last_command_exit_value, align 4
  call void @restore_sigint_handler()
  store i32 0, i32* @interrupt_immediately, align 4
  call void @trap_handler(i32 2)
  store i32 2, i32* @wait_signal_received, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true3, %land.lhs.true1, %land.lhs.true, %entry
  %2 = load i32, i32* @interrupt_immediately, align 4
  %tobool6 = icmp ne i32 %2, 0
  br i1 %tobool6, label %if.then7, label %if.end14

if.then7:                                         ; preds = %if.end
  store i32 1, i32* @last_command_exit_value, align 4
  call void @restore_sigint_handler()
  %3 = load volatile i32, i32* @interrupt_state, align 4
  %inc = add nsw i32 %3, 1
  store volatile i32 %inc, i32* @interrupt_state, align 4
  br label %do.body

do.body:                                          ; preds = %if.then7
  %4 = load volatile i32, i32* @terminating_signal, align 4
  %tobool8 = icmp ne i32 %4, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  %5 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %5)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  %6 = load volatile i32, i32* @interrupt_state, align 4
  %tobool11 = icmp ne i32 %6, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  call void @throw_to_top_level()
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  br label %do.end

do.end:                                           ; preds = %if.end13
  br label %if.end14

if.end14:                                         ; preds = %do.end, %if.end
  store i32 1, i32* @wait_sigint_received, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then
  ret void
}

declare void @programming_error(i8*, ...) #1

declare i8* @strerror(i32) #1

; Function Attrs: noinline nounwind
define internal void @restore_sigint_handler() #0 {
entry:
  %0 = load void (i32)*, void (i32)** @old_sigint_handler, align 4
  %cmp = icmp ne void (i32)* %0, bitcast (void ()* @wait_for_background_pids to void (i32)*)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load void (i32)*, void (i32)** @old_sigint_handler, align 4
  %call = call void (i32)* @signal(i32 2, void (i32)* %1)
  store void (i32)* bitcast (void ()* @wait_for_background_pids to void (i32)*), void (i32)** @old_sigint_handler, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @maybe_call_trap_handler(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @get_termsig(i32 %status) #0 {
entry:
  %retval = alloca i32, align 4
  %status.addr = alloca i32, align 4
  store i32 %status, i32* %status.addr, align 4
  %0 = load i32, i32* %status.addr, align 4
  %and = and i32 %0, 65535
  %mul = mul nsw i32 %and, 65537
  %shr = ashr i32 %mul, 8
  %conv = trunc i32 %shr to i16
  %conv1 = sext i16 %conv to i32
  %cmp = icmp sgt i32 %conv1, 32512
  %conv2 = zext i1 %cmp to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %status.addr, align 4
  %and5 = and i32 %1, 65535
  %sub = sub i32 %and5, 1
  %cmp6 = icmp ult i32 %sub, 255
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %status.addr, align 4
  %and8 = and i32 %2, 127
  store i32 %and8, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define internal i8* @j_strsignal(i32 %s) #0 {
entry:
  %s.addr = alloca i32, align 4
  %x = alloca i8*, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  %arrayidx = getelementptr inbounds [0 x i8*], [0 x i8*]* @sys_siglist, i32 0, i32 %0
  %1 = load i8*, i8** %arrayidx, align 4
  store i8* %1, i8** %x, align 4
  %2 = load i8*, i8** %x, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([64 x i8], [64 x i8]* @j_strsignal.retcode_name_buffer, i32 0, i32 0), i8** %x, align 4
  %3 = load i8*, i8** %x, align 4
  %4 = load i32, i32* %s.addr, align 4
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i32 0, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %x, align 4
  ret i8* %5
}

; Function Attrs: noinline nounwind
define i32 @set_tty_state() #0 {
entry:
  %retval = alloca i32, align 4
  %tty = alloca i32, align 4
  %0 = load i32, i32* @shell_tty, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @shell_tty, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %2)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, i32* %tty, align 4
  %3 = load i32, i32* %tty, align 4
  %cmp1 = icmp ne i32 %3, -1
  br i1 %cmp1, label %if.then, label %if.end5

if.then:                                          ; preds = %cond.end
  %4 = load i32, i32* @got_tty_state, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %5 = load i32, i32* %tty, align 4
  %call4 = call i32 @ttsetattr(i32 %5, %struct.termios* @shell_tty_info)
  br label %if.end5

if.end5:                                          ; preds = %if.end, %cond.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then3
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare void @get_new_window_size(i32, i32*, i32*) #1

; Function Attrs: noinline nounwind
define i32 @kill_pid(i32 %pid, i32 %signal, i32 %group) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %signal.addr = alloca i32, align 4
  %group.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %signal, i32* %signal.addr, align 4
  store i32 %group, i32* %group.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %cmp = icmp slt i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %pid.addr, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %pid.addr, align 4
  store i32 1, i32* %group.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %group.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %3 = load i32, i32* %pid.addr, align 4
  %sub1 = sub nsw i32 0, %3
  %4 = load i32, i32* %signal.addr, align 4
  %call = call i32 @kill(i32 %sub1, i32 %4)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %5 = load i32, i32* %pid.addr, align 4
  %6 = load i32, i32* %signal.addr, align 4
  %call2 = call i32 @kill(i32 %5, i32 %6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %call2, %cond.false ]
  store i32 %cond, i32* %result, align 4
  %7 = load i32, i32* %result, align 4
  ret i32 %7
}

declare i32 @kill(i32, i32) #1

declare i32 @ttgetattr(i32, %struct.termios*) #1

declare i32 @ttsetattr(i32, %struct.termios*) #1

; Function Attrs: noinline nounwind
define i32 @give_terminal_to(i32 %pgrp, i32 %force) #0 {
entry:
  %pgrp.addr = alloca i32, align 4
  %force.addr = alloca i32, align 4
  store i32 %pgrp, i32* %pgrp.addr, align 4
  store i32 %force, i32* %force.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @stop_pipeline(i32 %async, %struct.command* %ignore) #0 {
entry:
  %async.addr = alloca i32, align 4
  %ignore.addr = alloca %struct.command*, align 4
  store i32 %async, i32* %async.addr, align 4
  store %struct.command* %ignore, %struct.command** %ignore.addr, align 4
  store i32 0, i32* @already_making_children, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @stop_making_children() #0 {
entry:
  store i32 0, i32* @already_making_children, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @without_job_control() #0 {
entry:
  call void @stop_making_children()
  store volatile i32 -1, i32* @last_made_pid, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @get_job_by_pid(i32 %pid, i32 %block) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %block.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %block, i32* %block.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call i32 @find_index_by_pid(i32 %0)
  store i32 %call, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %i, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define internal i32 @find_index_by_pid(i32 %pid) #0 {
entry:
  %retval = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @pid_list_size, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %2, i32 %3
  %pid1 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 0
  %4 = load i32, i32* %pid1, align 4
  %5 = load i32, i32* %pid.addr, align 4
  %cmp2 = icmp eq i32 %4, %5
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  store i32 %6, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define void @describe_pid(i32 %pid) #0 {
entry:
  %pid.addr = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i32, i32* %pid.addr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 %1)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @freeze_jobs_list() #0 {
entry:
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @unfreeze_jobs_list() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind
define i32 @count_all_jobs() #0 {
entry:
  ret i32 0
}

declare i32 @getmaxchild() #1

; Function Attrs: noinline nounwind
define internal i32 @find_proc_slot(i32 %pid) #0 {
entry:
  %retval = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @pid_list_size, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %2, i32 %3
  %pid1 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 0
  %4 = load i32, i32* %pid1, align 4
  %cmp2 = icmp eq i32 %4, -1
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %5, i32 %6
  %pid4 = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx3, i32 0, i32 0
  %7 = load i32, i32* %pid4, align 4
  %8 = load i32, i32* %pid.addr, align 4
  %cmp5 = icmp eq i32 %7, %8
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %9 = load i32, i32* %i, align 4
  store i32 %9, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* @pid_list_size, align 4
  %cmp6 = icmp eq i32 %11, %12
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.end
  call void @alloc_pid_list()
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %for.end
  %13 = load i32, i32* %i, align 4
  store i32 %13, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind
define internal void @alloc_pid_list() #0 {
entry:
  %i = alloca i32, align 4
  %old = alloca i32, align 4
  %0 = load i32, i32* @pid_list_size, align 4
  store i32 %0, i32* %old, align 4
  %1 = load i32, i32* @pid_list_size, align 4
  %add = add nsw i32 %1, 10
  store i32 %add, i32* @pid_list_size, align 4
  %2 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %3 = bitcast %struct.proc_status* %2 to i8*
  %4 = load i32, i32* @pid_list_size, align 4
  %mul = mul i32 %4, 12
  %call = call i8* @sh_xrealloc(i8* %3, i32 %mul, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 169)
  %5 = bitcast i8* %call to %struct.proc_status*
  store %struct.proc_status* %5, %struct.proc_status** @pid_list, align 4
  %6 = load i32, i32* %old, align 4
  store i32 %6, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* @pid_list_size, align 4
  %cmp = icmp slt i32 %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.proc_status*, %struct.proc_status** @pid_list, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.proc_status, %struct.proc_status* %9, i32 %10
  %pid = getelementptr inbounds %struct.proc_status, %struct.proc_status* %arrayidx, i32 0, i32 0
  store i32 -1, i32* %pid, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare void @coproc_pidchk(i32, i32) #1

declare void (i32)* @trap_to_sighandler(i32) #1

declare void @trap_handler(i32) #1

declare i32 @sprintf(i8*, i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
