; ModuleID = 'shell.c'
source_filename = "shell.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct._IO_FILE = type opaque
%struct.STRING_INT_ALIST = type { i8*, i32 }
%struct.BASH_INPUT = type { i32, i8*, %union.INPUT_STREAM, i32 ()*, i32 (i32)* }
%union.INPUT_STREAM = type { %struct._IO_FILE* }
%struct.anon = type { i8*, i32, i32*, i8** }
%struct.var_context = type { i8*, i32, i32, %struct.var_context*, %struct.var_context*, %struct.hash_table* }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.g_list = type { %struct.g_list* }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

@shell_initialized = global i32 0, align 4
@global_command = global %struct.command* null, align 4
@current_user = global %struct.user_info { i32 -1, i32 -1, i32 -1, i32 -1, i8* null, i8* null, i8* null }, align 4
@current_host_name = global i8* null, align 4
@login_shell = global i32 0, align 4
@interactive = global i32 0, align 4
@interactive_shell = global i32 0, align 4
@hup_on_exit = global i32 0, align 4
@check_jobs_at_exit = global i32 0, align 4
@autocd = global i32 0, align 4
@startup_state = global i32 0, align 4
@reading_shell_script = global i32 0, align 4
@debugging_login_shell = global i32 0, align 4
@executing = global i32 0, align 4
@current_command_number = global i32 1, align 4
@indirection_level = global i32 0, align 4
@shell_name = global i8* null, align 4
@have_devfd = global i32 1, align 4
@debugging_mode = global i32 0, align 4
@no_line_editing = global i32 0, align 4
@wordexp_only = global i32 0, align 4
@protected_mode = global i32 0, align 4
@posixly_correct = global i32 0, align 4
@default_buffered_input = global i32 -1, align 4
@malloc_trace_at_exit = global i32 0, align 4
@top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@running_setuid = internal global i32 0, align 4
@.str = private unnamed_addr constant [16 x i8] c"POSIXLY_CORRECT\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"POSIX_PEDANTIC\00", align 1
@subshell_top_level = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@subshell_argc = common global i32 0, align 4
@subshell_argv = common global i8** null, align 4
@subshell_envp = common global i8** null, align 4
@sourced_env = internal global i32 0, align 4
@shell_reinitialized = internal global i32 0, align 4
@command_execution_string = common global i8* null, align 4
@read_from_stdin = common global i32 0, align 4
@want_pending_command = common global i32 0, align 4
@stdin = external constant %struct._IO_FILE*, align 4
@default_input = internal global %struct._IO_FILE* null, align 4
@make_login_shell = internal global i32 0, align 4
@shell_environment = common global i8** null, align 4
@shell_start_time = common global i32 0, align 4
@want_initial_help = internal global i32 0, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@do_version = internal global i32 0, align 4
@verbose_flag = external global i32, align 4
@echo_input_at_read = external global i32, align 4
@this_command_name = external global i8*, align 4
@.str.2 = private unnamed_addr constant [12 x i8] c"login_shell\00", align 1
@dump_po_strings = common global i32 0, align 4
@dump_translatable_strings = common global i32 0, align 4
@read_but_dont_execute = external global i32, align 4
@privileged_mode = external global i32, align 4
@.str.3 = private unnamed_addr constant [32 x i8] c"%s: option requires an argument\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@forced_interactive = external global i32, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.5 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@shopt_alist = internal global %struct.STRING_INT_ALIST* null, align 4
@.str.6 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"EMACS\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"INSIDE_EMACS\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c",term:\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c" (term:\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"emacs\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"dumb\00", align 1
@running_under_emacs = common global i32 0, align 4
@.str.14 = private unnamed_addr constant [6 x i8] c"eterm\00", align 1
@gnu_error_format = external global i32, align 4
@exit_immediately_on_error = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@.str.15 = private unnamed_addr constant [4 x i8] c"PS1\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"PS2\00", align 1
@restricted_shell = external global i32, align 4
@restricted = external global i32, align 4
@act_like_sh = internal global i32 0, align 4
@history_lines_this_session = external global i32, align 4
@rl_readline_state = external global i32, align 4
@rl_deprep_term_function = external global void ()*, align 4
@remember_on_history = external global i32, align 4
@.str.17 = private unnamed_addr constant [6 x i8] c"rbash\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"PATH\00", align 1
@.str.19 = private unnamed_addr constant [6 x i8] c"SHELL\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"ENV\00", align 1
@.str.21 = private unnamed_addr constant [9 x i8] c"BASH_ENV\00", align 1
@.str.22 = private unnamed_addr constant [39 x i8] c"cannot set uid to %d: effective uid %d\00", align 1
@.str.23 = private unnamed_addr constant [39 x i8] c"cannot set gid to %d: effective gid %d\00", align 1
@bash_input = external global %struct.BASH_INPUT, align 4
@.str.24 = private unnamed_addr constant [8 x i8] c"shell.c\00", align 1
@.str.25 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@.str.26 = private unnamed_addr constant [16 x i8] c"I have no name!\00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@exec_argv0 = common global i8* null, align 4
@long_args = internal constant [16 x %struct.anon] [%struct.anon { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.29, i32 0, i32 0), i32 1, i32* @debugging, i8** null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.30, i32 0, i32 0), i32 1, i32* @debugging_mode, i8** null }, %struct.anon { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i32 0, i32 0), i32 1, i32* @dump_po_strings, i8** null }, %struct.anon { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.32, i32 0, i32 0), i32 1, i32* @dump_translatable_strings, i8** null }, %struct.anon { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i32 0, i32 0), i32 1, i32* @want_initial_help, i8** null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.34, i32 0, i32 0), i32 2, i32* null, i8** @bashrc_file }, %struct.anon { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.35, i32 0, i32 0), i32 1, i32* @make_login_shell, i8** null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.36, i32 0, i32 0), i32 1, i32* @no_line_editing, i8** null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.37, i32 0, i32 0), i32 1, i32* @no_profile, i8** null }, %struct.anon { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.38, i32 0, i32 0), i32 1, i32* @no_rc, i8** null }, %struct.anon { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0), i32 1, i32* @posixly_correct, i8** null }, %struct.anon { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.40, i32 0, i32 0), i32 2, i32* null, i8** @bashrc_file }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.41, i32 0, i32 0), i32 1, i32* @restricted, i8** null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.42, i32 0, i32 0), i32 1, i32* @verbose_flag, i8** null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.43, i32 0, i32 0), i32 1, i32* @do_version, i8** null }, %struct.anon { i8* null, i32 1, i32* null, i8** null }], align 4
@.str.28 = private unnamed_addr constant [19 x i8] c"%s: invalid option\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"debug\00", align 1
@debugging = internal global i32 0, align 4
@.str.30 = private unnamed_addr constant [9 x i8] c"debugger\00", align 1
@.str.31 = private unnamed_addr constant [16 x i8] c"dump-po-strings\00", align 1
@.str.32 = private unnamed_addr constant [13 x i8] c"dump-strings\00", align 1
@.str.33 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str.34 = private unnamed_addr constant [10 x i8] c"init-file\00", align 1
@bashrc_file = internal global i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.44, i32 0, i32 0), align 4
@.str.35 = private unnamed_addr constant [6 x i8] c"login\00", align 1
@.str.36 = private unnamed_addr constant [10 x i8] c"noediting\00", align 1
@.str.37 = private unnamed_addr constant [10 x i8] c"noprofile\00", align 1
@no_profile = internal global i32 0, align 4
@.str.38 = private unnamed_addr constant [5 x i8] c"norc\00", align 1
@no_rc = internal global i32 0, align 4
@.str.39 = private unnamed_addr constant [6 x i8] c"posix\00", align 1
@.str.40 = private unnamed_addr constant [7 x i8] c"rcfile\00", align 1
@.str.41 = private unnamed_addr constant [11 x i8] c"restricted\00", align 1
@.str.42 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@.str.43 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str.44 = private unnamed_addr constant [10 x i8] c"~/.bashrc\00", align 1
@.str.45 = private unnamed_addr constant [21 x i8] c"%c%c: invalid option\00", align 1
@shopt_ind = internal global i32 0, align 4
@shopt_len = internal global i32 0, align 4
@shell_level = external global i32, align 4
@.str.46 = private unnamed_addr constant [13 x i8] c"/etc/profile\00", align 1
@.str.47 = private unnamed_addr constant [11 x i8] c"~/.profile\00", align 1
@.str.48 = private unnamed_addr constant [16 x i8] c"~/.bash_profile\00", align 1
@.str.49 = private unnamed_addr constant [14 x i8] c"~/.bash_login\00", align 1
@su_shell = internal global i32 0, align 4
@.str.50 = private unnamed_addr constant [16 x i8] c"run_one_command\00", align 1
@dollar_vars = external global [0 x i8*], align 4
@.str.51 = private unnamed_addr constant [40 x i8] c"/usr/local/share/bashdb/bashdb-main.inc\00", align 1
@.str.52 = private unnamed_addr constant [47 x i8] c"cannot start debugger; debugging mode disabled\00", align 1
@function_trace_mode = external global i32, align 4
@error_trace_mode = external global i32, align 4
@.str.53 = private unnamed_addr constant [9 x i8] c"FUNCNAME\00", align 1
@.str.54 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@.str.55 = private unnamed_addr constant [12 x i8] c"BASH_LINENO\00", align 1
@.str.56 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.57 = private unnamed_addr constant [31 x i8] c"%s: cannot execute binary file\00", align 1
@expand_aliases = external global i32, align 4
@enable_history_list = external global i32, align 4
@.str.58 = private unnamed_addr constant [5 x i8] c"bash\00", align 1
@.str.59 = private unnamed_addr constant [9 x i8] c"??host??\00", align 1
@jobs_m_flag = external global i32, align 4
@.str.60 = private unnamed_addr constant [9 x i8] c"\5Cs-\5Cv\5C$ \00", align 1
@primary_prompt = external global i8*, align 4
@.str.61 = private unnamed_addr constant [3 x i8] c"> \00", align 1
@secondary_prompt = external global i8*, align 4
@line_number = external global i32, align 4
@running_in_background = external global i32, align 4
@subshell_environment = external global i32, align 4
@shell_variables = external global %struct.var_context*, align 4
@shell_functions = external global %struct.hash_table*, align 4
@.str.62 = private unnamed_addr constant [27 x i8] c"GNU bash, version %s-(%s)\0A\00", align 1
@.str.63 = private unnamed_addr constant [25 x i8] c"x86_64-unknown-linux-gnu\00", align 1
@.str.64 = private unnamed_addr constant [89 x i8] c"Usage:\09%s [GNU long option] [option] ...\0A\09%s [GNU long option] [option] script-file ...\0A\00", align 1
@.str.65 = private unnamed_addr constant [19 x i8] c"GNU long options:\0A\00", align 1
@.str.66 = private unnamed_addr constant [7 x i8] c"\09--%s\0A\00", align 1
@.str.67 = private unnamed_addr constant [16 x i8] c"Shell options:\0A\00", align 1
@.str.68 = private unnamed_addr constant [61 x i8] c"\09-ilrsD or -c command or -O shopt_option\09\09(invocation only)\0A\00", align 1
@shell_builtins = external global %struct.builtin*, align 4
@.str.69 = private unnamed_addr constant [4 x i8] c"set\00", align 1
@.str.70 = private unnamed_addr constant [19 x i8] c"\09-%s or -o option\0A\00", align 1
@.str.71 = private unnamed_addr constant [67 x i8] c"Type `%s -c \22help set\22' for more information about shell options.\0A\00", align 1
@.str.72 = private unnamed_addr constant [70 x i8] c"Type `%s -c help' for more information about shell builtin commands.\0A\00", align 1
@.str.73 = private unnamed_addr constant [43 x i8] c"Use the `bashbug' command to report bugs.\0A\00", align 1
@.str.74 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.75 = private unnamed_addr constant [52 x i8] c"bash home page: <http://www.gnu.org/software/bash>\0A\00", align 1
@.str.76 = private unnamed_addr constant [64 x i8] c"General help using GNU software: <http://www.gnu.org/gethelp/>\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @main(i32 %argc, i8** %argv, i8** %env) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %env.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  %code = alloca i32, align 4
  %old_errexit_flag = alloca i32, align 4
  %saverst = alloca i32, align 4
  %locally_skip_execution = alloca i32, align 4
  %arg_index = alloca i32, align 4
  %top_level_arg_index = alloca i32, align 4
  %term = alloca i8*, align 4
  %emacs = alloca i8*, align 4
  %inside_emacs = alloca i8*, align 4
  %emacs_term = alloca i32, align 4
  %in_emacs = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i8** %env, i8*** %env.addr, align 4
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #5
  store i32 %call, i32* %code, align 4
  %0 = load i32, i32* %code, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 2) #6
  unreachable

if.end:                                           ; preds = %entry
  call void @xtrace_init()
  call void @check_dev_tty()
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* @debugging_login_shell, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call2 = call i32 @sleep(i32 3)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @set_default_locale()
  %call3 = call i32 @uidget()
  store i32 %call3, i32* @running_setuid, align 4
  %call4 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0))
  %tobool5 = icmp ne i8* %call4, null
  br i1 %tobool5, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %call6 = call i8* @getenv(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0))
  %tobool7 = icmp ne i8* %call6, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %while.end
  store i32 1, i32* @posixly_correct, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %lor.lhs.false
  %call10 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @subshell_top_level, i32 0, i32 0)) #5
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  %2 = load i32, i32* @subshell_argc, align 4
  store i32 %2, i32* %argc.addr, align 4
  %3 = load i8**, i8*** @subshell_argv, align 4
  store i8** %3, i8*** %argv.addr, align 4
  %4 = load i8**, i8*** @subshell_envp, align 4
  store i8** %4, i8*** %env.addr, align 4
  store i32 0, i32* @sourced_env, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end9
  store i32 0, i32* @shell_reinitialized, align 4
  store volatile i32 1, i32* %arg_index, align 4
  %5 = load volatile i32, i32* %arg_index, align 4
  %6 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %5, %6
  br i1 %cmp, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end13
  %7 = load i32, i32* %argc.addr, align 4
  store volatile i32 %7, i32* %arg_index, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end13
  store i8* null, i8** @command_execution_string, align 4
  store i32 0, i32* @read_from_stdin, align 4
  store volatile i32 0, i32* %locally_skip_execution, align 4
  store i32 0, i32* @want_pending_command, align 4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  store %struct._IO_FILE* %8, %struct._IO_FILE** @default_input, align 4
  store i32 -1, i32* @default_buffered_input, align 4
  store i32 0, i32* @make_login_shell, align 4
  store i32 0, i32* @login_shell, align 4
  %9 = load i32, i32* @shell_initialized, align 4
  %tobool16 = icmp ne i32 %9, 0
  br i1 %tobool16, label %if.then19, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.end15
  %10 = load i8*, i8** @shell_name, align 4
  %tobool18 = icmp ne i8* %10, null
  br i1 %tobool18, label %if.then19, label %if.end28

if.then19:                                        ; preds = %lor.lhs.false17, %if.end15
  %11 = load i8*, i8** @shell_name, align 4
  %12 = load i8, i8* %11, align 1
  %conv = sext i8 %12 to i32
  %cmp20 = icmp eq i32 %conv, 45
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.then19
  %13 = load i8*, i8** @shell_name, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr, i8** @shell_name, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.then19
  call void @shell_reinitialize()
  %call24 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #5
  %tobool25 = icmp ne i32 %call24, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end23
  call void @exit(i32 2) #6
  unreachable

if.end27:                                         ; preds = %if.end23
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %lor.lhs.false17
  %14 = load i8**, i8*** %env.addr, align 4
  store i8** %14, i8*** @shell_environment, align 4
  %15 = load i8**, i8*** %argv.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %15, i32 0
  %16 = load i8*, i8** %arrayidx, align 4
  call void @set_shell_name(i8* %16)
  %call29 = call i32 @time(i32* null)
  store i32 %call29, i32* @shell_start_time, align 4
  %17 = load i8**, i8*** %argv.addr, align 4
  %18 = load volatile i32, i32* %arg_index, align 4
  %19 = load i32, i32* %argc.addr, align 4
  %call30 = call i32 @parse_long_options(i8** %17, i32 %18, i32 %19)
  store volatile i32 %call30, i32* %arg_index, align 4
  %20 = load i32, i32* @want_initial_help, align 4
  %tobool31 = icmp ne i32 %20, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end28
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @show_shell_usage(%struct._IO_FILE* %21, i32 1)
  call void @exit(i32 0) #6
  unreachable

if.end33:                                         ; preds = %if.end28
  %22 = load i32, i32* @do_version, align 4
  %tobool34 = icmp ne i32 %22, 0
  br i1 %tobool34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end33
  call void @show_shell_version(i32 1)
  call void @exit(i32 0) #6
  unreachable

if.end36:                                         ; preds = %if.end33
  %23 = load i32, i32* @verbose_flag, align 4
  store i32 %23, i32* @echo_input_at_read, align 4
  %24 = load i8*, i8** @shell_name, align 4
  store i8* %24, i8** @this_command_name, align 4
  %25 = load i8**, i8*** %argv.addr, align 4
  %26 = load volatile i32, i32* %arg_index, align 4
  %27 = load i32, i32* %argc.addr, align 4
  %call37 = call i32 @parse_shell_options(i8** %25, i32 %26, i32 %27)
  store volatile i32 %call37, i32* %arg_index, align 4
  %28 = load i32, i32* @make_login_shell, align 4
  %tobool38 = icmp ne i32 %28, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  %29 = load i32, i32* @login_shell, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* @login_shell, align 4
  %30 = load i32, i32* @login_shell, align 4
  %sub = sub nsw i32 0, %30
  store i32 %sub, i32* @login_shell, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.end36
  %31 = load i32, i32* @login_shell, align 4
  %cmp41 = icmp ne i32 %31, 0
  %conv42 = zext i1 %cmp41 to i32
  %call43 = call i32 @set_login_shell(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 %conv42)
  %32 = load i32, i32* @dump_po_strings, align 4
  %tobool44 = icmp ne i32 %32, 0
  br i1 %tobool44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end40
  store i32 1, i32* @dump_translatable_strings, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %if.end40
  %33 = load i32, i32* @dump_translatable_strings, align 4
  %tobool47 = icmp ne i32 %33, 0
  br i1 %tobool47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end46
  store i32 1, i32* @read_but_dont_execute, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %if.end46
  %34 = load i32, i32* @running_setuid, align 4
  %tobool50 = icmp ne i32 %34, 0
  br i1 %tobool50, label %land.lhs.true, label %if.end54

land.lhs.true:                                    ; preds = %if.end49
  %35 = load i32, i32* @privileged_mode, align 4
  %cmp51 = icmp eq i32 %35, 0
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %land.lhs.true
  call void @disable_priv_mode()
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %land.lhs.true, %if.end49
  %36 = load i32, i32* @want_pending_command, align 4
  %tobool55 = icmp ne i32 %36, 0
  br i1 %tobool55, label %if.then56, label %if.end64

if.then56:                                        ; preds = %if.end54
  %37 = load i8**, i8*** %argv.addr, align 4
  %38 = load volatile i32, i32* %arg_index, align 4
  %arrayidx57 = getelementptr inbounds i8*, i8** %37, i32 %38
  %39 = load i8*, i8** %arrayidx57, align 4
  store i8* %39, i8** @command_execution_string, align 4
  %40 = load i8*, i8** @command_execution_string, align 4
  %cmp58 = icmp eq i8* %40, null
  br i1 %cmp58, label %if.then60, label %if.end62

if.then60:                                        ; preds = %if.then56
  %call61 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i32 0, i32 0))
  call void (i8*, ...) @report_error(i8* %call61, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 2) #6
  unreachable

if.end62:                                         ; preds = %if.then56
  %41 = load volatile i32, i32* %arg_index, align 4
  %inc63 = add nsw i32 %41, 1
  store volatile i32 %inc63, i32* %arg_index, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.end62, %if.end54
  store i8* null, i8** @this_command_name, align 4
  %42 = load i32, i32* @forced_interactive, align 4
  %tobool65 = icmp ne i32 %42, 0
  br i1 %tobool65, label %if.then84, label %lor.lhs.false66

lor.lhs.false66:                                  ; preds = %if.end64
  %43 = load i8*, i8** @command_execution_string, align 4
  %tobool67 = icmp ne i8* %43, null
  br i1 %tobool67, label %if.else, label %land.lhs.true68

land.lhs.true68:                                  ; preds = %lor.lhs.false66
  %44 = load i32, i32* @wordexp_only, align 4
  %cmp69 = icmp eq i32 %44, 0
  br i1 %cmp69, label %land.lhs.true71, label %if.else

land.lhs.true71:                                  ; preds = %land.lhs.true68
  %45 = load volatile i32, i32* %arg_index, align 4
  %46 = load i32, i32* %argc.addr, align 4
  %cmp72 = icmp eq i32 %45, %46
  br i1 %cmp72, label %land.lhs.true76, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %land.lhs.true71
  %47 = load i32, i32* @read_from_stdin, align 4
  %tobool75 = icmp ne i32 %47, 0
  br i1 %tobool75, label %land.lhs.true76, label %if.else

land.lhs.true76:                                  ; preds = %lor.lhs.false74, %land.lhs.true71
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call77 = call i32 @fileno(%struct._IO_FILE* %48)
  %call78 = call i32 @isatty(i32 %call77)
  %tobool79 = icmp ne i32 %call78, 0
  br i1 %tobool79, label %land.lhs.true80, label %if.else

land.lhs.true80:                                  ; preds = %land.lhs.true76
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call81 = call i32 @fileno(%struct._IO_FILE* %49)
  %call82 = call i32 @isatty(i32 %call81)
  %tobool83 = icmp ne i32 %call82, 0
  br i1 %tobool83, label %if.then84, label %if.else

if.then84:                                        ; preds = %land.lhs.true80, %if.end64
  call void @init_interactive()
  br label %if.end85

if.else:                                          ; preds = %land.lhs.true80, %land.lhs.true76, %lor.lhs.false74, %land.lhs.true68, %lor.lhs.false66
  call void @init_noninteractive()
  br label %if.end85

if.end85:                                         ; preds = %if.else, %if.then84
  %50 = load i32, i32* @login_shell, align 4
  %tobool86 = icmp ne i32 %50, 0
  br i1 %tobool86, label %land.lhs.true87, label %if.end94

land.lhs.true87:                                  ; preds = %if.end85
  %51 = load i32, i32* @interactive_shell, align 4
  %tobool88 = icmp ne i32 %51, 0
  br i1 %tobool88, label %if.then89, label %if.end94

if.then89:                                        ; preds = %land.lhs.true87
  store i32 3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then89
  %52 = load i32, i32* %i, align 4
  %cmp90 = icmp slt i32 %52, 20
  br i1 %cmp90, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %53 = load i32, i32* %i, align 4
  %call92 = call i32 (i32, i32, ...) @fcntl(i32 %53, i32 2, i32 1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %54 = load i32, i32* %i, align 4
  %inc93 = add nsw i32 %54, 1
  store i32 %inc93, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end94

if.end94:                                         ; preds = %for.end, %land.lhs.true87, %if.end85
  %55 = load i32, i32* @posixly_correct, align 4
  %tobool95 = icmp ne i32 %55, 0
  br i1 %tobool95, label %if.then96, label %if.end98

if.then96:                                        ; preds = %if.end94
  %call97 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i32 0)
  call void @sv_strict_posix(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0))
  br label %if.end98

if.end98:                                         ; preds = %if.then96, %if.end94
  %56 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %tobool99 = icmp ne %struct.STRING_INT_ALIST* %56, null
  br i1 %tobool99, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.end98
  call void @run_shopt_alist()
  br label %if.end101

if.end101:                                        ; preds = %if.then100, %if.end98
  call void @shell_initialize()
  call void @set_default_lang()
  call void @set_default_locale_vars()
  %57 = load i32, i32* @interactive_shell, align 4
  %tobool102 = icmp ne i32 %57, 0
  br i1 %tobool102, label %if.then103, label %if.end189

if.then103:                                       ; preds = %if.end101
  %call104 = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call104, i8** %term, align 4
  %call105 = call i8* @get_string_value(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  store i8* %call105, i8** %emacs, align 4
  %call106 = call i8* @get_string_value(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i32 0, i32 0))
  store i8* %call106, i8** %inside_emacs, align 4
  %58 = load i8*, i8** %inside_emacs, align 4
  %tobool107 = icmp ne i8* %58, null
  br i1 %tobool107, label %if.then108, label %if.else112

if.then108:                                       ; preds = %if.then103
  %59 = load i8*, i8** %inside_emacs, align 4
  %call109 = call i8* @strstr(i8* %59, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0))
  %cmp110 = icmp ne i8* %call109, null
  %conv111 = zext i1 %cmp110 to i32
  store i32 %conv111, i32* %emacs_term, align 4
  store i32 1, i32* %in_emacs, align 4
  br label %if.end129

if.else112:                                       ; preds = %if.then103
  %60 = load i8*, i8** %emacs, align 4
  %tobool113 = icmp ne i8* %60, null
  br i1 %tobool113, label %if.then114, label %if.else127

if.then114:                                       ; preds = %if.else112
  %61 = load i8*, i8** %emacs, align 4
  %call115 = call i8* @strstr(i8* %61, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0))
  %cmp116 = icmp ne i8* %call115, null
  %conv117 = zext i1 %cmp116 to i32
  store i32 %conv117, i32* %emacs_term, align 4
  %62 = load i32, i32* %emacs_term, align 4
  %tobool118 = icmp ne i32 %62, 0
  br i1 %tobool118, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then114
  %63 = load i8*, i8** %emacs, align 4
  %arrayidx119 = getelementptr inbounds i8, i8* %63, i32 0
  %64 = load i8, i8* %arrayidx119, align 1
  %conv120 = sext i8 %64 to i32
  %65 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), align 1
  %conv121 = sext i8 %65 to i32
  %cmp122 = icmp eq i32 %conv120, %conv121
  br i1 %cmp122, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %66 = load i8*, i8** %emacs, align 4
  %call124 = call i32 @strcmp(i8* %66, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  %cmp125 = icmp eq i32 %call124, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %67 = phi i1 [ false, %lor.rhs ], [ %cmp125, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %if.then114
  %68 = phi i1 [ true, %if.then114 ], [ %67, %land.end ]
  %lor.ext = zext i1 %68 to i32
  store i32 %lor.ext, i32* %in_emacs, align 4
  br label %if.end128

if.else127:                                       ; preds = %if.else112
  store i32 0, i32* %emacs_term, align 4
  store i32 0, i32* %in_emacs, align 4
  br label %if.end128

if.end128:                                        ; preds = %if.else127, %lor.end
  br label %if.end129

if.end129:                                        ; preds = %if.end128, %if.then108
  %69 = load i8*, i8** %term, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %69, i32 0
  %70 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %70 to i32
  %71 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), align 1
  %conv132 = sext i8 %71 to i32
  %cmp133 = icmp eq i32 %conv131, %conv132
  br i1 %cmp133, label %land.rhs135, label %land.end139

land.rhs135:                                      ; preds = %if.end129
  %72 = load i8*, i8** %term, align 4
  %call136 = call i32 @strcmp(i8* %72, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0))
  %cmp137 = icmp eq i32 %call136, 0
  br label %land.end139

land.end139:                                      ; preds = %land.rhs135, %if.end129
  %73 = phi i1 [ false, %if.end129 ], [ %cmp137, %land.rhs135 ]
  %land.ext = zext i1 %73 to i32
  %74 = load i32, i32* @no_line_editing, align 4
  %or = or i32 %74, %land.ext
  store i32 %or, i32* @no_line_editing, align 4
  %75 = load i32, i32* %in_emacs, align 4
  %tobool140 = icmp ne i32 %75, 0
  br i1 %tobool140, label %land.rhs141, label %land.end153

land.rhs141:                                      ; preds = %land.end139
  %76 = load i8*, i8** %term, align 4
  %arrayidx142 = getelementptr inbounds i8, i8* %76, i32 0
  %77 = load i8, i8* %arrayidx142, align 1
  %conv143 = sext i8 %77 to i32
  %78 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), align 1
  %conv144 = sext i8 %78 to i32
  %cmp145 = icmp eq i32 %conv143, %conv144
  br i1 %cmp145, label %land.rhs147, label %land.end151

land.rhs147:                                      ; preds = %land.rhs141
  %79 = load i8*, i8** %term, align 4
  %call148 = call i32 @strcmp(i8* %79, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  %cmp149 = icmp eq i32 %call148, 0
  br label %land.end151

land.end151:                                      ; preds = %land.rhs147, %land.rhs141
  %80 = phi i1 [ false, %land.rhs141 ], [ %cmp149, %land.rhs147 ]
  br label %land.end153

land.end153:                                      ; preds = %land.end151, %land.end139
  %81 = phi i1 [ false, %land.end139 ], [ %80, %land.end151 ]
  %land.ext154 = zext i1 %81 to i32
  %82 = load i32, i32* @no_line_editing, align 4
  %or155 = or i32 %82, %land.ext154
  store i32 %or155, i32* @no_line_editing, align 4
  %83 = load i32, i32* %in_emacs, align 4
  %tobool156 = icmp ne i32 %83, 0
  br i1 %tobool156, label %lor.end169, label %lor.rhs157

lor.rhs157:                                       ; preds = %land.end153
  %84 = load i8*, i8** %term, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %84, i32 0
  %85 = load i8, i8* %arrayidx158, align 1
  %conv159 = sext i8 %85 to i32
  %86 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), align 1
  %conv160 = sext i8 %86 to i32
  %cmp161 = icmp eq i32 %conv159, %conv160
  br i1 %cmp161, label %land.rhs163, label %land.end167

land.rhs163:                                      ; preds = %lor.rhs157
  %87 = load i8*, i8** %term, align 4
  %call164 = call i32 @strncmp(i8* %87, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i32 5)
  %cmp165 = icmp eq i32 %call164, 0
  br label %land.end167

land.end167:                                      ; preds = %land.rhs163, %lor.rhs157
  %88 = phi i1 [ false, %lor.rhs157 ], [ %cmp165, %land.rhs163 ]
  br label %lor.end169

lor.end169:                                       ; preds = %land.end167, %land.end153
  %89 = phi i1 [ true, %land.end153 ], [ %88, %land.end167 ]
  %lor.ext170 = zext i1 %89 to i32
  store i32 %lor.ext170, i32* @running_under_emacs, align 4
  %90 = load i32, i32* %emacs_term, align 4
  %tobool171 = icmp ne i32 %90, 0
  br i1 %tobool171, label %land.rhs172, label %land.end184

land.rhs172:                                      ; preds = %lor.end169
  %91 = load i8*, i8** %term, align 4
  %arrayidx173 = getelementptr inbounds i8, i8* %91, i32 0
  %92 = load i8, i8* %arrayidx173, align 1
  %conv174 = sext i8 %92 to i32
  %93 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), align 1
  %conv175 = sext i8 %93 to i32
  %cmp176 = icmp eq i32 %conv174, %conv175
  br i1 %cmp176, label %land.rhs178, label %land.end182

land.rhs178:                                      ; preds = %land.rhs172
  %94 = load i8*, i8** %term, align 4
  %call179 = call i32 @strncmp(i8* %94, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0), i32 5)
  %cmp180 = icmp eq i32 %call179, 0
  br label %land.end182

land.end182:                                      ; preds = %land.rhs178, %land.rhs172
  %95 = phi i1 [ false, %land.rhs172 ], [ %cmp180, %land.rhs178 ]
  br label %land.end184

land.end184:                                      ; preds = %land.end182, %lor.end169
  %96 = phi i1 [ false, %lor.end169 ], [ %95, %land.end182 ]
  %land.ext185 = zext i1 %96 to i32
  %97 = load i32, i32* @running_under_emacs, align 4
  %add = add nsw i32 %97, %land.ext185
  store i32 %add, i32* @running_under_emacs, align 4
  %98 = load i32, i32* @running_under_emacs, align 4
  %tobool186 = icmp ne i32 %98, 0
  br i1 %tobool186, label %if.then187, label %if.end188

if.then187:                                       ; preds = %land.end184
  store i32 1, i32* @gnu_error_format, align 4
  br label %if.end188

if.end188:                                        ; preds = %if.then187, %land.end184
  br label %if.end189

if.end189:                                        ; preds = %if.end188, %if.end101
  %99 = load volatile i32, i32* %arg_index, align 4
  store volatile i32 %99, i32* %top_level_arg_index, align 4
  %100 = load i32, i32* @exit_immediately_on_error, align 4
  store i32 %100, i32* %old_errexit_flag, align 4
  %call190 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #5
  store i32 %call190, i32* %code, align 4
  %101 = load i32, i32* %code, align 4
  %tobool191 = icmp ne i32 %101, 0
  br i1 %tobool191, label %if.then192, label %if.end203

if.then192:                                       ; preds = %if.end189
  %102 = load i32, i32* %code, align 4
  %cmp193 = icmp eq i32 %102, 3
  br i1 %cmp193, label %if.then198, label %lor.lhs.false195

lor.lhs.false195:                                 ; preds = %if.then192
  %103 = load i32, i32* %code, align 4
  %cmp196 = icmp eq i32 %103, 4
  br i1 %cmp196, label %if.then198, label %if.else199

if.then198:                                       ; preds = %lor.lhs.false195, %if.then192
  %104 = load i32, i32* @last_command_exit_value, align 4
  call void @exit_shell(i32 %104) #6
  unreachable

if.else199:                                       ; preds = %lor.lhs.false195
  %105 = load i32, i32* %old_errexit_flag, align 4
  %106 = load i32, i32* @exit_immediately_on_error, align 4
  %add200 = add nsw i32 %106, %105
  store i32 %add200, i32* @exit_immediately_on_error, align 4
  %107 = load volatile i32, i32* %locally_skip_execution, align 4
  %inc201 = add nsw i32 %107, 1
  store volatile i32 %inc201, i32* %locally_skip_execution, align 4
  br label %if.end202

if.end202:                                        ; preds = %if.else199
  br label %if.end203

if.end203:                                        ; preds = %if.end202, %if.end189
  %108 = load volatile i32, i32* %top_level_arg_index, align 4
  store volatile i32 %108, i32* %arg_index, align 4
  %109 = load i32, i32* @interactive_shell, align 4
  %cmp204 = icmp eq i32 %109, 0
  br i1 %cmp204, label %if.then206, label %if.else209

if.then206:                                       ; preds = %if.end203
  %call207 = call i32 @unbind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0))
  %call208 = call i32 @unbind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0))
  store i32 0, i32* @interactive, align 4
  br label %if.end211

if.else209:                                       ; preds = %if.end203
  %call210 = call i32 @change_flag(i32 105, i32 45)
  store i32 1, i32* @interactive, align 4
  br label %if.end211

if.end211:                                        ; preds = %if.else209, %if.then206
  %110 = load i8*, i8** @shell_name, align 4
  %call212 = call i32 @shell_is_restricted(i8* %110)
  store i32 %call212, i32* @restricted_shell, align 4
  %111 = load i32, i32* @restricted, align 4
  store i32 %111, i32* %saverst, align 4
  store i32 0, i32* @restricted, align 4
  %112 = load volatile i32, i32* %locally_skip_execution, align 4
  %cmp213 = icmp eq i32 %112, 0
  br i1 %cmp213, label %land.lhs.true215, label %if.end220

land.lhs.true215:                                 ; preds = %if.end211
  %113 = load i32, i32* @running_setuid, align 4
  %cmp216 = icmp eq i32 %113, 0
  br i1 %cmp216, label %if.then218, label %if.end220

if.then218:                                       ; preds = %land.lhs.true215
  %114 = load i32, i32* @exit_immediately_on_error, align 4
  store i32 %114, i32* %old_errexit_flag, align 4
  store i32 0, i32* @exit_immediately_on_error, align 4
  call void @run_startup_files()
  %115 = load i32, i32* %old_errexit_flag, align 4
  %116 = load i32, i32* @exit_immediately_on_error, align 4
  %add219 = add nsw i32 %116, %115
  store i32 %add219, i32* @exit_immediately_on_error, align 4
  br label %if.end220

if.end220:                                        ; preds = %if.then218, %land.lhs.true215, %if.end211
  %117 = load i32, i32* @act_like_sh, align 4
  %tobool221 = icmp ne i32 %117, 0
  br i1 %tobool221, label %if.then222, label %if.end224

if.then222:                                       ; preds = %if.end220
  %call223 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i32 0)
  call void @sv_strict_posix(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0))
  br label %if.end224

if.end224:                                        ; preds = %if.then222, %if.end220
  %118 = load i32, i32* %saverst, align 4
  %tobool225 = icmp ne i32 %118, 0
  br i1 %tobool225, label %lor.end228, label %lor.rhs226

lor.rhs226:                                       ; preds = %if.end224
  %119 = load i32, i32* @restricted, align 4
  %tobool227 = icmp ne i32 %119, 0
  br label %lor.end228

lor.end228:                                       ; preds = %lor.rhs226, %if.end224
  %120 = phi i1 [ true, %if.end224 ], [ %tobool227, %lor.rhs226 ]
  %lor.ext229 = zext i1 %120 to i32
  store i32 %lor.ext229, i32* @restricted, align 4
  %121 = load i32, i32* @shell_reinitialized, align 4
  %cmp230 = icmp eq i32 %121, 0
  br i1 %cmp230, label %if.then232, label %if.end234

if.then232:                                       ; preds = %lor.end228
  %122 = load i8*, i8** @shell_name, align 4
  %call233 = call i32 @maybe_make_restricted(i8* %122)
  br label %if.end234

if.end234:                                        ; preds = %if.then232, %lor.end228
  call void @cmd_init()
  call void @uwp_init()
  %123 = load i8*, i8** @command_execution_string, align 4
  %tobool235 = icmp ne i8* %123, null
  br i1 %tobool235, label %if.then236, label %if.end242

if.then236:                                       ; preds = %if.end234
  %124 = load i8**, i8*** %argv.addr, align 4
  %125 = load volatile i32, i32* %arg_index, align 4
  %126 = load i32, i32* %argc.addr, align 4
  %call237 = call i32 @bind_args(i8** %124, i32 %125, i32 %126, i32 0)
  store volatile i32 %call237, i32* %arg_index, align 4
  store i32 2, i32* @startup_state, align 4
  %127 = load i32, i32* @debugging_mode, align 4
  %tobool238 = icmp ne i32 %127, 0
  br i1 %tobool238, label %if.then239, label %if.end240

if.then239:                                       ; preds = %if.then236
  call void @start_debugger()
  br label %if.end240

if.end240:                                        ; preds = %if.then239, %if.then236
  store i32 1, i32* @executing, align 4
  %128 = load i8*, i8** @command_execution_string, align 4
  %call241 = call i32 @run_one_command(i8* %128)
  %129 = load i32, i32* @last_command_exit_value, align 4
  call void @exit_shell(i32 %129) #6
  unreachable

if.end242:                                        ; preds = %if.end234
  %130 = load volatile i32, i32* %arg_index, align 4
  %131 = load i32, i32* %argc.addr, align 4
  %cmp243 = icmp ne i32 %130, %131
  br i1 %cmp243, label %land.lhs.true245, label %if.else252

land.lhs.true245:                                 ; preds = %if.end242
  %132 = load i32, i32* @read_from_stdin, align 4
  %cmp246 = icmp eq i32 %132, 0
  br i1 %cmp246, label %if.then248, label %if.else252

if.then248:                                       ; preds = %land.lhs.true245
  %133 = load i8**, i8*** %argv.addr, align 4
  %134 = load volatile i32, i32* %arg_index, align 4
  %arrayidx249 = getelementptr inbounds i8*, i8** %133, i32 %134
  %135 = load i8*, i8** %arrayidx249, align 4
  %call250 = call i32 @open_shell_script(i8* %135)
  %136 = load volatile i32, i32* %arg_index, align 4
  %inc251 = add nsw i32 %136, 1
  store volatile i32 %inc251, i32* %arg_index, align 4
  br label %if.end263

if.else252:                                       ; preds = %land.lhs.true245, %if.end242
  %137 = load i32, i32* @interactive, align 4
  %cmp253 = icmp eq i32 %137, 0
  br i1 %cmp253, label %if.then255, label %if.else257

if.then255:                                       ; preds = %if.else252
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call256 = call i32 @fileno(%struct._IO_FILE* %138)
  store i32 %call256, i32* @default_buffered_input, align 4
  store i32 1, i32* @read_from_stdin, align 4
  br label %if.end262

if.else257:                                       ; preds = %if.else252
  %139 = load volatile i32, i32* %arg_index, align 4
  %140 = load i32, i32* %argc.addr, align 4
  %cmp258 = icmp eq i32 %139, %140
  br i1 %cmp258, label %if.then260, label %if.end261

if.then260:                                       ; preds = %if.else257
  store i32 1, i32* @read_from_stdin, align 4
  br label %if.end261

if.end261:                                        ; preds = %if.then260, %if.else257
  br label %if.end262

if.end262:                                        ; preds = %if.end261, %if.then255
  br label %if.end263

if.end263:                                        ; preds = %if.end262, %if.then248
  call void @set_bash_input()
  %141 = load i8**, i8*** %argv.addr, align 4
  %142 = load volatile i32, i32* %arg_index, align 4
  %143 = load i32, i32* %argc.addr, align 4
  %call264 = call i32 @bind_args(i8** %141, i32 %142, i32 %143, i32 1)
  store volatile i32 %call264, i32* %arg_index, align 4
  %144 = load i32, i32* @debugging_mode, align 4
  %tobool265 = icmp ne i32 %144, 0
  br i1 %tobool265, label %land.lhs.true266, label %if.end278

land.lhs.true266:                                 ; preds = %if.end263
  %145 = load volatile i32, i32* %locally_skip_execution, align 4
  %cmp267 = icmp eq i32 %145, 0
  br i1 %cmp267, label %land.lhs.true269, label %if.end278

land.lhs.true269:                                 ; preds = %land.lhs.true266
  %146 = load i32, i32* @running_setuid, align 4
  %cmp270 = icmp eq i32 %146, 0
  br i1 %cmp270, label %land.lhs.true272, label %if.end278

land.lhs.true272:                                 ; preds = %land.lhs.true269
  %147 = load i32, i32* @reading_shell_script, align 4
  %tobool273 = icmp ne i32 %147, 0
  br i1 %tobool273, label %if.then277, label %lor.lhs.false274

lor.lhs.false274:                                 ; preds = %land.lhs.true272
  %148 = load i32, i32* @interactive_shell, align 4
  %cmp275 = icmp eq i32 %148, 0
  br i1 %cmp275, label %if.then277, label %if.end278

if.then277:                                       ; preds = %lor.lhs.false274, %land.lhs.true272
  call void @start_debugger()
  br label %if.end278

if.end278:                                        ; preds = %if.then277, %lor.lhs.false274, %land.lhs.true269, %land.lhs.true266, %if.end263
  %149 = load i32, i32* @interactive_shell, align 4
  %tobool279 = icmp ne i32 %149, 0
  br i1 %tobool279, label %if.then280, label %if.end289

if.then280:                                       ; preds = %if.end278
  call void @reset_mail_timer()
  call void @init_mail_dates()
  call void @bash_initialize_history()
  %150 = load i32, i32* @shell_initialized, align 4
  %cmp281 = icmp eq i32 %150, 0
  br i1 %cmp281, label %land.lhs.true283, label %if.end287

land.lhs.true283:                                 ; preds = %if.then280
  %151 = load i32, i32* @history_lines_this_session, align 4
  %cmp284 = icmp eq i32 %151, 0
  br i1 %cmp284, label %if.then286, label %if.end287

if.then286:                                       ; preds = %land.lhs.true283
  call void @load_history()
  br label %if.end287

if.end287:                                        ; preds = %if.then286, %land.lhs.true283, %if.then280
  %call288 = call i32 @get_tty_state()
  br label %if.end289

if.end289:                                        ; preds = %if.end287, %if.end278
  store i32 1, i32* @shell_initialized, align 4
  %call290 = call i32 @reader_loop()
  %152 = load i32, i32* @last_command_exit_value, align 4
  call void @exit_shell(i32 %152) #6
  unreachable

return:                                           ; No predecessors!
  %153 = load i32, i32* %retval, align 4
  ret i32 %153
}

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare void @xtrace_init() #3

declare void @check_dev_tty() #3

declare i32 @sleep(i32) #3

declare void @set_default_locale() #3

; Function Attrs: noinline nounwind
define internal i32 @uidget() #0 {
entry:
  %u = alloca i32, align 4
  %call = call i32 @getuid()
  store i32 %call, i32* %u, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %1 = load i32, i32* %u, align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end12

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %2 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %3 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1259)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %4 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %tobool3 = icmp ne i8* %4, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %do.body2
  %5 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1260)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %do.body2
  br label %do.end6

do.end6:                                          ; preds = %if.end5
  br label %do.body7

do.body7:                                         ; preds = %do.end6
  %6 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  %tobool8 = icmp ne i8* %6, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body7
  %7 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1261)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body7
  br label %do.end11

do.end11:                                         ; preds = %if.end10
  store i8* null, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  store i8* null, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  store i8* null, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  br label %if.end12

if.end12:                                         ; preds = %do.end11, %entry
  %8 = load i32, i32* %u, align 4
  store i32 %8, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %call13 = call i32 @getgid()
  store i32 %call13, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %call14 = call i32 @geteuid()
  store i32 %call14, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %call15 = call i32 @getegid()
  store i32 %call15, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %9 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %10 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp16 = icmp ne i32 %9, %10
  br i1 %cmp16, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end12
  %11 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %12 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %cmp17 = icmp ne i32 %11, %12
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end12
  %13 = phi i1 [ true, %if.end12 ], [ %cmp17, %lor.rhs ]
  %lor.ext = zext i1 %13 to i32
  ret i32 %lor.ext
}

declare i8* @getenv(i8*) #3

; Function Attrs: noinline nounwind
define internal void @shell_reinitialize() #0 {
entry:
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0), i8** @primary_prompt, align 4
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.61, i32 0, i32 0), i8** @secondary_prompt, align 4
  store i32 1, i32* @current_command_number, align 4
  store i32 1, i32* @no_profile, align 4
  store i32 1, i32* @no_rc, align 4
  store i32 0, i32* @executing, align 4
  store i32 0, i32* @interactive, align 4
  store i32 0, i32* @make_login_shell, align 4
  store i32 0, i32* @login_shell, align 4
  store i32 0, i32* @last_command_exit_value, align 4
  store i32 0, i32* @line_number, align 4
  store i32 0, i32* @do_version, align 4
  store i32 0, i32* @debugging, align 4
  store i32 0, i32* @interactive_shell, align 4
  store i32 0, i32* @forced_interactive, align 4
  store i32 0, i32* @running_in_background, align 4
  store i32 0, i32* @subshell_environment, align 4
  store i32 0, i32* @expand_aliases, align 4
  store i32 0, i32* @enable_history_list, align 4
  call void @bash_history_reinit(i32 0)
  store i32 0, i32* @restricted, align 4
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.44, i32 0, i32 0), i8** @bashrc_file, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  call void @delete_all_contexts(%struct.var_context* %0)
  %1 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  call void @delete_all_variables(%struct.hash_table* %1)
  call void @reinit_special_variables()
  call void @bashline_reinitialize()
  store i32 1, i32* @shell_reinitialized, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @set_shell_name(i8* %argv0) #0 {
entry:
  %argv0.addr = alloca i8*, align 4
  store i8* %argv0, i8** %argv0.addr, align 4
  %0 = load i8*, i8** %argv0.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %argv0.addr, align 4
  %call = call i8* @base_pathname(i8* %1)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.58, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** @shell_name, align 4
  %2 = load i8*, i8** %argv0.addr, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i8*, i8** %argv0.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** @shell_name, align 4
  %6 = load i8, i8* %5, align 1
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv3, 45
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %7 = load i8*, i8** @shell_name, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** @shell_name, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  store i32 1, i32* @login_shell, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.end, %land.lhs.true, %cond.end
  %8 = load i8*, i8** @shell_name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx, align 1
  %conv8 = sext i8 %9 to i32
  %cmp9 = icmp eq i32 %conv8, 115
  br i1 %cmp9, label %land.lhs.true11, label %if.end22

land.lhs.true11:                                  ; preds = %if.end7
  %10 = load i8*, i8** @shell_name, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %11 to i32
  %cmp14 = icmp eq i32 %conv13, 104
  br i1 %cmp14, label %land.lhs.true16, label %if.end22

land.lhs.true16:                                  ; preds = %land.lhs.true11
  %12 = load i8*, i8** @shell_name, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %12, i32 2
  %13 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %13 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true16
  %14 = load i32, i32* @act_like_sh, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @act_like_sh, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %land.lhs.true16, %land.lhs.true11, %if.end7
  %15 = load i8*, i8** @shell_name, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %16 to i32
  %cmp25 = icmp eq i32 %conv24, 115
  br i1 %cmp25, label %land.lhs.true27, label %if.end39

land.lhs.true27:                                  ; preds = %if.end22
  %17 = load i8*, i8** @shell_name, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %17, i32 1
  %18 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %18 to i32
  %cmp30 = icmp eq i32 %conv29, 117
  br i1 %cmp30, label %land.lhs.true32, label %if.end39

land.lhs.true32:                                  ; preds = %land.lhs.true27
  %19 = load i8*, i8** @shell_name, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %19, i32 2
  %20 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %20 to i32
  %cmp35 = icmp eq i32 %conv34, 0
  br i1 %cmp35, label %if.then37, label %if.end39

if.then37:                                        ; preds = %land.lhs.true32
  %21 = load i32, i32* @su_shell, align 4
  %inc38 = add nsw i32 %21, 1
  store i32 %inc38, i32* @su_shell, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then37, %land.lhs.true32, %land.lhs.true27, %if.end22
  %22 = load i8*, i8** %argv0.addr, align 4
  %tobool40 = icmp ne i8* %22, null
  br i1 %tobool40, label %cond.true41, label %cond.false42

cond.true41:                                      ; preds = %if.end39
  %23 = load i8*, i8** %argv0.addr, align 4
  br label %cond.end43

cond.false42:                                     ; preds = %if.end39
  br label %cond.end43

cond.end43:                                       ; preds = %cond.false42, %cond.true41
  %cond44 = phi i8* [ %23, %cond.true41 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.58, i32 0, i32 0), %cond.false42 ]
  store i8* %cond44, i8** @shell_name, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end43
  %24 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %tobool45 = icmp ne i8* %24, null
  br i1 %tobool45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %do.body
  %25 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1708)
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end47
  %26 = load i8*, i8** @shell_name, align 4
  %call48 = call i32 @strlen(i8* %26)
  %add = add i32 1, %call48
  %call49 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1709)
  %27 = load i8*, i8** @shell_name, align 4
  %call50 = call i8* @strcpy(i8* %call49, i8* %27)
  store i8* %call50, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %28 = load i8*, i8** @shell_name, align 4
  %tobool51 = icmp ne i8* %28, null
  br i1 %tobool51, label %lor.lhs.false, label %if.then61

lor.lhs.false:                                    ; preds = %do.end
  %29 = load i8*, i8** @shell_name, align 4
  %30 = load i8, i8* %29, align 1
  %tobool52 = icmp ne i8 %30, 0
  br i1 %tobool52, label %lor.lhs.false53, label %if.then61

lor.lhs.false53:                                  ; preds = %lor.lhs.false
  %31 = load i8*, i8** @shell_name, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %31, i32 0
  %32 = load i8, i8* %arrayidx54, align 1
  %conv55 = sext i8 %32 to i32
  %cmp56 = icmp eq i32 %conv55, 45
  br i1 %cmp56, label %land.lhs.true58, label %if.end62

land.lhs.true58:                                  ; preds = %lor.lhs.false53
  %33 = load i8*, i8** @shell_name, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %33, i32 1
  %34 = load i8, i8* %arrayidx59, align 1
  %tobool60 = icmp ne i8 %34, 0
  br i1 %tobool60, label %if.end62, label %if.then61

if.then61:                                        ; preds = %land.lhs.true58, %lor.lhs.false, %do.end
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.58, i32 0, i32 0), i8** @shell_name, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then61, %land.lhs.true58, %lor.lhs.false53
  ret void
}

declare i32 @time(i32*) #3

; Function Attrs: noinline nounwind
define internal i32 @parse_long_options(i8** %argv, i32 %arg_start, i32 %arg_end) #0 {
entry:
  %argv.addr = alloca i8**, align 4
  %arg_start.addr = alloca i32, align 4
  %arg_end.addr = alloca i32, align 4
  %arg_index = alloca i32, align 4
  %longarg = alloca i32, align 4
  %i = alloca i32, align 4
  %arg_string = alloca i8*, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i32 %arg_start, i32* %arg_start.addr, align 4
  store i32 %arg_end, i32* %arg_end.addr, align 4
  %0 = load i32, i32* %arg_start.addr, align 4
  store i32 %0, i32* %arg_index, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end57, %entry
  %1 = load i32, i32* %arg_index, align 4
  %2 = load i32, i32* %arg_end.addr, align 4
  %cmp = icmp ne i32 %1, %2
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %3 = load i8**, i8*** %argv.addr, align 4
  %4 = load i32, i32* %arg_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  store i8* %5, i8** %arg_string, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %6 = load i8*, i8** %arg_string, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp1 = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %8 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp1, %land.rhs ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  store i32 0, i32* %longarg, align 4
  %9 = load i8*, i8** %arg_string, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %10 to i32
  %cmp5 = icmp eq i32 %conv4, 45
  br i1 %cmp5, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %while.body
  %11 = load i8*, i8** %arg_string, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %12 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br i1 %tobool10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  store i32 1, i32* %longarg, align 4
  %13 = load i8*, i8** %arg_string, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr, i8** %arg_string, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true7, %while.body
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %14 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %14
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx11, i32 0, i32 0
  %15 = load i8*, i8** %name, align 4
  %tobool12 = icmp ne i8* %15, null
  br i1 %tobool12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i8*, i8** %arg_string, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 1
  %arrayidx13 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %17 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %17 to i32
  %18 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %18
  %name16 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx15, i32 0, i32 0
  %19 = load i8*, i8** %name16, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %20 to i32
  %cmp19 = icmp eq i32 %conv14, %conv18
  br i1 %cmp19, label %land.lhs.true21, label %if.end45

land.lhs.true21:                                  ; preds = %for.body
  %21 = load i8*, i8** %arg_string, align 4
  %add.ptr22 = getelementptr inbounds i8, i8* %21, i32 1
  %22 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %22
  %name24 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx23, i32 0, i32 0
  %23 = load i8*, i8** %name24, align 4
  %call = call i32 @strcmp(i8* %add.ptr22, i8* %23)
  %cmp25 = icmp eq i32 %call, 0
  br i1 %cmp25, label %if.then27, label %if.end45

if.then27:                                        ; preds = %land.lhs.true21
  %24 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %24
  %type = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx28, i32 0, i32 1
  %25 = load i32, i32* %type, align 4
  %cmp29 = icmp eq i32 %25, 1
  br i1 %cmp29, label %if.then31, label %if.else

if.then31:                                        ; preds = %if.then27
  %26 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %26
  %int_value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx32, i32 0, i32 2
  %27 = load i32*, i32** %int_value, align 4
  store i32 1, i32* %27, align 4
  br label %if.end44

if.else:                                          ; preds = %if.then27
  %28 = load i8**, i8*** %argv.addr, align 4
  %29 = load i32, i32* %arg_index, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %arg_index, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %28, i32 %inc
  %30 = load i8*, i8** %arrayidx33, align 4
  %cmp34 = icmp eq i8* %30, null
  br i1 %cmp34, label %if.then36, label %if.else40

if.then36:                                        ; preds = %if.else
  %call37 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i32 0, i32 0))
  %31 = load i32, i32* %i, align 4
  %arrayidx38 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %31
  %name39 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx38, i32 0, i32 0
  %32 = load i8*, i8** %name39, align 4
  call void (i8*, ...) @report_error(i8* %call37, i8* %32)
  call void @exit(i32 2) #6
  unreachable

if.else40:                                        ; preds = %if.else
  %33 = load i8**, i8*** %argv.addr, align 4
  %34 = load i32, i32* %arg_index, align 4
  %arrayidx41 = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx41, align 4
  %36 = load i32, i32* %i, align 4
  %arrayidx42 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %36
  %char_value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx42, i32 0, i32 3
  %37 = load i8**, i8*** %char_value, align 4
  store i8* %35, i8** %37, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.else40
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then31
  br label %for.end

if.end45:                                         ; preds = %land.lhs.true21, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end45
  %38 = load i32, i32* %i, align 4
  %inc46 = add nsw i32 %38, 1
  store i32 %inc46, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.end44, %for.cond
  %39 = load i32, i32* %i, align 4
  %arrayidx47 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %39
  %name48 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx47, i32 0, i32 0
  %40 = load i8*, i8** %name48, align 4
  %cmp49 = icmp eq i8* %40, null
  br i1 %cmp49, label %if.then51, label %if.end57

if.then51:                                        ; preds = %for.end
  %41 = load i32, i32* %longarg, align 4
  %tobool52 = icmp ne i32 %41, 0
  br i1 %tobool52, label %if.then53, label %if.end56

if.then53:                                        ; preds = %if.then51
  %call54 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.28, i32 0, i32 0))
  %42 = load i8**, i8*** %argv.addr, align 4
  %43 = load i32, i32* %arg_index, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %42, i32 %43
  %44 = load i8*, i8** %arrayidx55, align 4
  call void (i8*, ...) @report_error(i8* %call54, i8* %44)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  call void @show_shell_usage(%struct._IO_FILE* %45, i32 0)
  call void @exit(i32 2) #6
  unreachable

if.end56:                                         ; preds = %if.then51
  br label %while.end

if.end57:                                         ; preds = %for.end
  %46 = load i32, i32* %arg_index, align 4
  %inc58 = add nsw i32 %46, 1
  store i32 %inc58, i32* %arg_index, align 4
  br label %while.cond

while.end:                                        ; preds = %if.end56, %land.end
  %47 = load i32, i32* %arg_index, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind
define internal void @show_shell_usage(%struct._IO_FILE* %fp, i32 %extra) #0 {
entry:
  %fp.addr = alloca %struct._IO_FILE*, align 4
  %extra.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %set_opts = alloca i8*, align 4
  %s = alloca i8*, align 4
  %t = alloca i8*, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 4
  store i32 %extra, i32* %extra.addr, align 4
  %0 = load i32, i32* %extra.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.62, i32 0, i32 0))
  %call1 = call i8* @shell_version_string()
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* %call, i8* %call1, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.63, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.64, i32 0, i32 0))
  %3 = load i8*, i8** @shell_name, align 4
  %4 = load i8*, i8** @shell_name, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* %call3, i8* %3, i8* %4)
  %call5 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.65, i32 0, i32 0))
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call6 = call i32 @fputs(i8* %call5, %struct._IO_FILE* %5)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %6
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %7 = load i8*, i8** %name, align 4
  %tobool7 = icmp ne i8* %7, null
  br i1 %tobool7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [16 x %struct.anon], [16 x %struct.anon]* @long_args, i32 0, i32 %9
  %name9 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx8, i32 0, i32 0
  %10 = load i8*, i8** %name9, align 4
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.66, i32 0, i32 0), i8* %10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call11 = call i8* @libintl_gettext(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.67, i32 0, i32 0))
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call12 = call i32 @fputs(i8* %call11, %struct._IO_FILE* %12)
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.68, i32 0, i32 0))
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call14 = call i32 @fputs(i8* %call13, %struct._IO_FILE* %13)
  store i32 0, i32* %i, align 4
  store i8* null, i8** %set_opts, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc38, %for.end
  %14 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds %struct.builtin, %struct.builtin* %14, i32 %15
  %name17 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx16, i32 0, i32 0
  %16 = load i8*, i8** %name17, align 4
  %tobool18 = icmp ne i8* %16, null
  br i1 %tobool18, label %for.body19, label %for.end40

for.body19:                                       ; preds = %for.cond15
  %17 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds %struct.builtin, %struct.builtin* %17, i32 %18
  %name21 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx20, i32 0, i32 0
  %19 = load i8*, i8** %name21, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx22, align 1
  %conv = sext i8 %20 to i32
  %21 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.69, i32 0, i32 0), align 1
  %conv23 = sext i8 %21 to i32
  %cmp = icmp eq i32 %conv, %conv23
  br i1 %cmp, label %land.lhs.true, label %if.end37

land.lhs.true:                                    ; preds = %for.body19
  %22 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds %struct.builtin, %struct.builtin* %22, i32 %23
  %name26 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx25, i32 0, i32 0
  %24 = load i8*, i8** %name26, align 4
  %call27 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.69, i32 0, i32 0))
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then30, label %if.end37

if.then30:                                        ; preds = %land.lhs.true
  %25 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %26 = load i32, i32* %i, align 4
  %arrayidx31 = getelementptr inbounds %struct.builtin, %struct.builtin* %25, i32 %26
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx31, i32 0, i32 4
  %27 = load i8*, i8** %short_doc, align 4
  %call32 = call i32 @strlen(i8* %27)
  %add = add i32 1, %call32
  %call33 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1942)
  %28 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %29 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds %struct.builtin, %struct.builtin* %28, i32 %29
  %short_doc35 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx34, i32 0, i32 4
  %30 = load i8*, i8** %short_doc35, align 4
  %call36 = call i8* @strcpy(i8* %call33, i8* %30)
  store i8* %call36, i8** %set_opts, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then30, %land.lhs.true, %for.body19
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %31 = load i32, i32* %i, align 4
  %inc39 = add nsw i32 %31, 1
  store i32 %inc39, i32* %i, align 4
  br label %for.cond15

for.end40:                                        ; preds = %for.cond15
  %32 = load i8*, i8** %set_opts, align 4
  %tobool41 = icmp ne i8* %32, null
  br i1 %tobool41, label %if.then42, label %if.end57

if.then42:                                        ; preds = %for.end40
  %33 = load i8*, i8** %set_opts, align 4
  %call43 = call i8* @strchr(i8* %33, i32 91)
  store i8* %call43, i8** %s, align 4
  %34 = load i8*, i8** %s, align 4
  %cmp44 = icmp eq i8* %34, null
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.then42
  %35 = load i8*, i8** %set_opts, align 4
  store i8* %35, i8** %s, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %if.then42
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end47
  %36 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %37 = load i8, i8* %incdec.ptr, align 1
  %conv48 = sext i8 %37 to i32
  %cmp49 = icmp eq i32 %conv48, 45
  br i1 %cmp49, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %38 = load i8*, i8** %s, align 4
  %call51 = call i8* @strchr(i8* %38, i32 93)
  store i8* %call51, i8** %t, align 4
  %39 = load i8*, i8** %t, align 4
  %tobool52 = icmp ne i8* %39, null
  br i1 %tobool52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %while.end
  %40 = load i8*, i8** %t, align 4
  store i8 0, i8* %40, align 1
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %while.end
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call55 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.70, i32 0, i32 0))
  %42 = load i8*, i8** %s, align 4
  %call56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* %call55, i8* %42)
  %43 = load i8*, i8** %set_opts, align 4
  call void @sh_xfree(i8* %43, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1954)
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %for.end40
  %44 = load i32, i32* %extra.addr, align 4
  %tobool58 = icmp ne i32 %44, 0
  br i1 %tobool58, label %if.then59, label %if.end71

if.then59:                                        ; preds = %if.end57
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call60 = call i8* @libintl_gettext(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.71, i32 0, i32 0))
  %46 = load i8*, i8** @shell_name, align 4
  %call61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* %call60, i8* %46)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call62 = call i8* @libintl_gettext(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.72, i32 0, i32 0))
  %48 = load i8*, i8** @shell_name, align 4
  %call63 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* %call62, i8* %48)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call64 = call i8* @libintl_gettext(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.73, i32 0, i32 0))
  %call65 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* %call64)
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.74, i32 0, i32 0))
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call67 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.75, i32 0, i32 0))
  %call68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* %call67)
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call69 = call i8* @libintl_gettext(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.76, i32 0, i32 0))
  %call70 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* %call69)
  br label %if.end71

if.end71:                                         ; preds = %if.then59, %if.end57
  ret void
}

declare void @show_shell_version(i32) #3

; Function Attrs: noinline nounwind
define internal i32 @parse_shell_options(i8** %argv, i32 %arg_start, i32 %arg_end) #0 {
entry:
  %retval = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %arg_start.addr = alloca i32, align 4
  %arg_end.addr = alloca i32, align 4
  %arg_index = alloca i32, align 4
  %arg_character = alloca i32, align 4
  %on_or_off = alloca i32, align 4
  %next_arg = alloca i32, align 4
  %i = alloca i32, align 4
  %o_option = alloca i8*, align 4
  %arg_string = alloca i8*, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i32 %arg_start, i32* %arg_start.addr, align 4
  store i32 %arg_end, i32* %arg_end.addr, align 4
  %0 = load i32, i32* %arg_start.addr, align 4
  store i32 %0, i32* %arg_index, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %1 = load i32, i32* %arg_index, align 4
  %2 = load i32, i32* %arg_end.addr, align 4
  %cmp = icmp ne i32 %1, %2
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %3 = load i8**, i8*** %argv.addr, align 4
  %4 = load i32, i32* %arg_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  store i8* %5, i8** %arg_string, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %6 = load i8*, i8** %arg_string, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp1 = icmp eq i32 %conv, 45
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %8 = load i8*, i8** %arg_string, align 4
  %9 = load i8, i8* %8, align 1
  %conv3 = sext i8 %9 to i32
  %cmp4 = icmp eq i32 %conv3, 43
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %10 = phi i1 [ true, %land.rhs ], [ %cmp4, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %land.lhs.true, %while.cond
  %11 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %10, %lor.end ]
  br i1 %11, label %while.body, label %while.end64

while.body:                                       ; preds = %land.end
  %12 = load i32, i32* %arg_index, align 4
  %add = add nsw i32 %12, 1
  store i32 %add, i32* %next_arg, align 4
  %13 = load i8*, i8** %arg_string, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %14 to i32
  %cmp8 = icmp eq i32 %conv7, 45
  br i1 %cmp8, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %while.body
  %15 = load i8*, i8** %arg_string, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %16 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true10
  %17 = load i8*, i8** %arg_string, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %17, i32 1
  %18 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %18 to i32
  %cmp17 = icmp eq i32 %conv16, 45
  br i1 %cmp17, label %land.lhs.true19, label %if.end

land.lhs.true19:                                  ; preds = %lor.lhs.false
  %19 = load i8*, i8** %arg_string, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %19, i32 2
  %20 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %20 to i32
  %cmp22 = icmp eq i32 %conv21, 0
  br i1 %cmp22, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true19, %land.lhs.true10
  %21 = load i32, i32* %next_arg, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true19, %lor.lhs.false, %while.body
  store i32 1, i32* %i, align 4
  %22 = load i8*, i8** %arg_string, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %22, i32 0
  %23 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %23 to i32
  store i32 %conv25, i32* %on_or_off, align 4
  br label %while.cond26

while.cond26:                                     ; preds = %sw.epilog, %if.end
  %24 = load i8*, i8** %arg_string, align 4
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %26 to i32
  store i32 %conv28, i32* %arg_character, align 4
  %tobool29 = icmp ne i32 %conv28, 0
  br i1 %tobool29, label %while.body30, label %while.end

while.body30:                                     ; preds = %while.cond26
  %27 = load i32, i32* %arg_character, align 4
  switch i32 %27, label %sw.default [
    i32 99, label %sw.bb
    i32 108, label %sw.bb31
    i32 115, label %sw.bb32
    i32 111, label %sw.bb33
    i32 79, label %sw.bb46
    i32 68, label %sw.bb57
  ]

sw.bb:                                            ; preds = %while.body30
  store i32 1, i32* @want_pending_command, align 4
  br label %sw.epilog

sw.bb31:                                          ; preds = %while.body30
  store i32 1, i32* @make_login_shell, align 4
  br label %sw.epilog

sw.bb32:                                          ; preds = %while.body30
  store i32 1, i32* @read_from_stdin, align 4
  br label %sw.epilog

sw.bb33:                                          ; preds = %while.body30
  %28 = load i8**, i8*** %argv.addr, align 4
  %29 = load i32, i32* %next_arg, align 4
  %arrayidx34 = getelementptr inbounds i8*, i8** %28, i32 %29
  %30 = load i8*, i8** %arrayidx34, align 4
  store i8* %30, i8** %o_option, align 4
  %31 = load i8*, i8** %o_option, align 4
  %cmp35 = icmp eq i8* %31, null
  br i1 %cmp35, label %if.then37, label %if.end40

if.then37:                                        ; preds = %sw.bb33
  %32 = load i32, i32* %on_or_off, align 4
  %cmp38 = icmp eq i32 %32, 45
  %cond = select i1 %cmp38, i32 0, i32 1
  call void @list_minus_o_opts(i32 -1, i32 %cond)
  br label %sw.epilog

if.end40:                                         ; preds = %sw.bb33
  %33 = load i32, i32* %on_or_off, align 4
  %34 = load i8*, i8** %o_option, align 4
  %call = call i32 @set_minus_o_option(i32 %33, i8* %34)
  %cmp41 = icmp ne i32 %call, 0
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @exit(i32 2) #6
  unreachable

if.end44:                                         ; preds = %if.end40
  %35 = load i32, i32* %next_arg, align 4
  %inc45 = add nsw i32 %35, 1
  store i32 %inc45, i32* %next_arg, align 4
  br label %sw.epilog

sw.bb46:                                          ; preds = %while.body30
  %36 = load i8**, i8*** %argv.addr, align 4
  %37 = load i32, i32* %next_arg, align 4
  %arrayidx47 = getelementptr inbounds i8*, i8** %36, i32 %37
  %38 = load i8*, i8** %arrayidx47, align 4
  store i8* %38, i8** %o_option, align 4
  %39 = load i8*, i8** %o_option, align 4
  %cmp48 = icmp eq i8* %39, null
  br i1 %cmp48, label %if.then50, label %if.end55

if.then50:                                        ; preds = %sw.bb46
  %40 = load i8*, i8** %o_option, align 4
  %41 = load i32, i32* %on_or_off, align 4
  %cmp51 = icmp eq i32 %41, 45
  %cond53 = select i1 %cmp51, i32 0, i32 1
  %call54 = call i32 @shopt_listopt(i8* %40, i32 %cond53)
  br label %sw.epilog

if.end55:                                         ; preds = %sw.bb46
  %42 = load i8*, i8** %o_option, align 4
  %43 = load i32, i32* %on_or_off, align 4
  call void @add_shopt_to_alist(i8* %42, i32 %43)
  %44 = load i32, i32* %next_arg, align 4
  %inc56 = add nsw i32 %44, 1
  store i32 %inc56, i32* %next_arg, align 4
  br label %sw.epilog

sw.bb57:                                          ; preds = %while.body30
  store i32 1, i32* @dump_translatable_strings, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %while.body30
  %45 = load i32, i32* %arg_character, align 4
  %46 = load i32, i32* %on_or_off, align 4
  %call58 = call i32 @change_flag(i32 %45, i32 %46)
  %cmp59 = icmp eq i32 %call58, -1
  br i1 %cmp59, label %if.then61, label %if.end63

if.then61:                                        ; preds = %sw.default
  %call62 = call i8* @libintl_gettext(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.45, i32 0, i32 0))
  %47 = load i32, i32* %on_or_off, align 4
  %48 = load i32, i32* %arg_character, align 4
  call void (i8*, ...) @report_error(i8* %call62, i32 %47, i32 %48)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  call void @show_shell_usage(%struct._IO_FILE* %49, i32 0)
  call void @exit(i32 2) #6
  unreachable

if.end63:                                         ; preds = %sw.default
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end63, %sw.bb57, %if.end55, %if.then50, %if.end44, %if.then37, %sw.bb32, %sw.bb31, %sw.bb
  br label %while.cond26

while.end:                                        ; preds = %while.cond26
  %50 = load i32, i32* %next_arg, align 4
  store i32 %50, i32* %arg_index, align 4
  br label %while.cond

while.end64:                                      ; preds = %land.end
  %51 = load i32, i32* %arg_index, align 4
  store i32 %51, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end64, %if.then
  %52 = load i32, i32* %retval, align 4
  ret i32 %52
}

declare i32 @set_login_shell(i8*, i32) #3

; Function Attrs: noinline nounwind
define void @disable_priv_mode() #0 {
entry:
  %e = alloca i32, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %call = call i32 @setuid(i32 %0)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32* @__errno_location()
  %1 = load i32, i32* %call1, align 4
  store i32 %1, i32* %e, align 4
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.22, i32 0, i32 0))
  %2 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  call void (i8*, ...) @sys_error(i8* %call2, i32 %2, i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %call3 = call i32 @setgid(i32 %4)
  %cmp4 = icmp slt i32 %call3, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.23, i32 0, i32 0))
  %5 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %6 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  call void (i8*, ...) @sys_error(i8* %call6, i32 %5, i32 %6)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %7 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  store i32 %7, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %8 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  store i32 %8, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  ret void
}

declare void @report_error(i8*, ...) #3

declare i8* @libintl_gettext(i8*) #3

declare i32 @isatty(i32) #3

declare i32 @fileno(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind
define internal void @init_interactive() #0 {
entry:
  store i32 1, i32* @startup_state, align 4
  store i32 1, i32* @interactive_shell, align 4
  store i32 1, i32* @expand_aliases, align 4
  store i32 1, i32* @interactive, align 4
  store i32 1, i32* @enable_history_list, align 4
  store i32 1, i32* @remember_on_history, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @init_noninteractive() #0 {
entry:
  call void @bash_history_reinit(i32 0)
  store i32 0, i32* @interactive, align 4
  store i32 0, i32* @startup_state, align 4
  store i32 0, i32* @interactive_shell, align 4
  %0 = load i32, i32* @posixly_correct, align 4
  store i32 %0, i32* @expand_aliases, align 4
  store i32 1, i32* @no_line_editing, align 4
  ret void
}

declare i32 @fcntl(i32, i32, ...) #3

declare %struct.variable* @bind_variable(i8*, i8*, i32) #3

declare void @sv_strict_posix(i8*) #3

; Function Attrs: noinline nounwind
define internal void @run_shopt_alist() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @shopt_ind, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %2, i32 %3
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx, i32 0, i32 0
  %4 = load i8*, i8** %word, align 4
  %5 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %5, i32 %6
  %token = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx1, i32 0, i32 1
  %7 = load i32, i32* %token, align 4
  %cmp2 = icmp eq i32 %7, 45
  %conv = zext i1 %cmp2 to i32
  %call = call i32 @shopt_setopt(i8* %4, i32 %conv)
  %cmp3 = icmp ne i32 %call, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @exit(i32 2) #6
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %10 = bitcast %struct.STRING_INT_ALIST* %9 to i8*
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1991)
  store %struct.STRING_INT_ALIST* null, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  store i32 0, i32* @shopt_len, align 4
  store i32 0, i32* @shopt_ind, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @shell_initialize() #0 {
entry:
  %hostname = alloca [256 x i8], align 1
  %should_be_restricted = alloca i32, align 4
  %0 = load i32, i32* @shell_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 @sh_setlinebuf(%struct._IO_FILE* %1)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1 = call i32 @sh_setlinebuf(%struct._IO_FILE* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @initialize_shell_builtins()
  call void @initialize_traps()
  call void @initialize_signals(i32 0)
  %3 = load i8*, i8** @current_host_name, align 4
  %cmp2 = icmp eq i8* %3, null
  br i1 %cmp2, label %if.then3, label %if.end13

if.then3:                                         ; preds = %if.end
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %hostname, i32 0, i32 0
  %call4 = call i32 @gethostname(i8* %arraydecay, i32 255)
  %cmp5 = icmp slt i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then3
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.59, i32 0, i32 0), i8** @current_host_name, align 4
  br label %if.end12

if.else:                                          ; preds = %if.then3
  %arraydecay7 = getelementptr inbounds [256 x i8], [256 x i8]* %hostname, i32 0, i32 0
  %call8 = call i32 @strlen(i8* %arraydecay7)
  %add = add i32 1, %call8
  %call9 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1821)
  %arraydecay10 = getelementptr inbounds [256 x i8], [256 x i8]* %hostname, i32 0, i32 0
  %call11 = call i8* @strcpy(i8* %call9, i8* %arraydecay10)
  store i8* %call11, i8** @current_host_name, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then6
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end
  %4 = load i32, i32* @interactive_shell, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end13
  call void @get_current_user_info()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end13
  call void @tilde_initialize()
  %5 = load i8*, i8** @shell_name, align 4
  %call16 = call i32 @shell_is_restricted(i8* %5)
  store i32 %call16, i32* %should_be_restricted, align 4
  %6 = load i8**, i8*** @shell_environment, align 4
  %7 = load i32, i32* @privileged_mode, align 4
  %tobool17 = icmp ne i32 %7, 0
  br i1 %tobool17, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end15
  %8 = load i32, i32* @restricted, align 4
  %tobool18 = icmp ne i32 %8, 0
  br i1 %tobool18, label %lor.end, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %9 = load i32, i32* %should_be_restricted, align 4
  %tobool20 = icmp ne i32 %9, 0
  br i1 %tobool20, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false19
  %10 = load i32, i32* @running_setuid, align 4
  %tobool21 = icmp ne i32 %10, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false19, %lor.lhs.false, %if.end15
  %11 = phi i1 [ true, %lor.lhs.false19 ], [ true, %lor.lhs.false ], [ true, %if.end15 ], [ %tobool21, %lor.rhs ]
  %lor.ext = zext i1 %11 to i32
  call void @initialize_shell_variables(i8** %6, i32 %lor.ext)
  %12 = load i32, i32* @jobs_m_flag, align 4
  %call22 = call i32 @initialize_job_control(i32 %12)
  call void @initialize_bash_input()
  call void @initialize_flags()
  %13 = load i32, i32* @privileged_mode, align 4
  %tobool23 = icmp ne i32 %13, 0
  br i1 %tobool23, label %lor.end30, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.end
  %14 = load i32, i32* @restricted, align 4
  %tobool25 = icmp ne i32 %14, 0
  br i1 %tobool25, label %lor.end30, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %lor.lhs.false24
  %15 = load i32, i32* %should_be_restricted, align 4
  %tobool27 = icmp ne i32 %15, 0
  br i1 %tobool27, label %lor.end30, label %lor.rhs28

lor.rhs28:                                        ; preds = %lor.lhs.false26
  %16 = load i32, i32* @running_setuid, align 4
  %tobool29 = icmp ne i32 %16, 0
  br label %lor.end30

lor.end30:                                        ; preds = %lor.rhs28, %lor.lhs.false26, %lor.lhs.false24, %lor.end
  %17 = phi i1 [ true, %lor.lhs.false26 ], [ true, %lor.lhs.false24 ], [ true, %lor.end ], [ %tobool29, %lor.rhs28 ]
  %lor.ext31 = zext i1 %17 to i32
  call void @initialize_shell_options(i32 %lor.ext31)
  %18 = load i32, i32* @privileged_mode, align 4
  %tobool32 = icmp ne i32 %18, 0
  br i1 %tobool32, label %lor.end39, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %lor.end30
  %19 = load i32, i32* @restricted, align 4
  %tobool34 = icmp ne i32 %19, 0
  br i1 %tobool34, label %lor.end39, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %lor.lhs.false33
  %20 = load i32, i32* %should_be_restricted, align 4
  %tobool36 = icmp ne i32 %20, 0
  br i1 %tobool36, label %lor.end39, label %lor.rhs37

lor.rhs37:                                        ; preds = %lor.lhs.false35
  %21 = load i32, i32* @running_setuid, align 4
  %tobool38 = icmp ne i32 %21, 0
  br label %lor.end39

lor.end39:                                        ; preds = %lor.rhs37, %lor.lhs.false35, %lor.lhs.false33, %lor.end30
  %22 = phi i1 [ true, %lor.lhs.false35 ], [ true, %lor.lhs.false33 ], [ true, %lor.end30 ], [ %tobool38, %lor.rhs37 ]
  %lor.ext40 = zext i1 %22 to i32
  call void @initialize_bashopts(i32 %lor.ext40)
  ret void
}

declare void @set_default_lang() #3

declare void @set_default_locale_vars() #3

declare i8* @get_string_value(i8*) #3

declare i8* @strstr(i8*, i8*) #3

declare i32 @strcmp(i8*, i8*) #3

declare i32 @strncmp(i8*, i8*, i32) #3

; Function Attrs: noinline noreturn nounwind
define void @exit_shell(i32 %s) #4 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %0)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call1 = call i32 @fflush(%struct._IO_FILE* %1)
  %2 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %2, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load void ()*, void ()** @rl_deprep_term_function, align 4
  %tobool2 = icmp ne void ()* %3, null
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load void ()*, void ()** @rl_deprep_term_function, align 4
  call void %4()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %call3 = call i32 @read_tty_modified()
  %tobool4 = icmp ne i32 %call3, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @read_tty_cleanup()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %call7 = call i32 @signal_is_trapped(i32 0)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end6
  %call10 = call i32 @run_exit_trap()
  store i32 %call10, i32* %s.addr, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end6
  call void @unlink_fifo_list()
  %5 = load i32, i32* @remember_on_history, align 4
  %tobool12 = icmp ne i32 %5, 0
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end11
  %call14 = call i32 @maybe_save_shell_history()
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end11
  call void @coproc_flush()
  %6 = load i32, i32* %s.addr, align 4
  call void @sh_exit(i32 %6) #6
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @unbind_variable(i8*) #3

declare i32 @change_flag(i32, i32) #3

; Function Attrs: noinline nounwind
define i32 @shell_is_restricted(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call i8* @base_pathname(i8* %1)
  store i8* %call, i8** %temp, align 4
  %2 = load i8*, i8** %temp, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %4 = load i8*, i8** %temp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %temp, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %5 = load i8*, i8** %temp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv4 = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp6 = icmp eq i32 %conv4, %conv5
  br i1 %cmp6, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end3
  %8 = load i8*, i8** %temp, align 4
  %call8 = call i32 @strcmp(i8* %8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0))
  %cmp9 = icmp eq i32 %call8, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end3
  %9 = phi i1 [ false, %if.end3 ], [ %cmp9, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal void @run_startup_files() #0 {
entry:
  %sourced_login = alloca i32, align 4
  %run_by_ssh = alloca i32, align 4
  %0 = load i32, i32* @interactive_shell, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @no_rc, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %land.lhs.true2, label %if.end14

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @login_shell, align 4
  %cmp3 = icmp eq i32 %2, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.end14

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %3 = load i32, i32* @act_like_sh, align 4
  %cmp5 = icmp eq i32 %3, 0
  br i1 %cmp5, label %land.lhs.true6, label %if.end14

land.lhs.true6:                                   ; preds = %land.lhs.true4
  %4 = load i8*, i8** @command_execution_string, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then, label %if.end14

if.then:                                          ; preds = %land.lhs.true6
  store i32 0, i32* %run_by_ssh, align 4
  %5 = load i32, i32* %run_by_ssh, align 4
  %tobool7 = icmp ne i32 %5, 0
  br i1 %tobool7, label %land.lhs.true10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call = call i32 @fileno(%struct._IO_FILE* %6)
  %call8 = call i32 @isnetconn(i32 %call)
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %lor.lhs.false, %if.then
  %7 = load i32, i32* @shell_level, align 4
  %cmp11 = icmp slt i32 %7, 2
  br i1 %cmp11, label %if.then12, label %if.end

if.then12:                                        ; preds = %land.lhs.true10
  %8 = load i8*, i8** @bashrc_file, align 4
  %call13 = call i32 @maybe_execute_file(i8* %8, i32 1)
  br label %if.end106

if.end:                                           ; preds = %land.lhs.true10, %lor.lhs.false
  br label %if.end14

if.end14:                                         ; preds = %if.end, %land.lhs.true6, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  store i32 0, i32* %sourced_login, align 4
  %9 = load i32, i32* @login_shell, align 4
  %cmp15 = icmp slt i32 %9, 0
  br i1 %cmp15, label %land.lhs.true16, label %if.end35

land.lhs.true16:                                  ; preds = %if.end14
  %10 = load i32, i32* @posixly_correct, align 4
  %cmp17 = icmp eq i32 %10, 0
  br i1 %cmp17, label %if.then18, label %if.end35

if.then18:                                        ; preds = %land.lhs.true16
  %11 = load i32, i32* @no_rc, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* @no_rc, align 4
  %12 = load i32, i32* @no_profile, align 4
  %cmp19 = icmp eq i32 %12, 0
  br i1 %cmp19, label %if.then20, label %if.end34

if.then20:                                        ; preds = %if.then18
  %call21 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.46, i32 0, i32 0), i32 1)
  %13 = load i32, i32* @act_like_sh, align 4
  %tobool22 = icmp ne i32 %13, 0
  br i1 %tobool22, label %if.then23, label %if.else

if.then23:                                        ; preds = %if.then20
  %call24 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i32 1)
  br label %if.end33

if.else:                                          ; preds = %if.then20
  %call25 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.48, i32 0, i32 0), i32 1)
  %cmp26 = icmp eq i32 %call25, 0
  br i1 %cmp26, label %land.lhs.true27, label %if.end32

land.lhs.true27:                                  ; preds = %if.else
  %call28 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.49, i32 0, i32 0), i32 1)
  %cmp29 = icmp eq i32 %call28, 0
  br i1 %cmp29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %land.lhs.true27
  %call31 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i32 1)
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %land.lhs.true27, %if.else
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then23
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.then18
  store i32 1, i32* %sourced_login, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %land.lhs.true16, %if.end14
  %14 = load i32, i32* @interactive_shell, align 4
  %cmp36 = icmp eq i32 %14, 0
  br i1 %cmp36, label %land.lhs.true37, label %if.end53

land.lhs.true37:                                  ; preds = %if.end35
  %15 = load i32, i32* @su_shell, align 4
  %tobool38 = icmp ne i32 %15, 0
  br i1 %tobool38, label %land.lhs.true39, label %if.then41

land.lhs.true39:                                  ; preds = %land.lhs.true37
  %16 = load i32, i32* @login_shell, align 4
  %tobool40 = icmp ne i32 %16, 0
  br i1 %tobool40, label %if.end53, label %if.then41

if.then41:                                        ; preds = %land.lhs.true39, %land.lhs.true37
  %17 = load i32, i32* @posixly_correct, align 4
  %cmp42 = icmp eq i32 %17, 0
  br i1 %cmp42, label %land.lhs.true43, label %if.end52

land.lhs.true43:                                  ; preds = %if.then41
  %18 = load i32, i32* @act_like_sh, align 4
  %cmp44 = icmp eq i32 %18, 0
  br i1 %cmp44, label %land.lhs.true45, label %if.end52

land.lhs.true45:                                  ; preds = %land.lhs.true43
  %19 = load i32, i32* @privileged_mode, align 4
  %cmp46 = icmp eq i32 %19, 0
  br i1 %cmp46, label %land.lhs.true47, label %if.end52

land.lhs.true47:                                  ; preds = %land.lhs.true45
  %20 = load i32, i32* @sourced_env, align 4
  %inc48 = add nsw i32 %20, 1
  store i32 %inc48, i32* @sourced_env, align 4
  %cmp49 = icmp eq i32 %20, 0
  br i1 %cmp49, label %if.then50, label %if.end52

if.then50:                                        ; preds = %land.lhs.true47
  %call51 = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.21, i32 0, i32 0))
  call void @execute_env_file(i8* %call51)
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %land.lhs.true47, %land.lhs.true45, %land.lhs.true43, %if.then41
  br label %if.end106

if.end53:                                         ; preds = %land.lhs.true39, %if.end35
  %21 = load i32, i32* @posixly_correct, align 4
  %cmp54 = icmp eq i32 %21, 0
  br i1 %cmp54, label %if.then55, label %if.else96

if.then55:                                        ; preds = %if.end53
  %22 = load i32, i32* @login_shell, align 4
  %tobool56 = icmp ne i32 %22, 0
  br i1 %tobool56, label %land.lhs.true57, label %if.end79

land.lhs.true57:                                  ; preds = %if.then55
  %23 = load i32, i32* %sourced_login, align 4
  %inc58 = add nsw i32 %23, 1
  store i32 %inc58, i32* %sourced_login, align 4
  %cmp59 = icmp eq i32 %23, 0
  br i1 %cmp59, label %if.then60, label %if.end79

if.then60:                                        ; preds = %land.lhs.true57
  %24 = load i32, i32* @no_rc, align 4
  %inc61 = add nsw i32 %24, 1
  store i32 %inc61, i32* @no_rc, align 4
  %25 = load i32, i32* @no_profile, align 4
  %cmp62 = icmp eq i32 %25, 0
  br i1 %cmp62, label %if.then63, label %if.end78

if.then63:                                        ; preds = %if.then60
  %call64 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.46, i32 0, i32 0), i32 1)
  %26 = load i32, i32* @act_like_sh, align 4
  %tobool65 = icmp ne i32 %26, 0
  br i1 %tobool65, label %if.then66, label %if.else68

if.then66:                                        ; preds = %if.then63
  %call67 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i32 1)
  br label %if.end77

if.else68:                                        ; preds = %if.then63
  %call69 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.48, i32 0, i32 0), i32 1)
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %land.lhs.true71, label %if.end76

land.lhs.true71:                                  ; preds = %if.else68
  %call72 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.49, i32 0, i32 0), i32 1)
  %cmp73 = icmp eq i32 %call72, 0
  br i1 %cmp73, label %if.then74, label %if.end76

if.then74:                                        ; preds = %land.lhs.true71
  %call75 = call i32 @maybe_execute_file(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i32 1)
  br label %if.end76

if.end76:                                         ; preds = %if.then74, %land.lhs.true71, %if.else68
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.then66
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.then60
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %land.lhs.true57, %if.then55
  %27 = load i32, i32* @act_like_sh, align 4
  %cmp80 = icmp eq i32 %27, 0
  br i1 %cmp80, label %land.lhs.true81, label %if.else85

land.lhs.true81:                                  ; preds = %if.end79
  %28 = load i32, i32* @no_rc, align 4
  %cmp82 = icmp eq i32 %28, 0
  br i1 %cmp82, label %if.then83, label %if.else85

if.then83:                                        ; preds = %land.lhs.true81
  %29 = load i8*, i8** @bashrc_file, align 4
  %call84 = call i32 @maybe_execute_file(i8* %29, i32 1)
  br label %if.end95

if.else85:                                        ; preds = %land.lhs.true81, %if.end79
  %30 = load i32, i32* @act_like_sh, align 4
  %tobool86 = icmp ne i32 %30, 0
  br i1 %tobool86, label %land.lhs.true87, label %if.end94

land.lhs.true87:                                  ; preds = %if.else85
  %31 = load i32, i32* @privileged_mode, align 4
  %cmp88 = icmp eq i32 %31, 0
  br i1 %cmp88, label %land.lhs.true89, label %if.end94

land.lhs.true89:                                  ; preds = %land.lhs.true87
  %32 = load i32, i32* @sourced_env, align 4
  %inc90 = add nsw i32 %32, 1
  store i32 %inc90, i32* @sourced_env, align 4
  %cmp91 = icmp eq i32 %32, 0
  br i1 %cmp91, label %if.then92, label %if.end94

if.then92:                                        ; preds = %land.lhs.true89
  %call93 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0))
  call void @execute_env_file(i8* %call93)
  br label %if.end94

if.end94:                                         ; preds = %if.then92, %land.lhs.true89, %land.lhs.true87, %if.else85
  br label %if.end95

if.end95:                                         ; preds = %if.end94, %if.then83
  br label %if.end106

if.else96:                                        ; preds = %if.end53
  %33 = load i32, i32* @interactive_shell, align 4
  %tobool97 = icmp ne i32 %33, 0
  br i1 %tobool97, label %land.lhs.true98, label %if.end105

land.lhs.true98:                                  ; preds = %if.else96
  %34 = load i32, i32* @privileged_mode, align 4
  %cmp99 = icmp eq i32 %34, 0
  br i1 %cmp99, label %land.lhs.true100, label %if.end105

land.lhs.true100:                                 ; preds = %land.lhs.true98
  %35 = load i32, i32* @sourced_env, align 4
  %inc101 = add nsw i32 %35, 1
  store i32 %inc101, i32* @sourced_env, align 4
  %cmp102 = icmp eq i32 %35, 0
  br i1 %cmp102, label %if.then103, label %if.end105

if.then103:                                       ; preds = %land.lhs.true100
  %call104 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0))
  call void @execute_env_file(i8* %call104)
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %land.lhs.true100, %land.lhs.true98, %if.else96
  br label %if.end106

if.end106:                                        ; preds = %if.then12, %if.end52, %if.end105, %if.end95
  ret void
}

; Function Attrs: noinline nounwind
define i32 @maybe_make_restricted(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @base_pathname(i8* %0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %temp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i8*, i8** %temp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv2 = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0), align 1
  %conv3 = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv2, %conv3
  br i1 %cmp4, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %lor.lhs.false
  %8 = load i8*, i8** %temp, align 4
  %call6 = call i32 @strcmp(i8* %8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.17, i32 0, i32 0))
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true, %if.end
  call void @set_var_read_only(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.18, i32 0, i32 0))
  call void @set_var_read_only(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.19, i32 0, i32 0))
  call void @set_var_read_only(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0))
  call void @set_var_read_only(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.21, i32 0, i32 0))
  store i32 1, i32* @restricted, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %land.lhs.true, %lor.lhs.false
  %9 = load i32, i32* @restricted, align 4
  ret i32 %9
}

declare void @cmd_init() #3

declare void @uwp_init() #3

; Function Attrs: noinline nounwind
define internal i32 @bind_args(i8** %argv, i32 %arg_start, i32 %arg_end, i32 %start_index) #0 {
entry:
  %argv.addr = alloca i8**, align 4
  %arg_start.addr = alloca i32, align 4
  %arg_end.addr = alloca i32, align 4
  %start_index.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %args = alloca %struct.word_list*, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i32 %arg_start, i32* %arg_start.addr, align 4
  store i32 %arg_end, i32* %arg_end.addr, align 4
  store i32 %start_index, i32* %start_index.addr, align 4
  %0 = load i32, i32* %arg_start.addr, align 4
  store i32 %0, i32* %i, align 4
  store %struct.word_list* null, %struct.word_list** %args, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %arg_end.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8**, i8*** %argv.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %call = call %struct.word_desc* @make_word(i8* %5)
  %6 = load %struct.word_list*, %struct.word_list** %args, align 4
  %call1 = call %struct.word_list* @make_word_list(%struct.word_desc* %call, %struct.word_list* %6)
  store %struct.word_list* %call1, %struct.word_list** %args, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load %struct.word_list*, %struct.word_list** %args, align 4
  %tobool = icmp ne %struct.word_list* %8, null
  br i1 %tobool, label %if.then, label %if.end26

if.then:                                          ; preds = %for.end
  %9 = load %struct.word_list*, %struct.word_list** %args, align 4
  %tobool2 = icmp ne %struct.word_list* %9, null
  br i1 %tobool2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then
  %10 = load %struct.word_list*, %struct.word_list** %args, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %10, i32 0, i32 0
  %11 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool3 = icmp ne %struct.word_list* %11, null
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %12 = load %struct.word_list*, %struct.word_list** %args, align 4
  %13 = bitcast %struct.word_list* %12 to %struct.g_list*
  %call4 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %13)
  %14 = bitcast %struct.g_list* %call4 to %struct.word_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then
  %15 = load %struct.word_list*, %struct.word_list** %args, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %14, %cond.true ], [ %15, %cond.false ]
  store %struct.word_list* %cond, %struct.word_list** %args, align 4
  %16 = load i32, i32* %start_index.addr, align 4
  %cmp5 = icmp eq i32 %16, 0
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %cond.end
  %17 = load %struct.word_list*, %struct.word_list** %args, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %17, i32 0, i32 1
  %18 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word7 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %18, i32 0, i32 0
  %19 = load i8*, i8** %word7, align 4
  %call8 = call i32 @strlen(i8* %19)
  %add = add i32 1, %call8
  %call9 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1420)
  %20 = load %struct.word_list*, %struct.word_list** %args, align 4
  %word10 = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 1
  %21 = load %struct.word_desc*, %struct.word_desc** %word10, align 4
  %word11 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word11, align 4
  %call12 = call i8* @strcpy(i8* %call9, i8* %22)
  store i8* %call12, i8** @shell_name, align 4
  br label %do.body

do.body:                                          ; preds = %if.then6
  %23 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %tobool13 = icmp ne i8* %23, null
  br i1 %tobool13, label %if.then14, label %if.end

if.then14:                                        ; preds = %do.body
  %24 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1421)
  br label %if.end

if.end:                                           ; preds = %if.then14, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %25 = load %struct.word_list*, %struct.word_list** %args, align 4
  %word15 = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 1
  %26 = load %struct.word_desc*, %struct.word_desc** %word15, align 4
  %word16 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word16, align 4
  %call17 = call i32 @strlen(i8* %27)
  %add18 = add i32 1, %call17
  %call19 = call i8* @sh_xmalloc(i32 %add18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1422)
  %28 = load %struct.word_list*, %struct.word_list** %args, align 4
  %word20 = getelementptr inbounds %struct.word_list, %struct.word_list* %28, i32 0, i32 1
  %29 = load %struct.word_desc*, %struct.word_desc** %word20, align 4
  %word21 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %29, i32 0, i32 0
  %30 = load i8*, i8** %word21, align 4
  %call22 = call i8* @strcpy(i8* %call19, i8* %30)
  store i8* %call22, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %31 = load %struct.word_list*, %struct.word_list** %args, align 4
  %next23 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 0
  %32 = load %struct.word_list*, %struct.word_list** %next23, align 4
  call void @remember_args(%struct.word_list* %32, i32 1)
  %33 = load %struct.word_list*, %struct.word_list** %args, align 4
  %next24 = getelementptr inbounds %struct.word_list, %struct.word_list* %33, i32 0, i32 0
  %34 = load %struct.word_list*, %struct.word_list** %next24, align 4
  call void @push_args(%struct.word_list* %34)
  br label %if.end25

if.else:                                          ; preds = %cond.end
  %35 = load %struct.word_list*, %struct.word_list** %args, align 4
  call void @remember_args(%struct.word_list* %35, i32 1)
  %36 = load %struct.word_list*, %struct.word_list** %args, align 4
  call void @push_args(%struct.word_list* %36)
  br label %if.end25

if.end25:                                         ; preds = %if.else, %do.end
  %37 = load %struct.word_list*, %struct.word_list** %args, align 4
  call void @dispose_words(%struct.word_list* %37)
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %for.end
  %38 = load i32, i32* %i, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind
define internal void @start_debugger() #0 {
entry:
  %old_errexit = alloca i32, align 4
  %r = alloca i32, align 4
  %0 = load i32, i32* @exit_immediately_on_error, align 4
  store i32 %0, i32* %old_errexit, align 4
  store i32 0, i32* @exit_immediately_on_error, align 4
  %call = call i32 @force_execute_file(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.51, i32 0, i32 0), i32 1)
  store i32 %call, i32* %r, align 4
  %1 = load i32, i32* %r, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.52, i32 0, i32 0))
  call void (i8*, ...) @internal_warning(i8* %call1)
  store i32 0, i32* @debugging_mode, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @debugging_mode, align 4
  store i32 %2, i32* @function_trace_mode, align 4
  store i32 %2, i32* @error_trace_mode, align 4
  call void @set_shellopts()
  call void @set_bashopts()
  %3 = load i32, i32* %old_errexit, align 4
  %4 = load i32, i32* @exit_immediately_on_error, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* @exit_immediately_on_error, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @run_one_command(i8* %command) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca i8*, align 4
  %code = alloca i32, align 4
  store i8* %command, i8** %command.addr, align 4
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #5
  store i32 %call, i32* %code, align 4
  %0 = load i32, i32* %code, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @unlink_fifo_list()
  %1 = load i32, i32* %code, align 4
  switch i32 %1, label %sw.default [
    i32 1, label %sw.bb
    i32 4, label %sw.bb1
    i32 3, label %sw.bb1
    i32 2, label %sw.bb2
  ]

sw.bb:                                            ; preds = %if.then
  store i32 127, i32* @last_command_exit_value, align 4
  store i32 127, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %if.then, %if.then
  %2 = load i32, i32* @last_command_exit_value, align 4
  store i32 %2, i32* %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %if.then
  store i32 1, i32* @last_command_exit_value, align 4
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %if.then
  %3 = load i32, i32* %code, align 4
  call void @command_error(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.50, i32 0, i32 0), i32 3, i32 %3, i32 0)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %if.end

if.end:                                           ; preds = %sw.epilog, %entry
  %4 = load i8*, i8** %command.addr, align 4
  %call3 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call3
  %call4 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1399)
  %5 = load i8*, i8** %command.addr, align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %5)
  %call6 = call i32 @parse_and_execute(i8* %call5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 4)
  store i32 %call6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %sw.bb2, %sw.bb1, %sw.bb
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @open_shell_script(i8* %script_name) #0 {
entry:
  %script_name.addr = alloca i8*, align 4
  %fd = alloca i32, align 4
  %e = alloca i32, align 4
  %fd_is_tty = alloca i32, align 4
  %filename = alloca i8*, align 4
  %path_filename = alloca i8*, align 4
  %t = alloca i8*, align 4
  %sample = alloca [80 x i8], align 1
  %sample_len = alloca i32, align 4
  %sb = alloca %struct.stat, align 8
  %funcname_v = alloca %struct.variable*, align 4
  %bash_source_v = alloca %struct.variable*, align 4
  %bash_lineno_v = alloca %struct.variable*, align 4
  %funcname_a = alloca %struct.array*, align 4
  %bash_source_a = alloca %struct.array*, align 4
  %bash_lineno_a = alloca %struct.array*, align 4
  store i8* %script_name, i8** %script_name.addr, align 4
  %0 = load i8*, i8** %script_name.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1484)
  %1 = load i8*, i8** %script_name.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %1)
  store i8* %call2, i8** %filename, align 4
  %2 = load i8*, i8** %filename, align 4
  %call3 = call i32 (i8*, i32, ...) @open(i8* %2, i32 0)
  store i32 %call3, i32* %fd, align 4
  %3 = load i32, i32* %fd, align 4
  %cmp = icmp slt i32 %3, 0
  br i1 %cmp, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %entry
  %call4 = call i32* @__errno_location()
  %4 = load i32, i32* %call4, align 4
  %cmp5 = icmp eq i32 %4, 2
  br i1 %cmp5, label %land.lhs.true6, label %if.end14

land.lhs.true6:                                   ; preds = %land.lhs.true
  %5 = load i8*, i8** %filename, align 4
  %call7 = call i32 @absolute_program(i8* %5)
  %cmp8 = icmp eq i32 %call7, 0
  br i1 %cmp8, label %if.then, label %if.end14

if.then:                                          ; preds = %land.lhs.true6
  %call9 = call i32* @__errno_location()
  %6 = load i32, i32* %call9, align 4
  store i32 %6, i32* %e, align 4
  %7 = load i8*, i8** %script_name.addr, align 4
  %call10 = call i8* @find_path_file(i8* %7)
  store i8* %call10, i8** %path_filename, align 4
  %8 = load i8*, i8** %path_filename, align 4
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.then
  %9 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1495)
  %10 = load i8*, i8** %path_filename, align 4
  store i8* %10, i8** %filename, align 4
  %11 = load i8*, i8** %filename, align 4
  %call12 = call i32 (i8*, i32, ...) @open(i8* %11, i32 0)
  store i32 %call12, i32* %fd, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %12 = load i32, i32* %e, align 4
  %call13 = call i32* @__errno_location()
  store i32 %12, i32* %call13, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then11
  br label %if.end14

if.end14:                                         ; preds = %if.end, %land.lhs.true6, %land.lhs.true, %entry
  %13 = load i32, i32* %fd, align 4
  %cmp15 = icmp slt i32 %13, 0
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end14
  %call17 = call i32* @__errno_location()
  %14 = load i32, i32* %call17, align 4
  store i32 %14, i32* %e, align 4
  %15 = load i8*, i8** %filename, align 4
  call void @file_error(i8* %15)
  %16 = load i32, i32* %e, align 4
  %cmp18 = icmp eq i32 %16, 2
  %cond = select i1 %cmp18, i32 127, i32 126
  call void @sh_exit(i32 %cond) #6
  unreachable

if.end19:                                         ; preds = %if.end14
  %17 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1510)
  %18 = load i8*, i8** @exec_argv0, align 4
  %tobool20 = icmp ne i8* %18, null
  br i1 %tobool20, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end19
  %19 = load i8*, i8** @exec_argv0, align 4
  %call21 = call i32 @strlen(i8* %19)
  %add22 = add i32 1, %call21
  %call23 = call i8* @sh_xmalloc(i32 %add22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1511)
  %20 = load i8*, i8** @exec_argv0, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %20)
  br label %cond.end

cond.false:                                       ; preds = %if.end19
  %21 = load i8*, i8** %script_name.addr, align 4
  %call25 = call i32 @strlen(i8* %21)
  %add26 = add i32 1, %call25
  %call27 = call i8* @sh_xmalloc(i32 %add26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1511)
  %22 = load i8*, i8** %script_name.addr, align 4
  %call28 = call i8* @strcpy(i8* %call27, i8* %22)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond29 = phi i8* [ %call24, %cond.true ], [ %call28, %cond.false ]
  store i8* %cond29, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %23 = load i8*, i8** @exec_argv0, align 4
  %tobool30 = icmp ne i8* %23, null
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %cond.end
  %24 = load i8*, i8** @exec_argv0, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1514)
  store i8* null, i8** @exec_argv0, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %cond.end
  %25 = load i8*, i8** %filename, align 4
  %call33 = call i32 @file_isdir(i8* %25)
  %tobool34 = icmp ne i32 %call33, 0
  br i1 %tobool34, label %if.then35, label %if.end37

if.then35:                                        ; preds = %if.end32
  %call36 = call i32* @__errno_location()
  store i32 21, i32* %call36, align 4
  %26 = load i8*, i8** %filename, align 4
  call void @file_error(i8* %26)
  call void @sh_exit(i32 126) #6
  unreachable

if.end37:                                         ; preds = %if.end32
  br label %do.body

do.body:                                          ; preds = %if.end37
  %call38 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.53, i32 0, i32 0))
  store %struct.variable* %call38, %struct.variable** %funcname_v, align 4
  %27 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %tobool39 = icmp ne %struct.variable* %27, null
  br i1 %tobool39, label %land.lhs.true40, label %cond.false43

land.lhs.true40:                                  ; preds = %do.body
  %28 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes, align 4
  %and = and i32 %29, 4
  %tobool41 = icmp ne i32 %and, 0
  br i1 %tobool41, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %land.lhs.true40
  %30 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 1
  %31 = load i8*, i8** %value, align 4
  %32 = bitcast i8* %31 to %struct.array*
  br label %cond.end44

cond.false43:                                     ; preds = %land.lhs.true40, %do.body
  br label %cond.end44

cond.end44:                                       ; preds = %cond.false43, %cond.true42
  %cond45 = phi %struct.array* [ %32, %cond.true42 ], [ null, %cond.false43 ]
  store %struct.array* %cond45, %struct.array** %funcname_a, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end44
  br label %do.body46

do.body46:                                        ; preds = %do.end
  %call47 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.54, i32 0, i32 0))
  store %struct.variable* %call47, %struct.variable** %bash_source_v, align 4
  %33 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %tobool48 = icmp ne %struct.variable* %33, null
  br i1 %tobool48, label %land.lhs.true49, label %cond.false55

land.lhs.true49:                                  ; preds = %do.body46
  %34 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %attributes50 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 5
  %35 = load i32, i32* %attributes50, align 4
  %and51 = and i32 %35, 4
  %tobool52 = icmp ne i32 %and51, 0
  br i1 %tobool52, label %cond.true53, label %cond.false55

cond.true53:                                      ; preds = %land.lhs.true49
  %36 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %value54 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 1
  %37 = load i8*, i8** %value54, align 4
  %38 = bitcast i8* %37 to %struct.array*
  br label %cond.end56

cond.false55:                                     ; preds = %land.lhs.true49, %do.body46
  br label %cond.end56

cond.end56:                                       ; preds = %cond.false55, %cond.true53
  %cond57 = phi %struct.array* [ %38, %cond.true53 ], [ null, %cond.false55 ]
  store %struct.array* %cond57, %struct.array** %bash_source_a, align 4
  br label %do.end58

do.end58:                                         ; preds = %cond.end56
  br label %do.body59

do.body59:                                        ; preds = %do.end58
  %call60 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.55, i32 0, i32 0))
  store %struct.variable* %call60, %struct.variable** %bash_lineno_v, align 4
  %39 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %tobool61 = icmp ne %struct.variable* %39, null
  br i1 %tobool61, label %land.lhs.true62, label %cond.false68

land.lhs.true62:                                  ; preds = %do.body59
  %40 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %attributes63 = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 5
  %41 = load i32, i32* %attributes63, align 4
  %and64 = and i32 %41, 4
  %tobool65 = icmp ne i32 %and64, 0
  br i1 %tobool65, label %cond.true66, label %cond.false68

cond.true66:                                      ; preds = %land.lhs.true62
  %42 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %value67 = getelementptr inbounds %struct.variable, %struct.variable* %42, i32 0, i32 1
  %43 = load i8*, i8** %value67, align 4
  %44 = bitcast i8* %43 to %struct.array*
  br label %cond.end69

cond.false68:                                     ; preds = %land.lhs.true62, %do.body59
  br label %cond.end69

cond.end69:                                       ; preds = %cond.false68, %cond.true66
  %cond70 = phi %struct.array* [ %44, %cond.true66 ], [ null, %cond.false68 ]
  store %struct.array* %cond70, %struct.array** %bash_lineno_a, align 4
  br label %do.end71

do.end71:                                         ; preds = %cond.end69
  br label %do.body72

do.body72:                                        ; preds = %do.end71
  %45 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %46 = load i8*, i8** %filename, align 4
  %call73 = call i32 @array_rshift(%struct.array* %45, i32 1, i8* %46)
  br label %do.end74

do.end74:                                         ; preds = %do.body72
  %47 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %tobool75 = icmp ne %struct.array* %47, null
  br i1 %tobool75, label %if.then76, label %if.end82

if.then76:                                        ; preds = %do.end74
  %call77 = call i32 @executing_line_number()
  %conv = sext i32 %call77 to i64
  %call78 = call i8* @itos(i64 %conv)
  store i8* %call78, i8** %t, align 4
  br label %do.body79

do.body79:                                        ; preds = %if.then76
  %48 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %49 = load i8*, i8** %t, align 4
  %call80 = call i32 @array_rshift(%struct.array* %48, i32 1, i8* %49)
  br label %do.end81

do.end81:                                         ; preds = %do.body79
  %50 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %50, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1539)
  br label %if.end82

if.end82:                                         ; preds = %do.end81, %do.end74
  br label %do.body83

do.body83:                                        ; preds = %if.end82
  %51 = load %struct.array*, %struct.array** %funcname_a, align 4
  %call84 = call i32 @array_rshift(%struct.array* %51, i32 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.56, i32 0, i32 0))
  br label %do.end85

do.end85:                                         ; preds = %do.body83
  %52 = load i32, i32* %fd, align 4
  %call86 = call i32 @isatty(i32 %52)
  store i32 %call86, i32* %fd_is_tty, align 4
  %53 = load i32, i32* %fd_is_tty, align 4
  %cmp87 = icmp eq i32 %53, 0
  br i1 %cmp87, label %land.lhs.true89, label %if.end123

land.lhs.true89:                                  ; preds = %do.end85
  %54 = load i32, i32* %fd, align 4
  %call90 = call i32 @lseek(i32 %54, i32 0, i32 1)
  %cmp91 = icmp ne i32 %call90, -1
  br i1 %cmp91, label %if.then93, label %if.end123

if.then93:                                        ; preds = %land.lhs.true89
  %55 = load i32, i32* %fd, align 4
  %arraydecay = getelementptr inbounds [80 x i8], [80 x i8]* %sample, i32 0, i32 0
  %call94 = call i32 @read(i32 %55, i8* %arraydecay, i32 80)
  store i32 %call94, i32* %sample_len, align 4
  %56 = load i32, i32* %sample_len, align 4
  %cmp95 = icmp slt i32 %56, 0
  br i1 %cmp95, label %if.then97, label %if.else111

if.then97:                                        ; preds = %if.then93
  %call98 = call i32* @__errno_location()
  %57 = load i32, i32* %call98, align 4
  store i32 %57, i32* %e, align 4
  %58 = load i32, i32* %fd, align 4
  %call99 = call i32 @fstat(i32 %58, %struct.stat* %sb)
  %cmp100 = icmp eq i32 %call99, 0
  br i1 %cmp100, label %land.lhs.true102, label %if.else108

land.lhs.true102:                                 ; preds = %if.then97
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 6
  %59 = load i32, i32* %st_mode, align 8
  %and103 = and i32 %59, 61440
  %cmp104 = icmp eq i32 %and103, 16384
  br i1 %cmp104, label %if.then106, label %if.else108

if.then106:                                       ; preds = %land.lhs.true102
  %call107 = call i32* @__errno_location()
  store i32 21, i32* %call107, align 4
  %60 = load i8*, i8** %filename, align 4
  call void @file_error(i8* %60)
  br label %if.end110

if.else108:                                       ; preds = %land.lhs.true102, %if.then97
  %61 = load i32, i32* %e, align 4
  %call109 = call i32* @__errno_location()
  store i32 %61, i32* %call109, align 4
  %62 = load i8*, i8** %filename, align 4
  call void @file_error(i8* %62)
  br label %if.end110

if.end110:                                        ; preds = %if.else108, %if.then106
  call void @exit(i32 126) #6
  unreachable

if.else111:                                       ; preds = %if.then93
  %63 = load i32, i32* %sample_len, align 4
  %cmp112 = icmp sgt i32 %63, 0
  br i1 %cmp112, label %land.lhs.true114, label %if.end120

land.lhs.true114:                                 ; preds = %if.else111
  %arraydecay115 = getelementptr inbounds [80 x i8], [80 x i8]* %sample, i32 0, i32 0
  %64 = load i32, i32* %sample_len, align 4
  %call116 = call i32 @check_binary_file(i8* %arraydecay115, i32 %64)
  %tobool117 = icmp ne i32 %call116, 0
  br i1 %tobool117, label %if.then118, label %if.end120

if.then118:                                       ; preds = %land.lhs.true114
  %call119 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.57, i32 0, i32 0))
  %65 = load i8*, i8** %filename, align 4
  call void (i8*, ...) @internal_error(i8* %call119, i8* %65)
  call void @exit(i32 126) #6
  unreachable

if.end120:                                        ; preds = %land.lhs.true114, %if.else111
  br label %if.end121

if.end121:                                        ; preds = %if.end120
  %66 = load i32, i32* %fd, align 4
  %call122 = call i32 @lseek(i32 %66, i32 0, i32 0)
  br label %if.end123

if.end123:                                        ; preds = %if.end121, %land.lhs.true89, %do.end85
  %67 = load i32, i32* %fd, align 4
  %call124 = call i32 @move_to_high_fd(i32 %67, i32 1, i32 -1)
  store i32 %call124, i32* %fd, align 4
  %68 = load i32, i32* %fd, align 4
  store i32 %68, i32* @default_buffered_input, align 4
  %69 = load i32, i32* @default_buffered_input, align 4
  %call125 = call i32 (i32, i32, ...) @fcntl(i32 %69, i32 2, i32 1)
  %70 = load i32, i32* @interactive_shell, align 4
  %tobool126 = icmp ne i32 %70, 0
  br i1 %tobool126, label %land.lhs.true127, label %if.else132

land.lhs.true127:                                 ; preds = %if.end123
  %71 = load i32, i32* %fd_is_tty, align 4
  %tobool128 = icmp ne i32 %71, 0
  br i1 %tobool128, label %if.then129, label %if.else132

if.then129:                                       ; preds = %land.lhs.true127
  %72 = load i32, i32* %fd, align 4
  %call130 = call i32 @dup2(i32 %72, i32 0)
  %73 = load i32, i32* %fd, align 4
  %call131 = call i32 @close(i32 %73)
  store i32 0, i32* %fd, align 4
  store i32 0, i32* @default_buffered_input, align 4
  br label %if.end139

if.else132:                                       ; preds = %land.lhs.true127, %if.end123
  %74 = load i32, i32* @forced_interactive, align 4
  %tobool133 = icmp ne i32 %74, 0
  br i1 %tobool133, label %land.lhs.true134, label %if.end138

land.lhs.true134:                                 ; preds = %if.else132
  %75 = load i32, i32* %fd_is_tty, align 4
  %cmp135 = icmp eq i32 %75, 0
  br i1 %cmp135, label %if.then137, label %if.end138

if.then137:                                       ; preds = %land.lhs.true134
  call void @init_interactive_script()
  br label %if.end138

if.end138:                                        ; preds = %if.then137, %land.lhs.true134, %if.else132
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.then129
  %76 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %76, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1627)
  store i32 1, i32* @reading_shell_script, align 4
  %77 = load i32, i32* %fd, align 4
  ret i32 %77
}

; Function Attrs: noinline nounwind
define internal void @set_bash_input() #0 {
entry:
  %0 = load i32, i32* @interactive, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @default_buffered_input, align 4
  %call = call i32 @sh_unset_nodelay_mode(i32 %1)
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call1 = call i32 @fileno(%struct._IO_FILE* %2)
  %call2 = call i32 @sh_unset_nodelay_mode(i32 %call1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %land.lhs.true, label %if.else5

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32, i32* @no_line_editing, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %land.lhs.true
  call void @with_input_from_stdin()
  br label %if.end10

if.else5:                                         ; preds = %land.lhs.true, %if.end
  %5 = load i32, i32* @interactive, align 4
  %cmp6 = icmp eq i32 %5, 0
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.else5
  %6 = load i32, i32* @default_buffered_input, align 4
  %7 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  call void @with_input_from_buffered_stream(i32 %6, i8* %7)
  br label %if.end9

if.else8:                                         ; preds = %if.else5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @default_input, align 4
  %9 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  call void @with_input_from_stream(%struct._IO_FILE* %8, i8* %9)
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then7
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then4
  ret void
}

declare void @reset_mail_timer() #3

declare void @init_mail_dates() #3

declare void @bash_initialize_history() #3

declare void @load_history() #3

declare i32 @get_tty_state() #3

declare i32 @reader_loop() #3

declare i32 @fflush(%struct._IO_FILE*) #3

declare i32 @read_tty_modified() #3

declare void @read_tty_cleanup() #3

declare i32 @signal_is_trapped(i32) #3

declare i32 @run_exit_trap() #3

declare void @unlink_fifo_list() #3

declare i32 @maybe_save_shell_history() #3

declare void @coproc_flush() #3

; Function Attrs: noinline noreturn nounwind
define void @sh_exit(i32 %s) #4 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  call void @exit(i32 %0) #6
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noinline noreturn nounwind
define void @subshell_exit(i32 %s) #4 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %0)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call1 = call i32 @fflush(%struct._IO_FILE* %1)
  %call2 = call i32 @signal_is_trapped(i32 0)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call3 = call i32 @run_exit_trap()
  store i32 %call3, i32* %s.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %s.addr, align 4
  call void @sh_exit(i32 %2) #6
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i8* @base_pathname(i8*) #3

declare void @set_var_read_only(i8*) #3

declare i32 @setuid(i32) #3

declare i32* @__errno_location() #3

declare void @sys_error(i8*, ...) #3

declare i32 @setgid(i32) #3

; Function Attrs: noinline nounwind
define void @unbind_args() #0 {
entry:
  call void @remember_args(%struct.word_list* null, i32 1)
  call void @pop_args()
  ret void
}

declare void @remember_args(%struct.word_list*, i32) #3

declare void @pop_args() #3

; Function Attrs: noinline nounwind
define void @unset_bash_input(i32 %check_zero) #0 {
entry:
  %check_zero.addr = alloca i32, align 4
  store i32 %check_zero, i32* %check_zero.addr, align 4
  %0 = load i32, i32* %check_zero.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @default_buffered_input, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %check_zero.addr, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* @default_buffered_input, align 4
  %cmp3 = icmp sgt i32 %3, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2, %land.lhs.true
  %4 = load i32, i32* @default_buffered_input, align 4
  %call = call i32 @close_buffered_fd(i32 %4)
  store i32 -1, i32* bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i32*), align 4
  store i32 -1, i32* @default_buffered_input, align 4
  store i32 0, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %lor.lhs.false
  ret void
}

declare i32 @close_buffered_fd(i32) #3

; Function Attrs: noinline nounwind
define void @get_current_user_info() #0 {
entry:
  %entry1 = alloca %struct.passwd*, align 4
  %0 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end32

if.then:                                          ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %call = call %struct.passwd* @getpwuid(i32 %1)
  store %struct.passwd* %call, %struct.passwd** %entry1, align 4
  %2 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %tobool = icmp ne %struct.passwd* %2, null
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %3 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_name = getelementptr inbounds %struct.passwd, %struct.passwd* %3, i32 0, i32 0
  %4 = load i8*, i8** %pw_name, align 4
  %call3 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call3
  %call4 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1769)
  %5 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_name5 = getelementptr inbounds %struct.passwd, %struct.passwd* %5, i32 0, i32 0
  %6 = load i8*, i8** %pw_name5, align 4
  %call6 = call i8* @strcpy(i8* %call4, i8* %6)
  store i8* %call6, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %7 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_shell = getelementptr inbounds %struct.passwd, %struct.passwd* %7, i32 0, i32 6
  %8 = load i8*, i8** %pw_shell, align 4
  %tobool7 = icmp ne i8* %8, null
  br i1 %tobool7, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then2
  %9 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_shell8 = getelementptr inbounds %struct.passwd, %struct.passwd* %9, i32 0, i32 6
  %10 = load i8*, i8** %pw_shell8, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %11 to i32
  %tobool9 = icmp ne i32 %conv, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %12 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_shell10 = getelementptr inbounds %struct.passwd, %struct.passwd* %12, i32 0, i32 6
  %13 = load i8*, i8** %pw_shell10, align 4
  %call11 = call i32 @strlen(i8* %13)
  %add12 = add i32 1, %call11
  %call13 = call i8* @sh_xmalloc(i32 %add12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1771)
  %14 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_shell14 = getelementptr inbounds %struct.passwd, %struct.passwd* %14, i32 0, i32 6
  %15 = load i8*, i8** %pw_shell14, align 4
  %call15 = call i8* @strcpy(i8* %call13, i8* %15)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then2
  %call16 = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1772)
  %call17 = call i8* @strcpy(i8* %call16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call15, %cond.true ], [ %call17, %cond.false ]
  store i8* %cond, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %16 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_dir = getelementptr inbounds %struct.passwd, %struct.passwd* %16, i32 0, i32 5
  %17 = load i8*, i8** %pw_dir, align 4
  %call18 = call i32 @strlen(i8* %17)
  %add19 = add i32 1, %call18
  %call20 = call i8* @sh_xmalloc(i32 %add19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1773)
  %18 = load %struct.passwd*, %struct.passwd** %entry1, align 4
  %pw_dir21 = getelementptr inbounds %struct.passwd, %struct.passwd* %18, i32 0, i32 5
  %19 = load i8*, i8** %pw_dir21, align 4
  %call22 = call i8* @strcpy(i8* %call20, i8* %19)
  store i8* %call22, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %call23 = call i8* @libintl_gettext(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.26, i32 0, i32 0))
  store i8* %call23, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %20 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %call24 = call i32 @strlen(i8* %20)
  %add25 = add i32 1, %call24
  %call26 = call i8* @sh_xmalloc(i32 %add25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1778)
  %21 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %call27 = call i8* @strcpy(i8* %call26, i8* %21)
  store i8* %call27, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 4), align 4
  %call28 = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1779)
  %call29 = call i8* @strcpy(i8* %call28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0))
  store i8* %call29, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %call30 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1780)
  %call31 = call i8* @strcpy(i8* %call30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i32 0, i32 0))
  store i8* %call31, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %cond.end
  call void @endpwent()
  br label %if.end32

if.end32:                                         ; preds = %if.end, %entry
  ret void
}

declare %struct.passwd* @getpwuid(i32) #3

declare i8* @strcpy(i8*, i8*) #3

declare i8* @sh_xmalloc(i32, i8*, i32) #3

declare i32 @strlen(i8*) #3

declare void @endpwent() #3

declare void @list_minus_o_opts(i32, i32) #3

declare i32 @set_minus_o_option(i32, i8*) #3

declare i32 @shopt_listopt(i8*, i32) #3

; Function Attrs: noinline nounwind
define internal void @add_shopt_to_alist(i8* %opt, i32 %on_or_off) #0 {
entry:
  %opt.addr = alloca i8*, align 4
  %on_or_off.addr = alloca i32, align 4
  store i8* %opt, i8** %opt.addr, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  %0 = load i32, i32* @shopt_ind, align 4
  %1 = load i32, i32* @shopt_len, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @shopt_len, align 4
  %add = add nsw i32 %2, 8
  store i32 %add, i32* @shopt_len, align 4
  %3 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %4 = bitcast %struct.STRING_INT_ALIST* %3 to i8*
  %5 = load i32, i32* @shopt_len, align 4
  %mul = mul i32 %5, 8
  %call = call i8* @sh_xrealloc(i8* %4, i32 %mul, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1976)
  %6 = bitcast i8* %call to %struct.STRING_INT_ALIST*
  store %struct.STRING_INT_ALIST* %6, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8*, i8** %opt.addr, align 4
  %8 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %9 = load i32, i32* @shopt_ind, align 4
  %arrayidx = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %8, i32 %9
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx, i32 0, i32 0
  store i8* %7, i8** %word, align 4
  %10 = load i32, i32* %on_or_off.addr, align 4
  %11 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** @shopt_alist, align 4
  %12 = load i32, i32* @shopt_ind, align 4
  %arrayidx1 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %11, i32 %12
  %token = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx1, i32 0, i32 1
  store i32 %10, i32* %token, align 4
  %13 = load i32, i32* @shopt_ind, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* @shopt_ind, align 4
  ret void
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #3

declare i32 @isnetconn(i32) #3

declare i32 @maybe_execute_file(i8*, i32) #3

; Function Attrs: noinline nounwind
define internal void @execute_env_file(i8* %env_file) #0 {
entry:
  %env_file.addr = alloca i8*, align 4
  %fn = alloca i8*, align 4
  store i8* %env_file, i8** %env_file.addr, align 4
  %0 = load i8*, i8** %env_file.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %env_file.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end11

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %env_file.addr, align 4
  %call = call i8* @expand_string_unsplit_to_string(i8* %3, i32 1)
  store i8* %call, i8** %fn, align 4
  %4 = load i8*, i8** %fn, align 4
  %tobool2 = icmp ne i8* %4, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %if.then
  %5 = load i8*, i8** %fn, align 4
  %6 = load i8, i8* %5, align 1
  %conv4 = sext i8 %6 to i32
  %tobool5 = icmp ne i32 %conv4, 0
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %land.lhs.true3
  %7 = load i8*, i8** %fn, align 4
  %call7 = call i32 @maybe_execute_file(i8* %7, i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then6, %land.lhs.true3, %if.then
  br label %do.body

do.body:                                          ; preds = %if.end
  %8 = load i8*, i8** %fn, align 4
  %tobool8 = icmp ne i8* %8, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  %9 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.24, i32 0, i32 0), i32 1066)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  br label %if.end11

if.end11:                                         ; preds = %do.end, %land.lhs.true, %entry
  ret void
}

declare i8* @expand_string_unsplit_to_string(i8*, i32) #3

declare void @sh_xfree(i8*, i8*, i32) #3

declare i32 @getuid() #3

declare i32 @getgid() #3

declare i32 @geteuid() #3

declare i32 @getegid() #3

declare void @command_error(i8*, i32, i32, i32) #3

declare i32 @parse_and_execute(i8*, i8*, i32) #3

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #3

declare %struct.word_desc* @make_word(i8*) #3

declare %struct.g_list* @list_reverse(...) #3

declare void @push_args(%struct.word_list*) #3

declare void @dispose_words(%struct.word_list*) #3

declare i32 @force_execute_file(i8*, i32) #3

declare void @internal_warning(i8*, ...) #3

declare void @set_shellopts() #3

declare void @set_bashopts() #3

declare i32 @open(i8*, i32, ...) #3

declare i32 @absolute_program(i8*) #3

declare i8* @find_path_file(i8*) #3

declare void @file_error(i8*) #3

declare i32 @file_isdir(i8*) #3

declare %struct.variable* @find_variable(i8*) #3

declare i32 @array_rshift(%struct.array*, i32, i8*) #3

declare i8* @itos(i64) #3

declare i32 @executing_line_number() #3

declare i32 @lseek(i32, i32, i32) #3

declare i32 @read(i32, i8*, i32) #3

declare i32 @fstat(i32, %struct.stat*) #3

declare i32 @check_binary_file(i8*, i32) #3

declare void @internal_error(i8*, ...) #3

declare i32 @move_to_high_fd(i32, i32, i32) #3

declare i32 @dup2(i32, i32) #3

declare i32 @close(i32) #3

; Function Attrs: noinline nounwind
define internal void @init_interactive_script() #0 {
entry:
  call void @init_noninteractive()
  store i32 1, i32* @startup_state, align 4
  store i32 1, i32* @interactive_shell, align 4
  store i32 1, i32* @expand_aliases, align 4
  store i32 1, i32* @enable_history_list, align 4
  store i32 1, i32* @remember_on_history, align 4
  ret void
}

declare i32 @sh_unset_nodelay_mode(i32) #3

declare void @with_input_from_stdin() #3

declare void @with_input_from_buffered_stream(i32, i8*) #3

declare void @with_input_from_stream(%struct._IO_FILE*, i8*) #3

declare void @bash_history_reinit(i32) #3

declare i32 @sh_setlinebuf(%struct._IO_FILE*) #3

declare void @initialize_shell_builtins() #3

declare void @initialize_traps() #3

declare void @initialize_signals(i32) #3

declare i32 @gethostname(i8*, i32) #3

declare void @tilde_initialize() #3

declare void @initialize_shell_variables(i8**, i32) #3

declare i32 @initialize_job_control(i32) #3

declare void @initialize_bash_input() #3

declare void @initialize_flags() #3

declare void @initialize_shell_options(i32) #3

declare void @initialize_bashopts(i32) #3

declare void @delete_all_contexts(%struct.var_context*) #3

declare void @delete_all_variables(%struct.hash_table*) #3

declare void @reinit_special_variables() #3

declare void @bashline_reinitialize() #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare i8* @shell_version_string() #3

declare i32 @fputs(i8*, %struct._IO_FILE*) #3

declare i8* @strchr(i8*, i32) #3

declare i32 @shopt_setopt(i8*, i32) #3

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { returns_twice }
attributes #6 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
