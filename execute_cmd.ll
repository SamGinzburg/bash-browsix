; ModuleID = 'execute_cmd.c'
source_filename = "execute_cmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%struct.fd_bitmap = type { i32, i8* }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.coproc = type { i8*, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.cplist = type { %struct.cpelement*, %struct.cpelement*, i32, i32 }
%struct.cpelement = type { %struct.cpelement*, %struct.coproc* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct._IO_FILE = type opaque
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.var_context = type { i8*, i32, i32, %struct.var_context*, %struct.var_context*, %struct.hash_table* }
%struct.cond_com = type { i32, i32, i32, %struct.word_desc*, %struct.cond_com*, %struct.cond_com* }
%struct.arith_com = type { i32, i32, %struct.word_list* }
%struct.arith_for_com = type { i32, i32, %struct.word_list*, %struct.word_list*, %struct.word_list*, %struct.command* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }
%struct.select_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.case_com = type { i32, i32, %struct.word_desc*, %struct.pattern_list* }
%struct.pattern_list = type { %struct.pattern_list*, %struct.word_list*, %struct.command*, i32 }
%struct.while_com = type { i32, %struct.command*, %struct.command* }
%struct.if_com = type { i32, %struct.command*, %struct.command*, %struct.command* }
%struct.group_com = type { i32, %struct.command* }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct.subshell_com = type { i32, %struct.command* }
%struct.coproc_com = type { i32, i8*, %struct.command* }
%struct.__sigset_t = type { [32 x i32] }
%struct.timeval = type { i32, i32 }
%struct.timezone = type { i32, i32 }
%struct.rusage = type { %struct.timeval, %struct.timeval, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [16 x i32] }
%struct.connection = type { i32, %struct.command*, %struct.command*, i32 }
%struct.func_array_state = type { %struct.array*, %struct.variable*, %struct.array*, %struct.variable*, %struct.array*, %struct.variable* }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.sh_getopt_state = type { i8*, i32, i32, i8*, i32, i32 }
%struct.lconv = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }

@builtin_ignoring_errexit = global i32 0, align 4
@redirection_undo_list = global %struct.redirect* null, align 4
@exec_redirection_undo_list = global %struct.redirect* null, align 4
@executing_builtin = global i32 0, align 4
@executing_list = global i32 0, align 4
@comsub_ignore_return = global i32 0, align 4
@subshell_level = global i32 0, align 4
@match_ignore_case = global i32 0, align 4
@executing_command_builtin = global i32 0, align 4
@funcnest = global i32 0, align 4
@funcnest_max = global i32 0, align 4
@evalnest = global i32 0, align 4
@evalnest_max = global i32 0, align 4
@sourcenest = global i32 0, align 4
@sourcenest_max = global i32 0, align 4
@from_return_trap = global i32 0, align 4
@lastpipe_opt = global i32 0, align 4
@current_fds_to_close = global %struct.fd_bitmap* null, align 4
@.str = private unnamed_addr constant [14 x i8] c"execute_cmd.c\00", align 1
@executing = external global i32, align 4
@showing_function_line = internal global i32 0, align 4
@variable_context = external global i32, align 4
@interactive_shell = external global i32, align 4
@currently_executing_command = internal global %struct.command* null, align 4
@line_number = external global i32, align 4
@.str.1 = private unnamed_addr constant [16 x i8] c"execute-command\00", align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@breaking = external global i32, align 4
@continuing = external global i32, align 4
@last_command_exit_value = common global i32 0, align 4
@read_but_dont_execute = external global i32, align 4
@exit_immediately_on_error = external global i32, align 4
@line_number_for_err_trap = common global i32 0, align 4
@running_trap = external global i32, align 4
@the_printed_command_except_trap = common global i8* null, align 4
@the_printed_command = external global i8*, align 4
@interactive = external global i32, align 4
@stdin_redir = common global i32 0, align 4
@.str.2 = private unnamed_addr constant [15 x i8] c"internal_fifos\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"loop_redirections\00", align 1
@last_made_pid = external global i32, align 4
@already_making_children = external global i32, align 4
@last_asynchronous_pid = external global i32, align 4
@posixly_correct = external global i32, align 4
@special_builtin_failed = internal global i32 0, align 4
@.str.4 = private unnamed_addr constant [16 x i8] c"saved-redirects\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"execute_command\00", align 1
@sh_coproc = global %struct.coproc { i8* null, i32 -1, i32 -1, i32 -1, i32 0, i32 0, i32 0, i32 0, i32 0 }, align 4
@coproc_list = global %struct.cplist zeroinitializer, align 4
@nameref_invalid_value = external global %struct.variable, align 4
@.str.6 = private unnamed_addr constant [7 x i8] c"%s_PID\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"FUNCNAME\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"execute-shell-function\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@.str.10 = private unnamed_addr constant [24 x i8] c"%s: %s: bad interpreter\00", align 1
@.str.11 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"%s: cannot execute binary file: %s\00", align 1
@shell_name = external global i8*, align 4
@restricted = external global i32, align 4
@subshell_argv = external global i8**, align 4
@subshell_argc = external global i32, align 4
@subshell_envp = external global i8**, align 4
@subshell_top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@this_command_name = common global i8* null, align 4
@return_catch_flag = common global i32 0, align 4
@return_catch_value = common global i32 0, align 4
@return_catch = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@last_command_exit_signal = common global i32 0, align 4
@subshell_environment = common global i32 0, align 4
@this_shell_function = common global %struct.variable* null, align 4
@SB = common global %struct.stat zeroinitializer, align 8
@shell_start_time = external global i32, align 4
@top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@.str.13 = private unnamed_addr constant [26 x i8] c"real %2R\0Auser %2U\0Asys %2S\00", align 1
@.str.14 = private unnamed_addr constant [11 x i8] c"TIMEFORMAT\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"user\09%2lU\0Asys\09%2lS\00", align 1
@.str.16 = private unnamed_addr constant [30 x i8] c"\0Areal\09%3lR\0Auser\09%3lU\0Asys\09%3lS\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.17 = private unnamed_addr constant [43 x i8] c"TIMEFORMAT: `%c': invalid format character\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@precs = internal constant [4 x i32] [i32 0, i32 100, i32 10, i32 1], align 4
@expand_aliases = external global i32, align 4
@login_shell = external global i32, align 4
@.str.19 = private unnamed_addr constant [32 x i8] c"cannot duplicate fd %d to fd %d\00", align 1
@.str.20 = private unnamed_addr constant [10 x i8] c"/dev/null\00", align 1
@.str.21 = private unnamed_addr constant [50 x i8] c"cannot redirect standard input from /dev/null: %s\00", align 1
@.str.22 = private unnamed_addr constant [44 x i8] c"execute_coproc: coproc [%d:%s] still exists\00", align 1
@command_string_index = external global i32, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@.str.23 = private unnamed_addr constant [19 x i8] c"execute_connection\00", align 1
@.str.24 = private unnamed_addr constant [11 x i8] c"pipe error\00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"pipe-file-descriptors\00", align 1
@.str.26 = private unnamed_addr constant [14 x i8] c"lastpipe-exec\00", align 1
@job_control = external global i32, align 4
@loop_level = external global i32, align 4
@.str.27 = private unnamed_addr constant [4 x i8] c"for\00", align 1
@echo_command_at_execute = external global i32, align 4
@debugging_mode = external global i32, align 4
@.str.28 = private unnamed_addr constant [3 x i8] c"((\00", align 1
@function_line_number = internal global i32 0, align 4
@.str.29 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"PS3\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"#? \00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"REPLY\00", align 1
@.str.33 = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@COLS = internal global i32 0, align 4
@tabsize = internal global i32 0, align 4
@.str.34 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.35 = private unnamed_addr constant [8 x i8] c"%*d%s%s\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c") \00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"case\00", align 1
@extended_glob = external global i32, align 4
@.str.38 = private unnamed_addr constant [3 x i8] c"[[\00", align 1
@shell_compatibility_level = external global i32, align 4
@.str.39 = private unnamed_addr constant [18 x i8] c"execute_cond_node\00", align 1
@sourcelevel = external global i32, align 4
@last_command_subst_pid = external global i32, align 4
@sigterm_received = external global i32, align 4
@.str.40 = private unnamed_addr constant [15 x i8] c"simple-command\00", align 1
@tempenv_assign_error = external global i32, align 4
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@last_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@temporary_env = external global %struct.hash_table*, align 4
@autocd = external global i32, align 4
@.str.41 = private unnamed_addr constant [3 x i8] c"--\00", align 1
@.str.42 = private unnamed_addr constant [3 x i8] c"cd\00", align 1
@.str.43 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@.str.44 = private unnamed_addr constant [8 x i8] c"command\00", align 1
@.str.45 = private unnamed_addr constant [4 x i8] c"Aag\00", align 1
@.str.46 = private unnamed_addr constant [13 x i8] c"eval_builtin\00", align 1
@trap_list = external global [0 x i8*], align 4
@.str.47 = private unnamed_addr constant [12 x i8] c"builtin_env\00", align 1
@.str.48 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.49 = private unnamed_addr constant [47 x i8] c"eval: maximum eval nesting level exceeded (%d)\00", align 1
@.str.50 = private unnamed_addr constant [47 x i8] c"%s: maximum source nesting level exceeded (%d)\00", align 1
@.str.51 = private unnamed_addr constant [16 x i8] c"return_temp_env\00", align 1
@errexit_flag = external global i32, align 4
@.str.52 = private unnamed_addr constant [12 x i8] c"saved_fifos\00", align 1
@.str.53 = private unnamed_addr constant [52 x i8] c"%s: restricted: cannot specify `/' in command names\00", align 1
@.str.54 = private unnamed_addr constant [25 x i8] c"command_not_found_handle\00", align 1
@.str.55 = private unnamed_addr constant [22 x i8] c"%s: command not found\00", align 1
@export_env = external global i8**, align 4
@.str.56 = private unnamed_addr constant [49 x i8] c"%s: maximum function nesting level exceeded (%d)\00", align 1
@.str.57 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@.str.58 = private unnamed_addr constant [12 x i8] c"BASH_LINENO\00", align 1
@.str.59 = private unnamed_addr constant [17 x i8] c"function_calling\00", align 1
@function_trace_mode = external global i32, align 4
@error_trace_mode = external global i32, align 4
@.str.60 = private unnamed_addr constant [7 x i8] c"OPTIND\00", align 1
@history_lines_this_session = external global i32, align 4
@shell_variables = external global %struct.var_context*, align 4
@parse_and_execute_level = external global i32, align 4
@.str.61 = private unnamed_addr constant [27 x i8] c"`%s': is a special builtin\00", align 1
@.str.62 = private unnamed_addr constant [22 x i8] c"%s: readonly function\00", align 1

; Function Attrs: noinline nounwind
define %struct.fd_bitmap* @new_fd_bitmap(i32 %size) #0 {
entry:
  %size.addr = alloca i32, align 4
  %ret = alloca %struct.fd_bitmap*, align 4
  store i32 %size, i32* %size.addr, align 4
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 319)
  %0 = bitcast i8* %call to %struct.fd_bitmap*
  store %struct.fd_bitmap* %0, %struct.fd_bitmap** %ret, align 4
  %1 = load i32, i32* %size.addr, align 4
  %2 = load %struct.fd_bitmap*, %struct.fd_bitmap** %ret, align 4
  %size1 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %2, i32 0, i32 0
  store i32 %1, i32* %size1, align 4
  %3 = load i32, i32* %size.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %size.addr, align 4
  %call2 = call i8* @sh_xmalloc(i32 %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 325)
  %5 = load %struct.fd_bitmap*, %struct.fd_bitmap** %ret, align 4
  %bitmap = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %5, i32 0, i32 1
  store i8* %call2, i8** %bitmap, align 4
  %6 = load %struct.fd_bitmap*, %struct.fd_bitmap** %ret, align 4
  %bitmap3 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %6, i32 0, i32 1
  %7 = load i8*, i8** %bitmap3, align 4
  %8 = load i32, i32* %size.addr, align 4
  call void @llvm.memset.p0i8.i32(i8* %7, i8 0, i32 %8, i32 1, i1 false)
  br label %if.end

if.else:                                          ; preds = %entry
  %9 = load %struct.fd_bitmap*, %struct.fd_bitmap** %ret, align 4
  %bitmap4 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %9, i32 0, i32 1
  store i8* null, i8** %bitmap4, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load %struct.fd_bitmap*, %struct.fd_bitmap** %ret, align 4
  ret %struct.fd_bitmap* %10
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define void @dispose_fd_bitmap(%struct.fd_bitmap* %fdbp) #0 {
entry:
  %fdbp.addr = alloca %struct.fd_bitmap*, align 4
  store %struct.fd_bitmap* %fdbp, %struct.fd_bitmap** %fdbp.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %bitmap = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %0, i32 0, i32 1
  %1 = load i8*, i8** %bitmap, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %bitmap1 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %2, i32 0, i32 1
  %3 = load i8*, i8** %bitmap1, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 337)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %4 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %5 = bitcast %struct.fd_bitmap* %4 to i8*
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 338)
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @close_fd_bitmap(%struct.fd_bitmap* %fdbp) #0 {
entry:
  %fdbp.addr = alloca %struct.fd_bitmap*, align 4
  %i = alloca i32, align 4
  store %struct.fd_bitmap* %fdbp, %struct.fd_bitmap** %fdbp.addr, align 4
  %0 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %tobool = icmp ne %struct.fd_bitmap* %0, null
  br i1 %tobool, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %size = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %2, i32 0, i32 0
  %3 = load i32, i32* %size, align 4
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %bitmap = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %4, i32 0, i32 1
  %5 = load i8*, i8** %bitmap, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %tobool1 = icmp ne i8 %7, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %call = call i32 @close(i32 %8)
  %9 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fdbp.addr, align 4
  %bitmap3 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %9, i32 0, i32 1
  %10 = load i8*, i8** %bitmap3, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i32 %11
  store i8 0, i8* %arrayidx4, align 1
  br label %if.end

if.end:                                           ; preds = %if.then2, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end5

if.end5:                                          ; preds = %for.end, %entry
  ret void
}

declare i32 @close(i32) #1

; Function Attrs: noinline nounwind
define i32 @executing_line_number() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @executing, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @showing_function_line, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %land.lhs.true1, label %if.else

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @variable_context, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %land.lhs.true4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true1
  %3 = load i32, i32* @interactive_shell, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %lor.lhs.false, %land.lhs.true1
  %4 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %tobool5 = icmp ne %struct.command* %4, null
  br i1 %tobool5, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true4
  %5 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 0
  %6 = load i32, i32* %type, align 4
  %cmp6 = icmp eq i32 %6, 11
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %7 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 4
  %Cond = bitcast %union.anon* %value to %struct.cond_com**
  %8 = load %struct.cond_com*, %struct.cond_com** %Cond, align 4
  %line = getelementptr inbounds %struct.cond_com, %struct.cond_com* %8, i32 0, i32 1
  %9 = load i32, i32* %line, align 4
  store i32 %9, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %10 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %type8 = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 0
  %11 = load i32, i32* %type8, align 4
  %cmp9 = icmp eq i32 %11, 10
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end
  %12 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %value11 = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 4
  %Arith = bitcast %union.anon* %value11 to %struct.arith_com**
  %13 = load %struct.arith_com*, %struct.arith_com** %Arith, align 4
  %line12 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %13, i32 0, i32 1
  %14 = load i32, i32* %line12, align 4
  store i32 %14, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.end
  %15 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %type14 = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 0
  %16 = load i32, i32* %type14, align 4
  %cmp15 = icmp eq i32 %16, 12
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end13
  %17 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  %value17 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 4
  %ArithFor = bitcast %union.anon* %value17 to %struct.arith_for_com**
  %18 = load %struct.arith_for_com*, %struct.arith_for_com** %ArithFor, align 4
  %line18 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %18, i32 0, i32 1
  %19 = load i32, i32* %line18, align 4
  store i32 %19, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.end13
  %20 = load i32, i32* @line_number, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true4, %lor.lhs.false, %land.lhs.true, %entry
  %21 = load i32, i32* @line_number, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.end19, %if.then16, %if.then10, %if.then7
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind
define i32 @execute_command(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %bitmap = alloca %struct.fd_bitmap*, align 4
  %result = alloca i32, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store %struct.fd_bitmap* null, %struct.fd_bitmap** @current_fds_to_close, align 4
  %call = call %struct.fd_bitmap* @new_fd_bitmap(i32 32)
  store %struct.fd_bitmap* %call, %struct.fd_bitmap** %bitmap, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
  %0 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  %1 = bitcast %struct.fd_bitmap* %0 to i8*
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void (%struct.fd_bitmap*)* @dispose_fd_bitmap to void (...)*), i8* %1)
  %2 = load %struct.command*, %struct.command** %command.addr, align 4
  %3 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  %call1 = call i32 @execute_command_internal(%struct.command* %2, i32 0, i32 -1, i32 -1, %struct.fd_bitmap* %3)
  store i32 %call1, i32* %result, align 4
  %4 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  call void @dispose_fd_bitmap(%struct.fd_bitmap* %4)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
  %5 = load i32, i32* @variable_context, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @unlink_fifo_list()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %6 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %do.body
  %7 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %7)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %do.body
  %8 = load volatile i32, i32* @interrupt_state, align 4
  %tobool4 = icmp ne i32 %8, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  call void @throw_to_top_level()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end3
  br label %do.end

do.end:                                           ; preds = %if.end6
  %9 = load i32, i32* %result, align 4
  ret i32 %9
}

declare void @begin_unwind_frame(i8*) #1

declare void @add_unwind_protect(...) #1

; Function Attrs: noinline nounwind
define i32 @execute_command_internal(%struct.command* %command, i32 %asynchronous, i32 %pipe_in, i32 %pipe_out, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca %struct.command*, align 4
  %asynchronous.addr = alloca i32, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %exec_result = alloca i32, align 4
  %user_subshell = alloca i32, align 4
  %invert = alloca i32, align 4
  %ignore_return = alloca i32, align 4
  %was_error_trap = alloca i32, align 4
  %my_undo_list = alloca %struct.redirect*, align 4
  %exec_undo_list = alloca %struct.redirect*, align 4
  %tcmd = alloca i8*, align 4
  %last_pid = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  %ofifo = alloca i32, align 4
  %nfifo = alloca i32, align 4
  %osize = alloca i32, align 4
  %saved_fifo = alloca i32, align 4
  %ofifo_list = alloca i8*, align 4
  %paren_pid = alloca i32, align 4
  %s = alloca i32, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %asynchronous, i32* %asynchronous.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %0 = load i32, i32* @breaking, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @continuing, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp = icmp eq %struct.command* %3, null
  br i1 %cmp, label %if.then4, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %if.end
  %4 = load i32, i32* @read_but_dont_execute, align 4
  %tobool3 = icmp ne i32 %4, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %lor.lhs.false2, %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %lor.lhs.false2
  br label %do.body

do.body:                                          ; preds = %if.end5
  %5 = load volatile i32, i32* @terminating_signal, align 4
  %tobool6 = icmp ne i32 %5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %do.body
  %6 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %6)
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %do.body
  %7 = load volatile i32, i32* @interrupt_state, align 4
  %tobool9 = icmp ne i32 %7, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  call void @throw_to_top_level()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end8
  br label %do.end

do.end:                                           ; preds = %if.end11
  call void @run_pending_traps()
  %8 = load %struct.command*, %struct.command** %command.addr, align 4
  store %struct.command* %8, %struct.command** @currently_executing_command, align 4
  %9 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 1
  %10 = load i32, i32* %flags, align 4
  %and = and i32 %10, 4
  %cmp12 = icmp ne i32 %and, 0
  %conv = zext i1 %cmp12 to i32
  store i32 %conv, i32* %invert, align 4
  %11 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool13 = icmp ne i32 %11, 0
  br i1 %tobool13, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %do.end
  %12 = load i32, i32* %invert, align 4
  %tobool14 = icmp ne i32 %12, 0
  br i1 %tobool14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %land.lhs.true
  %13 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags16 = getelementptr inbounds %struct.command, %struct.command* %13, i32 0, i32 1
  %14 = load i32, i32* %flags16, align 4
  %or = or i32 %14, 8
  store i32 %or, i32* %flags16, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %land.lhs.true, %do.end
  store i32 0, i32* %exec_result, align 4
  %15 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 0
  %16 = load i32, i32* %type, align 4
  %cmp18 = icmp eq i32 %16, 13
  br i1 %cmp18, label %land.lhs.true20, label %if.end25

land.lhs.true20:                                  ; preds = %if.end17
  %17 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags21 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 1
  %18 = load i32, i32* %flags21, align 4
  %and22 = and i32 %18, 64
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %land.lhs.true20
  %19 = load %struct.command*, %struct.command** %command.addr, align 4
  %20 = load i32, i32* %asynchronous.addr, align 4
  %21 = load i32, i32* %pipe_in.addr, align 4
  %22 = load i32, i32* %pipe_out.addr, align 4
  %23 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call = call i32 @execute_in_subshell(%struct.command* %19, i32 %20, i32 %21, i32 %22, %struct.fd_bitmap* %23)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end25:                                         ; preds = %land.lhs.true20, %if.end17
  %24 = load %struct.command*, %struct.command** %command.addr, align 4
  %type26 = getelementptr inbounds %struct.command, %struct.command* %24, i32 0, i32 0
  %25 = load i32, i32* %type26, align 4
  %cmp27 = icmp eq i32 %25, 14
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end25
  %26 = load %struct.command*, %struct.command** %command.addr, align 4
  %27 = load i32, i32* %pipe_in.addr, align 4
  %28 = load i32, i32* %pipe_out.addr, align 4
  %29 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call30 = call i32 @execute_coproc(%struct.command* %26, i32 %27, i32 %28, %struct.fd_bitmap* %29)
  store i32 %call30, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %if.end25
  %30 = load %struct.command*, %struct.command** %command.addr, align 4
  %type32 = getelementptr inbounds %struct.command, %struct.command* %30, i32 0, i32 0
  %31 = load i32, i32* %type32, align 4
  %cmp33 = icmp eq i32 %31, 13
  br i1 %cmp33, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end31
  %32 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags35 = getelementptr inbounds %struct.command, %struct.command* %32, i32 0, i32 1
  %33 = load i32, i32* %flags35, align 4
  %and36 = and i32 %33, 1
  %cmp37 = icmp ne i32 %and36, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end31
  %34 = phi i1 [ true, %if.end31 ], [ %cmp37, %lor.rhs ]
  %lor.ext = zext i1 %34 to i32
  store i32 %lor.ext, i32* %user_subshell, align 4
  %35 = load %struct.command*, %struct.command** %command.addr, align 4
  %type39 = getelementptr inbounds %struct.command, %struct.command* %35, i32 0, i32 0
  %36 = load i32, i32* %type39, align 4
  %cmp40 = icmp eq i32 %36, 13
  br i1 %cmp40, label %if.then58, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %lor.end
  %37 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags43 = getelementptr inbounds %struct.command, %struct.command* %37, i32 0, i32 1
  %38 = load i32, i32* %flags43, align 4
  %and44 = and i32 %38, 3
  %tobool45 = icmp ne i32 %and44, 0
  br i1 %tobool45, label %if.then58, label %lor.lhs.false46

lor.lhs.false46:                                  ; preds = %lor.lhs.false42
  %39 = load %struct.command*, %struct.command** %command.addr, align 4
  %type47 = getelementptr inbounds %struct.command, %struct.command* %39, i32 0, i32 0
  %40 = load i32, i32* %type47, align 4
  %call48 = call i32 @shell_control_structure(i32 %40)
  %tobool49 = icmp ne i32 %call48, 0
  br i1 %tobool49, label %land.lhs.true50, label %if.end192

land.lhs.true50:                                  ; preds = %lor.lhs.false46
  %41 = load i32, i32* %pipe_out.addr, align 4
  %cmp51 = icmp ne i32 %41, -1
  br i1 %cmp51, label %if.then58, label %lor.lhs.false53

lor.lhs.false53:                                  ; preds = %land.lhs.true50
  %42 = load i32, i32* %pipe_in.addr, align 4
  %cmp54 = icmp ne i32 %42, -1
  br i1 %cmp54, label %if.then58, label %lor.lhs.false56

lor.lhs.false56:                                  ; preds = %lor.lhs.false53
  %43 = load i32, i32* %asynchronous.addr, align 4
  %tobool57 = icmp ne i32 %43, 0
  br i1 %tobool57, label %if.then58, label %if.end192

if.then58:                                        ; preds = %lor.lhs.false56, %lor.lhs.false53, %land.lhs.true50, %lor.lhs.false42, %lor.end
  %44 = load i32, i32* @line_number, align 4
  store i32 %44, i32* @line_number_for_err_trap, align 4
  %45 = load %struct.command*, %struct.command** %command.addr, align 4
  %call59 = call i8* @make_command_string(%struct.command* %45)
  store i8* %call59, i8** %tcmd, align 4
  %46 = load i8*, i8** %tcmd, align 4
  %call60 = call i32 @strlen(i8* %46)
  %add = add i32 1, %call60
  %call61 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 610)
  %47 = load i8*, i8** %tcmd, align 4
  %call62 = call i8* @strcpy(i8* %call61, i8* %47)
  %48 = load i32, i32* %asynchronous.addr, align 4
  %call63 = call i32 @make_child(i8* %call62, i32 %48)
  store i32 %call63, i32* %paren_pid, align 4
  %49 = load i32, i32* %user_subshell, align 4
  %tobool64 = icmp ne i32 %49, 0
  br i1 %tobool64, label %land.lhs.true65, label %if.end85

land.lhs.true65:                                  ; preds = %if.then58
  %call66 = call i32 @signal_is_trapped(i32 66)
  %tobool67 = icmp ne i32 %call66, 0
  br i1 %tobool67, label %land.lhs.true68, label %if.end85

land.lhs.true68:                                  ; preds = %land.lhs.true65
  %call69 = call i32 @signal_in_progress(i32 65)
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %land.lhs.true72, label %if.end85

land.lhs.true72:                                  ; preds = %land.lhs.true68
  %50 = load i32, i32* @running_trap, align 4
  %cmp73 = icmp eq i32 %50, 0
  br i1 %cmp73, label %if.then75, label %if.end85

if.then75:                                        ; preds = %land.lhs.true72
  br label %do.body76

do.body76:                                        ; preds = %if.then75
  %51 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool77 = icmp ne i8* %51, null
  br i1 %tobool77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %do.body76
  %52 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %52, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 615)
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %do.body76
  br label %do.end80

do.end80:                                         ; preds = %if.end79
  %53 = load i8*, i8** @the_printed_command, align 4
  %call81 = call i32 @strlen(i8* %53)
  %add82 = add i32 1, %call81
  %call83 = call i8* @sh_xmalloc(i32 %add82, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 616)
  %54 = load i8*, i8** @the_printed_command, align 4
  %call84 = call i8* @strcpy(i8* %call83, i8* %54)
  store i8* %call84, i8** @the_printed_command_except_trap, align 4
  br label %if.end85

if.end85:                                         ; preds = %do.end80, %land.lhs.true72, %land.lhs.true68, %land.lhs.true65, %if.then58
  %55 = load i32, i32* %paren_pid, align 4
  %cmp86 = icmp eq i32 %55, 0
  br i1 %cmp86, label %if.then88, label %if.else123

if.then88:                                        ; preds = %if.end85
  %56 = load i32, i32* %user_subshell, align 4
  %cmp89 = icmp eq i32 %56, 0
  br i1 %cmp89, label %land.lhs.true91, label %land.end

land.lhs.true91:                                  ; preds = %if.then88
  %57 = load %struct.command*, %struct.command** %command.addr, align 4
  %type92 = getelementptr inbounds %struct.command, %struct.command* %57, i32 0, i32 0
  %58 = load i32, i32* %type92, align 4
  %cmp93 = icmp eq i32 %58, 9
  br i1 %cmp93, label %land.lhs.true95, label %land.end

land.lhs.true95:                                  ; preds = %land.lhs.true91
  %59 = load i32, i32* %pipe_in.addr, align 4
  %cmp96 = icmp eq i32 %59, -1
  br i1 %cmp96, label %land.lhs.true98, label %land.end

land.lhs.true98:                                  ; preds = %land.lhs.true95
  %60 = load i32, i32* %pipe_out.addr, align 4
  %cmp99 = icmp eq i32 %60, -1
  br i1 %cmp99, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true98
  %61 = load i32, i32* %asynchronous.addr, align 4
  %tobool101 = icmp ne i32 %61, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true98, %land.lhs.true95, %land.lhs.true91, %if.then88
  %62 = phi i1 [ false, %land.lhs.true98 ], [ false, %land.lhs.true95 ], [ false, %land.lhs.true91 ], [ false, %if.then88 ], [ %tobool101, %land.rhs ]
  %land.ext = zext i1 %62 to i32
  store i32 %land.ext, i32* %s, align 4
  %63 = load i32, i32* %user_subshell, align 4
  %cmp102 = icmp eq i32 %63, 0
  br i1 %cmp102, label %land.lhs.true104, label %land.end117

land.lhs.true104:                                 ; preds = %land.end
  %64 = load %struct.command*, %struct.command** %command.addr, align 4
  %type105 = getelementptr inbounds %struct.command, %struct.command* %64, i32 0, i32 0
  %65 = load i32, i32* %type105, align 4
  %cmp106 = icmp eq i32 %65, 9
  br i1 %cmp106, label %land.lhs.true108, label %land.end117

land.lhs.true108:                                 ; preds = %land.lhs.true104
  %66 = load i32, i32* %pipe_in.addr, align 4
  %cmp109 = icmp ne i32 %66, -1
  br i1 %cmp109, label %land.rhs114, label %lor.lhs.false111

lor.lhs.false111:                                 ; preds = %land.lhs.true108
  %67 = load i32, i32* %pipe_out.addr, align 4
  %cmp112 = icmp ne i32 %67, -1
  br i1 %cmp112, label %land.rhs114, label %land.end117

land.rhs114:                                      ; preds = %lor.lhs.false111, %land.lhs.true108
  %68 = load i32, i32* %asynchronous.addr, align 4
  %cmp115 = icmp eq i32 %68, 0
  br label %land.end117

land.end117:                                      ; preds = %land.rhs114, %lor.lhs.false111, %land.lhs.true104, %land.end
  %69 = phi i1 [ false, %lor.lhs.false111 ], [ false, %land.lhs.true104 ], [ false, %land.end ], [ %cmp115, %land.rhs114 ]
  %land.ext118 = zext i1 %69 to i32
  %70 = load i32, i32* %s, align 4
  %add119 = add nsw i32 %70, %land.ext118
  store i32 %add119, i32* %s, align 4
  %71 = load %struct.command*, %struct.command** %command.addr, align 4
  %72 = load i32, i32* %asynchronous.addr, align 4
  %73 = load i32, i32* %pipe_in.addr, align 4
  %74 = load i32, i32* %pipe_out.addr, align 4
  %75 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call120 = call i32 @execute_in_subshell(%struct.command* %71, i32 %72, i32 %73, i32 %74, %struct.fd_bitmap* %75)
  store volatile i32 %call120, i32* @last_command_exit_value, align 4
  %76 = load i32, i32* %s, align 4
  %tobool121 = icmp ne i32 %76, 0
  br i1 %tobool121, label %if.then122, label %if.else

if.then122:                                       ; preds = %land.end117
  %77 = load volatile i32, i32* @last_command_exit_value, align 4
  call void @subshell_exit(i32 %77) #5
  unreachable

if.else:                                          ; preds = %land.end117
  %78 = load volatile i32, i32* @last_command_exit_value, align 4
  call void @sh_exit(i32 %78) #5
  unreachable

if.else123:                                       ; preds = %if.end85
  %79 = load i32, i32* %pipe_in.addr, align 4
  %80 = load i32, i32* %pipe_out.addr, align 4
  call void @close_pipes(i32 %79, i32 %80)
  %81 = load i32, i32* @variable_context, align 4
  %cmp124 = icmp eq i32 %81, 0
  br i1 %cmp124, label %if.then126, label %if.end127

if.then126:                                       ; preds = %if.else123
  call void @unlink_fifo_list()
  br label %if.end127

if.end127:                                        ; preds = %if.then126, %if.else123
  %82 = load i32, i32* %pipe_out.addr, align 4
  %cmp128 = icmp ne i32 %82, -1
  br i1 %cmp128, label %if.then130, label %if.end131

if.then130:                                       ; preds = %if.end127
  store i32 0, i32* %retval, align 4
  br label %return

if.end131:                                        ; preds = %if.end127
  %83 = load i32, i32* %asynchronous.addr, align 4
  %call132 = call i32 @stop_pipeline(i32 %83, %struct.command* null)
  %84 = load i32, i32* %asynchronous.addr, align 4
  %cmp133 = icmp eq i32 %84, 0
  br i1 %cmp133, label %if.then135, label %if.else186

if.then135:                                       ; preds = %if.end131
  %call136 = call i32 @signal_is_trapped(i32 66)
  %tobool137 = icmp ne i32 %call136, 0
  br i1 %tobool137, label %land.rhs138, label %land.end142

land.rhs138:                                      ; preds = %if.then135
  %call139 = call i32 @signal_is_ignored(i32 66)
  %cmp140 = icmp eq i32 %call139, 0
  br label %land.end142

land.end142:                                      ; preds = %land.rhs138, %if.then135
  %85 = phi i1 [ false, %if.then135 ], [ %cmp140, %land.rhs138 ]
  %land.ext143 = zext i1 %85 to i32
  store i32 %land.ext143, i32* %was_error_trap, align 4
  %86 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags144 = getelementptr inbounds %struct.command, %struct.command* %86, i32 0, i32 1
  %87 = load i32, i32* %flags144, align 4
  %and145 = and i32 %87, 4
  %cmp146 = icmp ne i32 %and145, 0
  %conv147 = zext i1 %cmp146 to i32
  store i32 %conv147, i32* %invert, align 4
  %88 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags148 = getelementptr inbounds %struct.command, %struct.command* %88, i32 0, i32 1
  %89 = load i32, i32* %flags148, align 4
  %and149 = and i32 %89, 8
  %cmp150 = icmp ne i32 %and149, 0
  %conv151 = zext i1 %cmp150 to i32
  store i32 %conv151, i32* %ignore_return, align 4
  %90 = load i32, i32* %paren_pid, align 4
  %call152 = call i32 @wait_for(i32 %90)
  store i32 %call152, i32* %exec_result, align 4
  %91 = load i32, i32* %invert, align 4
  %tobool153 = icmp ne i32 %91, 0
  br i1 %tobool153, label %if.then154, label %if.end157

if.then154:                                       ; preds = %land.end142
  %92 = load i32, i32* %exec_result, align 4
  %cmp155 = icmp eq i32 %92, 0
  %cond = select i1 %cmp155, i32 1, i32 0
  store i32 %cond, i32* %exec_result, align 4
  br label %if.end157

if.end157:                                        ; preds = %if.then154, %land.end142
  %93 = load i32, i32* %exec_result, align 4
  store volatile i32 %93, i32* @last_command_exit_value, align 4
  %94 = load i32, i32* %user_subshell, align 4
  %tobool158 = icmp ne i32 %94, 0
  br i1 %tobool158, label %land.lhs.true159, label %if.end171

land.lhs.true159:                                 ; preds = %if.end157
  %95 = load i32, i32* %was_error_trap, align 4
  %tobool160 = icmp ne i32 %95, 0
  br i1 %tobool160, label %land.lhs.true161, label %if.end171

land.lhs.true161:                                 ; preds = %land.lhs.true159
  %96 = load i32, i32* %ignore_return, align 4
  %cmp162 = icmp eq i32 %96, 0
  br i1 %cmp162, label %land.lhs.true164, label %if.end171

land.lhs.true164:                                 ; preds = %land.lhs.true161
  %97 = load i32, i32* %invert, align 4
  %cmp165 = icmp eq i32 %97, 0
  br i1 %cmp165, label %land.lhs.true167, label %if.end171

land.lhs.true167:                                 ; preds = %land.lhs.true164
  %98 = load i32, i32* %exec_result, align 4
  %cmp168 = icmp ne i32 %98, 0
  br i1 %cmp168, label %if.then170, label %if.end171

if.then170:                                       ; preds = %land.lhs.true167
  %99 = load i32, i32* @line_number, align 4
  store volatile i32 %99, i32* %save_line_number, align 4
  %100 = load i32, i32* @line_number_for_err_trap, align 4
  store i32 %100, i32* @line_number, align 4
  call void @run_error_trap()
  %101 = load volatile i32, i32* %save_line_number, align 4
  store i32 %101, i32* @line_number, align 4
  br label %if.end171

if.end171:                                        ; preds = %if.then170, %land.lhs.true167, %land.lhs.true164, %land.lhs.true161, %land.lhs.true159, %if.end157
  %102 = load i32, i32* %user_subshell, align 4
  %tobool172 = icmp ne i32 %102, 0
  br i1 %tobool172, label %land.lhs.true173, label %if.end185

land.lhs.true173:                                 ; preds = %if.end171
  %103 = load i32, i32* %ignore_return, align 4
  %cmp174 = icmp eq i32 %103, 0
  br i1 %cmp174, label %land.lhs.true176, label %if.end185

land.lhs.true176:                                 ; preds = %land.lhs.true173
  %104 = load i32, i32* %invert, align 4
  %cmp177 = icmp eq i32 %104, 0
  br i1 %cmp177, label %land.lhs.true179, label %if.end185

land.lhs.true179:                                 ; preds = %land.lhs.true176
  %105 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool180 = icmp ne i32 %105, 0
  br i1 %tobool180, label %land.lhs.true181, label %if.end185

land.lhs.true181:                                 ; preds = %land.lhs.true179
  %106 = load i32, i32* %exec_result, align 4
  %cmp182 = icmp ne i32 %106, 0
  br i1 %cmp182, label %if.then184, label %if.end185

if.then184:                                       ; preds = %land.lhs.true181
  call void @run_pending_traps()
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end185:                                        ; preds = %land.lhs.true181, %land.lhs.true179, %land.lhs.true176, %land.lhs.true173, %if.end171
  %107 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %107, i32* %retval, align 4
  br label %return

if.else186:                                       ; preds = %if.end131
  br label %do.body187

do.body187:                                       ; preds = %if.else186
  %108 = load i32, i32* @interactive, align 4
  %tobool188 = icmp ne i32 %108, 0
  br i1 %tobool188, label %if.then189, label %if.end190

if.then189:                                       ; preds = %do.body187
  %109 = load i32, i32* %paren_pid, align 4
  call void @describe_pid(i32 %109)
  br label %if.end190

if.end190:                                        ; preds = %if.then189, %do.body187
  br label %do.end191

do.end191:                                        ; preds = %if.end190
  call void @run_pending_traps()
  store volatile i32 0, i32* @last_command_exit_value, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end192:                                        ; preds = %lor.lhs.false56, %lor.lhs.false46
  %110 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags193 = getelementptr inbounds %struct.command, %struct.command* %110, i32 0, i32 1
  %111 = load i32, i32* %flags193, align 4
  %and194 = and i32 %111, 128
  %tobool195 = icmp ne i32 %and194, 0
  br i1 %tobool195, label %if.then196, label %if.end205

if.then196:                                       ; preds = %if.end192
  %112 = load i32, i32* %asynchronous.addr, align 4
  %tobool197 = icmp ne i32 %112, 0
  br i1 %tobool197, label %if.then198, label %if.else202

if.then198:                                       ; preds = %if.then196
  %113 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags199 = getelementptr inbounds %struct.command, %struct.command* %113, i32 0, i32 1
  %114 = load i32, i32* %flags199, align 4
  %or200 = or i32 %114, 2
  store i32 %or200, i32* %flags199, align 4
  %115 = load %struct.command*, %struct.command** %command.addr, align 4
  %116 = load i32, i32* %pipe_in.addr, align 4
  %117 = load i32, i32* %pipe_out.addr, align 4
  %118 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call201 = call i32 @execute_command_internal(%struct.command* %115, i32 1, i32 %116, i32 %117, %struct.fd_bitmap* %118)
  store i32 %call201, i32* %exec_result, align 4
  br label %if.end204

if.else202:                                       ; preds = %if.then196
  %119 = load %struct.command*, %struct.command** %command.addr, align 4
  %120 = load i32, i32* %asynchronous.addr, align 4
  %121 = load i32, i32* %pipe_in.addr, align 4
  %122 = load i32, i32* %pipe_out.addr, align 4
  %123 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call203 = call i32 @time_command(%struct.command* %119, i32 %120, i32 %121, i32 %122, %struct.fd_bitmap* %123)
  store i32 %call203, i32* %exec_result, align 4
  store %struct.command* null, %struct.command** @currently_executing_command, align 4
  br label %if.end204

if.end204:                                        ; preds = %if.else202, %if.then198
  %124 = load i32, i32* %exec_result, align 4
  store i32 %124, i32* %retval, align 4
  br label %return

if.end205:                                        ; preds = %if.end192
  %125 = load %struct.command*, %struct.command** %command.addr, align 4
  %type206 = getelementptr inbounds %struct.command, %struct.command* %125, i32 0, i32 0
  %126 = load i32, i32* %type206, align 4
  %call207 = call i32 @shell_control_structure(i32 %126)
  %tobool208 = icmp ne i32 %call207, 0
  br i1 %tobool208, label %land.lhs.true209, label %if.end214

land.lhs.true209:                                 ; preds = %if.end205
  %127 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %127, i32 0, i32 3
  %128 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool210 = icmp ne %struct.redirect* %128, null
  br i1 %tobool210, label %if.then211, label %if.end214

if.then211:                                       ; preds = %land.lhs.true209
  %129 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects212 = getelementptr inbounds %struct.command, %struct.command* %129, i32 0, i32 3
  %130 = load %struct.redirect*, %struct.redirect** %redirects212, align 4
  %call213 = call i32 @stdin_redirects(%struct.redirect* %130)
  store i32 %call213, i32* @stdin_redir, align 4
  br label %if.end214

if.end214:                                        ; preds = %if.then211, %land.lhs.true209, %if.end205
  %131 = load i32, i32* @variable_context, align 4
  %cmp215 = icmp ne i32 %131, 0
  br i1 %cmp215, label %if.then217, label %if.else220

if.then217:                                       ; preds = %if.end214
  %call218 = call i32 @num_fifos()
  store volatile i32 %call218, i32* %ofifo, align 4
  %call219 = call i8* @copy_fifo_list(i32* %osize)
  store i8* %call219, i8** %ofifo_list, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0))
  %132 = load i8*, i8** %ofifo_list, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %132)
  store volatile i32 1, i32* %saved_fifo, align 4
  br label %if.end221

if.else220:                                       ; preds = %if.end214
  store volatile i32 0, i32* %saved_fifo, align 4
  br label %if.end221

if.end221:                                        ; preds = %if.else220, %if.then217
  %133 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects222 = getelementptr inbounds %struct.command, %struct.command* %133, i32 0, i32 3
  %134 = load %struct.redirect*, %struct.redirect** %redirects222, align 4
  %call223 = call i32 @do_redirections(%struct.redirect* %134, i32 3)
  %cmp224 = icmp ne i32 %call223, 0
  br i1 %cmp224, label %if.then226, label %if.end230

if.then226:                                       ; preds = %if.end221
  %135 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @cleanup_redirects(%struct.redirect* %135)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  call void @dispose_exec_redirects()
  %136 = load volatile i32, i32* %saved_fifo, align 4
  %tobool227 = icmp ne i32 %136, 0
  br i1 %tobool227, label %if.then228, label %if.end229

if.then228:                                       ; preds = %if.then226
  %137 = load i8*, i8** %ofifo_list, align 4
  call void @sh_xfree(i8* %137, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 747)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0))
  br label %if.end229

if.end229:                                        ; preds = %if.then228, %if.then226
  store volatile i32 1, i32* @last_command_exit_value, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end230:                                        ; preds = %if.end221
  %138 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %tobool231 = icmp ne %struct.redirect* %138, null
  br i1 %tobool231, label %if.then232, label %if.else234

if.then232:                                       ; preds = %if.end230
  %139 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %call233 = call %struct.redirect* @copy_redirects(%struct.redirect* %139)
  store %struct.redirect* %call233, %struct.redirect** %my_undo_list, align 4
  %140 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %140)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  br label %if.end235

if.else234:                                       ; preds = %if.end230
  store %struct.redirect* null, %struct.redirect** %my_undo_list, align 4
  br label %if.end235

if.end235:                                        ; preds = %if.else234, %if.then232
  %141 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  %tobool236 = icmp ne %struct.redirect* %141, null
  br i1 %tobool236, label %if.then237, label %if.else239

if.then237:                                       ; preds = %if.end235
  %142 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  %call238 = call %struct.redirect* @copy_redirects(%struct.redirect* %142)
  store %struct.redirect* %call238, %struct.redirect** %exec_undo_list, align 4
  %143 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %143)
  store %struct.redirect* null, %struct.redirect** @exec_redirection_undo_list, align 4
  br label %if.end240

if.else239:                                       ; preds = %if.end235
  store %struct.redirect* null, %struct.redirect** %exec_undo_list, align 4
  br label %if.end240

if.end240:                                        ; preds = %if.else239, %if.then237
  %144 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  %tobool241 = icmp ne %struct.redirect* %144, null
  br i1 %tobool241, label %if.then244, label %lor.lhs.false242

lor.lhs.false242:                                 ; preds = %if.end240
  %145 = load %struct.redirect*, %struct.redirect** %exec_undo_list, align 4
  %tobool243 = icmp ne %struct.redirect* %145, null
  br i1 %tobool243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %lor.lhs.false242, %if.end240
  call void @begin_unwind_frame(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0))
  br label %if.end245

if.end245:                                        ; preds = %if.then244, %lor.lhs.false242
  %146 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  %tobool246 = icmp ne %struct.redirect* %146, null
  br i1 %tobool246, label %if.then247, label %if.end248

if.then247:                                       ; preds = %if.end245
  %147 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, %struct.redirect*)*)(i32 (...)* bitcast (void (%struct.redirect*)* @cleanup_redirects to i32 (...)*), %struct.redirect* %147)
  br label %if.end248

if.end248:                                        ; preds = %if.then247, %if.end245
  %148 = load %struct.redirect*, %struct.redirect** %exec_undo_list, align 4
  %tobool249 = icmp ne %struct.redirect* %148, null
  br i1 %tobool249, label %if.then250, label %if.end251

if.then250:                                       ; preds = %if.end248
  %149 = load %struct.redirect*, %struct.redirect** %exec_undo_list, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, %struct.redirect*)*)(i32 (...)* bitcast (void (%struct.redirect*)* @dispose_redirects to i32 (...)*), %struct.redirect* %149)
  br label %if.end251

if.end251:                                        ; preds = %if.then250, %if.end248
  %150 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags252 = getelementptr inbounds %struct.command, %struct.command* %150, i32 0, i32 1
  %151 = load i32, i32* %flags252, align 4
  %and253 = and i32 %151, 8
  %cmp254 = icmp ne i32 %and253, 0
  %conv255 = zext i1 %cmp254 to i32
  store i32 %conv255, i32* %ignore_return, align 4
  br label %do.body256

do.body256:                                       ; preds = %if.end251
  %152 = load volatile i32, i32* @terminating_signal, align 4
  %tobool257 = icmp ne i32 %152, 0
  br i1 %tobool257, label %if.then258, label %if.end259

if.then258:                                       ; preds = %do.body256
  %153 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %153)
  br label %if.end259

if.end259:                                        ; preds = %if.then258, %do.body256
  %154 = load volatile i32, i32* @interrupt_state, align 4
  %tobool260 = icmp ne i32 %154, 0
  br i1 %tobool260, label %if.then261, label %if.end262

if.then261:                                       ; preds = %if.end259
  call void @throw_to_top_level()
  br label %if.end262

if.end262:                                        ; preds = %if.then261, %if.end259
  br label %do.end263

do.end263:                                        ; preds = %if.end262
  %155 = load %struct.command*, %struct.command** %command.addr, align 4
  %type264 = getelementptr inbounds %struct.command, %struct.command* %155, i32 0, i32 0
  %156 = load i32, i32* %type264, align 4
  switch i32 %156, label %sw.default [
    i32 4, label %sw.bb
    i32 0, label %sw.bb372
    i32 12, label %sw.bb382
    i32 5, label %sw.bb392
    i32 1, label %sw.bb402
    i32 2, label %sw.bb412
    i32 8, label %sw.bb422
    i32 3, label %sw.bb433
    i32 9, label %sw.bb443
    i32 6, label %sw.bb467
    i32 10, label %sw.bb472
    i32 11, label %sw.bb514
    i32 7, label %sw.bb556
  ]

sw.bb:                                            ; preds = %do.end263
  %157 = load i32, i32* @line_number, align 4
  store volatile i32 %157, i32* %save_line_number, align 4
  %158 = load volatile i32, i32* @last_made_pid, align 4
  store volatile i32 %158, i32* %last_pid, align 4
  %call265 = call i32 @signal_is_trapped(i32 66)
  %tobool266 = icmp ne i32 %call265, 0
  br i1 %tobool266, label %land.rhs267, label %land.end271

land.rhs267:                                      ; preds = %sw.bb
  %call268 = call i32 @signal_is_ignored(i32 66)
  %cmp269 = icmp eq i32 %call268, 0
  br label %land.end271

land.end271:                                      ; preds = %land.rhs267, %sw.bb
  %159 = phi i1 [ false, %sw.bb ], [ %cmp269, %land.rhs267 ]
  %land.ext272 = zext i1 %159 to i32
  store i32 %land.ext272, i32* %was_error_trap, align 4
  %160 = load i32, i32* %ignore_return, align 4
  %tobool273 = icmp ne i32 %160, 0
  br i1 %tobool273, label %land.lhs.true274, label %if.end281

land.lhs.true274:                                 ; preds = %land.end271
  %161 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %161, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  %162 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %tobool275 = icmp ne %struct.simple_com* %162, null
  br i1 %tobool275, label %if.then276, label %if.end281

if.then276:                                       ; preds = %land.lhs.true274
  %163 = load %struct.command*, %struct.command** %command.addr, align 4
  %value277 = getelementptr inbounds %struct.command, %struct.command* %163, i32 0, i32 4
  %Simple278 = bitcast %union.anon* %value277 to %struct.simple_com**
  %164 = load %struct.simple_com*, %struct.simple_com** %Simple278, align 4
  %flags279 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %164, i32 0, i32 0
  %165 = load i32, i32* %flags279, align 4
  %or280 = or i32 %165, 8
  store i32 %or280, i32* %flags279, align 4
  br label %if.end281

if.end281:                                        ; preds = %if.then276, %land.lhs.true274, %land.end271
  %166 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags282 = getelementptr inbounds %struct.command, %struct.command* %166, i32 0, i32 1
  %167 = load i32, i32* %flags282, align 4
  %and283 = and i32 %167, 1024
  %tobool284 = icmp ne i32 %and283, 0
  br i1 %tobool284, label %if.then285, label %if.end290

if.then285:                                       ; preds = %if.end281
  %168 = load %struct.command*, %struct.command** %command.addr, align 4
  %value286 = getelementptr inbounds %struct.command, %struct.command* %168, i32 0, i32 4
  %Simple287 = bitcast %union.anon* %value286 to %struct.simple_com**
  %169 = load %struct.simple_com*, %struct.simple_com** %Simple287, align 4
  %flags288 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %169, i32 0, i32 0
  %170 = load i32, i32* %flags288, align 4
  %or289 = or i32 %170, 1024
  store i32 %or289, i32* %flags288, align 4
  br label %if.end290

if.end290:                                        ; preds = %if.then285, %if.end281
  %171 = load %struct.command*, %struct.command** %command.addr, align 4
  %value291 = getelementptr inbounds %struct.command, %struct.command* %171, i32 0, i32 4
  %Simple292 = bitcast %union.anon* %value291 to %struct.simple_com**
  %172 = load %struct.simple_com*, %struct.simple_com** %Simple292, align 4
  %line = getelementptr inbounds %struct.simple_com, %struct.simple_com* %172, i32 0, i32 1
  %173 = load i32, i32* %line, align 4
  store i32 %173, i32* @line_number, align 4
  store i32 %173, i32* @line_number_for_err_trap, align 4
  %174 = load %struct.command*, %struct.command** %command.addr, align 4
  %value293 = getelementptr inbounds %struct.command, %struct.command* %174, i32 0, i32 4
  %Simple294 = bitcast %union.anon* %value293 to %struct.simple_com**
  %175 = load %struct.simple_com*, %struct.simple_com** %Simple294, align 4
  %176 = load i32, i32* %pipe_in.addr, align 4
  %177 = load i32, i32* %pipe_out.addr, align 4
  %178 = load i32, i32* %asynchronous.addr, align 4
  %179 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call295 = call i32 @execute_simple_command(%struct.simple_com* %175, i32 %176, i32 %177, i32 %178, %struct.fd_bitmap* %179)
  store i32 %call295, i32* %exec_result, align 4
  %180 = load volatile i32, i32* %save_line_number, align 4
  store i32 %180, i32* @line_number, align 4
  call void @dispose_used_env_vars()
  %181 = load i32, i32* @already_making_children, align 4
  %tobool296 = icmp ne i32 %181, 0
  br i1 %tobool296, label %land.lhs.true297, label %if.end319

land.lhs.true297:                                 ; preds = %if.end290
  %182 = load i32, i32* %pipe_out.addr, align 4
  %cmp298 = icmp eq i32 %182, -1
  br i1 %cmp298, label %if.then300, label %if.end319

if.then300:                                       ; preds = %land.lhs.true297
  %183 = load i32, i32* %asynchronous.addr, align 4
  %call301 = call i32 @stop_pipeline(i32 %183, %struct.command* null)
  %184 = load i32, i32* %asynchronous.addr, align 4
  %tobool302 = icmp ne i32 %184, 0
  br i1 %tobool302, label %if.then303, label %if.else309

if.then303:                                       ; preds = %if.then300
  br label %do.body304

do.body304:                                       ; preds = %if.then303
  %185 = load i32, i32* @interactive, align 4
  %tobool305 = icmp ne i32 %185, 0
  br i1 %tobool305, label %if.then306, label %if.end307

if.then306:                                       ; preds = %do.body304
  %186 = load volatile i32, i32* @last_made_pid, align 4
  call void @describe_pid(i32 %186)
  br label %if.end307

if.end307:                                        ; preds = %if.then306, %do.body304
  br label %do.end308

do.end308:                                        ; preds = %if.end307
  store i32 0, i32* %exec_result, align 4
  store i32 0, i32* %invert, align 4
  br label %if.end318

if.else309:                                       ; preds = %if.then300
  %187 = load volatile i32, i32* @last_made_pid, align 4
  %cmp310 = icmp ne i32 %187, -1
  br i1 %cmp310, label %land.lhs.true312, label %if.end317

land.lhs.true312:                                 ; preds = %if.else309
  %188 = load volatile i32, i32* @last_made_pid, align 4
  %189 = load volatile i32, i32* @last_asynchronous_pid, align 4
  %cmp313 = icmp ne i32 %188, %189
  br i1 %cmp313, label %if.then315, label %if.end317

if.then315:                                       ; preds = %land.lhs.true312
  %190 = load volatile i32, i32* @last_made_pid, align 4
  %call316 = call i32 @wait_for(i32 %190)
  store i32 %call316, i32* %exec_result, align 4
  br label %if.end317

if.end317:                                        ; preds = %if.then315, %land.lhs.true312, %if.else309
  br label %if.end318

if.end318:                                        ; preds = %if.end317, %do.end308
  br label %if.end319

if.end319:                                        ; preds = %if.end318, %land.lhs.true297, %if.end290
  %191 = load i32, i32* %was_error_trap, align 4
  %tobool320 = icmp ne i32 %191, 0
  br i1 %tobool320, label %land.lhs.true321, label %if.end337

land.lhs.true321:                                 ; preds = %if.end319
  %192 = load i32, i32* %ignore_return, align 4
  %cmp322 = icmp eq i32 %192, 0
  br i1 %cmp322, label %land.lhs.true324, label %if.end337

land.lhs.true324:                                 ; preds = %land.lhs.true321
  %193 = load i32, i32* %invert, align 4
  %cmp325 = icmp eq i32 %193, 0
  br i1 %cmp325, label %land.lhs.true327, label %if.end337

land.lhs.true327:                                 ; preds = %land.lhs.true324
  %194 = load i32, i32* %pipe_in.addr, align 4
  %cmp328 = icmp eq i32 %194, -1
  br i1 %cmp328, label %land.lhs.true330, label %if.end337

land.lhs.true330:                                 ; preds = %land.lhs.true327
  %195 = load i32, i32* %pipe_out.addr, align 4
  %cmp331 = icmp eq i32 %195, -1
  br i1 %cmp331, label %land.lhs.true333, label %if.end337

land.lhs.true333:                                 ; preds = %land.lhs.true330
  %196 = load i32, i32* %exec_result, align 4
  %cmp334 = icmp ne i32 %196, 0
  br i1 %cmp334, label %if.then336, label %if.end337

if.then336:                                       ; preds = %land.lhs.true333
  %197 = load i32, i32* %exec_result, align 4
  store volatile i32 %197, i32* @last_command_exit_value, align 4
  %198 = load i32, i32* @line_number_for_err_trap, align 4
  store i32 %198, i32* @line_number, align 4
  call void @run_error_trap()
  %199 = load volatile i32, i32* %save_line_number, align 4
  store i32 %199, i32* @line_number, align 4
  br label %if.end337

if.end337:                                        ; preds = %if.then336, %land.lhs.true333, %land.lhs.true330, %land.lhs.true327, %land.lhs.true324, %land.lhs.true321, %if.end319
  %200 = load i32, i32* %ignore_return, align 4
  %cmp338 = icmp eq i32 %200, 0
  br i1 %cmp338, label %land.lhs.true340, label %if.end371

land.lhs.true340:                                 ; preds = %if.end337
  %201 = load i32, i32* %invert, align 4
  %cmp341 = icmp eq i32 %201, 0
  br i1 %cmp341, label %land.lhs.true343, label %if.end371

land.lhs.true343:                                 ; preds = %land.lhs.true340
  %202 = load i32, i32* @posixly_correct, align 4
  %tobool344 = icmp ne i32 %202, 0
  br i1 %tobool344, label %land.lhs.true345, label %lor.lhs.false350

land.lhs.true345:                                 ; preds = %land.lhs.true343
  %203 = load i32, i32* @interactive, align 4
  %cmp346 = icmp eq i32 %203, 0
  br i1 %cmp346, label %land.lhs.true348, label %lor.lhs.false350

land.lhs.true348:                                 ; preds = %land.lhs.true345
  %204 = load i32, i32* @special_builtin_failed, align 4
  %tobool349 = icmp ne i32 %204, 0
  br i1 %tobool349, label %if.then361, label %lor.lhs.false350

lor.lhs.false350:                                 ; preds = %land.lhs.true348, %land.lhs.true345, %land.lhs.true343
  %205 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool351 = icmp ne i32 %205, 0
  br i1 %tobool351, label %land.lhs.true352, label %if.end371

land.lhs.true352:                                 ; preds = %lor.lhs.false350
  %206 = load i32, i32* %pipe_in.addr, align 4
  %cmp353 = icmp eq i32 %206, -1
  br i1 %cmp353, label %land.lhs.true355, label %if.end371

land.lhs.true355:                                 ; preds = %land.lhs.true352
  %207 = load i32, i32* %pipe_out.addr, align 4
  %cmp356 = icmp eq i32 %207, -1
  br i1 %cmp356, label %land.lhs.true358, label %if.end371

land.lhs.true358:                                 ; preds = %land.lhs.true355
  %208 = load i32, i32* %exec_result, align 4
  %cmp359 = icmp ne i32 %208, 0
  br i1 %cmp359, label %if.then361, label %if.end371

if.then361:                                       ; preds = %land.lhs.true358, %land.lhs.true348
  %209 = load i32, i32* %exec_result, align 4
  store volatile i32 %209, i32* @last_command_exit_value, align 4
  call void @run_pending_traps()
  %210 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool362 = icmp ne i32 %210, 0
  br i1 %tobool362, label %land.lhs.true363, label %if.end370

land.lhs.true363:                                 ; preds = %if.then361
  %call364 = call i32 @signal_is_trapped(i32 0)
  %tobool365 = icmp ne i32 %call364, 0
  br i1 %tobool365, label %land.lhs.true366, label %if.end370

land.lhs.true366:                                 ; preds = %land.lhs.true363
  %call367 = call i32 @unwind_protect_tag_on_stack(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  %tobool368 = icmp ne i32 %call367, 0
  br i1 %tobool368, label %if.then369, label %if.end370

if.then369:                                       ; preds = %land.lhs.true366
  call void @run_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end370

if.end370:                                        ; preds = %if.then369, %land.lhs.true366, %land.lhs.true363, %if.then361
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end371:                                        ; preds = %land.lhs.true358, %land.lhs.true355, %land.lhs.true352, %lor.lhs.false350, %land.lhs.true340, %if.end337
  br label %sw.epilog

sw.bb372:                                         ; preds = %do.end263
  %211 = load i32, i32* %ignore_return, align 4
  %tobool373 = icmp ne i32 %211, 0
  br i1 %tobool373, label %if.then374, label %if.end378

if.then374:                                       ; preds = %sw.bb372
  %212 = load %struct.command*, %struct.command** %command.addr, align 4
  %value375 = getelementptr inbounds %struct.command, %struct.command* %212, i32 0, i32 4
  %For = bitcast %union.anon* %value375 to %struct.for_com**
  %213 = load %struct.for_com*, %struct.for_com** %For, align 4
  %flags376 = getelementptr inbounds %struct.for_com, %struct.for_com* %213, i32 0, i32 0
  %214 = load i32, i32* %flags376, align 4
  %or377 = or i32 %214, 8
  store i32 %or377, i32* %flags376, align 4
  br label %if.end378

if.end378:                                        ; preds = %if.then374, %sw.bb372
  %215 = load %struct.command*, %struct.command** %command.addr, align 4
  %value379 = getelementptr inbounds %struct.command, %struct.command* %215, i32 0, i32 4
  %For380 = bitcast %union.anon* %value379 to %struct.for_com**
  %216 = load %struct.for_com*, %struct.for_com** %For380, align 4
  %call381 = call i32 @execute_for_command(%struct.for_com* %216)
  store i32 %call381, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb382:                                         ; preds = %do.end263
  %217 = load i32, i32* %ignore_return, align 4
  %tobool383 = icmp ne i32 %217, 0
  br i1 %tobool383, label %if.then384, label %if.end388

if.then384:                                       ; preds = %sw.bb382
  %218 = load %struct.command*, %struct.command** %command.addr, align 4
  %value385 = getelementptr inbounds %struct.command, %struct.command* %218, i32 0, i32 4
  %ArithFor = bitcast %union.anon* %value385 to %struct.arith_for_com**
  %219 = load %struct.arith_for_com*, %struct.arith_for_com** %ArithFor, align 4
  %flags386 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %219, i32 0, i32 0
  %220 = load i32, i32* %flags386, align 4
  %or387 = or i32 %220, 8
  store i32 %or387, i32* %flags386, align 4
  br label %if.end388

if.end388:                                        ; preds = %if.then384, %sw.bb382
  %221 = load %struct.command*, %struct.command** %command.addr, align 4
  %value389 = getelementptr inbounds %struct.command, %struct.command* %221, i32 0, i32 4
  %ArithFor390 = bitcast %union.anon* %value389 to %struct.arith_for_com**
  %222 = load %struct.arith_for_com*, %struct.arith_for_com** %ArithFor390, align 4
  %call391 = call i32 @execute_arith_for_command(%struct.arith_for_com* %222)
  store i32 %call391, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb392:                                         ; preds = %do.end263
  %223 = load i32, i32* %ignore_return, align 4
  %tobool393 = icmp ne i32 %223, 0
  br i1 %tobool393, label %if.then394, label %if.end398

if.then394:                                       ; preds = %sw.bb392
  %224 = load %struct.command*, %struct.command** %command.addr, align 4
  %value395 = getelementptr inbounds %struct.command, %struct.command* %224, i32 0, i32 4
  %Select = bitcast %union.anon* %value395 to %struct.select_com**
  %225 = load %struct.select_com*, %struct.select_com** %Select, align 4
  %flags396 = getelementptr inbounds %struct.select_com, %struct.select_com* %225, i32 0, i32 0
  %226 = load i32, i32* %flags396, align 4
  %or397 = or i32 %226, 8
  store i32 %or397, i32* %flags396, align 4
  br label %if.end398

if.end398:                                        ; preds = %if.then394, %sw.bb392
  %227 = load %struct.command*, %struct.command** %command.addr, align 4
  %value399 = getelementptr inbounds %struct.command, %struct.command* %227, i32 0, i32 4
  %Select400 = bitcast %union.anon* %value399 to %struct.select_com**
  %228 = load %struct.select_com*, %struct.select_com** %Select400, align 4
  %call401 = call i32 @execute_select_command(%struct.select_com* %228)
  store i32 %call401, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb402:                                         ; preds = %do.end263
  %229 = load i32, i32* %ignore_return, align 4
  %tobool403 = icmp ne i32 %229, 0
  br i1 %tobool403, label %if.then404, label %if.end408

if.then404:                                       ; preds = %sw.bb402
  %230 = load %struct.command*, %struct.command** %command.addr, align 4
  %value405 = getelementptr inbounds %struct.command, %struct.command* %230, i32 0, i32 4
  %Case = bitcast %union.anon* %value405 to %struct.case_com**
  %231 = load %struct.case_com*, %struct.case_com** %Case, align 4
  %flags406 = getelementptr inbounds %struct.case_com, %struct.case_com* %231, i32 0, i32 0
  %232 = load i32, i32* %flags406, align 4
  %or407 = or i32 %232, 8
  store i32 %or407, i32* %flags406, align 4
  br label %if.end408

if.end408:                                        ; preds = %if.then404, %sw.bb402
  %233 = load %struct.command*, %struct.command** %command.addr, align 4
  %value409 = getelementptr inbounds %struct.command, %struct.command* %233, i32 0, i32 4
  %Case410 = bitcast %union.anon* %value409 to %struct.case_com**
  %234 = load %struct.case_com*, %struct.case_com** %Case410, align 4
  %call411 = call i32 @execute_case_command(%struct.case_com* %234)
  store i32 %call411, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb412:                                         ; preds = %do.end263
  %235 = load i32, i32* %ignore_return, align 4
  %tobool413 = icmp ne i32 %235, 0
  br i1 %tobool413, label %if.then414, label %if.end418

if.then414:                                       ; preds = %sw.bb412
  %236 = load %struct.command*, %struct.command** %command.addr, align 4
  %value415 = getelementptr inbounds %struct.command, %struct.command* %236, i32 0, i32 4
  %While = bitcast %union.anon* %value415 to %struct.while_com**
  %237 = load %struct.while_com*, %struct.while_com** %While, align 4
  %flags416 = getelementptr inbounds %struct.while_com, %struct.while_com* %237, i32 0, i32 0
  %238 = load i32, i32* %flags416, align 4
  %or417 = or i32 %238, 8
  store i32 %or417, i32* %flags416, align 4
  br label %if.end418

if.end418:                                        ; preds = %if.then414, %sw.bb412
  %239 = load %struct.command*, %struct.command** %command.addr, align 4
  %value419 = getelementptr inbounds %struct.command, %struct.command* %239, i32 0, i32 4
  %While420 = bitcast %union.anon* %value419 to %struct.while_com**
  %240 = load %struct.while_com*, %struct.while_com** %While420, align 4
  %call421 = call i32 @execute_while_command(%struct.while_com* %240)
  store i32 %call421, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb422:                                         ; preds = %do.end263
  %241 = load i32, i32* %ignore_return, align 4
  %tobool423 = icmp ne i32 %241, 0
  br i1 %tobool423, label %if.then424, label %if.end429

if.then424:                                       ; preds = %sw.bb422
  %242 = load %struct.command*, %struct.command** %command.addr, align 4
  %value425 = getelementptr inbounds %struct.command, %struct.command* %242, i32 0, i32 4
  %While426 = bitcast %union.anon* %value425 to %struct.while_com**
  %243 = load %struct.while_com*, %struct.while_com** %While426, align 4
  %flags427 = getelementptr inbounds %struct.while_com, %struct.while_com* %243, i32 0, i32 0
  %244 = load i32, i32* %flags427, align 4
  %or428 = or i32 %244, 8
  store i32 %or428, i32* %flags427, align 4
  br label %if.end429

if.end429:                                        ; preds = %if.then424, %sw.bb422
  %245 = load %struct.command*, %struct.command** %command.addr, align 4
  %value430 = getelementptr inbounds %struct.command, %struct.command* %245, i32 0, i32 4
  %While431 = bitcast %union.anon* %value430 to %struct.while_com**
  %246 = load %struct.while_com*, %struct.while_com** %While431, align 4
  %call432 = call i32 @execute_until_command(%struct.while_com* %246)
  store i32 %call432, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb433:                                         ; preds = %do.end263
  %247 = load i32, i32* %ignore_return, align 4
  %tobool434 = icmp ne i32 %247, 0
  br i1 %tobool434, label %if.then435, label %if.end439

if.then435:                                       ; preds = %sw.bb433
  %248 = load %struct.command*, %struct.command** %command.addr, align 4
  %value436 = getelementptr inbounds %struct.command, %struct.command* %248, i32 0, i32 4
  %If = bitcast %union.anon* %value436 to %struct.if_com**
  %249 = load %struct.if_com*, %struct.if_com** %If, align 4
  %flags437 = getelementptr inbounds %struct.if_com, %struct.if_com* %249, i32 0, i32 0
  %250 = load i32, i32* %flags437, align 4
  %or438 = or i32 %250, 8
  store i32 %or438, i32* %flags437, align 4
  br label %if.end439

if.end439:                                        ; preds = %if.then435, %sw.bb433
  %251 = load %struct.command*, %struct.command** %command.addr, align 4
  %value440 = getelementptr inbounds %struct.command, %struct.command* %251, i32 0, i32 4
  %If441 = bitcast %union.anon* %value440 to %struct.if_com**
  %252 = load %struct.if_com*, %struct.if_com** %If441, align 4
  %call442 = call i32 @execute_if_command(%struct.if_com* %252)
  store i32 %call442, i32* %exec_result, align 4
  br label %sw.epilog

sw.bb443:                                         ; preds = %do.end263
  %253 = load i32, i32* %asynchronous.addr, align 4
  %tobool444 = icmp ne i32 %253, 0
  br i1 %tobool444, label %if.then445, label %if.else449

if.then445:                                       ; preds = %sw.bb443
  %254 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags446 = getelementptr inbounds %struct.command, %struct.command* %254, i32 0, i32 1
  %255 = load i32, i32* %flags446, align 4
  %or447 = or i32 %255, 2
  store i32 %or447, i32* %flags446, align 4
  %256 = load %struct.command*, %struct.command** %command.addr, align 4
  %257 = load i32, i32* %pipe_in.addr, align 4
  %258 = load i32, i32* %pipe_out.addr, align 4
  %259 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call448 = call i32 @execute_command_internal(%struct.command* %256, i32 1, i32 %257, i32 %258, %struct.fd_bitmap* %259)
  store i32 %call448, i32* %exec_result, align 4
  br label %if.end466

if.else449:                                       ; preds = %sw.bb443
  %260 = load i32, i32* %ignore_return, align 4
  %tobool450 = icmp ne i32 %260, 0
  br i1 %tobool450, label %land.lhs.true451, label %if.end461

land.lhs.true451:                                 ; preds = %if.else449
  %261 = load %struct.command*, %struct.command** %command.addr, align 4
  %value452 = getelementptr inbounds %struct.command, %struct.command* %261, i32 0, i32 4
  %Group = bitcast %union.anon* %value452 to %struct.group_com**
  %262 = load %struct.group_com*, %struct.group_com** %Group, align 4
  %command453 = getelementptr inbounds %struct.group_com, %struct.group_com* %262, i32 0, i32 1
  %263 = load %struct.command*, %struct.command** %command453, align 4
  %tobool454 = icmp ne %struct.command* %263, null
  br i1 %tobool454, label %if.then455, label %if.end461

if.then455:                                       ; preds = %land.lhs.true451
  %264 = load %struct.command*, %struct.command** %command.addr, align 4
  %value456 = getelementptr inbounds %struct.command, %struct.command* %264, i32 0, i32 4
  %Group457 = bitcast %union.anon* %value456 to %struct.group_com**
  %265 = load %struct.group_com*, %struct.group_com** %Group457, align 4
  %command458 = getelementptr inbounds %struct.group_com, %struct.group_com* %265, i32 0, i32 1
  %266 = load %struct.command*, %struct.command** %command458, align 4
  %flags459 = getelementptr inbounds %struct.command, %struct.command* %266, i32 0, i32 1
  %267 = load i32, i32* %flags459, align 4
  %or460 = or i32 %267, 8
  store i32 %or460, i32* %flags459, align 4
  br label %if.end461

if.end461:                                        ; preds = %if.then455, %land.lhs.true451, %if.else449
  %268 = load %struct.command*, %struct.command** %command.addr, align 4
  %value462 = getelementptr inbounds %struct.command, %struct.command* %268, i32 0, i32 4
  %Group463 = bitcast %union.anon* %value462 to %struct.group_com**
  %269 = load %struct.group_com*, %struct.group_com** %Group463, align 4
  %command464 = getelementptr inbounds %struct.group_com, %struct.group_com* %269, i32 0, i32 1
  %270 = load %struct.command*, %struct.command** %command464, align 4
  %271 = load i32, i32* %asynchronous.addr, align 4
  %272 = load i32, i32* %pipe_in.addr, align 4
  %273 = load i32, i32* %pipe_out.addr, align 4
  %274 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call465 = call i32 @execute_command_internal(%struct.command* %270, i32 %271, i32 %272, i32 %273, %struct.fd_bitmap* %274)
  store i32 %call465, i32* %exec_result, align 4
  br label %if.end466

if.end466:                                        ; preds = %if.end461, %if.then445
  br label %sw.epilog

sw.bb467:                                         ; preds = %do.end263
  %275 = load %struct.command*, %struct.command** %command.addr, align 4
  %276 = load i32, i32* %asynchronous.addr, align 4
  %277 = load i32, i32* %pipe_in.addr, align 4
  %278 = load i32, i32* %pipe_out.addr, align 4
  %279 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call468 = call i32 @execute_connection(%struct.command* %275, i32 %276, i32 %277, i32 %278, %struct.fd_bitmap* %279)
  store i32 %call468, i32* %exec_result, align 4
  %280 = load i32, i32* %asynchronous.addr, align 4
  %tobool469 = icmp ne i32 %280, 0
  br i1 %tobool469, label %if.then470, label %if.end471

if.then470:                                       ; preds = %sw.bb467
  store i32 0, i32* %invert, align 4
  br label %if.end471

if.end471:                                        ; preds = %if.then470, %sw.bb467
  br label %sw.epilog

sw.bb472:                                         ; preds = %do.end263
  %call473 = call i32 @signal_is_trapped(i32 66)
  %tobool474 = icmp ne i32 %call473, 0
  br i1 %tobool474, label %land.rhs475, label %land.end479

land.rhs475:                                      ; preds = %sw.bb472
  %call476 = call i32 @signal_is_ignored(i32 66)
  %cmp477 = icmp eq i32 %call476, 0
  br label %land.end479

land.end479:                                      ; preds = %land.rhs475, %sw.bb472
  %281 = phi i1 [ false, %sw.bb472 ], [ %cmp477, %land.rhs475 ]
  %land.ext480 = zext i1 %281 to i32
  store i32 %land.ext480, i32* %was_error_trap, align 4
  %282 = load i32, i32* %ignore_return, align 4
  %tobool481 = icmp ne i32 %282, 0
  br i1 %tobool481, label %if.then482, label %if.end486

if.then482:                                       ; preds = %land.end479
  %283 = load %struct.command*, %struct.command** %command.addr, align 4
  %value483 = getelementptr inbounds %struct.command, %struct.command* %283, i32 0, i32 4
  %Arith = bitcast %union.anon* %value483 to %struct.arith_com**
  %284 = load %struct.arith_com*, %struct.arith_com** %Arith, align 4
  %flags484 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %284, i32 0, i32 0
  %285 = load i32, i32* %flags484, align 4
  %or485 = or i32 %285, 8
  store i32 %or485, i32* %flags484, align 4
  br label %if.end486

if.end486:                                        ; preds = %if.then482, %land.end479
  %286 = load i32, i32* @line_number, align 4
  store volatile i32 %286, i32* %save_line_number, align 4
  store i32 %286, i32* @line_number_for_err_trap, align 4
  %287 = load %struct.command*, %struct.command** %command.addr, align 4
  %value487 = getelementptr inbounds %struct.command, %struct.command* %287, i32 0, i32 4
  %Arith488 = bitcast %union.anon* %value487 to %struct.arith_com**
  %288 = load %struct.arith_com*, %struct.arith_com** %Arith488, align 4
  %call489 = call i32 @execute_arith_command(%struct.arith_com* %288)
  store i32 %call489, i32* %exec_result, align 4
  %289 = load volatile i32, i32* %save_line_number, align 4
  store i32 %289, i32* @line_number, align 4
  %290 = load i32, i32* %was_error_trap, align 4
  %tobool490 = icmp ne i32 %290, 0
  br i1 %tobool490, label %land.lhs.true491, label %if.end501

land.lhs.true491:                                 ; preds = %if.end486
  %291 = load i32, i32* %ignore_return, align 4
  %cmp492 = icmp eq i32 %291, 0
  br i1 %cmp492, label %land.lhs.true494, label %if.end501

land.lhs.true494:                                 ; preds = %land.lhs.true491
  %292 = load i32, i32* %invert, align 4
  %cmp495 = icmp eq i32 %292, 0
  br i1 %cmp495, label %land.lhs.true497, label %if.end501

land.lhs.true497:                                 ; preds = %land.lhs.true494
  %293 = load i32, i32* %exec_result, align 4
  %cmp498 = icmp ne i32 %293, 0
  br i1 %cmp498, label %if.then500, label %if.end501

if.then500:                                       ; preds = %land.lhs.true497
  %294 = load i32, i32* %exec_result, align 4
  store volatile i32 %294, i32* @last_command_exit_value, align 4
  %295 = load i32, i32* @line_number, align 4
  store volatile i32 %295, i32* %save_line_number, align 4
  %296 = load i32, i32* @line_number_for_err_trap, align 4
  store i32 %296, i32* @line_number, align 4
  call void @run_error_trap()
  %297 = load volatile i32, i32* %save_line_number, align 4
  store i32 %297, i32* @line_number, align 4
  br label %if.end501

if.end501:                                        ; preds = %if.then500, %land.lhs.true497, %land.lhs.true494, %land.lhs.true491, %if.end486
  %298 = load i32, i32* %ignore_return, align 4
  %cmp502 = icmp eq i32 %298, 0
  br i1 %cmp502, label %land.lhs.true504, label %if.end513

land.lhs.true504:                                 ; preds = %if.end501
  %299 = load i32, i32* %invert, align 4
  %cmp505 = icmp eq i32 %299, 0
  br i1 %cmp505, label %land.lhs.true507, label %if.end513

land.lhs.true507:                                 ; preds = %land.lhs.true504
  %300 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool508 = icmp ne i32 %300, 0
  br i1 %tobool508, label %land.lhs.true509, label %if.end513

land.lhs.true509:                                 ; preds = %land.lhs.true507
  %301 = load i32, i32* %exec_result, align 4
  %cmp510 = icmp ne i32 %301, 0
  br i1 %cmp510, label %if.then512, label %if.end513

if.then512:                                       ; preds = %land.lhs.true509
  %302 = load i32, i32* %exec_result, align 4
  store volatile i32 %302, i32* @last_command_exit_value, align 4
  call void @run_pending_traps()
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end513:                                        ; preds = %land.lhs.true509, %land.lhs.true507, %land.lhs.true504, %if.end501
  br label %sw.epilog

sw.bb514:                                         ; preds = %do.end263
  %call515 = call i32 @signal_is_trapped(i32 66)
  %tobool516 = icmp ne i32 %call515, 0
  br i1 %tobool516, label %land.rhs517, label %land.end521

land.rhs517:                                      ; preds = %sw.bb514
  %call518 = call i32 @signal_is_ignored(i32 66)
  %cmp519 = icmp eq i32 %call518, 0
  br label %land.end521

land.end521:                                      ; preds = %land.rhs517, %sw.bb514
  %303 = phi i1 [ false, %sw.bb514 ], [ %cmp519, %land.rhs517 ]
  %land.ext522 = zext i1 %303 to i32
  store i32 %land.ext522, i32* %was_error_trap, align 4
  %304 = load i32, i32* %ignore_return, align 4
  %tobool523 = icmp ne i32 %304, 0
  br i1 %tobool523, label %if.then524, label %if.end528

if.then524:                                       ; preds = %land.end521
  %305 = load %struct.command*, %struct.command** %command.addr, align 4
  %value525 = getelementptr inbounds %struct.command, %struct.command* %305, i32 0, i32 4
  %Cond = bitcast %union.anon* %value525 to %struct.cond_com**
  %306 = load %struct.cond_com*, %struct.cond_com** %Cond, align 4
  %flags526 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %306, i32 0, i32 0
  %307 = load i32, i32* %flags526, align 4
  %or527 = or i32 %307, 8
  store i32 %or527, i32* %flags526, align 4
  br label %if.end528

if.end528:                                        ; preds = %if.then524, %land.end521
  %308 = load i32, i32* @line_number, align 4
  store volatile i32 %308, i32* %save_line_number, align 4
  store i32 %308, i32* @line_number_for_err_trap, align 4
  %309 = load %struct.command*, %struct.command** %command.addr, align 4
  %value529 = getelementptr inbounds %struct.command, %struct.command* %309, i32 0, i32 4
  %Cond530 = bitcast %union.anon* %value529 to %struct.cond_com**
  %310 = load %struct.cond_com*, %struct.cond_com** %Cond530, align 4
  %call531 = call i32 @execute_cond_command(%struct.cond_com* %310)
  store i32 %call531, i32* %exec_result, align 4
  %311 = load volatile i32, i32* %save_line_number, align 4
  store i32 %311, i32* @line_number, align 4
  %312 = load i32, i32* %was_error_trap, align 4
  %tobool532 = icmp ne i32 %312, 0
  br i1 %tobool532, label %land.lhs.true533, label %if.end543

land.lhs.true533:                                 ; preds = %if.end528
  %313 = load i32, i32* %ignore_return, align 4
  %cmp534 = icmp eq i32 %313, 0
  br i1 %cmp534, label %land.lhs.true536, label %if.end543

land.lhs.true536:                                 ; preds = %land.lhs.true533
  %314 = load i32, i32* %invert, align 4
  %cmp537 = icmp eq i32 %314, 0
  br i1 %cmp537, label %land.lhs.true539, label %if.end543

land.lhs.true539:                                 ; preds = %land.lhs.true536
  %315 = load i32, i32* %exec_result, align 4
  %cmp540 = icmp ne i32 %315, 0
  br i1 %cmp540, label %if.then542, label %if.end543

if.then542:                                       ; preds = %land.lhs.true539
  %316 = load i32, i32* %exec_result, align 4
  store volatile i32 %316, i32* @last_command_exit_value, align 4
  %317 = load i32, i32* @line_number, align 4
  store volatile i32 %317, i32* %save_line_number, align 4
  %318 = load i32, i32* @line_number_for_err_trap, align 4
  store i32 %318, i32* @line_number, align 4
  call void @run_error_trap()
  %319 = load volatile i32, i32* %save_line_number, align 4
  store i32 %319, i32* @line_number, align 4
  br label %if.end543

if.end543:                                        ; preds = %if.then542, %land.lhs.true539, %land.lhs.true536, %land.lhs.true533, %if.end528
  %320 = load i32, i32* %ignore_return, align 4
  %cmp544 = icmp eq i32 %320, 0
  br i1 %cmp544, label %land.lhs.true546, label %if.end555

land.lhs.true546:                                 ; preds = %if.end543
  %321 = load i32, i32* %invert, align 4
  %cmp547 = icmp eq i32 %321, 0
  br i1 %cmp547, label %land.lhs.true549, label %if.end555

land.lhs.true549:                                 ; preds = %land.lhs.true546
  %322 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool550 = icmp ne i32 %322, 0
  br i1 %tobool550, label %land.lhs.true551, label %if.end555

land.lhs.true551:                                 ; preds = %land.lhs.true549
  %323 = load i32, i32* %exec_result, align 4
  %cmp552 = icmp ne i32 %323, 0
  br i1 %cmp552, label %if.then554, label %if.end555

if.then554:                                       ; preds = %land.lhs.true551
  %324 = load i32, i32* %exec_result, align 4
  store volatile i32 %324, i32* @last_command_exit_value, align 4
  call void @run_pending_traps()
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end555:                                        ; preds = %land.lhs.true551, %land.lhs.true549, %land.lhs.true546, %if.end543
  br label %sw.epilog

sw.bb556:                                         ; preds = %do.end263
  %325 = load %struct.command*, %struct.command** %command.addr, align 4
  %value557 = getelementptr inbounds %struct.command, %struct.command* %325, i32 0, i32 4
  %Function_def = bitcast %union.anon* %value557 to %struct.function_def**
  %326 = load %struct.function_def*, %struct.function_def** %Function_def, align 4
  %name = getelementptr inbounds %struct.function_def, %struct.function_def* %326, i32 0, i32 2
  %327 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %328 = load %struct.command*, %struct.command** %command.addr, align 4
  %value558 = getelementptr inbounds %struct.command, %struct.command* %328, i32 0, i32 4
  %Function_def559 = bitcast %union.anon* %value558 to %struct.function_def**
  %329 = load %struct.function_def*, %struct.function_def** %Function_def559, align 4
  %call560 = call i32 @execute_intern_function(%struct.word_desc* %327, %struct.function_def* %329)
  store i32 %call560, i32* %exec_result, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %do.end263
  %330 = load %struct.command*, %struct.command** %command.addr, align 4
  %type561 = getelementptr inbounds %struct.command, %struct.command* %330, i32 0, i32 0
  %331 = load i32, i32* %type561, align 4
  call void @command_error(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i32 0, i32 0), i32 1, i32 %331, i32 0)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb556, %if.end555, %if.end513, %if.end471, %if.end466, %if.end439, %if.end429, %if.end418, %if.end408, %if.end398, %if.end388, %if.end378, %if.end371
  %332 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  %tobool562 = icmp ne %struct.redirect* %332, null
  br i1 %tobool562, label %if.then563, label %if.end565

if.then563:                                       ; preds = %sw.epilog
  %333 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  %call564 = call i32 @do_redirections(%struct.redirect* %333, i32 1)
  %334 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %334)
  br label %if.end565

if.end565:                                        ; preds = %if.then563, %sw.epilog
  %335 = load %struct.redirect*, %struct.redirect** %exec_undo_list, align 4
  %tobool566 = icmp ne %struct.redirect* %335, null
  br i1 %tobool566, label %if.then567, label %if.end568

if.then567:                                       ; preds = %if.end565
  %336 = load %struct.redirect*, %struct.redirect** %exec_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %336)
  br label %if.end568

if.end568:                                        ; preds = %if.then567, %if.end565
  %337 = load %struct.redirect*, %struct.redirect** %my_undo_list, align 4
  %tobool569 = icmp ne %struct.redirect* %337, null
  br i1 %tobool569, label %if.then572, label %lor.lhs.false570

lor.lhs.false570:                                 ; preds = %if.end568
  %338 = load %struct.redirect*, %struct.redirect** %exec_undo_list, align 4
  %tobool571 = icmp ne %struct.redirect* %338, null
  br i1 %tobool571, label %if.then572, label %if.end573

if.then572:                                       ; preds = %lor.lhs.false570, %if.end568
  call void @discard_unwind_frame(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0))
  br label %if.end573

if.end573:                                        ; preds = %if.then572, %lor.lhs.false570
  %339 = load volatile i32, i32* %saved_fifo, align 4
  %tobool574 = icmp ne i32 %339, 0
  br i1 %tobool574, label %if.then575, label %if.end581

if.then575:                                       ; preds = %if.end573
  %call576 = call i32 @num_fifos()
  store volatile i32 %call576, i32* %nfifo, align 4
  %340 = load volatile i32, i32* %nfifo, align 4
  %341 = load volatile i32, i32* %ofifo, align 4
  %cmp577 = icmp sgt i32 %340, %341
  br i1 %cmp577, label %if.then579, label %if.end580

if.then579:                                       ; preds = %if.then575
  %342 = load i8*, i8** %ofifo_list, align 4
  %343 = load volatile i32, i32* %osize, align 4
  call void @close_new_fifos(i8* %342, i32 %343)
  br label %if.end580

if.end580:                                        ; preds = %if.then579, %if.then575
  %344 = load i8*, i8** %ofifo_list, align 4
  call void @sh_xfree(i8* %344, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1067)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0))
  br label %if.end581

if.end581:                                        ; preds = %if.end580, %if.end573
  %345 = load i32, i32* %invert, align 4
  %tobool582 = icmp ne i32 %345, 0
  br i1 %tobool582, label %if.then583, label %if.end587

if.then583:                                       ; preds = %if.end581
  %346 = load i32, i32* %exec_result, align 4
  %cmp584 = icmp eq i32 %346, 0
  %cond586 = select i1 %cmp584, i32 1, i32 0
  store i32 %cond586, i32* %exec_result, align 4
  br label %if.end587

if.end587:                                        ; preds = %if.then583, %if.end581
  %347 = load %struct.command*, %struct.command** %command.addr, align 4
  %type588 = getelementptr inbounds %struct.command, %struct.command* %347, i32 0, i32 0
  %348 = load i32, i32* %type588, align 4
  switch i32 %348, label %sw.epilog590 [
    i32 10, label %sw.bb589
    i32 11, label %sw.bb589
  ]

sw.bb589:                                         ; preds = %if.end587, %if.end587
  %349 = load i32, i32* %exec_result, align 4
  call void @set_pipestatus_from_exit(i32 %349)
  br label %sw.epilog590

sw.epilog590:                                     ; preds = %if.end587, %sw.bb589
  %350 = load i32, i32* %exec_result, align 4
  store volatile i32 %350, i32* @last_command_exit_value, align 4
  call void @run_pending_traps()
  store %struct.command* null, %struct.command** @currently_executing_command, align 4
  %351 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %351, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog590, %if.end229, %if.end204, %do.end191, %if.end185, %if.then130, %if.then29, %if.then24, %if.then4, %if.then
  %352 = load i32, i32* %retval, align 4
  ret i32 %352
}

declare void @discard_unwind_frame(i8*) #1

declare void @unlink_fifo_list() #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

; Function Attrs: noinline nounwind
define void @dispose_exec_redirects() #0 {
entry:
  %0 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  %tobool = icmp ne %struct.redirect* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %1)
  store %struct.redirect* null, %struct.redirect** @exec_redirection_undo_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @dispose_redirects(%struct.redirect*) #1

declare void @run_pending_traps() #1

; Function Attrs: noinline nounwind
define internal i32 @execute_in_subshell(%struct.command* %command, i32 %asynchronous, i32 %pipe_in, i32 %pipe_out, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %asynchronous.addr = alloca i32, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %user_subshell = alloca i32, align 4
  %return_code = alloca i32, align 4
  %function_value = alloca i32, align 4
  %should_redir_stdin = alloca i32, align 4
  %invert = alloca i32, align 4
  %ois = alloca i32, align 4
  %user_coproc = alloca i32, align 4
  %result = alloca i32, align 4
  %tcom = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %asynchronous, i32* %asynchronous.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %0 = load i32, i32* @subshell_level, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @subshell_level, align 4
  %1 = load i32, i32* %asynchronous.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 1
  %3 = load i32, i32* %flags, align 4
  %and = and i32 %3, 1024
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %land.lhs.true2, label %land.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* %pipe_in.addr, align 4
  %cmp = icmp eq i32 %4, -1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true2
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 3
  %6 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %call = call i32 @stdin_redirects(%struct.redirect* %6)
  %cmp3 = icmp eq i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true2, %land.lhs.true, %entry
  %7 = phi i1 [ false, %land.lhs.true2 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  store i32 %land.ext, i32* %should_redir_stdin, align 4
  %8 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags4 = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 1
  %9 = load i32, i32* %flags4, align 4
  %and5 = and i32 %9, 4
  %cmp6 = icmp ne i32 %and5, 0
  %conv = zext i1 %cmp6 to i32
  store i32 %conv, i32* %invert, align 4
  %10 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 0
  %11 = load i32, i32* %type, align 4
  %cmp7 = icmp eq i32 %11, 13
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %12 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags9 = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 1
  %13 = load i32, i32* %flags9, align 4
  %and10 = and i32 %13, 1
  %cmp11 = icmp ne i32 %and10, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.end
  %14 = phi i1 [ true, %land.end ], [ %cmp11, %lor.rhs ]
  %lor.ext = zext i1 %14 to i32
  store i32 %lor.ext, i32* %user_subshell, align 4
  %15 = load %struct.command*, %struct.command** %command.addr, align 4
  %type13 = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 0
  %16 = load i32, i32* %type13, align 4
  %cmp14 = icmp eq i32 %16, 14
  %conv15 = zext i1 %cmp14 to i32
  store i32 %conv15, i32* %user_coproc, align 4
  %17 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags16 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 1
  %18 = load i32, i32* %flags16, align 4
  %and17 = and i32 %18, -8
  store i32 %and17, i32* %flags16, align 4
  %19 = load i32, i32* %asynchronous.addr, align 4
  %tobool18 = icmp ne i32 %19, 0
  br i1 %tobool18, label %if.then, label %if.end22

if.then:                                          ; preds = %lor.end
  %20 = load i32, i32* @interactive_shell, align 4
  store i32 %20, i32* %ois, align 4
  store i32 0, i32* @interactive_shell, align 4
  %21 = load i32, i32* %ois, align 4
  %22 = load i32, i32* @interactive_shell, align 4
  %cmp19 = icmp ne i32 %21, %22
  br i1 %cmp19, label %if.then21, label %if.end

if.then21:                                        ; preds = %if.then
  store i32 0, i32* @expand_aliases, align 4
  br label %if.end

if.end:                                           ; preds = %if.then21, %if.then
  br label %if.end22

if.end22:                                         ; preds = %if.end, %lor.end
  store i32 0, i32* @interactive, align 4
  store i32 0, i32* @login_shell, align 4
  %23 = load i32, i32* %user_subshell, align 4
  %tobool23 = icmp ne i32 %23, 0
  br i1 %tobool23, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.end22
  store i32 2, i32* @subshell_environment, align 4
  br label %if.end39

if.else:                                          ; preds = %if.end22
  store i32 0, i32* @subshell_environment, align 4
  %24 = load i32, i32* %asynchronous.addr, align 4
  %tobool25 = icmp ne i32 %24, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.else
  %25 = load i32, i32* @subshell_environment, align 4
  %or = or i32 %25, 1
  store i32 %or, i32* @subshell_environment, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.else
  %26 = load i32, i32* %pipe_in.addr, align 4
  %cmp28 = icmp ne i32 %26, -1
  br i1 %cmp28, label %if.then32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end27
  %27 = load i32, i32* %pipe_out.addr, align 4
  %cmp30 = icmp ne i32 %27, -1
  br i1 %cmp30, label %if.then32, label %if.end34

if.then32:                                        ; preds = %lor.lhs.false, %if.end27
  %28 = load i32, i32* @subshell_environment, align 4
  %or33 = or i32 %28, 16
  store i32 %or33, i32* @subshell_environment, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %lor.lhs.false
  %29 = load i32, i32* %user_coproc, align 4
  %tobool35 = icmp ne i32 %29, 0
  br i1 %tobool35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %if.end34
  %30 = load i32, i32* @subshell_environment, align 4
  %or37 = or i32 %30, 64
  store i32 %or37, i32* @subshell_environment, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %if.end34
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.then24
  call void @reset_terminating_signals()
  call void @reset_signal_handlers()
  %31 = load i32, i32* @subshell_environment, align 4
  %or40 = or i32 %31, 128
  store i32 %or40, i32* @subshell_environment, align 4
  %32 = load i32, i32* %asynchronous.addr, align 4
  %tobool41 = icmp ne i32 %32, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end39
  call void @setup_async_signals()
  store i32 0, i32* %asynchronous.addr, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %if.end39
  %call44 = call void (i32)* @set_sigint_handler()
  %33 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %tobool45 = icmp ne %struct.fd_bitmap* %33, null
  br i1 %tobool45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end43
  %34 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  call void @close_fd_bitmap(%struct.fd_bitmap* %34)
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %if.end43
  %35 = load i32, i32* %pipe_in.addr, align 4
  %36 = load i32, i32* %pipe_out.addr, align 4
  call void @do_piping(i32 %35, i32 %36)
  call void @coproc_closeall()
  %37 = load i32, i32* %user_subshell, align 4
  %tobool48 = icmp ne i32 %37, 0
  br i1 %tobool48, label %if.then49, label %if.else58

if.then49:                                        ; preds = %if.end47
  %38 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects50 = getelementptr inbounds %struct.command, %struct.command* %38, i32 0, i32 3
  %39 = load %struct.redirect*, %struct.redirect** %redirects50, align 4
  %call51 = call i32 @stdin_redirects(%struct.redirect* %39)
  %tobool52 = icmp ne i32 %call51, 0
  br i1 %tobool52, label %lor.end56, label %lor.rhs53

lor.rhs53:                                        ; preds = %if.then49
  %40 = load i32, i32* %pipe_in.addr, align 4
  %cmp54 = icmp ne i32 %40, -1
  br label %lor.end56

lor.end56:                                        ; preds = %lor.rhs53, %if.then49
  %41 = phi i1 [ true, %if.then49 ], [ %cmp54, %lor.rhs53 ]
  %lor.ext57 = zext i1 %41 to i32
  store i32 %lor.ext57, i32* @stdin_redir, align 4
  br label %if.end67

if.else58:                                        ; preds = %if.end47
  %42 = load %struct.command*, %struct.command** %command.addr, align 4
  %type59 = getelementptr inbounds %struct.command, %struct.command* %42, i32 0, i32 0
  %43 = load i32, i32* %type59, align 4
  %call60 = call i32 @shell_control_structure(i32 %43)
  %tobool61 = icmp ne i32 %call60, 0
  br i1 %tobool61, label %land.lhs.true62, label %if.end66

land.lhs.true62:                                  ; preds = %if.else58
  %44 = load i32, i32* %pipe_in.addr, align 4
  %cmp63 = icmp ne i32 %44, -1
  br i1 %cmp63, label %if.then65, label %if.end66

if.then65:                                        ; preds = %land.lhs.true62
  store i32 1, i32* @stdin_redir, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %land.lhs.true62, %if.else58
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %lor.end56
  %45 = load i32, i32* %should_redir_stdin, align 4
  %tobool68 = icmp ne i32 %45, 0
  br i1 %tobool68, label %land.lhs.true69, label %if.end73

land.lhs.true69:                                  ; preds = %if.end67
  %46 = load i32, i32* @stdin_redir, align 4
  %cmp70 = icmp eq i32 %46, 0
  br i1 %cmp70, label %if.then72, label %if.end73

if.then72:                                        ; preds = %land.lhs.true69
  call void @async_redirect_stdin()
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %land.lhs.true69, %if.end67
  %47 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects74 = getelementptr inbounds %struct.command, %struct.command* %47, i32 0, i32 3
  %48 = load %struct.redirect*, %struct.redirect** %redirects74, align 4
  %tobool75 = icmp ne %struct.redirect* %48, null
  br i1 %tobool75, label %if.then76, label %if.end86

if.then76:                                        ; preds = %if.end73
  %49 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects77 = getelementptr inbounds %struct.command, %struct.command* %49, i32 0, i32 3
  %50 = load %struct.redirect*, %struct.redirect** %redirects77, align 4
  %call78 = call i32 @do_redirections(%struct.redirect* %50, i32 1)
  %cmp79 = icmp ne i32 %call78, 0
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.then76
  %51 = load i32, i32* %invert, align 4
  %tobool82 = icmp ne i32 %51, 0
  %cond = select i1 %tobool82, i32 0, i32 1
  call void @exit(i32 %cond) #5
  unreachable

if.end83:                                         ; preds = %if.then76
  %52 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects84 = getelementptr inbounds %struct.command, %struct.command* %52, i32 0, i32 3
  %53 = load %struct.redirect*, %struct.redirect** %redirects84, align 4
  call void @dispose_redirects(%struct.redirect* %53)
  %54 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects85 = getelementptr inbounds %struct.command, %struct.command* %54, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects85, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.end83, %if.end73
  %55 = load %struct.command*, %struct.command** %command.addr, align 4
  %type87 = getelementptr inbounds %struct.command, %struct.command* %55, i32 0, i32 0
  %56 = load i32, i32* %type87, align 4
  %cmp88 = icmp eq i32 %56, 13
  br i1 %cmp88, label %if.then90, label %if.else92

if.then90:                                        ; preds = %if.end86
  %57 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %57, i32 0, i32 4
  %Subshell = bitcast %union.anon* %value to %struct.subshell_com**
  %58 = load %struct.subshell_com*, %struct.subshell_com** %Subshell, align 4
  %command91 = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %58, i32 0, i32 1
  %59 = load %struct.command*, %struct.command** %command91, align 4
  store %struct.command* %59, %struct.command** %tcom, align 4
  br label %if.end99

if.else92:                                        ; preds = %if.end86
  %60 = load i32, i32* %user_coproc, align 4
  %tobool93 = icmp ne i32 %60, 0
  br i1 %tobool93, label %if.then94, label %if.else97

if.then94:                                        ; preds = %if.else92
  %61 = load %struct.command*, %struct.command** %command.addr, align 4
  %value95 = getelementptr inbounds %struct.command, %struct.command* %61, i32 0, i32 4
  %Coproc = bitcast %union.anon* %value95 to %struct.coproc_com**
  %62 = load %struct.coproc_com*, %struct.coproc_com** %Coproc, align 4
  %command96 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %62, i32 0, i32 2
  %63 = load %struct.command*, %struct.command** %command96, align 4
  store %struct.command* %63, %struct.command** %tcom, align 4
  br label %if.end98

if.else97:                                        ; preds = %if.else92
  %64 = load %struct.command*, %struct.command** %command.addr, align 4
  store %struct.command* %64, %struct.command** %tcom, align 4
  br label %if.end98

if.end98:                                         ; preds = %if.else97, %if.then94
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.then90
  %65 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags100 = getelementptr inbounds %struct.command, %struct.command* %65, i32 0, i32 1
  %66 = load i32, i32* %flags100, align 4
  %and101 = and i32 %66, 128
  %tobool102 = icmp ne i32 %and101, 0
  br i1 %tobool102, label %if.then103, label %if.end106

if.then103:                                       ; preds = %if.end99
  %67 = load %struct.command*, %struct.command** %tcom, align 4
  %flags104 = getelementptr inbounds %struct.command, %struct.command* %67, i32 0, i32 1
  %68 = load volatile i32, i32* %flags104, align 4
  %or105 = or i32 %68, 128
  store volatile i32 %or105, i32* %flags104, align 4
  br label %if.end106

if.end106:                                        ; preds = %if.then103, %if.end99
  %69 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags107 = getelementptr inbounds %struct.command, %struct.command* %69, i32 0, i32 1
  %70 = load i32, i32* %flags107, align 4
  %and108 = and i32 %70, 256
  %tobool109 = icmp ne i32 %and108, 0
  br i1 %tobool109, label %if.then110, label %if.end113

if.then110:                                       ; preds = %if.end106
  %71 = load %struct.command*, %struct.command** %tcom, align 4
  %flags111 = getelementptr inbounds %struct.command, %struct.command* %71, i32 0, i32 1
  %72 = load volatile i32, i32* %flags111, align 4
  %or112 = or i32 %72, 256
  store volatile i32 %or112, i32* %flags111, align 4
  br label %if.end113

if.end113:                                        ; preds = %if.then110, %if.end106
  %73 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags114 = getelementptr inbounds %struct.command, %struct.command* %73, i32 0, i32 1
  %74 = load i32, i32* %flags114, align 4
  %and115 = and i32 %74, 8
  %tobool116 = icmp ne i32 %and115, 0
  br i1 %tobool116, label %land.lhs.true117, label %if.end123

land.lhs.true117:                                 ; preds = %if.end113
  %75 = load %struct.command*, %struct.command** %tcom, align 4
  %76 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp118 = icmp ne %struct.command* %75, %76
  br i1 %cmp118, label %if.then120, label %if.end123

if.then120:                                       ; preds = %land.lhs.true117
  %77 = load %struct.command*, %struct.command** %tcom, align 4
  %flags121 = getelementptr inbounds %struct.command, %struct.command* %77, i32 0, i32 1
  %78 = load volatile i32, i32* %flags121, align 4
  %or122 = or i32 %78, 8
  store volatile i32 %or122, i32* %flags121, align 4
  br label %if.end123

if.end123:                                        ; preds = %if.then120, %land.lhs.true117, %if.end113
  %79 = load i32, i32* %user_subshell, align 4
  %tobool124 = icmp ne i32 %79, 0
  br i1 %tobool124, label %land.lhs.true127, label %lor.lhs.false125

lor.lhs.false125:                                 ; preds = %if.end123
  %80 = load i32, i32* %user_coproc, align 4
  %tobool126 = icmp ne i32 %80, 0
  br i1 %tobool126, label %land.lhs.true127, label %if.end156

land.lhs.true127:                                 ; preds = %lor.lhs.false125, %if.end123
  %81 = load %struct.command*, %struct.command** %tcom, align 4
  %type128 = getelementptr inbounds %struct.command, %struct.command* %81, i32 0, i32 0
  %82 = load volatile i32, i32* %type128, align 4
  %cmp129 = icmp eq i32 %82, 4
  br i1 %cmp129, label %land.lhs.true135, label %lor.lhs.false131

lor.lhs.false131:                                 ; preds = %land.lhs.true127
  %83 = load %struct.command*, %struct.command** %tcom, align 4
  %type132 = getelementptr inbounds %struct.command, %struct.command* %83, i32 0, i32 0
  %84 = load volatile i32, i32* %type132, align 4
  %cmp133 = icmp eq i32 %84, 13
  br i1 %cmp133, label %land.lhs.true135, label %if.end156

land.lhs.true135:                                 ; preds = %lor.lhs.false131, %land.lhs.true127
  %85 = load %struct.command*, %struct.command** %tcom, align 4
  %flags136 = getelementptr inbounds %struct.command, %struct.command* %85, i32 0, i32 1
  %86 = load volatile i32, i32* %flags136, align 4
  %and137 = and i32 %86, 128
  %cmp138 = icmp eq i32 %and137, 0
  br i1 %cmp138, label %land.lhs.true140, label %if.end156

land.lhs.true140:                                 ; preds = %land.lhs.true135
  %87 = load %struct.command*, %struct.command** %tcom, align 4
  %flags141 = getelementptr inbounds %struct.command, %struct.command* %87, i32 0, i32 1
  %88 = load volatile i32, i32* %flags141, align 4
  %and142 = and i32 %88, 4
  %cmp143 = icmp eq i32 %and142, 0
  br i1 %cmp143, label %if.then145, label %if.end156

if.then145:                                       ; preds = %land.lhs.true140
  %89 = load %struct.command*, %struct.command** %tcom, align 4
  %flags146 = getelementptr inbounds %struct.command, %struct.command* %89, i32 0, i32 1
  %90 = load volatile i32, i32* %flags146, align 4
  %or147 = or i32 %90, 64
  store volatile i32 %or147, i32* %flags146, align 4
  %91 = load %struct.command*, %struct.command** %tcom, align 4
  %type148 = getelementptr inbounds %struct.command, %struct.command* %91, i32 0, i32 0
  %92 = load volatile i32, i32* %type148, align 4
  %cmp149 = icmp eq i32 %92, 4
  br i1 %cmp149, label %if.then151, label %if.end155

if.then151:                                       ; preds = %if.then145
  %93 = load %struct.command*, %struct.command** %tcom, align 4
  %value152 = getelementptr inbounds %struct.command, %struct.command* %93, i32 0, i32 4
  %Simple = bitcast %union.anon* %value152 to %struct.simple_com**
  %94 = load volatile %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %flags153 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %94, i32 0, i32 0
  %95 = load i32, i32* %flags153, align 4
  %or154 = or i32 %95, 64
  store i32 %or154, i32* %flags153, align 4
  br label %if.end155

if.end155:                                        ; preds = %if.then151, %if.then145
  br label %if.end156

if.end156:                                        ; preds = %if.end155, %land.lhs.true140, %land.lhs.true135, %lor.lhs.false131, %lor.lhs.false125
  %96 = load %struct.command*, %struct.command** %tcom, align 4
  %flags157 = getelementptr inbounds %struct.command, %struct.command* %96, i32 0, i32 1
  %97 = load volatile i32, i32* %flags157, align 4
  %and158 = and i32 %97, 4
  %cmp159 = icmp ne i32 %and158, 0
  %conv160 = zext i1 %cmp159 to i32
  store i32 %conv160, i32* %invert, align 4
  %98 = load %struct.command*, %struct.command** %tcom, align 4
  %flags161 = getelementptr inbounds %struct.command, %struct.command* %98, i32 0, i32 1
  %99 = load volatile i32, i32* %flags161, align 4
  %and162 = and i32 %99, -5
  store volatile i32 %and162, i32* %flags161, align 4
  %call163 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #6
  store i32 %call163, i32* %result, align 4
  store i32 0, i32* %function_value, align 4
  %100 = load i32, i32* @return_catch_flag, align 4
  %tobool164 = icmp ne i32 %100, 0
  br i1 %tobool164, label %if.then165, label %if.end167

if.then165:                                       ; preds = %if.end156
  %call166 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #6
  store i32 %call166, i32* %function_value, align 4
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %if.end156
  %101 = load i32, i32* %result, align 4
  %cmp168 = icmp eq i32 %101, 3
  br i1 %cmp168, label %if.then170, label %if.else171

if.then170:                                       ; preds = %if.end167
  store i32 0, i32* %invert, align 4
  %102 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %102, i32* %return_code, align 4
  br label %if.end184

if.else171:                                       ; preds = %if.end167
  %103 = load i32, i32* %result, align 4
  %tobool172 = icmp ne i32 %103, 0
  br i1 %tobool172, label %if.then173, label %if.else177

if.then173:                                       ; preds = %if.else171
  %104 = load volatile i32, i32* @last_command_exit_value, align 4
  %cmp174 = icmp eq i32 %104, 0
  br i1 %cmp174, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then173
  br label %cond.end

cond.false:                                       ; preds = %if.then173
  %105 = load volatile i32, i32* @last_command_exit_value, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond176 = phi i32 [ 1, %cond.true ], [ %105, %cond.false ]
  store i32 %cond176, i32* %return_code, align 4
  br label %if.end183

if.else177:                                       ; preds = %if.else171
  %106 = load i32, i32* %function_value, align 4
  %tobool178 = icmp ne i32 %106, 0
  br i1 %tobool178, label %if.then179, label %if.else180

if.then179:                                       ; preds = %if.else177
  %107 = load i32, i32* @return_catch_value, align 4
  store i32 %107, i32* %return_code, align 4
  br label %if.end182

if.else180:                                       ; preds = %if.else177
  %108 = load %struct.command*, %struct.command** %tcom, align 4
  %109 = load i32, i32* %asynchronous.addr, align 4
  %110 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call181 = call i32 @execute_command_internal(%struct.command* %108, i32 %109, i32 -1, i32 -1, %struct.fd_bitmap* %110)
  store i32 %call181, i32* %return_code, align 4
  br label %if.end182

if.end182:                                        ; preds = %if.else180, %if.then179
  br label %if.end183

if.end183:                                        ; preds = %if.end182, %cond.end
  br label %if.end184

if.end184:                                        ; preds = %if.end183, %if.then170
  %111 = load i32, i32* %invert, align 4
  %tobool185 = icmp ne i32 %111, 0
  br i1 %tobool185, label %if.then186, label %if.end190

if.then186:                                       ; preds = %if.end184
  %112 = load i32, i32* %return_code, align 4
  %cmp187 = icmp eq i32 %112, 0
  %cond189 = select i1 %cmp187, i32 1, i32 0
  store i32 %cond189, i32* %return_code, align 4
  br label %if.end190

if.end190:                                        ; preds = %if.then186, %if.end184
  %113 = load i32, i32* %user_subshell, align 4
  %tobool191 = icmp ne i32 %113, 0
  br i1 %tobool191, label %land.lhs.true192, label %if.end197

land.lhs.true192:                                 ; preds = %if.end190
  %call193 = call i32 @signal_is_trapped(i32 0)
  %tobool194 = icmp ne i32 %call193, 0
  br i1 %tobool194, label %if.then195, label %if.end197

if.then195:                                       ; preds = %land.lhs.true192
  %114 = load i32, i32* %return_code, align 4
  store volatile i32 %114, i32* @last_command_exit_value, align 4
  %call196 = call i32 @run_exit_trap()
  store i32 %call196, i32* %return_code, align 4
  br label %if.end197

if.end197:                                        ; preds = %if.then195, %land.lhs.true192, %if.end190
  %115 = load i32, i32* %return_code, align 4
  ret i32 %115
}

; Function Attrs: noinline nounwind
define internal i32 @execute_coproc(%struct.command* %command, i32 %pipe_in, i32 %pipe_out, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %rpipe = alloca [2 x i32], align 4
  %wpipe = alloca [2 x i32], align 4
  %estat = alloca i32, align 4
  %invert = alloca i32, align 4
  %coproc_pid = alloca i32, align 4
  %cp = alloca %struct.coproc*, align 4
  %tcmd = alloca i8*, align 4
  %set = alloca %struct.__sigset_t, align 4
  %oset = alloca %struct.__sigset_t, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 1), align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.22, i32 0, i32 0))
  %1 = load i32, i32* getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 1), align 4
  %2 = load i8*, i8** getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 0), align 4
  call void (i8*, ...) @internal_warning(i8* %call, i32 %1, i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @coproc_init(%struct.coproc* @sh_coproc)
  %3 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %3, i32 0, i32 1
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 4
  %cmp1 = icmp ne i32 %and, 0
  %conv = zext i1 %cmp1 to i32
  store i32 %conv, i32* %invert, align 4
  store i32 0, i32* @command_string_index, align 4
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %call2 = call i8* @make_command_string(%struct.command* %5)
  store i8* %call2, i8** %tcmd, align 4
  %6 = bitcast [2 x i32]* %rpipe to i32*
  %call3 = call i32 @sh_openpipe(i32* %6)
  %7 = bitcast [2 x i32]* %wpipe to i32*
  %call4 = call i32 @sh_openpipe(i32* %7)
  %8 = load i8*, i8** %tcmd, align 4
  %call5 = call i32 @strlen(i8* %8)
  %add = add i32 1, %call5
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2292)
  %9 = load i8*, i8** %tcmd, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %9)
  %call8 = call i32 @make_child(i8* %call7, i32 1)
  store i32 %call8, i32* %coproc_pid, align 4
  %10 = load i32, i32* %coproc_pid, align 4
  %cmp9 = icmp eq i32 %10, 0
  br i1 %cmp9, label %if.then11, label %if.end20

if.then11:                                        ; preds = %if.end
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %rpipe, i32 0, i32 0
  %11 = load i32, i32* %arrayidx, align 4
  %call12 = call i32 @close(i32 %11)
  %arrayidx13 = getelementptr inbounds [2 x i32], [2 x i32]* %wpipe, i32 0, i32 1
  %12 = load i32, i32* %arrayidx13, align 4
  %call14 = call i32 @close(i32 %12)
  %13 = load %struct.command*, %struct.command** %command.addr, align 4
  %arrayidx15 = getelementptr inbounds [2 x i32], [2 x i32]* %wpipe, i32 0, i32 0
  %14 = load i32, i32* %arrayidx15, align 4
  %arrayidx16 = getelementptr inbounds [2 x i32], [2 x i32]* %rpipe, i32 0, i32 1
  %15 = load i32, i32* %arrayidx16, align 4
  %16 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call17 = call i32 @execute_in_subshell(%struct.command* %13, i32 1, i32 %14, i32 %15, %struct.fd_bitmap* %16)
  store i32 %call17, i32* %estat, align 4
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call18 = call i32 @fflush(%struct._IO_FILE* %17)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call19 = call i32 @fflush(%struct._IO_FILE* %18)
  %19 = load i32, i32* %estat, align 4
  call void @exit(i32 %19) #5
  unreachable

if.end20:                                         ; preds = %if.end
  %arrayidx21 = getelementptr inbounds [2 x i32], [2 x i32]* %rpipe, i32 0, i32 1
  %20 = load i32, i32* %arrayidx21, align 4
  %call22 = call i32 @close(i32 %20)
  %arrayidx23 = getelementptr inbounds [2 x i32], [2 x i32]* %wpipe, i32 0, i32 0
  %21 = load i32, i32* %arrayidx23, align 4
  %call24 = call i32 @close(i32 %21)
  %22 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %22, i32 0, i32 4
  %Coproc = bitcast %union.anon* %value to %struct.coproc_com**
  %23 = load %struct.coproc_com*, %struct.coproc_com** %Coproc, align 4
  %name = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %23, i32 0, i32 1
  %24 = load i8*, i8** %name, align 4
  %25 = load i32, i32* %coproc_pid, align 4
  %call25 = call %struct.coproc* @coproc_alloc(i8* %24, i32 %25)
  store %struct.coproc* %call25, %struct.coproc** %cp, align 4
  %arrayidx26 = getelementptr inbounds [2 x i32], [2 x i32]* %rpipe, i32 0, i32 0
  %26 = load i32, i32* %arrayidx26, align 4
  %27 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %27, i32 0, i32 2
  store i32 %26, i32* %c_rfd, align 4
  %arrayidx27 = getelementptr inbounds [2 x i32], [2 x i32]* %wpipe, i32 0, i32 1
  %28 = load i32, i32* %arrayidx27, align 4
  %29 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %29, i32 0, i32 3
  store i32 %28, i32* %c_wfd, align 4
  %30 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_rfd28 = getelementptr inbounds %struct.coproc, %struct.coproc* %30, i32 0, i32 2
  %31 = load i32, i32* %c_rfd28, align 4
  %call29 = call i32 (i32, i32, ...) @fcntl(i32 %31, i32 2, i32 1)
  %32 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_wfd30 = getelementptr inbounds %struct.coproc, %struct.coproc* %32, i32 0, i32 3
  %33 = load i32, i32* %c_wfd30, align 4
  %call31 = call i32 (i32, i32, ...) @fcntl(i32 %33, i32 2, i32 1)
  %34 = load %struct.coproc*, %struct.coproc** %cp, align 4
  call void @coproc_setvars(%struct.coproc* %34)
  %35 = load i32, i32* %pipe_in.addr, align 4
  %36 = load i32, i32* %pipe_out.addr, align 4
  call void @close_pipes(i32 %35, i32 %36)
  call void @unlink_fifo_list()
  %call32 = call i32 @stop_pipeline(i32 1, %struct.command* null)
  br label %do.body

do.body:                                          ; preds = %if.end20
  %37 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %37, 0
  br i1 %tobool, label %if.then33, label %if.end34

if.then33:                                        ; preds = %do.body
  %38 = load i32, i32* %coproc_pid, align 4
  call void @describe_pid(i32 %38)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end34
  call void @run_pending_traps()
  %39 = load i32, i32* %invert, align 4
  %tobool35 = icmp ne i32 %39, 0
  %cond = select i1 %tobool35, i32 1, i32 0
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define internal i32 @shell_control_structure(i32 %type) #0 {
entry:
  %retval = alloca i32, align 4
  %type.addr = alloca i32, align 4
  store i32 %type, i32* %type.addr, align 4
  %0 = load i32, i32* %type.addr, align 4
  switch i32 %0, label %sw.default [
    i32 12, label %sw.bb
    i32 5, label %sw.bb
    i32 10, label %sw.bb
    i32 11, label %sw.bb
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 8, label %sw.bb
    i32 3, label %sw.bb
    i32 0, label %sw.bb
    i32 9, label %sw.bb
    i32 7, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

declare i8* @make_command_string(%struct.command*) #1

declare i32 @make_child(i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

declare i32 @signal_is_trapped(i32) #1

declare i32 @signal_in_progress(i32) #1

; Function Attrs: noreturn
declare void @subshell_exit(i32) #3

; Function Attrs: noreturn
declare void @sh_exit(i32) #3

; Function Attrs: noinline nounwind
define internal void @close_pipes(i32 %in, i32 %out) #0 {
entry:
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  store i32 %in, i32* %in.addr, align 4
  store i32 %out, i32* %out.addr, align 4
  %0 = load i32, i32* %in.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %in.addr, align 4
  %call = call i32 @close(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %out.addr, align 4
  %cmp1 = icmp sge i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %out.addr, align 4
  %call3 = call i32 @close(i32 %3)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  ret void
}

declare i32 @stop_pipeline(i32, %struct.command*) #1

declare i32 @signal_is_ignored(i32) #1

declare i32 @wait_for(i32) #1

declare void @run_error_trap() #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #3

declare void @describe_pid(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @time_command(%struct.command* %command, i32 %asynchronous, i32 %pipe_in, i32 %pipe_out, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %asynchronous.addr = alloca i32, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %rv = alloca i32, align 4
  %posix_time = alloca i32, align 4
  %old_flags = alloca i32, align 4
  %nullcmd = alloca i32, align 4
  %code = alloca i32, align 4
  %rs = alloca i32, align 4
  %us = alloca i32, align 4
  %ss = alloca i32, align 4
  %rsf = alloca i32, align 4
  %usf = alloca i32, align 4
  %ssf = alloca i32, align 4
  %cpu = alloca i32, align 4
  %time_format = alloca i8*, align 4
  %save_top_level = alloca [1 x %struct.__jmp_buf_tag], align 4
  %real = alloca %struct.timeval, align 4
  %user = alloca %struct.timeval, align 4
  %sys = alloca %struct.timeval, align 4
  %before = alloca %struct.timeval, align 4
  %after = alloca %struct.timeval, align 4
  %dtz = alloca %struct.timezone, align 4
  %selfb = alloca %struct.rusage, align 4
  %selfa = alloca %struct.rusage, align 4
  %kidsb = alloca %struct.rusage, align 4
  %kidsa = alloca %struct.rusage, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %asynchronous, i32* %asynchronous.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %0 = bitcast %struct.timezone* %dtz to i8*
  %call = call i32 @gettimeofday(%struct.timeval* %before, i8* %0)
  %call1 = call i32 @getrusage(i32 0, %struct.rusage* %selfb)
  %call2 = call i32 @getrusage(i32 -1, %struct.rusage* %kidsb)
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  %tobool = icmp ne %struct.command* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 1
  %3 = load i32, i32* %flags, align 4
  %and = and i32 %3, 256
  %tobool3 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %tobool3, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  store i32 %land.ext, i32* %posix_time, align 4
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp = icmp eq %struct.command* %5, null
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.end
  %6 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %6, i32 0, i32 0
  %7 = load i32, i32* %type, align 4
  %cmp4 = icmp eq i32 %7, 4
  br i1 %cmp4, label %land.lhs.true, label %land.end10

land.lhs.true:                                    ; preds = %lor.rhs
  %8 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  %9 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %9, i32 0, i32 2
  %10 = load %struct.word_list*, %struct.word_list** %words, align 4
  %cmp5 = icmp eq %struct.word_list* %10, null
  br i1 %cmp5, label %land.rhs6, label %land.end10

land.rhs6:                                        ; preds = %land.lhs.true
  %11 = load %struct.command*, %struct.command** %command.addr, align 4
  %value7 = getelementptr inbounds %struct.command, %struct.command* %11, i32 0, i32 4
  %Simple8 = bitcast %union.anon* %value7 to %struct.simple_com**
  %12 = load %struct.simple_com*, %struct.simple_com** %Simple8, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %12, i32 0, i32 3
  %13 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %cmp9 = icmp eq %struct.redirect* %13, null
  br label %land.end10

land.end10:                                       ; preds = %land.rhs6, %land.lhs.true, %lor.rhs
  %14 = phi i1 [ false, %land.lhs.true ], [ false, %lor.rhs ], [ %cmp9, %land.rhs6 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end10, %land.end
  %15 = phi i1 [ true, %land.end ], [ %14, %land.end10 ]
  %lor.ext = zext i1 %15 to i32
  store i32 %lor.ext, i32* %nullcmd, align 4
  %16 = load i32, i32* @posixly_correct, align 4
  %tobool12 = icmp ne i32 %16, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.end

land.lhs.true13:                                  ; preds = %lor.end
  %17 = load i32, i32* %nullcmd, align 4
  %tobool14 = icmp ne i32 %17, 0
  br i1 %tobool14, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true13
  %ru_stime = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsb, i32 0, i32 1
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_stime, i32 0, i32 0
  store i32 0, i32* %tv_sec, align 4
  %ru_stime15 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfb, i32 0, i32 1
  %tv_sec16 = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_stime15, i32 0, i32 0
  store i32 0, i32* %tv_sec16, align 4
  %ru_utime = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsb, i32 0, i32 0
  %tv_sec17 = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_utime, i32 0, i32 0
  store i32 0, i32* %tv_sec17, align 4
  %ru_utime18 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfb, i32 0, i32 0
  %tv_sec19 = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_utime18, i32 0, i32 0
  store i32 0, i32* %tv_sec19, align 4
  %ru_stime20 = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsb, i32 0, i32 1
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_stime20, i32 0, i32 1
  store i32 0, i32* %tv_usec, align 4
  %ru_stime21 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfb, i32 0, i32 1
  %tv_usec22 = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_stime21, i32 0, i32 1
  store i32 0, i32* %tv_usec22, align 4
  %ru_utime23 = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsb, i32 0, i32 0
  %tv_usec24 = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_utime23, i32 0, i32 1
  store i32 0, i32* %tv_usec24, align 4
  %ru_utime25 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfb, i32 0, i32 0
  %tv_usec26 = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_utime25, i32 0, i32 1
  store i32 0, i32* %tv_usec26, align 4
  %18 = load i32, i32* @shell_start_time, align 4
  %tv_sec27 = getelementptr inbounds %struct.timeval, %struct.timeval* %before, i32 0, i32 0
  store i32 %18, i32* %tv_sec27, align 4
  %tv_usec28 = getelementptr inbounds %struct.timeval, %struct.timeval* %before, i32 0, i32 1
  store i32 0, i32* %tv_usec28, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true13, %lor.end
  %19 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags29 = getelementptr inbounds %struct.command, %struct.command* %19, i32 0, i32 1
  %20 = load i32, i32* %flags29, align 4
  store i32 %20, i32* %old_flags, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %save_top_level, i32 0, i32 0
  %21 = bitcast %struct.__jmp_buf_tag* %arraydecay to i8*
  call void @xbcopy(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @top_level to i8*), i8* %21, i32 156)
  %22 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags30 = getelementptr inbounds %struct.command, %struct.command* %22, i32 0, i32 1
  %23 = load i32, i32* %flags30, align 4
  %and31 = and i32 %23, -385
  store i32 %and31, i32* %flags30, align 4
  %call32 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #6
  store i32 %call32, i32* %code, align 4
  %24 = load i32, i32* %code, align 4
  %cmp33 = icmp eq i32 %24, 0
  br i1 %cmp33, label %if.then34, label %if.end36

if.then34:                                        ; preds = %if.end
  %25 = load %struct.command*, %struct.command** %command.addr, align 4
  %26 = load i32, i32* %asynchronous.addr, align 4
  %27 = load i32, i32* %pipe_in.addr, align 4
  %28 = load i32, i32* %pipe_out.addr, align 4
  %29 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call35 = call i32 @execute_command_internal(%struct.command* %25, i32 %26, i32 %27, i32 %28, %struct.fd_bitmap* %29)
  store i32 %call35, i32* %rv, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.end
  %30 = load i32, i32* %old_flags, align 4
  %31 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags37 = getelementptr inbounds %struct.command, %struct.command* %31, i32 0, i32 1
  store i32 %30, i32* %flags37, align 4
  %arraydecay38 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* %save_top_level, i32 0, i32 0
  %32 = bitcast %struct.__jmp_buf_tag* %arraydecay38 to i8*
  call void @xbcopy(i8* %32, i8* bitcast ([1 x %struct.__jmp_buf_tag]* @top_level to i8*), i32 156)
  store i32 0, i32* %ss, align 4
  store i32 0, i32* %us, align 4
  store i32 0, i32* %rs, align 4
  store i32 0, i32* %cpu, align 4
  store i32 0, i32* %ssf, align 4
  store i32 0, i32* %usf, align 4
  store i32 0, i32* %rsf, align 4
  %33 = bitcast %struct.timezone* %dtz to i8*
  %call39 = call i32 @gettimeofday(%struct.timeval* %after, i8* %33)
  %call40 = call i32 @getrusage(i32 0, %struct.rusage* %selfa)
  %call41 = call i32 @getrusage(i32 -1, %struct.rusage* %kidsa)
  %call42 = call %struct.timeval* @difftimeval(%struct.timeval* %real, %struct.timeval* %before, %struct.timeval* %after)
  call void bitcast (void (...)* @timeval_to_secs to void (%struct.timeval*, i32*, i32*)*)(%struct.timeval* %real, i32* %rs, i32* %rsf)
  %ru_utime43 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfb, i32 0, i32 0
  %ru_utime44 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfa, i32 0, i32 0
  %call45 = call %struct.timeval* @difftimeval(%struct.timeval* %after, %struct.timeval* %ru_utime43, %struct.timeval* %ru_utime44)
  %ru_utime46 = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsb, i32 0, i32 0
  %ru_utime47 = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsa, i32 0, i32 0
  %call48 = call %struct.timeval* @difftimeval(%struct.timeval* %before, %struct.timeval* %ru_utime46, %struct.timeval* %ru_utime47)
  %call49 = call %struct.timeval* @addtimeval(%struct.timeval* %user, %struct.timeval* %call45, %struct.timeval* %call48)
  call void bitcast (void (...)* @timeval_to_secs to void (%struct.timeval*, i32*, i32*)*)(%struct.timeval* %user, i32* %us, i32* %usf)
  %ru_stime50 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfb, i32 0, i32 1
  %ru_stime51 = getelementptr inbounds %struct.rusage, %struct.rusage* %selfa, i32 0, i32 1
  %call52 = call %struct.timeval* @difftimeval(%struct.timeval* %after, %struct.timeval* %ru_stime50, %struct.timeval* %ru_stime51)
  %ru_stime53 = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsb, i32 0, i32 1
  %ru_stime54 = getelementptr inbounds %struct.rusage, %struct.rusage* %kidsa, i32 0, i32 1
  %call55 = call %struct.timeval* @difftimeval(%struct.timeval* %before, %struct.timeval* %ru_stime53, %struct.timeval* %ru_stime54)
  %call56 = call %struct.timeval* @addtimeval(%struct.timeval* %sys, %struct.timeval* %call52, %struct.timeval* %call55)
  call void bitcast (void (...)* @timeval_to_secs to void (%struct.timeval*, i32*, i32*)*)(%struct.timeval* %sys, i32* %ss, i32* %ssf)
  %call57 = call i32 @timeval_to_cpu(%struct.timeval* %real, %struct.timeval* %user, %struct.timeval* %sys)
  store i32 %call57, i32* %cpu, align 4
  %34 = load i32, i32* %posix_time, align 4
  %tobool58 = icmp ne i32 %34, 0
  br i1 %tobool58, label %if.then59, label %if.else

if.then59:                                        ; preds = %if.end36
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.13, i32 0, i32 0), i8** %time_format, align 4
  br label %if.end70

if.else:                                          ; preds = %if.end36
  %call60 = call i8* @get_string_value(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.14, i32 0, i32 0))
  store i8* %call60, i8** %time_format, align 4
  %cmp61 = icmp eq i8* %call60, null
  br i1 %cmp61, label %if.then62, label %if.end69

if.then62:                                        ; preds = %if.else
  %35 = load i32, i32* @posixly_correct, align 4
  %tobool63 = icmp ne i32 %35, 0
  br i1 %tobool63, label %land.lhs.true64, label %if.else67

land.lhs.true64:                                  ; preds = %if.then62
  %36 = load i32, i32* %nullcmd, align 4
  %tobool65 = icmp ne i32 %36, 0
  br i1 %tobool65, label %if.then66, label %if.else67

if.then66:                                        ; preds = %land.lhs.true64
  store i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.15, i32 0, i32 0), i8** %time_format, align 4
  br label %if.end68

if.else67:                                        ; preds = %land.lhs.true64, %if.then62
  store i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.16, i32 0, i32 0), i8** %time_format, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.else67, %if.then66
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.else
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then59
  %37 = load i8*, i8** %time_format, align 4
  %tobool71 = icmp ne i8* %37, null
  br i1 %tobool71, label %land.lhs.true72, label %if.end75

land.lhs.true72:                                  ; preds = %if.end70
  %38 = load i8*, i8** %time_format, align 4
  %39 = load i8, i8* %38, align 1
  %conv = sext i8 %39 to i32
  %tobool73 = icmp ne i32 %conv, 0
  br i1 %tobool73, label %if.then74, label %if.end75

if.then74:                                        ; preds = %land.lhs.true72
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %41 = load i8*, i8** %time_format, align 4
  %42 = load i32, i32* %rs, align 4
  %43 = load i32, i32* %rsf, align 4
  %44 = load i32, i32* %us, align 4
  %45 = load i32, i32* %usf, align 4
  %46 = load i32, i32* %ss, align 4
  %47 = load i32, i32* %ssf, align 4
  %48 = load i32, i32* %cpu, align 4
  call void @print_formatted_time(%struct._IO_FILE* %40, i8* %41, i32 %42, i32 %43, i32 %44, i32 %45, i32 %46, i32 %47, i32 %48)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %land.lhs.true72, %if.end70
  %49 = load i32, i32* %code, align 4
  %tobool76 = icmp ne i32 %49, 0
  br i1 %tobool76, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end75
  %50 = load i32, i32* %code, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0), i32 %50) #5
  unreachable

if.end78:                                         ; preds = %if.end75
  %51 = load i32, i32* %rv, align 4
  ret i32 %51
}

declare i32 @stdin_redirects(%struct.redirect*) #1

declare i32 @num_fifos() #1

declare i8* @copy_fifo_list(i32*) #1

declare void @xfree(i8*) #1

declare i32 @do_redirections(%struct.redirect*, i32) #1

; Function Attrs: noinline nounwind
define internal void @cleanup_redirects(%struct.redirect* %list) #0 {
entry:
  %list.addr = alloca %struct.redirect*, align 4
  store %struct.redirect* %list, %struct.redirect** %list.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  %call = call i32 @do_redirections(%struct.redirect* %0, i32 1)
  %1 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  call void @dispose_redirects(%struct.redirect* %1)
  ret void
}

declare %struct.redirect* @copy_redirects(%struct.redirect*) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_simple_command(%struct.simple_com* %simple_command, i32 %pipe_in, i32 %pipe_out, i32 %async, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %retval = alloca i32, align 4
  %simple_command.addr = alloca %struct.simple_com*, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %async.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %words = alloca %struct.word_list*, align 4
  %lastword = alloca %struct.word_list*, align 4
  %command_line = alloca i8*, align 4
  %lastarg = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %first_word_quoted = alloca i32, align 4
  %result = alloca i32, align 4
  %builtin_is_special = alloca i32, align 4
  %already_forked = alloca i32, align 4
  %dofork = alloca i32, align 4
  %old_last_async_pid = alloca i32, align 4
  %builtin = alloca i32 (%struct.word_list*)*, align 4
  %func = alloca %struct.variable*, align 4
  %old_builtin = alloca i32, align 4
  %old_command_builtin = alloca i32, align 4
  store %struct.simple_com* %simple_command, %struct.simple_com** %simple_command.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store i32 %async, i32* %async.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  store i32 0, i32* %result, align 4
  store i32 0, i32* %builtin_is_special, align 4
  store i32 0, i32* @special_builtin_failed, align 4
  store i8* null, i8** %command_line, align 4
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
  %3 = load i32, i32* @variable_context, align 4
  %tobool4 = icmp ne i32 %3, 0
  br i1 %tobool4, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %do.end
  %4 = load i32, i32* @interactive_shell, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %land.lhs.true6, label %if.end11

land.lhs.true6:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* @sourcelevel, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then7, label %if.end11

if.then7:                                         ; preds = %land.lhs.true6
  %6 = load i32, i32* @function_line_number, align 4
  %7 = load i32, i32* @line_number, align 4
  %sub = sub nsw i32 %7, %6
  store i32 %sub, i32* @line_number, align 4
  %8 = load i32, i32* @line_number, align 4
  %cmp8 = icmp slt i32 %8, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  store i32 0, i32* @line_number, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %land.lhs.true6, %land.lhs.true, %do.end
  store i32 0, i32* @command_string_index, align 4
  %9 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  call void @print_simple_command(%struct.simple_com* %9)
  %call = call i32 @signal_in_progress(i32 65)
  %cmp12 = icmp eq i32 %call, 0
  br i1 %cmp12, label %land.lhs.true13, label %if.end25

land.lhs.true13:                                  ; preds = %if.end11
  %10 = load i32, i32* @running_trap, align 4
  %cmp14 = icmp eq i32 %10, 0
  br i1 %cmp14, label %if.then15, label %if.end25

if.then15:                                        ; preds = %land.lhs.true13
  br label %do.body16

do.body16:                                        ; preds = %if.then15
  %11 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool17 = icmp ne i8* %11, null
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %do.body16
  %12 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4050)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %do.body16
  br label %do.end20

do.end20:                                         ; preds = %if.end19
  %13 = load i8*, i8** @the_printed_command, align 4
  %tobool21 = icmp ne i8* %13, null
  br i1 %tobool21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end20
  %14 = load i8*, i8** @the_printed_command, align 4
  %call22 = call i32 @strlen(i8* %14)
  %add = add i32 1, %call22
  %call23 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4051)
  %15 = load i8*, i8** @the_printed_command, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %15)
  br label %cond.end

cond.false:                                       ; preds = %do.end20
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call24, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** @the_printed_command_except_trap, align 4
  br label %if.end25

if.end25:                                         ; preds = %cond.end, %land.lhs.true13, %if.end11
  %call26 = call i32 @run_debug_trap()
  store i32 %call26, i32* %result, align 4
  %16 = load i32, i32* @debugging_mode, align 4
  %tobool27 = icmp ne i32 %16, 0
  br i1 %tobool27, label %land.lhs.true28, label %if.end31

land.lhs.true28:                                  ; preds = %if.end25
  %17 = load i32, i32* %result, align 4
  %cmp29 = icmp ne i32 %17, 0
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %land.lhs.true28
  store i32 0, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %land.lhs.true28, %if.end25
  %18 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words32 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %18, i32 0, i32 2
  %19 = load %struct.word_list*, %struct.word_list** %words32, align 4
  %tobool33 = icmp ne %struct.word_list* %19, null
  br i1 %tobool33, label %cond.true34, label %cond.false36

cond.true34:                                      ; preds = %if.end31
  %20 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words35 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %20, i32 0, i32 2
  %21 = load %struct.word_list*, %struct.word_list** %words35, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 1
  %23 = load i32, i32* %flags, align 4
  %and = and i32 %23, 2
  br label %cond.end37

cond.false36:                                     ; preds = %if.end31
  br label %cond.end37

cond.end37:                                       ; preds = %cond.false36, %cond.true34
  %cond38 = phi i32 [ %and, %cond.true34 ], [ 0, %cond.false36 ]
  store i32 %cond38, i32* %first_word_quoted, align 4
  store i32 -1, i32* @last_command_subst_pid, align 4
  %24 = load volatile i32, i32* @last_asynchronous_pid, align 4
  store i32 %24, i32* %old_last_async_pid, align 4
  store i32 0, i32* %dofork, align 4
  store i32 0, i32* %already_forked, align 4
  %25 = load i32, i32* %pipe_in.addr, align 4
  %cmp39 = icmp ne i32 %25, -1
  br i1 %cmp39, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end37
  %26 = load i32, i32* %pipe_out.addr, align 4
  %cmp40 = icmp ne i32 %26, -1
  br i1 %cmp40, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %27 = load i32, i32* %async.addr, align 4
  %tobool41 = icmp ne i32 %27, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %cond.end37
  %28 = phi i1 [ true, %lor.lhs.false ], [ true, %cond.end37 ], [ %tobool41, %lor.rhs ]
  %lor.ext = zext i1 %28 to i32
  store i32 %lor.ext, i32* %dofork, align 4
  %29 = load i32, i32* %dofork, align 4
  %tobool42 = icmp ne i32 %29, 0
  br i1 %tobool42, label %land.lhs.true43, label %if.end66

land.lhs.true43:                                  ; preds = %lor.end
  %30 = load i32, i32* %pipe_in.addr, align 4
  %cmp44 = icmp eq i32 %30, -1
  br i1 %cmp44, label %land.lhs.true45, label %if.end66

land.lhs.true45:                                  ; preds = %land.lhs.true43
  %31 = load i32, i32* %pipe_out.addr, align 4
  %cmp46 = icmp eq i32 %31, -1
  br i1 %cmp46, label %land.lhs.true47, label %if.end66

land.lhs.true47:                                  ; preds = %land.lhs.true45
  %32 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words48 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %32, i32 0, i32 2
  %33 = load %struct.word_list*, %struct.word_list** %words48, align 4
  %tobool49 = icmp ne %struct.word_list* %33, null
  br i1 %tobool49, label %land.lhs.true50, label %if.end66

land.lhs.true50:                                  ; preds = %land.lhs.true47
  %34 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words51 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %34, i32 0, i32 2
  %35 = load %struct.word_list*, %struct.word_list** %words51, align 4
  %word52 = getelementptr inbounds %struct.word_list, %struct.word_list* %35, i32 0, i32 1
  %36 = load %struct.word_desc*, %struct.word_desc** %word52, align 4
  %tobool53 = icmp ne %struct.word_desc* %36, null
  br i1 %tobool53, label %land.lhs.true54, label %if.end66

land.lhs.true54:                                  ; preds = %land.lhs.true50
  %37 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words55 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %37, i32 0, i32 2
  %38 = load %struct.word_list*, %struct.word_list** %words55, align 4
  %word56 = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 1
  %39 = load %struct.word_desc*, %struct.word_desc** %word56, align 4
  %word57 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %39, i32 0, i32 0
  %40 = load i8*, i8** %word57, align 4
  %tobool58 = icmp ne i8* %40, null
  br i1 %tobool58, label %land.lhs.true59, label %if.end66

land.lhs.true59:                                  ; preds = %land.lhs.true54
  %41 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words60 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %41, i32 0, i32 2
  %42 = load %struct.word_list*, %struct.word_list** %words60, align 4
  %word61 = getelementptr inbounds %struct.word_list, %struct.word_list* %42, i32 0, i32 1
  %43 = load %struct.word_desc*, %struct.word_desc** %word61, align 4
  %word62 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %43, i32 0, i32 0
  %44 = load i8*, i8** %word62, align 4
  %arrayidx = getelementptr inbounds i8, i8* %44, i32 0
  %45 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %45 to i32
  %cmp63 = icmp eq i32 %conv, 37
  br i1 %cmp63, label %if.then65, label %if.end66

if.then65:                                        ; preds = %land.lhs.true59
  store i32 0, i32* %dofork, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %land.lhs.true59, %land.lhs.true54, %land.lhs.true50, %land.lhs.true47, %land.lhs.true45, %land.lhs.true43, %lor.end
  %46 = load i32, i32* %dofork, align 4
  %tobool67 = icmp ne i32 %46, 0
  br i1 %tobool67, label %if.then68, label %if.end116

if.then68:                                        ; preds = %if.end66
  call void @maybe_make_export_env()
  %47 = load i8*, i8** @the_printed_command_except_trap, align 4
  %call69 = call i32 @strlen(i8* %47)
  %add70 = add i32 1, %call69
  %call71 = call i8* @sh_xmalloc(i32 %add70, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4094)
  %48 = load i8*, i8** @the_printed_command_except_trap, align 4
  %call72 = call i8* @strcpy(i8* %call71, i8* %48)
  %49 = load i32, i32* %async.addr, align 4
  %call73 = call i32 @make_child(i8* %call72, i32 %49)
  %cmp74 = icmp eq i32 %call73, 0
  br i1 %cmp74, label %if.then76, label %if.else

if.then76:                                        ; preds = %if.then68
  store i32 1, i32* %already_forked, align 4
  %50 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags77 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %50, i32 0, i32 0
  %51 = load i32, i32* %flags77, align 4
  %or = or i32 %51, 64
  store i32 %or, i32* %flags77, align 4
  store i32 8, i32* @subshell_environment, align 4
  %52 = load i32, i32* %pipe_in.addr, align 4
  %cmp78 = icmp ne i32 %52, -1
  br i1 %cmp78, label %if.then83, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %if.then76
  %53 = load i32, i32* %pipe_out.addr, align 4
  %cmp81 = icmp ne i32 %53, -1
  br i1 %cmp81, label %if.then83, label %if.end85

if.then83:                                        ; preds = %lor.lhs.false80, %if.then76
  %54 = load i32, i32* @subshell_environment, align 4
  %or84 = or i32 %54, 16
  store i32 %or84, i32* @subshell_environment, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %lor.lhs.false80
  %55 = load i32, i32* %async.addr, align 4
  %tobool86 = icmp ne i32 %55, 0
  br i1 %tobool86, label %if.then87, label %if.end89

if.then87:                                        ; preds = %if.end85
  %56 = load i32, i32* @subshell_environment, align 4
  %or88 = or i32 %56, 1
  store i32 %or88, i32* @subshell_environment, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.then87, %if.end85
  %57 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %tobool90 = icmp ne %struct.fd_bitmap* %57, null
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end89
  %58 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  call void @close_fd_bitmap(%struct.fd_bitmap* %58)
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %if.end89
  %59 = load i32, i32* %pipe_in.addr, align 4
  %cmp93 = icmp ne i32 %59, -1
  %conv94 = zext i1 %cmp93 to i32
  %60 = load i32, i32* @stdin_redir, align 4
  %or95 = or i32 %60, %conv94
  store i32 %or95, i32* @stdin_redir, align 4
  %61 = load i32, i32* %pipe_in.addr, align 4
  %62 = load i32, i32* %pipe_out.addr, align 4
  call void @do_piping(i32 %61, i32 %62)
  store i32 -1, i32* %pipe_out.addr, align 4
  store i32 -1, i32* %pipe_in.addr, align 4
  call void @coproc_closeall()
  %63 = load i32, i32* %old_last_async_pid, align 4
  store volatile i32 %63, i32* @last_asynchronous_pid, align 4
  br label %do.body96

do.body96:                                        ; preds = %if.end92
  %64 = load volatile i32, i32* @sigterm_received, align 4
  %tobool97 = icmp ne i32 %64, 0
  br i1 %tobool97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %do.body96
  call void @termsig_handler(i32 15)
  br label %if.end99

if.end99:                                         ; preds = %if.then98, %do.body96
  br label %do.end100

do.end100:                                        ; preds = %if.end99
  %65 = load i32, i32* %async.addr, align 4
  %tobool101 = icmp ne i32 %65, 0
  br i1 %tobool101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %do.end100
  %66 = load i32, i32* @subshell_level, align 4
  %inc = add nsw i32 %66, 1
  store i32 %inc, i32* @subshell_level, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.then102, %do.end100
  br label %if.end115

if.else:                                          ; preds = %if.then68
  %67 = load i32, i32* %pipe_out.addr, align 4
  %cmp104 = icmp ne i32 %67, -1
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %if.else
  %68 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %68, i32* %result, align 4
  br label %if.end107

if.end107:                                        ; preds = %if.then106, %if.else
  %69 = load i32, i32* %pipe_in.addr, align 4
  %70 = load i32, i32* %pipe_out.addr, align 4
  call void @close_pipes(i32 %69, i32 %70)
  %71 = load i32, i32* %pipe_out.addr, align 4
  %cmp108 = icmp eq i32 %71, -1
  br i1 %cmp108, label %land.lhs.true110, label %if.end114

land.lhs.true110:                                 ; preds = %if.end107
  %72 = load i32, i32* @variable_context, align 4
  %cmp111 = icmp eq i32 %72, 0
  br i1 %cmp111, label %if.then113, label %if.end114

if.then113:                                       ; preds = %land.lhs.true110
  call void @unlink_fifo_list()
  br label %if.end114

if.end114:                                        ; preds = %if.then113, %land.lhs.true110, %if.end107
  store i8* null, i8** %command_line, align 4
  call void @bind_lastarg(i8* null)
  %73 = load i32, i32* %result, align 4
  store i32 %73, i32* %retval, align 4
  br label %return

if.end115:                                        ; preds = %if.end103
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.end66
  br label %do.body117

do.body117:                                       ; preds = %if.end116
  %74 = load volatile i32, i32* @terminating_signal, align 4
  %tobool118 = icmp ne i32 %74, 0
  br i1 %tobool118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %do.body117
  %75 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %75)
  br label %if.end120

if.end120:                                        ; preds = %if.then119, %do.body117
  %76 = load volatile i32, i32* @interrupt_state, align 4
  %tobool121 = icmp ne i32 %76, 0
  br i1 %tobool121, label %if.then122, label %if.end123

if.then122:                                       ; preds = %if.end120
  call void @throw_to_top_level()
  br label %if.end123

if.end123:                                        ; preds = %if.then122, %if.end120
  br label %do.end124

do.end124:                                        ; preds = %if.end123
  %77 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags125 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %77, i32 0, i32 0
  %78 = load i32, i32* %flags125, align 4
  %and126 = and i32 %78, 32
  %cmp127 = icmp eq i32 %and126, 0
  br i1 %cmp127, label %if.then129, label %if.else144

if.then129:                                       ; preds = %do.end124
  %79 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  store %struct.fd_bitmap* %79, %struct.fd_bitmap** @current_fds_to_close, align 4
  %80 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words130 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %80, i32 0, i32 2
  %81 = load %struct.word_list*, %struct.word_list** %words130, align 4
  call void @fix_assignment_words(%struct.word_list* %81)
  %82 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags131 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %82, i32 0, i32 0
  %83 = load i32, i32* %flags131, align 4
  %and132 = and i32 %83, 8
  %tobool133 = icmp ne i32 %and132, 0
  br i1 %tobool133, label %if.then134, label %if.end136

if.then134:                                       ; preds = %if.then129
  %84 = load i32, i32* @comsub_ignore_return, align 4
  %inc135 = add nsw i32 %84, 1
  store i32 %inc135, i32* @comsub_ignore_return, align 4
  br label %if.end136

if.end136:                                        ; preds = %if.then134, %if.then129
  %85 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words137 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %85, i32 0, i32 2
  %86 = load %struct.word_list*, %struct.word_list** %words137, align 4
  %call138 = call %struct.word_list* @expand_words(%struct.word_list* %86)
  store %struct.word_list* %call138, %struct.word_list** %words, align 4
  %87 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags139 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %87, i32 0, i32 0
  %88 = load i32, i32* %flags139, align 4
  %and140 = and i32 %88, 8
  %tobool141 = icmp ne i32 %and140, 0
  br i1 %tobool141, label %if.then142, label %if.end143

if.then142:                                       ; preds = %if.end136
  %89 = load i32, i32* @comsub_ignore_return, align 4
  %dec = add nsw i32 %89, -1
  store i32 %dec, i32* @comsub_ignore_return, align 4
  br label %if.end143

if.end143:                                        ; preds = %if.then142, %if.end136
  store %struct.fd_bitmap* null, %struct.fd_bitmap** @current_fds_to_close, align 4
  br label %if.end147

if.else144:                                       ; preds = %do.end124
  %90 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words145 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %90, i32 0, i32 2
  %91 = load %struct.word_list*, %struct.word_list** %words145, align 4
  %call146 = call %struct.word_list* @copy_word_list(%struct.word_list* %91)
  store %struct.word_list* %call146, %struct.word_list** %words, align 4
  br label %if.end147

if.end147:                                        ; preds = %if.else144, %if.end143
  %92 = load %struct.word_list*, %struct.word_list** %words, align 4
  %cmp148 = icmp eq %struct.word_list* %92, null
  br i1 %cmp148, label %if.then150, label %if.end160

if.then150:                                       ; preds = %if.end147
  store i8* null, i8** @this_command_name, align 4
  %93 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %93, i32 0, i32 3
  %94 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %95 = load i32, i32* %pipe_in.addr, align 4
  %96 = load i32, i32* %pipe_out.addr, align 4
  %97 = load i32, i32* %already_forked, align 4
  %tobool151 = icmp ne i32 %97, 0
  br i1 %tobool151, label %cond.true152, label %cond.false153

cond.true152:                                     ; preds = %if.then150
  br label %cond.end154

cond.false153:                                    ; preds = %if.then150
  %98 = load i32, i32* %async.addr, align 4
  br label %cond.end154

cond.end154:                                      ; preds = %cond.false153, %cond.true152
  %cond155 = phi i32 [ 0, %cond.true152 ], [ %98, %cond.false153 ]
  %call156 = call i32 @execute_null_command(%struct.redirect* %94, i32 %95, i32 %96, i32 %cond155)
  store i32 %call156, i32* %result, align 4
  %99 = load i32, i32* %already_forked, align 4
  %tobool157 = icmp ne i32 %99, 0
  br i1 %tobool157, label %if.then158, label %if.else159

if.then158:                                       ; preds = %cond.end154
  %100 = load i32, i32* %result, align 4
  call void @sh_exit(i32 %100) #5
  unreachable

if.else159:                                       ; preds = %cond.end154
  call void @bind_lastarg(i8* null)
  %101 = load i32, i32* %result, align 4
  call void @set_pipestatus_from_exit(i32 %101)
  %102 = load i32, i32* %result, align 4
  store i32 %102, i32* %retval, align 4
  br label %return

if.end160:                                        ; preds = %if.end147
  store i8* null, i8** %lastarg, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.40, i32 0, i32 0))
  %103 = load i32, i32* @echo_command_at_execute, align 4
  %tobool161 = icmp ne i32 %103, 0
  br i1 %tobool161, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.end160
  %104 = load %struct.word_list*, %struct.word_list** %words, align 4
  call void @xtrace_print_word_list(%struct.word_list* %104, i32 1)
  br label %if.end163

if.end163:                                        ; preds = %if.then162, %if.end160
  store i32 (%struct.word_list*)* null, i32 (%struct.word_list*)** %builtin, align 4
  store %struct.variable* null, %struct.variable** %func, align 4
  %105 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags164 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %105, i32 0, i32 0
  %106 = load i32, i32* %flags164, align 4
  %and165 = and i32 %106, 16
  %cmp166 = icmp eq i32 %and165, 0
  br i1 %cmp166, label %if.then168, label %if.end185

if.then168:                                       ; preds = %if.end163
  %107 = load i32, i32* @posixly_correct, align 4
  %tobool169 = icmp ne i32 %107, 0
  br i1 %tobool169, label %if.then170, label %if.end177

if.then170:                                       ; preds = %if.then168
  %108 = load %struct.word_list*, %struct.word_list** %words, align 4
  %word171 = getelementptr inbounds %struct.word_list, %struct.word_list* %108, i32 0, i32 1
  %109 = load %struct.word_desc*, %struct.word_desc** %word171, align 4
  %word172 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %109, i32 0, i32 0
  %110 = load i8*, i8** %word172, align 4
  %call173 = call i32 (%struct.word_list*)* @find_special_builtin(i8* %110)
  store i32 (%struct.word_list*)* %call173, i32 (%struct.word_list*)** %builtin, align 4
  %111 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %tobool174 = icmp ne i32 (%struct.word_list*)* %111, null
  br i1 %tobool174, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.then170
  store i32 1, i32* %builtin_is_special, align 4
  br label %if.end176

if.end176:                                        ; preds = %if.then175, %if.then170
  br label %if.end177

if.end177:                                        ; preds = %if.end176, %if.then168
  %112 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %cmp178 = icmp eq i32 (%struct.word_list*)* %112, null
  br i1 %cmp178, label %if.then180, label %if.end184

if.then180:                                       ; preds = %if.end177
  %113 = load %struct.word_list*, %struct.word_list** %words, align 4
  %word181 = getelementptr inbounds %struct.word_list, %struct.word_list* %113, i32 0, i32 1
  %114 = load %struct.word_desc*, %struct.word_desc** %word181, align 4
  %word182 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %114, i32 0, i32 0
  %115 = load i8*, i8** %word182, align 4
  %call183 = call %struct.variable* @find_function(i8* %115)
  store %struct.variable* %call183, %struct.variable** %func, align 4
  br label %if.end184

if.end184:                                        ; preds = %if.then180, %if.end177
  br label %if.end185

if.end185:                                        ; preds = %if.end184, %if.end163
  %116 = load i32, i32* @posixly_correct, align 4
  %tobool186 = icmp ne i32 %116, 0
  br i1 %tobool186, label %land.lhs.true187, label %if.end195

land.lhs.true187:                                 ; preds = %if.end185
  %117 = load i32, i32* %builtin_is_special, align 4
  %tobool188 = icmp ne i32 %117, 0
  br i1 %tobool188, label %land.lhs.true189, label %if.end195

land.lhs.true189:                                 ; preds = %land.lhs.true187
  %118 = load i32, i32* @interactive_shell, align 4
  %cmp190 = icmp eq i32 %118, 0
  br i1 %cmp190, label %land.lhs.true192, label %if.end195

land.lhs.true192:                                 ; preds = %land.lhs.true189
  %119 = load i32, i32* @tempenv_assign_error, align 4
  %tobool193 = icmp ne i32 %119, 0
  br i1 %tobool193, label %if.then194, label %if.end195

if.then194:                                       ; preds = %land.lhs.true192
  store volatile i32 1, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end195:                                        ; preds = %land.lhs.true192, %land.lhs.true189, %land.lhs.true187, %if.end185
  store i32 0, i32* @tempenv_assign_error, align 4
  %120 = load %struct.word_list*, %struct.word_list** %words, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.word_list*)*, %struct.word_list*)*)(void (%struct.word_list*)* @dispose_words, %struct.word_list* %120)
  br label %do.body196

do.body196:                                       ; preds = %if.end195
  %121 = load volatile i32, i32* @terminating_signal, align 4
  %tobool197 = icmp ne i32 %121, 0
  br i1 %tobool197, label %if.then198, label %if.end199

if.then198:                                       ; preds = %do.body196
  %122 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %122)
  br label %if.end199

if.end199:                                        ; preds = %if.then198, %do.body196
  %123 = load volatile i32, i32* @interrupt_state, align 4
  %tobool200 = icmp ne i32 %123, 0
  br i1 %tobool200, label %if.then201, label %if.end202

if.then201:                                       ; preds = %if.end199
  call void @throw_to_top_level()
  br label %if.end202

if.end202:                                        ; preds = %if.then201, %if.end199
  br label %do.end203

do.end203:                                        ; preds = %if.end202
  %124 = load %struct.word_list*, %struct.word_list** %words, align 4
  store %struct.word_list* %124, %struct.word_list** %lastword, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end203
  %125 = load %struct.word_list*, %struct.word_list** %lastword, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %125, i32 0, i32 0
  %126 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool204 = icmp ne %struct.word_list* %126, null
  br i1 %tobool204, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %127 = load %struct.word_list*, %struct.word_list** %lastword, align 4
  %next205 = getelementptr inbounds %struct.word_list, %struct.word_list* %127, i32 0, i32 0
  %128 = load %struct.word_list*, %struct.word_list** %next205, align 4
  store %struct.word_list* %128, %struct.word_list** %lastword, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %129 = load %struct.word_list*, %struct.word_list** %lastword, align 4
  %word206 = getelementptr inbounds %struct.word_list, %struct.word_list* %129, i32 0, i32 1
  %130 = load %struct.word_desc*, %struct.word_desc** %word206, align 4
  %word207 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %130, i32 0, i32 0
  %131 = load i8*, i8** %word207, align 4
  store i8* %131, i8** %lastarg, align 4
  br label %run_builtin

run_builtin:                                      ; preds = %if.then313, %for.end
  %132 = load %struct.word_list*, %struct.word_list** %words, align 4
  %word208 = getelementptr inbounds %struct.word_list, %struct.word_list* %132, i32 0, i32 1
  %133 = load %struct.word_desc*, %struct.word_desc** %word208, align 4
  %word209 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %133, i32 0, i32 0
  %134 = load i8*, i8** %word209, align 4
  store i8* %134, i8** @this_command_name, align 4
  br label %do.body210

do.body210:                                       ; preds = %run_builtin
  %135 = load volatile i32, i32* @terminating_signal, align 4
  %tobool211 = icmp ne i32 %135, 0
  br i1 %tobool211, label %if.then212, label %if.end213

if.then212:                                       ; preds = %do.body210
  %136 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %136)
  br label %if.end213

if.end213:                                        ; preds = %if.then212, %do.body210
  %137 = load volatile i32, i32* @interrupt_state, align 4
  %tobool214 = icmp ne i32 %137, 0
  br i1 %tobool214, label %if.then215, label %if.end216

if.then215:                                       ; preds = %if.end213
  call void @throw_to_top_level()
  br label %if.end216

if.end216:                                        ; preds = %if.then215, %if.end213
  br label %do.end217

do.end217:                                        ; preds = %if.end216
  %138 = load %struct.variable*, %struct.variable** %func, align 4
  %cmp218 = icmp eq %struct.variable* %138, null
  br i1 %cmp218, label %land.lhs.true220, label %if.end225

land.lhs.true220:                                 ; preds = %do.end217
  %139 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %cmp221 = icmp eq i32 (%struct.word_list*)* %139, null
  br i1 %cmp221, label %if.then223, label %if.end225

if.then223:                                       ; preds = %land.lhs.true220
  %140 = load i8*, i8** @this_command_name, align 4
  %call224 = call i32 (%struct.word_list*)* @find_shell_builtin(i8* %140)
  store i32 (%struct.word_list*)* %call224, i32 (%struct.word_list*)** %builtin, align 4
  br label %if.end225

if.end225:                                        ; preds = %if.then223, %land.lhs.true220, %do.end217
  %141 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  store i32 (%struct.word_list*)* %141, i32 (%struct.word_list*)** @last_shell_builtin, align 4
  %142 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  store i32 (%struct.word_list*)* %142, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %143 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %tobool226 = icmp ne i32 (%struct.word_list*)* %143, null
  br i1 %tobool226, label %if.then229, label %lor.lhs.false227

lor.lhs.false227:                                 ; preds = %if.end225
  %144 = load %struct.variable*, %struct.variable** %func, align 4
  %tobool228 = icmp ne %struct.variable* %144, null
  br i1 %tobool228, label %if.then229, label %if.end301

if.then229:                                       ; preds = %lor.lhs.false227, %if.end225
  %145 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %tobool230 = icmp ne i32 (%struct.word_list*)* %145, null
  br i1 %tobool230, label %if.then231, label %if.end232

if.then231:                                       ; preds = %if.then229
  %146 = load i32, i32* @executing_builtin, align 4
  store volatile i32 %146, i32* %old_builtin, align 4
  %147 = load i32, i32* @executing_command_builtin, align 4
  store volatile i32 %147, i32* %old_command_builtin, align 4
  call void @unwind_protect_mem(i8* bitcast (i32* @executing_builtin to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @executing_command_builtin to i8*), i32 4)
  br label %if.end232

if.end232:                                        ; preds = %if.then231, %if.then229
  %148 = load i32, i32* %already_forked, align 4
  %tobool233 = icmp ne i32 %148, 0
  br i1 %tobool233, label %if.then234, label %if.else260

if.then234:                                       ; preds = %if.end232
  call void @reset_signal_handlers()
  %149 = load i32, i32* @subshell_environment, align 4
  %or235 = or i32 %149, 128
  store i32 %or235, i32* @subshell_environment, align 4
  %150 = load i32, i32* %async.addr, align 4
  %tobool236 = icmp ne i32 %150, 0
  br i1 %tobool236, label %if.then237, label %if.end251

if.then237:                                       ; preds = %if.then234
  %151 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags238 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %151, i32 0, i32 0
  %152 = load i32, i32* %flags238, align 4
  %and239 = and i32 %152, 1024
  %tobool240 = icmp ne i32 %and239, 0
  br i1 %tobool240, label %land.lhs.true241, label %if.end250

land.lhs.true241:                                 ; preds = %if.then237
  %153 = load i32, i32* %pipe_in.addr, align 4
  %cmp242 = icmp eq i32 %153, -1
  br i1 %cmp242, label %land.lhs.true244, label %if.end250

land.lhs.true244:                                 ; preds = %land.lhs.true241
  %154 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects245 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %154, i32 0, i32 3
  %155 = load %struct.redirect*, %struct.redirect** %redirects245, align 4
  %call246 = call i32 @stdin_redirects(%struct.redirect* %155)
  %cmp247 = icmp eq i32 %call246, 0
  br i1 %cmp247, label %if.then249, label %if.end250

if.then249:                                       ; preds = %land.lhs.true244
  call void @async_redirect_stdin()
  br label %if.end250

if.end250:                                        ; preds = %if.then249, %land.lhs.true244, %land.lhs.true241, %if.then237
  call void @setup_async_signals()
  br label %if.end251

if.end251:                                        ; preds = %if.end250, %if.then234
  %156 = load i32, i32* %async.addr, align 4
  %cmp252 = icmp eq i32 %156, 0
  br i1 %cmp252, label %if.then254, label %if.end256

if.then254:                                       ; preds = %if.end251
  %157 = load i32, i32* @subshell_level, align 4
  %inc255 = add nsw i32 %157, 1
  store i32 %inc255, i32* @subshell_level, align 4
  br label %if.end256

if.end256:                                        ; preds = %if.then254, %if.end251
  %158 = load %struct.word_list*, %struct.word_list** %words, align 4
  %159 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects257 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %159, i32 0, i32 3
  %160 = load %struct.redirect*, %struct.redirect** %redirects257, align 4
  %161 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %162 = load %struct.variable*, %struct.variable** %func, align 4
  %163 = load i32, i32* %pipe_in.addr, align 4
  %164 = load i32, i32* %pipe_out.addr, align 4
  %165 = load i32, i32* %async.addr, align 4
  %166 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %167 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags258 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %167, i32 0, i32 0
  %168 = load i32, i32* %flags258, align 4
  call void @execute_subshell_builtin_or_function(%struct.word_list* %158, %struct.redirect* %160, i32 (%struct.word_list*)* %161, %struct.variable* %162, i32 %163, i32 %164, i32 %165, %struct.fd_bitmap* %166, i32 %168)
  %169 = load i32, i32* @subshell_level, align 4
  %dec259 = add nsw i32 %169, -1
  store i32 %dec259, i32* @subshell_level, align 4
  br label %if.end300

if.else260:                                       ; preds = %if.end232
  %170 = load %struct.word_list*, %struct.word_list** %words, align 4
  %171 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %172 = load %struct.variable*, %struct.variable** %func, align 4
  %173 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects261 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %173, i32 0, i32 3
  %174 = load %struct.redirect*, %struct.redirect** %redirects261, align 4
  %175 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %176 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags262 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %176, i32 0, i32 0
  %177 = load i32, i32* %flags262, align 4
  %call263 = call i32 @execute_builtin_or_function(%struct.word_list* %170, i32 (%struct.word_list*)* %171, %struct.variable* %172, %struct.redirect* %174, %struct.fd_bitmap* %175, i32 %177)
  store i32 %call263, i32* %result, align 4
  %178 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %tobool264 = icmp ne i32 (%struct.word_list*)* %178, null
  br i1 %tobool264, label %if.then265, label %if.else289

if.then265:                                       ; preds = %if.else260
  %179 = load i32, i32* %result, align 4
  %cmp266 = icmp sgt i32 %179, 256
  br i1 %cmp266, label %if.then268, label %if.end281

if.then268:                                       ; preds = %if.then265
  %180 = load i32, i32* %result, align 4
  switch i32 %180, label %sw.epilog [
    i32 259, label %sw.bb
    i32 260, label %sw.bb
    i32 261, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.then268, %if.then268, %if.then268
  %181 = load i32, i32* @posixly_correct, align 4
  %tobool269 = icmp ne i32 %181, 0
  br i1 %tobool269, label %land.lhs.true270, label %if.end276

land.lhs.true270:                                 ; preds = %sw.bb
  %182 = load i32, i32* %builtin_is_special, align 4
  %tobool271 = icmp ne i32 %182, 0
  br i1 %tobool271, label %land.lhs.true272, label %if.end276

land.lhs.true272:                                 ; preds = %land.lhs.true270
  %183 = load i32, i32* @interactive_shell, align 4
  %cmp273 = icmp eq i32 %183, 0
  br i1 %cmp273, label %if.then275, label %if.end276

if.then275:                                       ; preds = %land.lhs.true272
  store volatile i32 1, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end276:                                        ; preds = %land.lhs.true272, %land.lhs.true270, %sw.bb
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end276, %if.then268
  %184 = load i32, i32* %result, align 4
  %call277 = call i32 @builtin_status(i32 %184)
  store i32 %call277, i32* %result, align 4
  %185 = load i32, i32* %builtin_is_special, align 4
  %tobool278 = icmp ne i32 %185, 0
  br i1 %tobool278, label %if.then279, label %if.end280

if.then279:                                       ; preds = %sw.epilog
  store i32 1, i32* @special_builtin_failed, align 4
  br label %if.end280

if.end280:                                        ; preds = %if.then279, %sw.epilog
  br label %if.end281

if.end281:                                        ; preds = %if.end280, %if.then265
  %186 = load i32, i32* @posixly_correct, align 4
  %tobool282 = icmp ne i32 %186, 0
  br i1 %tobool282, label %land.lhs.true283, label %if.end288

land.lhs.true283:                                 ; preds = %if.end281
  %187 = load i32, i32* %builtin_is_special, align 4
  %tobool284 = icmp ne i32 %187, 0
  br i1 %tobool284, label %land.lhs.true285, label %if.end288

land.lhs.true285:                                 ; preds = %land.lhs.true283
  %188 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool286 = icmp ne %struct.hash_table* %188, null
  br i1 %tobool286, label %if.then287, label %if.end288

if.then287:                                       ; preds = %land.lhs.true285
  call void @merge_temporary_env()
  br label %if.end288

if.end288:                                        ; preds = %if.then287, %land.lhs.true285, %land.lhs.true283, %if.end281
  br label %if.end299

if.else289:                                       ; preds = %if.else260
  %189 = load i32, i32* %result, align 4
  %cmp290 = icmp eq i32 %189, 258
  br i1 %cmp290, label %if.then292, label %if.else293

if.then292:                                       ; preds = %if.else289
  store i32 2, i32* %result, align 4
  br label %if.end298

if.else293:                                       ; preds = %if.else289
  %190 = load i32, i32* %result, align 4
  %cmp294 = icmp sgt i32 %190, 256
  br i1 %cmp294, label %if.then296, label %if.end297

if.then296:                                       ; preds = %if.else293
  store i32 1, i32* %result, align 4
  br label %if.end297

if.end297:                                        ; preds = %if.then296, %if.else293
  br label %if.end298

if.end298:                                        ; preds = %if.end297, %if.then292
  br label %if.end299

if.end299:                                        ; preds = %if.end298, %if.end288
  %191 = load i32, i32* %result, align 4
  call void @set_pipestatus_from_exit(i32 %191)
  br label %return_result

if.end300:                                        ; preds = %if.end256
  br label %if.end301

if.end301:                                        ; preds = %if.end300, %lor.lhs.false227
  %192 = load i32, i32* @autocd, align 4
  %tobool302 = icmp ne i32 %192, 0
  br i1 %tobool302, label %land.lhs.true303, label %if.end319

land.lhs.true303:                                 ; preds = %if.end301
  %193 = load i32, i32* @interactive, align 4
  %tobool304 = icmp ne i32 %193, 0
  br i1 %tobool304, label %land.lhs.true305, label %if.end319

land.lhs.true305:                                 ; preds = %land.lhs.true303
  %194 = load %struct.word_list*, %struct.word_list** %words, align 4
  %word306 = getelementptr inbounds %struct.word_list, %struct.word_list* %194, i32 0, i32 1
  %195 = load %struct.word_desc*, %struct.word_desc** %word306, align 4
  %tobool307 = icmp ne %struct.word_desc* %195, null
  br i1 %tobool307, label %land.lhs.true308, label %if.end319

land.lhs.true308:                                 ; preds = %land.lhs.true305
  %196 = load %struct.word_list*, %struct.word_list** %words, align 4
  %word309 = getelementptr inbounds %struct.word_list, %struct.word_list* %196, i32 0, i32 1
  %197 = load %struct.word_desc*, %struct.word_desc** %word309, align 4
  %word310 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %197, i32 0, i32 0
  %198 = load i8*, i8** %word310, align 4
  %call311 = call i32 @is_dirname(i8* %198)
  %tobool312 = icmp ne i32 %call311, 0
  br i1 %tobool312, label %if.then313, label %if.end319

if.then313:                                       ; preds = %land.lhs.true308
  %call314 = call %struct.word_desc* @make_word(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.41, i32 0, i32 0))
  %199 = load %struct.word_list*, %struct.word_list** %words, align 4
  %call315 = call %struct.word_list* @make_word_list(%struct.word_desc* %call314, %struct.word_list* %199)
  store %struct.word_list* %call315, %struct.word_list** %words, align 4
  %call316 = call %struct.word_desc* @make_word(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.42, i32 0, i32 0))
  %200 = load %struct.word_list*, %struct.word_list** %words, align 4
  %call317 = call %struct.word_list* @make_word_list(%struct.word_desc* %call316, %struct.word_list* %200)
  store %struct.word_list* %call317, %struct.word_list** %words, align 4
  %201 = load %struct.word_list*, %struct.word_list** %words, align 4
  call void @xtrace_print_word_list(%struct.word_list* %201, i32 0)
  %call318 = call %struct.variable* @find_function(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.42, i32 0, i32 0))
  store %struct.variable* %call318, %struct.variable** %func, align 4
  br label %run_builtin

if.end319:                                        ; preds = %land.lhs.true308, %land.lhs.true305, %land.lhs.true303, %if.end301
  %202 = load i8*, i8** %command_line, align 4
  %cmp320 = icmp eq i8* %202, null
  br i1 %cmp320, label %if.then322, label %if.end337

if.then322:                                       ; preds = %if.end319
  %203 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool323 = icmp ne i8* %203, null
  br i1 %tobool323, label %cond.true324, label %cond.false325

cond.true324:                                     ; preds = %if.then322
  %204 = load i8*, i8** @the_printed_command_except_trap, align 4
  br label %cond.end326

cond.false325:                                    ; preds = %if.then322
  br label %cond.end326

cond.end326:                                      ; preds = %cond.false325, %cond.true324
  %cond327 = phi i8* [ %204, %cond.true324 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), %cond.false325 ]
  %call328 = call i32 @strlen(i8* %cond327)
  %add329 = add i32 1, %call328
  %call330 = call i8* @sh_xmalloc(i32 %add329, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4383)
  %205 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool331 = icmp ne i8* %205, null
  br i1 %tobool331, label %cond.true332, label %cond.false333

cond.true332:                                     ; preds = %cond.end326
  %206 = load i8*, i8** @the_printed_command_except_trap, align 4
  br label %cond.end334

cond.false333:                                    ; preds = %cond.end326
  br label %cond.end334

cond.end334:                                      ; preds = %cond.false333, %cond.true332
  %cond335 = phi i8* [ %206, %cond.true332 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), %cond.false333 ]
  %call336 = call i8* @strcpy(i8* %call330, i8* %cond335)
  store i8* %call336, i8** %command_line, align 4
  br label %if.end337

if.end337:                                        ; preds = %cond.end334, %if.end319
  %207 = load i32, i32* %already_forked, align 4
  %cmp338 = icmp eq i32 %207, 0
  br i1 %cmp338, label %land.lhs.true340, label %if.end351

land.lhs.true340:                                 ; preds = %if.end337
  %208 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags341 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %208, i32 0, i32 0
  %209 = load i32, i32* %flags341, align 4
  %and342 = and i32 %209, 64
  %tobool343 = icmp ne i32 %and342, 0
  br i1 %tobool343, label %land.lhs.true344, label %if.end351

land.lhs.true344:                                 ; preds = %land.lhs.true340
  %call345 = call i32 @fifos_pending()
  %cmp346 = icmp sgt i32 %call345, 0
  br i1 %cmp346, label %if.then348, label %if.end351

if.then348:                                       ; preds = %land.lhs.true344
  %210 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags349 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %210, i32 0, i32 0
  %211 = load i32, i32* %flags349, align 4
  %and350 = and i32 %211, -65
  store i32 %and350, i32* %flags349, align 4
  br label %if.end351

if.end351:                                        ; preds = %if.then348, %land.lhs.true344, %land.lhs.true340, %if.end337
  %212 = load %struct.word_list*, %struct.word_list** %words, align 4
  %213 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects352 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %213, i32 0, i32 3
  %214 = load %struct.redirect*, %struct.redirect** %redirects352, align 4
  %215 = load i8*, i8** %command_line, align 4
  %216 = load i32, i32* %pipe_in.addr, align 4
  %217 = load i32, i32* %pipe_out.addr, align 4
  %218 = load i32, i32* %async.addr, align 4
  %219 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %220 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %flags353 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %220, i32 0, i32 0
  %221 = load i32, i32* %flags353, align 4
  %call354 = call i32 @execute_disk_command(%struct.word_list* %212, %struct.redirect* %214, i8* %215, i32 %216, i32 %217, i32 %218, %struct.fd_bitmap* %219, i32 %221)
  store i32 %call354, i32* %result, align 4
  br label %return_result

return_result:                                    ; preds = %if.end351, %if.end299
  %222 = load i8*, i8** %lastarg, align 4
  call void @bind_lastarg(i8* %222)
  br label %do.body355

do.body355:                                       ; preds = %return_result
  %223 = load i8*, i8** %command_line, align 4
  %tobool356 = icmp ne i8* %223, null
  br i1 %tobool356, label %if.then357, label %if.end358

if.then357:                                       ; preds = %do.body355
  %224 = load i8*, i8** %command_line, align 4
  call void @sh_xfree(i8* %224, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4398)
  br label %if.end358

if.end358:                                        ; preds = %if.then357, %do.body355
  br label %do.end359

do.end359:                                        ; preds = %if.end358
  %225 = load %struct.word_list*, %struct.word_list** %words, align 4
  call void @dispose_words(%struct.word_list* %225)
  %226 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin, align 4
  %tobool360 = icmp ne i32 (%struct.word_list*)* %226, null
  br i1 %tobool360, label %if.then361, label %if.end362

if.then361:                                       ; preds = %do.end359
  %227 = load volatile i32, i32* %old_builtin, align 4
  store i32 %227, i32* @executing_builtin, align 4
  %228 = load volatile i32, i32* %old_command_builtin, align 4
  store i32 %228, i32* @executing_command_builtin, align 4
  br label %if.end362

if.end362:                                        ; preds = %if.then361, %do.end359
  call void @discard_unwind_frame(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.40, i32 0, i32 0))
  store i8* null, i8** @this_command_name, align 4
  %229 = load i32, i32* %result, align 4
  store i32 %229, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end362, %if.else159, %if.end114, %if.then30
  %230 = load i32, i32* %retval, align 4
  ret i32 %230
}

declare void @dispose_used_env_vars() #1

declare i32 @unwind_protect_tag_on_stack(i8*) #1

declare void @run_unwind_frame(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_for_command(%struct.for_com* %for_command) #0 {
entry:
  %retval = alloca i32, align 4
  %for_command.addr = alloca %struct.for_com*, align 4
  %releaser = alloca %struct.word_list*, align 4
  %list = alloca %struct.word_list*, align 4
  %v = alloca %struct.variable*, align 4
  %identifier = alloca i8*, align 4
  %retval1 = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  store %struct.for_com* %for_command, %struct.for_com** %for_command.addr, align 4
  %0 = load i32, i32* @line_number, align 4
  store i32 %0, i32* %save_line_number, align 4
  %1 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %name = getelementptr inbounds %struct.for_com, %struct.for_com* %1, i32 0, i32 2
  %2 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %call = call i32 @check_identifier(%struct.word_desc* %2, i32 1)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %4 = load i32, i32* @interactive_shell, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %land.lhs.true
  store volatile i32 2, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end:                                           ; preds = %land.lhs.true, %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %entry
  %5 = load i32, i32* @loop_level, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @loop_level, align 4
  %6 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %name5 = getelementptr inbounds %struct.for_com, %struct.for_com* %6, i32 0, i32 2
  %7 = load %struct.word_desc*, %struct.word_desc** %name5, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word, align 4
  store i8* %8, i8** %identifier, align 4
  %9 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %line = getelementptr inbounds %struct.for_com, %struct.for_com* %9, i32 0, i32 1
  %10 = load i32, i32* %line, align 4
  store i32 %10, i32* @line_number, align 4
  %11 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %map_list = getelementptr inbounds %struct.for_com, %struct.for_com* %11, i32 0, i32 3
  %12 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  %call6 = call %struct.word_list* @expand_words_no_vars(%struct.word_list* %12)
  store %struct.word_list* %call6, %struct.word_list** %releaser, align 4
  store %struct.word_list* %call6, %struct.word_list** %list, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i32 0, i32 0))
  %13 = load %struct.word_list*, %struct.word_list** %releaser, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.word_list*)*, %struct.word_list*)*)(void (%struct.word_list*)* @dispose_words, %struct.word_list* %13)
  %14 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %flags = getelementptr inbounds %struct.for_com, %struct.for_com* %14, i32 0, i32 0
  %15 = load i32, i32* %flags, align 4
  %and = and i32 %15, 8
  %tobool7 = icmp ne i32 %and, 0
  br i1 %tobool7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end4
  %16 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %action = getelementptr inbounds %struct.for_com, %struct.for_com* %16, i32 0, i32 4
  %17 = load %struct.command*, %struct.command** %action, align 4
  %flags9 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 1
  %18 = load i32, i32* %flags9, align 4
  %or = or i32 %18, 8
  store i32 %or, i32* %flags9, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end4
  store i32 0, i32* %retval1, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end10
  %19 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool11 = icmp ne %struct.word_list* %19, null
  br i1 %tobool11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %for.body
  %20 = load volatile i32, i32* @terminating_signal, align 4
  %tobool12 = icmp ne i32 %20, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %do.body
  %21 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %21)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %do.body
  %22 = load volatile i32, i32* @interrupt_state, align 4
  %tobool15 = icmp ne i32 %22, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  call void @throw_to_top_level()
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end14
  br label %do.end

do.end:                                           ; preds = %if.end17
  %23 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %line18 = getelementptr inbounds %struct.for_com, %struct.for_com* %23, i32 0, i32 1
  %24 = load i32, i32* %line18, align 4
  store i32 %24, i32* @line_number, align 4
  store i32 0, i32* @command_string_index, align 4
  %25 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  call void @print_for_command_head(%struct.for_com* %25)
  %26 = load i32, i32* @echo_command_at_execute, align 4
  %tobool19 = icmp ne i32 %26, 0
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %do.end
  %27 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  call void @xtrace_print_for_command_head(%struct.for_com* %27)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %do.end
  %call22 = call i32 @signal_in_progress(i32 65)
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %land.lhs.true24, label %if.end35

land.lhs.true24:                                  ; preds = %if.end21
  %28 = load i32, i32* @running_trap, align 4
  %cmp25 = icmp eq i32 %28, 0
  br i1 %cmp25, label %if.then26, label %if.end35

if.then26:                                        ; preds = %land.lhs.true24
  br label %do.body27

do.body27:                                        ; preds = %if.then26
  %29 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool28 = icmp ne i8* %29, null
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %do.body27
  %30 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %30, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2760)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %do.body27
  br label %do.end31

do.end31:                                         ; preds = %if.end30
  %31 = load i8*, i8** @the_printed_command, align 4
  %call32 = call i32 @strlen(i8* %31)
  %add = add i32 1, %call32
  %call33 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2761)
  %32 = load i8*, i8** @the_printed_command, align 4
  %call34 = call i8* @strcpy(i8* %call33, i8* %32)
  store i8* %call34, i8** @the_printed_command_except_trap, align 4
  br label %if.end35

if.end35:                                         ; preds = %do.end31, %land.lhs.true24, %if.end21
  %call36 = call i32 @run_debug_trap()
  store i32 %call36, i32* %retval1, align 4
  %33 = load i32, i32* @debugging_mode, align 4
  %tobool37 = icmp ne i32 %33, 0
  br i1 %tobool37, label %land.lhs.true38, label %if.end41

land.lhs.true38:                                  ; preds = %if.end35
  %34 = load i32, i32* %retval1, align 4
  %cmp39 = icmp ne i32 %34, 0
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %land.lhs.true38
  br label %for.inc

if.end41:                                         ; preds = %land.lhs.true38, %if.end35
  store i8* null, i8** @this_command_name, align 4
  %35 = load i8*, i8** %identifier, align 4
  %call42 = call %struct.variable* @find_variable_last_nameref(i8* %35, i32 1)
  store %struct.variable* %call42, %struct.variable** %v, align 4
  %36 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool43 = icmp ne %struct.variable* %36, null
  br i1 %tobool43, label %land.lhs.true44, label %if.else59

land.lhs.true44:                                  ; preds = %if.end41
  %37 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %37, i32 0, i32 5
  %38 = load i32, i32* %attributes, align 4
  %and45 = and i32 %38, 2048
  %tobool46 = icmp ne i32 %and45, 0
  br i1 %tobool46, label %if.then47, label %if.else59

if.then47:                                        ; preds = %land.lhs.true44
  %39 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word48 = getelementptr inbounds %struct.word_list, %struct.word_list* %39, i32 0, i32 1
  %40 = load %struct.word_desc*, %struct.word_desc** %word48, align 4
  %word49 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %40, i32 0, i32 0
  %41 = load i8*, i8** %word49, align 4
  %call50 = call i32 @valid_nameref_value(i8* %41, i32 1)
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %if.then52, label %if.else

if.then52:                                        ; preds = %if.then47
  %42 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word53 = getelementptr inbounds %struct.word_list, %struct.word_list* %42, i32 0, i32 1
  %43 = load %struct.word_desc*, %struct.word_desc** %word53, align 4
  %word54 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %43, i32 0, i32 0
  %44 = load i8*, i8** %word54, align 4
  call void @sh_invalidid(i8* %44)
  store %struct.variable* null, %struct.variable** %v, align 4
  br label %if.end58

if.else:                                          ; preds = %if.then47
  %45 = load %struct.variable*, %struct.variable** %v, align 4
  %46 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word55 = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 1
  %47 = load %struct.word_desc*, %struct.word_desc** %word55, align 4
  %word56 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %47, i32 0, i32 0
  %48 = load i8*, i8** %word56, align 4
  %call57 = call %struct.variable* @bind_variable_value(%struct.variable* %45, i8* %48, i32 0)
  store %struct.variable* %call57, %struct.variable** %v, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.else, %if.then52
  br label %if.end63

if.else59:                                        ; preds = %land.lhs.true44, %if.end41
  %49 = load i8*, i8** %identifier, align 4
  %50 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word60 = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 1
  %51 = load %struct.word_desc*, %struct.word_desc** %word60, align 4
  %word61 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %51, i32 0, i32 0
  %52 = load i8*, i8** %word61, align 4
  %call62 = call %struct.variable* @bind_variable(i8* %49, i8* %52, i32 0)
  store %struct.variable* %call62, %struct.variable** %v, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.else59, %if.end58
  %53 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp64 = icmp eq %struct.variable* %53, null
  br i1 %cmp64, label %if.then72, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end63
  %54 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes65 = getelementptr inbounds %struct.variable, %struct.variable* %54, i32 0, i32 5
  %55 = load i32, i32* %attributes65, align 4
  %and66 = and i32 %55, 2
  %tobool67 = icmp ne i32 %and66, 0
  br i1 %tobool67, label %if.then72, label %lor.lhs.false68

lor.lhs.false68:                                  ; preds = %lor.lhs.false
  %56 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes69 = getelementptr inbounds %struct.variable, %struct.variable* %56, i32 0, i32 5
  %57 = load i32, i32* %attributes69, align 4
  %and70 = and i32 %57, 16384
  %tobool71 = icmp ne i32 %and70, 0
  br i1 %tobool71, label %if.then72, label %if.end84

if.then72:                                        ; preds = %lor.lhs.false68, %lor.lhs.false, %if.end63
  %58 = load i32, i32* %save_line_number, align 4
  store i32 %58, i32* @line_number, align 4
  %59 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool73 = icmp ne %struct.variable* %59, null
  br i1 %tobool73, label %land.lhs.true74, label %if.else83

land.lhs.true74:                                  ; preds = %if.then72
  %60 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes75 = getelementptr inbounds %struct.variable, %struct.variable* %60, i32 0, i32 5
  %61 = load i32, i32* %attributes75, align 4
  %and76 = and i32 %61, 2
  %tobool77 = icmp ne i32 %and76, 0
  br i1 %tobool77, label %land.lhs.true78, label %if.else83

land.lhs.true78:                                  ; preds = %land.lhs.true74
  %62 = load i32, i32* @interactive_shell, align 4
  %cmp79 = icmp eq i32 %62, 0
  br i1 %cmp79, label %land.lhs.true80, label %if.else83

land.lhs.true80:                                  ; preds = %land.lhs.true78
  %63 = load i32, i32* @posixly_correct, align 4
  %tobool81 = icmp ne i32 %63, 0
  br i1 %tobool81, label %if.then82, label %if.else83

if.then82:                                        ; preds = %land.lhs.true80
  store volatile i32 1, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 1) #5
  unreachable

if.else83:                                        ; preds = %land.lhs.true80, %land.lhs.true78, %land.lhs.true74, %if.then72
  %64 = load %struct.word_list*, %struct.word_list** %releaser, align 4
  call void @dispose_words(%struct.word_list* %64)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i32 0, i32 0))
  %65 = load i32, i32* @loop_level, align 4
  %dec = add nsw i32 %65, -1
  store i32 %dec, i32* @loop_level, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end84:                                         ; preds = %lor.lhs.false68
  %66 = load i8*, i8** %identifier, align 4
  %arrayidx = getelementptr inbounds i8, i8* %66, i32 0
  %67 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %67 to i32
  %cmp85 = icmp eq i32 %conv, 73
  br i1 %cmp85, label %land.lhs.true87, label %if.end103

land.lhs.true87:                                  ; preds = %if.end84
  %68 = load i8*, i8** %identifier, align 4
  %arrayidx88 = getelementptr inbounds i8, i8* %68, i32 1
  %69 = load i8, i8* %arrayidx88, align 1
  %conv89 = sext i8 %69 to i32
  %cmp90 = icmp eq i32 %conv89, 70
  br i1 %cmp90, label %land.lhs.true92, label %if.end103

land.lhs.true92:                                  ; preds = %land.lhs.true87
  %70 = load i8*, i8** %identifier, align 4
  %arrayidx93 = getelementptr inbounds i8, i8* %70, i32 2
  %71 = load i8, i8* %arrayidx93, align 1
  %conv94 = sext i8 %71 to i32
  %cmp95 = icmp eq i32 %conv94, 83
  br i1 %cmp95, label %land.lhs.true97, label %if.end103

land.lhs.true97:                                  ; preds = %land.lhs.true92
  %72 = load i8*, i8** %identifier, align 4
  %arrayidx98 = getelementptr inbounds i8, i8* %72, i32 3
  %73 = load i8, i8* %arrayidx98, align 1
  %conv99 = sext i8 %73 to i32
  %cmp100 = icmp eq i32 %conv99, 0
  br i1 %cmp100, label %if.then102, label %if.end103

if.then102:                                       ; preds = %land.lhs.true97
  %74 = load %struct.variable*, %struct.variable** %v, align 4
  call void @setifs(%struct.variable* %74)
  br label %if.end103

if.end103:                                        ; preds = %if.then102, %land.lhs.true97, %land.lhs.true92, %land.lhs.true87, %if.end84
  %75 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %action104 = getelementptr inbounds %struct.for_com, %struct.for_com* %75, i32 0, i32 4
  %76 = load %struct.command*, %struct.command** %action104, align 4
  %call105 = call i32 @execute_command(%struct.command* %76)
  store i32 %call105, i32* %retval1, align 4
  br label %do.body106

do.body106:                                       ; preds = %if.end103
  %77 = load i32, i32* @job_control, align 4
  %cmp107 = icmp eq i32 %77, 0
  br i1 %cmp107, label %if.then112, label %lor.lhs.false109

lor.lhs.false109:                                 ; preds = %do.body106
  %78 = load i32, i32* @interactive_shell, align 4
  %cmp110 = icmp eq i32 %78, 0
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %lor.lhs.false109, %do.body106
  call void @reap_dead_jobs()
  br label %if.end113

if.end113:                                        ; preds = %if.then112, %lor.lhs.false109
  br label %do.end114

do.end114:                                        ; preds = %if.end113
  br label %do.body115

do.body115:                                       ; preds = %do.end114
  %79 = load volatile i32, i32* @terminating_signal, align 4
  %tobool116 = icmp ne i32 %79, 0
  br i1 %tobool116, label %if.then117, label %if.end118

if.then117:                                       ; preds = %do.body115
  %80 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %80)
  br label %if.end118

if.end118:                                        ; preds = %if.then117, %do.body115
  %81 = load volatile i32, i32* @interrupt_state, align 4
  %tobool119 = icmp ne i32 %81, 0
  br i1 %tobool119, label %if.then120, label %if.end121

if.then120:                                       ; preds = %if.end118
  call void @throw_to_top_level()
  br label %if.end121

if.end121:                                        ; preds = %if.then120, %if.end118
  br label %do.end122

do.end122:                                        ; preds = %if.end121
  %82 = load i32, i32* @breaking, align 4
  %tobool123 = icmp ne i32 %82, 0
  br i1 %tobool123, label %if.then124, label %if.end126

if.then124:                                       ; preds = %do.end122
  %83 = load i32, i32* @breaking, align 4
  %dec125 = add nsw i32 %83, -1
  store i32 %dec125, i32* @breaking, align 4
  br label %for.end

if.end126:                                        ; preds = %do.end122
  %84 = load i32, i32* @continuing, align 4
  %tobool127 = icmp ne i32 %84, 0
  br i1 %tobool127, label %if.then128, label %if.end133

if.then128:                                       ; preds = %if.end126
  %85 = load i32, i32* @continuing, align 4
  %dec129 = add nsw i32 %85, -1
  store i32 %dec129, i32* @continuing, align 4
  %86 = load i32, i32* @continuing, align 4
  %tobool130 = icmp ne i32 %86, 0
  br i1 %tobool130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.then128
  br label %for.end

if.end132:                                        ; preds = %if.then128
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %if.end126
  br label %for.inc

for.inc:                                          ; preds = %if.end133, %if.then40
  %87 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %87, i32 0, i32 0
  %88 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %88, %struct.word_list** %list, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then131, %if.then124, %for.cond
  %89 = load i32, i32* @loop_level, align 4
  %dec134 = add nsw i32 %89, -1
  store i32 %dec134, i32* @loop_level, align 4
  %90 = load i32, i32* %save_line_number, align 4
  store i32 %90, i32* @line_number, align 4
  %91 = load %struct.word_list*, %struct.word_list** %releaser, align 4
  call void @dispose_words(%struct.word_list* %91)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.27, i32 0, i32 0))
  %92 = load i32, i32* %retval1, align 4
  store i32 %92, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.else83, %if.end
  %93 = load i32, i32* %retval, align 4
  ret i32 %93
}

; Function Attrs: noinline nounwind
define internal i32 @execute_arith_for_command(%struct.arith_for_com* %arith_for_command) #0 {
entry:
  %retval = alloca i32, align 4
  %arith_for_command.addr = alloca %struct.arith_for_com*, align 4
  %expresult = alloca i64, align 8
  %expok = alloca i32, align 4
  %body_status = alloca i32, align 4
  %arith_lineno = alloca i32, align 4
  %save_lineno = alloca i32, align 4
  store %struct.arith_for_com* %arith_for_command, %struct.arith_for_com** %arith_for_command.addr, align 4
  store i32 0, i32* %body_status, align 4
  %0 = load i32, i32* @loop_level, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @loop_level, align 4
  %1 = load i32, i32* @line_number, align 4
  store i32 %1, i32* %save_lineno, align 4
  %2 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %flags = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %2, i32 0, i32 0
  %3 = load i32, i32* %flags, align 4
  %and = and i32 %3, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %action = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %4, i32 0, i32 5
  %5 = load %struct.command*, %struct.command** %action, align 4
  %flags1 = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 1
  %6 = load i32, i32* %flags1, align 4
  %or = or i32 %6, 8
  store i32 %or, i32* %flags1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8** @this_command_name, align 4
  %7 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %line = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %7, i32 0, i32 1
  %8 = load i32, i32* %line, align 4
  store i32 %8, i32* %arith_lineno, align 4
  store i32 %8, i32* @line_number, align 4
  %9 = load i32, i32* @variable_context, align 4
  %tobool2 = icmp ne i32 %9, 0
  br i1 %tobool2, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end
  %10 = load i32, i32* @interactive_shell, align 4
  %tobool3 = icmp ne i32 %10, 0
  br i1 %tobool3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %land.lhs.true
  %11 = load i32, i32* @function_line_number, align 4
  %12 = load i32, i32* @line_number, align 4
  %sub = sub nsw i32 %12, %11
  store i32 %sub, i32* @line_number, align 4
  %13 = load i32, i32* @line_number, align 4
  %cmp = icmp slt i32 %13, 0
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.then4
  store i32 0, i32* @line_number, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %land.lhs.true, %if.end
  %14 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %init = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %14, i32 0, i32 2
  %15 = load %struct.word_list*, %struct.word_list** %init, align 4
  %call = call i64 @eval_arith_for_expr(%struct.word_list* %15, i32* %expok)
  store i64 %call, i64* %expresult, align 8
  %16 = load i32, i32* %expok, align 4
  %cmp8 = icmp eq i32 %16, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  %17 = load i32, i32* %save_lineno, align 4
  store i32 %17, i32* @line_number, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end7
  br label %while.body

while.body:                                       ; preds = %if.end10, %if.end53
  %18 = load i32, i32* %arith_lineno, align 4
  store i32 %18, i32* @line_number, align 4
  %19 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %test = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %19, i32 0, i32 3
  %20 = load %struct.word_list*, %struct.word_list** %test, align 4
  %call11 = call i64 @eval_arith_for_expr(%struct.word_list* %20, i32* %expok)
  store i64 %call11, i64* %expresult, align 8
  %21 = load i32, i32* %save_lineno, align 4
  store i32 %21, i32* @line_number, align 4
  %22 = load i32, i32* %expok, align 4
  %cmp12 = icmp eq i32 %22, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.body
  store i32 1, i32* %body_status, align 4
  br label %while.end

if.end14:                                         ; preds = %while.body
  br label %do.body

do.body:                                          ; preds = %if.end14
  %23 = load i32, i32* @job_control, align 4
  %cmp15 = icmp eq i32 %23, 0
  br i1 %cmp15, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.body
  %24 = load i32, i32* @interactive_shell, align 4
  %cmp16 = icmp eq i32 %24, 0
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %lor.lhs.false, %do.body
  call void @reap_dead_jobs()
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %lor.lhs.false
  br label %do.end

do.end:                                           ; preds = %if.end18
  %25 = load i64, i64* %expresult, align 8
  %cmp19 = icmp eq i64 %25, 0
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %do.end
  br label %while.end

if.end21:                                         ; preds = %do.end
  br label %do.body22

do.body22:                                        ; preds = %if.end21
  %26 = load volatile i32, i32* @terminating_signal, align 4
  %tobool23 = icmp ne i32 %26, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %do.body22
  %27 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %27)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %do.body22
  %28 = load volatile i32, i32* @interrupt_state, align 4
  %tobool26 = icmp ne i32 %28, 0
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end25
  call void @throw_to_top_level()
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.end25
  br label %do.end29

do.end29:                                         ; preds = %if.end28
  %29 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %action30 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %29, i32 0, i32 5
  %30 = load %struct.command*, %struct.command** %action30, align 4
  %call31 = call i32 @execute_command(%struct.command* %30)
  store i32 %call31, i32* %body_status, align 4
  br label %do.body32

do.body32:                                        ; preds = %do.end29
  %31 = load volatile i32, i32* @terminating_signal, align 4
  %tobool33 = icmp ne i32 %31, 0
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %do.body32
  %32 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %32)
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %do.body32
  %33 = load volatile i32, i32* @interrupt_state, align 4
  %tobool36 = icmp ne i32 %33, 0
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end35
  call void @throw_to_top_level()
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end35
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  %34 = load i32, i32* @breaking, align 4
  %tobool40 = icmp ne i32 %34, 0
  br i1 %tobool40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %do.end39
  %35 = load i32, i32* @breaking, align 4
  %dec = add nsw i32 %35, -1
  store i32 %dec, i32* @breaking, align 4
  br label %while.end

if.end42:                                         ; preds = %do.end39
  %36 = load i32, i32* @continuing, align 4
  %tobool43 = icmp ne i32 %36, 0
  br i1 %tobool43, label %if.then44, label %if.end49

if.then44:                                        ; preds = %if.end42
  %37 = load i32, i32* @continuing, align 4
  %dec45 = add nsw i32 %37, -1
  store i32 %dec45, i32* @continuing, align 4
  %38 = load i32, i32* @continuing, align 4
  %tobool46 = icmp ne i32 %38, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.then44
  br label %while.end

if.end48:                                         ; preds = %if.then44
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end42
  %39 = load i32, i32* %arith_lineno, align 4
  store i32 %39, i32* @line_number, align 4
  %40 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %step = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %40, i32 0, i32 4
  %41 = load %struct.word_list*, %struct.word_list** %step, align 4
  %call50 = call i64 @eval_arith_for_expr(%struct.word_list* %41, i32* %expok)
  store i64 %call50, i64* %expresult, align 8
  %42 = load i32, i32* %save_lineno, align 4
  store i32 %42, i32* @line_number, align 4
  %43 = load i32, i32* %expok, align 4
  %cmp51 = icmp eq i32 %43, 0
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  store i32 1, i32* %body_status, align 4
  br label %while.end

if.end53:                                         ; preds = %if.end49
  br label %while.body

while.end:                                        ; preds = %if.then52, %if.then47, %if.then41, %if.then20, %if.then13
  %44 = load i32, i32* @loop_level, align 4
  %dec54 = add nsw i32 %44, -1
  store i32 %dec54, i32* @loop_level, align 4
  %45 = load i32, i32* %save_lineno, align 4
  store i32 %45, i32* @line_number, align 4
  %46 = load i32, i32* %body_status, align 4
  store i32 %46, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then9
  %47 = load i32, i32* %retval, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind
define internal i32 @execute_select_command(%struct.select_com* %select_command) #0 {
entry:
  %retval = alloca i32, align 4
  %select_command.addr = alloca %struct.select_com*, align 4
  %releaser = alloca %struct.word_list*, align 4
  %list = alloca %struct.word_list*, align 4
  %v = alloca %struct.variable*, align 4
  %identifier = alloca i8*, align 4
  %ps3_prompt = alloca i8*, align 4
  %selection = alloca i8*, align 4
  %retval1 = alloca i32, align 4
  %list_len = alloca i32, align 4
  %show_menu = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  store %struct.select_com* %select_command, %struct.select_com** %select_command.addr, align 4
  %0 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %name = getelementptr inbounds %struct.select_com, %struct.select_com* %0, i32 0, i32 2
  %1 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %call = call i32 @check_identifier(%struct.word_desc* %1, i32 1)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @line_number, align 4
  store i32 %2, i32* %save_line_number, align 4
  %3 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %line = getelementptr inbounds %struct.select_com, %struct.select_com* %3, i32 0, i32 1
  %4 = load i32, i32* %line, align 4
  store i32 %4, i32* @line_number, align 4
  store i32 0, i32* @command_string_index, align 4
  %5 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  call void @print_select_command_head(%struct.select_com* %5)
  %6 = load i32, i32* @echo_command_at_execute, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %7 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  call void @xtrace_print_select_command_head(%struct.select_com* %7)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %call4 = call i32 @signal_in_progress(i32 65)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.end3
  %8 = load i32, i32* @running_trap, align 4
  %cmp6 = icmp eq i32 %8, 0
  br i1 %cmp6, label %if.then7, label %if.end14

if.then7:                                         ; preds = %land.lhs.true
  br label %do.body

do.body:                                          ; preds = %if.then7
  %9 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool8 = icmp ne i8* %9, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  %10 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3234)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %11 = load i8*, i8** @the_printed_command, align 4
  %call11 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call11
  %call12 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3235)
  %12 = load i8*, i8** @the_printed_command, align 4
  %call13 = call i8* @strcpy(i8* %call12, i8* %12)
  store i8* %call13, i8** @the_printed_command_except_trap, align 4
  br label %if.end14

if.end14:                                         ; preds = %do.end, %land.lhs.true, %if.end3
  %call15 = call i32 @run_debug_trap()
  store i32 %call15, i32* %retval1, align 4
  %13 = load i32, i32* @debugging_mode, align 4
  %tobool16 = icmp ne i32 %13, 0
  br i1 %tobool16, label %land.lhs.true17, label %if.end20

land.lhs.true17:                                  ; preds = %if.end14
  %14 = load i32, i32* %retval1, align 4
  %cmp18 = icmp ne i32 %14, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true17
  store i32 0, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %land.lhs.true17, %if.end14
  %15 = load i32, i32* @loop_level, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* @loop_level, align 4
  %16 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %name21 = getelementptr inbounds %struct.select_com, %struct.select_com* %16, i32 0, i32 2
  %17 = load %struct.word_desc*, %struct.word_desc** %name21, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word, align 4
  store i8* %18, i8** %identifier, align 4
  %19 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %map_list = getelementptr inbounds %struct.select_com, %struct.select_com* %19, i32 0, i32 3
  %20 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  %call22 = call %struct.word_list* @expand_words_no_vars(%struct.word_list* %20)
  store %struct.word_list* %call22, %struct.word_list** %releaser, align 4
  store %struct.word_list* %call22, %struct.word_list** %list, align 4
  %21 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call23 = call i32 bitcast (i32 (...)* @list_length to i32 (%struct.word_list*)*)(%struct.word_list* %21)
  store i32 %call23, i32* %list_len, align 4
  %22 = load %struct.word_list*, %struct.word_list** %list, align 4
  %cmp24 = icmp eq %struct.word_list* %22, null
  br i1 %cmp24, label %if.then26, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end20
  %23 = load i32, i32* %list_len, align 4
  %cmp25 = icmp eq i32 %23, 0
  br i1 %cmp25, label %if.then26, label %if.end30

if.then26:                                        ; preds = %lor.lhs.false, %if.end20
  %24 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool27 = icmp ne %struct.word_list* %24, null
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.then26
  %25 = load %struct.word_list*, %struct.word_list** %list, align 4
  call void @dispose_words(%struct.word_list* %25)
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.then26
  %26 = load i32, i32* %save_line_number, align 4
  store i32 %26, i32* @line_number, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %lor.lhs.false
  call void @begin_unwind_frame(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0))
  %27 = load %struct.word_list*, %struct.word_list** %releaser, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.word_list*)*, %struct.word_list*)*)(void (%struct.word_list*)* @dispose_words, %struct.word_list* %27)
  %28 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %flags = getelementptr inbounds %struct.select_com, %struct.select_com* %28, i32 0, i32 0
  %29 = load i32, i32* %flags, align 4
  %and = and i32 %29, 8
  %tobool31 = icmp ne i32 %and, 0
  br i1 %tobool31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end30
  %30 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %action = getelementptr inbounds %struct.select_com, %struct.select_com* %30, i32 0, i32 4
  %31 = load %struct.command*, %struct.command** %action, align 4
  %flags33 = getelementptr inbounds %struct.command, %struct.command* %31, i32 0, i32 1
  %32 = load i32, i32* %flags33, align 4
  %or = or i32 %32, 8
  store i32 %or, i32* %flags33, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.end30
  store i32 0, i32* %retval1, align 4
  store i32 1, i32* %show_menu, align 4
  br label %while.body

while.body:                                       ; preds = %if.end34, %if.end115
  %33 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %line35 = getelementptr inbounds %struct.select_com, %struct.select_com* %33, i32 0, i32 1
  %34 = load i32, i32* %line35, align 4
  store i32 %34, i32* @line_number, align 4
  %call36 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0))
  store i8* %call36, i8** %ps3_prompt, align 4
  %35 = load i8*, i8** %ps3_prompt, align 4
  %cmp37 = icmp eq i8* %35, null
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %while.body
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.31, i32 0, i32 0), i8** %ps3_prompt, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %while.body
  br label %do.body40

do.body40:                                        ; preds = %if.end39
  %36 = load volatile i32, i32* @terminating_signal, align 4
  %tobool41 = icmp ne i32 %36, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %do.body40
  %37 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %37)
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %do.body40
  %38 = load volatile i32, i32* @interrupt_state, align 4
  %tobool44 = icmp ne i32 %38, 0
  br i1 %tobool44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end43
  call void @throw_to_top_level()
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %if.end43
  br label %do.end47

do.end47:                                         ; preds = %if.end46
  %39 = load %struct.word_list*, %struct.word_list** %list, align 4
  %40 = load i32, i32* %list_len, align 4
  %41 = load i8*, i8** %ps3_prompt, align 4
  %42 = load i32, i32* %show_menu, align 4
  %call48 = call i8* @select_query(%struct.word_list* %39, i32 %40, i8* %41, i32 %42)
  store i8* %call48, i8** %selection, align 4
  br label %do.body49

do.body49:                                        ; preds = %do.end47
  %43 = load volatile i32, i32* @terminating_signal, align 4
  %tobool50 = icmp ne i32 %43, 0
  br i1 %tobool50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %do.body49
  %44 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %44)
  br label %if.end52

if.end52:                                         ; preds = %if.then51, %do.body49
  %45 = load volatile i32, i32* @interrupt_state, align 4
  %tobool53 = icmp ne i32 %45, 0
  br i1 %tobool53, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.end52
  call void @throw_to_top_level()
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %if.end52
  br label %do.end56

do.end56:                                         ; preds = %if.end55
  %46 = load i8*, i8** %selection, align 4
  %cmp57 = icmp eq i8* %46, null
  br i1 %cmp57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %do.end56
  store i32 1, i32* %retval1, align 4
  br label %while.end

if.end59:                                         ; preds = %do.end56
  %47 = load i8*, i8** %identifier, align 4
  %48 = load i8*, i8** %selection, align 4
  %call60 = call %struct.variable* @bind_variable(i8* %47, i8* %48, i32 0)
  store %struct.variable* %call60, %struct.variable** %v, align 4
  %49 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp61 = icmp eq %struct.variable* %49, null
  br i1 %cmp61, label %if.then69, label %lor.lhs.false62

lor.lhs.false62:                                  ; preds = %if.end59
  %50 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %50, i32 0, i32 5
  %51 = load i32, i32* %attributes, align 4
  %and63 = and i32 %51, 2
  %tobool64 = icmp ne i32 %and63, 0
  br i1 %tobool64, label %if.then69, label %lor.lhs.false65

lor.lhs.false65:                                  ; preds = %lor.lhs.false62
  %52 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes66 = getelementptr inbounds %struct.variable, %struct.variable* %52, i32 0, i32 5
  %53 = load i32, i32* %attributes66, align 4
  %and67 = and i32 %53, 16384
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %if.then69, label %if.end80

if.then69:                                        ; preds = %lor.lhs.false65, %lor.lhs.false62, %if.end59
  %54 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool70 = icmp ne %struct.variable* %54, null
  br i1 %tobool70, label %land.lhs.true71, label %if.else

land.lhs.true71:                                  ; preds = %if.then69
  %55 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes72 = getelementptr inbounds %struct.variable, %struct.variable* %55, i32 0, i32 5
  %56 = load i32, i32* %attributes72, align 4
  %and73 = and i32 %56, 2
  %tobool74 = icmp ne i32 %and73, 0
  br i1 %tobool74, label %land.lhs.true75, label %if.else

land.lhs.true75:                                  ; preds = %land.lhs.true71
  %57 = load i32, i32* @interactive_shell, align 4
  %cmp76 = icmp eq i32 %57, 0
  br i1 %cmp76, label %land.lhs.true77, label %if.else

land.lhs.true77:                                  ; preds = %land.lhs.true75
  %58 = load i32, i32* @posixly_correct, align 4
  %tobool78 = icmp ne i32 %58, 0
  br i1 %tobool78, label %if.then79, label %if.else

if.then79:                                        ; preds = %land.lhs.true77
  store volatile i32 1, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 1) #5
  unreachable

if.else:                                          ; preds = %land.lhs.true77, %land.lhs.true75, %land.lhs.true71, %if.then69
  %59 = load %struct.word_list*, %struct.word_list** %releaser, align 4
  call void @dispose_words(%struct.word_list* %59)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0))
  %60 = load i32, i32* @loop_level, align 4
  %dec = add nsw i32 %60, -1
  store i32 %dec, i32* @loop_level, align 4
  %61 = load i32, i32* %save_line_number, align 4
  store i32 %61, i32* @line_number, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end80:                                         ; preds = %lor.lhs.false65
  %62 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %action81 = getelementptr inbounds %struct.select_com, %struct.select_com* %62, i32 0, i32 4
  %63 = load %struct.command*, %struct.command** %action81, align 4
  %call82 = call i32 @execute_command(%struct.command* %63)
  store i32 %call82, i32* %retval1, align 4
  br label %do.body83

do.body83:                                        ; preds = %if.end80
  %64 = load i32, i32* @job_control, align 4
  %cmp84 = icmp eq i32 %64, 0
  br i1 %cmp84, label %if.then87, label %lor.lhs.false85

lor.lhs.false85:                                  ; preds = %do.body83
  %65 = load i32, i32* @interactive_shell, align 4
  %cmp86 = icmp eq i32 %65, 0
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %lor.lhs.false85, %do.body83
  call void @reap_dead_jobs()
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %lor.lhs.false85
  br label %do.end89

do.end89:                                         ; preds = %if.end88
  br label %do.body90

do.body90:                                        ; preds = %do.end89
  %66 = load volatile i32, i32* @terminating_signal, align 4
  %tobool91 = icmp ne i32 %66, 0
  br i1 %tobool91, label %if.then92, label %if.end93

if.then92:                                        ; preds = %do.body90
  %67 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %67)
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %do.body90
  %68 = load volatile i32, i32* @interrupt_state, align 4
  %tobool94 = icmp ne i32 %68, 0
  br i1 %tobool94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end93
  call void @throw_to_top_level()
  br label %if.end96

if.end96:                                         ; preds = %if.then95, %if.end93
  br label %do.end97

do.end97:                                         ; preds = %if.end96
  %69 = load i32, i32* @breaking, align 4
  %tobool98 = icmp ne i32 %69, 0
  br i1 %tobool98, label %if.then99, label %if.end101

if.then99:                                        ; preds = %do.end97
  %70 = load i32, i32* @breaking, align 4
  %dec100 = add nsw i32 %70, -1
  store i32 %dec100, i32* @breaking, align 4
  br label %while.end

if.end101:                                        ; preds = %do.end97
  %71 = load i32, i32* @continuing, align 4
  %tobool102 = icmp ne i32 %71, 0
  br i1 %tobool102, label %if.then103, label %if.end108

if.then103:                                       ; preds = %if.end101
  %72 = load i32, i32* @continuing, align 4
  %dec104 = add nsw i32 %72, -1
  store i32 %dec104, i32* @continuing, align 4
  %73 = load i32, i32* @continuing, align 4
  %tobool105 = icmp ne i32 %73, 0
  br i1 %tobool105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %if.then103
  br label %while.end

if.end107:                                        ; preds = %if.then103
  br label %if.end108

if.end108:                                        ; preds = %if.end107, %if.end101
  store i32 0, i32* %show_menu, align 4
  %call109 = call i8* @get_string_value(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i32 0, i32 0))
  store i8* %call109, i8** %selection, align 4
  %74 = load i8*, i8** %selection, align 4
  %tobool110 = icmp ne i8* %74, null
  br i1 %tobool110, label %land.lhs.true111, label %if.end115

land.lhs.true111:                                 ; preds = %if.end108
  %75 = load i8*, i8** %selection, align 4
  %76 = load i8, i8* %75, align 1
  %conv = sext i8 %76 to i32
  %cmp112 = icmp eq i32 %conv, 0
  br i1 %cmp112, label %if.then114, label %if.end115

if.then114:                                       ; preds = %land.lhs.true111
  store i32 1, i32* %show_menu, align 4
  br label %if.end115

if.end115:                                        ; preds = %if.then114, %land.lhs.true111, %if.end108
  br label %while.body

while.end:                                        ; preds = %if.then106, %if.then99, %if.then58
  %77 = load i32, i32* @loop_level, align 4
  %dec116 = add nsw i32 %77, -1
  store i32 %dec116, i32* @loop_level, align 4
  %78 = load i32, i32* %save_line_number, align 4
  store i32 %78, i32* @line_number, align 4
  %79 = load %struct.word_list*, %struct.word_list** %releaser, align 4
  call void @dispose_words(%struct.word_list* %79)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.29, i32 0, i32 0))
  %80 = load i32, i32* %retval1, align 4
  store i32 %80, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.else, %if.end29, %if.then19, %if.then
  %81 = load i32, i32* %retval, align 4
  ret i32 %81
}

; Function Attrs: noinline nounwind
define internal i32 @execute_case_command(%struct.case_com* %case_command) #0 {
entry:
  %retval = alloca i32, align 4
  %case_command.addr = alloca %struct.case_com*, align 4
  %list = alloca %struct.word_list*, align 4
  %wlist = alloca %struct.word_list*, align 4
  %es = alloca %struct.word_list*, align 4
  %clauses = alloca %struct.pattern_list*, align 4
  %word = alloca i8*, align 4
  %pattern = alloca i8*, align 4
  %retval1 = alloca i32, align 4
  %match = alloca i32, align 4
  %ignore_return = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  store %struct.case_com* %case_command, %struct.case_com** %case_command.addr, align 4
  %0 = load i32, i32* @line_number, align 4
  store i32 %0, i32* %save_line_number, align 4
  %1 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %line = getelementptr inbounds %struct.case_com, %struct.case_com* %1, i32 0, i32 1
  %2 = load i32, i32* %line, align 4
  store i32 %2, i32* @line_number, align 4
  store i32 0, i32* @command_string_index, align 4
  %3 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  call void @print_case_command_head(%struct.case_com* %3)
  %4 = load i32, i32* @echo_command_at_execute, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  call void @xtrace_print_case_command_head(%struct.case_com* %5)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 @signal_in_progress(i32 65)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* @running_trap, align 4
  %cmp2 = icmp eq i32 %6, 0
  br i1 %cmp2, label %if.then3, label %if.end10

if.then3:                                         ; preds = %land.lhs.true
  br label %do.body

do.body:                                          ; preds = %if.then3
  %7 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool4 = icmp ne i8* %7, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %do.body
  %8 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3370)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end6
  %9 = load i8*, i8** @the_printed_command, align 4
  %call7 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call7
  %call8 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3371)
  %10 = load i8*, i8** @the_printed_command, align 4
  %call9 = call i8* @strcpy(i8* %call8, i8* %10)
  store i8* %call9, i8** @the_printed_command_except_trap, align 4
  br label %if.end10

if.end10:                                         ; preds = %do.end, %land.lhs.true, %if.end
  %call11 = call i32 @run_debug_trap()
  store i32 %call11, i32* %retval1, align 4
  %11 = load i32, i32* @debugging_mode, align 4
  %tobool12 = icmp ne i32 %11, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.end16

land.lhs.true13:                                  ; preds = %if.end10
  %12 = load i32, i32* %retval1, align 4
  %cmp14 = icmp ne i32 %12, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %land.lhs.true13
  %13 = load i32, i32* %save_line_number, align 4
  store i32 %13, i32* @line_number, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %land.lhs.true13, %if.end10
  %14 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %word17 = getelementptr inbounds %struct.case_com, %struct.case_com* %14, i32 0, i32 2
  %15 = load %struct.word_desc*, %struct.word_desc** %word17, align 4
  %call18 = call %struct.word_list* @expand_word_unsplit(%struct.word_desc* %15, i32 0)
  store %struct.word_list* %call18, %struct.word_list** %wlist, align 4
  %16 = load %struct.word_list*, %struct.word_list** %wlist, align 4
  %tobool19 = icmp ne %struct.word_list* %16, null
  br i1 %tobool19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end16
  %17 = load %struct.word_list*, %struct.word_list** %wlist, align 4
  %call20 = call i8* @string_list(%struct.word_list* %17)
  br label %cond.end

cond.false:                                       ; preds = %if.end16
  %call21 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3386)
  %call22 = call i8* @strcpy(i8* %call21, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call20, %cond.true ], [ %call22, %cond.false ]
  store i8* %cond, i8** %word, align 4
  %18 = load %struct.word_list*, %struct.word_list** %wlist, align 4
  call void @dispose_words(%struct.word_list* %18)
  store i32 0, i32* %retval1, align 4
  %19 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %flags = getelementptr inbounds %struct.case_com, %struct.case_com* %19, i32 0, i32 0
  %20 = load i32, i32* %flags, align 4
  %and = and i32 %20, 8
  store i32 %and, i32* %ignore_return, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0))
  %21 = load i8*, i8** %word, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %21)
  %22 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %clauses23 = getelementptr inbounds %struct.case_com, %struct.case_com* %22, i32 0, i32 3
  %23 = load %struct.pattern_list*, %struct.pattern_list** %clauses23, align 4
  store %struct.pattern_list* %23, %struct.pattern_list** %clauses, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc100, %cond.end
  %24 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %tobool24 = icmp ne %struct.pattern_list* %24, null
  br i1 %tobool24, label %for.body, label %for.end102

for.body:                                         ; preds = %for.cond
  br label %do.body25

do.body25:                                        ; preds = %for.body
  %25 = load volatile i32, i32* @terminating_signal, align 4
  %tobool26 = icmp ne i32 %25, 0
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %do.body25
  %26 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %26)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %do.body25
  %27 = load volatile i32, i32* @interrupt_state, align 4
  %tobool29 = icmp ne i32 %27, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end28
  call void @throw_to_top_level()
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end28
  br label %do.end32

do.end32:                                         ; preds = %if.end31
  %28 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %patterns = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %28, i32 0, i32 1
  %29 = load %struct.word_list*, %struct.word_list** %patterns, align 4
  store %struct.word_list* %29, %struct.word_list** %list, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc, %do.end32
  %30 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool34 = icmp ne %struct.word_list* %30, null
  br i1 %tobool34, label %for.body35, label %for.end

for.body35:                                       ; preds = %for.cond33
  %31 = load %struct.word_list*, %struct.word_list** %list, align 4
  %word36 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word36, align 4
  %call37 = call %struct.word_list* @expand_word_leave_quoted(%struct.word_desc* %32, i32 0)
  store %struct.word_list* %call37, %struct.word_list** %es, align 4
  %33 = load %struct.word_list*, %struct.word_list** %es, align 4
  %tobool38 = icmp ne %struct.word_list* %33, null
  br i1 %tobool38, label %land.lhs.true39, label %if.else

land.lhs.true39:                                  ; preds = %for.body35
  %34 = load %struct.word_list*, %struct.word_list** %es, align 4
  %word40 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word40, align 4
  %tobool41 = icmp ne %struct.word_desc* %35, null
  br i1 %tobool41, label %land.lhs.true42, label %if.else

land.lhs.true42:                                  ; preds = %land.lhs.true39
  %36 = load %struct.word_list*, %struct.word_list** %es, align 4
  %word43 = getelementptr inbounds %struct.word_list, %struct.word_list* %36, i32 0, i32 1
  %37 = load %struct.word_desc*, %struct.word_desc** %word43, align 4
  %word44 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %37, i32 0, i32 0
  %38 = load i8*, i8** %word44, align 4
  %tobool45 = icmp ne i8* %38, null
  br i1 %tobool45, label %land.lhs.true46, label %if.else

land.lhs.true46:                                  ; preds = %land.lhs.true42
  %39 = load %struct.word_list*, %struct.word_list** %es, align 4
  %word47 = getelementptr inbounds %struct.word_list, %struct.word_list* %39, i32 0, i32 1
  %40 = load %struct.word_desc*, %struct.word_desc** %word47, align 4
  %word48 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %40, i32 0, i32 0
  %41 = load i8*, i8** %word48, align 4
  %42 = load i8, i8* %41, align 1
  %conv = sext i8 %42 to i32
  %tobool49 = icmp ne i32 %conv, 0
  br i1 %tobool49, label %if.then50, label %if.else

if.then50:                                        ; preds = %land.lhs.true46
  %43 = load %struct.word_list*, %struct.word_list** %es, align 4
  %word51 = getelementptr inbounds %struct.word_list, %struct.word_list* %43, i32 0, i32 1
  %44 = load %struct.word_desc*, %struct.word_desc** %word51, align 4
  %word52 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %44, i32 0, i32 0
  %45 = load i8*, i8** %word52, align 4
  %call53 = call i8* @quote_string_for_globbing(i8* %45, i32 1)
  store i8* %call53, i8** %pattern, align 4
  br label %if.end55

if.else:                                          ; preds = %land.lhs.true46, %land.lhs.true42, %land.lhs.true39, %for.body35
  %call54 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3408)
  store i8* %call54, i8** %pattern, align 4
  %46 = load i8*, i8** %pattern, align 4
  %arrayidx = getelementptr inbounds i8, i8* %46, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end55

if.end55:                                         ; preds = %if.else, %if.then50
  %47 = load i8*, i8** %pattern, align 4
  %48 = load i8*, i8** %word, align 4
  %49 = load i32, i32* @extended_glob, align 4
  %tobool56 = icmp ne i32 %49, 0
  %cond57 = select i1 %tobool56, i32 32, i32 0
  %50 = load i32, i32* @match_ignore_case, align 4
  %tobool58 = icmp ne i32 %50, 0
  %cond59 = select i1 %tobool58, i32 16, i32 0
  %or = or i32 %cond57, %cond59
  %call60 = call i32 @strmatch(i8* %47, i8* %48, i32 %or)
  %cmp61 = icmp ne i32 %call60, 1
  %conv62 = zext i1 %cmp61 to i32
  store i32 %conv62, i32* %match, align 4
  %51 = load i8*, i8** %pattern, align 4
  call void @sh_xfree(i8* %51, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3416)
  %52 = load %struct.word_list*, %struct.word_list** %es, align 4
  call void @dispose_words(%struct.word_list* %52)
  %53 = load i32, i32* %match, align 4
  %tobool63 = icmp ne i32 %53, 0
  br i1 %tobool63, label %if.then64, label %if.end89

if.then64:                                        ; preds = %if.end55
  br label %do.body65

do.body65:                                        ; preds = %land.end, %if.then64
  %54 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %action = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %54, i32 0, i32 2
  %55 = load %struct.command*, %struct.command** %action, align 4
  %tobool66 = icmp ne %struct.command* %55, null
  br i1 %tobool66, label %land.lhs.true67, label %if.end73

land.lhs.true67:                                  ; preds = %do.body65
  %56 = load i32, i32* %ignore_return, align 4
  %tobool68 = icmp ne i32 %56, 0
  br i1 %tobool68, label %if.then69, label %if.end73

if.then69:                                        ; preds = %land.lhs.true67
  %57 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %action70 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %57, i32 0, i32 2
  %58 = load %struct.command*, %struct.command** %action70, align 4
  %flags71 = getelementptr inbounds %struct.command, %struct.command* %58, i32 0, i32 1
  %59 = load i32, i32* %flags71, align 4
  %or72 = or i32 %59, 8
  store i32 %or72, i32* %flags71, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then69, %land.lhs.true67, %do.body65
  %60 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %action74 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %60, i32 0, i32 2
  %61 = load %struct.command*, %struct.command** %action74, align 4
  %call75 = call i32 @execute_command(%struct.command* %61)
  store i32 %call75, i32* %retval1, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end73
  %62 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %flags76 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %62, i32 0, i32 3
  %63 = load i32, i32* %flags76, align 4
  %and77 = and i32 %63, 1
  %tobool78 = icmp ne i32 %and77, 0
  br i1 %tobool78, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %64 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %next = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %64, i32 0, i32 0
  %65 = load %struct.pattern_list*, %struct.pattern_list** %next, align 4
  store %struct.pattern_list* %65, %struct.pattern_list** %clauses, align 4
  %tobool79 = icmp ne %struct.pattern_list* %65, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %66 = phi i1 [ false, %do.cond ], [ %tobool79, %land.rhs ]
  br i1 %66, label %do.body65, label %do.end80

do.end80:                                         ; preds = %land.end
  %67 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %cmp81 = icmp eq %struct.pattern_list* %67, null
  br i1 %cmp81, label %if.then87, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end80
  %68 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %flags83 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %68, i32 0, i32 3
  %69 = load i32, i32* %flags83, align 4
  %and84 = and i32 %69, 2
  %cmp85 = icmp eq i32 %and84, 0
  br i1 %cmp85, label %if.then87, label %if.else88

if.then87:                                        ; preds = %lor.lhs.false, %do.end80
  br label %exit_case_command

if.else88:                                        ; preds = %lor.lhs.false
  br label %for.end

if.end89:                                         ; preds = %if.end55
  br label %do.body90

do.body90:                                        ; preds = %if.end89
  %70 = load volatile i32, i32* @terminating_signal, align 4
  %tobool91 = icmp ne i32 %70, 0
  br i1 %tobool91, label %if.then92, label %if.end93

if.then92:                                        ; preds = %do.body90
  %71 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %71)
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %do.body90
  %72 = load volatile i32, i32* @interrupt_state, align 4
  %tobool94 = icmp ne i32 %72, 0
  br i1 %tobool94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end93
  call void @throw_to_top_level()
  br label %if.end96

if.end96:                                         ; preds = %if.then95, %if.end93
  br label %do.end98

do.end98:                                         ; preds = %if.end96
  br label %for.inc

for.inc:                                          ; preds = %do.end98
  %73 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next99 = getelementptr inbounds %struct.word_list, %struct.word_list* %73, i32 0, i32 0
  %74 = load %struct.word_list*, %struct.word_list** %next99, align 4
  store %struct.word_list* %74, %struct.word_list** %list, align 4
  br label %for.cond33

for.end:                                          ; preds = %if.else88, %for.cond33
  br label %for.inc100

for.inc100:                                       ; preds = %for.end
  %75 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %next101 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %75, i32 0, i32 0
  %76 = load %struct.pattern_list*, %struct.pattern_list** %next101, align 4
  store %struct.pattern_list* %76, %struct.pattern_list** %clauses, align 4
  br label %for.cond

for.end102:                                       ; preds = %for.cond
  br label %exit_case_command

exit_case_command:                                ; preds = %for.end102, %if.then87
  %77 = load i8*, i8** %word, align 4
  call void @sh_xfree(i8* %77, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3440)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0))
  %78 = load i32, i32* %save_line_number, align 4
  store i32 %78, i32* @line_number, align 4
  %79 = load i32, i32* %retval1, align 4
  store i32 %79, i32* %retval, align 4
  br label %return

return:                                           ; preds = %exit_case_command, %if.then15
  %80 = load i32, i32* %retval, align 4
  ret i32 %80
}

; Function Attrs: noinline nounwind
define internal i32 @execute_while_command(%struct.while_com* %while_command) #0 {
entry:
  %while_command.addr = alloca %struct.while_com*, align 4
  store %struct.while_com* %while_command, %struct.while_com** %while_command.addr, align 4
  %0 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %call = call i32 @execute_while_or_until(%struct.while_com* %0, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @execute_until_command(%struct.while_com* %while_command) #0 {
entry:
  %while_command.addr = alloca %struct.while_com*, align 4
  store %struct.while_com* %while_command, %struct.while_com** %while_command.addr, align 4
  %0 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %call = call i32 @execute_while_or_until(%struct.while_com* %0, i32 1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @execute_if_command(%struct.if_com* %if_command) #0 {
entry:
  %retval = alloca i32, align 4
  %if_command.addr = alloca %struct.if_com*, align 4
  %return_value = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  store %struct.if_com* %if_command, %struct.if_com** %if_command.addr, align 4
  %0 = load i32, i32* @line_number, align 4
  store i32 %0, i32* %save_line_number, align 4
  %1 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %test = getelementptr inbounds %struct.if_com, %struct.if_com* %1, i32 0, i32 1
  %2 = load %struct.command*, %struct.command** %test, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 1
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 8
  store i32 %or, i32* %flags, align 4
  %4 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %test1 = getelementptr inbounds %struct.if_com, %struct.if_com* %4, i32 0, i32 1
  %5 = load %struct.command*, %struct.command** %test1, align 4
  %call = call i32 @execute_command(%struct.command* %5)
  store i32 %call, i32* %return_value, align 4
  %6 = load i32, i32* %save_line_number, align 4
  store i32 %6, i32* @line_number, align 4
  %7 = load i32, i32* %return_value, align 4
  %cmp = icmp eq i32 %7, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %8 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %9 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %9)
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  %10 = load volatile i32, i32* @interrupt_state, align 4
  %tobool3 = icmp ne i32 %10, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @throw_to_top_level()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  br label %do.end

do.end:                                           ; preds = %if.end5
  %11 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %true_case = getelementptr inbounds %struct.if_com, %struct.if_com* %11, i32 0, i32 2
  %12 = load %struct.command*, %struct.command** %true_case, align 4
  %tobool6 = icmp ne %struct.command* %12, null
  br i1 %tobool6, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %do.end
  %13 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %flags7 = getelementptr inbounds %struct.if_com, %struct.if_com* %13, i32 0, i32 0
  %14 = load i32, i32* %flags7, align 4
  %and = and i32 %14, 8
  %tobool8 = icmp ne i32 %and, 0
  br i1 %tobool8, label %if.then9, label %if.end13

if.then9:                                         ; preds = %land.lhs.true
  %15 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %true_case10 = getelementptr inbounds %struct.if_com, %struct.if_com* %15, i32 0, i32 2
  %16 = load %struct.command*, %struct.command** %true_case10, align 4
  %flags11 = getelementptr inbounds %struct.command, %struct.command* %16, i32 0, i32 1
  %17 = load i32, i32* %flags11, align 4
  %or12 = or i32 %17, 8
  store i32 %or12, i32* %flags11, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then9, %land.lhs.true, %do.end
  %18 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %true_case14 = getelementptr inbounds %struct.if_com, %struct.if_com* %18, i32 0, i32 2
  %19 = load %struct.command*, %struct.command** %true_case14, align 4
  %call15 = call i32 @execute_command(%struct.command* %19)
  store i32 %call15, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  br label %do.body16

do.body16:                                        ; preds = %if.else
  %20 = load volatile i32, i32* @terminating_signal, align 4
  %tobool17 = icmp ne i32 %20, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %do.body16
  %21 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %21)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %do.body16
  %22 = load volatile i32, i32* @interrupt_state, align 4
  %tobool20 = icmp ne i32 %22, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  call void @throw_to_top_level()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  br label %do.end23

do.end23:                                         ; preds = %if.end22
  %23 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %false_case = getelementptr inbounds %struct.if_com, %struct.if_com* %23, i32 0, i32 3
  %24 = load %struct.command*, %struct.command** %false_case, align 4
  %tobool24 = icmp ne %struct.command* %24, null
  br i1 %tobool24, label %land.lhs.true25, label %if.end33

land.lhs.true25:                                  ; preds = %do.end23
  %25 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %flags26 = getelementptr inbounds %struct.if_com, %struct.if_com* %25, i32 0, i32 0
  %26 = load i32, i32* %flags26, align 4
  %and27 = and i32 %26, 8
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.end33

if.then29:                                        ; preds = %land.lhs.true25
  %27 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %false_case30 = getelementptr inbounds %struct.if_com, %struct.if_com* %27, i32 0, i32 3
  %28 = load %struct.command*, %struct.command** %false_case30, align 4
  %flags31 = getelementptr inbounds %struct.command, %struct.command* %28, i32 0, i32 1
  %29 = load i32, i32* %flags31, align 4
  %or32 = or i32 %29, 8
  store i32 %or32, i32* %flags31, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then29, %land.lhs.true25, %do.end23
  %30 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %false_case34 = getelementptr inbounds %struct.if_com, %struct.if_com* %30, i32 0, i32 3
  %31 = load %struct.command*, %struct.command** %false_case34, align 4
  %call35 = call i32 @execute_command(%struct.command* %31)
  store i32 %call35, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.end13
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind
define internal i32 @execute_connection(%struct.command* %command, i32 %asynchronous, i32 %pipe_in, i32 %pipe_out, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca %struct.command*, align 4
  %asynchronous.addr = alloca i32, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %tc = alloca %struct.command*, align 4
  %second = alloca %struct.command*, align 4
  %ignore_return = alloca i32, align 4
  %exec_result = alloca i32, align 4
  %was_error_trap = alloca i32, align 4
  %invert = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %asynchronous, i32* %asynchronous.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %0, i32 0, i32 1
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 8
  %cmp = icmp ne i32 %and, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %ignore_return, align 4
  %2 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 4
  %Connection = bitcast %union.anon* %value to %struct.connection**
  %3 = load %struct.connection*, %struct.connection** %Connection, align 4
  %connector = getelementptr inbounds %struct.connection, %struct.connection* %3, i32 0, i32 3
  %4 = load i32, i32* %connector, align 4
  switch i32 %4, label %sw.default [
    i32 38, label %sw.bb
    i32 59, label %sw.bb40
    i32 124, label %sw.bb90
    i32 287, label %sw.bb131
    i32 288, label %sw.bb131
  ]

sw.bb:                                            ; preds = %entry
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %value1 = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 4
  %Connection2 = bitcast %union.anon* %value1 to %struct.connection**
  %6 = load %struct.connection*, %struct.connection** %Connection2, align 4
  %first = getelementptr inbounds %struct.connection, %struct.connection* %6, i32 0, i32 1
  %7 = load %struct.command*, %struct.command** %first, align 4
  store %struct.command* %7, %struct.command** %tc, align 4
  %8 = load %struct.command*, %struct.command** %tc, align 4
  %cmp3 = icmp eq %struct.command* %8, null
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb
  %9 = load i32, i32* %ignore_return, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %10 = load %struct.command*, %struct.command** %tc, align 4
  %flags6 = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 1
  %11 = load i32, i32* %flags6, align 4
  %or = or i32 %11, 8
  store i32 %or, i32* %flags6, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %12 = load %struct.command*, %struct.command** %tc, align 4
  %flags8 = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 1
  %13 = load i32, i32* %flags8, align 4
  %or9 = or i32 %13, 512
  store i32 %or9, i32* %flags8, align 4
  %14 = load i32, i32* @stdin_redir, align 4
  %tobool10 = icmp ne i32 %14, 0
  br i1 %tobool10, label %if.end14, label %if.then11

if.then11:                                        ; preds = %if.end7
  %15 = load %struct.command*, %struct.command** %tc, align 4
  %flags12 = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 1
  %16 = load i32, i32* %flags12, align 4
  %or13 = or i32 %16, 1024
  store i32 %or13, i32* %flags12, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %if.end7
  %17 = load %struct.command*, %struct.command** %tc, align 4
  %18 = load i32, i32* %pipe_in.addr, align 4
  %19 = load i32, i32* %pipe_out.addr, align 4
  %20 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call = call i32 @execute_command_internal(%struct.command* %17, i32 1, i32 %18, i32 %19, %struct.fd_bitmap* %20)
  store i32 %call, i32* %exec_result, align 4
  br label %do.body

do.body:                                          ; preds = %if.end14
  %21 = load volatile i32, i32* @terminating_signal, align 4
  %tobool15 = icmp ne i32 %21, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %do.body
  %22 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %22)
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %do.body
  %23 = load volatile i32, i32* @interrupt_state, align 4
  %tobool18 = icmp ne i32 %23, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end17
  call void @throw_to_top_level()
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end17
  br label %do.end

do.end:                                           ; preds = %if.end20
  %24 = load %struct.command*, %struct.command** %tc, align 4
  %flags21 = getelementptr inbounds %struct.command, %struct.command* %24, i32 0, i32 1
  %25 = load i32, i32* %flags21, align 4
  %and22 = and i32 %25, 1024
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %do.end
  %26 = load %struct.command*, %struct.command** %tc, align 4
  %flags25 = getelementptr inbounds %struct.command, %struct.command* %26, i32 0, i32 1
  %27 = load i32, i32* %flags25, align 4
  %and26 = and i32 %27, -1025
  store i32 %and26, i32* %flags25, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %do.end
  %28 = load %struct.command*, %struct.command** %command.addr, align 4
  %value28 = getelementptr inbounds %struct.command, %struct.command* %28, i32 0, i32 4
  %Connection29 = bitcast %union.anon* %value28 to %struct.connection**
  %29 = load %struct.connection*, %struct.connection** %Connection29, align 4
  %second30 = getelementptr inbounds %struct.connection, %struct.connection* %29, i32 0, i32 2
  %30 = load %struct.command*, %struct.command** %second30, align 4
  store %struct.command* %30, %struct.command** %second, align 4
  %31 = load %struct.command*, %struct.command** %second, align 4
  %tobool31 = icmp ne %struct.command* %31, null
  br i1 %tobool31, label %if.then32, label %if.end39

if.then32:                                        ; preds = %if.end27
  %32 = load i32, i32* %ignore_return, align 4
  %tobool33 = icmp ne i32 %32, 0
  br i1 %tobool33, label %if.then34, label %if.end37

if.then34:                                        ; preds = %if.then32
  %33 = load %struct.command*, %struct.command** %second, align 4
  %flags35 = getelementptr inbounds %struct.command, %struct.command* %33, i32 0, i32 1
  %34 = load i32, i32* %flags35, align 4
  %or36 = or i32 %34, 8
  store i32 %or36, i32* %flags35, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %if.then32
  %35 = load %struct.command*, %struct.command** %second, align 4
  %36 = load i32, i32* %asynchronous.addr, align 4
  %37 = load i32, i32* %pipe_in.addr, align 4
  %38 = load i32, i32* %pipe_out.addr, align 4
  %39 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call38 = call i32 @execute_command_internal(%struct.command* %35, i32 %36, i32 %37, i32 %38, %struct.fd_bitmap* %39)
  store i32 %call38, i32* %exec_result, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.end37, %if.end27
  br label %sw.epilog

sw.bb40:                                          ; preds = %entry
  %40 = load i32, i32* %ignore_return, align 4
  %tobool41 = icmp ne i32 %40, 0
  br i1 %tobool41, label %if.then42, label %if.end65

if.then42:                                        ; preds = %sw.bb40
  %41 = load %struct.command*, %struct.command** %command.addr, align 4
  %value43 = getelementptr inbounds %struct.command, %struct.command* %41, i32 0, i32 4
  %Connection44 = bitcast %union.anon* %value43 to %struct.connection**
  %42 = load %struct.connection*, %struct.connection** %Connection44, align 4
  %first45 = getelementptr inbounds %struct.connection, %struct.connection* %42, i32 0, i32 1
  %43 = load %struct.command*, %struct.command** %first45, align 4
  %tobool46 = icmp ne %struct.command* %43, null
  br i1 %tobool46, label %if.then47, label %if.end53

if.then47:                                        ; preds = %if.then42
  %44 = load %struct.command*, %struct.command** %command.addr, align 4
  %value48 = getelementptr inbounds %struct.command, %struct.command* %44, i32 0, i32 4
  %Connection49 = bitcast %union.anon* %value48 to %struct.connection**
  %45 = load %struct.connection*, %struct.connection** %Connection49, align 4
  %first50 = getelementptr inbounds %struct.connection, %struct.connection* %45, i32 0, i32 1
  %46 = load %struct.command*, %struct.command** %first50, align 4
  %flags51 = getelementptr inbounds %struct.command, %struct.command* %46, i32 0, i32 1
  %47 = load i32, i32* %flags51, align 4
  %or52 = or i32 %47, 8
  store i32 %or52, i32* %flags51, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then47, %if.then42
  %48 = load %struct.command*, %struct.command** %command.addr, align 4
  %value54 = getelementptr inbounds %struct.command, %struct.command* %48, i32 0, i32 4
  %Connection55 = bitcast %union.anon* %value54 to %struct.connection**
  %49 = load %struct.connection*, %struct.connection** %Connection55, align 4
  %second56 = getelementptr inbounds %struct.connection, %struct.connection* %49, i32 0, i32 2
  %50 = load %struct.command*, %struct.command** %second56, align 4
  %tobool57 = icmp ne %struct.command* %50, null
  br i1 %tobool57, label %if.then58, label %if.end64

if.then58:                                        ; preds = %if.end53
  %51 = load %struct.command*, %struct.command** %command.addr, align 4
  %value59 = getelementptr inbounds %struct.command, %struct.command* %51, i32 0, i32 4
  %Connection60 = bitcast %union.anon* %value59 to %struct.connection**
  %52 = load %struct.connection*, %struct.connection** %Connection60, align 4
  %second61 = getelementptr inbounds %struct.connection, %struct.connection* %52, i32 0, i32 2
  %53 = load %struct.command*, %struct.command** %second61, align 4
  %flags62 = getelementptr inbounds %struct.command, %struct.command* %53, i32 0, i32 1
  %54 = load i32, i32* %flags62, align 4
  %or63 = or i32 %54, 8
  store i32 %or63, i32* %flags62, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then58, %if.end53
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %sw.bb40
  %55 = load i32, i32* @executing_list, align 4
  %inc = add nsw i32 %55, 1
  store i32 %inc, i32* @executing_list, align 4
  br label %do.body66

do.body66:                                        ; preds = %if.end65
  %56 = load volatile i32, i32* @terminating_signal, align 4
  %tobool67 = icmp ne i32 %56, 0
  br i1 %tobool67, label %if.then68, label %if.end69

if.then68:                                        ; preds = %do.body66
  %57 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %57)
  br label %if.end69

if.end69:                                         ; preds = %if.then68, %do.body66
  %58 = load volatile i32, i32* @interrupt_state, align 4
  %tobool70 = icmp ne i32 %58, 0
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end69
  call void @throw_to_top_level()
  br label %if.end72

if.end72:                                         ; preds = %if.then71, %if.end69
  br label %do.end73

do.end73:                                         ; preds = %if.end72
  %59 = load %struct.command*, %struct.command** %command.addr, align 4
  %value74 = getelementptr inbounds %struct.command, %struct.command* %59, i32 0, i32 4
  %Connection75 = bitcast %union.anon* %value74 to %struct.connection**
  %60 = load %struct.connection*, %struct.connection** %Connection75, align 4
  %first76 = getelementptr inbounds %struct.connection, %struct.connection* %60, i32 0, i32 1
  %61 = load %struct.command*, %struct.command** %first76, align 4
  %call77 = call i32 @execute_command(%struct.command* %61)
  br label %do.body78

do.body78:                                        ; preds = %do.end73
  %62 = load volatile i32, i32* @terminating_signal, align 4
  %tobool79 = icmp ne i32 %62, 0
  br i1 %tobool79, label %if.then80, label %if.end81

if.then80:                                        ; preds = %do.body78
  %63 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %63)
  br label %if.end81

if.end81:                                         ; preds = %if.then80, %do.body78
  %64 = load volatile i32, i32* @interrupt_state, align 4
  %tobool82 = icmp ne i32 %64, 0
  br i1 %tobool82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end81
  call void @throw_to_top_level()
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %if.end81
  br label %do.end85

do.end85:                                         ; preds = %if.end84
  %65 = load %struct.command*, %struct.command** %command.addr, align 4
  %value86 = getelementptr inbounds %struct.command, %struct.command* %65, i32 0, i32 4
  %Connection87 = bitcast %union.anon* %value86 to %struct.connection**
  %66 = load %struct.connection*, %struct.connection** %Connection87, align 4
  %second88 = getelementptr inbounds %struct.connection, %struct.connection* %66, i32 0, i32 2
  %67 = load %struct.command*, %struct.command** %second88, align 4
  %68 = load i32, i32* %asynchronous.addr, align 4
  %69 = load i32, i32* %pipe_in.addr, align 4
  %70 = load i32, i32* %pipe_out.addr, align 4
  %71 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call89 = call i32 @execute_command_internal(%struct.command* %67, i32 %68, i32 %69, i32 %70, %struct.fd_bitmap* %71)
  store i32 %call89, i32* %exec_result, align 4
  %72 = load i32, i32* @executing_list, align 4
  %dec = add nsw i32 %72, -1
  store i32 %dec, i32* @executing_list, align 4
  br label %sw.epilog

sw.bb90:                                          ; preds = %entry
  %call91 = call i32 @signal_is_trapped(i32 66)
  %tobool92 = icmp ne i32 %call91, 0
  br i1 %tobool92, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %sw.bb90
  %call93 = call i32 @signal_is_ignored(i32 66)
  %cmp94 = icmp eq i32 %call93, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %sw.bb90
  %73 = phi i1 [ false, %sw.bb90 ], [ %cmp94, %land.rhs ]
  %land.ext = zext i1 %73 to i32
  store i32 %land.ext, i32* %was_error_trap, align 4
  %74 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags96 = getelementptr inbounds %struct.command, %struct.command* %74, i32 0, i32 1
  %75 = load i32, i32* %flags96, align 4
  %and97 = and i32 %75, 4
  %cmp98 = icmp ne i32 %and97, 0
  %conv99 = zext i1 %cmp98 to i32
  store i32 %conv99, i32* %invert, align 4
  %76 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags100 = getelementptr inbounds %struct.command, %struct.command* %76, i32 0, i32 1
  %77 = load i32, i32* %flags100, align 4
  %and101 = and i32 %77, 8
  %cmp102 = icmp ne i32 %and101, 0
  %conv103 = zext i1 %cmp102 to i32
  store i32 %conv103, i32* %ignore_return, align 4
  %78 = load i32, i32* @line_number, align 4
  store i32 %78, i32* @line_number_for_err_trap, align 4
  %79 = load %struct.command*, %struct.command** %command.addr, align 4
  %80 = load i32, i32* %asynchronous.addr, align 4
  %81 = load i32, i32* %pipe_in.addr, align 4
  %82 = load i32, i32* %pipe_out.addr, align 4
  %83 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call104 = call i32 @execute_pipeline(%struct.command* %79, i32 %80, i32 %81, i32 %82, %struct.fd_bitmap* %83)
  store i32 %call104, i32* %exec_result, align 4
  %84 = load i32, i32* %asynchronous.addr, align 4
  %tobool105 = icmp ne i32 %84, 0
  br i1 %tobool105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %land.end
  store i32 0, i32* %exec_result, align 4
  store i32 0, i32* %invert, align 4
  br label %if.end107

if.end107:                                        ; preds = %if.then106, %land.end
  %85 = load i32, i32* %was_error_trap, align 4
  %tobool108 = icmp ne i32 %85, 0
  br i1 %tobool108, label %land.lhs.true, label %if.end118

land.lhs.true:                                    ; preds = %if.end107
  %86 = load i32, i32* %ignore_return, align 4
  %cmp109 = icmp eq i32 %86, 0
  br i1 %cmp109, label %land.lhs.true111, label %if.end118

land.lhs.true111:                                 ; preds = %land.lhs.true
  %87 = load i32, i32* %invert, align 4
  %cmp112 = icmp eq i32 %87, 0
  br i1 %cmp112, label %land.lhs.true114, label %if.end118

land.lhs.true114:                                 ; preds = %land.lhs.true111
  %88 = load i32, i32* %exec_result, align 4
  %cmp115 = icmp ne i32 %88, 0
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %land.lhs.true114
  %89 = load i32, i32* %exec_result, align 4
  store volatile i32 %89, i32* @last_command_exit_value, align 4
  %90 = load i32, i32* @line_number, align 4
  store volatile i32 %90, i32* %save_line_number, align 4
  %91 = load i32, i32* @line_number_for_err_trap, align 4
  store i32 %91, i32* @line_number, align 4
  call void @run_error_trap()
  %92 = load volatile i32, i32* %save_line_number, align 4
  store i32 %92, i32* @line_number, align 4
  br label %if.end118

if.end118:                                        ; preds = %if.then117, %land.lhs.true114, %land.lhs.true111, %land.lhs.true, %if.end107
  %93 = load i32, i32* %ignore_return, align 4
  %cmp119 = icmp eq i32 %93, 0
  br i1 %cmp119, label %land.lhs.true121, label %if.end130

land.lhs.true121:                                 ; preds = %if.end118
  %94 = load i32, i32* %invert, align 4
  %cmp122 = icmp eq i32 %94, 0
  br i1 %cmp122, label %land.lhs.true124, label %if.end130

land.lhs.true124:                                 ; preds = %land.lhs.true121
  %95 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool125 = icmp ne i32 %95, 0
  br i1 %tobool125, label %land.lhs.true126, label %if.end130

land.lhs.true126:                                 ; preds = %land.lhs.true124
  %96 = load i32, i32* %exec_result, align 4
  %cmp127 = icmp ne i32 %96, 0
  br i1 %cmp127, label %if.then129, label %if.end130

if.then129:                                       ; preds = %land.lhs.true126
  %97 = load i32, i32* %exec_result, align 4
  store volatile i32 %97, i32* @last_command_exit_value, align 4
  call void @run_pending_traps()
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end130:                                        ; preds = %land.lhs.true126, %land.lhs.true124, %land.lhs.true121, %if.end118
  br label %sw.epilog

sw.bb131:                                         ; preds = %entry, %entry
  %98 = load i32, i32* %asynchronous.addr, align 4
  %tobool132 = icmp ne i32 %98, 0
  br i1 %tobool132, label %if.then133, label %if.end137

if.then133:                                       ; preds = %sw.bb131
  %99 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags134 = getelementptr inbounds %struct.command, %struct.command* %99, i32 0, i32 1
  %100 = load i32, i32* %flags134, align 4
  %or135 = or i32 %100, 2
  store i32 %or135, i32* %flags134, align 4
  %101 = load %struct.command*, %struct.command** %command.addr, align 4
  %102 = load i32, i32* %pipe_in.addr, align 4
  %103 = load i32, i32* %pipe_out.addr, align 4
  %104 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call136 = call i32 @execute_command_internal(%struct.command* %101, i32 1, i32 %102, i32 %103, %struct.fd_bitmap* %104)
  store i32 %call136, i32* %exec_result, align 4
  br label %sw.epilog

if.end137:                                        ; preds = %sw.bb131
  %105 = load i32, i32* @executing_list, align 4
  %inc138 = add nsw i32 %105, 1
  store i32 %inc138, i32* @executing_list, align 4
  %106 = load %struct.command*, %struct.command** %command.addr, align 4
  %value139 = getelementptr inbounds %struct.command, %struct.command* %106, i32 0, i32 4
  %Connection140 = bitcast %union.anon* %value139 to %struct.connection**
  %107 = load %struct.connection*, %struct.connection** %Connection140, align 4
  %first141 = getelementptr inbounds %struct.connection, %struct.connection* %107, i32 0, i32 1
  %108 = load %struct.command*, %struct.command** %first141, align 4
  %tobool142 = icmp ne %struct.command* %108, null
  br i1 %tobool142, label %if.then143, label %if.end149

if.then143:                                       ; preds = %if.end137
  %109 = load %struct.command*, %struct.command** %command.addr, align 4
  %value144 = getelementptr inbounds %struct.command, %struct.command* %109, i32 0, i32 4
  %Connection145 = bitcast %union.anon* %value144 to %struct.connection**
  %110 = load %struct.connection*, %struct.connection** %Connection145, align 4
  %first146 = getelementptr inbounds %struct.connection, %struct.connection* %110, i32 0, i32 1
  %111 = load %struct.command*, %struct.command** %first146, align 4
  %flags147 = getelementptr inbounds %struct.command, %struct.command* %111, i32 0, i32 1
  %112 = load i32, i32* %flags147, align 4
  %or148 = or i32 %112, 8
  store i32 %or148, i32* %flags147, align 4
  br label %if.end149

if.end149:                                        ; preds = %if.then143, %if.end137
  %113 = load %struct.command*, %struct.command** %command.addr, align 4
  %value150 = getelementptr inbounds %struct.command, %struct.command* %113, i32 0, i32 4
  %Connection151 = bitcast %union.anon* %value150 to %struct.connection**
  %114 = load %struct.connection*, %struct.connection** %Connection151, align 4
  %first152 = getelementptr inbounds %struct.connection, %struct.connection* %114, i32 0, i32 1
  %115 = load %struct.command*, %struct.command** %first152, align 4
  %call153 = call i32 @execute_command(%struct.command* %115)
  store i32 %call153, i32* %exec_result, align 4
  br label %do.body154

do.body154:                                       ; preds = %if.end149
  %116 = load volatile i32, i32* @terminating_signal, align 4
  %tobool155 = icmp ne i32 %116, 0
  br i1 %tobool155, label %if.then156, label %if.end157

if.then156:                                       ; preds = %do.body154
  %117 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %117)
  br label %if.end157

if.end157:                                        ; preds = %if.then156, %do.body154
  %118 = load volatile i32, i32* @interrupt_state, align 4
  %tobool158 = icmp ne i32 %118, 0
  br i1 %tobool158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end157
  call void @throw_to_top_level()
  br label %if.end160

if.end160:                                        ; preds = %if.then159, %if.end157
  br label %do.end161

do.end161:                                        ; preds = %if.end160
  %119 = load %struct.command*, %struct.command** %command.addr, align 4
  %value162 = getelementptr inbounds %struct.command, %struct.command* %119, i32 0, i32 4
  %Connection163 = bitcast %union.anon* %value162 to %struct.connection**
  %120 = load %struct.connection*, %struct.connection** %Connection163, align 4
  %connector164 = getelementptr inbounds %struct.connection, %struct.connection* %120, i32 0, i32 3
  %121 = load i32, i32* %connector164, align 4
  %cmp165 = icmp eq i32 %121, 287
  br i1 %cmp165, label %land.lhs.true167, label %lor.lhs.false

land.lhs.true167:                                 ; preds = %do.end161
  %122 = load i32, i32* %exec_result, align 4
  %cmp168 = icmp eq i32 %122, 0
  br i1 %cmp168, label %if.then178, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true167, %do.end161
  %123 = load %struct.command*, %struct.command** %command.addr, align 4
  %value170 = getelementptr inbounds %struct.command, %struct.command* %123, i32 0, i32 4
  %Connection171 = bitcast %union.anon* %value170 to %struct.connection**
  %124 = load %struct.connection*, %struct.connection** %Connection171, align 4
  %connector172 = getelementptr inbounds %struct.connection, %struct.connection* %124, i32 0, i32 3
  %125 = load i32, i32* %connector172, align 4
  %cmp173 = icmp eq i32 %125, 288
  br i1 %cmp173, label %land.lhs.true175, label %if.end190

land.lhs.true175:                                 ; preds = %lor.lhs.false
  %126 = load i32, i32* %exec_result, align 4
  %cmp176 = icmp ne i32 %126, 0
  br i1 %cmp176, label %if.then178, label %if.end190

if.then178:                                       ; preds = %land.lhs.true175, %land.lhs.true167
  %127 = load %struct.command*, %struct.command** %command.addr, align 4
  %value179 = getelementptr inbounds %struct.command, %struct.command* %127, i32 0, i32 4
  %Connection180 = bitcast %union.anon* %value179 to %struct.connection**
  %128 = load %struct.connection*, %struct.connection** %Connection180, align 4
  %second181 = getelementptr inbounds %struct.connection, %struct.connection* %128, i32 0, i32 2
  %129 = load %struct.command*, %struct.command** %second181, align 4
  store %struct.command* %129, %struct.command** %second, align 4
  %130 = load i32, i32* %ignore_return, align 4
  %tobool182 = icmp ne i32 %130, 0
  br i1 %tobool182, label %land.lhs.true183, label %if.end188

land.lhs.true183:                                 ; preds = %if.then178
  %131 = load %struct.command*, %struct.command** %second, align 4
  %tobool184 = icmp ne %struct.command* %131, null
  br i1 %tobool184, label %if.then185, label %if.end188

if.then185:                                       ; preds = %land.lhs.true183
  %132 = load %struct.command*, %struct.command** %second, align 4
  %flags186 = getelementptr inbounds %struct.command, %struct.command* %132, i32 0, i32 1
  %133 = load i32, i32* %flags186, align 4
  %or187 = or i32 %133, 8
  store i32 %or187, i32* %flags186, align 4
  br label %if.end188

if.end188:                                        ; preds = %if.then185, %land.lhs.true183, %if.then178
  %134 = load %struct.command*, %struct.command** %second, align 4
  %call189 = call i32 @execute_command(%struct.command* %134)
  store i32 %call189, i32* %exec_result, align 4
  br label %if.end190

if.end190:                                        ; preds = %if.end188, %land.lhs.true175, %lor.lhs.false
  %135 = load i32, i32* @executing_list, align 4
  %dec191 = add nsw i32 %135, -1
  store i32 %dec191, i32* @executing_list, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %136 = load %struct.command*, %struct.command** %command.addr, align 4
  %value192 = getelementptr inbounds %struct.command, %struct.command* %136, i32 0, i32 4
  %Connection193 = bitcast %union.anon* %value192 to %struct.connection**
  %137 = load %struct.connection*, %struct.connection** %Connection193, align 4
  %connector194 = getelementptr inbounds %struct.connection, %struct.connection* %137, i32 0, i32 3
  %138 = load i32, i32* %connector194, align 4
  call void @command_error(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.23, i32 0, i32 0), i32 2, i32 %138, i32 0)
  call void @jump_to_top_level(i32 2) #5
  unreachable

sw.epilog:                                        ; preds = %if.end190, %if.then133, %if.end130, %do.end85, %if.end39
  %139 = load i32, i32* %exec_result, align 4
  store i32 %139, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then
  %140 = load i32, i32* %retval, align 4
  ret i32 %140
}

; Function Attrs: noinline nounwind
define internal i32 @execute_arith_command(%struct.arith_com* %arith_command) #0 {
entry:
  %retval = alloca i32, align 4
  %arith_command.addr = alloca %struct.arith_com*, align 4
  %expok = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %expresult = alloca i64, align 8
  %new = alloca %struct.word_list*, align 4
  %exp = alloca i8*, align 4
  store %struct.arith_com* %arith_command, %struct.arith_com** %arith_command.addr, align 4
  store i64 0, i64* %expresult, align 8
  %0 = load i32, i32* @line_number, align 4
  store i32 %0, i32* %save_line_number, align 4
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8** @this_command_name, align 4
  %1 = load %struct.arith_com*, %struct.arith_com** %arith_command.addr, align 4
  %line = getelementptr inbounds %struct.arith_com, %struct.arith_com* %1, i32 0, i32 1
  %2 = load i32, i32* %line, align 4
  store i32 %2, i32* @line_number, align 4
  %3 = load i32, i32* @variable_context, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* @interactive_shell, align 4
  %tobool2 = icmp ne i32 %4, 0
  br i1 %tobool2, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* @function_line_number, align 4
  %6 = load i32, i32* @line_number, align 4
  %sub = sub nsw i32 %6, %5
  store i32 %sub, i32* @line_number, align 4
  %7 = load i32, i32* @line_number, align 4
  %cmp = icmp slt i32 %7, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* @line_number, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  store i32 0, i32* @command_string_index, align 4
  %8 = load %struct.arith_com*, %struct.arith_com** %arith_command.addr, align 4
  %exp5 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %8, i32 0, i32 2
  %9 = load %struct.word_list*, %struct.word_list** %exp5, align 4
  call void @print_arith_command(%struct.word_list* %9)
  %call = call i32 @signal_in_progress(i32 65)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %if.then7, label %if.end14

if.then7:                                         ; preds = %if.end4
  br label %do.body

do.body:                                          ; preds = %if.then7
  %10 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool8 = icmp ne i8* %10, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  %11 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3598)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %12 = load i8*, i8** @the_printed_command, align 4
  %call11 = call i32 @strlen(i8* %12)
  %add = add i32 1, %call11
  %call12 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3599)
  %13 = load i8*, i8** @the_printed_command, align 4
  %call13 = call i8* @strcpy(i8* %call12, i8* %13)
  store i8* %call13, i8** @the_printed_command_except_trap, align 4
  br label %if.end14

if.end14:                                         ; preds = %do.end, %if.end4
  %call15 = call i32 @run_debug_trap()
  store i32 %call15, i32* %retval1, align 4
  %14 = load i32, i32* @debugging_mode, align 4
  %tobool16 = icmp ne i32 %14, 0
  br i1 %tobool16, label %land.lhs.true17, label %if.end20

land.lhs.true17:                                  ; preds = %if.end14
  %15 = load i32, i32* %retval1, align 4
  %cmp18 = icmp ne i32 %15, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true17
  %16 = load i32, i32* %save_line_number, align 4
  store i32 %16, i32* @line_number, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %land.lhs.true17, %if.end14
  %17 = load %struct.arith_com*, %struct.arith_com** %arith_command.addr, align 4
  %exp21 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %17, i32 0, i32 2
  %18 = load %struct.word_list*, %struct.word_list** %exp21, align 4
  %call22 = call %struct.word_list* @expand_words_no_vars(%struct.word_list* %18)
  store %struct.word_list* %call22, %struct.word_list** %new, align 4
  %19 = load i32, i32* @echo_command_at_execute, align 4
  %tobool23 = icmp ne i32 %19, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end20
  %20 = load %struct.word_list*, %struct.word_list** %new, align 4
  call void @xtrace_print_arith_cmd(%struct.word_list* %20)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end20
  %21 = load %struct.word_list*, %struct.word_list** %new, align 4
  %tobool26 = icmp ne %struct.word_list* %21, null
  br i1 %tobool26, label %if.then27, label %if.else

if.then27:                                        ; preds = %if.end25
  %22 = load %struct.word_list*, %struct.word_list** %new, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %22, i32 0, i32 0
  %23 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool28 = icmp ne %struct.word_list* %23, null
  br i1 %tobool28, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then27
  %24 = load %struct.word_list*, %struct.word_list** %new, align 4
  %call29 = call i8* @string_list(%struct.word_list* %24)
  br label %cond.end

cond.false:                                       ; preds = %if.then27
  %25 = load %struct.word_list*, %struct.word_list** %new, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 1
  %26 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word30 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word30, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call29, %cond.true ], [ %27, %cond.false ]
  store i8* %cond, i8** %exp, align 4
  %28 = load i8*, i8** %exp, align 4
  %call31 = call i64 @evalexp(i8* %28, i32* %expok)
  store i64 %call31, i64* %expresult, align 8
  %29 = load i32, i32* %save_line_number, align 4
  store i32 %29, i32* @line_number, align 4
  %30 = load i8*, i8** %exp, align 4
  %31 = load %struct.word_list*, %struct.word_list** %new, align 4
  %word32 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word32, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word33, align 4
  %cmp34 = icmp ne i8* %30, %33
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %cond.end
  %34 = load i8*, i8** %exp, align 4
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3629)
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %cond.end
  %35 = load %struct.word_list*, %struct.word_list** %new, align 4
  call void @dispose_words(%struct.word_list* %35)
  br label %if.end37

if.else:                                          ; preds = %if.end25
  store i64 0, i64* %expresult, align 8
  store i32 1, i32* %expok, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.else, %if.end36
  %36 = load i32, i32* %expok, align 4
  %cmp38 = icmp eq i32 %36, 0
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end37
  store i32 1, i32* %retval, align 4
  br label %return

if.end40:                                         ; preds = %if.end37
  %37 = load i64, i64* %expresult, align 8
  %cmp41 = icmp eq i64 %37, 0
  %cond42 = select i1 %cmp41, i32 1, i32 0
  store i32 %cond42, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end40, %if.then39, %if.then19
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind
define internal i32 @execute_cond_command(%struct.cond_com* %cond_command) #0 {
entry:
  %retval = alloca i32, align 4
  %cond_command.addr = alloca %struct.cond_com*, align 4
  %retval1 = alloca i32, align 4
  %save_line_number = alloca i32, align 4
  store %struct.cond_com* %cond_command, %struct.cond_com** %cond_command.addr, align 4
  store i32 0, i32* %retval1, align 4
  %0 = load i32, i32* @line_number, align 4
  store i32 %0, i32* %save_line_number, align 4
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8** @this_command_name, align 4
  %1 = load %struct.cond_com*, %struct.cond_com** %cond_command.addr, align 4
  %line = getelementptr inbounds %struct.cond_com, %struct.cond_com* %1, i32 0, i32 1
  %2 = load i32, i32* %line, align 4
  store i32 %2, i32* @line_number, align 4
  %3 = load i32, i32* @variable_context, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* @interactive_shell, align 4
  %tobool2 = icmp ne i32 %4, 0
  br i1 %tobool2, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* @function_line_number, align 4
  %6 = load i32, i32* @line_number, align 4
  %sub = sub nsw i32 %6, %5
  store i32 %sub, i32* @line_number, align 4
  %7 = load i32, i32* @line_number, align 4
  %cmp = icmp slt i32 %7, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* @line_number, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  store i32 0, i32* @command_string_index, align 4
  %8 = load %struct.cond_com*, %struct.cond_com** %cond_command.addr, align 4
  call void @print_cond_command(%struct.cond_com* %8)
  %call = call i32 @signal_in_progress(i32 65)
  %cmp5 = icmp eq i32 %call, 0
  br i1 %cmp5, label %if.then6, label %if.end13

if.then6:                                         ; preds = %if.end4
  br label %do.body

do.body:                                          ; preds = %if.then6
  %9 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool7 = icmp ne i8* %9, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %do.body
  %10 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3799)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end9
  %11 = load i8*, i8** @the_printed_command, align 4
  %call10 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call10
  %call11 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3800)
  %12 = load i8*, i8** @the_printed_command, align 4
  %call12 = call i8* @strcpy(i8* %call11, i8* %12)
  store i8* %call12, i8** @the_printed_command_except_trap, align 4
  br label %if.end13

if.end13:                                         ; preds = %do.end, %if.end4
  %call14 = call i32 @run_debug_trap()
  store i32 %call14, i32* %retval1, align 4
  %13 = load i32, i32* @debugging_mode, align 4
  %tobool15 = icmp ne i32 %13, 0
  br i1 %tobool15, label %land.lhs.true16, label %if.end19

land.lhs.true16:                                  ; preds = %if.end13
  %14 = load i32, i32* %retval1, align 4
  %cmp17 = icmp ne i32 %14, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %land.lhs.true16
  %15 = load i32, i32* %save_line_number, align 4
  store i32 %15, i32* @line_number, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %land.lhs.true16, %if.end13
  %16 = load %struct.cond_com*, %struct.cond_com** %cond_command.addr, align 4
  %call20 = call i32 @execute_cond_node(%struct.cond_com* %16)
  store i32 %call20, i32* %retval1, align 4
  store volatile i32 %call20, i32* @last_command_exit_value, align 4
  %17 = load i32, i32* %save_line_number, align 4
  store i32 %17, i32* @line_number, align 4
  %18 = load i32, i32* %retval1, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end19, %if.then18
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind
define internal i32 @execute_intern_function(%struct.word_desc* %name, %struct.function_def* %funcdef) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca %struct.word_desc*, align 4
  %funcdef.addr = alloca %struct.function_def*, align 4
  %var = alloca %struct.variable*, align 4
  store %struct.word_desc* %name, %struct.word_desc** %name.addr, align 4
  store %struct.function_def* %funcdef, %struct.function_def** %funcdef.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %1 = load i32, i32* @posixly_correct, align 4
  %call = call i32 @check_identifier(%struct.word_desc* %0, i32 %1)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* @interactive_shell, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %land.lhs.true
  store volatile i32 2, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 4) #5
  unreachable

if.end:                                           ; preds = %land.lhs.true, %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %entry
  %4 = load i32, i32* @posixly_correct, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %land.lhs.true5, label %if.end12

land.lhs.true5:                                   ; preds = %if.end3
  %5 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word, align 4
  %call6 = call i32 (%struct.word_list*)* @find_special_builtin(i8* %6)
  %tobool7 = icmp ne i32 (%struct.word_list*)* %call6, null
  br i1 %tobool7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %land.lhs.true5
  %call9 = call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.61, i32 0, i32 0))
  %7 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word10, align 4
  call void (i8*, ...) @internal_error(i8* %call9, i8* %8)
  store volatile i32 2, i32* @last_command_exit_value, align 4
  %9 = load i32, i32* @interactive_shell, align 4
  %tobool11 = icmp ne i32 %9, 0
  %cond = select i1 %tobool11, i32 2, i32 4
  call void @jump_to_top_level(i32 %cond) #5
  unreachable

if.end12:                                         ; preds = %land.lhs.true5, %if.end3
  %10 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %word13 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word13, align 4
  %call14 = call %struct.variable* @find_function(i8* %11)
  store %struct.variable* %call14, %struct.variable** %var, align 4
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool15 = icmp ne %struct.variable* %12, null
  br i1 %tobool15, label %land.lhs.true16, label %if.end29

land.lhs.true16:                                  ; preds = %if.end12
  %13 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes, align 4
  %and = and i32 %14, 2
  %tobool17 = icmp ne i32 %and, 0
  br i1 %tobool17, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true16
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes18 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes18, align 4
  %and19 = and i32 %16, 16384
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.end29

if.then21:                                        ; preds = %lor.lhs.false, %land.lhs.true16
  %17 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %18, 2
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %if.then25, label %if.end28

if.then25:                                        ; preds = %if.then21
  %call26 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.62, i32 0, i32 0))
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %name27 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 0
  %20 = load i8*, i8** %name27, align 4
  call void (i8*, ...) @internal_error(i8* %call26, i8* %20)
  br label %if.end28

if.end28:                                         ; preds = %if.then25, %if.then21
  store i32 1, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %lor.lhs.false, %if.end12
  %21 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %word30 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word30, align 4
  %23 = load %struct.function_def*, %struct.function_def** %funcdef.addr, align 4
  call void @bind_function_def(i8* %22, %struct.function_def* %23)
  %24 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %word31 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word31, align 4
  %26 = load %struct.function_def*, %struct.function_def** %funcdef.addr, align 4
  %command = getelementptr inbounds %struct.function_def, %struct.function_def* %26, i32 0, i32 3
  %27 = load %struct.command*, %struct.command** %command, align 4
  %call32 = call %struct.variable* @bind_function(i8* %25, %struct.command* %27)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.end28, %if.end
  %28 = load i32, i32* %retval, align 4
  ret i32 %28
}

declare void @command_error(i8*, i32, i32, i32) #1

declare void @close_new_fifos(i8*, i32) #1

declare void @set_pipestatus_from_exit(i32) #1

; Function Attrs: noinline nounwind
define %struct.coproc* @getcoprocbypid(i32 %pid) #0 {
entry:
  %pid.addr = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %1 = load i32, i32* getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 1), align 4
  %cmp = icmp eq i32 %0, %1
  %cond = select i1 %cmp, %struct.coproc* @sh_coproc, %struct.coproc* null
  ret %struct.coproc* %cond
}

; Function Attrs: noinline nounwind
define %struct.coproc* @getcoprocbyname(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 0), align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.rhs, label %land.end7

land.rhs:                                         ; preds = %entry
  %1 = load i8*, i8** getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 0), align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i8*, i8** %name.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, %conv2
  br i1 %cmp, label %land.rhs4, label %land.end

land.rhs4:                                        ; preds = %land.rhs
  %5 = load i8*, i8** getelementptr inbounds (%struct.coproc, %struct.coproc* @sh_coproc, i32 0, i32 0), align 4
  %6 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strcmp(i8* %5, i8* %6)
  %cmp5 = icmp eq i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs4, %land.rhs
  %7 = phi i1 [ false, %land.rhs ], [ %cmp5, %land.rhs4 ]
  br label %land.end7

land.end7:                                        ; preds = %land.end, %entry
  %8 = phi i1 [ false, %entry ], [ %7, %land.end ]
  %cond = select i1 %8, %struct.coproc* @sh_coproc, %struct.coproc* null
  ret %struct.coproc* %cond
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @coproc_init(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 0
  store i8* null, i8** %c_name, align 4
  %1 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_pid = getelementptr inbounds %struct.coproc, %struct.coproc* %1, i32 0, i32 1
  store i32 -1, i32* %c_pid, align 4
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 3
  store i32 -1, i32* %c_wfd, align 4
  %3 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %3, i32 0, i32 2
  store i32 -1, i32* %c_rfd, align 4
  %4 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wsave = getelementptr inbounds %struct.coproc, %struct.coproc* %4, i32 0, i32 5
  store i32 -1, i32* %c_wsave, align 4
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rsave = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 4
  store i32 -1, i32* %c_rsave, align 4
  %6 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_lock = getelementptr inbounds %struct.coproc, %struct.coproc* %6, i32 0, i32 8
  store i32 0, i32* %c_lock, align 4
  %7 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_status = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 7
  store i32 0, i32* %c_status, align 4
  %8 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_flags = getelementptr inbounds %struct.coproc, %struct.coproc* %8, i32 0, i32 6
  store i32 0, i32* %c_flags, align 4
  ret void
}

; Function Attrs: noinline nounwind
define %struct.coproc* @coproc_alloc(i8* %name, i32 %pid) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %pid.addr = alloca i32, align 4
  %cp = alloca %struct.coproc*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store %struct.coproc* @sh_coproc, %struct.coproc** %cp, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp, align 4
  call void @coproc_init(%struct.coproc* %0)
  %1 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_lock = getelementptr inbounds %struct.coproc, %struct.coproc* %1, i32 0, i32 8
  store i32 2, i32* %c_lock, align 4
  %2 = load i32, i32* %pid.addr, align 4
  %3 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_pid = getelementptr inbounds %struct.coproc, %struct.coproc* %3, i32 0, i32 1
  store i32 %2, i32* %c_pid, align 4
  %4 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strlen(i8* %4)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1959)
  %5 = load i8*, i8** %name.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %5)
  %6 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_name = getelementptr inbounds %struct.coproc, %struct.coproc* %6, i32 0, i32 0
  store i8* %call2, i8** %c_name, align 4
  %7 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_lock3 = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 8
  store i32 0, i32* %c_lock3, align 4
  %8 = load %struct.coproc*, %struct.coproc** %cp, align 4
  ret %struct.coproc* %8
}

; Function Attrs: noinline nounwind
define void @coproc_dispose(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %set = alloca %struct.__sigset_t, align 4
  %oset = alloca %struct.__sigset_t, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %cmp = icmp eq %struct.coproc* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_lock = getelementptr inbounds %struct.coproc, %struct.coproc* %1, i32 0, i32 8
  store i32 3, i32* %c_lock, align 4
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  call void @coproc_unsetvars(%struct.coproc* %2)
  br label %do.body

do.body:                                          ; preds = %if.end
  %3 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name = getelementptr inbounds %struct.coproc, %struct.coproc* %3, i32 0, i32 0
  %4 = load i8*, i8** %c_name, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %do.body
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name2 = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 0
  %6 = load i8*, i8** %c_name2, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1986)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end3
  %7 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  call void @coproc_close(%struct.coproc* %7)
  %8 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  call void @coproc_init(%struct.coproc* %8)
  %9 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_lock4 = getelementptr inbounds %struct.coproc, %struct.coproc* %9, i32 0, i32 8
  store i32 0, i32* %c_lock4, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_unsetvars(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %l = alloca i32, align 4
  %namevar = alloca i8*, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 0
  %1 = load i8*, i8** %c_name, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name1 = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 0
  %3 = load i8*, i8** %c_name1, align 4
  %call = call i32 @strlen(i8* %3)
  store i32 %call, i32* %l, align 4
  %4 = load i32, i32* %l, align 4
  %add = add nsw i32 %4, 16
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2247)
  store i8* %call2, i8** %namevar, align 4
  %5 = load i8*, i8** %namevar, align 4
  %6 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name3 = getelementptr inbounds %struct.coproc, %struct.coproc* %6, i32 0, i32 0
  %7 = load i8*, i8** %c_name3, align 4
  %call4 = call i32 (i8*, i8*, ...) @sprintf(i8* %5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* %7)
  %8 = load i8*, i8** %namevar, align 4
  %call5 = call i32 @unbind_variable_noref(i8* %8)
  %9 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name6 = getelementptr inbounds %struct.coproc, %struct.coproc* %9, i32 0, i32 0
  %10 = load i8*, i8** %c_name6, align 4
  %call7 = call i32 @check_unbind_variable(i8* %10)
  %11 = load i8*, i8** %namevar, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2261)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_close(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 2
  %1 = load i32, i32* %c_rfd, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd1 = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 2
  %3 = load i32, i32* %c_rfd1, align 4
  %call = call i32 @close(i32 %3)
  %4 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd2 = getelementptr inbounds %struct.coproc, %struct.coproc* %4, i32 0, i32 2
  store i32 -1, i32* %c_rfd2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 3
  %6 = load i32, i32* %c_wfd, align 4
  %cmp3 = icmp sge i32 %6, 0
  br i1 %cmp3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.end
  %7 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd5 = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 3
  %8 = load i32, i32* %c_wfd5, align 4
  %call6 = call i32 @close(i32 %8)
  %9 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd7 = getelementptr inbounds %struct.coproc, %struct.coproc* %9, i32 0, i32 3
  store i32 -1, i32* %c_wfd7, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %if.end
  %10 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wsave = getelementptr inbounds %struct.coproc, %struct.coproc* %10, i32 0, i32 5
  store i32 -1, i32* %c_wsave, align 4
  %11 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rsave = getelementptr inbounds %struct.coproc, %struct.coproc* %11, i32 0, i32 4
  store i32 -1, i32* %c_rsave, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_flush() #0 {
entry:
  call void @coproc_dispose(%struct.coproc* @sh_coproc)
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_closeall() #0 {
entry:
  call void @coproc_close(%struct.coproc* @sh_coproc)
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_reap() #0 {
entry:
  %cp = alloca %struct.coproc*, align 4
  store %struct.coproc* @sh_coproc, %struct.coproc** %cp, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %tobool = icmp ne %struct.coproc* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_flags = getelementptr inbounds %struct.coproc, %struct.coproc* %1, i32 0, i32 6
  %2 = load i32, i32* %c_flags, align 4
  %and = and i32 %2, 2
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct.coproc*, %struct.coproc** %cp, align 4
  call void @coproc_dispose(%struct.coproc* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_rclose(%struct.coproc* %cp, i32 %fd) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %fd.addr = alloca i32, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 2
  %1 = load i32, i32* %c_rfd, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd1 = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 2
  %3 = load i32, i32* %c_rfd1, align 4
  %4 = load i32, i32* %fd.addr, align 4
  %cmp2 = icmp eq i32 %3, %4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd3 = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 2
  %6 = load i32, i32* %c_rfd3, align 4
  %call = call i32 @close(i32 %6)
  %7 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd4 = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 2
  store i32 -1, i32* %c_rfd4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_wclose(%struct.coproc* %cp, i32 %fd) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %fd.addr = alloca i32, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 3
  %1 = load i32, i32* %c_wfd, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd1 = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 3
  %3 = load i32, i32* %c_wfd1, align 4
  %4 = load i32, i32* %fd.addr, align 4
  %cmp2 = icmp eq i32 %3, %4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd3 = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 3
  %6 = load i32, i32* %c_wfd3, align 4
  %call = call i32 @close(i32 %6)
  %7 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd4 = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 3
  store i32 -1, i32* %c_wfd4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_checkfd(%struct.coproc* %cp, i32 %fd) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %fd.addr = alloca i32, align 4
  %update = alloca i32, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i32 0, i32* %update, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 2
  %1 = load i32, i32* %c_rfd, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd1 = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 2
  %3 = load i32, i32* %c_rfd1, align 4
  %4 = load i32, i32* %fd.addr, align 4
  %cmp2 = icmp eq i32 %3, %4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd3 = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 2
  store i32 -1, i32* %c_rfd3, align 4
  store i32 -1, i32* %update, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %6, i32 0, i32 3
  %7 = load i32, i32* %c_wfd, align 4
  %cmp4 = icmp sge i32 %7, 0
  br i1 %cmp4, label %land.lhs.true5, label %if.end10

land.lhs.true5:                                   ; preds = %if.end
  %8 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd6 = getelementptr inbounds %struct.coproc, %struct.coproc* %8, i32 0, i32 3
  %9 = load i32, i32* %c_wfd6, align 4
  %10 = load i32, i32* %fd.addr, align 4
  %cmp7 = icmp eq i32 %9, %10
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %land.lhs.true5
  %11 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd9 = getelementptr inbounds %struct.coproc, %struct.coproc* %11, i32 0, i32 3
  store i32 -1, i32* %c_wfd9, align 4
  store i32 -1, i32* %update, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %land.lhs.true5, %if.end
  %12 = load i32, i32* %update, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end10
  %13 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  call void @coproc_setvars(%struct.coproc* %13)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end10
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_setvars(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %v = alloca %struct.variable*, align 4
  %namevar = alloca i8*, align 4
  %t = alloca i8*, align 4
  %l = alloca i32, align 4
  %w = alloca %struct.word_desc, align 4
  %ind = alloca i64, align 8
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 0
  %1 = load i8*, i8** %c_name, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name1 = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 0
  %3 = load i8*, i8** %c_name1, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %w, i32 0, i32 0
  store i8* %3, i8** %word, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %w, i32 0, i32 1
  store i32 0, i32* %flags, align 4
  %call = call i32 @check_identifier(%struct.word_desc* %w, i32 1)
  %cmp2 = icmp eq i32 %call, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name5 = getelementptr inbounds %struct.coproc, %struct.coproc* %4, i32 0, i32 0
  %5 = load i8*, i8** %c_name5, align 4
  %call6 = call i32 @strlen(i8* %5)
  store i32 %call6, i32* %l, align 4
  %6 = load i32, i32* %l, align 4
  %add = add nsw i32 %6, 16
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2178)
  store i8* %call7, i8** %namevar, align 4
  %7 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name8 = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 0
  %8 = load i8*, i8** %c_name8, align 4
  %call9 = call %struct.variable* @find_variable(i8* %8)
  store %struct.variable* %call9, %struct.variable** %v, align 4
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp10 = icmp eq %struct.variable* %9, null
  br i1 %cmp10, label %if.then11, label %if.end29

if.then11:                                        ; preds = %if.end4
  %10 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name12 = getelementptr inbounds %struct.coproc, %struct.coproc* %10, i32 0, i32 0
  %11 = load i8*, i8** %c_name12, align 4
  %call13 = call %struct.variable* @find_variable_nameref_for_create(i8* %11, i32 1)
  store %struct.variable* %call13, %struct.variable** %v, align 4
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp14 = icmp eq %struct.variable* %12, @nameref_invalid_value
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.then11
  br label %return

if.end16:                                         ; preds = %if.then11
  %13 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %13, null
  br i1 %tobool, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %if.end16
  %14 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes, align 4
  %and = and i32 %15, 2048
  %tobool17 = icmp ne i32 %and, 0
  br i1 %tobool17, label %if.then18, label %if.end28

if.then18:                                        ; preds = %land.lhs.true
  %16 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name19 = getelementptr inbounds %struct.coproc, %struct.coproc* %16, i32 0, i32 0
  %17 = load i8*, i8** %c_name19, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2191)
  %18 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 1
  %19 = load i8*, i8** %value, align 4
  %call20 = call i32 @strlen(i8* %19)
  %add21 = add i32 1, %call20
  %call22 = call i8* @sh_xmalloc(i32 %add21, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2192)
  %20 = load %struct.variable*, %struct.variable** %v, align 4
  %value23 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 1
  %21 = load i8*, i8** %value23, align 4
  %call24 = call i8* @strcpy(i8* %call22, i8* %21)
  %22 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name25 = getelementptr inbounds %struct.coproc, %struct.coproc* %22, i32 0, i32 0
  store i8* %call24, i8** %c_name25, align 4
  %23 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name26 = getelementptr inbounds %struct.coproc, %struct.coproc* %23, i32 0, i32 0
  %24 = load i8*, i8** %c_name26, align 4
  %call27 = call %struct.variable* @make_new_array_variable(i8* %24)
  store %struct.variable* %call27, %struct.variable** %v, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then18, %land.lhs.true, %if.end16
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.end4
  %25 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool30 = icmp ne %struct.variable* %25, null
  br i1 %tobool30, label %land.lhs.true31, label %if.end45

land.lhs.true31:                                  ; preds = %if.end29
  %26 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes32 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes32, align 4
  %and33 = and i32 %27, 2
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %if.then38, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true31
  %28 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes35 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes35, align 4
  %and36 = and i32 %29, 16384
  %tobool37 = icmp ne i32 %and36, 0
  br i1 %tobool37, label %if.then38, label %if.end45

if.then38:                                        ; preds = %lor.lhs.false, %land.lhs.true31
  %30 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes39 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes39, align 4
  %and40 = and i32 %31, 2
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.then38
  %32 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name43 = getelementptr inbounds %struct.coproc, %struct.coproc* %32, i32 0, i32 0
  %33 = load i8*, i8** %c_name43, align 4
  call void @err_readonly(i8* %33)
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.then38
  br label %return

if.end45:                                         ; preds = %lor.lhs.false, %if.end29
  %34 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp46 = icmp eq %struct.variable* %34, null
  br i1 %cmp46, label %if.then47, label %if.end50

if.then47:                                        ; preds = %if.end45
  %35 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name48 = getelementptr inbounds %struct.coproc, %struct.coproc* %35, i32 0, i32 0
  %36 = load i8*, i8** %c_name48, align 4
  %call49 = call %struct.variable* @make_new_array_variable(i8* %36)
  store %struct.variable* %call49, %struct.variable** %v, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then47, %if.end45
  %37 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes51 = getelementptr inbounds %struct.variable, %struct.variable* %37, i32 0, i32 5
  %38 = load i32, i32* %attributes51, align 4
  %and52 = and i32 %38, 4
  %cmp53 = icmp eq i32 %and52, 0
  br i1 %cmp53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %if.end50
  %39 = load %struct.variable*, %struct.variable** %v, align 4
  %call55 = call %struct.variable* @convert_var_to_array(%struct.variable* %39)
  store %struct.variable* %call55, %struct.variable** %v, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %if.end50
  %40 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %40, i32 0, i32 2
  %41 = load i32, i32* %c_rfd, align 4
  %conv = sext i32 %41 to i64
  %call57 = call i8* @itos(i64 %conv)
  store i8* %call57, i8** %t, align 4
  store i64 0, i64* %ind, align 8
  %42 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name58 = getelementptr inbounds %struct.coproc, %struct.coproc* %42, i32 0, i32 0
  %43 = load i8*, i8** %c_name58, align 4
  %44 = load i64, i64* %ind, align 8
  %45 = load i8*, i8** %t, align 4
  %call59 = call %struct.variable* @bind_array_variable(i8* %43, i64 %44, i8* %45, i32 0)
  store %struct.variable* %call59, %struct.variable** %v, align 4
  %46 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %46, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2211)
  %47 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %47, i32 0, i32 3
  %48 = load i32, i32* %c_wfd, align 4
  %conv60 = sext i32 %48 to i64
  %call61 = call i8* @itos(i64 %conv60)
  store i8* %call61, i8** %t, align 4
  store i64 1, i64* %ind, align 8
  %49 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name62 = getelementptr inbounds %struct.coproc, %struct.coproc* %49, i32 0, i32 0
  %50 = load i8*, i8** %c_name62, align 4
  %51 = load i64, i64* %ind, align 8
  %52 = load i8*, i8** %t, align 4
  %call63 = call %struct.variable* @bind_array_variable(i8* %50, i64 %51, i8* %52, i32 0)
  %53 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %53, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2216)
  %54 = load i8*, i8** %namevar, align 4
  %55 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_name64 = getelementptr inbounds %struct.coproc, %struct.coproc* %55, i32 0, i32 0
  %56 = load i8*, i8** %c_name64, align 4
  %call65 = call i32 (i8*, i8*, ...) @sprintf(i8* %54, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8* %56)
  %57 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_pid = getelementptr inbounds %struct.coproc, %struct.coproc* %57, i32 0, i32 1
  %58 = load i32, i32* %c_pid, align 4
  %conv66 = sext i32 %58 to i64
  %call67 = call i8* @itos(i64 %conv66)
  store i8* %call67, i8** %t, align 4
  %59 = load i8*, i8** %namevar, align 4
  %60 = load i8*, i8** %t, align 4
  %call68 = call %struct.variable* @bind_variable(i8* %59, i8* %60, i32 0)
  %61 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %61, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2231)
  %62 = load i8*, i8** %namevar, align 4
  call void @sh_xfree(i8* %62, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2233)
  br label %return

return:                                           ; preds = %if.end56, %if.end44, %if.then15, %if.then3, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_fdchk(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  call void @coproc_checkfd(%struct.coproc* @sh_coproc, i32 %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_fdclose(%struct.coproc* %cp, i32 %fd) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  %fd.addr = alloca i32, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %1 = load i32, i32* %fd.addr, align 4
  call void @coproc_rclose(%struct.coproc* %0, i32 %1)
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %3 = load i32, i32* %fd.addr, align 4
  call void @coproc_wclose(%struct.coproc* %2, i32 %3)
  %4 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  call void @coproc_setvars(%struct.coproc* %4)
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_fdsave(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 2
  %1 = load i32, i32* %c_rfd, align 4
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rsave = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 4
  store i32 %1, i32* %c_rsave, align 4
  %3 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %3, i32 0, i32 3
  %4 = load i32, i32* %c_wfd, align 4
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wsave = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 5
  store i32 %4, i32* %c_wsave, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_fdrestore(%struct.coproc* %cp) #0 {
entry:
  %cp.addr = alloca %struct.coproc*, align 4
  store %struct.coproc* %cp, %struct.coproc** %cp.addr, align 4
  %0 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rsave = getelementptr inbounds %struct.coproc, %struct.coproc* %0, i32 0, i32 4
  %1 = load i32, i32* %c_rsave, align 4
  %2 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_rfd = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 2
  store i32 %1, i32* %c_rfd, align 4
  %3 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wsave = getelementptr inbounds %struct.coproc, %struct.coproc* %3, i32 0, i32 5
  %4 = load i32, i32* %c_wsave, align 4
  %5 = load %struct.coproc*, %struct.coproc** %cp.addr, align 4
  %c_wfd = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 3
  store i32 %4, i32* %c_wfd, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @coproc_pidchk(i32 %pid, i32 %status) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %status.addr = alloca i32, align 4
  %cp = alloca %struct.coproc*, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %status, i32* %status.addr, align 4
  %0 = load i32, i32* %pid.addr, align 4
  %call = call %struct.coproc* @getcoprocbypid(i32 %0)
  store %struct.coproc* %call, %struct.coproc** %cp, align 4
  %1 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %tobool = icmp ne %struct.coproc* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_lock = getelementptr inbounds %struct.coproc, %struct.coproc* %2, i32 0, i32 8
  store i32 4, i32* %c_lock, align 4
  %3 = load i32, i32* %status.addr, align 4
  %4 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_status = getelementptr inbounds %struct.coproc, %struct.coproc* %4, i32 0, i32 7
  store i32 %3, i32* %c_status, align 4
  %5 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_flags = getelementptr inbounds %struct.coproc, %struct.coproc* %5, i32 0, i32 6
  %6 = load i32, i32* %c_flags, align 4
  %or = or i32 %6, 2
  store i32 %or, i32* %c_flags, align 4
  %7 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_flags1 = getelementptr inbounds %struct.coproc, %struct.coproc* %7, i32 0, i32 6
  %8 = load i32, i32* %c_flags1, align 4
  %and = and i32 %8, -2
  store i32 %and, i32* %c_flags1, align 4
  %9 = load %struct.coproc*, %struct.coproc** %cp, align 4
  %c_lock2 = getelementptr inbounds %struct.coproc, %struct.coproc* %9, i32 0, i32 8
  store i32 0, i32* %c_lock2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @check_identifier(%struct.word_desc*, i32) #1

declare %struct.variable* @find_variable(i8*) #1

declare %struct.variable* @find_variable_nameref_for_create(i8*, i32) #1

declare %struct.variable* @make_new_array_variable(i8*) #1

declare void @err_readonly(i8*) #1

declare %struct.variable* @convert_var_to_array(%struct.variable*) #1

declare i8* @itos(i64) #1

declare %struct.variable* @bind_array_variable(i8*, i64, i8*, i32) #1

declare i32 @sprintf(i8*, i8*, ...) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare i32 @unbind_variable_noref(i8*) #1

declare i32 @check_unbind_variable(i8*) #1

; Function Attrs: noinline nounwind
define void @restore_funcarray_state(%struct.func_array_state* %fa) #0 {
entry:
  %fa.addr = alloca %struct.func_array_state*, align 4
  %nfv = alloca %struct.variable*, align 4
  %funcname_a = alloca %struct.array*, align 4
  store %struct.func_array_state* %fa, %struct.func_array_state** %fa.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.func_array_state*, %struct.func_array_state** %fa.addr, align 4
  %source_a = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %0, i32 0, i32 2
  %1 = load %struct.array*, %struct.array** %source_a, align 4
  %call = call %struct.array_element* @array_shift(%struct.array* %1, i32 1, i32 0)
  call void @array_dispose_element(%struct.array_element* %call)
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %2 = load %struct.func_array_state*, %struct.func_array_state** %fa.addr, align 4
  %lineno_a = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %2, i32 0, i32 4
  %3 = load %struct.array*, %struct.array** %lineno_a, align 4
  %call2 = call %struct.array_element* @array_shift(%struct.array* %3, i32 1, i32 0)
  call void @array_dispose_element(%struct.array_element* %call2)
  br label %do.end3

do.end3:                                          ; preds = %do.body1
  br label %do.body4

do.body4:                                         ; preds = %do.end3
  %call5 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0))
  store %struct.variable* %call5, %struct.variable** %nfv, align 4
  %4 = load %struct.variable*, %struct.variable** %nfv, align 4
  %tobool = icmp ne %struct.variable* %4, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %do.body4
  %5 = load %struct.variable*, %struct.variable** %nfv, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes, align 4
  %and = and i32 %6, 4
  %tobool6 = icmp ne i32 %and, 0
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %7 = load %struct.variable*, %struct.variable** %nfv, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 4
  %9 = bitcast i8* %8 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %do.body4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %9, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %funcname_a, align 4
  br label %do.end7

do.end7:                                          ; preds = %cond.end
  %10 = load %struct.variable*, %struct.variable** %nfv, align 4
  %11 = load %struct.func_array_state*, %struct.func_array_state** %fa.addr, align 4
  %funcname_v = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %11, i32 0, i32 1
  %12 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %cmp = icmp eq %struct.variable* %10, %12
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.end7
  br label %do.body8

do.body8:                                         ; preds = %if.then
  %13 = load %struct.array*, %struct.array** %funcname_a, align 4
  %call9 = call %struct.array_element* @array_shift(%struct.array* %13, i32 1, i32 0)
  call void @array_dispose_element(%struct.array_element* %call9)
  br label %do.end10

do.end10:                                         ; preds = %do.body8
  br label %if.end

if.end:                                           ; preds = %do.end10, %do.end7
  %14 = load %struct.func_array_state*, %struct.func_array_state** %fa.addr, align 4
  %15 = bitcast %struct.func_array_state* %14 to i8*
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4591)
  ret void
}

declare void @array_dispose_element(%struct.array_element*) #1

declare %struct.array_element* @array_shift(%struct.array*, i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @execute_shell_function(%struct.variable* %var, %struct.word_list* %words) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %words.addr = alloca %struct.word_list*, align 4
  %ret = alloca i32, align 4
  %bitmap = alloca %struct.fd_bitmap*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  %call = call %struct.fd_bitmap* @new_fd_bitmap(i32 32)
  store %struct.fd_bitmap* %call, %struct.fd_bitmap** %bitmap, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %0 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  %1 = bitcast %struct.fd_bitmap* %0 to i8*
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void (%struct.fd_bitmap*)* @dispose_fd_bitmap to void (...)*), i8* %1)
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %3 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %4 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  %call1 = call i32 @execute_function(%struct.variable* %2, %struct.word_list* %3, i32 0, %struct.fd_bitmap* %4, i32 0, i32 0)
  store i32 %call1, i32* %ret, align 4
  %5 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  call void @dispose_fd_bitmap(%struct.fd_bitmap* %5)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %6 = load i32, i32* %ret, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @execute_function(%struct.variable* %var, %struct.word_list* %words, i32 %flags, %struct.fd_bitmap* %fds_to_close, i32 %async, i32 %subshell) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %words.addr = alloca %struct.word_list*, align 4
  %flags.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %async.addr = alloca i32, align 4
  %subshell.addr = alloca i32, align 4
  %return_val = alloca i32, align 4
  %result = alloca i32, align 4
  %tc = alloca %struct.command*, align 4
  %fc = alloca %struct.command*, align 4
  %save_current = alloca %struct.command*, align 4
  %debug_trap = alloca i8*, align 4
  %error_trap = alloca i8*, align 4
  %return_trap = alloca i8*, align 4
  %funcname_v = alloca %struct.variable*, align 4
  %bash_source_v = alloca %struct.variable*, align 4
  %bash_lineno_v = alloca %struct.variable*, align 4
  %funcname_a = alloca %struct.array*, align 4
  %bash_source_a = alloca %struct.array*, align 4
  %bash_lineno_a = alloca %struct.array*, align 4
  %fa = alloca %struct.func_array_state*, align 4
  %shell_fn = alloca %struct.function_def*, align 4
  %sfile = alloca i8*, align 4
  %t = alloca i8*, align 4
  %gs = alloca %struct.sh_getopt_state*, align 4
  %gv = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  store i32 %async, i32* %async.addr, align 4
  store i32 %subshell, i32* %subshell.addr, align 4
  %0 = load i32, i32* @funcnest_max, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @funcnest, align 4
  %2 = load i32, i32* @funcnest_max, align 4
  %cmp1 = icmp sge i32 %1, %2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.56, i32 0, i32 0))
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 0
  %4 = load i8*, i8** %name, align 4
  %5 = load i32, i32* @funcnest, align 4
  call void (i8*, ...) @internal_error(i8* %call, i8* %4, i32 %5)
  store i32 0, i32* @funcnest, align 4
  call void @jump_to_top_level(i32 2) #5
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %call2 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0))
  store %struct.variable* %call2, %struct.variable** %funcname_v, align 4
  %6 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %tobool = icmp ne %struct.variable* %6, null
  br i1 %tobool, label %land.lhs.true3, label %cond.false

land.lhs.true3:                                   ; preds = %do.body
  %7 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 4
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true3
  %9 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value, align 4
  %11 = bitcast i8* %10 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true3, %do.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %11, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %funcname_a, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  br label %do.body5

do.body5:                                         ; preds = %do.end
  %call6 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.57, i32 0, i32 0))
  store %struct.variable* %call6, %struct.variable** %bash_source_v, align 4
  %12 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %tobool7 = icmp ne %struct.variable* %12, null
  br i1 %tobool7, label %land.lhs.true8, label %cond.false14

land.lhs.true8:                                   ; preds = %do.body5
  %13 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %attributes9 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes9, align 4
  %and10 = and i32 %14, 4
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %cond.true12, label %cond.false14

cond.true12:                                      ; preds = %land.lhs.true8
  %15 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %value13 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 1
  %16 = load i8*, i8** %value13, align 4
  %17 = bitcast i8* %16 to %struct.array*
  br label %cond.end15

cond.false14:                                     ; preds = %land.lhs.true8, %do.body5
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true12
  %cond16 = phi %struct.array* [ %17, %cond.true12 ], [ null, %cond.false14 ]
  store %struct.array* %cond16, %struct.array** %bash_source_a, align 4
  br label %do.end17

do.end17:                                         ; preds = %cond.end15
  br label %do.body18

do.body18:                                        ; preds = %do.end17
  %call19 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.58, i32 0, i32 0))
  store %struct.variable* %call19, %struct.variable** %bash_lineno_v, align 4
  %18 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %tobool20 = icmp ne %struct.variable* %18, null
  br i1 %tobool20, label %land.lhs.true21, label %cond.false27

land.lhs.true21:                                  ; preds = %do.body18
  %19 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %20, 4
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %cond.true25, label %cond.false27

cond.true25:                                      ; preds = %land.lhs.true21
  %21 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %value26 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value26, align 4
  %23 = bitcast i8* %22 to %struct.array*
  br label %cond.end28

cond.false27:                                     ; preds = %land.lhs.true21, %do.body18
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false27, %cond.true25
  %cond29 = phi %struct.array* [ %23, %cond.true25 ], [ null, %cond.false27 ]
  store %struct.array* %cond29, %struct.array** %bash_lineno_a, align 4
  br label %do.end30

do.end30:                                         ; preds = %cond.end28
  %24 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value31 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 1
  %25 = load i8*, i8** %value31, align 4
  %26 = bitcast i8* %25 to %struct.command*
  %call32 = call %struct.command* @copy_command(%struct.command* %26)
  store %struct.command* %call32, %struct.command** %tc, align 4
  %27 = load %struct.command*, %struct.command** %tc, align 4
  %tobool33 = icmp ne %struct.command* %27, null
  br i1 %tobool33, label %land.lhs.true34, label %if.end39

land.lhs.true34:                                  ; preds = %do.end30
  %28 = load i32, i32* %flags.addr, align 4
  %and35 = and i32 %28, 8
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %if.then37, label %if.end39

if.then37:                                        ; preds = %land.lhs.true34
  %29 = load %struct.command*, %struct.command** %tc, align 4
  %flags38 = getelementptr inbounds %struct.command, %struct.command* %29, i32 0, i32 1
  %30 = load i32, i32* %flags38, align 4
  %or = or i32 %30, 8
  store i32 %or, i32* %flags38, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then37, %land.lhs.true34, %do.end30
  %call40 = call %struct.sh_getopt_state* @sh_getopt_save_istate()
  store %struct.sh_getopt_state* %call40, %struct.sh_getopt_state** %gs, align 4
  %31 = load i32, i32* %subshell.addr, align 4
  %cmp41 = icmp eq i32 %31, 0
  br i1 %cmp41, label %if.then42, label %if.else

if.then42:                                        ; preds = %if.end39
  call void @begin_unwind_frame(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.59, i32 0, i32 0))
  %32 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name43 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 0
  %33 = load i8*, i8** %name43, align 4
  %34 = load i32, i32* %subshell.addr, align 4
  %35 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  call void @push_context(i8* %33, i32 %34, %struct.hash_table* %35)
  %36 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %gs, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, %struct.sh_getopt_state*)*)(void (...)* bitcast (void (%struct.sh_getopt_state*)* @maybe_restore_getopt_state to void (...)*), %struct.sh_getopt_state* %36)
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i8*)*)(void ()* @pop_context, i8* null)
  call void @unwind_protect_mem(i8* bitcast (i32* @line_number to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @line_number_for_err_trap to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @function_line_number to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @return_catch_flag to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i32 156)
  %37 = load %struct.command*, %struct.command** %tc, align 4
  %38 = bitcast %struct.command* %37 to i8*
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.command*)*, i8*)*)(void (%struct.command*)* @dispose_command, i8* %38)
  call void @unwind_protect_mem(i8* bitcast (%struct.variable** @this_shell_function to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @funcnest to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @loop_level to i8*), i32 4)
  br label %if.end45

if.else:                                          ; preds = %if.end39
  %39 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name44 = getelementptr inbounds %struct.variable, %struct.variable* %39, i32 0, i32 0
  %40 = load i8*, i8** %name44, align 4
  %41 = load i32, i32* %subshell.addr, align 4
  %42 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  call void @push_context(i8* %40, i32 %41, %struct.hash_table* %42)
  br label %if.end45

if.end45:                                         ; preds = %if.else, %if.then42
  store %struct.hash_table* null, %struct.hash_table** @temporary_env, align 4
  %43 = load %struct.variable*, %struct.variable** %var.addr, align 4
  store %struct.variable* %43, %struct.variable** @this_shell_function, align 4
  call void @make_funcname_visible(i32 1)
  %call46 = call i32 @signal_is_trapped(i32 65)
  %tobool47 = icmp ne i32 %call46, 0
  br i1 %tobool47, label %land.lhs.true48, label %cond.false52

land.lhs.true48:                                  ; preds = %if.end45
  %call49 = call i32 @signal_is_ignored(i32 65)
  %cmp50 = icmp eq i32 %call49, 0
  br i1 %cmp50, label %cond.true51, label %cond.false52

cond.true51:                                      ; preds = %land.lhs.true48
  %44 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @trap_list, i32 0, i32 65), align 4
  br label %cond.end53

cond.false52:                                     ; preds = %land.lhs.true48, %if.end45
  br label %cond.end53

cond.end53:                                       ; preds = %cond.false52, %cond.true51
  %cond54 = phi i8* [ %44, %cond.true51 ], [ null, %cond.false52 ]
  store i8* %cond54, i8** %debug_trap, align 4
  %call55 = call i32 @signal_is_trapped(i32 66)
  %tobool56 = icmp ne i32 %call55, 0
  br i1 %tobool56, label %land.lhs.true57, label %cond.false61

land.lhs.true57:                                  ; preds = %cond.end53
  %call58 = call i32 @signal_is_ignored(i32 66)
  %cmp59 = icmp eq i32 %call58, 0
  br i1 %cmp59, label %cond.true60, label %cond.false61

cond.true60:                                      ; preds = %land.lhs.true57
  %45 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @trap_list, i32 0, i32 66), align 4
  br label %cond.end62

cond.false61:                                     ; preds = %land.lhs.true57, %cond.end53
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false61, %cond.true60
  %cond63 = phi i8* [ %45, %cond.true60 ], [ null, %cond.false61 ]
  store i8* %cond63, i8** %error_trap, align 4
  %call64 = call i32 @signal_is_trapped(i32 67)
  %tobool65 = icmp ne i32 %call64, 0
  br i1 %tobool65, label %land.lhs.true66, label %cond.false70

land.lhs.true66:                                  ; preds = %cond.end62
  %call67 = call i32 @signal_is_ignored(i32 67)
  %cmp68 = icmp eq i32 %call67, 0
  br i1 %cmp68, label %cond.true69, label %cond.false70

cond.true69:                                      ; preds = %land.lhs.true66
  %46 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @trap_list, i32 0, i32 67), align 4
  br label %cond.end71

cond.false70:                                     ; preds = %land.lhs.true66, %cond.end62
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false70, %cond.true69
  %cond72 = phi i8* [ %46, %cond.true69 ], [ null, %cond.false70 ]
  store i8* %cond72, i8** %return_trap, align 4
  %47 = load i8*, i8** %debug_trap, align 4
  %tobool73 = icmp ne i8* %47, null
  br i1 %tobool73, label %land.lhs.true74, label %if.end87

land.lhs.true74:                                  ; preds = %cond.end71
  %48 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes75 = getelementptr inbounds %struct.variable, %struct.variable* %48, i32 0, i32 5
  %49 = load i32, i32* %attributes75, align 4
  %and76 = and i32 %49, 128
  %cmp77 = icmp eq i32 %and76, 0
  br i1 %cmp77, label %land.lhs.true78, label %if.end87

land.lhs.true78:                                  ; preds = %land.lhs.true74
  %50 = load i32, i32* @function_trace_mode, align 4
  %cmp79 = icmp eq i32 %50, 0
  br i1 %cmp79, label %if.then80, label %if.end87

if.then80:                                        ; preds = %land.lhs.true78
  %51 = load i32, i32* %subshell.addr, align 4
  %cmp81 = icmp eq i32 %51, 0
  br i1 %cmp81, label %if.then82, label %if.end86

if.then82:                                        ; preds = %if.then80
  %52 = load i8*, i8** %debug_trap, align 4
  %call83 = call i32 @strlen(i8* %52)
  %add = add i32 1, %call83
  %call84 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4680)
  %53 = load i8*, i8** %debug_trap, align 4
  %call85 = call i8* @strcpy(i8* %call84, i8* %53)
  store i8* %call85, i8** %debug_trap, align 4
  %54 = load i8*, i8** %debug_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %54)
  %55 = load i8*, i8** %debug_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @maybe_set_debug_trap, i8* %55)
  br label %if.end86

if.end86:                                         ; preds = %if.then82, %if.then80
  call void @restore_default_signal(i32 65)
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %land.lhs.true78, %land.lhs.true74, %cond.end71
  %56 = load i8*, i8** %error_trap, align 4
  %tobool88 = icmp ne i8* %56, null
  br i1 %tobool88, label %land.lhs.true89, label %if.end99

land.lhs.true89:                                  ; preds = %if.end87
  %57 = load i32, i32* @error_trace_mode, align 4
  %cmp90 = icmp eq i32 %57, 0
  br i1 %cmp90, label %if.then91, label %if.end99

if.then91:                                        ; preds = %land.lhs.true89
  %58 = load i32, i32* %subshell.addr, align 4
  %cmp92 = icmp eq i32 %58, 0
  br i1 %cmp92, label %if.then93, label %if.end98

if.then93:                                        ; preds = %if.then91
  %59 = load i8*, i8** %error_trap, align 4
  %call94 = call i32 @strlen(i8* %59)
  %add95 = add i32 1, %call94
  %call96 = call i8* @sh_xmalloc(i32 %add95, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4692)
  %60 = load i8*, i8** %error_trap, align 4
  %call97 = call i8* @strcpy(i8* %call96, i8* %60)
  store i8* %call97, i8** %error_trap, align 4
  %61 = load i8*, i8** %error_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %61)
  %62 = load i8*, i8** %error_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @maybe_set_error_trap, i8* %62)
  br label %if.end98

if.end98:                                         ; preds = %if.then93, %if.then91
  call void @restore_default_signal(i32 66)
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %land.lhs.true89, %if.end87
  %63 = load i8*, i8** %return_trap, align 4
  %tobool100 = icmp ne i8* %63, null
  br i1 %tobool100, label %land.lhs.true101, label %if.end117

land.lhs.true101:                                 ; preds = %if.end99
  %call102 = call i32 @signal_in_progress(i32 65)
  %tobool103 = icmp ne i32 %call102, 0
  br i1 %tobool103, label %if.then109, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true101
  %64 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes104 = getelementptr inbounds %struct.variable, %struct.variable* %64, i32 0, i32 5
  %65 = load i32, i32* %attributes104, align 4
  %and105 = and i32 %65, 128
  %cmp106 = icmp eq i32 %and105, 0
  br i1 %cmp106, label %land.lhs.true107, label %if.end117

land.lhs.true107:                                 ; preds = %lor.lhs.false
  %66 = load i32, i32* @function_trace_mode, align 4
  %cmp108 = icmp eq i32 %66, 0
  br i1 %cmp108, label %if.then109, label %if.end117

if.then109:                                       ; preds = %land.lhs.true107, %land.lhs.true101
  %67 = load i32, i32* %subshell.addr, align 4
  %cmp110 = icmp eq i32 %67, 0
  br i1 %cmp110, label %if.then111, label %if.end116

if.then111:                                       ; preds = %if.then109
  %68 = load i8*, i8** %return_trap, align 4
  %call112 = call i32 @strlen(i8* %68)
  %add113 = add i32 1, %call112
  %call114 = call i8* @sh_xmalloc(i32 %add113, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4709)
  %69 = load i8*, i8** %return_trap, align 4
  %call115 = call i8* @strcpy(i8* %call114, i8* %69)
  store i8* %call115, i8** %return_trap, align 4
  %70 = load i8*, i8** %return_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %70)
  %71 = load i8*, i8** %return_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @maybe_set_return_trap, i8* %71)
  br label %if.end116

if.end116:                                        ; preds = %if.then111, %if.then109
  call void @restore_default_signal(i32 67)
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %land.lhs.true107, %lor.lhs.false, %if.end99
  %72 = load i32, i32* @funcnest, align 4
  %inc = add nsw i32 %72, 1
  store i32 %inc, i32* @funcnest, align 4
  %73 = load %struct.variable*, %struct.variable** @this_shell_function, align 4
  %name118 = getelementptr inbounds %struct.variable, %struct.variable* %73, i32 0, i32 0
  %74 = load i8*, i8** %name118, align 4
  %call119 = call %struct.function_def* @find_function_def(i8* %74)
  store %struct.function_def* %call119, %struct.function_def** %shell_fn, align 4
  %75 = load %struct.function_def*, %struct.function_def** %shell_fn, align 4
  %tobool120 = icmp ne %struct.function_def* %75, null
  br i1 %tobool120, label %cond.true121, label %cond.false122

cond.true121:                                     ; preds = %if.end117
  %76 = load %struct.function_def*, %struct.function_def** %shell_fn, align 4
  %source_file = getelementptr inbounds %struct.function_def, %struct.function_def* %76, i32 0, i32 4
  %77 = load i8*, i8** %source_file, align 4
  br label %cond.end123

cond.false122:                                    ; preds = %if.end117
  br label %cond.end123

cond.end123:                                      ; preds = %cond.false122, %cond.true121
  %cond124 = phi i8* [ %77, %cond.true121 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), %cond.false122 ]
  store i8* %cond124, i8** %sfile, align 4
  br label %do.body125

do.body125:                                       ; preds = %cond.end123
  %78 = load %struct.array*, %struct.array** %funcname_a, align 4
  %79 = load %struct.variable*, %struct.variable** @this_shell_function, align 4
  %name126 = getelementptr inbounds %struct.variable, %struct.variable* %79, i32 0, i32 0
  %80 = load i8*, i8** %name126, align 4
  %call127 = call i32 @array_rshift(%struct.array* %78, i32 1, i8* %80)
  br label %do.end128

do.end128:                                        ; preds = %do.body125
  br label %do.body129

do.body129:                                       ; preds = %do.end128
  %81 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %82 = load i8*, i8** %sfile, align 4
  %call130 = call i32 @array_rshift(%struct.array* %81, i32 1, i8* %82)
  br label %do.end131

do.end131:                                        ; preds = %do.body129
  %call132 = call i32 @executing_line_number()
  %conv = sext i32 %call132 to i64
  %call133 = call i8* @itos(i64 %conv)
  store i8* %call133, i8** %t, align 4
  br label %do.body134

do.body134:                                       ; preds = %do.end131
  %83 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %84 = load i8*, i8** %t, align 4
  %call135 = call i32 @array_rshift(%struct.array* %83, i32 1, i8* %84)
  br label %do.end136

do.end136:                                        ; preds = %do.body134
  %85 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %85, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4726)
  %call137 = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4730)
  %86 = bitcast i8* %call137 to %struct.func_array_state*
  store %struct.func_array_state* %86, %struct.func_array_state** %fa, align 4
  %87 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %88 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %source_a = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %88, i32 0, i32 2
  store %struct.array* %87, %struct.array** %source_a, align 4
  %89 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %90 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %source_v = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %90, i32 0, i32 3
  store %struct.variable* %89, %struct.variable** %source_v, align 4
  %91 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %92 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %lineno_a = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %92, i32 0, i32 4
  store %struct.array* %91, %struct.array** %lineno_a, align 4
  %93 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %94 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %lineno_v = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %94, i32 0, i32 5
  store %struct.variable* %93, %struct.variable** %lineno_v, align 4
  %95 = load %struct.array*, %struct.array** %funcname_a, align 4
  %96 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %funcname_a138 = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %96, i32 0, i32 0
  store %struct.array* %95, %struct.array** %funcname_a138, align 4
  %97 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %98 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  %funcname_v139 = getelementptr inbounds %struct.func_array_state, %struct.func_array_state* %98, i32 0, i32 1
  store %struct.variable* %97, %struct.variable** %funcname_v139, align 4
  %99 = load i32, i32* %subshell.addr, align 4
  %cmp140 = icmp eq i32 %99, 0
  br i1 %cmp140, label %if.then142, label %if.end143

if.then142:                                       ; preds = %do.end136
  %100 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, %struct.func_array_state*)*)(void (...)* bitcast (void (%struct.func_array_state*)* @restore_funcarray_state to void (...)*), %struct.func_array_state* %100)
  br label %if.end143

if.end143:                                        ; preds = %if.then142, %do.end136
  %101 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %101, i32 0, i32 0
  %102 = load %struct.word_list*, %struct.word_list** %next, align 4
  call void @remember_args(%struct.word_list* %102, i32 1)
  %103 = load i32, i32* @debugging_mode, align 4
  %tobool144 = icmp ne i32 %103, 0
  br i1 %tobool144, label %if.then145, label %if.end151

if.then145:                                       ; preds = %if.end143
  %104 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %next146 = getelementptr inbounds %struct.word_list, %struct.word_list* %104, i32 0, i32 0
  %105 = load %struct.word_list*, %struct.word_list** %next146, align 4
  call void @push_args(%struct.word_list* %105)
  %106 = load i32, i32* %subshell.addr, align 4
  %cmp147 = icmp eq i32 %106, 0
  br i1 %cmp147, label %if.then149, label %if.end150

if.then149:                                       ; preds = %if.then145
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i32)*)(void ()* @pop_args, i32 0)
  br label %if.end150

if.end150:                                        ; preds = %if.then149, %if.then145
  br label %if.end151

if.end151:                                        ; preds = %if.end150, %if.end143
  %107 = load %struct.command*, %struct.command** %tc, align 4
  %line = getelementptr inbounds %struct.command, %struct.command* %107, i32 0, i32 2
  %108 = load i32, i32* %line, align 4
  store i32 %108, i32* @function_line_number, align 4
  store i32 %108, i32* @line_number, align 4
  %109 = load i32, i32* @shell_compatibility_level, align 4
  %cmp152 = icmp sgt i32 %109, 43
  br i1 %cmp152, label %if.then154, label %if.end155

if.then154:                                       ; preds = %if.end151
  store i32 0, i32* @loop_level, align 4
  br label %if.end155

if.end155:                                        ; preds = %if.then154, %if.end151
  %110 = load %struct.command*, %struct.command** %tc, align 4
  store %struct.command* %110, %struct.command** %fc, align 4
  store volatile i32 0, i32* @from_return_trap, align 4
  %111 = load i32, i32* @return_catch_flag, align 4
  %inc156 = add nsw i32 %111, 1
  store i32 %inc156, i32* @return_catch_flag, align 4
  %call157 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #6
  store i32 %call157, i32* %return_val, align 4
  %112 = load i32, i32* %return_val, align 4
  %tobool158 = icmp ne i32 %112, 0
  br i1 %tobool158, label %if.then159, label %if.else164

if.then159:                                       ; preds = %if.end155
  %113 = load i32, i32* @return_catch_value, align 4
  store i32 %113, i32* %result, align 4
  %114 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  store %struct.command* %114, %struct.command** %save_current, align 4
  %115 = load volatile i32, i32* @from_return_trap, align 4
  %cmp160 = icmp eq i32 %115, 0
  br i1 %cmp160, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.then159
  call void @run_return_trap()
  br label %if.end163

if.end163:                                        ; preds = %if.then162, %if.then159
  %116 = load %struct.command*, %struct.command** %save_current, align 4
  store %struct.command* %116, %struct.command** @currently_executing_command, align 4
  br label %if.end174

if.else164:                                       ; preds = %if.end155
  store i32 1, i32* @showing_function_line, align 4
  %117 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  store %struct.command* %117, %struct.command** %save_current, align 4
  %call165 = call i32 @run_debug_trap()
  store i32 %call165, i32* %result, align 4
  %118 = load i32, i32* @debugging_mode, align 4
  %cmp166 = icmp eq i32 %118, 0
  br i1 %cmp166, label %if.then171, label %lor.lhs.false168

lor.lhs.false168:                                 ; preds = %if.else164
  %119 = load i32, i32* %result, align 4
  %cmp169 = icmp eq i32 %119, 0
  br i1 %cmp169, label %if.then171, label %if.end173

if.then171:                                       ; preds = %lor.lhs.false168, %if.else164
  store i32 0, i32* @showing_function_line, align 4
  %120 = load %struct.command*, %struct.command** %save_current, align 4
  store %struct.command* %120, %struct.command** @currently_executing_command, align 4
  %121 = load %struct.command*, %struct.command** %fc, align 4
  %122 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call172 = call i32 @execute_command_internal(%struct.command* %121, i32 0, i32 -1, i32 -1, %struct.fd_bitmap* %122)
  store i32 %call172, i32* %result, align 4
  %123 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  store %struct.command* %123, %struct.command** %save_current, align 4
  call void @run_return_trap()
  %124 = load %struct.command*, %struct.command** %save_current, align 4
  store %struct.command* %124, %struct.command** @currently_executing_command, align 4
  br label %if.end173

if.end173:                                        ; preds = %if.then171, %lor.lhs.false168
  store i32 0, i32* @showing_function_line, align 4
  br label %if.end174

if.end174:                                        ; preds = %if.end173, %if.end163
  %call175 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0))
  store %struct.variable* %call175, %struct.variable** %gv, align 4
  %125 = load %struct.variable*, %struct.variable** %gv, align 4
  %tobool176 = icmp ne %struct.variable* %125, null
  br i1 %tobool176, label %land.lhs.true177, label %if.end182

land.lhs.true177:                                 ; preds = %if.end174
  %126 = load %struct.variable*, %struct.variable** %gv, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %126, i32 0, i32 6
  %127 = load i32, i32* %context, align 4
  %128 = load i32, i32* @variable_context, align 4
  %cmp178 = icmp eq i32 %127, %128
  br i1 %cmp178, label %if.then180, label %if.end182

if.then180:                                       ; preds = %land.lhs.true177
  %129 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %gs, align 4
  %gs_flags = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %129, i32 0, i32 5
  %130 = load i32, i32* %gs_flags, align 4
  %or181 = or i32 %130, 1
  store i32 %or181, i32* %gs_flags, align 4
  br label %if.end182

if.end182:                                        ; preds = %if.then180, %land.lhs.true177, %if.end174
  %131 = load i32, i32* %subshell.addr, align 4
  %cmp183 = icmp eq i32 %131, 0
  br i1 %cmp183, label %if.then185, label %if.else186

if.then185:                                       ; preds = %if.end182
  call void @run_unwind_frame(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.59, i32 0, i32 0))
  br label %if.end190

if.else186:                                       ; preds = %if.end182
  %132 = load %struct.func_array_state*, %struct.func_array_state** %fa, align 4
  call void @restore_funcarray_state(%struct.func_array_state* %132)
  %133 = load i32, i32* @debugging_mode, align 4
  %tobool187 = icmp ne i32 %133, 0
  br i1 %tobool187, label %if.then188, label %if.end189

if.then188:                                       ; preds = %if.else186
  call void @pop_args()
  br label %if.end189

if.end189:                                        ; preds = %if.then188, %if.else186
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %if.then185
  %134 = load i32, i32* @variable_context, align 4
  %cmp191 = icmp eq i32 %134, 0
  br i1 %cmp191, label %if.then196, label %lor.lhs.false193

lor.lhs.false193:                                 ; preds = %if.end190
  %135 = load %struct.variable*, %struct.variable** @this_shell_function, align 4
  %cmp194 = icmp eq %struct.variable* %135, null
  br i1 %cmp194, label %if.then196, label %if.end197

if.then196:                                       ; preds = %lor.lhs.false193, %if.end190
  call void @make_funcname_visible(i32 0)
  call void @unlink_fifo_list()
  br label %if.end197

if.end197:                                        ; preds = %if.then196, %lor.lhs.false193
  %136 = load i32, i32* %result, align 4
  ret i32 %136
}

; Function Attrs: noinline nounwind
define void @setup_async_signals() #0 {
entry:
  call void @get_original_signal(i32 2)
  %call = call void (i32)* @signal(i32 2, void (i32)* inttoptr (i32 1 to void (i32)*))
  call void @get_original_signal(i32 3)
  %call1 = call void (i32)* @signal(i32 3, void (i32)* inttoptr (i32 1 to void (i32)*))
  ret void
}

declare void @get_original_signal(i32) #1

declare void (i32)* @signal(i32, void (i32)*) #1

; Function Attrs: noinline nounwind
define i32 @shell_execve(i8* %command, i8** %args, i8** %env) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca i8*, align 4
  %args.addr = alloca i8**, align 4
  %env.addr = alloca i8**, align 4
  %larray = alloca i32, align 4
  %i = alloca i32, align 4
  %fd = alloca i32, align 4
  %sample = alloca [128 x i8], align 1
  %sample_len = alloca i32, align 4
  %interp = alloca i8*, align 4
  %ilen = alloca i32, align 4
  store i8* %command, i8** %command.addr, align 4
  store i8** %args, i8*** %args.addr, align 4
  store i8** %env, i8*** %env.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 4
  %2 = load i8**, i8*** %env.addr, align 4
  %call = call i32 @execve(i8* %0, i8** %1, i8** %2)
  %call1 = call i32* @__errno_location()
  %3 = load i32, i32* %call1, align 4
  store i32 %3, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %4 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %5 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %5)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %cmp = icmp ne i32 %6, 8
  br i1 %cmp, label %if.then2, label %if.end71

if.then2:                                         ; preds = %do.end
  %7 = load i32, i32* %i, align 4
  %cmp3 = icmp eq i32 %7, 2
  %cond = select i1 %cmp3, i32 127, i32 126
  store volatile i32 %cond, i32* @last_command_exit_value, align 4
  %8 = load i8*, i8** %command.addr, align 4
  %call4 = call i32 @file_isdir(i8* %8)
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then2
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0))
  %9 = load i8*, i8** %command.addr, align 4
  %call8 = call i8* @strerror(i32 21)
  call void (i8*, ...) @internal_error(i8* %call7, i8* %9, i8* %call8)
  br label %if.end70

if.else:                                          ; preds = %if.then2
  %10 = load i8*, i8** %command.addr, align 4
  %call9 = call i32 @executable_file(i8* %10)
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.else13

if.then11:                                        ; preds = %if.else
  %11 = load i32, i32* %i, align 4
  %call12 = call i32* @__errno_location()
  store i32 %11, i32* %call12, align 4
  %12 = load i8*, i8** %command.addr, align 4
  call void @file_error(i8* %12)
  br label %if.end69

if.else13:                                        ; preds = %if.else
  %13 = load i32, i32* %i, align 4
  %cmp14 = icmp eq i32 %13, 7
  br i1 %cmp14, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else13
  %14 = load i32, i32* %i, align 4
  %cmp15 = icmp eq i32 %14, 12
  br i1 %cmp15, label %if.then16, label %if.else18

if.then16:                                        ; preds = %lor.lhs.false, %if.else13
  %15 = load i32, i32* %i, align 4
  %call17 = call i32* @__errno_location()
  store i32 %15, i32* %call17, align 4
  %16 = load i8*, i8** %command.addr, align 4
  call void @file_error(i8* %16)
  br label %if.end68

if.else18:                                        ; preds = %lor.lhs.false
  br label %do.body19

do.body19:                                        ; preds = %if.else18
  %17 = load i8*, i8** %command.addr, align 4
  %call20 = call i32 (i8*, i32, ...) @open(i8* %17, i32 0)
  store i32 %call20, i32* %fd, align 4
  %18 = load i32, i32* %fd, align 4
  %cmp21 = icmp sge i32 %18, 0
  br i1 %cmp21, label %if.then22, label %if.else25

if.then22:                                        ; preds = %do.body19
  %19 = load i32, i32* %fd, align 4
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 0
  %call23 = call i32 @read(i32 %19, i8* %arraydecay, i32 128)
  store i32 %call23, i32* %sample_len, align 4
  %20 = load i32, i32* %fd, align 4
  %call24 = call i32 @close(i32 %20)
  br label %if.end26

if.else25:                                        ; preds = %do.body19
  store i32 -1, i32* %sample_len, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %if.then22
  br label %do.end27

do.end27:                                         ; preds = %if.end26
  %21 = load i32, i32* %sample_len, align 4
  %cmp28 = icmp sgt i32 %21, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %do.end27
  %22 = load i32, i32* %sample_len, align 4
  %sub = sub nsw i32 %22, 1
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 %sub
  store i8 0, i8* %arrayidx, align 1
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %do.end27
  %23 = load i32, i32* %sample_len, align 4
  %cmp31 = icmp sgt i32 %23, 2
  br i1 %cmp31, label %land.lhs.true, label %if.end66

land.lhs.true:                                    ; preds = %if.end30
  %arrayidx32 = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 0
  %24 = load i8, i8* %arrayidx32, align 1
  %conv = sext i8 %24 to i32
  %cmp33 = icmp eq i32 %conv, 35
  br i1 %cmp33, label %land.lhs.true35, label %if.end66

land.lhs.true35:                                  ; preds = %land.lhs.true
  %arrayidx36 = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 1
  %25 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %25 to i32
  %cmp38 = icmp eq i32 %conv37, 33
  br i1 %cmp38, label %if.then40, label %if.end66

if.then40:                                        ; preds = %land.lhs.true35
  %arraydecay41 = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 0
  %26 = load i32, i32* %sample_len, align 4
  %call42 = call i8* @getinterp(i8* %arraydecay41, i32 %26, i32* null)
  store i8* %call42, i8** %interp, align 4
  %27 = load i8*, i8** %interp, align 4
  %call43 = call i32 @strlen(i8* %27)
  store i32 %call43, i32* %ilen, align 4
  %28 = load i32, i32* %i, align 4
  %call44 = call i32* @__errno_location()
  store i32 %28, i32* %call44, align 4
  %29 = load i8*, i8** %interp, align 4
  %30 = load i32, i32* %ilen, align 4
  %sub45 = sub nsw i32 %30, 1
  %arrayidx46 = getelementptr inbounds i8, i8* %29, i32 %sub45
  %31 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %31 to i32
  %cmp48 = icmp eq i32 %conv47, 13
  br i1 %cmp48, label %if.then50, label %if.end57

if.then50:                                        ; preds = %if.then40
  %32 = load i8*, i8** %interp, align 4
  %33 = load i32, i32* %ilen, align 4
  %add = add nsw i32 %33, 2
  %call51 = call i8* @sh_xrealloc(i8* %32, i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5516)
  store i8* %call51, i8** %interp, align 4
  %34 = load i8*, i8** %interp, align 4
  %35 = load i32, i32* %ilen, align 4
  %sub52 = sub nsw i32 %35, 1
  %arrayidx53 = getelementptr inbounds i8, i8* %34, i32 %sub52
  store i8 94, i8* %arrayidx53, align 1
  %36 = load i8*, i8** %interp, align 4
  %37 = load i32, i32* %ilen, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %36, i32 %37
  store i8 77, i8* %arrayidx54, align 1
  %38 = load i8*, i8** %interp, align 4
  %39 = load i32, i32* %ilen, align 4
  %add55 = add nsw i32 %39, 1
  %arrayidx56 = getelementptr inbounds i8, i8* %38, i32 %add55
  store i8 0, i8* %arrayidx56, align 1
  br label %if.end57

if.end57:                                         ; preds = %if.then50, %if.then40
  %call58 = call i8* @libintl_gettext(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.10, i32 0, i32 0))
  %40 = load i8*, i8** %command.addr, align 4
  %41 = load i8*, i8** %interp, align 4
  %tobool59 = icmp ne i8* %41, null
  br i1 %tobool59, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end57
  %42 = load i8*, i8** %interp, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end57
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond60 = phi i8* [ %42, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), %cond.false ]
  call void (i8*, ...) @sys_error(i8* %call58, i8* %40, i8* %cond60)
  br label %do.body61

do.body61:                                        ; preds = %cond.end
  %43 = load i8*, i8** %interp, align 4
  %tobool62 = icmp ne i8* %43, null
  br i1 %tobool62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %do.body61
  %44 = load i8*, i8** %interp, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5522)
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %do.body61
  br label %do.end65

do.end65:                                         ; preds = %if.end64
  store i32 126, i32* %retval, align 4
  br label %return

if.end66:                                         ; preds = %land.lhs.true35, %land.lhs.true, %if.end30
  %45 = load i32, i32* %i, align 4
  %call67 = call i32* @__errno_location()
  store i32 %45, i32* %call67, align 4
  %46 = load i8*, i8** %command.addr, align 4
  call void @file_error(i8* %46)
  br label %if.end68

if.end68:                                         ; preds = %if.end66, %if.then16
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then11
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then6
  %47 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %47, i32* %retval, align 4
  br label %return

if.end71:                                         ; preds = %do.end
  br label %do.body72

do.body72:                                        ; preds = %if.end71
  %48 = load i8*, i8** %command.addr, align 4
  %call73 = call i32 (i8*, i32, ...) @open(i8* %48, i32 0)
  store i32 %call73, i32* %fd, align 4
  %49 = load i32, i32* %fd, align 4
  %cmp74 = icmp sge i32 %49, 0
  br i1 %cmp74, label %if.then76, label %if.else80

if.then76:                                        ; preds = %do.body72
  %50 = load i32, i32* %fd, align 4
  %arraydecay77 = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 0
  %call78 = call i32 @read(i32 %50, i8* %arraydecay77, i32 128)
  store i32 %call78, i32* %sample_len, align 4
  %51 = load i32, i32* %fd, align 4
  %call79 = call i32 @close(i32 %51)
  br label %if.end81

if.else80:                                        ; preds = %do.body72
  store i32 -1, i32* %sample_len, align 4
  br label %if.end81

if.end81:                                         ; preds = %if.else80, %if.then76
  br label %do.end82

do.end82:                                         ; preds = %if.end81
  %52 = load i32, i32* %sample_len, align 4
  %cmp83 = icmp eq i32 %52, 0
  br i1 %cmp83, label %if.then85, label %if.end86

if.then85:                                        ; preds = %do.end82
  store i32 0, i32* %retval, align 4
  br label %return

if.end86:                                         ; preds = %do.end82
  %53 = load i32, i32* %sample_len, align 4
  %cmp87 = icmp sgt i32 %53, 0
  br i1 %cmp87, label %if.then89, label %if.end98

if.then89:                                        ; preds = %if.end86
  %arraydecay90 = getelementptr inbounds [128 x i8], [128 x i8]* %sample, i32 0, i32 0
  %54 = load i32, i32* %sample_len, align 4
  %call91 = call i32 @check_binary_file(i8* %arraydecay90, i32 %54)
  %tobool92 = icmp ne i32 %call91, 0
  br i1 %tobool92, label %if.then93, label %if.end97

if.then93:                                        ; preds = %if.then89
  %call94 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.12, i32 0, i32 0))
  %55 = load i8*, i8** %command.addr, align 4
  %56 = load i32, i32* %i, align 4
  %call95 = call i8* @strerror(i32 %56)
  call void (i8*, ...) @internal_error(i8* %call94, i8* %55, i8* %call95)
  %57 = load i32, i32* %i, align 4
  %call96 = call i32* @__errno_location()
  store i32 %57, i32* %call96, align 4
  store i32 126, i32* %retval, align 4
  br label %return

if.end97:                                         ; preds = %if.then89
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.end86
  call void @reset_parser()
  call void @initialize_subshell()
  %call99 = call void (i32)* @set_sigint_handler()
  %58 = load i8**, i8*** %args.addr, align 4
  %call100 = call i32 @strvec_len(i8** %58)
  %add101 = add nsw i32 %call100, 1
  store i32 %add101, i32* %larray, align 4
  %59 = load i8**, i8*** %args.addr, align 4
  %60 = load i32, i32* %larray, align 4
  %add102 = add nsw i32 %60, 1
  %call103 = call i8** @strvec_resize(i8** %59, i32 %add102)
  store i8** %call103, i8*** %args.addr, align 4
  %61 = load i32, i32* %larray, align 4
  %sub104 = sub nsw i32 %61, 1
  store i32 %sub104, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end98
  %62 = load i32, i32* %i, align 4
  %tobool105 = icmp ne i32 %62, 0
  br i1 %tobool105, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %63 = load i8**, i8*** %args.addr, align 4
  %64 = load i32, i32* %i, align 4
  %sub106 = sub nsw i32 %64, 1
  %arrayidx107 = getelementptr inbounds i8*, i8** %63, i32 %sub106
  %65 = load i8*, i8** %arrayidx107, align 4
  %66 = load i8**, i8*** %args.addr, align 4
  %67 = load i32, i32* %i, align 4
  %arrayidx108 = getelementptr inbounds i8*, i8** %66, i32 %67
  store i8* %65, i8** %arrayidx108, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %68 = load i32, i32* %i, align 4
  %dec = add nsw i32 %68, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %69 = load i8*, i8** @shell_name, align 4
  %70 = load i8**, i8*** %args.addr, align 4
  %arrayidx109 = getelementptr inbounds i8*, i8** %70, i32 0
  store i8* %69, i8** %arrayidx109, align 4
  %71 = load i8*, i8** %command.addr, align 4
  %72 = load i8**, i8*** %args.addr, align 4
  %arrayidx110 = getelementptr inbounds i8*, i8** %72, i32 1
  store i8* %71, i8** %arrayidx110, align 4
  %73 = load i8**, i8*** %args.addr, align 4
  %74 = load i32, i32* %larray, align 4
  %arrayidx111 = getelementptr inbounds i8*, i8** %73, i32 %74
  store i8* null, i8** %arrayidx111, align 4
  %75 = load i8**, i8*** %args.addr, align 4
  %arrayidx112 = getelementptr inbounds i8*, i8** %75, i32 0
  %76 = load i8*, i8** %arrayidx112, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %76, i32 0
  %77 = load i8, i8* %arrayidx113, align 1
  %conv114 = sext i8 %77 to i32
  %cmp115 = icmp eq i32 %conv114, 45
  br i1 %cmp115, label %if.then117, label %if.end119

if.then117:                                       ; preds = %for.end
  %78 = load i8**, i8*** %args.addr, align 4
  %arrayidx118 = getelementptr inbounds i8*, i8** %78, i32 0
  %79 = load i8*, i8** %arrayidx118, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %incdec.ptr, i8** %arrayidx118, align 4
  br label %if.end119

if.end119:                                        ; preds = %if.then117, %for.end
  %80 = load i32, i32* @restricted, align 4
  %tobool120 = icmp ne i32 %80, 0
  br i1 %tobool120, label %if.then121, label %if.end123

if.then121:                                       ; preds = %if.end119
  %call122 = call i32 @change_flag(i32 114, i32 43)
  br label %if.end123

if.end123:                                        ; preds = %if.then121, %if.end119
  %81 = load i8**, i8*** @subshell_argv, align 4
  %tobool124 = icmp ne i8** %81, null
  br i1 %tobool124, label %if.then125, label %if.end133

if.then125:                                       ; preds = %if.end123
  store i32 1, i32* %i, align 4
  br label %for.cond126

for.cond126:                                      ; preds = %for.inc131, %if.then125
  %82 = load i32, i32* %i, align 4
  %83 = load i32, i32* @subshell_argc, align 4
  %cmp127 = icmp slt i32 %82, %83
  br i1 %cmp127, label %for.body129, label %for.end132

for.body129:                                      ; preds = %for.cond126
  %84 = load i8**, i8*** @subshell_argv, align 4
  %85 = load i32, i32* %i, align 4
  %arrayidx130 = getelementptr inbounds i8*, i8** %84, i32 %85
  %86 = load i8*, i8** %arrayidx130, align 4
  call void @sh_xfree(i8* %86, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5595)
  br label %for.inc131

for.inc131:                                       ; preds = %for.body129
  %87 = load i32, i32* %i, align 4
  %inc = add nsw i32 %87, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond126

for.end132:                                       ; preds = %for.cond126
  %88 = load i8**, i8*** @subshell_argv, align 4
  %89 = bitcast i8** %88 to i8*
  call void @sh_xfree(i8* %89, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5596)
  br label %if.end133

if.end133:                                        ; preds = %for.end132, %if.end123
  %90 = load %struct.command*, %struct.command** @currently_executing_command, align 4
  call void @dispose_command(%struct.command* %90)
  store %struct.command* null, %struct.command** @currently_executing_command, align 4
  %91 = load i32, i32* %larray, align 4
  store i32 %91, i32* @subshell_argc, align 4
  %92 = load i8**, i8*** %args.addr, align 4
  store i8** %92, i8*** @subshell_argv, align 4
  %93 = load i8**, i8*** %env.addr, align 4
  store i8** %93, i8*** @subshell_envp, align 4
  call void @unbind_args()
  call void @clear_fifo_list()
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @subshell_top_level, i32 0, i32 0), i32 1) #5
  unreachable

return:                                           ; preds = %if.then93, %if.then85, %if.end70, %do.end65
  %94 = load i32, i32* %retval, align 4
  ret i32 %94
}

declare i32 @execve(i8*, i8**, i8**) #1

declare i32* @__errno_location() #1

declare i32 @file_isdir(i8*) #1

declare void @internal_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @strerror(i32) #1

declare i32 @executable_file(i8*) #1

declare void @file_error(i8*) #1

declare i32 @open(i8*, i32, ...) #1

declare i32 @read(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @getinterp(i8* %sample, i32 %sample_len, i32* %endp) #0 {
entry:
  %sample.addr = alloca i8*, align 4
  %sample_len.addr = alloca i32, align 4
  %endp.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %execname = alloca i8*, align 4
  %start = alloca i32, align 4
  store i8* %sample, i8** %sample.addr, align 4
  store i32 %sample_len, i32* %sample_len.addr, align 4
  store i32* %endp, i32** %endp.addr, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %sample_len.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %sample.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %5 = load i8*, i8** %sample.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %8 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.cond
  %9 = phi i1 [ false, %for.cond ], [ %8, %lor.end ]
  br i1 %9, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %start, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc25, %for.end
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %sample_len.addr, align 4
  %cmp8 = icmp slt i32 %12, %13
  br i1 %cmp8, label %land.lhs.true, label %land.end23

land.lhs.true:                                    ; preds = %for.cond7
  %14 = load i8*, i8** %sample.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %16 to i32
  %cmp12 = icmp eq i32 %conv11, 32
  br i1 %cmp12, label %land.end23, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %17 = load i8*, i8** %sample.addr, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %19 to i32
  %cmp16 = icmp eq i32 %conv15, 9
  br i1 %cmp16, label %land.end23, label %land.rhs18

land.rhs18:                                       ; preds = %lor.lhs.false
  %20 = load i8*, i8** %sample.addr, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %22 to i32
  %cmp21 = icmp ne i32 %conv20, 10
  br label %land.end23

land.end23:                                       ; preds = %land.rhs18, %lor.lhs.false, %land.lhs.true, %for.cond7
  %23 = phi i1 [ false, %lor.lhs.false ], [ false, %land.lhs.true ], [ false, %for.cond7 ], [ %cmp21, %land.rhs18 ]
  br i1 %23, label %for.body24, label %for.end27

for.body24:                                       ; preds = %land.end23
  br label %for.inc25

for.inc25:                                        ; preds = %for.body24
  %24 = load i32, i32* %i, align 4
  %inc26 = add nsw i32 %24, 1
  store i32 %inc26, i32* %i, align 4
  br label %for.cond7

for.end27:                                        ; preds = %land.end23
  %25 = load i8*, i8** %sample.addr, align 4
  %26 = load i32, i32* %start, align 4
  %27 = load i32, i32* %i, align 4
  %call = call i8* @substring(i8* %25, i32 %26, i32 %27)
  store i8* %call, i8** %execname, align 4
  %28 = load i32*, i32** %endp.addr, align 4
  %tobool = icmp ne i32* %28, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end27
  %29 = load i32, i32* %i, align 4
  %30 = load i32*, i32** %endp.addr, align 4
  store i32 %29, i32* %30, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end27
  %31 = load i8*, i8** %execname, align 4
  ret i8* %31
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare void @sys_error(i8*, ...) #1

declare i32 @check_binary_file(i8*, i32) #1

declare void @reset_parser() #1

; Function Attrs: noinline nounwind
define internal void @initialize_subshell() #0 {
entry:
  call void @delete_all_aliases()
  store i32 0, i32* @history_lines_this_session, align 4
  call void @without_job_control()
  call void @reset_shell_flags()
  call void @reset_shell_options()
  call void @reset_shopt_options()
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %0, i32 0, i32 2
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 8
  %cmp = icmp ne i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 4
  %3 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %3, %struct.var_context** @shell_variables, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @clear_unwind_protect_list(i32 0)
  store i32 0, i32* @parse_and_execute_level, align 4
  store i32 0, i32* @sourcenest, align 4
  store i32 0, i32* @evalnest, align 4
  store i32 0, i32* @funcnest, align 4
  store i32 0, i32* @return_catch_flag, align 4
  store i32 0, i32* @variable_context, align 4
  store i32 0, i32* @executing_list, align 4
  %4 = load i32, i32* @interactive_shell, align 4
  %cmp1 = icmp eq i32 %4, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @unset_bash_input(i32 0)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  ret void
}

declare void (i32)* @set_sigint_handler() #1

declare i32 @strvec_len(i8**) #1

declare i8** @strvec_resize(i8**, i32) #1

declare i32 @change_flag(i32, i32) #1

declare void @dispose_command(%struct.command*) #1

declare void @unbind_args() #1

declare void @clear_fifo_list() #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #3

declare i32 @gettimeofday(%struct.timeval*, i8*) #1

declare i32 @getrusage(i32, %struct.rusage*) #1

declare void @xbcopy(i8*, i8*, i32) #1

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #4

declare %struct.timeval* @difftimeval(%struct.timeval*, %struct.timeval*, %struct.timeval*) #1

declare void @timeval_to_secs(...) #1

declare %struct.timeval* @addtimeval(%struct.timeval*, %struct.timeval*, %struct.timeval*) #1

declare i32 @timeval_to_cpu(%struct.timeval*, %struct.timeval*, %struct.timeval*) #1

declare i8* @get_string_value(i8*) #1

; Function Attrs: noinline nounwind
define internal void @print_formatted_time(%struct._IO_FILE* %fp, i8* %format, i32 %rs, i32 %rsf, i32 %us, i32 %usf, i32 %ss, i32 %ssf, i32 %cpu) #0 {
entry:
  %fp.addr = alloca %struct._IO_FILE*, align 4
  %format.addr = alloca i8*, align 4
  %rs.addr = alloca i32, align 4
  %rsf.addr = alloca i32, align 4
  %us.addr = alloca i32, align 4
  %usf.addr = alloca i32, align 4
  %ss.addr = alloca i32, align 4
  %ssf.addr = alloca i32, align 4
  %cpu.addr = alloca i32, align 4
  %prec = alloca i32, align 4
  %lng = alloca i32, align 4
  %len = alloca i32, align 4
  %str = alloca i8*, align 4
  %s = alloca i8*, align 4
  %ts = alloca [20 x i8], align 1
  %sum = alloca i32, align 4
  %sum_frac = alloca i32, align 4
  %sindex = alloca i32, align 4
  %ssize = alloca i32, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 4
  store i8* %format, i8** %format.addr, align 4
  store i32 %rs, i32* %rs.addr, align 4
  store i32 %rsf, i32* %rsf.addr, align 4
  store i32 %us, i32* %us.addr, align 4
  store i32 %usf, i32* %usf.addr, align 4
  store i32 %ss, i32* %ss.addr, align 4
  store i32 %ssf, i32* %ssf.addr, align 4
  store i32 %cpu, i32* %cpu.addr, align 4
  %0 = load i8*, i8** %format.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %len, align 4
  %1 = load i32, i32* %len, align 4
  %add = add nsw i32 %1, 64
  %2 = load i32, i32* %len, align 4
  %rem = srem i32 %2, 64
  %sub = sub nsw i32 %add, %rem
  store i32 %sub, i32* %ssize, align 4
  %3 = load i32, i32* %ssize, align 4
  %call1 = call i8* @sh_xmalloc(i32 %3, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1227)
  store i8* %call1, i8** %str, align 4
  store i32 0, i32* %sindex, align 4
  %4 = load i8*, i8** %format.addr, align 4
  store i8* %4, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %tobool = icmp ne i8 %6, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %s, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp = icmp ne i32 %conv, 37
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %9 = load i8*, i8** %s, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx, align 1
  %conv3 = sext i8 %10 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %do.body

do.body:                                          ; preds = %if.then
  %11 = load i32, i32* %sindex, align 4
  %add6 = add nsw i32 %11, 1
  %12 = load i32, i32* %ssize, align 4
  %cmp7 = icmp sge i32 %add6, %12
  br i1 %cmp7, label %if.then9, label %if.end

if.then9:                                         ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then9
  %13 = load i32, i32* %sindex, align 4
  %add10 = add nsw i32 %13, 1
  %14 = load i32, i32* %ssize, align 4
  %cmp11 = icmp sge i32 %add10, %14
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %15 = load i32, i32* %ssize, align 4
  %add13 = add nsw i32 %15, 64
  store i32 %add13, i32* %ssize, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %16 = load i8*, i8** %str, align 4
  %17 = load i32, i32* %ssize, align 4
  %call14 = call i8* @sh_xrealloc(i8* %16, i32 %17, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1234)
  store i8* %call14, i8** %str, align 4
  br label %if.end

if.end:                                           ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %18 = load i8*, i8** %s, align 4
  %19 = load i8, i8* %18, align 1
  %20 = load i8*, i8** %str, align 4
  %21 = load i32, i32* %sindex, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %sindex, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %20, i32 %21
  store i8 %19, i8* %arrayidx15, align 1
  br label %if.end139

if.else:                                          ; preds = %lor.lhs.false
  %22 = load i8*, i8** %s, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %23 to i32
  %cmp18 = icmp eq i32 %conv17, 37
  br i1 %cmp18, label %if.then20, label %if.else38

if.then20:                                        ; preds = %if.else
  %24 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %do.body21

do.body21:                                        ; preds = %if.then20
  %25 = load i32, i32* %sindex, align 4
  %add22 = add nsw i32 %25, 1
  %26 = load i32, i32* %ssize, align 4
  %cmp23 = icmp sge i32 %add22, %26
  br i1 %cmp23, label %if.then25, label %if.end34

if.then25:                                        ; preds = %do.body21
  br label %while.cond26

while.cond26:                                     ; preds = %while.body30, %if.then25
  %27 = load i32, i32* %sindex, align 4
  %add27 = add nsw i32 %27, 1
  %28 = load i32, i32* %ssize, align 4
  %cmp28 = icmp sge i32 %add27, %28
  br i1 %cmp28, label %while.body30, label %while.end32

while.body30:                                     ; preds = %while.cond26
  %29 = load i32, i32* %ssize, align 4
  %add31 = add nsw i32 %29, 64
  store i32 %add31, i32* %ssize, align 4
  br label %while.cond26

while.end32:                                      ; preds = %while.cond26
  %30 = load i8*, i8** %str, align 4
  %31 = load i32, i32* %ssize, align 4
  %call33 = call i8* @sh_xrealloc(i8* %30, i32 %31, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1240)
  store i8* %call33, i8** %str, align 4
  br label %if.end34

if.end34:                                         ; preds = %while.end32, %do.body21
  br label %do.end35

do.end35:                                         ; preds = %if.end34
  %32 = load i8*, i8** %s, align 4
  %33 = load i8, i8* %32, align 1
  %34 = load i8*, i8** %str, align 4
  %35 = load i32, i32* %sindex, align 4
  %inc36 = add nsw i32 %35, 1
  store i32 %inc36, i32* %sindex, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %34, i32 %35
  store i8 %33, i8* %arrayidx37, align 1
  br label %if.end138

if.else38:                                        ; preds = %if.else
  %36 = load i8*, i8** %s, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %36, i32 1
  %37 = load i8, i8* %arrayidx39, align 1
  %conv40 = sext i8 %37 to i32
  %cmp41 = icmp eq i32 %conv40, 80
  br i1 %cmp41, label %if.then43, label %if.else65

if.then43:                                        ; preds = %if.else38
  %38 = load i8*, i8** %s, align 4
  %incdec.ptr44 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr44, i8** %s, align 4
  %39 = load i32, i32* %cpu.addr, align 4
  %div = sdiv i32 %39, 100
  store i32 %div, i32* %sum, align 4
  %40 = load i32, i32* %cpu.addr, align 4
  %rem45 = srem i32 %40, 100
  %mul = mul nsw i32 %rem45, 10
  store i32 %mul, i32* %sum_frac, align 4
  %arraydecay = getelementptr inbounds [20 x i8], [20 x i8]* %ts, i32 0, i32 0
  %41 = load i32, i32* %sum, align 4
  %42 = load i32, i32* %sum_frac, align 4
  %call46 = call i32 @mkfmt(i8* %arraydecay, i32 2, i32 0, i32 %41, i32 %42)
  store i32 %call46, i32* %len, align 4
  br label %do.body47

do.body47:                                        ; preds = %if.then43
  %43 = load i32, i32* %sindex, align 4
  %44 = load i32, i32* %len, align 4
  %add48 = add nsw i32 %43, %44
  %45 = load i32, i32* %ssize, align 4
  %cmp49 = icmp sge i32 %add48, %45
  br i1 %cmp49, label %if.then51, label %if.end60

if.then51:                                        ; preds = %do.body47
  br label %while.cond52

while.cond52:                                     ; preds = %while.body56, %if.then51
  %46 = load i32, i32* %sindex, align 4
  %47 = load i32, i32* %len, align 4
  %add53 = add nsw i32 %46, %47
  %48 = load i32, i32* %ssize, align 4
  %cmp54 = icmp sge i32 %add53, %48
  br i1 %cmp54, label %while.body56, label %while.end58

while.body56:                                     ; preds = %while.cond52
  %49 = load i32, i32* %ssize, align 4
  %add57 = add nsw i32 %49, 64
  store i32 %add57, i32* %ssize, align 4
  br label %while.cond52

while.end58:                                      ; preds = %while.cond52
  %50 = load i8*, i8** %str, align 4
  %51 = load i32, i32* %ssize, align 4
  %call59 = call i8* @sh_xrealloc(i8* %50, i32 %51, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1254)
  store i8* %call59, i8** %str, align 4
  br label %if.end60

if.end60:                                         ; preds = %while.end58, %do.body47
  br label %do.end61

do.end61:                                         ; preds = %if.end60
  %52 = load i8*, i8** %str, align 4
  %53 = load i32, i32* %sindex, align 4
  %add.ptr = getelementptr inbounds i8, i8* %52, i32 %53
  %arraydecay62 = getelementptr inbounds [20 x i8], [20 x i8]* %ts, i32 0, i32 0
  %call63 = call i8* @strcpy(i8* %add.ptr, i8* %arraydecay62)
  %54 = load i32, i32* %len, align 4
  %55 = load i32, i32* %sindex, align 4
  %add64 = add nsw i32 %55, %54
  store i32 %add64, i32* %sindex, align 4
  br label %if.end137

if.else65:                                        ; preds = %if.else38
  store i32 3, i32* %prec, align 4
  store i32 0, i32* %lng, align 4
  %56 = load i8*, i8** %s, align 4
  %incdec.ptr66 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %incdec.ptr66, i8** %s, align 4
  %57 = load i8*, i8** %s, align 4
  %58 = load i8, i8* %57, align 1
  %conv67 = sext i8 %58 to i32
  %cmp68 = icmp sge i32 %conv67, 48
  br i1 %cmp68, label %land.lhs.true, label %if.end81

land.lhs.true:                                    ; preds = %if.else65
  %59 = load i8*, i8** %s, align 4
  %60 = load i8, i8* %59, align 1
  %conv70 = sext i8 %60 to i32
  %cmp71 = icmp sle i32 %conv70, 57
  br i1 %cmp71, label %if.then73, label %if.end81

if.then73:                                        ; preds = %land.lhs.true
  %61 = load i8*, i8** %s, align 4
  %incdec.ptr74 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %incdec.ptr74, i8** %s, align 4
  %62 = load i8, i8* %61, align 1
  %conv75 = sext i8 %62 to i32
  %sub76 = sub nsw i32 %conv75, 48
  store i32 %sub76, i32* %prec, align 4
  %63 = load i32, i32* %prec, align 4
  %cmp77 = icmp sgt i32 %63, 3
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.then73
  store i32 3, i32* %prec, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.then79, %if.then73
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %land.lhs.true, %if.else65
  %64 = load i8*, i8** %s, align 4
  %65 = load i8, i8* %64, align 1
  %conv82 = sext i8 %65 to i32
  %cmp83 = icmp eq i32 %conv82, 108
  br i1 %cmp83, label %if.then85, label %if.end87

if.then85:                                        ; preds = %if.end81
  store i32 1, i32* %lng, align 4
  %66 = load i8*, i8** %s, align 4
  %incdec.ptr86 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %incdec.ptr86, i8** %s, align 4
  br label %if.end87

if.end87:                                         ; preds = %if.then85, %if.end81
  %67 = load i8*, i8** %s, align 4
  %68 = load i8, i8* %67, align 1
  %conv88 = sext i8 %68 to i32
  %cmp89 = icmp eq i32 %conv88, 82
  br i1 %cmp89, label %if.then95, label %lor.lhs.false91

lor.lhs.false91:                                  ; preds = %if.end87
  %69 = load i8*, i8** %s, align 4
  %70 = load i8, i8* %69, align 1
  %conv92 = sext i8 %70 to i32
  %cmp93 = icmp eq i32 %conv92, 69
  br i1 %cmp93, label %if.then95, label %if.else98

if.then95:                                        ; preds = %lor.lhs.false91, %if.end87
  %arraydecay96 = getelementptr inbounds [20 x i8], [20 x i8]* %ts, i32 0, i32 0
  %71 = load i32, i32* %prec, align 4
  %72 = load i32, i32* %lng, align 4
  %73 = load i32, i32* %rs.addr, align 4
  %74 = load i32, i32* %rsf.addr, align 4
  %call97 = call i32 @mkfmt(i8* %arraydecay96, i32 %71, i32 %72, i32 %73, i32 %74)
  store i32 %call97, i32* %len, align 4
  br label %if.end117

if.else98:                                        ; preds = %lor.lhs.false91
  %75 = load i8*, i8** %s, align 4
  %76 = load i8, i8* %75, align 1
  %conv99 = sext i8 %76 to i32
  %cmp100 = icmp eq i32 %conv99, 85
  br i1 %cmp100, label %if.then102, label %if.else105

if.then102:                                       ; preds = %if.else98
  %arraydecay103 = getelementptr inbounds [20 x i8], [20 x i8]* %ts, i32 0, i32 0
  %77 = load i32, i32* %prec, align 4
  %78 = load i32, i32* %lng, align 4
  %79 = load i32, i32* %us.addr, align 4
  %80 = load i32, i32* %usf.addr, align 4
  %call104 = call i32 @mkfmt(i8* %arraydecay103, i32 %77, i32 %78, i32 %79, i32 %80)
  store i32 %call104, i32* %len, align 4
  br label %if.end116

if.else105:                                       ; preds = %if.else98
  %81 = load i8*, i8** %s, align 4
  %82 = load i8, i8* %81, align 1
  %conv106 = sext i8 %82 to i32
  %cmp107 = icmp eq i32 %conv106, 83
  br i1 %cmp107, label %if.then109, label %if.else112

if.then109:                                       ; preds = %if.else105
  %arraydecay110 = getelementptr inbounds [20 x i8], [20 x i8]* %ts, i32 0, i32 0
  %83 = load i32, i32* %prec, align 4
  %84 = load i32, i32* %lng, align 4
  %85 = load i32, i32* %ss.addr, align 4
  %86 = load i32, i32* %ssf.addr, align 4
  %call111 = call i32 @mkfmt(i8* %arraydecay110, i32 %83, i32 %84, i32 %85, i32 %86)
  store i32 %call111, i32* %len, align 4
  br label %if.end115

if.else112:                                       ; preds = %if.else105
  %call113 = call i8* @libintl_gettext(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.17, i32 0, i32 0))
  %87 = load i8*, i8** %s, align 4
  %88 = load i8, i8* %87, align 1
  %conv114 = sext i8 %88 to i32
  call void (i8*, ...) @internal_error(i8* %call113, i32 %conv114)
  %89 = load i8*, i8** %str, align 4
  call void @sh_xfree(i8* %89, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1282)
  br label %return

if.end115:                                        ; preds = %if.then109
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.then102
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %if.then95
  br label %do.body118

do.body118:                                       ; preds = %if.end117
  %90 = load i32, i32* %sindex, align 4
  %91 = load i32, i32* %len, align 4
  %add119 = add nsw i32 %90, %91
  %92 = load i32, i32* %ssize, align 4
  %cmp120 = icmp sge i32 %add119, %92
  br i1 %cmp120, label %if.then122, label %if.end131

if.then122:                                       ; preds = %do.body118
  br label %while.cond123

while.cond123:                                    ; preds = %while.body127, %if.then122
  %93 = load i32, i32* %sindex, align 4
  %94 = load i32, i32* %len, align 4
  %add124 = add nsw i32 %93, %94
  %95 = load i32, i32* %ssize, align 4
  %cmp125 = icmp sge i32 %add124, %95
  br i1 %cmp125, label %while.body127, label %while.end129

while.body127:                                    ; preds = %while.cond123
  %96 = load i32, i32* %ssize, align 4
  %add128 = add nsw i32 %96, 64
  store i32 %add128, i32* %ssize, align 4
  br label %while.cond123

while.end129:                                     ; preds = %while.cond123
  %97 = load i8*, i8** %str, align 4
  %98 = load i32, i32* %ssize, align 4
  %call130 = call i8* @sh_xrealloc(i8* %97, i32 %98, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1285)
  store i8* %call130, i8** %str, align 4
  br label %if.end131

if.end131:                                        ; preds = %while.end129, %do.body118
  br label %do.end132

do.end132:                                        ; preds = %if.end131
  %99 = load i8*, i8** %str, align 4
  %100 = load i32, i32* %sindex, align 4
  %add.ptr133 = getelementptr inbounds i8, i8* %99, i32 %100
  %arraydecay134 = getelementptr inbounds [20 x i8], [20 x i8]* %ts, i32 0, i32 0
  %call135 = call i8* @strcpy(i8* %add.ptr133, i8* %arraydecay134)
  %101 = load i32, i32* %len, align 4
  %102 = load i32, i32* %sindex, align 4
  %add136 = add nsw i32 %102, %101
  store i32 %add136, i32* %sindex, align 4
  br label %if.end137

if.end137:                                        ; preds = %do.end132, %do.end61
  br label %if.end138

if.end138:                                        ; preds = %if.end137, %do.end35
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %do.end
  br label %for.inc

for.inc:                                          ; preds = %if.end139
  %103 = load i8*, i8** %s, align 4
  %incdec.ptr140 = getelementptr inbounds i8, i8* %103, i32 1
  store i8* %incdec.ptr140, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %104 = load i8*, i8** %str, align 4
  %105 = load i32, i32* %sindex, align 4
  %arrayidx141 = getelementptr inbounds i8, i8* %104, i32 %105
  store i8 0, i8* %arrayidx141, align 1
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %107 = load i8*, i8** %str, align 4
  %call142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %106, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* %107)
  %108 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call143 = call i32 @fflush(%struct._IO_FILE* %108)
  %109 = load i8*, i8** %str, align 4
  call void @sh_xfree(i8* %109, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 1295)
  br label %return

return:                                           ; preds = %for.end, %if.else112
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @mkfmt(i8* %buf, i32 %prec, i32 %lng, i32 %sec, i32 %sec_fraction) #0 {
entry:
  %buf.addr = alloca i8*, align 4
  %prec.addr = alloca i32, align 4
  %lng.addr = alloca i32, align 4
  %sec.addr = alloca i32, align 4
  %sec_fraction.addr = alloca i32, align 4
  %min = alloca i32, align 4
  %abuf = alloca [12 x i8], align 1
  %ind = alloca i32, align 4
  %aind = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %prec, i32* %prec.addr, align 4
  store i32 %lng, i32* %lng.addr, align 4
  store i32 %sec, i32* %sec.addr, align 4
  store i32 %sec_fraction, i32* %sec_fraction.addr, align 4
  store i32 0, i32* %ind, align 4
  %arrayidx = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 11
  store i8 0, i8* %arrayidx, align 1
  %0 = load i32, i32* %lng.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %sec.addr, align 4
  %div = sdiv i32 %1, 60
  store i32 %div, i32* %min, align 4
  %2 = load i32, i32* %sec.addr, align 4
  %rem = srem i32 %2, 60
  store i32 %rem, i32* %sec.addr, align 4
  store i32 10, i32* %aind, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %3 = load i32, i32* %min, align 4
  %rem1 = srem i32 %3, 10
  %add = add nsw i32 %rem1, 48
  %conv = trunc i32 %add to i8
  %4 = load i32, i32* %aind, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* %aind, align 4
  %arrayidx2 = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 %4
  store i8 %conv, i8* %arrayidx2, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %5 = load i32, i32* %min, align 4
  %div3 = sdiv i32 %5, 10
  store i32 %div3, i32* %min, align 4
  %tobool4 = icmp ne i32 %div3, 0
  br i1 %tobool4, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %6 = load i32, i32* %aind, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %aind, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.end
  %7 = load i32, i32* %aind, align 4
  %arrayidx5 = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 %7
  %8 = load i8, i8* %arrayidx5, align 1
  %tobool6 = icmp ne i8 %8, 0
  br i1 %tobool6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32, i32* %aind, align 4
  %inc7 = add nsw i32 %9, 1
  store i32 %inc7, i32* %aind, align 4
  %arrayidx8 = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 %9
  %10 = load i8, i8* %arrayidx8, align 1
  %11 = load i8*, i8** %buf.addr, align 4
  %12 = load i32, i32* %ind, align 4
  %inc9 = add nsw i32 %12, 1
  store i32 %inc9, i32* %ind, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %11, i32 %12
  store i8 %10, i8* %arrayidx10, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load i8*, i8** %buf.addr, align 4
  %14 = load i32, i32* %ind, align 4
  %inc11 = add nsw i32 %14, 1
  store i32 %inc11, i32* %ind, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %13, i32 %14
  store i8 109, i8* %arrayidx12, align 1
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  store i32 10, i32* %aind, align 4
  br label %do.body13

do.body13:                                        ; preds = %do.cond19, %if.end
  %15 = load i32, i32* %sec.addr, align 4
  %rem14 = srem i32 %15, 10
  %add15 = add nsw i32 %rem14, 48
  %conv16 = trunc i32 %add15 to i8
  %16 = load i32, i32* %aind, align 4
  %dec17 = add nsw i32 %16, -1
  store i32 %dec17, i32* %aind, align 4
  %arrayidx18 = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 %16
  store i8 %conv16, i8* %arrayidx18, align 1
  br label %do.cond19

do.cond19:                                        ; preds = %do.body13
  %17 = load i32, i32* %sec.addr, align 4
  %div20 = sdiv i32 %17, 10
  store i32 %div20, i32* %sec.addr, align 4
  %tobool21 = icmp ne i32 %div20, 0
  br i1 %tobool21, label %do.body13, label %do.end22

do.end22:                                         ; preds = %do.cond19
  %18 = load i32, i32* %aind, align 4
  %inc23 = add nsw i32 %18, 1
  store i32 %inc23, i32* %aind, align 4
  br label %while.cond24

while.cond24:                                     ; preds = %while.body27, %do.end22
  %19 = load i32, i32* %aind, align 4
  %arrayidx25 = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 %19
  %20 = load i8, i8* %arrayidx25, align 1
  %tobool26 = icmp ne i8 %20, 0
  br i1 %tobool26, label %while.body27, label %while.end32

while.body27:                                     ; preds = %while.cond24
  %21 = load i32, i32* %aind, align 4
  %inc28 = add nsw i32 %21, 1
  store i32 %inc28, i32* %aind, align 4
  %arrayidx29 = getelementptr inbounds [12 x i8], [12 x i8]* %abuf, i32 0, i32 %21
  %22 = load i8, i8* %arrayidx29, align 1
  %23 = load i8*, i8** %buf.addr, align 4
  %24 = load i32, i32* %ind, align 4
  %inc30 = add nsw i32 %24, 1
  store i32 %inc30, i32* %ind, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %23, i32 %24
  store i8 %22, i8* %arrayidx31, align 1
  br label %while.cond24

while.end32:                                      ; preds = %while.cond24
  %25 = load i32, i32* %prec.addr, align 4
  %cmp = icmp ne i32 %25, 0
  br i1 %cmp, label %if.then34, label %if.end49

if.then34:                                        ; preds = %while.end32
  %call = call i32 @decpoint()
  %conv35 = trunc i32 %call to i8
  %26 = load i8*, i8** %buf.addr, align 4
  %27 = load i32, i32* %ind, align 4
  %inc36 = add nsw i32 %27, 1
  store i32 %inc36, i32* %ind, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %26, i32 %27
  store i8 %conv35, i8* %arrayidx37, align 1
  store i32 1, i32* %aind, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then34
  %28 = load i32, i32* %aind, align 4
  %29 = load i32, i32* %prec.addr, align 4
  %cmp38 = icmp sle i32 %28, %29
  br i1 %cmp38, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %30 = load i32, i32* %sec_fraction.addr, align 4
  %31 = load i32, i32* %aind, align 4
  %arrayidx40 = getelementptr inbounds [4 x i32], [4 x i32]* @precs, i32 0, i32 %31
  %32 = load i32, i32* %arrayidx40, align 4
  %div41 = sdiv i32 %30, %32
  %add42 = add nsw i32 %div41, 48
  %conv43 = trunc i32 %add42 to i8
  %33 = load i8*, i8** %buf.addr, align 4
  %34 = load i32, i32* %ind, align 4
  %inc44 = add nsw i32 %34, 1
  store i32 %inc44, i32* %ind, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %33, i32 %34
  store i8 %conv43, i8* %arrayidx45, align 1
  %35 = load i32, i32* %aind, align 4
  %arrayidx46 = getelementptr inbounds [4 x i32], [4 x i32]* @precs, i32 0, i32 %35
  %36 = load i32, i32* %arrayidx46, align 4
  %37 = load i32, i32* %sec_fraction.addr, align 4
  %rem47 = srem i32 %37, %36
  store i32 %rem47, i32* %sec_fraction.addr, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %38 = load i32, i32* %aind, align 4
  %inc48 = add nsw i32 %38, 1
  store i32 %inc48, i32* %aind, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end49

if.end49:                                         ; preds = %for.end, %while.end32
  %39 = load i32, i32* %lng.addr, align 4
  %tobool50 = icmp ne i32 %39, 0
  br i1 %tobool50, label %if.then51, label %if.end54

if.then51:                                        ; preds = %if.end49
  %40 = load i8*, i8** %buf.addr, align 4
  %41 = load i32, i32* %ind, align 4
  %inc52 = add nsw i32 %41, 1
  store i32 %inc52, i32* %ind, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %40, i32 %41
  store i8 115, i8* %arrayidx53, align 1
  br label %if.end54

if.end54:                                         ; preds = %if.then51, %if.end49
  %42 = load i8*, i8** %buf.addr, align 4
  %43 = load i32, i32* %ind, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %42, i32 %43
  store i8 0, i8* %arrayidx55, align 1
  %44 = load i32, i32* %ind, align 4
  ret i32 %44
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @decpoint() #0 {
entry:
  %lv = alloca %struct.lconv*, align 4
  %call = call %struct.lconv* @localeconv()
  store %struct.lconv* %call, %struct.lconv** %lv, align 4
  %0 = load %struct.lconv*, %struct.lconv** %lv, align 4
  %tobool = icmp ne %struct.lconv* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.lconv*, %struct.lconv** %lv, align 4
  %decimal_point = getelementptr inbounds %struct.lconv, %struct.lconv* %1, i32 0, i32 0
  %2 = load i8*, i8** %decimal_point, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %cond.false

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.lconv*, %struct.lconv** %lv, align 4
  %decimal_point3 = getelementptr inbounds %struct.lconv, %struct.lconv* %3, i32 0, i32 0
  %4 = load i8*, i8** %decimal_point3, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %tobool4 = icmp ne i32 %conv, 0
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true2
  %6 = load %struct.lconv*, %struct.lconv** %lv, align 4
  %decimal_point5 = getelementptr inbounds %struct.lconv, %struct.lconv* %6, i32 0, i32 0
  %7 = load i8*, i8** %decimal_point5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %8 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true2, %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv7, %cond.true ], [ 46, %cond.false ]
  ret i32 %cond
}

declare %struct.lconv* @localeconv() #1

declare void @reset_terminating_signals() #1

declare void @reset_signal_handlers() #1

; Function Attrs: noinline nounwind
define internal void @do_piping(i32 %pipe_in, i32 %pipe_out) #0 {
entry:
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  %0 = load i32, i32* %pipe_in.addr, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %pipe_in.addr, align 4
  %call = call i32 @dup2(i32 %1, i32 0)
  %cmp1 = icmp slt i32 %call, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %pipe_in.addr, align 4
  call void @dup_error(i32 %2, i32 0)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %3 = load i32, i32* %pipe_in.addr, align 4
  %cmp3 = icmp sgt i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %4 = load i32, i32* %pipe_in.addr, align 4
  %call5 = call i32 @close(i32 %4)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %entry
  %5 = load i32, i32* %pipe_out.addr, align 4
  %cmp8 = icmp ne i32 %5, -1
  br i1 %cmp8, label %if.then9, label %if.end26

if.then9:                                         ; preds = %if.end7
  %6 = load i32, i32* %pipe_out.addr, align 4
  %cmp10 = icmp ne i32 %6, -2
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.then9
  %7 = load i32, i32* %pipe_out.addr, align 4
  %call12 = call i32 @dup2(i32 %7, i32 1)
  %cmp13 = icmp slt i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then11
  %8 = load i32, i32* %pipe_out.addr, align 4
  call void @dup_error(i32 %8, i32 1)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.then11
  %9 = load i32, i32* %pipe_out.addr, align 4
  %cmp16 = icmp eq i32 %9, 0
  br i1 %cmp16, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %pipe_out.addr, align 4
  %cmp17 = icmp sgt i32 %10, 1
  br i1 %cmp17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %lor.lhs.false, %if.end15
  %11 = load i32, i32* %pipe_out.addr, align 4
  %call19 = call i32 @close(i32 %11)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %lor.lhs.false
  br label %if.end25

if.else:                                          ; preds = %if.then9
  %call21 = call i32 @dup2(i32 1, i32 2)
  %cmp22 = icmp slt i32 %call21, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.else
  call void @dup_error(i32 1, i32 2)
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.else
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.end20
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end7
  ret void
}

; Function Attrs: noinline nounwind
define internal void @async_redirect_stdin() #0 {
entry:
  %fd = alloca i32, align 4
  %call = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.20, i32 0, i32 0), i32 0)
  store i32 %call, i32* %fd, align 4
  %0 = load i32, i32* %fd, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %fd, align 4
  %call1 = call i32 @dup2(i32 %1, i32 0)
  %2 = load i32, i32* %fd, align 4
  %call2 = call i32 @close(i32 %2)
  br label %if.end8

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %fd, align 4
  %cmp3 = icmp slt i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  %call5 = call i8* @libintl_gettext(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.21, i32 0, i32 0))
  %call6 = call i32* @__errno_location()
  %4 = load i32, i32* %call6, align 4
  %call7 = call i8* @strerror(i32 %4)
  call void (i8*, ...) @internal_error(i8* %call5, i8* %call7)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #3

declare i32 @run_exit_trap() #1

declare i32 @dup2(i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @dup_error(i32 %oldd, i32 %newd) #0 {
entry:
  %oldd.addr = alloca i32, align 4
  %newd.addr = alloca i32, align 4
  store i32 %oldd, i32* %oldd.addr, align 4
  store i32 %newd, i32* %newd.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.19, i32 0, i32 0))
  %0 = load i32, i32* %oldd.addr, align 4
  %1 = load i32, i32* %newd.addr, align 4
  call void (i8*, ...) @sys_error(i8* %call, i32 %0, i32 %1)
  ret void
}

declare void @internal_warning(i8*, ...) #1

declare i32 @sh_openpipe(i32*) #1

declare i32 @fcntl(i32, i32, ...) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_pipeline(%struct.command* %command, i32 %asynchronous, i32 %pipe_in, i32 %pipe_out, %struct.fd_bitmap* %fds_to_close) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca %struct.command*, align 4
  %asynchronous.addr = alloca i32, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %prev = alloca i32, align 4
  %fildes = alloca [2 x i32], align 4
  %new_bitmap_size = alloca i32, align 4
  %dummyfd = alloca i32, align 4
  %ignore_return = alloca i32, align 4
  %exec_result = alloca i32, align 4
  %lstdin = alloca i32, align 4
  %lastpipe_flag = alloca i32, align 4
  %lastpipe_jid = alloca i32, align 4
  %cmd = alloca %struct.command*, align 4
  %fd_bitmap = alloca %struct.fd_bitmap*, align 4
  %lastpid = alloca i32, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %asynchronous, i32* %asynchronous.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %0, i32 0, i32 1
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 8
  %cmp = icmp ne i32 %and, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %ignore_return, align 4
  %2 = load i32, i32* %pipe_in.addr, align 4
  store i32 %2, i32* %prev, align 4
  %3 = load %struct.command*, %struct.command** %command.addr, align 4
  store %struct.command* %3, %struct.command** %cmd, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end47, %entry
  %4 = load %struct.command*, %struct.command** %cmd, align 4
  %tobool = icmp ne %struct.command* %4, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %5 = load %struct.command*, %struct.command** %cmd, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 0
  %6 = load i32, i32* %type, align 4
  %cmp1 = icmp eq i32 %6, 6
  br i1 %cmp1, label %land.lhs.true3, label %land.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %7 = load %struct.command*, %struct.command** %cmd, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 4
  %Connection = bitcast %union.anon* %value to %struct.connection**
  %8 = load %struct.connection*, %struct.connection** %Connection, align 4
  %tobool4 = icmp ne %struct.connection* %8, null
  br i1 %tobool4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true3
  %9 = load %struct.command*, %struct.command** %cmd, align 4
  %value5 = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 4
  %Connection6 = bitcast %union.anon* %value5 to %struct.connection**
  %10 = load %struct.connection*, %struct.connection** %Connection6, align 4
  %connector = getelementptr inbounds %struct.connection, %struct.connection* %10, i32 0, i32 3
  %11 = load i32, i32* %connector, align 4
  %cmp7 = icmp eq i32 %11, 124
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true3, %land.lhs.true, %while.cond
  %12 = phi i1 [ false, %land.lhs.true3 ], [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp7, %land.rhs ]
  br i1 %12, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %arraydecay = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 0
  %call = call i32 @pipe(i32* %arraydecay)
  %cmp9 = icmp slt i32 %call, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %call11 = call i8* @libintl_gettext(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.24, i32 0, i32 0))
  call void (i8*, ...) @sys_error(i8* %call11)
  store volatile i32 1, i32* @last_command_exit_value, align 4
  call void @throw_to_top_level()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 0
  %13 = load i32, i32* %arrayidx, align 4
  %14 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %size = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %14, i32 0, i32 0
  %15 = load i32, i32* %size, align 4
  %cmp12 = icmp slt i32 %13, %15
  br i1 %cmp12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %16 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %size14 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %16, i32 0, i32 0
  %17 = load i32, i32* %size14, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %arrayidx15 = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 0
  %18 = load i32, i32* %arrayidx15, align 4
  %add = add nsw i32 %18, 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %17, %cond.true ], [ %add, %cond.false ]
  store i32 %cond, i32* %new_bitmap_size, align 4
  %19 = load i32, i32* %new_bitmap_size, align 4
  %call16 = call %struct.fd_bitmap* @new_fd_bitmap(i32 %19)
  store %struct.fd_bitmap* %call16, %struct.fd_bitmap** %fd_bitmap, align 4
  %20 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %bitmap = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %20, i32 0, i32 1
  %21 = load i8*, i8** %bitmap, align 4
  %22 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fd_bitmap, align 4
  %bitmap17 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %22, i32 0, i32 1
  %23 = load i8*, i8** %bitmap17, align 4
  %24 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %size18 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %24, i32 0, i32 0
  %25 = load i32, i32* %size18, align 4
  call void @xbcopy(i8* %21, i8* %23, i32 %25)
  %26 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fd_bitmap, align 4
  %bitmap19 = getelementptr inbounds %struct.fd_bitmap, %struct.fd_bitmap* %26, i32 0, i32 1
  %27 = load i8*, i8** %bitmap19, align 4
  %arrayidx20 = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 0
  %28 = load i32, i32* %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %27, i32 %28
  store i8 1, i8* %arrayidx21, align 1
  call void @begin_unwind_frame(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0))
  %29 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fd_bitmap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, %struct.fd_bitmap*)*)(void (...)* bitcast (void (%struct.fd_bitmap*)* @dispose_fd_bitmap to void (...)*), %struct.fd_bitmap* %29)
  %30 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fd_bitmap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, %struct.fd_bitmap*)*)(void (...)* bitcast (void (%struct.fd_bitmap*)* @close_fd_bitmap to void (...)*), %struct.fd_bitmap* %30)
  %31 = load i32, i32* %prev, align 4
  %cmp22 = icmp sge i32 %31, 0
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %cond.end
  %32 = load i32, i32* %prev, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (i32)*, i32)*)(i32 (i32)* @close, i32 %32)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %cond.end
  %arrayidx26 = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 1
  %33 = load i32, i32* %arrayidx26, align 4
  store i32 %33, i32* %dummyfd, align 4
  %34 = load i32, i32* %dummyfd, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (i32)*, i32)*)(i32 (i32)* @close, i32 %34)
  %35 = load i32, i32* %ignore_return, align 4
  %tobool27 = icmp ne i32 %35, 0
  br i1 %tobool27, label %land.lhs.true28, label %if.end37

land.lhs.true28:                                  ; preds = %if.end25
  %36 = load %struct.command*, %struct.command** %cmd, align 4
  %value29 = getelementptr inbounds %struct.command, %struct.command* %36, i32 0, i32 4
  %Connection30 = bitcast %union.anon* %value29 to %struct.connection**
  %37 = load %struct.connection*, %struct.connection** %Connection30, align 4
  %first = getelementptr inbounds %struct.connection, %struct.connection* %37, i32 0, i32 1
  %38 = load %struct.command*, %struct.command** %first, align 4
  %tobool31 = icmp ne %struct.command* %38, null
  br i1 %tobool31, label %if.then32, label %if.end37

if.then32:                                        ; preds = %land.lhs.true28
  %39 = load %struct.command*, %struct.command** %cmd, align 4
  %value33 = getelementptr inbounds %struct.command, %struct.command* %39, i32 0, i32 4
  %Connection34 = bitcast %union.anon* %value33 to %struct.connection**
  %40 = load %struct.connection*, %struct.connection** %Connection34, align 4
  %first35 = getelementptr inbounds %struct.connection, %struct.connection* %40, i32 0, i32 1
  %41 = load %struct.command*, %struct.command** %first35, align 4
  %flags36 = getelementptr inbounds %struct.command, %struct.command* %41, i32 0, i32 1
  %42 = load i32, i32* %flags36, align 4
  %or = or i32 %42, 8
  store i32 %or, i32* %flags36, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then32, %land.lhs.true28, %if.end25
  %43 = load %struct.command*, %struct.command** %cmd, align 4
  %value38 = getelementptr inbounds %struct.command, %struct.command* %43, i32 0, i32 4
  %Connection39 = bitcast %union.anon* %value38 to %struct.connection**
  %44 = load %struct.connection*, %struct.connection** %Connection39, align 4
  %first40 = getelementptr inbounds %struct.connection, %struct.connection* %44, i32 0, i32 1
  %45 = load %struct.command*, %struct.command** %first40, align 4
  %46 = load i32, i32* %asynchronous.addr, align 4
  %47 = load i32, i32* %prev, align 4
  %arrayidx41 = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 1
  %48 = load i32, i32* %arrayidx41, align 4
  %49 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fd_bitmap, align 4
  %call42 = call i32 @execute_command_internal(%struct.command* %45, i32 %46, i32 %47, i32 %48, %struct.fd_bitmap* %49)
  %50 = load i32, i32* %prev, align 4
  %cmp43 = icmp sge i32 %50, 0
  br i1 %cmp43, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end37
  %51 = load i32, i32* %prev, align 4
  %call46 = call i32 @close(i32 %51)
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end37
  %arrayidx48 = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 0
  %52 = load i32, i32* %arrayidx48, align 4
  store i32 %52, i32* %prev, align 4
  %arrayidx49 = getelementptr inbounds [2 x i32], [2 x i32]* %fildes, i32 0, i32 1
  %53 = load i32, i32* %arrayidx49, align 4
  %call50 = call i32 @close(i32 %53)
  %54 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fd_bitmap, align 4
  call void @dispose_fd_bitmap(%struct.fd_bitmap* %54)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0))
  %55 = load %struct.command*, %struct.command** %cmd, align 4
  %value51 = getelementptr inbounds %struct.command, %struct.command* %55, i32 0, i32 4
  %Connection52 = bitcast %union.anon* %value51 to %struct.connection**
  %56 = load %struct.connection*, %struct.connection** %Connection52, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %56, i32 0, i32 2
  %57 = load %struct.command*, %struct.command** %second, align 4
  store %struct.command* %57, %struct.command** %cmd, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %58 = load volatile i32, i32* @last_made_pid, align 4
  store i32 %58, i32* %lastpid, align 4
  %59 = load i32, i32* %ignore_return, align 4
  %tobool53 = icmp ne i32 %59, 0
  br i1 %tobool53, label %land.lhs.true54, label %if.end59

land.lhs.true54:                                  ; preds = %while.end
  %60 = load %struct.command*, %struct.command** %cmd, align 4
  %tobool55 = icmp ne %struct.command* %60, null
  br i1 %tobool55, label %if.then56, label %if.end59

if.then56:                                        ; preds = %land.lhs.true54
  %61 = load %struct.command*, %struct.command** %cmd, align 4
  %flags57 = getelementptr inbounds %struct.command, %struct.command* %61, i32 0, i32 1
  %62 = load i32, i32* %flags57, align 4
  %or58 = or i32 %62, 8
  store i32 %or58, i32* %flags57, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then56, %land.lhs.true54, %while.end
  store i32 0, i32* %lastpipe_flag, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.26, i32 0, i32 0))
  store i32 -1, i32* %lstdin, align 4
  %63 = load i32, i32* @lastpipe_opt, align 4
  %tobool60 = icmp ne i32 %63, 0
  br i1 %tobool60, label %land.lhs.true61, label %if.end86

land.lhs.true61:                                  ; preds = %if.end59
  %64 = load i32, i32* @job_control, align 4
  %cmp62 = icmp eq i32 %64, 0
  br i1 %cmp62, label %land.lhs.true64, label %if.end86

land.lhs.true64:                                  ; preds = %land.lhs.true61
  %65 = load i32, i32* %asynchronous.addr, align 4
  %cmp65 = icmp eq i32 %65, 0
  br i1 %cmp65, label %land.lhs.true67, label %if.end86

land.lhs.true67:                                  ; preds = %land.lhs.true64
  %66 = load i32, i32* %pipe_out.addr, align 4
  %cmp68 = icmp eq i32 %66, -1
  br i1 %cmp68, label %land.lhs.true70, label %if.end86

land.lhs.true70:                                  ; preds = %land.lhs.true67
  %67 = load i32, i32* %prev, align 4
  %cmp71 = icmp sgt i32 %67, 0
  br i1 %cmp71, label %if.then73, label %if.end86

if.then73:                                        ; preds = %land.lhs.true70
  %call74 = call i32 @move_to_high_fd(i32 0, i32 1, i32 -1)
  store i32 %call74, i32* %lstdin, align 4
  %68 = load i32, i32* %lstdin, align 4
  %cmp75 = icmp sgt i32 %68, 0
  br i1 %cmp75, label %if.then77, label %if.end80

if.then77:                                        ; preds = %if.then73
  %69 = load i32, i32* %prev, align 4
  %70 = load i32, i32* %pipe_out.addr, align 4
  call void @do_piping(i32 %69, i32 %70)
  store i32 -1, i32* %prev, align 4
  %71 = load i32, i32* %lstdin, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i32)*)(void (...)* bitcast (void (i32)* @restore_stdin to void (...)*), i32 %71)
  store i32 1, i32* %lastpipe_flag, align 4
  %call78 = call i32 @freeze_jobs_list()
  %call79 = call i32 @stop_pipeline(i32 0, %struct.command* null)
  store i32 %call79, i32* %lastpipe_jid, align 4
  %72 = load i32, i32* %lastpipe_jid, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i32)*)(void (...)* bitcast (void (i32)* @lastpipe_cleanup to void (...)*), i32 %72)
  br label %if.end80

if.end80:                                         ; preds = %if.then77, %if.then73
  %73 = load %struct.command*, %struct.command** %cmd, align 4
  %tobool81 = icmp ne %struct.command* %73, null
  br i1 %tobool81, label %if.then82, label %if.end85

if.then82:                                        ; preds = %if.end80
  %74 = load %struct.command*, %struct.command** %cmd, align 4
  %flags83 = getelementptr inbounds %struct.command, %struct.command* %74, i32 0, i32 1
  %75 = load i32, i32* %flags83, align 4
  %or84 = or i32 %75, 8192
  store i32 %or84, i32* %flags83, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.then82, %if.end80
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %land.lhs.true70, %land.lhs.true67, %land.lhs.true64, %land.lhs.true61, %if.end59
  %76 = load i32, i32* %prev, align 4
  %cmp87 = icmp sge i32 %76, 0
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %if.end86
  %77 = load i32, i32* %prev, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (i32)*, i32)*)(i32 (i32)* @close, i32 %77)
  br label %if.end90

if.end90:                                         ; preds = %if.then89, %if.end86
  %78 = load %struct.command*, %struct.command** %cmd, align 4
  %79 = load i32, i32* %asynchronous.addr, align 4
  %80 = load i32, i32* %prev, align 4
  %81 = load i32, i32* %pipe_out.addr, align 4
  %82 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call91 = call i32 @execute_command_internal(%struct.command* %78, i32 %79, i32 %80, i32 %81, %struct.fd_bitmap* %82)
  store i32 %call91, i32* %exec_result, align 4
  %83 = load i32, i32* %lstdin, align 4
  %cmp92 = icmp sgt i32 %83, 0
  br i1 %cmp92, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end90
  %84 = load i32, i32* %lstdin, align 4
  call void @restore_stdin(i32 %84)
  br label %if.end95

if.end95:                                         ; preds = %if.then94, %if.end90
  %85 = load i32, i32* %prev, align 4
  %cmp96 = icmp sge i32 %85, 0
  br i1 %cmp96, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.end95
  %86 = load i32, i32* %prev, align 4
  %call99 = call i32 @close(i32 %86)
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.end95
  br label %do.body

do.body:                                          ; preds = %if.end100
  %87 = load volatile i32, i32* @terminating_signal, align 4
  %tobool101 = icmp ne i32 %87, 0
  br i1 %tobool101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %do.body
  %88 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %88)
  br label %if.end103

if.end103:                                        ; preds = %if.then102, %do.body
  %89 = load volatile i32, i32* @interrupt_state, align 4
  %tobool104 = icmp ne i32 %89, 0
  br i1 %tobool104, label %if.then105, label %if.end106

if.then105:                                       ; preds = %if.end103
  call void @throw_to_top_level()
  br label %if.end106

if.end106:                                        ; preds = %if.then105, %if.end103
  br label %do.end

do.end:                                           ; preds = %if.end106
  %90 = load i32, i32* %lastpipe_flag, align 4
  %tobool107 = icmp ne i32 %90, 0
  br i1 %tobool107, label %if.then108, label %if.end110

if.then108:                                       ; preds = %do.end
  %91 = load i32, i32* %lastpid, align 4
  %call109 = call i32 @wait_for(i32 %91)
  store i32 %call109, i32* %lstdin, align 4
  call void @unfreeze_jobs_list()
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %do.end
  call void @discard_unwind_frame(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.26, i32 0, i32 0))
  %92 = load i32, i32* %exec_result, align 4
  store i32 %92, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end110, %if.then
  %93 = load i32, i32* %retval, align 4
  ret i32 %93
}

declare i32 @pipe(i32*) #1

declare i32 @move_to_high_fd(i32, i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @restore_stdin(i32 %s) #0 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  %call = call i32 @dup2(i32 %0, i32 0)
  %1 = load i32, i32* %s.addr, align 4
  %call1 = call i32 @close(i32 %1)
  ret void
}

declare i32 @freeze_jobs_list() #1

; Function Attrs: noinline nounwind
define internal void @lastpipe_cleanup(i32 %s) #0 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  call void @unfreeze_jobs_list()
  ret void
}

declare void @unfreeze_jobs_list() #1

declare %struct.word_list* @expand_words_no_vars(%struct.word_list*) #1

declare void @dispose_words(%struct.word_list*) #1

declare void @print_for_command_head(%struct.for_com*) #1

declare void @xtrace_print_for_command_head(%struct.for_com*) #1

declare i32 @run_debug_trap() #1

declare %struct.variable* @find_variable_last_nameref(i8*, i32) #1

declare i32 @valid_nameref_value(i8*, i32) #1

declare void @sh_invalidid(i8*) #1

declare %struct.variable* @bind_variable_value(%struct.variable*, i8*, i32) #1

declare void @setifs(%struct.variable*) #1

declare void @reap_dead_jobs() #1

; Function Attrs: noinline nounwind
define internal i64 @eval_arith_for_expr(%struct.word_list* %l, i32* %okp) #0 {
entry:
  %l.addr = alloca %struct.word_list*, align 4
  %okp.addr = alloca i32*, align 4
  %new = alloca %struct.word_list*, align 4
  %expresult = alloca i64, align 8
  %r = alloca i32, align 4
  store %struct.word_list* %l, %struct.word_list** %l.addr, align 4
  store i32* %okp, i32** %okp.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %l.addr, align 4
  %call = call %struct.word_list* @expand_words_no_vars(%struct.word_list* %0)
  store %struct.word_list* %call, %struct.word_list** %new, align 4
  %1 = load %struct.word_list*, %struct.word_list** %new, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %if.then, label %if.else22

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @echo_command_at_execute, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.word_list*, %struct.word_list** %new, align 4
  call void @xtrace_print_arith_cmd(%struct.word_list* %3)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8** @this_command_name, align 4
  store i32 0, i32* @command_string_index, align 4
  %4 = load %struct.word_list*, %struct.word_list** %new, align 4
  call void @print_arith_command(%struct.word_list* %4)
  %call3 = call i32 @signal_in_progress(i32 65)
  %cmp = icmp eq i32 %call3, 0
  br i1 %cmp, label %if.then4, label %if.end11

if.then4:                                         ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %if.then4
  %5 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool5 = icmp ne i8* %5, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.body
  %6 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2886)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end7
  %7 = load i8*, i8** @the_printed_command, align 4
  %call8 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call8
  %call9 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 2887)
  %8 = load i8*, i8** @the_printed_command, align 4
  %call10 = call i8* @strcpy(i8* %call9, i8* %8)
  store i8* %call10, i8** @the_printed_command_except_trap, align 4
  br label %if.end11

if.end11:                                         ; preds = %do.end, %if.end
  %call12 = call i32 @run_debug_trap()
  store i32 %call12, i32* %r, align 4
  %9 = load i32, i32* @debugging_mode, align 4
  %cmp13 = icmp eq i32 %9, 0
  br i1 %cmp13, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end11
  %10 = load i32, i32* %r, align 4
  %cmp14 = icmp eq i32 %10, 0
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %lor.lhs.false, %if.end11
  %11 = load %struct.word_list*, %struct.word_list** %new, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word16 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 0
  %13 = load i8*, i8** %word16, align 4
  %14 = load i32*, i32** %okp.addr, align 4
  %call17 = call i64 @evalexp(i8* %13, i32* %14)
  store i64 %call17, i64* %expresult, align 8
  br label %if.end21

if.else:                                          ; preds = %lor.lhs.false
  store i64 0, i64* %expresult, align 8
  %15 = load i32*, i32** %okp.addr, align 4
  %tobool18 = icmp ne i32* %15, null
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.else
  %16 = load i32*, i32** %okp.addr, align 4
  store i32 1, i32* %16, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.else
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then15
  %17 = load %struct.word_list*, %struct.word_list** %new, align 4
  call void @dispose_words(%struct.word_list* %17)
  br label %if.end26

if.else22:                                        ; preds = %entry
  store i64 0, i64* %expresult, align 8
  %18 = load i32*, i32** %okp.addr, align 4
  %tobool23 = icmp ne i32* %18, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.else22
  %19 = load i32*, i32** %okp.addr, align 4
  store i32 1, i32* %19, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.else22
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end21
  %20 = load i64, i64* %expresult, align 8
  ret i64 %20
}

declare void @xtrace_print_arith_cmd(%struct.word_list*) #1

declare void @print_arith_command(%struct.word_list*) #1

declare i64 @evalexp(i8*, i32*) #1

declare void @print_select_command_head(%struct.select_com*) #1

declare void @xtrace_print_select_command_head(%struct.select_com*) #1

declare i32 @list_length(...) #1

; Function Attrs: noinline nounwind
define internal i8* @select_query(%struct.word_list* %list, i32 %list_len, i8* %prompt, i32 %print_menu) #0 {
entry:
  %retval = alloca i8*, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %list_len.addr = alloca i32, align 4
  %prompt.addr = alloca i8*, align 4
  %print_menu.addr = alloca i32, align 4
  %max_elem_len = alloca i32, align 4
  %indices_len = alloca i32, align 4
  %len = alloca i32, align 4
  %reply = alloca i64, align 8
  %l = alloca %struct.word_list*, align 4
  %repl_string = alloca i8*, align 4
  %t = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %list_len, i32* %list_len.addr, align 4
  store i8* %prompt, i8** %prompt.addr, align 4
  store i32 %print_menu, i32* %print_menu.addr, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.33, i32 0, i32 0))
  store i8* %call, i8** %t, align 4
  %0 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %t, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %t, align 4
  %call2 = call i32 @atoi(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ 80, %cond.false ]
  store i32 %cond, i32* @COLS, align 4
  store i32 8, i32* @tabsize, align 4
  store i32 0, i32* %max_elem_len, align 4
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %4, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %5 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool3 = icmp ne %struct.word_list* %5, null
  br i1 %tobool3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 1
  %7 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word4, align 4
  %call5 = call i32 @displen(i8* %8)
  store i32 %call5, i32* %len, align 4
  %9 = load i32, i32* %len, align 4
  %10 = load i32, i32* %max_elem_len, align 4
  %cmp = icmp sgt i32 %9, %10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %11 = load i32, i32* %len, align 4
  store i32 %11, i32* %max_elem_len, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 0
  %13 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %13, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load i32, i32* %list_len.addr, align 4
  %cmp7 = icmp slt i32 %14, 10
  br i1 %cmp7, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %for.end
  br label %cond.end32

cond.false10:                                     ; preds = %for.end
  %15 = load i32, i32* %list_len.addr, align 4
  %cmp11 = icmp slt i32 %15, 100
  br i1 %cmp11, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %cond.false10
  br label %cond.end30

cond.false14:                                     ; preds = %cond.false10
  %16 = load i32, i32* %list_len.addr, align 4
  %cmp15 = icmp slt i32 %16, 1000
  br i1 %cmp15, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.false14
  br label %cond.end28

cond.false18:                                     ; preds = %cond.false14
  %17 = load i32, i32* %list_len.addr, align 4
  %cmp19 = icmp slt i32 %17, 10000
  br i1 %cmp19, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.false18
  br label %cond.end26

cond.false22:                                     ; preds = %cond.false18
  %18 = load i32, i32* %list_len.addr, align 4
  %cmp23 = icmp slt i32 %18, 100000
  %cond25 = select i1 %cmp23, i32 5, i32 6
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false22, %cond.true21
  %cond27 = phi i32 [ 4, %cond.true21 ], [ %cond25, %cond.false22 ]
  br label %cond.end28

cond.end28:                                       ; preds = %cond.end26, %cond.true17
  %cond29 = phi i32 [ 3, %cond.true17 ], [ %cond27, %cond.end26 ]
  br label %cond.end30

cond.end30:                                       ; preds = %cond.end28, %cond.true13
  %cond31 = phi i32 [ 2, %cond.true13 ], [ %cond29, %cond.end28 ]
  br label %cond.end32

cond.end32:                                       ; preds = %cond.end30, %cond.true9
  %cond33 = phi i32 [ 1, %cond.true9 ], [ %cond31, %cond.end30 ]
  store i32 %cond33, i32* %indices_len, align 4
  %19 = load i32, i32* %indices_len, align 4
  %add = add nsw i32 %19, 2
  %add34 = add nsw i32 %add, 2
  %20 = load i32, i32* %max_elem_len, align 4
  %add35 = add nsw i32 %20, %add34
  store i32 %add35, i32* %max_elem_len, align 4
  br label %while.body

while.body:                                       ; preds = %cond.end32, %if.then61
  %21 = load i32, i32* %print_menu.addr, align 4
  %tobool36 = icmp ne i32 %21, 0
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %while.body
  %22 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %23 = load i32, i32* %list_len.addr, align 4
  %24 = load i32, i32* %max_elem_len, align 4
  %25 = load i32, i32* %indices_len, align 4
  call void @print_select_list(%struct.word_list* %22, i32 %23, i32 %24, i32 %25)
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %while.body
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %27 = load i8*, i8** %prompt.addr, align 4
  %call39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0), i8* %27)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call40 = call i32 @fflush(%struct._IO_FILE* %28)
  br label %do.body

do.body:                                          ; preds = %if.end38
  %29 = load volatile i32, i32* @terminating_signal, align 4
  %tobool41 = icmp ne i32 %29, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %do.body
  %30 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %30)
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %do.body
  %31 = load volatile i32, i32* @interrupt_state, align 4
  %tobool44 = icmp ne i32 %31, 0
  br i1 %tobool44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end43
  call void @throw_to_top_level()
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %if.end43
  br label %do.end

do.end:                                           ; preds = %if.end46
  %call47 = call i32 @read_builtin(%struct.word_list* null)
  %cmp48 = icmp ne i32 %call47, 0
  br i1 %cmp48, label %if.then50, label %if.end52

if.then50:                                        ; preds = %do.end
  %call51 = call i32 @putchar(i32 10)
  store i8* null, i8** %retval, align 4
  br label %return

if.end52:                                         ; preds = %do.end
  %call53 = call i8* @get_string_value(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.32, i32 0, i32 0))
  store i8* %call53, i8** %repl_string, align 4
  %32 = load i8*, i8** %repl_string, align 4
  %cmp54 = icmp eq i8* %32, null
  br i1 %cmp54, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.end52
  store i8* null, i8** %retval, align 4
  br label %return

if.end57:                                         ; preds = %if.end52
  %33 = load i8*, i8** %repl_string, align 4
  %34 = load i8, i8* %33, align 1
  %conv58 = sext i8 %34 to i32
  %cmp59 = icmp eq i32 %conv58, 0
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end57
  store i32 1, i32* %print_menu.addr, align 4
  br label %while.body

if.end62:                                         ; preds = %if.end57
  %35 = load i8*, i8** %repl_string, align 4
  %call63 = call i32 @legal_number(i8* %35, i64* %reply)
  %cmp64 = icmp eq i32 %call63, 0
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end62
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end67:                                         ; preds = %if.end62
  %36 = load i64, i64* %reply, align 8
  %cmp68 = icmp slt i64 %36, 1
  br i1 %cmp68, label %if.then73, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end67
  %37 = load i64, i64* %reply, align 8
  %38 = load i32, i32* %list_len.addr, align 4
  %conv70 = sext i32 %38 to i64
  %cmp71 = icmp sgt i64 %37, %conv70
  br i1 %cmp71, label %if.then73, label %if.end74

if.then73:                                        ; preds = %lor.lhs.false, %if.end67
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end74:                                         ; preds = %lor.lhs.false
  %39 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %39, %struct.word_list** %l, align 4
  br label %for.cond75

for.cond75:                                       ; preds = %for.inc79, %if.end74
  %40 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool76 = icmp ne %struct.word_list* %40, null
  br i1 %tobool76, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond75
  %41 = load i64, i64* %reply, align 8
  %dec = add nsw i64 %41, -1
  store i64 %dec, i64* %reply, align 8
  %tobool77 = icmp ne i64 %dec, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond75
  %42 = phi i1 [ false, %for.cond75 ], [ %tobool77, %land.rhs ]
  br i1 %42, label %for.body78, label %for.end81

for.body78:                                       ; preds = %land.end
  br label %for.inc79

for.inc79:                                        ; preds = %for.body78
  %43 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next80 = getelementptr inbounds %struct.word_list, %struct.word_list* %43, i32 0, i32 0
  %44 = load %struct.word_list*, %struct.word_list** %next80, align 4
  store %struct.word_list* %44, %struct.word_list** %l, align 4
  br label %for.cond75

for.end81:                                        ; preds = %land.end
  %45 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word82 = getelementptr inbounds %struct.word_list, %struct.word_list* %45, i32 0, i32 1
  %46 = load %struct.word_desc*, %struct.word_desc** %word82, align 4
  %word83 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %46, i32 0, i32 0
  %47 = load i8*, i8** %word83, align 4
  store i8* %47, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end81, %if.then73, %if.then66, %if.then56, %if.then50
  %48 = load i8*, i8** %retval, align 4
  ret i8* %48
}

declare i32 @atoi(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @displen(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %wcstr = alloca i32*, align 4
  %slen = alloca i32, align 4
  %wclen = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32* null, i32** %wcstr, align 4
  %0 = load i32*, i32** %wcstr, align 4
  %1 = load i8*, i8** %s.addr, align 4
  %call = call i32 @mbstowcs(i32* %0, i8* %1, i32 0)
  store i32 %call, i32* %slen, align 4
  %2 = load i32, i32* %slen, align 4
  %cmp = icmp eq i32 %2, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %slen, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %slen, align 4
  %add = add i32 %3, 1
  %mul = mul i32 4, %add
  %call1 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3033)
  %4 = bitcast i8* %call1 to i32*
  store i32* %4, i32** %wcstr, align 4
  %5 = load i32*, i32** %wcstr, align 4
  %6 = load i8*, i8** %s.addr, align 4
  %7 = load i32, i32* %slen, align 4
  %add2 = add i32 %7, 1
  %call3 = call i32 @mbstowcs(i32* %5, i8* %6, i32 %add2)
  %8 = load i32*, i32** %wcstr, align 4
  %9 = load i32, i32* %slen, align 4
  %call4 = call i32 @wcswidth(i32* %8, i32 %9)
  store i32 %call4, i32* %wclen, align 4
  %10 = load i32*, i32** %wcstr, align 4
  %11 = bitcast i32* %10 to i8*
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3036)
  %12 = load i32, i32* %wclen, align 4
  %cmp5 = icmp slt i32 %12, 0
  br i1 %cmp5, label %cond.true, label %cond.false23

cond.true:                                        ; preds = %if.end
  %13 = load i8*, i8** %s.addr, align 4
  %tobool = icmp ne i8* %13, null
  br i1 %tobool, label %land.lhs.true, label %cond.false20

land.lhs.true:                                    ; preds = %cond.true
  %14 = load i8*, i8** %s.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %15 to i32
  %tobool6 = icmp ne i32 %conv, 0
  br i1 %tobool6, label %cond.true7, label %cond.false20

cond.true7:                                       ; preds = %land.lhs.true
  %16 = load i8*, i8** %s.addr, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %16, i32 1
  %17 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %17 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br i1 %tobool10, label %cond.true11, label %cond.false17

cond.true11:                                      ; preds = %cond.true7
  %18 = load i8*, i8** %s.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %18, i32 2
  %19 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %19 to i32
  %tobool14 = icmp ne i32 %conv13, 0
  br i1 %tobool14, label %cond.true15, label %cond.false

cond.true15:                                      ; preds = %cond.true11
  %20 = load i8*, i8** %s.addr, align 4
  %call16 = call i32 @strlen(i8* %20)
  br label %cond.end

cond.false:                                       ; preds = %cond.true11
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true15
  %cond = phi i32 [ %call16, %cond.true15 ], [ 2, %cond.false ]
  br label %cond.end18

cond.false17:                                     ; preds = %cond.true7
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false17, %cond.end
  %cond19 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false17 ]
  br label %cond.end21

cond.false20:                                     ; preds = %land.lhs.true, %cond.true
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.end18
  %cond22 = phi i32 [ %cond19, %cond.end18 ], [ 0, %cond.false20 ]
  br label %cond.end24

cond.false23:                                     ; preds = %if.end
  %21 = load i32, i32* %wclen, align 4
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.end21
  %cond25 = phi i32 [ %cond22, %cond.end21 ], [ %21, %cond.false23 ]
  ret i32 %cond25
}

; Function Attrs: noinline nounwind
define internal void @print_select_list(%struct.word_list* %list, i32 %list_len, i32 %max_elem_len, i32 %indices_len) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %list_len.addr = alloca i32, align 4
  %max_elem_len.addr = alloca i32, align 4
  %indices_len.addr = alloca i32, align 4
  %ind = alloca i32, align 4
  %row = alloca i32, align 4
  %elem_len = alloca i32, align 4
  %pos = alloca i32, align 4
  %cols = alloca i32, align 4
  %rows = alloca i32, align 4
  %first_column_indices_len = alloca i32, align 4
  %other_indices_len = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %list_len, i32* %list_len.addr, align 4
  store i32 %max_elem_len, i32* %max_elem_len.addr, align 4
  store i32 %indices_len, i32* %indices_len.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @putc(i32 10, %struct._IO_FILE* %1)
  br label %for.end

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %max_elem_len.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %3 = load i32, i32* @COLS, align 4
  %4 = load i32, i32* %max_elem_len.addr, align 4
  %div = sdiv i32 %3, %4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %div, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %cols, align 4
  %5 = load i32, i32* %cols, align 4
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %cond.end
  store i32 1, i32* %cols, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %cond.end
  %6 = load i32, i32* %list_len.addr, align 4
  %tobool4 = icmp ne i32 %6, 0
  br i1 %tobool4, label %cond.true5, label %cond.false8

cond.true5:                                       ; preds = %if.end3
  %7 = load i32, i32* %list_len.addr, align 4
  %8 = load i32, i32* %cols, align 4
  %div6 = sdiv i32 %7, %8
  %9 = load i32, i32* %list_len.addr, align 4
  %10 = load i32, i32* %cols, align 4
  %rem = srem i32 %9, %10
  %cmp7 = icmp ne i32 %rem, 0
  %conv = zext i1 %cmp7 to i32
  %add = add nsw i32 %div6, %conv
  br label %cond.end9

cond.false8:                                      ; preds = %if.end3
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false8, %cond.true5
  %cond10 = phi i32 [ %add, %cond.true5 ], [ 1, %cond.false8 ]
  store i32 %cond10, i32* %rows, align 4
  %11 = load i32, i32* %list_len.addr, align 4
  %tobool11 = icmp ne i32 %11, 0
  br i1 %tobool11, label %cond.true12, label %cond.false18

cond.true12:                                      ; preds = %cond.end9
  %12 = load i32, i32* %list_len.addr, align 4
  %13 = load i32, i32* %rows, align 4
  %div13 = sdiv i32 %12, %13
  %14 = load i32, i32* %list_len.addr, align 4
  %15 = load i32, i32* %rows, align 4
  %rem14 = srem i32 %14, %15
  %cmp15 = icmp ne i32 %rem14, 0
  %conv16 = zext i1 %cmp15 to i32
  %add17 = add nsw i32 %div13, %conv16
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end9
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true12
  %cond20 = phi i32 [ %add17, %cond.true12 ], [ 1, %cond.false18 ]
  store i32 %cond20, i32* %cols, align 4
  %16 = load i32, i32* %rows, align 4
  %cmp21 = icmp eq i32 %16, 1
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %cond.end19
  %17 = load i32, i32* %cols, align 4
  store i32 %17, i32* %rows, align 4
  store i32 1, i32* %cols, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %cond.end19
  %18 = load i32, i32* %rows, align 4
  %cmp25 = icmp slt i32 %18, 10
  br i1 %cmp25, label %cond.true27, label %cond.false28

cond.true27:                                      ; preds = %if.end24
  br label %cond.end50

cond.false28:                                     ; preds = %if.end24
  %19 = load i32, i32* %rows, align 4
  %cmp29 = icmp slt i32 %19, 100
  br i1 %cmp29, label %cond.true31, label %cond.false32

cond.true31:                                      ; preds = %cond.false28
  br label %cond.end48

cond.false32:                                     ; preds = %cond.false28
  %20 = load i32, i32* %rows, align 4
  %cmp33 = icmp slt i32 %20, 1000
  br i1 %cmp33, label %cond.true35, label %cond.false36

cond.true35:                                      ; preds = %cond.false32
  br label %cond.end46

cond.false36:                                     ; preds = %cond.false32
  %21 = load i32, i32* %rows, align 4
  %cmp37 = icmp slt i32 %21, 10000
  br i1 %cmp37, label %cond.true39, label %cond.false40

cond.true39:                                      ; preds = %cond.false36
  br label %cond.end44

cond.false40:                                     ; preds = %cond.false36
  %22 = load i32, i32* %rows, align 4
  %cmp41 = icmp slt i32 %22, 100000
  %cond43 = select i1 %cmp41, i32 5, i32 6
  br label %cond.end44

cond.end44:                                       ; preds = %cond.false40, %cond.true39
  %cond45 = phi i32 [ 4, %cond.true39 ], [ %cond43, %cond.false40 ]
  br label %cond.end46

cond.end46:                                       ; preds = %cond.end44, %cond.true35
  %cond47 = phi i32 [ 3, %cond.true35 ], [ %cond45, %cond.end44 ]
  br label %cond.end48

cond.end48:                                       ; preds = %cond.end46, %cond.true31
  %cond49 = phi i32 [ 2, %cond.true31 ], [ %cond47, %cond.end46 ]
  br label %cond.end50

cond.end50:                                       ; preds = %cond.end48, %cond.true27
  %cond51 = phi i32 [ 1, %cond.true27 ], [ %cond49, %cond.end48 ]
  store i32 %cond51, i32* %first_column_indices_len, align 4
  %23 = load i32, i32* %indices_len.addr, align 4
  store i32 %23, i32* %other_indices_len, align 4
  store i32 0, i32* %row, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end50
  %24 = load i32, i32* %row, align 4
  %25 = load i32, i32* %rows, align 4
  %cmp52 = icmp slt i32 %24, %25
  br i1 %cmp52, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %row, align 4
  store i32 %26, i32* %ind, align 4
  store i32 0, i32* %pos, align 4
  br label %while.body

while.body:                                       ; preds = %for.body, %if.end68
  %27 = load i32, i32* %pos, align 4
  %cmp54 = icmp eq i32 %27, 0
  br i1 %cmp54, label %cond.true56, label %cond.false57

cond.true56:                                      ; preds = %while.body
  %28 = load i32, i32* %first_column_indices_len, align 4
  br label %cond.end58

cond.false57:                                     ; preds = %while.body
  %29 = load i32, i32* %other_indices_len, align 4
  br label %cond.end58

cond.end58:                                       ; preds = %cond.false57, %cond.true56
  %cond59 = phi i32 [ %28, %cond.true56 ], [ %29, %cond.false57 ]
  store i32 %cond59, i32* %indices_len.addr, align 4
  %30 = load i32, i32* %indices_len.addr, align 4
  %31 = load i32, i32* %ind, align 4
  %add60 = add nsw i32 %31, 1
  %32 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call61 = call i32 @print_index_and_element(i32 %30, i32 %add60, %struct.word_list* %32)
  store i32 %call61, i32* %elem_len, align 4
  %33 = load i32, i32* %indices_len.addr, align 4
  %add62 = add nsw i32 %33, 2
  %34 = load i32, i32* %elem_len, align 4
  %add63 = add nsw i32 %34, %add62
  store i32 %add63, i32* %elem_len, align 4
  %35 = load i32, i32* %rows, align 4
  %36 = load i32, i32* %ind, align 4
  %add64 = add nsw i32 %36, %35
  store i32 %add64, i32* %ind, align 4
  %37 = load i32, i32* %ind, align 4
  %38 = load i32, i32* %list_len.addr, align 4
  %cmp65 = icmp sge i32 %37, %38
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %cond.end58
  br label %while.end

if.end68:                                         ; preds = %cond.end58
  %39 = load i32, i32* %pos, align 4
  %40 = load i32, i32* %elem_len, align 4
  %add69 = add nsw i32 %39, %40
  %41 = load i32, i32* %pos, align 4
  %42 = load i32, i32* %max_elem_len.addr, align 4
  %add70 = add nsw i32 %41, %42
  call void @indent(i32 %add69, i32 %add70)
  %43 = load i32, i32* %max_elem_len.addr, align 4
  %44 = load i32, i32* %pos, align 4
  %add71 = add nsw i32 %44, %43
  store i32 %add71, i32* %pos, align 4
  br label %while.body

while.end:                                        ; preds = %if.then67
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call72 = call i32 @putc(i32 10, %struct._IO_FILE* %45)
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %46 = load i32, i32* %row, align 4
  %inc = add nsw i32 %46, 1
  store i32 %inc, i32* %row, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

declare i32 @read_builtin(%struct.word_list*) #1

declare i32 @putchar(i32) #1

declare i32 @legal_number(i8*, i64*) #1

declare i32 @mbstowcs(i32*, i8*, i32) #1

declare i32 @wcswidth(i32*, i32) #1

declare i32 @putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @print_index_and_element(i32 %len, i32 %ind, %struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %ind.addr = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %l = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %ind.addr, align 4
  store i32 %1, i32* %i, align 4
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %2, %struct.word_list** %l, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %3, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* %i, align 4
  %tobool1 = icmp ne i32 %dec, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %5, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 0
  %7 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %7, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %8 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp2 = icmp eq %struct.word_list* %8, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %10 = load i32, i32* %len.addr, align 4
  %11 = load i32, i32* %ind.addr, align 4
  %12 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word5, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.35, i32 0, i32 0), i32 %10, i32 %11, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8* %14)
  %15 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word6 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word6, align 4
  %word7 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word7, align 4
  %call8 = call i32 @displen(i8* %17)
  store i32 %call8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind
define internal void @indent(i32 %from, i32 %to) #0 {
entry:
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  store i32 %from, i32* %from.addr, align 4
  store i32 %to, i32* %to.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %from.addr, align 4
  %1 = load i32, i32* %to.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %to.addr, align 4
  %3 = load i32, i32* @tabsize, align 4
  %div = sdiv i32 %2, %3
  %4 = load i32, i32* %from.addr, align 4
  %5 = load i32, i32* @tabsize, align 4
  %div1 = sdiv i32 %4, %5
  %cmp2 = icmp sgt i32 %div, %div1
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @putc(i32 9, %struct._IO_FILE* %6)
  %7 = load i32, i32* @tabsize, align 4
  %8 = load i32, i32* %from.addr, align 4
  %9 = load i32, i32* @tabsize, align 4
  %rem = srem i32 %8, %9
  %sub = sub nsw i32 %7, %rem
  %10 = load i32, i32* %from.addr, align 4
  %add = add nsw i32 %10, %sub
  store i32 %add, i32* %from.addr, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call3 = call i32 @putc(i32 32, %struct._IO_FILE* %11)
  %12 = load i32, i32* %from.addr, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %from.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare void @print_case_command_head(%struct.case_com*) #1

declare void @xtrace_print_case_command_head(%struct.case_com*) #1

declare %struct.word_list* @expand_word_unsplit(%struct.word_desc*, i32) #1

declare i8* @string_list(%struct.word_list*) #1

declare %struct.word_list* @expand_word_leave_quoted(%struct.word_desc*, i32) #1

declare i8* @quote_string_for_globbing(i8*, i32) #1

declare i32 @strmatch(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_while_or_until(%struct.while_com* %while_command, i32 %type) #0 {
entry:
  %while_command.addr = alloca %struct.while_com*, align 4
  %type.addr = alloca i32, align 4
  %return_value = alloca i32, align 4
  %body_status = alloca i32, align 4
  store %struct.while_com* %while_command, %struct.while_com** %while_command.addr, align 4
  store i32 %type, i32* %type.addr, align 4
  store i32 0, i32* %body_status, align 4
  %0 = load i32, i32* @loop_level, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @loop_level, align 4
  %1 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %test = getelementptr inbounds %struct.while_com, %struct.while_com* %1, i32 0, i32 1
  %2 = load %struct.command*, %struct.command** %test, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 1
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 8
  store i32 %or, i32* %flags, align 4
  %4 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %flags1 = getelementptr inbounds %struct.while_com, %struct.while_com* %4, i32 0, i32 0
  %5 = load i32, i32* %flags1, align 4
  %and = and i32 %5, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %action = getelementptr inbounds %struct.while_com, %struct.while_com* %6, i32 0, i32 2
  %7 = load %struct.command*, %struct.command** %action, align 4
  %flags2 = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 1
  %8 = load i32, i32* %flags2, align 4
  %or3 = or i32 %8, 8
  store i32 %or3, i32* %flags2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %while.body

while.body:                                       ; preds = %if.end, %if.end60
  %9 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %test4 = getelementptr inbounds %struct.while_com, %struct.while_com* %9, i32 0, i32 1
  %10 = load %struct.command*, %struct.command** %test4, align 4
  %call = call i32 @execute_command(%struct.command* %10)
  store i32 %call, i32* %return_value, align 4
  br label %do.body

do.body:                                          ; preds = %while.body
  %11 = load i32, i32* @job_control, align 4
  %cmp = icmp eq i32 %11, 0
  br i1 %cmp, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.body
  %12 = load i32, i32* @interactive_shell, align 4
  %cmp5 = icmp eq i32 %12, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %lor.lhs.false, %do.body
  call void @reap_dead_jobs()
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %lor.lhs.false
  br label %do.end

do.end:                                           ; preds = %if.end7
  %13 = load i32, i32* %type.addr, align 4
  %cmp8 = icmp eq i32 %13, 0
  br i1 %cmp8, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %do.end
  %14 = load i32, i32* %return_value, align 4
  %cmp9 = icmp ne i32 %14, 0
  br i1 %cmp9, label %if.then10, label %if.end18

if.then10:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* @breaking, align 4
  %tobool11 = icmp ne i32 %15, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.then10
  %16 = load i32, i32* @breaking, align 4
  %dec = add nsw i32 %16, -1
  store i32 %dec, i32* @breaking, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.then10
  %17 = load i32, i32* @continuing, align 4
  %tobool14 = icmp ne i32 %17, 0
  br i1 %tobool14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end13
  %18 = load i32, i32* @continuing, align 4
  %dec16 = add nsw i32 %18, -1
  store i32 %dec16, i32* @continuing, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end13
  br label %while.end

if.end18:                                         ; preds = %land.lhs.true, %do.end
  %19 = load i32, i32* %type.addr, align 4
  %cmp19 = icmp eq i32 %19, 1
  br i1 %cmp19, label %land.lhs.true20, label %if.end31

land.lhs.true20:                                  ; preds = %if.end18
  %20 = load i32, i32* %return_value, align 4
  %cmp21 = icmp eq i32 %20, 0
  br i1 %cmp21, label %if.then22, label %if.end31

if.then22:                                        ; preds = %land.lhs.true20
  %21 = load i32, i32* @breaking, align 4
  %tobool23 = icmp ne i32 %21, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.then22
  %22 = load i32, i32* @breaking, align 4
  %dec25 = add nsw i32 %22, -1
  store i32 %dec25, i32* @breaking, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.then22
  %23 = load i32, i32* @continuing, align 4
  %tobool27 = icmp ne i32 %23, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end26
  %24 = load i32, i32* @continuing, align 4
  %dec29 = add nsw i32 %24, -1
  store i32 %dec29, i32* @continuing, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end26
  br label %while.end

if.end31:                                         ; preds = %land.lhs.true20, %if.end18
  br label %do.body32

do.body32:                                        ; preds = %if.end31
  %25 = load volatile i32, i32* @terminating_signal, align 4
  %tobool33 = icmp ne i32 %25, 0
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %do.body32
  %26 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %26)
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %do.body32
  %27 = load volatile i32, i32* @interrupt_state, align 4
  %tobool36 = icmp ne i32 %27, 0
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end35
  call void @throw_to_top_level()
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end35
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  %28 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %action40 = getelementptr inbounds %struct.while_com, %struct.while_com* %28, i32 0, i32 2
  %29 = load %struct.command*, %struct.command** %action40, align 4
  %call41 = call i32 @execute_command(%struct.command* %29)
  store i32 %call41, i32* %body_status, align 4
  br label %do.body42

do.body42:                                        ; preds = %do.end39
  %30 = load volatile i32, i32* @terminating_signal, align 4
  %tobool43 = icmp ne i32 %30, 0
  br i1 %tobool43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %do.body42
  %31 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %31)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %do.body42
  %32 = load volatile i32, i32* @interrupt_state, align 4
  %tobool46 = icmp ne i32 %32, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end45
  call void @throw_to_top_level()
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %if.end45
  br label %do.end49

do.end49:                                         ; preds = %if.end48
  %33 = load i32, i32* @breaking, align 4
  %tobool50 = icmp ne i32 %33, 0
  br i1 %tobool50, label %if.then51, label %if.end53

if.then51:                                        ; preds = %do.end49
  %34 = load i32, i32* @breaking, align 4
  %dec52 = add nsw i32 %34, -1
  store i32 %dec52, i32* @breaking, align 4
  br label %while.end

if.end53:                                         ; preds = %do.end49
  %35 = load i32, i32* @continuing, align 4
  %tobool54 = icmp ne i32 %35, 0
  br i1 %tobool54, label %if.then55, label %if.end60

if.then55:                                        ; preds = %if.end53
  %36 = load i32, i32* @continuing, align 4
  %dec56 = add nsw i32 %36, -1
  store i32 %dec56, i32* @continuing, align 4
  %37 = load i32, i32* @continuing, align 4
  %tobool57 = icmp ne i32 %37, 0
  br i1 %tobool57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.then55
  br label %while.end

if.end59:                                         ; preds = %if.then55
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %if.end53
  br label %while.body

while.end:                                        ; preds = %if.then58, %if.then51, %if.end30, %if.end17
  %38 = load i32, i32* @loop_level, align 4
  %dec61 = add nsw i32 %38, -1
  store i32 %dec61, i32* @loop_level, align 4
  %39 = load i32, i32* %body_status, align 4
  ret i32 %39
}

declare void @print_cond_command(%struct.cond_com*) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_cond_node(%struct.cond_com* %cond) #0 {
entry:
  %cond.addr = alloca %struct.cond_com*, align 4
  %result = alloca i32, align 4
  %invert = alloca i32, align 4
  %patmatch = alloca i32, align 4
  %rmatch = alloca i32, align 4
  %mflags = alloca i32, align 4
  %ignore = alloca i32, align 4
  %arg1 = alloca i8*, align 4
  %arg2 = alloca i8*, align 4
  %oe = alloca i32, align 4
  store %struct.cond_com* %cond, %struct.cond_com** %cond.addr, align 4
  %0 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %flags = getelementptr inbounds %struct.cond_com, %struct.cond_com* %0, i32 0, i32 0
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 4
  store i32 %and, i32* %invert, align 4
  %2 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %flags1 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %2, i32 0, i32 0
  %3 = load i32, i32* %flags1, align 4
  %and2 = and i32 %3, 8
  store i32 %and2, i32* %ignore, align 4
  %4 = load i32, i32* %ignore, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end13

if.then:                                          ; preds = %entry
  %5 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left = getelementptr inbounds %struct.cond_com, %struct.cond_com* %5, i32 0, i32 4
  %6 = load %struct.cond_com*, %struct.cond_com** %left, align 4
  %tobool3 = icmp ne %struct.cond_com* %6, null
  br i1 %tobool3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %7 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left5 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %7, i32 0, i32 4
  %8 = load %struct.cond_com*, %struct.cond_com** %left5, align 4
  %flags6 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %8, i32 0, i32 0
  %9 = load i32, i32* %flags6, align 4
  %or = or i32 %9, 8
  store i32 %or, i32* %flags6, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %10 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right = getelementptr inbounds %struct.cond_com, %struct.cond_com* %10, i32 0, i32 5
  %11 = load %struct.cond_com*, %struct.cond_com** %right, align 4
  %tobool7 = icmp ne %struct.cond_com* %11, null
  br i1 %tobool7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  %12 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right9 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %12, i32 0, i32 5
  %13 = load %struct.cond_com*, %struct.cond_com** %right9, align 4
  %flags10 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %13, i32 0, i32 0
  %14 = load i32, i32* %flags10, align 4
  %or11 = or i32 %14, 8
  store i32 %or11, i32* %flags10, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then8, %if.end
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %entry
  %15 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type = getelementptr inbounds %struct.cond_com, %struct.cond_com* %15, i32 0, i32 2
  %16 = load i32, i32* %type, align 4
  %cmp = icmp eq i32 %16, 6
  br i1 %cmp, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.end13
  %17 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left15 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %17, i32 0, i32 4
  %18 = load %struct.cond_com*, %struct.cond_com** %left15, align 4
  %call = call i32 @execute_cond_node(%struct.cond_com* %18)
  store i32 %call, i32* %result, align 4
  br label %if.end191

if.else:                                          ; preds = %if.end13
  %19 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type16 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %19, i32 0, i32 2
  %20 = load i32, i32* %type16, align 4
  %cmp17 = icmp eq i32 %20, 2
  br i1 %cmp17, label %if.then18, label %if.else26

if.then18:                                        ; preds = %if.else
  %21 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left19 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %21, i32 0, i32 4
  %22 = load %struct.cond_com*, %struct.cond_com** %left19, align 4
  %call20 = call i32 @execute_cond_node(%struct.cond_com* %22)
  store i32 %call20, i32* %result, align 4
  %23 = load i32, i32* %result, align 4
  %cmp21 = icmp ne i32 %23, 0
  br i1 %cmp21, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.then18
  %24 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right23 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %24, i32 0, i32 5
  %25 = load %struct.cond_com*, %struct.cond_com** %right23, align 4
  %call24 = call i32 @execute_cond_node(%struct.cond_com* %25)
  store i32 %call24, i32* %result, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.then18
  br label %if.end190

if.else26:                                        ; preds = %if.else
  %26 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type27 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %26, i32 0, i32 2
  %27 = load i32, i32* %type27, align 4
  %cmp28 = icmp eq i32 %27, 1
  br i1 %cmp28, label %if.then29, label %if.else37

if.then29:                                        ; preds = %if.else26
  %28 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left30 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %28, i32 0, i32 4
  %29 = load %struct.cond_com*, %struct.cond_com** %left30, align 4
  %call31 = call i32 @execute_cond_node(%struct.cond_com* %29)
  store i32 %call31, i32* %result, align 4
  %30 = load i32, i32* %result, align 4
  %cmp32 = icmp eq i32 %30, 0
  br i1 %cmp32, label %if.then33, label %if.end36

if.then33:                                        ; preds = %if.then29
  %31 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right34 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %31, i32 0, i32 5
  %32 = load %struct.cond_com*, %struct.cond_com** %right34, align 4
  %call35 = call i32 @execute_cond_node(%struct.cond_com* %32)
  store i32 %call35, i32* %result, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then33, %if.then29
  br label %if.end189

if.else37:                                        ; preds = %if.else26
  %33 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type38 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %33, i32 0, i32 2
  %34 = load i32, i32* %type38, align 4
  %cmp39 = icmp eq i32 %34, 3
  br i1 %cmp39, label %if.then40, label %if.else64

if.then40:                                        ; preds = %if.else37
  %35 = load i32, i32* %ignore, align 4
  %tobool41 = icmp ne i32 %35, 0
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.then40
  %36 = load i32, i32* @comsub_ignore_return, align 4
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* @comsub_ignore_return, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %if.then40
  %37 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left44 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %37, i32 0, i32 4
  %38 = load %struct.cond_com*, %struct.cond_com** %left44, align 4
  %op = getelementptr inbounds %struct.cond_com, %struct.cond_com* %38, i32 0, i32 3
  %39 = load %struct.word_desc*, %struct.word_desc** %op, align 4
  %call45 = call i8* @cond_expand_word(%struct.word_desc* %39, i32 0)
  store i8* %call45, i8** %arg1, align 4
  %40 = load i32, i32* %ignore, align 4
  %tobool46 = icmp ne i32 %40, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end43
  %41 = load i32, i32* @comsub_ignore_return, align 4
  %dec = add nsw i32 %41, -1
  store i32 %dec, i32* @comsub_ignore_return, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %if.end43
  %42 = load i8*, i8** %arg1, align 4
  %cmp49 = icmp eq i8* %42, null
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end48
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8** %arg1, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %if.end48
  %43 = load i32, i32* @echo_command_at_execute, align 4
  %tobool52 = icmp ne i32 %43, 0
  br i1 %tobool52, label %if.then53, label %if.end56

if.then53:                                        ; preds = %if.end51
  %44 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type54 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %44, i32 0, i32 2
  %45 = load i32, i32* %type54, align 4
  %46 = load i32, i32* %invert, align 4
  %47 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op55 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %47, i32 0, i32 3
  %48 = load %struct.word_desc*, %struct.word_desc** %op55, align 4
  %49 = load i8*, i8** %arg1, align 4
  call void @xtrace_print_cond_term(i32 %45, i32 %46, %struct.word_desc* %48, i8* %49, i8* null)
  br label %if.end56

if.end56:                                         ; preds = %if.then53, %if.end51
  %50 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op57 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %50, i32 0, i32 3
  %51 = load %struct.word_desc*, %struct.word_desc** %op57, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %51, i32 0, i32 0
  %52 = load i8*, i8** %word, align 4
  %53 = load i8*, i8** %arg1, align 4
  %call58 = call i32 @unary_test(i8* %52, i8* %53)
  %tobool59 = icmp ne i32 %call58, 0
  %cond60 = select i1 %tobool59, i32 0, i32 1
  store i32 %cond60, i32* %result, align 4
  %54 = load i8*, i8** %arg1, align 4
  %cmp61 = icmp ne i8* %54, getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0)
  br i1 %cmp61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.end56
  %55 = load i8*, i8** %arg1, align 4
  call void @sh_xfree(i8* %55, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3697)
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %if.end56
  br label %if.end188

if.else64:                                        ; preds = %if.else37
  %56 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type65 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %56, i32 0, i32 2
  %57 = load i32, i32* %type65, align 4
  %cmp66 = icmp eq i32 %57, 4
  br i1 %cmp66, label %if.then67, label %if.else185

if.then67:                                        ; preds = %if.else64
  store i32 0, i32* %rmatch, align 4
  %58 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op68 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %58, i32 0, i32 3
  %59 = load %struct.word_desc*, %struct.word_desc** %op68, align 4
  %word69 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %59, i32 0, i32 0
  %60 = load i8*, i8** %word69, align 4
  %arrayidx = getelementptr inbounds i8, i8* %60, i32 1
  %61 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %61 to i32
  %cmp70 = icmp eq i32 %conv, 61
  br i1 %cmp70, label %land.lhs.true, label %lor.rhs

land.lhs.true:                                    ; preds = %if.then67
  %62 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op72 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %62, i32 0, i32 3
  %63 = load %struct.word_desc*, %struct.word_desc** %op72, align 4
  %word73 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %63, i32 0, i32 0
  %64 = load i8*, i8** %word73, align 4
  %arrayidx74 = getelementptr inbounds i8, i8* %64, i32 2
  %65 = load i8, i8* %arrayidx74, align 1
  %conv75 = sext i8 %65 to i32
  %cmp76 = icmp eq i32 %conv75, 0
  br i1 %cmp76, label %land.lhs.true78, label %lor.rhs

land.lhs.true78:                                  ; preds = %land.lhs.true
  %66 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op79 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %66, i32 0, i32 3
  %67 = load %struct.word_desc*, %struct.word_desc** %op79, align 4
  %word80 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %67, i32 0, i32 0
  %68 = load i8*, i8** %word80, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %68, i32 0
  %69 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %69 to i32
  %cmp83 = icmp eq i32 %conv82, 33
  br i1 %cmp83, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true78
  %70 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op85 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %70, i32 0, i32 3
  %71 = load %struct.word_desc*, %struct.word_desc** %op85, align 4
  %word86 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %71, i32 0, i32 0
  %72 = load i8*, i8** %word86, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %72, i32 0
  %73 = load i8, i8* %arrayidx87, align 1
  %conv88 = sext i8 %73 to i32
  %cmp89 = icmp eq i32 %conv88, 61
  br i1 %cmp89, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false, %land.lhs.true, %if.then67
  %74 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op91 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %74, i32 0, i32 3
  %75 = load %struct.word_desc*, %struct.word_desc** %op91, align 4
  %word92 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %75, i32 0, i32 0
  %76 = load i8*, i8** %word92, align 4
  %arrayidx93 = getelementptr inbounds i8, i8* %76, i32 0
  %77 = load i8, i8* %arrayidx93, align 1
  %conv94 = sext i8 %77 to i32
  %cmp95 = icmp eq i32 %conv94, 61
  br i1 %cmp95, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %78 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op97 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %78, i32 0, i32 3
  %79 = load %struct.word_desc*, %struct.word_desc** %op97, align 4
  %word98 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %79, i32 0, i32 0
  %80 = load i8*, i8** %word98, align 4
  %arrayidx99 = getelementptr inbounds i8, i8* %80, i32 1
  %81 = load i8, i8* %arrayidx99, align 1
  %conv100 = sext i8 %81 to i32
  %cmp101 = icmp eq i32 %conv100, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %82 = phi i1 [ false, %lor.rhs ], [ %cmp101, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %lor.lhs.false, %land.lhs.true78
  %83 = phi i1 [ true, %lor.lhs.false ], [ true, %land.lhs.true78 ], [ %82, %land.end ]
  %lor.ext = zext i1 %83 to i32
  store i32 %lor.ext, i32* %patmatch, align 4
  %84 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op103 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %84, i32 0, i32 3
  %85 = load %struct.word_desc*, %struct.word_desc** %op103, align 4
  %word104 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %85, i32 0, i32 0
  %86 = load i8*, i8** %word104, align 4
  %arrayidx105 = getelementptr inbounds i8, i8* %86, i32 0
  %87 = load i8, i8* %arrayidx105, align 1
  %conv106 = sext i8 %87 to i32
  %cmp107 = icmp eq i32 %conv106, 61
  br i1 %cmp107, label %land.lhs.true109, label %land.end123

land.lhs.true109:                                 ; preds = %lor.end
  %88 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op110 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %88, i32 0, i32 3
  %89 = load %struct.word_desc*, %struct.word_desc** %op110, align 4
  %word111 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %89, i32 0, i32 0
  %90 = load i8*, i8** %word111, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %90, i32 1
  %91 = load i8, i8* %arrayidx112, align 1
  %conv113 = sext i8 %91 to i32
  %cmp114 = icmp eq i32 %conv113, 126
  br i1 %cmp114, label %land.rhs116, label %land.end123

land.rhs116:                                      ; preds = %land.lhs.true109
  %92 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op117 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %92, i32 0, i32 3
  %93 = load %struct.word_desc*, %struct.word_desc** %op117, align 4
  %word118 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %93, i32 0, i32 0
  %94 = load i8*, i8** %word118, align 4
  %arrayidx119 = getelementptr inbounds i8, i8* %94, i32 2
  %95 = load i8, i8* %arrayidx119, align 1
  %conv120 = sext i8 %95 to i32
  %cmp121 = icmp eq i32 %conv120, 0
  br label %land.end123

land.end123:                                      ; preds = %land.rhs116, %land.lhs.true109, %lor.end
  %96 = phi i1 [ false, %land.lhs.true109 ], [ false, %lor.end ], [ %cmp121, %land.rhs116 ]
  %land.ext = zext i1 %96 to i32
  store i32 %land.ext, i32* %rmatch, align 4
  %97 = load i32, i32* %ignore, align 4
  %tobool124 = icmp ne i32 %97, 0
  br i1 %tobool124, label %if.then125, label %if.end127

if.then125:                                       ; preds = %land.end123
  %98 = load i32, i32* @comsub_ignore_return, align 4
  %inc126 = add nsw i32 %98, 1
  store i32 %inc126, i32* @comsub_ignore_return, align 4
  br label %if.end127

if.end127:                                        ; preds = %if.then125, %land.end123
  %99 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left128 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %99, i32 0, i32 4
  %100 = load %struct.cond_com*, %struct.cond_com** %left128, align 4
  %op129 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %100, i32 0, i32 3
  %101 = load %struct.word_desc*, %struct.word_desc** %op129, align 4
  %call130 = call i8* @cond_expand_word(%struct.word_desc* %101, i32 0)
  store i8* %call130, i8** %arg1, align 4
  %102 = load i32, i32* %ignore, align 4
  %tobool131 = icmp ne i32 %102, 0
  br i1 %tobool131, label %if.then132, label %if.end134

if.then132:                                       ; preds = %if.end127
  %103 = load i32, i32* @comsub_ignore_return, align 4
  %dec133 = add nsw i32 %103, -1
  store i32 %dec133, i32* @comsub_ignore_return, align 4
  br label %if.end134

if.end134:                                        ; preds = %if.then132, %if.end127
  %104 = load i8*, i8** %arg1, align 4
  %cmp135 = icmp eq i8* %104, null
  br i1 %cmp135, label %if.then137, label %if.end138

if.then137:                                       ; preds = %if.end134
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8** %arg1, align 4
  br label %if.end138

if.end138:                                        ; preds = %if.then137, %if.end134
  %105 = load i32, i32* %ignore, align 4
  %tobool139 = icmp ne i32 %105, 0
  br i1 %tobool139, label %if.then140, label %if.end142

if.then140:                                       ; preds = %if.end138
  %106 = load i32, i32* @comsub_ignore_return, align 4
  %inc141 = add nsw i32 %106, 1
  store i32 %inc141, i32* @comsub_ignore_return, align 4
  br label %if.end142

if.end142:                                        ; preds = %if.then140, %if.end138
  %107 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right143 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %107, i32 0, i32 5
  %108 = load %struct.cond_com*, %struct.cond_com** %right143, align 4
  %op144 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %108, i32 0, i32 3
  %109 = load %struct.word_desc*, %struct.word_desc** %op144, align 4
  %110 = load i32, i32* %rmatch, align 4
  %tobool145 = icmp ne i32 %110, 0
  br i1 %tobool145, label %land.lhs.true146, label %cond.false

land.lhs.true146:                                 ; preds = %if.end142
  %111 = load i32, i32* @shell_compatibility_level, align 4
  %cmp147 = icmp sgt i32 %111, 31
  br i1 %cmp147, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true146
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true146, %if.end142
  %112 = load i32, i32* %patmatch, align 4
  %tobool149 = icmp ne i32 %112, 0
  %cond150 = select i1 %tobool149, i32 1, i32 0
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond151 = phi i32 [ 2, %cond.true ], [ %cond150, %cond.false ]
  %call152 = call i8* @cond_expand_word(%struct.word_desc* %109, i32 %cond151)
  store i8* %call152, i8** %arg2, align 4
  %113 = load i32, i32* %ignore, align 4
  %tobool153 = icmp ne i32 %113, 0
  br i1 %tobool153, label %if.then154, label %if.end156

if.then154:                                       ; preds = %cond.end
  %114 = load i32, i32* @comsub_ignore_return, align 4
  %dec155 = add nsw i32 %114, -1
  store i32 %dec155, i32* @comsub_ignore_return, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %cond.end
  %115 = load i8*, i8** %arg2, align 4
  %cmp157 = icmp eq i8* %115, null
  br i1 %cmp157, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end156
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8** %arg2, align 4
  br label %if.end160

if.end160:                                        ; preds = %if.then159, %if.end156
  %116 = load i32, i32* @echo_command_at_execute, align 4
  %tobool161 = icmp ne i32 %116, 0
  br i1 %tobool161, label %if.then162, label %if.end165

if.then162:                                       ; preds = %if.end160
  %117 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type163 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %117, i32 0, i32 2
  %118 = load i32, i32* %type163, align 4
  %119 = load i32, i32* %invert, align 4
  %120 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op164 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %120, i32 0, i32 3
  %121 = load %struct.word_desc*, %struct.word_desc** %op164, align 4
  %122 = load i8*, i8** %arg1, align 4
  %123 = load i8*, i8** %arg2, align 4
  call void @xtrace_print_cond_term(i32 %118, i32 %119, %struct.word_desc* %121, i8* %122, i8* %123)
  br label %if.end165

if.end165:                                        ; preds = %if.then162, %if.end160
  %124 = load i32, i32* %rmatch, align 4
  %tobool166 = icmp ne i32 %124, 0
  br i1 %tobool166, label %if.then167, label %if.else170

if.then167:                                       ; preds = %if.end165
  store i32 2, i32* %mflags, align 4
  %125 = load i32, i32* %mflags, align 4
  %or168 = or i32 %125, 1
  store i32 %or168, i32* %mflags, align 4
  %126 = load i8*, i8** %arg1, align 4
  %127 = load i8*, i8** %arg2, align 4
  %128 = load i32, i32* %mflags, align 4
  %call169 = call i32 @sh_regmatch(i8* %126, i8* %127, i32 %128)
  store i32 %call169, i32* %result, align 4
  br label %if.end176

if.else170:                                       ; preds = %if.end165
  %129 = load i32, i32* @extended_glob, align 4
  store i32 %129, i32* %oe, align 4
  store i32 1, i32* @extended_glob, align 4
  %130 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op171 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %130, i32 0, i32 3
  %131 = load %struct.word_desc*, %struct.word_desc** %op171, align 4
  %word172 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %131, i32 0, i32 0
  %132 = load i8*, i8** %word172, align 4
  %133 = load i8*, i8** %arg1, align 4
  %134 = load i8*, i8** %arg2, align 4
  %call173 = call i32 @binary_test(i8* %132, i8* %133, i8* %134, i32 7)
  %tobool174 = icmp ne i32 %call173, 0
  %cond175 = select i1 %tobool174, i32 0, i32 1
  store i32 %cond175, i32* %result, align 4
  %135 = load i32, i32* %oe, align 4
  store i32 %135, i32* @extended_glob, align 4
  br label %if.end176

if.end176:                                        ; preds = %if.else170, %if.then167
  %136 = load i8*, i8** %arg1, align 4
  %cmp177 = icmp ne i8* %136, getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0)
  br i1 %cmp177, label %if.then179, label %if.end180

if.then179:                                       ; preds = %if.end176
  %137 = load i8*, i8** %arg1, align 4
  call void @sh_xfree(i8* %137, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3759)
  br label %if.end180

if.end180:                                        ; preds = %if.then179, %if.end176
  %138 = load i8*, i8** %arg2, align 4
  %cmp181 = icmp ne i8* %138, getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0)
  br i1 %cmp181, label %if.then183, label %if.end184

if.then183:                                       ; preds = %if.end180
  %139 = load i8*, i8** %arg2, align 4
  call void @sh_xfree(i8* %139, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 3761)
  br label %if.end184

if.end184:                                        ; preds = %if.then183, %if.end180
  br label %if.end187

if.else185:                                       ; preds = %if.else64
  %140 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type186 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %140, i32 0, i32 2
  %141 = load i32, i32* %type186, align 4
  call void @command_error(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.39, i32 0, i32 0), i32 1, i32 %141, i32 0)
  call void @jump_to_top_level(i32 2) #5
  unreachable

if.end187:                                        ; preds = %if.end184
  br label %if.end188

if.end188:                                        ; preds = %if.end187, %if.end63
  br label %if.end189

if.end189:                                        ; preds = %if.end188, %if.end36
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %if.end25
  br label %if.end191

if.end191:                                        ; preds = %if.end190, %if.then14
  %142 = load i32, i32* %invert, align 4
  %tobool192 = icmp ne i32 %142, 0
  br i1 %tobool192, label %if.then193, label %if.end197

if.then193:                                       ; preds = %if.end191
  %143 = load i32, i32* %result, align 4
  %cmp194 = icmp eq i32 %143, 0
  %cond196 = select i1 %cmp194, i32 1, i32 0
  store i32 %cond196, i32* %result, align 4
  br label %if.end197

if.end197:                                        ; preds = %if.then193, %if.end191
  %144 = load i32, i32* %result, align 4
  ret i32 %144
}

declare i8* @cond_expand_word(%struct.word_desc*, i32) #1

declare void @xtrace_print_cond_term(i32, i32, %struct.word_desc*, i8*, i8*) #1

declare i32 @unary_test(i8*, i8*) #1

declare i32 @sh_regmatch(i8*, i8*, i32) #1

declare i32 @binary_test(i8*, i8*, i8*, i32) #1

declare void @print_simple_command(%struct.simple_com*) #1

declare void @maybe_make_export_env() #1

; Function Attrs: noinline nounwind
define internal void @bind_lastarg(i8* %arg) #0 {
entry:
  %arg.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %arg.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.11, i32 0, i32 0), i8** %arg.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %arg.addr, align 4
  %call = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.43, i32 0, i32 0), i8* %1, i32 0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and = and i32 %4, -2
  store i32 %and, i32* %attributes, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define internal void @fix_assignment_words(%struct.word_list* %words) #0 {
entry:
  %words.addr = alloca %struct.word_list*, align 4
  %w = alloca %struct.word_list*, align 4
  %wcmd = alloca %struct.word_list*, align 4
  %b = alloca %struct.builtin*, align 4
  %assoc = alloca i32, align 4
  %global = alloca i32, align 4
  %array = alloca i32, align 4
  %integer = alloca i32, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end171

if.end:                                           ; preds = %entry
  store %struct.builtin* null, %struct.builtin** %b, align 4
  store i32 0, i32* %integer, align 4
  store i32 0, i32* %array, align 4
  store i32 0, i32* %global, align 4
  store i32 0, i32* %assoc, align 4
  %1 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  store %struct.word_list* %1, %struct.word_list** %wcmd, align 4
  %2 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  store %struct.word_list* %2, %struct.word_list** %wcmd, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %tobool = icmp ne %struct.word_list* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 1
  %6 = load i32, i32* %flags, align 4
  %and = and i32 %6, 4
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.body
  br label %for.end

if.end3:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end3
  %7 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 0
  %8 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %8, %struct.word_list** %wcmd, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then2, %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end
  %9 = load i32, i32* @posixly_correct, align 4
  %tobool4 = icmp ne i32 %9, 0
  br i1 %tobool4, label %land.lhs.true, label %land.end23

land.lhs.true:                                    ; preds = %while.cond
  %10 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %tobool5 = icmp ne %struct.word_list* %10, null
  br i1 %tobool5, label %land.lhs.true6, label %land.end23

land.lhs.true6:                                   ; preds = %land.lhs.true
  %11 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word7 = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word7, align 4
  %tobool8 = icmp ne %struct.word_desc* %12, null
  br i1 %tobool8, label %land.lhs.true9, label %land.end23

land.lhs.true9:                                   ; preds = %land.lhs.true6
  %13 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word10 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 1
  %14 = load %struct.word_desc*, %struct.word_desc** %word10, align 4
  %word11 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %14, i32 0, i32 0
  %15 = load i8*, i8** %word11, align 4
  %tobool12 = icmp ne i8* %15, null
  br i1 %tobool12, label %land.rhs, label %land.end23

land.rhs:                                         ; preds = %land.lhs.true9
  %16 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 1
  %17 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word14, align 4
  %arrayidx = getelementptr inbounds i8, i8* %18, i32 0
  %19 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %19 to i32
  %20 = load i8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.44, i32 0, i32 0), align 1
  %conv15 = sext i8 %20 to i32
  %cmp16 = icmp eq i32 %conv, %conv15
  br i1 %cmp16, label %land.rhs18, label %land.end

land.rhs18:                                       ; preds = %land.rhs
  %21 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word19 = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word19, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word20, align 4
  %call = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.44, i32 0, i32 0))
  %cmp21 = icmp eq i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs18, %land.rhs
  %24 = phi i1 [ false, %land.rhs ], [ %cmp21, %land.rhs18 ]
  br label %land.end23

land.end23:                                       ; preds = %land.end, %land.lhs.true9, %land.lhs.true6, %land.lhs.true, %while.cond
  %25 = phi i1 [ false, %land.lhs.true9 ], [ false, %land.lhs.true6 ], [ false, %land.lhs.true ], [ false, %while.cond ], [ %24, %land.end ]
  br i1 %25, label %while.body, label %while.end

while.body:                                       ; preds = %land.end23
  %26 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %next24 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 0
  %27 = load %struct.word_list*, %struct.word_list** %next24, align 4
  store %struct.word_list* %27, %struct.word_list** %wcmd, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end23
  %28 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  store %struct.word_list* %28, %struct.word_list** %w, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc169, %while.end
  %29 = load %struct.word_list*, %struct.word_list** %w, align 4
  %tobool26 = icmp ne %struct.word_list* %29, null
  br i1 %tobool26, label %for.body27, label %for.end171

for.body27:                                       ; preds = %for.cond25
  %30 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word28 = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 1
  %31 = load %struct.word_desc*, %struct.word_desc** %word28, align 4
  %flags29 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 1
  %32 = load i32, i32* %flags29, align 4
  %and30 = and i32 %32, 4
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %if.then32, label %if.else89

if.then32:                                        ; preds = %for.body27
  %33 = load %struct.builtin*, %struct.builtin** %b, align 4
  %cmp33 = icmp eq %struct.builtin* %33, null
  br i1 %cmp33, label %if.then35, label %if.end56

if.then35:                                        ; preds = %if.then32
  %34 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word36 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word36, align 4
  %word37 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %35, i32 0, i32 0
  %36 = load i8*, i8** %word37, align 4
  %call38 = call %struct.builtin* @builtin_address_internal(i8* %36, i32 0)
  store %struct.builtin* %call38, %struct.builtin** %b, align 4
  %37 = load %struct.builtin*, %struct.builtin** %b, align 4
  %cmp39 = icmp eq %struct.builtin* %37, null
  br i1 %cmp39, label %if.then45, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then35
  %38 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags41 = getelementptr inbounds %struct.builtin, %struct.builtin* %38, i32 0, i32 2
  %39 = load i32, i32* %flags41, align 4
  %and42 = and i32 %39, 16
  %cmp43 = icmp eq i32 %and42, 0
  br i1 %cmp43, label %if.then45, label %if.else

if.then45:                                        ; preds = %lor.lhs.false, %if.then35
  br label %for.end171

if.else:                                          ; preds = %lor.lhs.false
  %40 = load %struct.builtin*, %struct.builtin** %b, align 4
  %tobool46 = icmp ne %struct.builtin* %40, null
  br i1 %tobool46, label %land.lhs.true47, label %if.end54

land.lhs.true47:                                  ; preds = %if.else
  %41 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags48 = getelementptr inbounds %struct.builtin, %struct.builtin* %41, i32 0, i32 2
  %42 = load i32, i32* %flags48, align 4
  %and49 = and i32 %42, 16
  %tobool50 = icmp ne i32 %and49, 0
  br i1 %tobool50, label %if.then51, label %if.end54

if.then51:                                        ; preds = %land.lhs.true47
  %43 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word52 = getelementptr inbounds %struct.word_list, %struct.word_list* %43, i32 0, i32 1
  %44 = load %struct.word_desc*, %struct.word_desc** %word52, align 4
  %flags53 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %44, i32 0, i32 1
  %45 = load i32, i32* %flags53, align 4
  %or = or i32 %45, 65536
  store i32 %or, i32* %flags53, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then51, %land.lhs.true47, %if.else
  br label %if.end55

if.end55:                                         ; preds = %if.end54
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then32
  %46 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word57 = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 1
  %47 = load %struct.word_desc*, %struct.word_desc** %word57, align 4
  %flags58 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %47, i32 0, i32 1
  %48 = load i32, i32* %flags58, align 4
  %or59 = or i32 %48, 131248
  store i32 %or59, i32* %flags58, align 4
  %49 = load i32, i32* %assoc, align 4
  %tobool60 = icmp ne i32 %49, 0
  br i1 %tobool60, label %if.then61, label %if.end65

if.then61:                                        ; preds = %if.end56
  %50 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word62 = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 1
  %51 = load %struct.word_desc*, %struct.word_desc** %word62, align 4
  %flags63 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %51, i32 0, i32 1
  %52 = load i32, i32* %flags63, align 4
  %or64 = or i32 %52, 4194304
  store i32 %or64, i32* %flags63, align 4
  br label %if.end65

if.end65:                                         ; preds = %if.then61, %if.end56
  %53 = load i32, i32* %array, align 4
  %tobool66 = icmp ne i32 %53, 0
  br i1 %tobool66, label %if.then67, label %if.end71

if.then67:                                        ; preds = %if.end65
  %54 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word68 = getelementptr inbounds %struct.word_list, %struct.word_list* %54, i32 0, i32 1
  %55 = load %struct.word_desc*, %struct.word_desc** %word68, align 4
  %flags69 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %55, i32 0, i32 1
  %56 = load i32, i32* %flags69, align 4
  %or70 = or i32 %56, 8388608
  store i32 %or70, i32* %flags69, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then67, %if.end65
  %57 = load i32, i32* %global, align 4
  %tobool72 = icmp ne i32 %57, 0
  br i1 %tobool72, label %if.then73, label %if.end77

if.then73:                                        ; preds = %if.end71
  %58 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word74 = getelementptr inbounds %struct.word_list, %struct.word_list* %58, i32 0, i32 1
  %59 = load %struct.word_desc*, %struct.word_desc** %word74, align 4
  %flags75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %59, i32 0, i32 1
  %60 = load i32, i32* %flags75, align 4
  %or76 = or i32 %60, 33554432
  store i32 %or76, i32* %flags75, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.then73, %if.end71
  %61 = load %struct.builtin*, %struct.builtin** %b, align 4
  %tobool78 = icmp ne %struct.builtin* %61, null
  br i1 %tobool78, label %land.lhs.true79, label %if.end88

land.lhs.true79:                                  ; preds = %if.end77
  %62 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags80 = getelementptr inbounds %struct.builtin, %struct.builtin* %62, i32 0, i32 2
  %63 = load i32, i32* %flags80, align 4
  %and81 = and i32 %63, 80
  %cmp82 = icmp eq i32 %and81, 16
  br i1 %cmp82, label %if.then84, label %if.end88

if.then84:                                        ; preds = %land.lhs.true79
  %64 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word85 = getelementptr inbounds %struct.word_list, %struct.word_list* %64, i32 0, i32 1
  %65 = load %struct.word_desc*, %struct.word_desc** %word85, align 4
  %flags86 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %65, i32 0, i32 1
  %66 = load i32, i32* %flags86, align 4
  %or87 = or i32 %66, 33554432
  store i32 %or87, i32* %flags86, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.then84, %land.lhs.true79, %if.end77
  br label %if.end168

if.else89:                                        ; preds = %for.body27
  %67 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word90 = getelementptr inbounds %struct.word_list, %struct.word_list* %67, i32 0, i32 1
  %68 = load %struct.word_desc*, %struct.word_desc** %word90, align 4
  %word91 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %68, i32 0, i32 0
  %69 = load i8*, i8** %word91, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %69, i32 0
  %70 = load i8, i8* %arrayidx92, align 1
  %conv93 = sext i8 %70 to i32
  %cmp94 = icmp eq i32 %conv93, 45
  br i1 %cmp94, label %land.lhs.true96, label %if.end167

land.lhs.true96:                                  ; preds = %if.else89
  %71 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word97 = getelementptr inbounds %struct.word_list, %struct.word_list* %71, i32 0, i32 1
  %72 = load %struct.word_desc*, %struct.word_desc** %word97, align 4
  %word98 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %72, i32 0, i32 0
  %73 = load i8*, i8** %word98, align 4
  %add.ptr = getelementptr inbounds i8, i8* %73, i32 1
  %call99 = call i8* @strpbrk(i8* %add.ptr, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.45, i32 0, i32 0))
  %cmp100 = icmp ne i8* %call99, null
  br i1 %cmp100, label %if.then102, label %if.end167

if.then102:                                       ; preds = %land.lhs.true96
  %74 = load %struct.builtin*, %struct.builtin** %b, align 4
  %cmp103 = icmp eq %struct.builtin* %74, null
  br i1 %cmp103, label %if.then105, label %if.end129

if.then105:                                       ; preds = %if.then102
  %75 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word106 = getelementptr inbounds %struct.word_list, %struct.word_list* %75, i32 0, i32 1
  %76 = load %struct.word_desc*, %struct.word_desc** %word106, align 4
  %word107 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %76, i32 0, i32 0
  %77 = load i8*, i8** %word107, align 4
  %call108 = call %struct.builtin* @builtin_address_internal(i8* %77, i32 0)
  store %struct.builtin* %call108, %struct.builtin** %b, align 4
  %78 = load %struct.builtin*, %struct.builtin** %b, align 4
  %cmp109 = icmp eq %struct.builtin* %78, null
  br i1 %cmp109, label %if.then116, label %lor.lhs.false111

lor.lhs.false111:                                 ; preds = %if.then105
  %79 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags112 = getelementptr inbounds %struct.builtin, %struct.builtin* %79, i32 0, i32 2
  %80 = load i32, i32* %flags112, align 4
  %and113 = and i32 %80, 16
  %cmp114 = icmp eq i32 %and113, 0
  br i1 %cmp114, label %if.then116, label %if.else117

if.then116:                                       ; preds = %lor.lhs.false111, %if.then105
  br label %for.end171

if.else117:                                       ; preds = %lor.lhs.false111
  %81 = load %struct.builtin*, %struct.builtin** %b, align 4
  %tobool118 = icmp ne %struct.builtin* %81, null
  br i1 %tobool118, label %land.lhs.true119, label %if.end127

land.lhs.true119:                                 ; preds = %if.else117
  %82 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags120 = getelementptr inbounds %struct.builtin, %struct.builtin* %82, i32 0, i32 2
  %83 = load i32, i32* %flags120, align 4
  %and121 = and i32 %83, 16
  %tobool122 = icmp ne i32 %and121, 0
  br i1 %tobool122, label %if.then123, label %if.end127

if.then123:                                       ; preds = %land.lhs.true119
  %84 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word124 = getelementptr inbounds %struct.word_list, %struct.word_list* %84, i32 0, i32 1
  %85 = load %struct.word_desc*, %struct.word_desc** %word124, align 4
  %flags125 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %85, i32 0, i32 1
  %86 = load i32, i32* %flags125, align 4
  %or126 = or i32 %86, 65536
  store i32 %or126, i32* %flags125, align 4
  br label %if.end127

if.end127:                                        ; preds = %if.then123, %land.lhs.true119, %if.else117
  br label %if.end128

if.end128:                                        ; preds = %if.end127
  br label %if.end129

if.end129:                                        ; preds = %if.end128, %if.then102
  %87 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word130 = getelementptr inbounds %struct.word_list, %struct.word_list* %87, i32 0, i32 1
  %88 = load %struct.word_desc*, %struct.word_desc** %word130, align 4
  %flags131 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %88, i32 0, i32 1
  %89 = load i32, i32* %flags131, align 4
  %and132 = and i32 %89, 65536
  %tobool133 = icmp ne i32 %and132, 0
  br i1 %tobool133, label %land.lhs.true134, label %if.else141

land.lhs.true134:                                 ; preds = %if.end129
  %90 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word135 = getelementptr inbounds %struct.word_list, %struct.word_list* %90, i32 0, i32 1
  %91 = load %struct.word_desc*, %struct.word_desc** %word135, align 4
  %word136 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %91, i32 0, i32 0
  %92 = load i8*, i8** %word136, align 4
  %add.ptr137 = getelementptr inbounds i8, i8* %92, i32 1
  %call138 = call i8* @strchr(i8* %add.ptr137, i32 65)
  %tobool139 = icmp ne i8* %call138, null
  br i1 %tobool139, label %if.then140, label %if.else141

if.then140:                                       ; preds = %land.lhs.true134
  store i32 1, i32* %assoc, align 4
  br label %if.end154

if.else141:                                       ; preds = %land.lhs.true134, %if.end129
  %93 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word142 = getelementptr inbounds %struct.word_list, %struct.word_list* %93, i32 0, i32 1
  %94 = load %struct.word_desc*, %struct.word_desc** %word142, align 4
  %flags143 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %94, i32 0, i32 1
  %95 = load i32, i32* %flags143, align 4
  %and144 = and i32 %95, 65536
  %tobool145 = icmp ne i32 %and144, 0
  br i1 %tobool145, label %land.lhs.true146, label %if.end153

land.lhs.true146:                                 ; preds = %if.else141
  %96 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word147 = getelementptr inbounds %struct.word_list, %struct.word_list* %96, i32 0, i32 1
  %97 = load %struct.word_desc*, %struct.word_desc** %word147, align 4
  %word148 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %97, i32 0, i32 0
  %98 = load i8*, i8** %word148, align 4
  %add.ptr149 = getelementptr inbounds i8, i8* %98, i32 1
  %call150 = call i8* @strchr(i8* %add.ptr149, i32 97)
  %tobool151 = icmp ne i8* %call150, null
  br i1 %tobool151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %land.lhs.true146
  store i32 1, i32* %array, align 4
  br label %if.end153

if.end153:                                        ; preds = %if.then152, %land.lhs.true146, %if.else141
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %if.then140
  %99 = load %struct.word_list*, %struct.word_list** %wcmd, align 4
  %word155 = getelementptr inbounds %struct.word_list, %struct.word_list* %99, i32 0, i32 1
  %100 = load %struct.word_desc*, %struct.word_desc** %word155, align 4
  %flags156 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %100, i32 0, i32 1
  %101 = load i32, i32* %flags156, align 4
  %and157 = and i32 %101, 65536
  %tobool158 = icmp ne i32 %and157, 0
  br i1 %tobool158, label %land.lhs.true159, label %if.end166

land.lhs.true159:                                 ; preds = %if.end154
  %102 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word160 = getelementptr inbounds %struct.word_list, %struct.word_list* %102, i32 0, i32 1
  %103 = load %struct.word_desc*, %struct.word_desc** %word160, align 4
  %word161 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %103, i32 0, i32 0
  %104 = load i8*, i8** %word161, align 4
  %add.ptr162 = getelementptr inbounds i8, i8* %104, i32 1
  %call163 = call i8* @strchr(i8* %add.ptr162, i32 103)
  %tobool164 = icmp ne i8* %call163, null
  br i1 %tobool164, label %if.then165, label %if.end166

if.then165:                                       ; preds = %land.lhs.true159
  store i32 1, i32* %global, align 4
  br label %if.end166

if.end166:                                        ; preds = %if.then165, %land.lhs.true159, %if.end154
  br label %if.end167

if.end167:                                        ; preds = %if.end166, %land.lhs.true96, %if.else89
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %if.end88
  br label %for.inc169

for.inc169:                                       ; preds = %if.end168
  %105 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next170 = getelementptr inbounds %struct.word_list, %struct.word_list* %105, i32 0, i32 0
  %106 = load %struct.word_list*, %struct.word_list** %next170, align 4
  store %struct.word_list* %106, %struct.word_list** %w, align 4
  br label %for.cond25

for.end171:                                       ; preds = %if.then, %if.then45, %if.then116, %for.cond25
  ret void
}

declare %struct.word_list* @expand_words(%struct.word_list*) #1

declare %struct.word_list* @copy_word_list(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_null_command(%struct.redirect* %redirects, i32 %pipe_in, i32 %pipe_out, i32 %async) #0 {
entry:
  %retval = alloca i32, align 4
  %redirects.addr = alloca %struct.redirect*, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %async.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %forcefork = alloca i32, align 4
  %rd = alloca %struct.redirect*, align 4
  store %struct.redirect* %redirects, %struct.redirect** %redirects.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store i32 %async, i32* %async.addr, align 4
  store i32 0, i32* %forcefork, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  store %struct.redirect* %0, %struct.redirect** %rd, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.redirect*, %struct.redirect** %rd, align 4
  %tobool = icmp ne %struct.redirect* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.redirect*, %struct.redirect** %rd, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 2
  %3 = load i32, i32* %rflags, align 4
  %and = and i32 %3, 1
  %4 = load i32, i32* %forcefork, align 4
  %add = add nsw i32 %4, %and
  store i32 %add, i32* %forcefork, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load %struct.redirect*, %struct.redirect** %rd, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %5, i32 0, i32 0
  %6 = load %struct.redirect*, %struct.redirect** %next, align 4
  store %struct.redirect* %6, %struct.redirect** %rd, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %forcefork, align 4
  %tobool1 = icmp ne i32 %7, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %8 = load i32, i32* %pipe_in.addr, align 4
  %cmp = icmp ne i32 %8, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %9 = load i32, i32* %pipe_out.addr, align 4
  %cmp3 = icmp ne i32 %9, -1
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %10 = load i32, i32* %async.addr, align 4
  %tobool5 = icmp ne i32 %10, 0
  br i1 %tobool5, label %if.then, label %if.else23

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %for.end
  %11 = load i32, i32* %async.addr, align 4
  %call = call i32 @make_child(i8* null, i32 %11)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %if.then7, label %if.else19

if.then7:                                         ; preds = %if.then
  call void @restore_original_signals()
  %12 = load i32, i32* %pipe_in.addr, align 4
  %13 = load i32, i32* %pipe_out.addr, align 4
  call void @do_piping(i32 %12, i32 %13)
  call void @coproc_closeall()
  store i32 0, i32* @subshell_environment, align 4
  %14 = load i32, i32* %async.addr, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then7
  %15 = load i32, i32* @subshell_environment, align 4
  %or = or i32 %15, 1
  store i32 %or, i32* @subshell_environment, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then7
  %16 = load i32, i32* %pipe_in.addr, align 4
  %cmp10 = icmp ne i32 %16, -1
  br i1 %cmp10, label %if.then13, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %if.end
  %17 = load i32, i32* %pipe_out.addr, align 4
  %cmp12 = icmp ne i32 %17, -1
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %lor.lhs.false11, %if.end
  %18 = load i32, i32* @subshell_environment, align 4
  %or14 = or i32 %18, 16
  store i32 %or14, i32* @subshell_environment, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %lor.lhs.false11
  %19 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call16 = call i32 @do_redirections(%struct.redirect* %19, i32 1)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.end15
  call void @exit(i32 0) #5
  unreachable

if.else:                                          ; preds = %if.end15
  call void @exit(i32 1) #5
  unreachable

if.else19:                                        ; preds = %if.then
  %20 = load i32, i32* %pipe_in.addr, align 4
  %21 = load i32, i32* %pipe_out.addr, align 4
  call void @close_pipes(i32 %20, i32 %21)
  %22 = load i32, i32* %pipe_out.addr, align 4
  %cmp20 = icmp eq i32 %22, -1
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.else19
  call void @unlink_fifo_list()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.else19
  store i32 0, i32* %retval, align 4
  br label %return

if.else23:                                        ; preds = %lor.lhs.false4
  %23 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call24 = call i32 @do_redirections(%struct.redirect* %23, i32 3)
  store i32 %call24, i32* %r, align 4
  %24 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @cleanup_redirects(%struct.redirect* %24)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  %25 = load i32, i32* %r, align 4
  %cmp25 = icmp ne i32 %25, 0
  br i1 %cmp25, label %if.then26, label %if.else27

if.then26:                                        ; preds = %if.else23
  store i32 1, i32* %retval, align 4
  br label %return

if.else27:                                        ; preds = %if.else23
  %26 = load i32, i32* @last_command_subst_pid, align 4
  %cmp28 = icmp ne i32 %26, -1
  br i1 %cmp28, label %if.then29, label %if.else30

if.then29:                                        ; preds = %if.else27
  %27 = load volatile i32, i32* @last_command_exit_value, align 4
  store i32 %27, i32* %retval, align 4
  br label %return

if.else30:                                        ; preds = %if.else27
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else30, %if.then29, %if.then26, %if.end22
  %28 = load i32, i32* %retval, align 4
  ret i32 %28
}

declare void @xtrace_print_word_list(%struct.word_list*, i32) #1

declare i32 (%struct.word_list*)* @find_special_builtin(i8*) #1

declare %struct.variable* @find_function(i8*) #1

declare i32 (%struct.word_list*)* @find_shell_builtin(i8*) #1

declare void @unwind_protect_mem(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @execute_subshell_builtin_or_function(%struct.word_list* %words, %struct.redirect* %redirects, i32 (%struct.word_list*)* %builtin, %struct.variable* %var, i32 %pipe_in, i32 %pipe_out, i32 %async, %struct.fd_bitmap* %fds_to_close, i32 %flags) #0 {
entry:
  %words.addr = alloca %struct.word_list*, align 4
  %redirects.addr = alloca %struct.redirect*, align 4
  %builtin.addr = alloca i32 (%struct.word_list*)*, align 4
  %var.addr = alloca %struct.variable*, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %async.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %flags.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %r = alloca i32, align 4
  %funcvalue = alloca i32, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  store %struct.redirect* %redirects, %struct.redirect** %redirects.addr, align 4
  store i32 (%struct.word_list*)* %builtin, i32 (%struct.word_list*)** %builtin.addr, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store i32 %async, i32* %async.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* @interactive, align 4
  store i32 0, i32* @login_shell, align 4
  %0 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp = icmp eq i32 (%struct.word_list*)* %0, @eval_builtin
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* @evalnest, align 4
  br label %if.end3

if.else:                                          ; preds = %entry
  %1 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp1 = icmp eq i32 (%struct.word_list*)* %1, @source_builtin
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  store i32 0, i32* @sourcenest, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %2 = load i32, i32* %async.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  %3 = load i32, i32* @subshell_environment, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* @subshell_environment, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  %4 = load i32, i32* %pipe_in.addr, align 4
  %cmp6 = icmp ne i32 %4, -1
  br i1 %cmp6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %5 = load i32, i32* %pipe_out.addr, align 4
  %cmp7 = icmp ne i32 %5, -1
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %lor.lhs.false, %if.end5
  %6 = load i32, i32* @subshell_environment, align 4
  %or9 = or i32 %6, 16
  store i32 %or9, i32* @subshell_environment, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %lor.lhs.false
  call void @maybe_make_export_env()
  %call = call void (i32)* @set_sigint_handler()
  %7 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %tobool11 = icmp ne %struct.fd_bitmap* %7, null
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  %8 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  call void @close_fd_bitmap(%struct.fd_bitmap* %8)
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  %9 = load i32, i32* %pipe_in.addr, align 4
  %10 = load i32, i32* %pipe_out.addr, align 4
  call void @do_piping(i32 %9, i32 %10)
  %11 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call14 = call i32 @do_redirections(%struct.redirect* %11, i32 1)
  %cmp15 = icmp ne i32 %call14, 0
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  call void @exit(i32 1) #5
  unreachable

if.end17:                                         ; preds = %if.end13
  %12 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %tobool18 = icmp ne i32 (%struct.word_list*)* %12, null
  br i1 %tobool18, label %if.then19, label %if.else40

if.then19:                                        ; preds = %if.end17
  %call20 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #6
  store i32 %call20, i32* %result, align 4
  store i32 0, i32* %funcvalue, align 4
  %13 = load i32, i32* @return_catch_flag, align 4
  %tobool21 = icmp ne i32 %13, 0
  br i1 %tobool21, label %land.lhs.true, label %if.end25

land.lhs.true:                                    ; preds = %if.then19
  %14 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp22 = icmp eq i32 (%struct.word_list*)* %14, @return_builtin
  br i1 %cmp22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %land.lhs.true
  %call24 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #6
  store i32 %call24, i32* %funcvalue, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %land.lhs.true, %if.then19
  %15 = load i32, i32* %result, align 4
  %cmp26 = icmp eq i32 %15, 3
  br i1 %cmp26, label %if.then27, label %if.else28

if.then27:                                        ; preds = %if.end25
  %16 = load volatile i32, i32* @last_command_exit_value, align 4
  call void @exit(i32 %16) #5
  unreachable

if.else28:                                        ; preds = %if.end25
  %17 = load i32, i32* %result, align 4
  %tobool29 = icmp ne i32 %17, 0
  br i1 %tobool29, label %if.then30, label %if.else31

if.then30:                                        ; preds = %if.else28
  call void @exit(i32 1) #5
  unreachable

if.else31:                                        ; preds = %if.else28
  %18 = load i32, i32* %funcvalue, align 4
  %tobool32 = icmp ne i32 %18, 0
  br i1 %tobool32, label %if.then33, label %if.else34

if.then33:                                        ; preds = %if.else31
  %19 = load i32, i32* @return_catch_value, align 4
  call void @exit(i32 %19) #5
  unreachable

if.else34:                                        ; preds = %if.else31
  %20 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %21 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %22 = load i32, i32* %flags.addr, align 4
  %call35 = call i32 @execute_builtin(i32 (%struct.word_list*)* %20, %struct.word_list* %21, i32 %22, i32 1)
  store i32 %call35, i32* %r, align 4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call36 = call i32 @fflush(%struct._IO_FILE* %23)
  %24 = load i32, i32* %r, align 4
  %cmp37 = icmp eq i32 %24, 258
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else34
  store i32 2, i32* %r, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %if.else34
  %25 = load i32, i32* %r, align 4
  call void @sh_exit(i32 %25) #5
  unreachable

if.else40:                                        ; preds = %if.end17
  %26 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %27 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %28 = load i32, i32* %flags.addr, align 4
  %29 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %30 = load i32, i32* %async.addr, align 4
  %call41 = call i32 @execute_function(%struct.variable* %26, %struct.word_list* %27, i32 %28, %struct.fd_bitmap* %29, i32 %30, i32 1)
  store i32 %call41, i32* %r, align 4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call42 = call i32 @fflush(%struct._IO_FILE* %31)
  %32 = load i32, i32* %r, align 4
  call void @sh_exit(i32 %32) #5
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @execute_builtin_or_function(%struct.word_list* %words, i32 (%struct.word_list*)* %builtin, %struct.variable* %var, %struct.redirect* %redirects, %struct.fd_bitmap* %fds_to_close, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %words.addr = alloca %struct.word_list*, align 4
  %builtin.addr = alloca i32 (%struct.word_list*)*, align 4
  %var.addr = alloca %struct.variable*, align 4
  %redirects.addr = alloca %struct.redirect*, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %flags.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %saved_undo_list = alloca %struct.redirect*, align 4
  %ofifo = alloca i32, align 4
  %nfifo = alloca i32, align 4
  %osize = alloca i32, align 4
  %ofifo_list = alloca i8*, align 4
  %discard = alloca i32, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  store i32 (%struct.word_list*)* %builtin, i32 (%struct.word_list*)** %builtin.addr, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store %struct.redirect* %redirects, %struct.redirect** %redirects.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.52, i32 0, i32 0))
  %call = call i32 @num_fifos()
  store i32 %call, i32* %ofifo, align 4
  %call1 = call i8* @copy_fifo_list(i32* %osize)
  store i8* %call1, i8** %ofifo_list, align 4
  %0 = load i8*, i8** %ofifo_list, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %ofifo_list, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call2 = call i32 @do_redirections(%struct.redirect* %2, i32 3)
  %cmp = icmp ne i32 %call2, 0
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %3 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @cleanup_redirects(%struct.redirect* %3)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  call void @dispose_exec_redirects()
  %4 = load i8*, i8** %ofifo_list, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5002)
  store i32 259, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %5 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  store %struct.redirect* %5, %struct.redirect** %saved_undo_list, align 4
  %6 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp5 = icmp eq i32 (%struct.word_list*)* %6, @exec_builtin
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end4
  %7 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %7)
  %8 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  store %struct.redirect* %8, %struct.redirect** %saved_undo_list, align 4
  store %struct.redirect* null, %struct.redirect** @exec_redirection_undo_list, align 4
  br label %if.end7

if.else:                                          ; preds = %if.end4
  call void @dispose_exec_redirects()
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then6
  %9 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  %tobool8 = icmp ne %struct.redirect* %9, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  call void @begin_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  %10 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  %11 = bitcast %struct.redirect* %10 to i8*
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void (%struct.redirect*)* @cleanup_redirects to void (...)*), i8* %11)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  %12 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %tobool11 = icmp ne i32 (%struct.word_list*)* %12, null
  br i1 %tobool11, label %if.then12, label %if.else14

if.then12:                                        ; preds = %if.end10
  %13 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %14 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %15 = load i32, i32* %flags.addr, align 4
  %call13 = call i32 @execute_builtin(i32 (%struct.word_list*)* %13, %struct.word_list* %14, i32 %15, i32 0)
  store i32 %call13, i32* %result, align 4
  br label %if.end16

if.else14:                                        ; preds = %if.end10
  %16 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %17 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %18 = load i32, i32* %flags.addr, align 4
  %19 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %call15 = call i32 @execute_function(%struct.variable* %16, %struct.word_list* %17, i32 %18, %struct.fd_bitmap* %19, i32 0, i32 0)
  store i32 %call15, i32* %result, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call17 = call i32 @fflush(%struct._IO_FILE* %20)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call18 = call i32 @_bash_fpurge(%struct._IO_FILE* %21)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call19 = call i32 @ferror(%struct._IO_FILE* %22)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end16
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %23)
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end16
  %24 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp23 = icmp eq i32 (%struct.word_list*)* %24, @command_builtin
  br i1 %cmp23, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %if.end22
  %25 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp24 = icmp eq i32 (%struct.word_list*)* %25, @exec_builtin
  br i1 %cmp24, label %if.then25, label %if.end32

if.then25:                                        ; preds = %land.lhs.true
  store i32 0, i32* %discard, align 4
  %26 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  %tobool26 = icmp ne %struct.redirect* %26, null
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.then25
  %27 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %27)
  store i32 1, i32* %discard, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.then25
  %28 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  store %struct.redirect* %28, %struct.redirect** @redirection_undo_list, align 4
  store %struct.redirect* null, %struct.redirect** @exec_redirection_undo_list, align 4
  store %struct.redirect* null, %struct.redirect** %saved_undo_list, align 4
  %29 = load i32, i32* %discard, align 4
  %tobool29 = icmp ne i32 %29, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end28
  call void @discard_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end28
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %land.lhs.true, %if.end22
  %30 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  %tobool33 = icmp ne %struct.redirect* %30, null
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end32
  %31 = load %struct.redirect*, %struct.redirect** %saved_undo_list, align 4
  store %struct.redirect* %31, %struct.redirect** @redirection_undo_list, align 4
  call void @discard_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %if.end32
  %32 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %tobool36 = icmp ne %struct.redirect* %32, null
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end35
  %33 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @cleanup_redirects(%struct.redirect* %33)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end35
  %call39 = call i32 @num_fifos()
  store i32 %call39, i32* %nfifo, align 4
  %34 = load i32, i32* %nfifo, align 4
  %35 = load i32, i32* %ofifo, align 4
  %cmp40 = icmp sgt i32 %34, %35
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end38
  %36 = load i8*, i8** %ofifo_list, align 4
  %37 = load i32, i32* %osize, align 4
  call void @close_new_fifos(i8* %36, i32 %37)
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.end38
  %38 = load i8*, i8** %ofifo_list, align 4
  %tobool43 = icmp ne i8* %38, null
  br i1 %tobool43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end42
  %39 = load i8*, i8** %ofifo_list, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5078)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %if.end42
  call void @discard_unwind_frame(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.52, i32 0, i32 0))
  %40 = load i32, i32* %result, align 4
  store i32 %40, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end45, %if.then3
  %41 = load i32, i32* %retval, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind
define internal i32 @builtin_status(i32 %result) #0 {
entry:
  %result.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %result, i32* %result.addr, align 4
  %0 = load i32, i32* %result.addr, align 4
  switch i32 %0, label %sw.default [
    i32 258, label %sw.bb
    i32 259, label %sw.bb1
    i32 257, label %sw.bb1
    i32 260, label %sw.bb1
    i32 261, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  store i32 2, i32* %r, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry, %entry, %entry, %entry
  store i32 1, i32* %r, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i32 0, i32* %r, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  %1 = load i32, i32* %r, align 4
  ret i32 %1
}

declare void @merge_temporary_env() #1

; Function Attrs: noinline nounwind
define internal i32 @is_dirname(i8* %pathname) #0 {
entry:
  %pathname.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %ret = alloca i32, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  %0 = load i8*, i8** %pathname.addr, align 4
  %call = call i8* @search_for_command(i8* %0, i32 0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %temp, align 4
  %call1 = call i32 @file_isdir(i8* %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i8*, i8** %pathname.addr, align 4
  %call2 = call i32 @file_isdir(i8* %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ %call2, %cond.false ]
  store i32 %cond, i32* %ret, align 4
  %4 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4005)
  %5 = load i32, i32* %ret, align 4
  ret i32 %5
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_word(i8*) #1

declare i32 @fifos_pending() #1

; Function Attrs: noinline nounwind
define internal i32 @execute_disk_command(%struct.word_list* %words, %struct.redirect* %redirects, i8* %command_line, i32 %pipe_in, i32 %pipe_out, i32 %async, %struct.fd_bitmap* %fds_to_close, i32 %cmdflags) #0 {
entry:
  %words.addr = alloca %struct.word_list*, align 4
  %redirects.addr = alloca %struct.redirect*, align 4
  %command_line.addr = alloca i8*, align 4
  %pipe_in.addr = alloca i32, align 4
  %pipe_out.addr = alloca i32, align 4
  %async.addr = alloca i32, align 4
  %fds_to_close.addr = alloca %struct.fd_bitmap*, align 4
  %cmdflags.addr = alloca i32, align 4
  %pathname = alloca i8*, align 4
  %command = alloca i8*, align 4
  %args = alloca i8**, align 4
  %nofork = alloca i32, align 4
  %stdpath = alloca i32, align 4
  %result = alloca i32, align 4
  %pid = alloca i32, align 4
  %hookf = alloca %struct.variable*, align 4
  %wl = alloca %struct.word_list*, align 4
  %old_interactive = alloca i32, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  store %struct.redirect* %redirects, %struct.redirect** %redirects.addr, align 4
  store i8* %command_line, i8** %command_line.addr, align 4
  store i32 %pipe_in, i32* %pipe_in.addr, align 4
  store i32 %pipe_out, i32* %pipe_out.addr, align 4
  store i32 %async, i32* %async.addr, align 4
  store %struct.fd_bitmap* %fds_to_close, %struct.fd_bitmap** %fds_to_close.addr, align 4
  store i32 %cmdflags, i32* %cmdflags.addr, align 4
  %0 = load i32, i32* %cmdflags.addr, align 4
  %and = and i32 %0, 16384
  store i32 %and, i32* %stdpath, align 4
  %1 = load i32, i32* %cmdflags.addr, align 4
  %and1 = and i32 %1, 64
  store i32 %and1, i32* %nofork, align 4
  %2 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word2 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %3, i32 0, i32 0
  %4 = load i8*, i8** %word2, align 4
  store i8* %4, i8** %pathname, align 4
  store i32 0, i32* %result, align 4
  store i8* null, i8** %command, align 4
  %5 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %6 = load i8*, i8** %pathname, align 4
  %call = call i8* @mbschr(i8* %6, i32 47)
  %tobool3 = icmp ne i8* %call, null
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call4 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.53, i32 0, i32 0))
  %7 = load i8*, i8** %pathname, align 4
  call void (i8*, ...) @internal_error(i8* %call4, i8* %7)
  store volatile i32 1, i32* @last_command_exit_value, align 4
  store i32 1, i32* %result, align 4
  %8 = load i32, i32* %nofork, align 4
  %tobool5 = icmp ne i32 %8, 0
  br i1 %tobool5, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %if.then
  %9 = load i32, i32* %pipe_in.addr, align 4
  %cmp = icmp eq i32 %9, -1
  br i1 %cmp, label %land.lhs.true7, label %if.else

land.lhs.true7:                                   ; preds = %land.lhs.true6
  %10 = load i32, i32* %pipe_out.addr, align 4
  %cmp8 = icmp eq i32 %10, -1
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %land.lhs.true7
  %11 = load volatile i32, i32* @last_command_exit_value, align 4
  call void @exit(i32 %11) #5
  unreachable

if.else:                                          ; preds = %land.lhs.true7, %land.lhs.true6, %if.then
  br label %parent_return

if.end:                                           ; preds = %land.lhs.true, %entry
  %12 = load i8*, i8** %pathname, align 4
  %13 = load i32, i32* %stdpath, align 4
  %tobool10 = icmp ne i32 %13, 0
  %cond = select i1 %tobool10, i32 2, i32 0
  %or = or i32 1, %cond
  %call11 = call i8* @search_for_command(i8* %12, i32 %or)
  store i8* %call11, i8** %command, align 4
  %14 = load i8*, i8** %command, align 4
  %tobool12 = icmp ne i8* %14, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  call void @maybe_make_export_env()
  %15 = load i8*, i8** %command, align 4
  call void @put_command_name_into_env(i8* %15)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end
  %16 = load i32, i32* %nofork, align 4
  %tobool15 = icmp ne i32 %16, 0
  br i1 %tobool15, label %land.lhs.true16, label %if.else21

land.lhs.true16:                                  ; preds = %if.end14
  %17 = load i32, i32* %pipe_in.addr, align 4
  %cmp17 = icmp eq i32 %17, -1
  br i1 %cmp17, label %land.lhs.true18, label %if.else21

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %18 = load i32, i32* %pipe_out.addr, align 4
  %cmp19 = icmp eq i32 %18, -1
  br i1 %cmp19, label %if.then20, label %if.else21

if.then20:                                        ; preds = %land.lhs.true18
  store i32 0, i32* %pid, align 4
  br label %if.end26

if.else21:                                        ; preds = %land.lhs.true18, %land.lhs.true16, %if.end14
  %19 = load i8*, i8** %command_line.addr, align 4
  %call22 = call i32 @strlen(i8* %19)
  %add = add i32 1, %call22
  %call23 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5185)
  %20 = load i8*, i8** %command_line.addr, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %20)
  %21 = load i32, i32* %async.addr, align 4
  %call25 = call i32 @make_child(i8* %call24, i32 %21)
  store i32 %call25, i32* %pid, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.else21, %if.then20
  %22 = load i32, i32* %pid, align 4
  %cmp27 = icmp eq i32 %22, 0
  br i1 %cmp27, label %if.then28, label %if.else79

if.then28:                                        ; preds = %if.end26
  call void @reset_terminating_signals()
  call void @restore_original_signals()
  br label %do.body

do.body:                                          ; preds = %if.then28
  %23 = load volatile i32, i32* @sigterm_received, align 4
  %tobool29 = icmp ne i32 %23, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %do.body
  call void @termsig_handler(i32 15)
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end31
  %24 = load i32, i32* %async.addr, align 4
  %tobool32 = icmp ne i32 %24, 0
  br i1 %tobool32, label %if.then33, label %if.end43

if.then33:                                        ; preds = %do.end
  %25 = load i32, i32* %cmdflags.addr, align 4
  %and34 = and i32 %25, 1024
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %land.lhs.true36, label %if.end42

land.lhs.true36:                                  ; preds = %if.then33
  %26 = load i32, i32* %pipe_in.addr, align 4
  %cmp37 = icmp eq i32 %26, -1
  br i1 %cmp37, label %land.lhs.true38, label %if.end42

land.lhs.true38:                                  ; preds = %land.lhs.true36
  %27 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call39 = call i32 @stdin_redirects(%struct.redirect* %27)
  %cmp40 = icmp eq i32 %call39, 0
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %land.lhs.true38
  call void @async_redirect_stdin()
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %land.lhs.true38, %land.lhs.true36, %if.then33
  call void @setup_async_signals()
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %do.end
  %28 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  %tobool44 = icmp ne %struct.fd_bitmap* %28, null
  br i1 %tobool44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end43
  %29 = load %struct.fd_bitmap*, %struct.fd_bitmap** %fds_to_close.addr, align 4
  call void @close_fd_bitmap(%struct.fd_bitmap* %29)
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %if.end43
  %30 = load i32, i32* %pipe_in.addr, align 4
  %31 = load i32, i32* %pipe_out.addr, align 4
  call void @do_piping(i32 %30, i32 %31)
  %32 = load i32, i32* @interactive, align 4
  store i32 %32, i32* %old_interactive, align 4
  %33 = load i32, i32* %async.addr, align 4
  %tobool47 = icmp ne i32 %33, 0
  br i1 %tobool47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end46
  store i32 0, i32* @interactive, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %if.end46
  %34 = load i32, i32* @subshell_environment, align 4
  %or50 = or i32 %34, 8
  store i32 %or50, i32* @subshell_environment, align 4
  %35 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %tobool51 = icmp ne %struct.redirect* %35, null
  br i1 %tobool51, label %land.lhs.true52, label %if.end56

land.lhs.true52:                                  ; preds = %if.end49
  %36 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call53 = call i32 @do_redirections(%struct.redirect* %36, i32 1)
  %cmp54 = icmp ne i32 %call53, 0
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %land.lhs.true52
  call void @unlink_fifo_list()
  call void @exit(i32 1) #5
  unreachable

if.end56:                                         ; preds = %land.lhs.true52, %if.end49
  %37 = load i32, i32* %async.addr, align 4
  %tobool57 = icmp ne i32 %37, 0
  br i1 %tobool57, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.end56
  %38 = load i32, i32* %old_interactive, align 4
  store i32 %38, i32* @interactive, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then58, %if.end56
  %39 = load i8*, i8** %command, align 4
  %cmp60 = icmp eq i8* %39, null
  br i1 %cmp60, label %if.then61, label %if.end71

if.then61:                                        ; preds = %if.end59
  %call62 = call %struct.variable* @find_function(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.54, i32 0, i32 0))
  store %struct.variable* %call62, %struct.variable** %hookf, align 4
  %40 = load %struct.variable*, %struct.variable** %hookf, align 4
  %cmp63 = icmp eq %struct.variable* %40, null
  br i1 %cmp63, label %if.then64, label %if.end67

if.then64:                                        ; preds = %if.then61
  %41 = load i8*, i8** %pathname, align 4
  %call65 = call i8* @printable_filename(i8* %41, i32 0)
  store i8* %call65, i8** %pathname, align 4
  %call66 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.55, i32 0, i32 0))
  %42 = load i8*, i8** %pathname, align 4
  call void (i8*, ...) @internal_error(i8* %call66, i8* %42)
  call void @exit(i32 127) #5
  unreachable

if.end67:                                         ; preds = %if.then61
  %call68 = call %struct.word_desc* @make_word(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.54, i32 0, i32 0))
  %43 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %call69 = call %struct.word_list* @make_word_list(%struct.word_desc* %call68, %struct.word_list* %43)
  store %struct.word_list* %call69, %struct.word_list** %wl, align 4
  %44 = load %struct.variable*, %struct.variable** %hookf, align 4
  %45 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %call70 = call i32 @execute_shell_function(%struct.variable* %44, %struct.word_list* %45)
  call void @exit(i32 %call70) #5
  unreachable

if.end71:                                         ; preds = %if.end59
  br label %do.body72

do.body72:                                        ; preds = %if.end71
  %46 = load volatile i32, i32* @sigterm_received, align 4
  %tobool73 = icmp ne i32 %46, 0
  br i1 %tobool73, label %if.then74, label %if.end75

if.then74:                                        ; preds = %do.body72
  call void @termsig_handler(i32 15)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %do.body72
  br label %do.end76

do.end76:                                         ; preds = %if.end75
  %47 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %call77 = call i8** @strvec_from_word_list(%struct.word_list* %47, i32 0, i32 0, i32* null)
  store i8** %call77, i8*** %args, align 4
  %48 = load i8*, i8** %command, align 4
  %49 = load i8**, i8*** %args, align 4
  %50 = load i8**, i8*** @export_env, align 4
  %call78 = call i32 @shell_execve(i8* %48, i8** %49, i8** %50)
  call void @exit(i32 %call78) #5
  unreachable

if.else79:                                        ; preds = %if.end26
  br label %parent_return

parent_return:                                    ; preds = %if.else79, %if.else
  br label %do.body80

do.body80:                                        ; preds = %parent_return
  %51 = load volatile i32, i32* @terminating_signal, align 4
  %tobool81 = icmp ne i32 %51, 0
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %do.body80
  %52 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %52)
  br label %if.end83

if.end83:                                         ; preds = %if.then82, %do.body80
  %53 = load volatile i32, i32* @interrupt_state, align 4
  %tobool84 = icmp ne i32 %53, 0
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end83
  call void @throw_to_top_level()
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %if.end83
  br label %do.end87

do.end87:                                         ; preds = %if.end86
  %54 = load i32, i32* %pipe_in.addr, align 4
  %55 = load i32, i32* %pipe_out.addr, align 4
  call void @close_pipes(i32 %54, i32 %55)
  %56 = load i32, i32* @variable_context, align 4
  %cmp88 = icmp eq i32 %56, 0
  br i1 %cmp88, label %if.then89, label %if.end90

if.then89:                                        ; preds = %do.end87
  call void @unlink_fifo_list()
  br label %if.end90

if.end90:                                         ; preds = %if.then89, %do.end87
  br label %do.body91

do.body91:                                        ; preds = %if.end90
  %57 = load i8*, i8** %command, align 4
  %tobool92 = icmp ne i8* %57, null
  br i1 %tobool92, label %if.then93, label %if.end94

if.then93:                                        ; preds = %do.body91
  %58 = load i8*, i8** %command, align 4
  call void @sh_xfree(i8* %58, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 5277)
  br label %if.end94

if.end94:                                         ; preds = %if.then93, %do.body91
  br label %do.end95

do.end95:                                         ; preds = %if.end94
  %59 = load i32, i32* %result, align 4
  ret i32 %59
}

declare %struct.builtin* @builtin_address_internal(i8*, i32) #1

declare i8* @strpbrk(i8*, i8*) #1

declare i8* @strchr(i8*, i32) #1

declare void @restore_original_signals() #1

declare i32 @eval_builtin(%struct.word_list*) #1

declare i32 @source_builtin(%struct.word_list*) #1

declare i32 @return_builtin(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define internal i32 @execute_builtin(i32 (%struct.word_list*)* %builtin, %struct.word_list* %words, i32 %flags, i32 %subshell) #0 {
entry:
  %builtin.addr = alloca i32 (%struct.word_list*)*, align 4
  %words.addr = alloca %struct.word_list*, align 4
  %flags.addr = alloca i32, align 4
  %subshell.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %eval_unwind = alloca i32, align 4
  %ignexit_flag = alloca i32, align 4
  %old_e_flag = alloca i32, align 4
  %isbltinenv = alloca i32, align 4
  %error_trap = alloca i8*, align 4
  store i32 (%struct.word_list*)* %builtin, i32 (%struct.word_list*)** %builtin.addr, align 4
  store %struct.word_list* %words, %struct.word_list** %words.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %subshell, i32* %subshell.addr, align 4
  store i8* null, i8** %error_trap, align 4
  %0 = load i32, i32* %subshell.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %flags.addr, align 4
  %and = and i32 %1, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true1, label %if.else

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp2 = icmp eq i32 (%struct.word_list*)* %2, @eval_builtin
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true1
  %3 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp3 = icmp eq i32 (%struct.word_list*)* %3, @command_builtin
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %4 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp5 = icmp eq i32 (%struct.word_list*)* %4, @source_builtin
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %land.lhs.true1
  call void @begin_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.46, i32 0, i32 0))
  call void @unwind_protect_mem(i8* bitcast (i32* @exit_immediately_on_error to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @builtin_ignoring_errexit to i8*), i32 4)
  %call = call i32 @signal_is_trapped(i32 66)
  %tobool6 = icmp ne i32 %call, 0
  br i1 %tobool6, label %land.lhs.true7, label %cond.false

land.lhs.true7:                                   ; preds = %if.then
  %call8 = call i32 @signal_is_ignored(i32 66)
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true7
  %5 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @trap_list, i32 0, i32 66), align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true7, %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %5, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %error_trap, align 4
  %6 = load i8*, i8** %error_trap, align 4
  %tobool10 = icmp ne i8* %6, null
  br i1 %tobool10, label %if.then11, label %if.end

if.then11:                                        ; preds = %cond.end
  %7 = load i8*, i8** %error_trap, align 4
  %call12 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call12
  %call13 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4464)
  %8 = load i8*, i8** %error_trap, align 4
  %call14 = call i8* @strcpy(i8* %call13, i8* %8)
  store i8* %call14, i8** %error_trap, align 4
  %9 = load i8*, i8** %error_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %9)
  %10 = load i8*, i8** %error_trap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @set_error_trap, i8* %10)
  call void @restore_default_signal(i32 66)
  br label %if.end

if.end:                                           ; preds = %if.then11, %cond.end
  store i32 0, i32* @exit_immediately_on_error, align 4
  %11 = load i32, i32* @builtin_ignoring_errexit, align 4
  store i32 %11, i32* %ignexit_flag, align 4
  store i32 1, i32* @builtin_ignoring_errexit, align 4
  store i32 1, i32* %eval_unwind, align 4
  br label %if.end15

if.else:                                          ; preds = %lor.lhs.false4, %land.lhs.true, %entry
  store i32 0, i32* %eval_unwind, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.end
  %12 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp16 = icmp eq i32 (%struct.word_list*)* %12, @source_builtin
  br i1 %cmp16, label %lor.end, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.end15
  %13 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp18 = icmp eq i32 (%struct.word_list*)* %13, @eval_builtin
  br i1 %cmp18, label %lor.end, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false17
  %14 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp20 = icmp eq i32 (%struct.word_list*)* %14, @unset_builtin
  br i1 %cmp20, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false19
  %15 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp21 = icmp eq i32 (%struct.word_list*)* %15, @mapfile_builtin
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false19, %lor.lhs.false17, %if.end15
  %16 = phi i1 [ true, %lor.lhs.false19 ], [ true, %lor.lhs.false17 ], [ true, %if.end15 ], [ %cmp21, %lor.rhs ]
  %lor.ext = zext i1 %16 to i32
  store i32 %lor.ext, i32* %isbltinenv, align 4
  %17 = load i32, i32* %isbltinenv, align 4
  %tobool22 = icmp ne i32 %17, 0
  br i1 %tobool22, label %if.then23, label %if.end37

if.then23:                                        ; preds = %lor.end
  %18 = load i32, i32* %subshell.addr, align 4
  %cmp24 = icmp eq i32 %18, 0
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.then23
  call void @begin_unwind_frame(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.47, i32 0, i32 0))
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.then23
  %19 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool27 = icmp ne %struct.hash_table* %19, null
  br i1 %tobool27, label %if.then28, label %if.end36

if.then28:                                        ; preds = %if.end26
  %20 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %call29 = call %struct.var_context* @push_scope(i32 8, %struct.hash_table* %20)
  %21 = load i32, i32* %subshell.addr, align 4
  %cmp30 = icmp eq i32 %21, 0
  br i1 %cmp30, label %if.then31, label %if.end35

if.then31:                                        ; preds = %if.then28
  %22 = load i32, i32* %flags.addr, align 4
  %and32 = and i32 %22, 2048
  %tobool33 = icmp ne i32 %and32, 0
  %cond34 = select i1 %tobool33, i8* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.48, i32 0, i32 0)
  call void bitcast (void (...)* @add_unwind_protect to void (void (i32)*, i8*)*)(void (i32)* @pop_scope, i8* %cond34)
  br label %if.end35

if.end35:                                         ; preds = %if.then31, %if.then28
  store %struct.hash_table* null, %struct.hash_table** @temporary_env, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end26
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %lor.end
  %23 = load i32, i32* %subshell.addr, align 4
  %cmp38 = icmp eq i32 %23, 0
  br i1 %cmp38, label %land.lhs.true39, label %if.else48

land.lhs.true39:                                  ; preds = %if.end37
  %24 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp40 = icmp eq i32 (%struct.word_list*)* %24, @eval_builtin
  br i1 %cmp40, label %if.then41, label %if.else48

if.then41:                                        ; preds = %land.lhs.true39
  %25 = load i32, i32* @evalnest_max, align 4
  %cmp42 = icmp sgt i32 %25, 0
  br i1 %cmp42, label %land.lhs.true43, label %if.end47

land.lhs.true43:                                  ; preds = %if.then41
  %26 = load i32, i32* @evalnest, align 4
  %27 = load i32, i32* @evalnest_max, align 4
  %cmp44 = icmp sge i32 %26, %27
  br i1 %cmp44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %land.lhs.true43
  %call46 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.49, i32 0, i32 0))
  %28 = load i32, i32* @evalnest, align 4
  call void (i8*, ...) @internal_error(i8* %call46, i32 %28)
  store i32 0, i32* @evalnest, align 4
  call void @jump_to_top_level(i32 2) #5
  unreachable

if.end47:                                         ; preds = %land.lhs.true43, %if.then41
  call void @unwind_protect_mem(i8* bitcast (i32* @evalnest to i8*), i32 4)
  %29 = load i32, i32* @evalnest, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* @evalnest, align 4
  br label %if.end61

if.else48:                                        ; preds = %land.lhs.true39, %if.end37
  %30 = load i32, i32* %subshell.addr, align 4
  %cmp49 = icmp eq i32 %30, 0
  br i1 %cmp49, label %land.lhs.true50, label %if.end60

land.lhs.true50:                                  ; preds = %if.else48
  %31 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp51 = icmp eq i32 (%struct.word_list*)* %31, @source_builtin
  br i1 %cmp51, label %if.then52, label %if.end60

if.then52:                                        ; preds = %land.lhs.true50
  %32 = load i32, i32* @sourcenest_max, align 4
  %cmp53 = icmp sgt i32 %32, 0
  br i1 %cmp53, label %land.lhs.true54, label %if.end58

land.lhs.true54:                                  ; preds = %if.then52
  %33 = load i32, i32* @sourcenest, align 4
  %34 = load i32, i32* @sourcenest_max, align 4
  %cmp55 = icmp sge i32 %33, %34
  br i1 %cmp55, label %if.then56, label %if.end58

if.then56:                                        ; preds = %land.lhs.true54
  %call57 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.50, i32 0, i32 0))
  %35 = load i8*, i8** @this_command_name, align 4
  %36 = load i32, i32* @sourcenest, align 4
  call void (i8*, ...) @internal_error(i8* %call57, i8* %35, i32 %36)
  store i32 0, i32* @sourcenest, align 4
  call void @jump_to_top_level(i32 2) #5
  unreachable

if.end58:                                         ; preds = %land.lhs.true54, %if.then52
  call void @unwind_protect_mem(i8* bitcast (i32* @sourcenest to i8*), i32 4)
  %37 = load i32, i32* @sourcenest, align 4
  %inc59 = add nsw i32 %37, 1
  store i32 %inc59, i32* @sourcenest, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.end58, %land.lhs.true50, %if.else48
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.end47
  %38 = load i32, i32* @posixly_correct, align 4
  %tobool62 = icmp ne i32 %38, 0
  br i1 %tobool62, label %land.lhs.true63, label %if.end70

land.lhs.true63:                                  ; preds = %if.end61
  %39 = load i32, i32* %subshell.addr, align 4
  %cmp64 = icmp eq i32 %39, 0
  br i1 %cmp64, label %land.lhs.true65, label %if.end70

land.lhs.true65:                                  ; preds = %land.lhs.true63
  %40 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp66 = icmp eq i32 (%struct.word_list*)* %40, @return_builtin
  br i1 %cmp66, label %land.lhs.true67, label %if.end70

land.lhs.true67:                                  ; preds = %land.lhs.true65
  %41 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool68 = icmp ne %struct.hash_table* %41, null
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %land.lhs.true67
  call void @begin_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.51, i32 0, i32 0))
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i8*)*)(void ()* @merge_temporary_env, i8* null)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %land.lhs.true67, %land.lhs.true65, %land.lhs.true63, %if.end61
  %42 = load i32, i32* @executing_builtin, align 4
  %inc71 = add nsw i32 %42, 1
  store i32 %inc71, i32* @executing_builtin, align 4
  %43 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp72 = icmp eq i32 (%struct.word_list*)* %43, @command_builtin
  %conv = zext i1 %cmp72 to i32
  %44 = load i32, i32* @executing_command_builtin, align 4
  %or = or i32 %44, %conv
  store i32 %or, i32* @executing_command_builtin, align 4
  %45 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %46 = load %struct.word_list*, %struct.word_list** %words.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 0
  %47 = load %struct.word_list*, %struct.word_list** %next, align 4
  %call73 = call i32 %45(%struct.word_list* %47)
  store i32 %call73, i32* %result, align 4
  %48 = load i32, i32* @posixly_correct, align 4
  %tobool74 = icmp ne i32 %48, 0
  br i1 %tobool74, label %land.lhs.true75, label %if.end84

land.lhs.true75:                                  ; preds = %if.end70
  %49 = load i32, i32* %subshell.addr, align 4
  %cmp76 = icmp eq i32 %49, 0
  br i1 %cmp76, label %land.lhs.true78, label %if.end84

land.lhs.true78:                                  ; preds = %land.lhs.true75
  %50 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %builtin.addr, align 4
  %cmp79 = icmp eq i32 (%struct.word_list*)* %50, @return_builtin
  br i1 %cmp79, label %land.lhs.true81, label %if.end84

land.lhs.true81:                                  ; preds = %land.lhs.true78
  %51 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool82 = icmp ne %struct.hash_table* %51, null
  br i1 %tobool82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %land.lhs.true81
  call void @discard_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %land.lhs.true81, %land.lhs.true78, %land.lhs.true75, %if.end70
  %52 = load i32, i32* %subshell.addr, align 4
  %cmp85 = icmp eq i32 %52, 0
  br i1 %cmp85, label %land.lhs.true87, label %if.end90

land.lhs.true87:                                  ; preds = %if.end84
  %53 = load i32, i32* %isbltinenv, align 4
  %tobool88 = icmp ne i32 %53, 0
  br i1 %tobool88, label %if.then89, label %if.end90

if.then89:                                        ; preds = %land.lhs.true87
  call void @run_unwind_frame(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.47, i32 0, i32 0))
  br label %if.end90

if.end90:                                         ; preds = %if.then89, %land.lhs.true87, %if.end84
  %54 = load i32, i32* %eval_unwind, align 4
  %tobool91 = icmp ne i32 %54, 0
  br i1 %tobool91, label %if.then92, label %if.end101

if.then92:                                        ; preds = %if.end90
  %55 = load i32, i32* %ignexit_flag, align 4
  store i32 %55, i32* @builtin_ignoring_errexit, align 4
  %56 = load i32, i32* @builtin_ignoring_errexit, align 4
  %tobool93 = icmp ne i32 %56, 0
  br i1 %tobool93, label %cond.true94, label %cond.false95

cond.true94:                                      ; preds = %if.then92
  br label %cond.end96

cond.false95:                                     ; preds = %if.then92
  %57 = load i32, i32* @errexit_flag, align 4
  br label %cond.end96

cond.end96:                                       ; preds = %cond.false95, %cond.true94
  %cond97 = phi i32 [ 0, %cond.true94 ], [ %57, %cond.false95 ]
  store i32 %cond97, i32* @exit_immediately_on_error, align 4
  %58 = load i8*, i8** %error_trap, align 4
  %tobool98 = icmp ne i8* %58, null
  br i1 %tobool98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %cond.end96
  %59 = load i8*, i8** %error_trap, align 4
  call void @set_error_trap(i8* %59)
  %60 = load i8*, i8** %error_trap, align 4
  call void @sh_xfree(i8* %60, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4552)
  br label %if.end100

if.end100:                                        ; preds = %if.then99, %cond.end96
  call void @discard_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.46, i32 0, i32 0))
  br label %if.end101

if.end101:                                        ; preds = %if.end100, %if.end90
  %61 = load i32, i32* %result, align 4
  ret i32 %61
}

declare i32 @command_builtin(%struct.word_list*) #1

declare void @set_error_trap(i8*) #1

declare void @restore_default_signal(i32) #1

declare i32 @unset_builtin(%struct.word_list*) #1

declare i32 @mapfile_builtin(%struct.word_list*) #1

declare %struct.var_context* @push_scope(i32, %struct.hash_table*) #1

declare void @pop_scope(i32) #1

declare i32 @exec_builtin(%struct.word_list*) #1

declare i32 @_bash_fpurge(%struct._IO_FILE*) #1

declare i32 @ferror(%struct._IO_FILE*) #1

declare void @clearerr(%struct._IO_FILE*) #1

declare i8* @search_for_command(i8*, i32) #1

declare i8* @mbschr(i8*, i32) #1

declare void @put_command_name_into_env(i8*) #1

declare i8* @printable_filename(i8*, i32) #1

declare i8** @strvec_from_word_list(%struct.word_list*, i32, i32, i32*) #1

declare %struct.command* @copy_command(%struct.command*) #1

declare %struct.sh_getopt_state* @sh_getopt_save_istate() #1

declare void @push_context(i8*, i32, %struct.hash_table*) #1

; Function Attrs: noinline nounwind
define internal void @maybe_restore_getopt_state(%struct.sh_getopt_state* %gs) #0 {
entry:
  %gs.addr = alloca %struct.sh_getopt_state*, align 4
  %v = alloca %struct.variable*, align 4
  store %struct.sh_getopt_state* %gs, %struct.sh_getopt_state** %gs.addr, align 4
  %0 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %gs.addr, align 4
  %gs_flags = getelementptr inbounds %struct.sh_getopt_state, %struct.sh_getopt_state* %0, i32 0, i32 5
  %1 = load i32, i32* %gs_flags, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %gs.addr, align 4
  call void @sh_getopt_restore_istate(%struct.sh_getopt_state* %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load %struct.sh_getopt_state*, %struct.sh_getopt_state** %gs.addr, align 4
  %4 = bitcast %struct.sh_getopt_state* %3 to i8*
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 4573)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare void @pop_context() #1

declare void @make_funcname_visible(i32) #1

declare void @maybe_set_debug_trap(i8*) #1

declare void @maybe_set_error_trap(i8*) #1

declare void @maybe_set_return_trap(i8*) #1

declare %struct.function_def* @find_function_def(i8*) #1

declare i32 @array_rshift(%struct.array*, i32, i8*) #1

declare void @remember_args(%struct.word_list*, i32) #1

declare void @push_args(%struct.word_list*) #1

declare void @pop_args() #1

declare void @run_return_trap() #1

declare void @sh_getopt_restore_istate(%struct.sh_getopt_state*) #1

declare i8* @substring(i8*, i32, i32) #1

declare void @delete_all_aliases() #1

declare void @without_job_control() #1

declare void @reset_shell_flags() #1

declare void @reset_shell_options() #1

declare void @reset_shopt_options() #1

declare void @clear_unwind_protect_list(i32) #1

declare void @unset_bash_input(i32) #1

declare void @bind_function_def(i8*, %struct.function_def*) #1

declare %struct.variable* @bind_function(i8*, %struct.command*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }
attributes #6 = { returns_twice }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
