; ModuleID = 'trap.c'
source_filename = "trap.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct._sh_parser_state_t = type { i32, i32*, i8*, i32, i32, i32, i8**, i32, i32, i32, i32, %struct.array*, i32 (%struct.word_list*)*, i32 (%struct.word_list*)*, i32, i32, i32, i32, [16 x %struct.redirect*] }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%struct.__sigset_t = type { [32 x i32] }

@.str = private unnamed_addr constant [5 x i8] c"EXIT\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"SIGHUP\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"SIGINT\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"SIGQUIT\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"SIGILL\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"SIGTRAP\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"SIGABRT\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"SIGBUS\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"SIGFPE\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"SIGKILL\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"SIGUSR1\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"SIGSEGV\00", align 1
@.str.12 = private unnamed_addr constant [8 x i8] c"SIGUSR2\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c"SIGPIPE\00", align 1
@.str.14 = private unnamed_addr constant [8 x i8] c"SIGALRM\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"SIGTERM\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"SIGSTKFLT\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"SIGCHLD\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"SIGCONT\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"SIGSTOP\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"SIGTSTP\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"SIGTTIN\00", align 1
@.str.22 = private unnamed_addr constant [8 x i8] c"SIGTTOU\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"SIGURG\00", align 1
@.str.24 = private unnamed_addr constant [8 x i8] c"SIGXCPU\00", align 1
@.str.25 = private unnamed_addr constant [8 x i8] c"SIGXFSZ\00", align 1
@.str.26 = private unnamed_addr constant [10 x i8] c"SIGVTALRM\00", align 1
@.str.27 = private unnamed_addr constant [8 x i8] c"SIGPROF\00", align 1
@.str.28 = private unnamed_addr constant [9 x i8] c"SIGWINCH\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"SIGIO\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"SIGPWR\00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"SIGSYS\00", align 1
@.str.32 = private unnamed_addr constant [12 x i8] c"SIGJUNK(32)\00", align 1
@.str.33 = private unnamed_addr constant [12 x i8] c"SIGJUNK(33)\00", align 1
@.str.34 = private unnamed_addr constant [9 x i8] c"SIGRTMIN\00", align 1
@.str.35 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+1\00", align 1
@.str.36 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+2\00", align 1
@.str.37 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+3\00", align 1
@.str.38 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+4\00", align 1
@.str.39 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+5\00", align 1
@.str.40 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+6\00", align 1
@.str.41 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+7\00", align 1
@.str.42 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+8\00", align 1
@.str.43 = private unnamed_addr constant [11 x i8] c"SIGRTMIN+9\00", align 1
@.str.44 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+10\00", align 1
@.str.45 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+11\00", align 1
@.str.46 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+12\00", align 1
@.str.47 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+13\00", align 1
@.str.48 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+14\00", align 1
@.str.49 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+15\00", align 1
@.str.50 = private unnamed_addr constant [12 x i8] c"SIGRTMAX-14\00", align 1
@.str.51 = private unnamed_addr constant [12 x i8] c"SIGRTMAX-13\00", align 1
@.str.52 = private unnamed_addr constant [12 x i8] c"SIGRTMAX-12\00", align 1
@.str.53 = private unnamed_addr constant [12 x i8] c"SIGRTMAX-11\00", align 1
@.str.54 = private unnamed_addr constant [12 x i8] c"SIGRTMAX-10\00", align 1
@.str.55 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-9\00", align 1
@.str.56 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-8\00", align 1
@.str.57 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-7\00", align 1
@.str.58 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-6\00", align 1
@.str.59 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-5\00", align 1
@.str.60 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-4\00", align 1
@.str.61 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-3\00", align 1
@.str.62 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-2\00", align 1
@.str.63 = private unnamed_addr constant [11 x i8] c"SIGRTMAX-1\00", align 1
@.str.64 = private unnamed_addr constant [9 x i8] c"SIGRTMAX\00", align 1
@.str.65 = private unnamed_addr constant [6 x i8] c"DEBUG\00", align 1
@.str.66 = private unnamed_addr constant [4 x i8] c"ERR\00", align 1
@.str.67 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1
@signal_names = global [69 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.48, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.50, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.52, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.61, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.63, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.65, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.67, i32 0, i32 0), i8* null], align 4
@trap_list = common global [68 x i8*] zeroinitializer, align 4
@sigmodes = internal global [68 x i32] zeroinitializer, align 4
@original_signals = common global [65 x void (i32)*] zeroinitializer, align 4
@pending_traps = common global [65 x i32] zeroinitializer, align 4
@interactive = external global i32, align 4
@.str.68 = private unnamed_addr constant [22 x i8] c"invalid signal number\00", align 1
@.str.69 = private unnamed_addr constant [4 x i8] c"SIG\00", align 1
@catch_flag = internal global i32 0, align 4
@running_trap = common global i32 0, align 4
@trapped_signal_received = common global i32 0, align 4
@last_command_exit_value = external global i32, align 4
@trap_saved_exit_value = common global i32 0, align 4
@interrupt_state = external global i32, align 4
@.str.70 = private unnamed_addr constant [50 x i8] c"run_pending_traps: bad value in trap_list[%d]: %p\00", align 1
@.str.71 = private unnamed_addr constant [74 x i8] c"run_pending_traps: signal handler is SIG_DFL, resending %d (%s) to myself\00", align 1
@subst_assign_varlist = external global %struct.word_list*, align 4
@temporary_env = external global %struct.hash_table*, align 4
@.str.72 = private unnamed_addr constant [7 x i8] c"trap.c\00", align 1
@.str.73 = private unnamed_addr constant [5 x i8] c"trap\00", align 1
@.str.74 = private unnamed_addr constant [28 x i8] c"trap_handler: bad signal %d\00", align 1
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@wait_signal_received = common global i32 0, align 4
@interrupt_immediately = external global i32, align 4
@wait_intr_flag = external global i32, align 4
@wait_intr_buf = external global [1 x %struct.__jmp_buf_tag], align 4
@rl_readline_state = external global i32, align 4
@sigalrm_seen = external global i32, align 4
@alrmbuf = external global [1 x %struct.__jmp_buf_tag], align 4
@terminating_signal = external global i32, align 4
@top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@return_catch_flag = external global i32, align 4
@return_catch = external global [1 x %struct.__jmp_buf_tag], align 4
@.str.75 = private unnamed_addr constant [10 x i8] c"exit trap\00", align 1
@return_catch_value = external global i32, align 4
@.str.76 = private unnamed_addr constant [11 x i8] c"debug trap\00", align 1
@debugging_mode = external global i32, align 4
@.str.77 = private unnamed_addr constant [11 x i8] c"error trap\00", align 1
@.str.78 = private unnamed_addr constant [12 x i8] c"return trap\00", align 1
@.str.79 = private unnamed_addr constant [15 x i8] c"interrupt trap\00", align 1
@function_trace_mode = external global i32, align 4
@error_trace_mode = external global i32, align 4

; Function Attrs: noinline nounwind
define void @initialize_traps() #0 {
entry:
  %i = alloca i32, align 4
  store i8* null, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 67), align 4
  store i8* null, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 66), align 4
  store i8* null, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 65), align 4
  store i8* null, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 0), align 4
  store i32 0, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 67), align 4
  store i32 0, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 66), align 4
  store i32 0, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 65), align 4
  store i32 0, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  store void (i32)* bitcast (void ()* @initialize_traps to void (i32)*), void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 0), align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %1
  store i32 0, i32* %arrayidx, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %2
  store i8* null, i8** %arrayidx1, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %3
  store i32 0, i32* %arrayidx2, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %4
  store void (i32)* bitcast (void ()* @initialize_traps to void (i32)*), void (i32)** %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %for.end
  %call = call void (i32)* @signal(i32 17, void (i32)* null)
  store void (i32)* %call, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 17), align 4
  %6 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 17), align 4
  %call4 = call void (i32)* @signal(i32 17, void (i32)* %6)
  %7 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 17), align 4
  %cmp5 = icmp eq void (i32)* %7, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %8 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 17), align 4
  %or = or i32 %8, 2
  store i32 %or, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 17), align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %9 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 17), align 4
  %or6 = or i32 %9, 12
  store i32 %or6, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 17), align 4
  br label %do.body7

do.body7:                                         ; preds = %do.end
  %call8 = call void (i32)* @signal(i32 2, void (i32)* null)
  store void (i32)* %call8, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 2), align 4
  %10 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 2), align 4
  %call9 = call void (i32)* @signal(i32 2, void (i32)* %10)
  %11 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 2), align 4
  %cmp10 = icmp eq void (i32)* %11, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %do.body7
  %12 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  %or12 = or i32 %12, 2
  store i32 %or12, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %do.body7
  br label %do.end14

do.end14:                                         ; preds = %if.end13
  %13 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  %or15 = or i32 %13, 4
  store i32 %or15, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  br label %do.body16

do.body16:                                        ; preds = %do.end14
  %call17 = call void (i32)* @signal(i32 3, void (i32)* null)
  store void (i32)* %call17, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 3), align 4
  %14 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 3), align 4
  %call18 = call void (i32)* @signal(i32 3, void (i32)* %14)
  %15 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 3), align 4
  %cmp19 = icmp eq void (i32)* %15, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %do.body16
  %16 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 3), align 4
  %or21 = or i32 %16, 2
  store i32 %or21, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 3), align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %do.body16
  br label %do.end23

do.end23:                                         ; preds = %if.end22
  %17 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 3), align 4
  %or24 = or i32 %17, 4
  store i32 %or24, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 3), align 4
  %18 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %18, 0
  br i1 %tobool, label %if.then25, label %if.end35

if.then25:                                        ; preds = %do.end23
  br label %do.body26

do.body26:                                        ; preds = %if.then25
  %call27 = call void (i32)* @signal(i32 15, void (i32)* null)
  store void (i32)* %call27, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 15), align 4
  %19 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 15), align 4
  %call28 = call void (i32)* @signal(i32 15, void (i32)* %19)
  %20 = load void (i32)*, void (i32)** getelementptr inbounds ([65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 15), align 4
  %cmp29 = icmp eq void (i32)* %20, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %do.body26
  %21 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 15), align 4
  %or31 = or i32 %21, 2
  store i32 %or31, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 15), align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %do.body26
  br label %do.end33

do.end33:                                         ; preds = %if.end32
  %22 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 15), align 4
  %or34 = or i32 %22, 4
  store i32 %or34, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 15), align 4
  br label %if.end35

if.end35:                                         ; preds = %do.end33, %do.end23
  call void @get_original_tty_job_signals()
  ret void
}

declare void (i32)* @signal(i32, void (i32)*) #1

declare void @get_original_tty_job_signals() #1

; Function Attrs: noinline nounwind
define i8* @signal_name(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp sge i32 %0, 68
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp slt i32 %1, 0
  br i1 %cmp1, label %cond.true, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [69 x i8*], [69 x i8*]* @signal_names, i32 0, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %cmp3 = icmp eq i8* %3, null
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.68, i32 0, i32 0))
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false2
  %4 = load i32, i32* %sig.addr, align 4
  %arrayidx4 = getelementptr inbounds [69 x i8*], [69 x i8*]* @signal_names, i32 0, i32 %4
  %5 = load i8*, i8** %arrayidx4, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %5, %cond.false ]
  store i8* %cond, i8** %ret, align 4
  %6 = load i8*, i8** %ret, align 4
  ret i8* %6
}

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define i32 @decode_signal(i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %sig = alloca i64, align 8
  %name = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @legal_number(i8* %0, i64* %sig)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %sig, align 8
  %cmp = icmp sge i64 %1, 0
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then
  %2 = load i64, i64* %sig, align 8
  %cmp1 = icmp slt i64 %2, 65
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i64, i64* %sig, align 8
  %conv = trunc i64 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ -1, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, i64* %sig, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %sig, align 8
  %cmp2 = icmp slt i64 %4, 68
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %sig, align 8
  %idxprom = trunc i64 %5 to i32
  %arrayidx = getelementptr inbounds [69 x i8*], [69 x i8*]* @signal_names, i32 0, i32 %idxprom
  %6 = load i8*, i8** %arrayidx, align 4
  store i8* %6, i8** %name, align 4
  %7 = load i8*, i8** %name, align 4
  %cmp4 = icmp eq i8* %7, null
  br i1 %cmp4, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %8 = load i8*, i8** %name, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %9 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %for.body
  br label %for.inc

if.end11:                                         ; preds = %lor.lhs.false
  br i1 false, label %cond.true12, label %cond.false13

cond.true12:                                      ; preds = %if.end11
  br i1 true, label %if.then23, label %if.end48

cond.false13:                                     ; preds = %if.end11
  %10 = load i8*, i8** %name, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %11 to i32
  %12 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.69, i32 0, i32 0), align 1
  %conv16 = sext i8 %12 to i32
  %cmp17 = icmp eq i32 %conv15, %conv16
  br i1 %cmp17, label %land.lhs.true19, label %if.end48

land.lhs.true19:                                  ; preds = %cond.false13
  %13 = load i8*, i8** %name, align 4
  %call20 = call i32 @strncmp(i8* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.69, i32 0, i32 0), i32 3)
  %cmp21 = icmp eq i32 %call20, 0
  br i1 %cmp21, label %if.then23, label %if.end48

if.then23:                                        ; preds = %land.lhs.true19, %cond.true12
  %14 = load i8*, i8** %name, align 4
  %add.ptr = getelementptr inbounds i8, i8* %14, i32 3
  store i8* %add.ptr, i8** %name, align 4
  %15 = load i32, i32* %flags.addr, align 4
  %and = and i32 %15, 2
  %tobool24 = icmp ne i32 %and, 0
  br i1 %tobool24, label %land.lhs.true25, label %if.else

land.lhs.true25:                                  ; preds = %if.then23
  %16 = load i8*, i8** %string.addr, align 4
  %17 = load i8*, i8** %name, align 4
  %call26 = call i32 @strcasecmp(i8* %16, i8* %17)
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %if.then29, label %if.else

if.then29:                                        ; preds = %land.lhs.true25
  %18 = load i64, i64* %sig, align 8
  %conv30 = trunc i64 %18 to i32
  store i32 %conv30, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true25, %if.then23
  %19 = load i32, i32* %flags.addr, align 4
  %and31 = and i32 %19, 2
  %cmp32 = icmp eq i32 %and31, 0
  br i1 %cmp32, label %land.lhs.true34, label %if.else40

land.lhs.true34:                                  ; preds = %if.else
  %20 = load i8*, i8** %string.addr, align 4
  %21 = load i8*, i8** %name, align 4
  %call35 = call i32 @strcmp(i8* %20, i8* %21)
  %cmp36 = icmp eq i32 %call35, 0
  br i1 %cmp36, label %if.then38, label %if.else40

if.then38:                                        ; preds = %land.lhs.true34
  %22 = load i64, i64* %sig, align 8
  %conv39 = trunc i64 %22 to i32
  store i32 %conv39, i32* %retval, align 4
  br label %return

if.else40:                                        ; preds = %land.lhs.true34, %if.else
  %23 = load i32, i32* %flags.addr, align 4
  %and41 = and i32 %23, 1
  %cmp42 = icmp eq i32 %and41, 0
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.else40
  br label %for.inc

if.end45:                                         ; preds = %if.else40
  br label %if.end46

if.end46:                                         ; preds = %if.end45
  br label %if.end47

if.end47:                                         ; preds = %if.end46
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %land.lhs.true19, %cond.false13, %cond.true12
  %24 = load i64, i64* %sig, align 8
  %idxprom49 = trunc i64 %24 to i32
  %arrayidx50 = getelementptr inbounds [69 x i8*], [69 x i8*]* @signal_names, i32 0, i32 %idxprom49
  %25 = load i8*, i8** %arrayidx50, align 4
  store i8* %25, i8** %name, align 4
  %26 = load i32, i32* %flags.addr, align 4
  %and51 = and i32 %26, 2
  %tobool52 = icmp ne i32 %and51, 0
  br i1 %tobool52, label %land.lhs.true53, label %if.else59

land.lhs.true53:                                  ; preds = %if.end48
  %27 = load i8*, i8** %string.addr, align 4
  %28 = load i8*, i8** %name, align 4
  %call54 = call i32 @strcasecmp(i8* %27, i8* %28)
  %cmp55 = icmp eq i32 %call54, 0
  br i1 %cmp55, label %if.then57, label %if.else59

if.then57:                                        ; preds = %land.lhs.true53
  %29 = load i64, i64* %sig, align 8
  %conv58 = trunc i64 %29 to i32
  store i32 %conv58, i32* %retval, align 4
  br label %return

if.else59:                                        ; preds = %land.lhs.true53, %if.end48
  %30 = load i32, i32* %flags.addr, align 4
  %and60 = and i32 %30, 2
  %cmp61 = icmp eq i32 %and60, 0
  br i1 %cmp61, label %land.lhs.true63, label %if.end69

land.lhs.true63:                                  ; preds = %if.else59
  %31 = load i8*, i8** %string.addr, align 4
  %32 = load i8*, i8** %name, align 4
  %call64 = call i32 @strcmp(i8* %31, i8* %32)
  %cmp65 = icmp eq i32 %call64, 0
  br i1 %cmp65, label %if.then67, label %if.end69

if.then67:                                        ; preds = %land.lhs.true63
  %33 = load i64, i64* %sig, align 8
  %conv68 = trunc i64 %33 to i32
  store i32 %conv68, i32* %retval, align 4
  br label %return

if.end69:                                         ; preds = %land.lhs.true63, %if.else59
  br label %if.end70

if.end70:                                         ; preds = %if.end69
  br label %for.inc

for.inc:                                          ; preds = %if.end70, %if.then44, %if.then10
  %34 = load i64, i64* %sig, align 8
  %inc = add nsw i64 %34, 1
  store i64 %inc, i64* %sig, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then67, %if.then57, %if.then38, %if.then29, %cond.end
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

declare i32 @legal_number(i8*, i64*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @strcasecmp(i8*, i8*) #1

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @run_pending_traps() #0 {
entry:
  %sig = alloca i32, align 4
  %old_exit_value = alloca i32, align 4
  %x = alloca i32, align 4
  %save_subst_varlist = alloca %struct.word_list*, align 4
  %save_tempenv = alloca %struct.hash_table*, align 4
  %pstate = alloca %struct._sh_parser_state_t, align 4
  %ps = alloca %struct.array*, align 4
  %0 = load i32, i32* @catch_flag, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @running_trap, align 4
  %cmp1 = icmp sgt i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* @running_trap, align 4
  %cmp3 = icmp eq i32 %2, 29
  br i1 %cmp3, label %land.lhs.true, label %if.end5

land.lhs.true:                                    ; preds = %if.then2
  %3 = load i32, i32* getelementptr inbounds ([65 x i32], [65 x i32]* @pending_traps, i32 0, i32 28), align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then4, label %if.end5

if.then4:                                         ; preds = %land.lhs.true
  br label %return

if.end5:                                          ; preds = %land.lhs.true, %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  store i32 0, i32* @trapped_signal_received, align 4
  store i32 0, i32* @catch_flag, align 4
  %4 = load i32, i32* @last_command_exit_value, align 4
  store i32 %4, i32* %old_exit_value, align 4
  store i32 %4, i32* @trap_saved_exit_value, align 4
  %call = call %struct.array* @save_pipestatus_array()
  store %struct.array* %call, %struct.array** %ps, align 4
  store i32 1, i32* %sig, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %5 = load i32, i32* %sig, align 4
  %cmp7 = icmp slt i32 %5, 65
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %sig, align 4
  %arrayidx = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %6
  %7 = load i32, i32* %arrayidx, align 4
  %tobool8 = icmp ne i32 %7, 0
  br i1 %tobool8, label %if.then9, label %if.end48

if.then9:                                         ; preds = %for.body
  %8 = load i32, i32* @running_trap, align 4
  %9 = load i32, i32* %sig, align 4
  %add = add nsw i32 %9, 1
  %cmp10 = icmp eq i32 %8, %add
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.then9
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.then9
  %10 = load i32, i32* %sig, align 4
  %add13 = add nsw i32 %10, 1
  store i32 %add13, i32* @running_trap, align 4
  %11 = load i32, i32* %sig, align 4
  %cmp14 = icmp eq i32 %11, 2
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %if.end12
  %12 = load i32, i32* %sig, align 4
  %arrayidx16 = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %12
  store i32 0, i32* %arrayidx16, align 4
  call void @run_interrupt_trap(i32 0)
  store volatile i32 0, i32* @interrupt_state, align 4
  br label %if.end46

if.else:                                          ; preds = %if.end12
  %13 = load i32, i32* %sig, align 4
  %arrayidx17 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %13
  %14 = load i8*, i8** %arrayidx17, align 4
  %cmp18 = icmp eq i8* %14, null
  br i1 %cmp18, label %if.then24, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %15 = load i32, i32* %sig, align 4
  %arrayidx19 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %15
  %16 = load i8*, i8** %arrayidx19, align 4
  %cmp20 = icmp eq i8* %16, inttoptr (i32 1 to i8*)
  br i1 %cmp20, label %if.then24, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false
  %17 = load i32, i32* %sig, align 4
  %arrayidx22 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %17
  %18 = load i8*, i8** %arrayidx22, align 4
  %cmp23 = icmp eq i8* %18, bitcast (void ()* @initialize_traps to i8*)
  br i1 %cmp23, label %if.then24, label %if.else35

if.then24:                                        ; preds = %lor.lhs.false21, %lor.lhs.false, %if.else
  %call25 = call i8* @libintl_gettext(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.70, i32 0, i32 0))
  %19 = load i32, i32* %sig, align 4
  %20 = load i32, i32* %sig, align 4
  %arrayidx26 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %20
  %21 = load i8*, i8** %arrayidx26, align 4
  call void (i8*, ...) @internal_warning(i8* %call25, i32 %19, i8* %21)
  %22 = load i32, i32* %sig, align 4
  %arrayidx27 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %22
  %23 = load i8*, i8** %arrayidx27, align 4
  %cmp28 = icmp eq i8* %23, null
  br i1 %cmp28, label %if.then29, label %if.end34

if.then29:                                        ; preds = %if.then24
  %call30 = call i8* @libintl_gettext(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.71, i32 0, i32 0))
  %24 = load i32, i32* %sig, align 4
  %25 = load i32, i32* %sig, align 4
  %call31 = call i8* @signal_name(i32 %25)
  call void (i8*, ...) @internal_warning(i8* %call30, i32 %24, i8* %call31)
  %call32 = call i32 @getpid()
  %26 = load i32, i32* %sig, align 4
  %call33 = call i32 @kill(i32 %call32, i32 %26)
  br label %if.end34

if.end34:                                         ; preds = %if.then29, %if.then24
  br label %if.end45

if.else35:                                        ; preds = %lor.lhs.false21
  %call36 = call %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t* %pstate)
  %27 = load %struct.word_list*, %struct.word_list** @subst_assign_varlist, align 4
  store %struct.word_list* %27, %struct.word_list** %save_subst_varlist, align 4
  store %struct.word_list* null, %struct.word_list** @subst_assign_varlist, align 4
  %28 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  store %struct.hash_table* %28, %struct.hash_table** %save_tempenv, align 4
  store %struct.hash_table* null, %struct.hash_table** @temporary_env, align 4
  %29 = load i32, i32* %sig, align 4
  %arrayidx37 = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %29
  store i32 0, i32* %arrayidx37, align 4
  %30 = load i32, i32* %sig, align 4
  %arrayidx38 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %30
  %31 = load i8*, i8** %arrayidx38, align 4
  %call39 = call i32 @strlen(i8* %31)
  %add40 = add i32 1, %call39
  %call41 = call i8* @sh_xmalloc(i32 %add40, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 409)
  %32 = load i32, i32* %sig, align 4
  %arrayidx42 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %32
  %33 = load i8*, i8** %arrayidx42, align 4
  %call43 = call i8* @strcpy(i8* %call41, i8* %33)
  %call44 = call i32 @evalstring(i8* %call43, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.73, i32 0, i32 0), i32 21)
  %34 = load %struct.word_list*, %struct.word_list** %save_subst_varlist, align 4
  store %struct.word_list* %34, %struct.word_list** @subst_assign_varlist, align 4
  call void @restore_parser_state(%struct._sh_parser_state_t* %pstate)
  %35 = load %struct.hash_table*, %struct.hash_table** %save_tempenv, align 4
  store %struct.hash_table* %35, %struct.hash_table** @temporary_env, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.else35, %if.end34
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then15
  %36 = load i32, i32* %sig, align 4
  %arrayidx47 = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %36
  store i32 0, i32* %arrayidx47, align 4
  store i32 0, i32* @running_trap, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.end46, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end48
  %37 = load i32, i32* %sig, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %sig, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %38 = load %struct.array*, %struct.array** %ps, align 4
  call void @restore_pipestatus_array(%struct.array* %38)
  %39 = load i32, i32* %old_exit_value, align 4
  store i32 %39, i32* @last_command_exit_value, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then4, %if.then
  ret void
}

declare %struct.array* @save_pipestatus_array() #1

; Function Attrs: noinline nounwind
define void @run_interrupt_trap(i32 %will_throw) #0 {
entry:
  %will_throw.addr = alloca i32, align 4
  store i32 %will_throw, i32* %will_throw.addr, align 4
  %0 = load i32, i32* %will_throw.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @running_trap, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @running_trap, align 4
  %sub = sub nsw i32 %2, 1
  call void @run_trap_cleanup(i32 %sub)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %call = call i32 @_run_trap_internal(i32 2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.79, i32 0, i32 0))
  ret void
}

declare void @internal_warning(i8*, ...) #1

declare i32 @kill(i32, i32) #1

declare i32 @getpid() #1

declare %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t*) #1

declare i32 @evalstring(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare void @restore_parser_state(%struct._sh_parser_state_t*) #1

declare void @restore_pipestatus_array(%struct.array*) #1

; Function Attrs: noinline nounwind
define void @trap_handler(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %oerrno = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp sge i32 %2, 65
  br i1 %cmp1, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %3 = load i32, i32* %sig.addr, align 4
  %arrayidx2 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %3
  %4 = load i8*, i8** %arrayidx2, align 4
  %cmp3 = icmp eq i8* %4, null
  br i1 %cmp3, label %if.then7, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %5 = load i32, i32* %sig.addr, align 4
  %arrayidx5 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %5
  %6 = load i8*, i8** %arrayidx5, align 4
  %cmp6 = icmp eq i8* %6, inttoptr (i32 1 to i8*)
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %lor.lhs.false4, %lor.lhs.false, %if.end
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.74, i32 0, i32 0))
  %7 = load i32, i32* %sig.addr, align 4
  call void (i8*, ...) @programming_error(i8* %call, i32 %7)
  br label %if.end29

if.else:                                          ; preds = %lor.lhs.false4
  %call8 = call i32* @__errno_location()
  %8 = load i32, i32* %call8, align 4
  store i32 %8, i32* %oerrno, align 4
  %9 = load i32, i32* %sig.addr, align 4
  %call9 = call void (i32)* @signal(i32 %9, void (i32)* @trap_handler)
  store i32 1, i32* @catch_flag, align 4
  %10 = load i32, i32* %sig.addr, align 4
  %arrayidx10 = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %10
  %11 = load i32, i32* %arrayidx10, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %arrayidx10, align 4
  %12 = load i32, i32* %sig.addr, align 4
  store i32 %12, i32* @trapped_signal_received, align 4
  %13 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %tobool = icmp ne i32 (%struct.word_list*)* %13, null
  br i1 %tobool, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp11 = icmp eq i32 (%struct.word_list*)* %14, @wait_builtin
  br i1 %cmp11, label %if.then12, label %if.end18

if.then12:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %sig.addr, align 4
  store i32 %15, i32* @wait_signal_received, align 4
  %16 = load i32, i32* @interrupt_immediately, align 4
  %tobool13 = icmp ne i32 %16, 0
  br i1 %tobool13, label %land.lhs.true14, label %if.end17

land.lhs.true14:                                  ; preds = %if.then12
  %17 = load i32, i32* @wait_intr_flag, align 4
  %tobool15 = icmp ne i32 %17, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %land.lhs.true14
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @wait_intr_buf, i32 0, i32 0), i32 1) #4
  unreachable

if.end17:                                         ; preds = %land.lhs.true14, %if.then12
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %land.lhs.true, %if.else
  %18 = load i32, i32* @rl_readline_state, align 4
  %and19 = and i32 %18, 32768
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %land.lhs.true21, label %if.end24

land.lhs.true21:                                  ; preds = %if.end18
  %19 = load i32, i32* @interrupt_immediately, align 4
  %cmp22 = icmp eq i32 %19, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %land.lhs.true21
  call void @bashline_set_event_hook()
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %land.lhs.true21, %if.end18
  %20 = load i32, i32* @interrupt_immediately, align 4
  %tobool25 = icmp ne i32 %20, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end24
  call void @run_pending_traps()
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end24
  %21 = load i32, i32* %oerrno, align 4
  %call28 = call i32* @__errno_location()
  store i32 %21, i32* %call28, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.end27, %if.then7
  br label %return

return:                                           ; preds = %if.end29, %if.then
  ret void
}

declare void @programming_error(i8*, ...) #1

declare i32* @__errno_location() #1

declare i32 @wait_builtin(%struct.word_list*) #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #2

declare void @bashline_set_event_hook() #1

; Function Attrs: noinline nounwind
define i32 @first_pending_trap() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @any_signals_trapped() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %and = and i32 %2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define void @check_signals() #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @sigalrm_seen, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #4
  unreachable

if.end:                                           ; preds = %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %1 = load volatile i32, i32* @terminating_signal, align 4
  %tobool2 = icmp ne i32 %1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.body1
  %2 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %2)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.body1
  %3 = load volatile i32, i32* @interrupt_state, align 4
  %tobool5 = icmp ne i32 %3, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  call void @throw_to_top_level()
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end4
  br label %do.end8

do.end8:                                          ; preds = %if.end7
  ret void
}

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

; Function Attrs: noinline nounwind
define void @check_signals_and_traps() #0 {
entry:
  call void @check_signals()
  call void @run_pending_traps()
  ret void
}

; Function Attrs: noinline nounwind
define void @set_debug_trap(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  call void @set_signal(i32 65, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @set_signal(i32 %sig, i8* %string) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %set = alloca %struct.__sigset_t, align 4
  %oset = alloca %struct.__sigset_t, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp eq i32 %1, 65
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* %sig.addr, align 4
  %cmp3 = icmp eq i32 %2, 66
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32, i32* %sig.addr, align 4
  %cmp5 = icmp eq i32 %3, 67
  br i1 %cmp5, label %if.then, label %if.end11

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  %4 = load i32, i32* %sig.addr, align 4
  %5 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %add = add i32 1, %call
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 690)
  %6 = load i8*, i8** %string.addr, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %6)
  call void @change_signal(i32 %4, i8* %call7)
  %7 = load i32, i32* %sig.addr, align 4
  %cmp8 = icmp eq i32 %7, 0
  br i1 %cmp8, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %8 = load i32, i32* @interactive, align 4
  %cmp9 = icmp eq i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %land.lhs.true
  call void @initialize_terminating_signals()
  br label %if.end

if.end:                                           ; preds = %if.then10, %land.lhs.true, %if.then
  br label %if.end49

if.end11:                                         ; preds = %lor.lhs.false4
  %9 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %9
  %10 = load i32, i32* %arrayidx, align 4
  %and = and i32 %10, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end11
  br label %if.end49

if.end13:                                         ; preds = %if.end11
  %11 = load i32, i32* %sig.addr, align 4
  %arrayidx14 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx14, align 4
  %and15 = and i32 %12, 1
  %cmp16 = icmp eq i32 %and15, 0
  br i1 %cmp16, label %if.then17, label %if.end35

if.then17:                                        ; preds = %if.end13
  %13 = load i32, i32* %sig.addr, align 4
  %arrayidx18 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %13
  %14 = load void (i32)*, void (i32)** %arrayidx18, align 4
  %cmp19 = icmp eq void (i32)* %14, bitcast (void ()* @initialize_traps to void (i32)*)
  br i1 %cmp19, label %if.then20, label %if.end30

if.then20:                                        ; preds = %if.then17
  br label %do.body

do.body:                                          ; preds = %if.then20
  %15 = load i32, i32* %sig.addr, align 4
  %call21 = call void (i32)* @signal(i32 %15, void (i32)* null)
  %16 = load i32, i32* %sig.addr, align 4
  %arrayidx22 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %16
  store void (i32)* %call21, void (i32)** %arrayidx22, align 4
  %17 = load i32, i32* %sig.addr, align 4
  %18 = load i32, i32* %sig.addr, align 4
  %arrayidx23 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %18
  %19 = load void (i32)*, void (i32)** %arrayidx23, align 4
  %call24 = call void (i32)* @signal(i32 %17, void (i32)* %19)
  %20 = load i32, i32* %sig.addr, align 4
  %arrayidx25 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %20
  %21 = load void (i32)*, void (i32)** %arrayidx25, align 4
  %cmp26 = icmp eq void (i32)* %21, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %do.body
  %22 = load i32, i32* %sig.addr, align 4
  %arrayidx28 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %22
  %23 = load i32, i32* %arrayidx28, align 4
  %or = or i32 %23, 2
  store i32 %or, i32* %arrayidx28, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end29
  br label %if.end30

if.end30:                                         ; preds = %do.end, %if.then17
  %24 = load i32, i32* %sig.addr, align 4
  %arrayidx31 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %24
  %25 = load void (i32)*, void (i32)** %arrayidx31, align 4
  %cmp32 = icmp eq void (i32)* %25, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  br label %if.end49

if.end34:                                         ; preds = %if.end30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.end13
  %26 = load i32, i32* %sig.addr, align 4
  %arrayidx36 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %26
  %27 = load i32, i32* %arrayidx36, align 4
  %and37 = and i32 %27, 8
  %cmp38 = icmp eq i32 %and37, 0
  br i1 %cmp38, label %if.then39, label %if.else

if.then39:                                        ; preds = %if.end35
  %28 = load i32, i32* %sig.addr, align 4
  %29 = load i8*, i8** %string.addr, align 4
  %call40 = call i32 @strlen(i8* %29)
  %add41 = add i32 1, %call40
  %call42 = call i8* @sh_xmalloc(i32 %add41, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 719)
  %30 = load i8*, i8** %string.addr, align 4
  %call43 = call i8* @strcpy(i8* %call42, i8* %30)
  call void @change_signal(i32 %28, i8* %call43)
  %31 = load i32, i32* %sig.addr, align 4
  %call44 = call void (i32)* @signal(i32 %31, void (i32)* @trap_handler)
  br label %if.end49

if.else:                                          ; preds = %if.end35
  %32 = load i32, i32* %sig.addr, align 4
  %33 = load i8*, i8** %string.addr, align 4
  %call45 = call i32 @strlen(i8* %33)
  %add46 = add i32 1, %call45
  %call47 = call i8* @sh_xmalloc(i32 %add46, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 724)
  %34 = load i8*, i8** %string.addr, align 4
  %call48 = call i8* @strcpy(i8* %call47, i8* %34)
  call void @change_signal(i32 %32, i8* %call48)
  br label %if.end49

if.end49:                                         ; preds = %if.end, %if.then12, %if.then33, %if.else, %if.then39
  ret void
}

; Function Attrs: noinline nounwind
define void @maybe_set_debug_trap(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  call void @trap_if_untrapped(i32 65, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @trap_if_untrapped(i32 %sig, i8* %command) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %command.addr = alloca i8*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  %3 = load i8*, i8** %command.addr, align 4
  call void @set_signal(i32 %2, i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @set_error_trap(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  call void @set_signal(i32 66, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @maybe_set_error_trap(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  call void @trap_if_untrapped(i32 66, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @set_return_trap(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  call void @set_signal(i32 67, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @maybe_set_return_trap(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  call void @trap_if_untrapped(i32 67, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void (i32)* @set_sigint_handler() #0 {
entry:
  %retval = alloca void (i32)*, align 4
  %0 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  %and = and i32 %0, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store void (i32)* inttoptr (i32 1 to void (i32)*), void (i32)** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  %and1 = and i32 %1, 64
  %tobool2 = icmp ne i32 %and1, 0
  br i1 %tobool2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %call = call void (i32)* @signal(i32 2, void (i32)* inttoptr (i32 1 to void (i32)*))
  store void (i32)* %call, void (i32)** %retval, align 4
  br label %return

if.else4:                                         ; preds = %if.else
  %2 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 2), align 4
  %and5 = and i32 %2, 1
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.else4
  %call8 = call void (i32)* @signal(i32 2, void (i32)* @trap_handler)
  store void (i32)* %call8, void (i32)** %retval, align 4
  br label %return

if.else9:                                         ; preds = %if.else4
  %3 = load i32, i32* @interactive, align 4
  %tobool10 = icmp ne i32 %3, 0
  br i1 %tobool10, label %if.then11, label %if.else13

if.then11:                                        ; preds = %if.else9
  %call12 = call void (i32)* @signal(i32 2, void (i32)* @sigint_sighandler)
  store void (i32)* %call12, void (i32)** %retval, align 4
  br label %return

if.else13:                                        ; preds = %if.else9
  %call14 = call void (i32)* @signal(i32 2, void (i32)* @termsig_sighandler)
  store void (i32)* %call14, void (i32)** %retval, align 4
  br label %return

return:                                           ; preds = %if.else13, %if.then11, %if.then7, %if.then3, %if.then
  %4 = load void (i32)*, void (i32)** %retval, align 4
  ret void (i32)* %4
}

declare void @sigint_sighandler(i32) #1

declare void @termsig_sighandler(i32) #1

; Function Attrs: noinline nounwind
define void (i32)* @trap_to_sighandler(i32 %sig) #0 {
entry:
  %retval = alloca void (i32)*, align 4
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 66
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store void (i32)* inttoptr (i32 1 to void (i32)*), void (i32)** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx1, align 4
  %and2 = and i32 %3, 1
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  store void (i32)* @trap_handler, void (i32)** %retval, align 4
  br label %return

if.else5:                                         ; preds = %if.else
  store void (i32)* null, void (i32)** %retval, align 4
  br label %return

return:                                           ; preds = %if.else5, %if.then4, %if.then
  %4 = load void (i32)*, void (i32)** %retval, align 4
  ret void (i32)* %4
}

; Function Attrs: noinline nounwind
define internal void @change_signal(i32 %sig, i8* %value) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 16
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  call void @free_trap_command(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %value.addr, align 4
  %4 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %4
  store i8* %3, i8** %arrayidx1, align 4
  %5 = load i32, i32* %sig.addr, align 4
  %arrayidx2 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %5
  %6 = load i32, i32* %arrayidx2, align 4
  %or = or i32 %6, 1
  store i32 %or, i32* %arrayidx2, align 4
  %7 = load i8*, i8** %value.addr, align 4
  %cmp3 = icmp eq i8* %7, inttoptr (i32 1 to i8*)
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %8 = load i32, i32* %sig.addr, align 4
  %arrayidx5 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %8
  %9 = load i32, i32* %arrayidx5, align 4
  %or6 = or i32 %9, 64
  store i32 %or6, i32* %arrayidx5, align 4
  br label %if.end9

if.else:                                          ; preds = %if.end
  %10 = load i32, i32* %sig.addr, align 4
  %arrayidx7 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %10
  %11 = load i32, i32* %arrayidx7, align 4
  %and8 = and i32 %11, -65
  store i32 %and8, i32* %arrayidx7, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then4
  %12 = load i32, i32* %sig.addr, align 4
  %arrayidx10 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %12
  %13 = load i32, i32* %arrayidx10, align 4
  %and11 = and i32 %13, 16
  %tobool = icmp ne i32 %and11, 0
  br i1 %tobool, label %if.then12, label %if.end15

if.then12:                                        ; preds = %if.end9
  %14 = load i32, i32* %sig.addr, align 4
  %arrayidx13 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %14
  %15 = load i32, i32* %arrayidx13, align 4
  %or14 = or i32 %15, 32
  store i32 %or14, i32* %arrayidx13, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then12, %if.end9
  ret void
}

declare void @initialize_terminating_signals() #1

; Function Attrs: noinline nounwind
define void @get_original_signal(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp slt i32 %1, 65
  br i1 %cmp1, label %land.lhs.true2, label %if.end11

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %2
  %3 = load void (i32)*, void (i32)** %arrayidx, align 4
  %cmp3 = icmp eq void (i32)* %3, bitcast (void ()* @initialize_traps to void (i32)*)
  br i1 %cmp3, label %if.then, label %if.end11

if.then:                                          ; preds = %land.lhs.true2
  br label %do.body

do.body:                                          ; preds = %if.then
  %4 = load i32, i32* %sig.addr, align 4
  %call = call void (i32)* @signal(i32 %4, void (i32)* null)
  %5 = load i32, i32* %sig.addr, align 4
  %arrayidx4 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %5
  store void (i32)* %call, void (i32)** %arrayidx4, align 4
  %6 = load i32, i32* %sig.addr, align 4
  %7 = load i32, i32* %sig.addr, align 4
  %arrayidx5 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %7
  %8 = load void (i32)*, void (i32)** %arrayidx5, align 4
  %call6 = call void (i32)* @signal(i32 %6, void (i32)* %8)
  %9 = load i32, i32* %sig.addr, align 4
  %arrayidx7 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %9
  %10 = load void (i32)*, void (i32)** %arrayidx7, align 4
  %cmp8 = icmp eq void (i32)* %10, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %do.body
  %11 = load i32, i32* %sig.addr, align 4
  %arrayidx10 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx10, align 4
  %or = or i32 %12, 2
  store i32 %or, i32* %arrayidx10, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end11

if.end11:                                         ; preds = %do.end, %land.lhs.true2, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @get_all_original_signals() #0 {
entry:
  %i = alloca i32, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %2, 65
  br i1 %cmp1, label %land.lhs.true2, label %if.end11

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %3
  %4 = load void (i32)*, void (i32)** %arrayidx, align 4
  %cmp3 = icmp eq void (i32)* %4, bitcast (void ()* @initialize_traps to void (i32)*)
  br i1 %cmp3, label %if.then, label %if.end11

if.then:                                          ; preds = %land.lhs.true2
  br label %do.body

do.body:                                          ; preds = %if.then
  %5 = load i32, i32* %i, align 4
  %call = call void (i32)* @signal(i32 %5, void (i32)* null)
  %6 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %6
  store void (i32)* %call, void (i32)** %arrayidx4, align 4
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %8
  %9 = load void (i32)*, void (i32)** %arrayidx5, align 4
  %call6 = call void (i32)* @signal(i32 %7, void (i32)* %9)
  %10 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %10
  %11 = load void (i32)*, void (i32)** %arrayidx7, align 4
  %cmp8 = icmp eq void (i32)* %11, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %do.body
  %12 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %12
  %13 = load i32, i32* %arrayidx10, align 4
  %or = or i32 %13, 2
  store i32 %or, i32* %arrayidx10, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end11

if.end11:                                         ; preds = %do.end, %land.lhs.true2, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @set_original_signal(i32 %sig, void (i32)* %handler) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %handler.addr = alloca void (i32)*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store void (i32)* %handler, void (i32)** %handler.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp slt i32 %1, 65
  br i1 %cmp1, label %land.lhs.true2, label %if.end9

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %2
  %3 = load void (i32)*, void (i32)** %arrayidx, align 4
  %cmp3 = icmp eq void (i32)* %3, bitcast (void ()* @initialize_traps to void (i32)*)
  br i1 %cmp3, label %if.then, label %if.end9

if.then:                                          ; preds = %land.lhs.true2
  br label %do.body

do.body:                                          ; preds = %if.then
  %4 = load void (i32)*, void (i32)** %handler.addr, align 4
  %5 = load i32, i32* %sig.addr, align 4
  %arrayidx4 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %5
  store void (i32)* %4, void (i32)** %arrayidx4, align 4
  %6 = load i32, i32* %sig.addr, align 4
  %arrayidx5 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %6
  %7 = load void (i32)*, void (i32)** %arrayidx5, align 4
  %cmp6 = icmp eq void (i32)* %7, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %do.body
  %8 = load i32, i32* %sig.addr, align 4
  %arrayidx8 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %8
  %9 = load i32, i32* %arrayidx8, align 4
  %or = or i32 %9, 2
  store i32 %or, i32* %arrayidx8, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end9

if.end9:                                          ; preds = %do.end, %land.lhs.true2, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @restore_default_signal(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp eq i32 %1, 65
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* %sig.addr, align 4
  %cmp3 = icmp eq i32 %2, 66
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32, i32* %sig.addr, align 4
  %cmp5 = icmp eq i32 %3, 67
  br i1 %cmp5, label %if.then, label %if.end21

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  %4 = load i32, i32* %sig.addr, align 4
  %cmp6 = icmp ne i32 %4, 65
  br i1 %cmp6, label %land.lhs.true, label %lor.lhs.false10

land.lhs.true:                                    ; preds = %if.then
  %5 = load i32, i32* %sig.addr, align 4
  %cmp7 = icmp ne i32 %5, 66
  br i1 %cmp7, label %land.lhs.true8, label %lor.lhs.false10

land.lhs.true8:                                   ; preds = %land.lhs.true
  %6 = load i32, i32* %sig.addr, align 4
  %cmp9 = icmp ne i32 %6, 67
  br i1 %cmp9, label %if.then12, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %land.lhs.true8, %land.lhs.true, %if.then
  %7 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx, align 4
  %and = and i32 %8, 16
  %cmp11 = icmp eq i32 %and, 0
  br i1 %cmp11, label %if.then12, label %if.end

if.then12:                                        ; preds = %lor.lhs.false10, %land.lhs.true8
  %9 = load i32, i32* %sig.addr, align 4
  call void @free_trap_command(i32 %9)
  br label %if.end

if.end:                                           ; preds = %if.then12, %lor.lhs.false10
  %10 = load i32, i32* %sig.addr, align 4
  %arrayidx13 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %10
  store i8* null, i8** %arrayidx13, align 4
  %11 = load i32, i32* %sig.addr, align 4
  %arrayidx14 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx14, align 4
  %and15 = and i32 %12, -2
  store i32 %and15, i32* %arrayidx14, align 4
  %13 = load i32, i32* %sig.addr, align 4
  %arrayidx16 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %13
  %14 = load i32, i32* %arrayidx16, align 4
  %and17 = and i32 %14, 16
  %tobool = icmp ne i32 %and17, 0
  br i1 %tobool, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.end
  %15 = load i32, i32* %sig.addr, align 4
  %arrayidx19 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %15
  %16 = load i32, i32* %arrayidx19, align 4
  %or = or i32 %16, 32
  store i32 %or, i32* %arrayidx19, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end
  br label %return

if.end21:                                         ; preds = %lor.lhs.false4
  %17 = load i32, i32* %sig.addr, align 4
  %tobool22 = icmp ne i32 %17, 0
  br i1 %tobool22, label %land.lhs.true23, label %if.end38

land.lhs.true23:                                  ; preds = %if.end21
  %18 = load i32, i32* %sig.addr, align 4
  %cmp24 = icmp slt i32 %18, 65
  br i1 %cmp24, label %land.lhs.true25, label %if.end38

land.lhs.true25:                                  ; preds = %land.lhs.true23
  %19 = load i32, i32* %sig.addr, align 4
  %arrayidx26 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %19
  %20 = load void (i32)*, void (i32)** %arrayidx26, align 4
  %cmp27 = icmp eq void (i32)* %20, bitcast (void ()* @initialize_traps to void (i32)*)
  br i1 %cmp27, label %if.then28, label %if.end38

if.then28:                                        ; preds = %land.lhs.true25
  br label %do.body

do.body:                                          ; preds = %if.then28
  %21 = load i32, i32* %sig.addr, align 4
  %call = call void (i32)* @signal(i32 %21, void (i32)* null)
  %22 = load i32, i32* %sig.addr, align 4
  %arrayidx29 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %22
  store void (i32)* %call, void (i32)** %arrayidx29, align 4
  %23 = load i32, i32* %sig.addr, align 4
  %24 = load i32, i32* %sig.addr, align 4
  %arrayidx30 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %24
  %25 = load void (i32)*, void (i32)** %arrayidx30, align 4
  %call31 = call void (i32)* @signal(i32 %23, void (i32)* %25)
  %26 = load i32, i32* %sig.addr, align 4
  %arrayidx32 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %26
  %27 = load void (i32)*, void (i32)** %arrayidx32, align 4
  %cmp33 = icmp eq void (i32)* %27, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp33, label %if.then34, label %if.end37

if.then34:                                        ; preds = %do.body
  %28 = load i32, i32* %sig.addr, align 4
  %arrayidx35 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %28
  %29 = load i32, i32* %arrayidx35, align 4
  %or36 = or i32 %29, 2
  store i32 %or36, i32* %arrayidx35, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end37
  br label %if.end38

if.end38:                                         ; preds = %do.end, %land.lhs.true25, %land.lhs.true23, %if.end21
  %30 = load i32, i32* %sig.addr, align 4
  %arrayidx39 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %30
  %31 = load i32, i32* %arrayidx39, align 4
  %and40 = and i32 %31, 2
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end38
  br label %return

if.end43:                                         ; preds = %if.end38
  %32 = load i32, i32* %sig.addr, align 4
  %arrayidx44 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %32
  %33 = load i32, i32* %arrayidx44, align 4
  %and45 = and i32 %33, 1
  %cmp46 = icmp eq i32 %and45, 0
  br i1 %cmp46, label %land.lhs.true47, label %if.end57

land.lhs.true47:                                  ; preds = %if.end43
  %34 = load i32, i32* %sig.addr, align 4
  %cmp48 = icmp ne i32 %34, 17
  br i1 %cmp48, label %if.then56, label %lor.lhs.false49

lor.lhs.false49:                                  ; preds = %land.lhs.true47
  %35 = load i32, i32* %sig.addr, align 4
  %arrayidx50 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %35
  %36 = load i32, i32* %arrayidx50, align 4
  %and51 = and i32 %36, 16
  %cmp52 = icmp eq i32 %and51, 0
  br i1 %cmp52, label %if.then56, label %lor.lhs.false53

lor.lhs.false53:                                  ; preds = %lor.lhs.false49
  %37 = load i32, i32* %sig.addr, align 4
  %arrayidx54 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %37
  %38 = load i8*, i8** %arrayidx54, align 4
  %cmp55 = icmp ne i8* %38, bitcast (void ()* @initialize_traps to i8*)
  br i1 %cmp55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %lor.lhs.false53, %lor.lhs.false49, %land.lhs.true47
  br label %return

if.end57:                                         ; preds = %lor.lhs.false53, %if.end43
  %39 = load i32, i32* %sig.addr, align 4
  %arrayidx58 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %39
  %40 = load i32, i32* %arrayidx58, align 4
  %and59 = and i32 %40, 8
  %cmp60 = icmp eq i32 %and59, 0
  br i1 %cmp60, label %if.then61, label %if.end64

if.then61:                                        ; preds = %if.end57
  %41 = load i32, i32* %sig.addr, align 4
  %42 = load i32, i32* %sig.addr, align 4
  %arrayidx62 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %42
  %43 = load void (i32)*, void (i32)** %arrayidx62, align 4
  %call63 = call void (i32)* @signal(i32 %41, void (i32)* %43)
  br label %if.end64

if.end64:                                         ; preds = %if.then61, %if.end57
  %44 = load i32, i32* %sig.addr, align 4
  call void @change_signal(i32 %44, i8* null)
  %45 = load i32, i32* %sig.addr, align 4
  %arrayidx65 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %45
  %46 = load i32, i32* %arrayidx65, align 4
  %and66 = and i32 %46, -2
  store i32 %and66, i32* %arrayidx65, align 4
  br label %return

return:                                           ; preds = %if.end64, %if.then56, %if.then42, %if.end20
  ret void
}

; Function Attrs: noinline nounwind
define internal void @free_trap_command(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %2
  %3 = load i8*, i8** %arrayidx1, align 4
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* %sig.addr, align 4
  %arrayidx4 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %4
  %5 = load i8*, i8** %arrayidx4, align 4
  %cmp = icmp ne i8* %5, inttoptr (i32 1 to i8*)
  br i1 %cmp, label %land.lhs.true5, label %if.end

land.lhs.true5:                                   ; preds = %land.lhs.true3
  %6 = load i32, i32* %sig.addr, align 4
  %arrayidx6 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %6
  %7 = load i8*, i8** %arrayidx6, align 4
  %cmp7 = icmp ne i8* %7, null
  br i1 %cmp7, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true5
  %8 = load i32, i32* %sig.addr, align 4
  %arrayidx9 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %8
  %9 = load i8*, i8** %arrayidx9, align 4
  %cmp10 = icmp ne i8* %9, bitcast (void ()* @initialize_traps to i8*)
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true8
  %10 = load i32, i32* %sig.addr, align 4
  %arrayidx11 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %10
  %11 = load i8*, i8** %arrayidx11, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 735)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true8, %land.lhs.true5, %land.lhs.true3, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @ignore_signal(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %sig.addr, align 4
  %cmp1 = icmp eq i32 %1, 65
  br i1 %cmp1, label %land.lhs.true, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* %sig.addr, align 4
  %cmp3 = icmp eq i32 %2, 66
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32, i32* %sig.addr, align 4
  %cmp5 = icmp eq i32 %3, 67
  br i1 %cmp5, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  %4 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %4
  %5 = load i32, i32* %arrayidx, align 4
  %and = and i32 %5, 64
  %cmp6 = icmp eq i32 %and, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %sig.addr, align 4
  call void @change_signal(i32 %6, i8* inttoptr (i32 1 to i8*))
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false4
  %7 = load i32, i32* %sig.addr, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %land.lhs.true7, label %if.end21

land.lhs.true7:                                   ; preds = %if.end
  %8 = load i32, i32* %sig.addr, align 4
  %cmp8 = icmp slt i32 %8, 65
  br i1 %cmp8, label %land.lhs.true9, label %if.end21

land.lhs.true9:                                   ; preds = %land.lhs.true7
  %9 = load i32, i32* %sig.addr, align 4
  %arrayidx10 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %9
  %10 = load void (i32)*, void (i32)** %arrayidx10, align 4
  %cmp11 = icmp eq void (i32)* %10, bitcast (void ()* @initialize_traps to void (i32)*)
  br i1 %cmp11, label %if.then12, label %if.end21

if.then12:                                        ; preds = %land.lhs.true9
  br label %do.body

do.body:                                          ; preds = %if.then12
  %11 = load i32, i32* %sig.addr, align 4
  %call = call void (i32)* @signal(i32 %11, void (i32)* null)
  %12 = load i32, i32* %sig.addr, align 4
  %arrayidx13 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %12
  store void (i32)* %call, void (i32)** %arrayidx13, align 4
  %13 = load i32, i32* %sig.addr, align 4
  %14 = load i32, i32* %sig.addr, align 4
  %arrayidx14 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %14
  %15 = load void (i32)*, void (i32)** %arrayidx14, align 4
  %call15 = call void (i32)* @signal(i32 %13, void (i32)* %15)
  %16 = load i32, i32* %sig.addr, align 4
  %arrayidx16 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %16
  %17 = load void (i32)*, void (i32)** %arrayidx16, align 4
  %cmp17 = icmp eq void (i32)* %17, inttoptr (i32 1 to void (i32)*)
  br i1 %cmp17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %do.body
  %18 = load i32, i32* %sig.addr, align 4
  %arrayidx19 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %18
  %19 = load i32, i32* %arrayidx19, align 4
  %or = or i32 %19, 2
  store i32 %or, i32* %arrayidx19, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end20
  br label %if.end21

if.end21:                                         ; preds = %do.end, %land.lhs.true9, %land.lhs.true7, %if.end
  %20 = load i32, i32* %sig.addr, align 4
  %arrayidx22 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %20
  %21 = load i32, i32* %arrayidx22, align 4
  %and23 = and i32 %21, 2
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end21
  br label %return

if.end26:                                         ; preds = %if.end21
  %22 = load i32, i32* %sig.addr, align 4
  %arrayidx27 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %22
  %23 = load i32, i32* %arrayidx27, align 4
  %and28 = and i32 %23, 64
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end26
  br label %return

if.end31:                                         ; preds = %if.end26
  %24 = load i32, i32* %sig.addr, align 4
  %arrayidx32 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %24
  %25 = load i32, i32* %arrayidx32, align 4
  %and33 = and i32 %25, 8
  %cmp34 = icmp eq i32 %and33, 0
  br i1 %cmp34, label %if.then35, label %if.end37

if.then35:                                        ; preds = %if.end31
  %26 = load i32, i32* %sig.addr, align 4
  %call36 = call void (i32)* @signal(i32 %26, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %if.end31
  %27 = load i32, i32* %sig.addr, align 4
  call void @change_signal(i32 %27, i8* inttoptr (i32 1 to i8*))
  br label %return

return:                                           ; preds = %if.end37, %if.then30, %if.then25, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i32 @run_exit_trap() #0 {
entry:
  %retval = alloca i32, align 4
  %trap_command = alloca i8*, align 4
  %code = alloca i32, align 4
  %function_code = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %ps = alloca %struct.array*, align 4
  %0 = load i32, i32* @last_command_exit_value, align 4
  store i32 %0, i32* @trap_saved_exit_value, align 4
  %call = call %struct.array* @save_pipestatus_array()
  store %struct.array* %call, %struct.array** %ps, align 4
  store i32 0, i32* %function_code, align 4
  %1 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end29

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %and2 = and i32 %2, 80
  %cmp = icmp eq i32 %and2, 0
  br i1 %cmp, label %if.then, label %if.end29

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 0), align 4
  %call3 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call3
  %call4 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 885)
  %4 = load i8*, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 0), align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %4)
  store i8* %call5, i8** %trap_command, align 4
  %5 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %and6 = and i32 %5, -2
  store i32 %and6, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %6 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %or = or i32 %6, 16
  store i32 %or, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %7 = load i32, i32* @trap_saved_exit_value, align 4
  store i32 %7, i32* %retval1, align 4
  store i32 1, i32* @running_trap, align 4
  %call7 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #5
  store i32 %call7, i32* %code, align 4
  %8 = load i32, i32* @return_catch_flag, align 4
  %tobool8 = icmp ne i32 %8, 0
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  %call10 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #5
  store i32 %call10, i32* %function_code, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then
  %9 = load i32, i32* %code, align 4
  %cmp11 = icmp eq i32 %9, 0
  br i1 %cmp11, label %land.lhs.true12, label %if.else

land.lhs.true12:                                  ; preds = %if.end
  %10 = load i32, i32* %function_code, align 4
  %cmp13 = icmp eq i32 %10, 0
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %land.lhs.true12
  call void @reset_parser()
  %11 = load i8*, i8** %trap_command, align 4
  %call15 = call i32 @parse_and_execute(i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.75, i32 0, i32 0), i32 21)
  br label %if.end28

if.else:                                          ; preds = %land.lhs.true12, %if.end
  %12 = load i32, i32* %code, align 4
  %cmp16 = icmp eq i32 %12, 4
  br i1 %cmp16, label %if.then17, label %if.else18

if.then17:                                        ; preds = %if.else
  %13 = load i32, i32* @last_command_exit_value, align 4
  store i32 %13, i32* %retval1, align 4
  br label %if.end27

if.else18:                                        ; preds = %if.else
  %14 = load i32, i32* %code, align 4
  %cmp19 = icmp eq i32 %14, 3
  br i1 %cmp19, label %if.then20, label %if.else21

if.then20:                                        ; preds = %if.else18
  %15 = load i32, i32* @last_command_exit_value, align 4
  store i32 %15, i32* %retval1, align 4
  br label %if.end26

if.else21:                                        ; preds = %if.else18
  %16 = load i32, i32* %function_code, align 4
  %cmp22 = icmp ne i32 %16, 0
  br i1 %cmp22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else21
  %17 = load i32, i32* @return_catch_value, align 4
  store i32 %17, i32* %retval1, align 4
  br label %if.end25

if.else24:                                        ; preds = %if.else21
  %18 = load i32, i32* @trap_saved_exit_value, align 4
  store i32 %18, i32* %retval1, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.else24, %if.then23
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then20
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then17
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then14
  store i32 0, i32* @running_trap, align 4
  %19 = load %struct.array*, %struct.array** %ps, align 4
  call void @array_dispose(%struct.array* %19)
  %20 = load i32, i32* %retval1, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %land.lhs.true, %entry
  %21 = load %struct.array*, %struct.array** %ps, align 4
  call void @restore_pipestatus_array(%struct.array* %21)
  %22 = load i32, i32* @trap_saved_exit_value, align 4
  store i32 %22, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.end28
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #3

declare void @reset_parser() #1

declare i32 @parse_and_execute(i8*, i8*, i32) #1

declare void @array_dispose(%struct.array*) #1

; Function Attrs: noinline nounwind
define void @run_trap_cleanup(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, -49
  store i32 %and, i32* %arrayidx, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @run_debug_trap() #0 {
entry:
  %trap_exit_value = alloca i32, align 4
  %save_pgrp = alloca i32, align 4
  %save_pipe = alloca [2 x i32], align 4
  store i32 0, i32* %trap_exit_value, align 4
  %0 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 65), align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 65), align 4
  %and1 = and i32 %1, 64
  %cmp = icmp eq i32 %and1, 0
  br i1 %cmp, label %land.lhs.true2, label %if.end11

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 65), align 4
  %and3 = and i32 %2, 16
  %cmp4 = icmp eq i32 %and3, 0
  br i1 %cmp4, label %if.then, label %if.end11

if.then:                                          ; preds = %land.lhs.true2
  %call = call i32 @_run_trap_internal(i32 65, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.76, i32 0, i32 0))
  store i32 %call, i32* %trap_exit_value, align 4
  %3 = load i32, i32* @debugging_mode, align 4
  %tobool5 = icmp ne i32 %3, 0
  br i1 %tobool5, label %land.lhs.true6, label %if.end

land.lhs.true6:                                   ; preds = %if.then
  %4 = load i32, i32* %trap_exit_value, align 4
  %cmp7 = icmp eq i32 %4, 2
  br i1 %cmp7, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true6
  %5 = load i32, i32* @return_catch_flag, align 4
  %tobool9 = icmp ne i32 %5, 0
  br i1 %tobool9, label %if.then10, label %if.end

if.then10:                                        ; preds = %land.lhs.true8
  %6 = load i32, i32* %trap_exit_value, align 4
  store i32 %6, i32* @return_catch_value, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0), i32 1) #4
  unreachable

if.end:                                           ; preds = %land.lhs.true8, %land.lhs.true6, %if.then
  br label %if.end11

if.end11:                                         ; preds = %if.end, %land.lhs.true2, %land.lhs.true, %entry
  %7 = load i32, i32* %trap_exit_value, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define internal i32 @_run_trap_internal(i32 %sig, i8* %tag) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %tag.addr = alloca i8*, align 4
  %trap_command = alloca i8*, align 4
  %old_trap = alloca i8*, align 4
  %trap_exit_value = alloca i32, align 4
  %token_state = alloca i32*, align 4
  %save_return_catch_flag = alloca i32, align 4
  %function_code = alloca i32, align 4
  %top_level_code = alloca i32, align 4
  %old_int = alloca i32, align 4
  %flags = alloca i32, align 4
  %save_return_catch = alloca [1 x %struct.__jmp_buf_tag], align 4
  %save_subst_varlist = alloca %struct.word_list*, align 4
  %save_tempenv = alloca %struct.hash_table*, align 4
  %pstate = alloca %struct._sh_parser_state_t, align 4
  %ps = alloca %struct.array*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store i8* %tag, i8** %tag.addr, align 4
  store volatile i32 0, i32* %function_code, align 4
  store i32 0, i32* %trap_exit_value, align 4
  %0 = load i32, i32* @last_command_exit_value, align 4
  store i32 %0, i32* @trap_saved_exit_value, align 4
  %1 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %and = and i32 %2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end50

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %3
  %4 = load i32, i32* %arrayidx1, align 4
  %and2 = and i32 %4, 64
  %cmp = icmp eq i32 %and2, 0
  br i1 %cmp, label %land.lhs.true3, label %if.end50

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* %sig.addr, align 4
  %arrayidx4 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %5
  %6 = load i8*, i8** %arrayidx4, align 4
  %cmp5 = icmp ne i8* %6, bitcast (void ()* @initialize_traps to i8*)
  br i1 %cmp5, label %land.lhs.true6, label %if.end50

land.lhs.true6:                                   ; preds = %land.lhs.true3
  %7 = load i32, i32* %sig.addr, align 4
  %arrayidx7 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx7, align 4
  %and8 = and i32 %8, 16
  %cmp9 = icmp eq i32 %and8, 0
  br i1 %cmp9, label %if.then, label %if.end50

if.then:                                          ; preds = %land.lhs.true6
  %9 = load i32, i32* %sig.addr, align 4
  %arrayidx10 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %9
  %10 = load i8*, i8** %arrayidx10, align 4
  store i8* %10, i8** %old_trap, align 4
  %11 = load i32, i32* %sig.addr, align 4
  %arrayidx11 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx11, align 4
  %or = or i32 %12, 16
  store i32 %or, i32* %arrayidx11, align 4
  %13 = load i32, i32* %sig.addr, align 4
  %arrayidx12 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %13
  %14 = load i32, i32* %arrayidx12, align 4
  %and13 = and i32 %14, -33
  store i32 %and13, i32* %arrayidx12, align 4
  %15 = load i8*, i8** %old_trap, align 4
  %call = call i32 @strlen(i8* %15)
  %add = add i32 1, %call
  %call14 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 971)
  %16 = load i8*, i8** %old_trap, align 4
  %call15 = call i8* @strcpy(i8* %call14, i8* %16)
  store i8* %call15, i8** %trap_command, align 4
  %17 = load i32, i32* %sig.addr, align 4
  %add16 = add nsw i32 %17, 1
  store i32 %add16, i32* @running_trap, align 4
  %18 = load volatile i32, i32* @interrupt_state, align 4
  store volatile i32 %18, i32* %old_int, align 4
  store volatile i32 0, i32* @interrupt_state, align 4
  %call17 = call %struct.array* @save_pipestatus_array()
  store %struct.array* %call17, %struct.array** %ps, align 4
  %call18 = call %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t* %pstate)
  %19 = load %struct.word_list*, %struct.word_list** @subst_assign_varlist, align 4
  store %struct.word_list* %19, %struct.word_list** %save_subst_varlist, align 4
  store %struct.word_list* null, %struct.word_list** @subst_assign_varlist, align 4
  %20 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  store %struct.hash_table* %20, %struct.hash_table** %save_tempenv, align 4
  store %struct.hash_table* null, %struct.hash_table** @temporary_env, align 4
  %21 = load i32, i32* @return_catch_flag, align 4
  store volatile i32 %21, i32* %save_return_catch_flag, align 4
  %22 = load i32, i32* @return_catch_flag, align 4
  %tobool19 = icmp ne i32 %22, 0
  br i1 %tobool19, label %if.then20, label %if.end

if.then20:                                        ; preds = %if.then
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %save_return_catch, i32 0, i32 0
  %23 = bitcast %struct.__jmp_buf_tag* %arraydecay to i8*
  call void @xbcopy(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i8* %23, i32 156)
  %call21 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #5
  store volatile i32 %call21, i32* %function_code, align 4
  br label %if.end

if.end:                                           ; preds = %if.then20, %if.then
  store i32 5, i32* %flags, align 4
  %24 = load i32, i32* %sig.addr, align 4
  %cmp22 = icmp ne i32 %24, 65
  br i1 %cmp22, label %land.lhs.true23, label %if.end29

land.lhs.true23:                                  ; preds = %if.end
  %25 = load i32, i32* %sig.addr, align 4
  %cmp24 = icmp ne i32 %25, 67
  br i1 %cmp24, label %land.lhs.true25, label %if.end29

land.lhs.true25:                                  ; preds = %land.lhs.true23
  %26 = load i32, i32* %sig.addr, align 4
  %cmp26 = icmp ne i32 %26, 66
  br i1 %cmp26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %land.lhs.true25
  %27 = load i32, i32* %flags, align 4
  %or28 = or i32 %27, 16
  store i32 %or28, i32* %flags, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %land.lhs.true25, %land.lhs.true23, %if.end
  %28 = load volatile i32, i32* %function_code, align 4
  %cmp30 = icmp eq i32 %28, 0
  br i1 %cmp30, label %if.then31, label %if.else

if.then31:                                        ; preds = %if.end29
  %29 = load i8*, i8** %trap_command, align 4
  %30 = load i8*, i8** %tag.addr, align 4
  %31 = load i32, i32* %flags, align 4
  %call32 = call i32 @parse_and_execute(i8* %29, i8* %30, i32 %31)
  %32 = load i32, i32* @last_command_exit_value, align 4
  store i32 %32, i32* %trap_exit_value, align 4
  br label %if.end33

if.else:                                          ; preds = %if.end29
  %33 = load i32, i32* @return_catch_value, align 4
  store i32 %33, i32* %trap_exit_value, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then31
  %34 = load %struct.word_list*, %struct.word_list** %save_subst_varlist, align 4
  store %struct.word_list* %34, %struct.word_list** @subst_assign_varlist, align 4
  call void @restore_parser_state(%struct._sh_parser_state_t* %pstate)
  %35 = load %struct.array*, %struct.array** %ps, align 4
  call void @restore_pipestatus_array(%struct.array* %35)
  %36 = load %struct.hash_table*, %struct.hash_table** %save_tempenv, align 4
  store %struct.hash_table* %36, %struct.hash_table** @temporary_env, align 4
  %37 = load i32, i32* %sig.addr, align 4
  %arrayidx34 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %37
  %38 = load i32, i32* %arrayidx34, align 4
  %and35 = and i32 %38, -17
  store i32 %and35, i32* %arrayidx34, align 4
  store i32 0, i32* @running_trap, align 4
  %39 = load volatile i32, i32* %old_int, align 4
  store volatile i32 %39, i32* @interrupt_state, align 4
  %40 = load i32, i32* %sig.addr, align 4
  %arrayidx36 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %40
  %41 = load i32, i32* %arrayidx36, align 4
  %and37 = and i32 %41, 32
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then39, label %if.end42

if.then39:                                        ; preds = %if.end33
  %42 = load i8*, i8** %old_trap, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.72, i32 0, i32 0), i32 1038)
  %43 = load i32, i32* %sig.addr, align 4
  %arrayidx40 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %43
  %44 = load i32, i32* %arrayidx40, align 4
  %and41 = and i32 %44, -33
  store i32 %and41, i32* %arrayidx40, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then39, %if.end33
  %45 = load volatile i32, i32* %save_return_catch_flag, align 4
  %tobool43 = icmp ne i32 %45, 0
  br i1 %tobool43, label %if.then44, label %if.end49

if.then44:                                        ; preds = %if.end42
  %46 = load volatile i32, i32* %save_return_catch_flag, align 4
  store i32 %46, i32* @return_catch_flag, align 4
  %47 = load i32, i32* %trap_exit_value, align 4
  store i32 %47, i32* @return_catch_value, align 4
  %arraydecay45 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %save_return_catch, i32 0, i32 0
  %48 = bitcast %struct.__jmp_buf_tag* %arraydecay45 to i8*
  call void @xbcopy(i8* %48, i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i32 156)
  %49 = load volatile i32, i32* %function_code, align 4
  %tobool46 = icmp ne i32 %49, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.then44
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0), i32 1) #4
  unreachable

if.end48:                                         ; preds = %if.then44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end42
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %land.lhs.true6, %land.lhs.true3, %land.lhs.true, %entry
  %50 = load i32, i32* %trap_exit_value, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind
define void @run_error_trap() #0 {
entry:
  %0 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 66), align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 66), align 4
  %and1 = and i32 %1, 64
  %cmp = icmp eq i32 %and1, 0
  br i1 %cmp, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 66), align 4
  %and3 = and i32 %2, 16
  %cmp4 = icmp eq i32 %and3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %call = call i32 @_run_trap_internal(i32 66, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.77, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @run_return_trap() #0 {
entry:
  %old_exit_value = alloca i32, align 4
  %0 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 67), align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 67), align 4
  %and1 = and i32 %1, 64
  %cmp = icmp eq i32 %and1, 0
  br i1 %cmp, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 67), align 4
  %and3 = and i32 %2, 16
  %cmp4 = icmp eq i32 %and3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %3 = load i32, i32* @last_command_exit_value, align 4
  store i32 %3, i32* %old_exit_value, align 4
  %call = call i32 @_run_trap_internal(i32 67, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.78, i32 0, i32 0))
  %4 = load i32, i32* %old_exit_value, align 4
  store i32 %4, i32* @last_command_exit_value, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @free_trap_strings() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %cmp1 = icmp ne i8* %2, inttoptr (i32 1 to i8*)
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  call void @free_trap_string(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 65, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc10, %for.end
  %5 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %5, 68
  br i1 %cmp3, label %for.body4, label %for.end12

for.body4:                                        ; preds = %for.cond2
  %6 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %6
  %7 = load i32, i32* %arrayidx5, align 4
  %and = and i32 %7, 1
  %cmp6 = icmp eq i32 %and, 0
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %for.body4
  %8 = load i32, i32* %i, align 4
  call void @free_trap_string(i32 %8)
  %9 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %9
  store i8* null, i8** %arrayidx8, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %for.body4
  br label %for.inc10

for.inc10:                                        ; preds = %if.end9
  %10 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %10, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond2

for.end12:                                        ; preds = %for.cond2
  ret void
}

; Function Attrs: noinline nounwind
define internal void @free_trap_string(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  call void @change_signal(i32 %0, i8* null)
  %1 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %and = and i32 %2, -2
  store i32 %and, i32* %arrayidx, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @reset_signal_handlers() #0 {
entry:
  call void @reset_or_restore_signal_handlers(void (i32)* @reset_signal)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @reset_or_restore_signal_handlers(void (i32)* %reset) #0 {
entry:
  %reset.addr = alloca void (i32)*, align 4
  %i = alloca i32, align 4
  store void (i32)* %reset, void (i32)** %reset.addr, align 4
  %0 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %and1 = and i32 %1, -2
  store i32 %and1, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 0), align 4
  %2 = load void (i32)*, void (i32)** %reset.addr, align 4
  %cmp = icmp ne void (i32)* %2, @reset_signal
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @free_trap_command(i32 0)
  store i8* null, i8** getelementptr inbounds ([68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 0), align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i32, i32* %i, align 4
  %cmp4 = icmp slt i32 %3, 65
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %4
  %5 = load i32, i32* %arrayidx, align 4
  %and5 = and i32 %5, 1
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.else12

if.then7:                                         ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [68 x i8*], [68 x i8*]* @trap_list, i32 0, i32 %6
  %7 = load i8*, i8** %arrayidx8, align 4
  %cmp9 = icmp eq i8* %7, inttoptr (i32 1 to i8*)
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %i, align 4
  %call = call void (i32)* @signal(i32 %8, void (i32)* inttoptr (i32 1 to void (i32)*))
  br label %if.end11

if.else:                                          ; preds = %if.then7
  %9 = load void (i32)*, void (i32)** %reset.addr, align 4
  %10 = load i32, i32* %i, align 4
  call void %9(i32 %10)
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then10
  br label %if.end18

if.else12:                                        ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx13, align 4
  %and14 = and i32 %12, 4
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.else12
  %13 = load void (i32)*, void (i32)** %reset.addr, align 4
  %14 = load i32, i32* %i, align 4
  call void %13(i32 %14)
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.else12
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end11
  %15 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %15
  store i32 0, i32* %arrayidx19, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* @function_trace_mode, align 4
  %cmp20 = icmp eq i32 %17, 0
  br i1 %cmp20, label %if.then21, label %if.end24

if.then21:                                        ; preds = %for.end
  %18 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 65), align 4
  %and22 = and i32 %18, -2
  store i32 %and22, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 65), align 4
  %19 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 67), align 4
  %and23 = and i32 %19, -2
  store i32 %and23, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 67), align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %for.end
  %20 = load i32, i32* @error_trace_mode, align 4
  %cmp25 = icmp eq i32 %20, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end24
  %21 = load i32, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 66), align 4
  %and27 = and i32 %21, -2
  store i32 %and27, i32* getelementptr inbounds ([68 x i32], [68 x i32]* @sigmodes, i32 0, i32 66), align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end24
  ret void
}

; Function Attrs: noinline nounwind
define internal void @reset_signal(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %1 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %1
  %2 = load void (i32)*, void (i32)** %arrayidx, align 4
  %call = call void (i32)* @signal(i32 %0, void (i32)* %2)
  %3 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %3
  %4 = load i32, i32* %arrayidx1, align 4
  %and = and i32 %4, -2
  store i32 %and, i32* %arrayidx1, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @restore_original_signals() #0 {
entry:
  call void @reset_or_restore_signal_handlers(void (i32)* @restore_signal)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @restore_signal(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %1 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %1
  %2 = load void (i32)*, void (i32)** %arrayidx, align 4
  %call = call void (i32)* @signal(i32 %0, void (i32)* %2)
  %3 = load i32, i32* %sig.addr, align 4
  call void @change_signal(i32 %3, i8* null)
  %4 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %4
  %5 = load i32, i32* %arrayidx1, align 4
  %and = and i32 %5, -2
  store i32 %and, i32* %arrayidx1, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @maybe_call_trap_handler(i32 %sig) #0 {
entry:
  %retval = alloca i32, align 4
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx1, align 4
  %and2 = and i32 %3, 64
  %cmp = icmp eq i32 %and2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %sig.addr, align 4
  switch i32 %4, label %sw.default [
    i32 2, label %sw.bb
    i32 0, label %sw.bb3
    i32 65, label %sw.bb4
    i32 66, label %sw.bb6
  ]

sw.bb:                                            ; preds = %if.then
  call void @run_interrupt_trap(i32 0)
  br label %sw.epilog

sw.bb3:                                           ; preds = %if.then
  %call = call i32 @run_exit_trap()
  br label %sw.epilog

sw.bb4:                                           ; preds = %if.then
  %call5 = call i32 @run_debug_trap()
  br label %sw.epilog

sw.bb6:                                           ; preds = %if.then
  call void @run_error_trap()
  br label %sw.epilog

sw.default:                                       ; preds = %if.then
  %5 = load i32, i32* %sig.addr, align 4
  call void @trap_handler(i32 %5)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb6, %sw.bb4, %sw.bb3, %sw.bb
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %sw.epilog
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @signal_is_trapped(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 1
  ret i32 %and
}

; Function Attrs: noinline nounwind
define i32 @signal_is_pending(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [65 x i32], [65 x i32]* @pending_traps, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define i32 @signal_is_special(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 4
  ret i32 %and
}

; Function Attrs: noinline nounwind
define i32 @signal_is_ignored(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 64
  ret i32 %and
}

; Function Attrs: noinline nounwind
define i32 @signal_is_hard_ignored(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 2
  ret i32 %and
}

; Function Attrs: noinline nounwind
define void @set_signal_hard_ignored(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %or = or i32 %1, 2
  store i32 %or, i32* %arrayidx, align 4
  %2 = load i32, i32* %sig.addr, align 4
  %arrayidx1 = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %2
  store void (i32)* inttoptr (i32 1 to void (i32)*), void (i32)** %arrayidx1, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @set_signal_ignored(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [65 x void (i32)*], [65 x void (i32)*]* @original_signals, i32 0, i32 %0
  store void (i32)* inttoptr (i32 1 to void (i32)*), void (i32)** %arrayidx, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @signal_in_progress(i32 %sig) #0 {
entry:
  %sig.addr = alloca i32, align 4
  store i32 %sig, i32* %sig.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %arrayidx = getelementptr inbounds [68 x i32], [68 x i32]* @sigmodes, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  %and = and i32 %1, 16
  ret i32 %and
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare void @xbcopy(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }
attributes #5 = { returns_twice }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
