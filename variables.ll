; ModuleID = 'variables.c'
source_filename = "variables.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.var_context = type { i8*, i32, i32, %struct.var_context*, %struct.var_context*, %struct.hash_table* }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct._list_of_items = type { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }
%struct._list_of_strings = type { i8**, i32, i32 }
%struct.name_and_function = type { i8*, void (i8*)* }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.timeval = type { i32, i32 }
%struct._IO_FILE = type opaque
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct._vlist = type { %struct.variable**, i32, i32 }
%struct._pathdata = type { i8*, i32 }
%struct.alias = type { i8*, i8*, i8 }

@global_variables = global %struct.var_context* null, align 4
@shell_variables = global %struct.var_context* null, align 4
@shell_functions = global %struct.hash_table* null, align 4
@shell_function_defs = global %struct.hash_table* null, align 4
@variable_context = global i32 0, align 4
@temporary_env = global %struct.hash_table* null, align 4
@rest_of_args = global %struct.word_list* null, align 4
@array_needs_making = global i32 1, align 4
@shell_level = global i32 0, align 4
@export_env = global i8** null, align 4
@read_but_dont_execute = external global i32, align 4
@.str = private unnamed_addr constant [11 x i8] c"BASH_FUNC_\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%%\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"() {\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"variables.c\00", align 1
@posixly_correct = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@.str.4 = private unnamed_addr constant [45 x i8] c"error importing function definition for `%s'\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"SHELLOPTS\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"_\00", align 1
@dollar_vars = common global [10 x i8*] zeroinitializer, align 4
@dollar_dollar_pid = common global i32 0, align 4
@.str.7 = private unnamed_addr constant [5 x i8] c"PATH\00", align 1
@.str.8 = private unnamed_addr constant [63 x i8] c"/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:.\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"dumb\00", align 1
@interactive_shell = external global i32, align 4
@.str.11 = private unnamed_addr constant [4 x i8] c"PS1\00", align 1
@primary_prompt = external global i8*, align 4
@.str.12 = private unnamed_addr constant [4 x i8] c"PS2\00", align 1
@secondary_prompt = external global i8*, align 4
@current_user = external global %struct.user_info, align 4
@.str.13 = private unnamed_addr constant [4 x i8] c"PS4\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"+ \00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"IFS\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c" \09\0A\00", align 1
@.str.17 = private unnamed_addr constant [10 x i8] c"MAILCHECK\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"600\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"60\00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"OPTIND\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"OPTERR\00", align 1
@sh_opterr = external global i32, align 4
@login_shell = external global i32, align 4
@.str.23 = private unnamed_addr constant [5 x i8] c"BASH\00", align 1
@.str.24 = private unnamed_addr constant [13 x i8] c"BASH_VERSION\00", align 1
@command_execution_string = external global i8*, align 4
@.str.25 = private unnamed_addr constant [22 x i8] c"BASH_EXECUTION_STRING\00", align 1
@.str.26 = private unnamed_addr constant [16 x i8] c"POSIXLY_CORRECT\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"POSIX_PEDANTIC\00", align 1
@remember_on_history = external global i32, align 4
@.str.28 = private unnamed_addr constant [14 x i8] c"~/.sh_history\00", align 1
@.str.29 = private unnamed_addr constant [16 x i8] c"~/.bash_history\00", align 1
@.str.30 = private unnamed_addr constant [9 x i8] c"HISTFILE\00", align 1
@.str.31 = private unnamed_addr constant [10 x i8] c"IGNOREEOF\00", align 1
@.str.32 = private unnamed_addr constant [10 x i8] c"ignoreeof\00", align 1
@.str.33 = private unnamed_addr constant [12 x i8] c"HISTCONTROL\00", align 1
@.str.34 = private unnamed_addr constant [11 x i8] c"HISTIGNORE\00", align 1
@.str.35 = private unnamed_addr constant [15 x i8] c"HISTTIMEFORMAT\00", align 1
@.str.36 = private unnamed_addr constant [14 x i8] c"BASH_XTRACEFD\00", align 1
@.str.37 = private unnamed_addr constant [12 x i8] c"BASH_COMPAT\00", align 1
@.str.38 = private unnamed_addr constant [9 x i8] c"FUNCNEST\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"SHLVL\00", align 1
@.str.40 = private unnamed_addr constant [42 x i8] c"shell level (%d) too high, resetting to 1\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.42 = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.43 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.44 = private unnamed_addr constant [11 x i8] c"shell_init\00", align 1
@.str.45 = private unnamed_addr constant [11 x i8] c"shell-init\00", align 1
@.str.46 = private unnamed_addr constant [7 x i8] c"OLDPWD\00", align 1
@.str.47 = private unnamed_addr constant [5 x i8] c"PPID\00", align 1
@winsize_assignment = internal global i32 0, align 4
@.str.48 = private unnamed_addr constant [6 x i8] c"LINES\00", align 1
@.str.49 = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@.str.50 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.51 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.52 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.53 = private unnamed_addr constant [4 x i8] c"%s=\00", align 1
@subshell_environment = external global i32, align 4
@seeded_subshell = internal global i32 0, align 4
@last_random_value = internal global i32 0, align 4
@.str.54 = private unnamed_addr constant [9 x i8] c"FUNCNAME\00", align 1
@expanding_redir = external global i32, align 4
@assigning_in_environment = external global i32, align 4
@executing_builtin = external global i32, align 4
@.str.55 = private unnamed_addr constant [28 x i8] c"%s: circular name reference\00", align 1
@.str.56 = private unnamed_addr constant [31 x i8] c"%s: removing nameref attribute\00", align 1
@.str.57 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@nameref_invalid_value = common global %struct.variable zeroinitializer, align 4
@last_table_searched = internal global %struct.hash_table* null, align 4
@.str.58 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.59 = private unnamed_addr constant [58 x i8] c"make_local_variable: no function context at current scope\00", align 1
@.str.60 = private unnamed_addr constant [39 x i8] c"%s: variable may not be assigned value\00", align 1
@no_invisible_vars = external global i32, align 4
@nameref_maxloop_value = internal global %struct.variable zeroinitializer, align 4
@.str.61 = private unnamed_addr constant [49 x i8] c"%s: nameref variable self references not allowed\00", align 1
@mark_modified_vars = external global i32, align 4
@.str.62 = private unnamed_addr constant [40 x i8] c"%s: assigning integer to name reference\00", align 1
@it_functions = external global %struct._list_of_items, align 4
@echo_command_at_execute = external global i32, align 4
@.str.63 = private unnamed_addr constant [30 x i8] c"%s: cannot unset: readonly %s\00", align 1
@.str.64 = private unnamed_addr constant [9 x i8] c"variable\00", align 1
@.str.65 = private unnamed_addr constant [58 x i8] c"all_local_variables: no function context at current scope\00", align 1
@.str.66 = private unnamed_addr constant [4 x i8] c") {\00", align 1
@export_env_index = internal global i32 0, align 4
@export_env_size = internal global i32 0, align 4
@environ = external global i8**, align 4
@restricted = external global i32, align 4
@.str.67 = private unnamed_addr constant [3 x i8] c"_=\00", align 1
@.str.68 = private unnamed_addr constant [64 x i8] c"pop_var_context: head of shell_variables not a function context\00", align 1
@.str.69 = private unnamed_addr constant [45 x i8] c"pop_var_context: no global_variables context\00", align 1
@.str.70 = private unnamed_addr constant [69 x i8] c"pop_scope: head of shell_variables not a temporary environment scope\00", align 1
@dollar_arg_stack_index = internal global i32 0, align 4
@dollar_arg_stack_slots = internal global i32 0, align 4
@dollar_arg_stack = internal global %struct.word_list** null, align 4
@.str.71 = private unnamed_addr constant [10 x i8] c"BASH_ARGV\00", align 1
@.str.72 = private unnamed_addr constant [10 x i8] c"BASH_ARGC\00", align 1
@stupidly_hack_special_variables.sv_sorted = internal global i32 0, align 4
@special_vars = internal global [37 x %struct.name_and_function] [%struct.name_and_function { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.37, i32 0, i32 0), void (i8*)* @sv_shcompat }, %struct.name_and_function { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.36, i32 0, i32 0), void (i8*)* @sv_xtracefd }, %struct.name_and_function { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.73, i32 0, i32 0), void (i8*)* @sv_comp_wordbreaks }, %struct.name_and_function { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.109, i32 0, i32 0), void (i8*)* @sv_execignore }, %struct.name_and_function { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.38, i32 0, i32 0), void (i8*)* @sv_funcnest }, %struct.name_and_function { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.74, i32 0, i32 0), void (i8*)* @sv_globignore }, %struct.name_and_function { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i32 0, i32 0), void (i8*)* @sv_history_control }, %struct.name_and_function { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.110, i32 0, i32 0), void (i8*)* @sv_histsize }, %struct.name_and_function { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34, i32 0, i32 0), void (i8*)* @sv_histignore }, %struct.name_and_function { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.111, i32 0, i32 0), void (i8*)* @sv_histsize }, %struct.name_and_function { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.35, i32 0, i32 0), void (i8*)* @sv_histtimefmt }, %struct.name_and_function { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.112, i32 0, i32 0), void (i8*)* @sv_hostfile }, %struct.name_and_function { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), void (i8*)* @sv_ifs }, %struct.name_and_function { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.31, i32 0, i32 0), void (i8*)* @sv_ignoreeof }, %struct.name_and_function { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.113, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.114, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.115, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.116, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.117, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.118, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.119, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.120, i32 0, i32 0), void (i8*)* @sv_mail }, %struct.name_and_function { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.17, i32 0, i32 0), void (i8*)* @sv_mail }, %struct.name_and_function { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.121, i32 0, i32 0), void (i8*)* @sv_mail }, %struct.name_and_function { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0), void (i8*)* @sv_opterr }, %struct.name_and_function { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i32 0, i32 0), void (i8*)* @sv_optind }, %struct.name_and_function { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), void (i8*)* @sv_path }, %struct.name_and_function { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.26, i32 0, i32 0), void (i8*)* @sv_strict_posix }, %struct.name_and_function { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), void (i8*)* @sv_terminal }, %struct.name_and_function { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.122, i32 0, i32 0), void (i8*)* @sv_terminal }, %struct.name_and_function { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.123, i32 0, i32 0), void (i8*)* @sv_terminal }, %struct.name_and_function { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.124, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.125, i32 0, i32 0), void (i8*)* @sv_locale }, %struct.name_and_function { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.126, i32 0, i32 0), void (i8*)* @sv_tz }, %struct.name_and_function { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.127, i32 0, i32 0), void (i8*)* @sv_histchars }, %struct.name_and_function { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.32, i32 0, i32 0), void (i8*)* @sv_ignoreeof }, %struct.name_and_function zeroinitializer], align 4
@.str.73 = private unnamed_addr constant [16 x i8] c"COMP_WORDBREAKS\00", align 1
@.str.74 = private unnamed_addr constant [11 x i8] c"GLOBIGNORE\00", align 1
@funcnest_max = external global i32, align 4
@privileged_mode = external global i32, align 4
@no_line_editing = external global i32, align 4
@hostname_list_initialized = external global i32, align 4
@history_lines_this_session = external global i32, align 4
@history_lines_in_file = external global i32, align 4
@history_control = external global i32, align 4
@.str.75 = private unnamed_addr constant [12 x i8] c"ignorespace\00", align 1
@.str.76 = private unnamed_addr constant [11 x i8] c"ignoredups\00", align 1
@.str.77 = private unnamed_addr constant [11 x i8] c"ignoreboth\00", align 1
@.str.78 = private unnamed_addr constant [10 x i8] c"erasedups\00", align 1
@history_expansion_char = external global i8, align 1
@history_subst_char = external global i8, align 1
@history_comment_char = external global i8, align 1
@history_write_timestamps = external global i32, align 4
@eof_encountered = external global i32, align 4
@ignoreeof = external global i32, align 4
@eof_encountered_limit = external global i32, align 4
@.str.79 = private unnamed_addr constant [11 x i8] c"PIPESTATUS\00", align 1
@set_pipestatus_from_exit.v = internal global [2 x i32] [i32 0, i32 -1], align 4
@.str.80 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.81 = private unnamed_addr constant [28 x i8] c"%s: %s: cannot open as FILE\00", align 1
@.str.82 = private unnamed_addr constant [48 x i8] c"%s: %s: invalid value for trace file descriptor\00", align 1
@shell_compatibility_level = external global i32, align 4
@.str.83 = private unnamed_addr constant [41 x i8] c"%s: %s: compatibility value out of range\00", align 1
@tempenv_assign_error = common global i32 0, align 4
@tempvar_list = common global i8** null, align 4
@tvlist_ind = common global i32 0, align 4
@.str.84 = private unnamed_addr constant [9 x i8] c"HOSTTYPE\00", align 1
@.str.85 = private unnamed_addr constant [7 x i8] c"x86_64\00", align 1
@.str.86 = private unnamed_addr constant [7 x i8] c"OSTYPE\00", align 1
@.str.87 = private unnamed_addr constant [10 x i8] c"linux-gnu\00", align 1
@.str.88 = private unnamed_addr constant [9 x i8] c"MACHTYPE\00", align 1
@.str.89 = private unnamed_addr constant [25 x i8] c"x86_64-unknown-linux-gnu\00", align 1
@.str.90 = private unnamed_addr constant [9 x i8] c"HOSTNAME\00", align 1
@current_host_name = external global i8*, align 4
@.str.91 = private unnamed_addr constant [6 x i8] c"SHELL\00", align 1
@shell_name = external global i8*, align 4
@.str.92 = private unnamed_addr constant [4 x i8] c"UID\00", align 1
@.str.93 = private unnamed_addr constant [5 x i8] c"EUID\00", align 1
@.str.94 = private unnamed_addr constant [14 x i8] c"BASH_VERSINFO\00", align 1
@dist_version = external global i8*, align 4
@patch_level = external global i32, align 4
@build_version = external global i32, align 4
@release_status = external global i8*, align 4
@rseed = internal global i32 1, align 4
@.str.95 = private unnamed_addr constant [13 x i8] c"BASH_COMMAND\00", align 1
@.str.96 = private unnamed_addr constant [14 x i8] c"BASH_SUBSHELL\00", align 1
@.str.97 = private unnamed_addr constant [7 x i8] c"RANDOM\00", align 1
@.str.98 = private unnamed_addr constant [7 x i8] c"LINENO\00", align 1
@.str.99 = private unnamed_addr constant [8 x i8] c"BASHPID\00", align 1
@.str.100 = private unnamed_addr constant [8 x i8] c"HISTCMD\00", align 1
@.str.101 = private unnamed_addr constant [9 x i8] c"DIRSTACK\00", align 1
@.str.102 = private unnamed_addr constant [7 x i8] c"GROUPS\00", align 1
@.str.103 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@.str.104 = private unnamed_addr constant [12 x i8] c"BASH_LINENO\00", align 1
@.str.105 = private unnamed_addr constant [10 x i8] c"BASH_CMDS\00", align 1
@.str.106 = private unnamed_addr constant [13 x i8] c"BASH_ALIASES\00", align 1
@.str.107 = private unnamed_addr constant [8 x i8] c"SECONDS\00", align 1
@seconds_value_assigned = internal global i64 0, align 8
@shell_start_time = external global i32, align 4
@the_printed_command_except_trap = external global i8*, align 4
@subshell_level = external global i32, align 4
@line_number_base = external global i32, align 4
@line_number = external global i32, align 4
@rl_completer_word_break_characters = external global i8*, align 4
@bash_readline_initialized = external global i32, align 4
@perform_hostname_completion = external global i32, align 4
@rl_basic_word_break_characters = external global i8*, align 4
@get_groupset.group_set = internal global i8** null, align 4
@hashed_filenames = external global %struct.hash_table*, align 4
@aliases = external global %struct.hash_table*, align 4
@.str.108 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.109 = private unnamed_addr constant [11 x i8] c"EXECIGNORE\00", align 1
@.str.110 = private unnamed_addr constant [13 x i8] c"HISTFILESIZE\00", align 1
@.str.111 = private unnamed_addr constant [9 x i8] c"HISTSIZE\00", align 1
@.str.112 = private unnamed_addr constant [9 x i8] c"HOSTFILE\00", align 1
@.str.113 = private unnamed_addr constant [5 x i8] c"LANG\00", align 1
@.str.114 = private unnamed_addr constant [7 x i8] c"LC_ALL\00", align 1
@.str.115 = private unnamed_addr constant [11 x i8] c"LC_COLLATE\00", align 1
@.str.116 = private unnamed_addr constant [9 x i8] c"LC_CTYPE\00", align 1
@.str.117 = private unnamed_addr constant [12 x i8] c"LC_MESSAGES\00", align 1
@.str.118 = private unnamed_addr constant [11 x i8] c"LC_NUMERIC\00", align 1
@.str.119 = private unnamed_addr constant [8 x i8] c"LC_TIME\00", align 1
@.str.120 = private unnamed_addr constant [5 x i8] c"MAIL\00", align 1
@.str.121 = private unnamed_addr constant [9 x i8] c"MAILPATH\00", align 1
@.str.122 = private unnamed_addr constant [8 x i8] c"TERMCAP\00", align 1
@.str.123 = private unnamed_addr constant [9 x i8] c"TERMINFO\00", align 1
@.str.124 = private unnamed_addr constant [11 x i8] c"TEXTDOMAIN\00", align 1
@.str.125 = private unnamed_addr constant [14 x i8] c"TEXTDOMAINDIR\00", align 1
@.str.126 = private unnamed_addr constant [3 x i8] c"TZ\00", align 1
@.str.127 = private unnamed_addr constant [10 x i8] c"histchars\00", align 1

; Function Attrs: noinline nounwind
define void @initialize_shell_variables(i8** %env, i32 %privmode) #0 {
entry:
  %env.addr = alloca i8**, align 4
  %privmode.addr = alloca i32, align 4
  %name = alloca i8*, align 4
  %string = alloca i8*, align 4
  %temp_string = alloca i8*, align 4
  %c = alloca i32, align 4
  %char_index = alloca i32, align 4
  %string_index = alloca i32, align 4
  %string_length = alloca i32, align 4
  %ro = alloca i32, align 4
  %temp_var = alloca %struct.variable*, align 4
  %namelen = alloca i32, align 4
  %tname = alloca i8*, align 4
  store i8** %env, i8*** %env.addr, align 4
  store i32 %privmode, i32* %privmode.addr, align 4
  call void @create_variable_tables()
  store i32 0, i32* %string_index, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end145, %if.then12, %entry
  %0 = load i8**, i8*** %env.addr, align 4
  %tobool = icmp ne i8** %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %1 = load i8**, i8*** %env.addr, align 4
  %2 = load i32, i32* %string_index, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %string_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  store i8* %3, i8** %string, align 4
  %tobool1 = icmp ne i8* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  store i32 0, i32* %char_index, align 4
  %5 = load i8*, i8** %string, align 4
  store i8* %5, i8** %name, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %6 = load i8*, i8** %string, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %string, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  store i32 %conv, i32* %c, align 4
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %land.rhs3, label %land.end5

land.rhs3:                                        ; preds = %while.cond
  %8 = load i32, i32* %c, align 4
  %cmp = icmp ne i32 %8, 61
  br label %land.end5

land.end5:                                        ; preds = %land.rhs3, %while.cond
  %9 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs3 ]
  br i1 %9, label %while.body, label %while.end

while.body:                                       ; preds = %land.end5
  br label %while.cond

while.end:                                        ; preds = %land.end5
  %10 = load i8*, i8** %string, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i32 -1
  %11 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %11 to i32
  %cmp8 = icmp eq i32 %conv7, 61
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %12 = load i8*, i8** %string, align 4
  %13 = load i8*, i8** %name, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %12 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %13 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub = sub nsw i32 %sub.ptr.sub, 1
  store i32 %sub, i32* %char_index, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  %14 = load i32, i32* %char_index, align 4
  %cmp10 = icmp eq i32 %14, 0
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  br label %for.cond

if.end13:                                         ; preds = %if.end
  %15 = load i8*, i8** %name, align 4
  %16 = load i32, i32* %char_index, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %15, i32 %16
  store i8 0, i8* %arrayidx14, align 1
  store %struct.variable* null, %struct.variable** %temp_var, align 4
  %17 = load i32, i32* %privmode.addr, align 4
  %cmp15 = icmp eq i32 %17, 0
  br i1 %cmp15, label %land.lhs.true, label %if.else89

land.lhs.true:                                    ; preds = %if.end13
  %18 = load i32, i32* @read_but_dont_execute, align 4
  %cmp17 = icmp eq i32 %18, 0
  br i1 %cmp17, label %land.lhs.true19, label %if.else89

land.lhs.true19:                                  ; preds = %land.lhs.true
  br i1 false, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true19
  br i1 true, label %land.lhs.true28, label %if.else89

cond.false:                                       ; preds = %land.lhs.true19
  %19 = load i8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), align 1
  %conv20 = sext i8 %19 to i32
  %20 = load i8*, i8** %name, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %21 to i32
  %cmp23 = icmp eq i32 %conv20, %conv22
  br i1 %cmp23, label %land.lhs.true25, label %if.else89

land.lhs.true25:                                  ; preds = %cond.false
  %22 = load i8*, i8** %name, align 4
  %call = call i32 @strncmp(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i8* %22, i32 10)
  %cmp26 = icmp eq i32 %call, 0
  br i1 %cmp26, label %land.lhs.true28, label %if.else89

land.lhs.true28:                                  ; preds = %land.lhs.true25, %cond.true
  %23 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), align 1
  %conv29 = sext i8 %23 to i32
  %24 = load i8*, i8** %name, align 4
  %25 = load i32, i32* %char_index, align 4
  %add.ptr = getelementptr inbounds i8, i8* %24, i32 %25
  %add.ptr30 = getelementptr inbounds i8, i8* %add.ptr, i32 -2
  %arrayidx31 = getelementptr inbounds i8, i8* %add.ptr30, i32 0
  %26 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %26 to i32
  %cmp33 = icmp eq i32 %conv29, %conv32
  br i1 %cmp33, label %land.lhs.true35, label %if.else89

land.lhs.true35:                                  ; preds = %land.lhs.true28
  %27 = load i8*, i8** %name, align 4
  %28 = load i32, i32* %char_index, align 4
  %add.ptr36 = getelementptr inbounds i8, i8* %27, i32 %28
  %add.ptr37 = getelementptr inbounds i8, i8* %add.ptr36, i32 -2
  %call38 = call i32 @strcmp(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* %add.ptr37)
  %cmp39 = icmp eq i32 %call38, 0
  br i1 %cmp39, label %land.lhs.true41, label %if.else89

land.lhs.true41:                                  ; preds = %land.lhs.true35
  br i1 false, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %land.lhs.true41
  br i1 true, label %if.then53, label %if.else89

cond.false43:                                     ; preds = %land.lhs.true41
  %29 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv44 = sext i8 %29 to i32
  %30 = load i8*, i8** %string, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %30, i32 0
  %31 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %31 to i32
  %cmp47 = icmp eq i32 %conv44, %conv46
  br i1 %cmp47, label %land.lhs.true49, label %if.else89

land.lhs.true49:                                  ; preds = %cond.false43
  %32 = load i8*, i8** %string, align 4
  %call50 = call i32 @strncmp(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* %32, i32 4)
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %if.then53, label %if.else89

if.then53:                                        ; preds = %land.lhs.true49, %cond.true42
  %33 = load i32, i32* %char_index, align 4
  %sub54 = sub nsw i32 %33, 10
  %sub55 = sub nsw i32 %sub54, 2
  store i32 %sub55, i32* %namelen, align 4
  %34 = load i8*, i8** %name, align 4
  %add.ptr56 = getelementptr inbounds i8, i8* %34, i32 10
  store i8* %add.ptr56, i8** %tname, align 4
  %35 = load i8*, i8** %tname, align 4
  %36 = load i32, i32* %namelen, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %35, i32 %36
  store i8 0, i8* %arrayidx57, align 1
  %37 = load i8*, i8** %string, align 4
  %call58 = call i32 @strlen(i8* %37)
  store i32 %call58, i32* %string_length, align 4
  %38 = load i32, i32* %namelen, align 4
  %39 = load i32, i32* %string_length, align 4
  %add = add i32 %38, %39
  %add59 = add i32 %add, 2
  %call60 = call i8* @sh_xmalloc(i32 %add59, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 382)
  store i8* %call60, i8** %temp_string, align 4
  %40 = load i8*, i8** %temp_string, align 4
  %41 = load i8*, i8** %tname, align 4
  %42 = load i32, i32* %namelen, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %40, i8* %41, i32 %42, i32 1, i1 false)
  %43 = load i8*, i8** %temp_string, align 4
  %44 = load i32, i32* %namelen, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %43, i32 %44
  store i8 32, i8* %arrayidx61, align 1
  %45 = load i8*, i8** %temp_string, align 4
  %46 = load i32, i32* %namelen, align 4
  %add.ptr62 = getelementptr inbounds i8, i8* %45, i32 %46
  %add.ptr63 = getelementptr inbounds i8, i8* %add.ptr62, i32 1
  %47 = load i8*, i8** %string, align 4
  %48 = load i32, i32* %string_length, align 4
  %add64 = add nsw i32 %48, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr63, i8* %47, i32 %add64, i32 1, i1 false)
  %49 = load i8*, i8** %tname, align 4
  %call65 = call i32 @absolute_program(i8* %49)
  %cmp66 = icmp eq i32 %call65, 0
  br i1 %cmp66, label %land.lhs.true68, label %if.else

land.lhs.true68:                                  ; preds = %if.then53
  %50 = load i32, i32* @posixly_correct, align 4
  %cmp69 = icmp eq i32 %50, 0
  br i1 %cmp69, label %if.then73, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true68
  %51 = load i8*, i8** %tname, align 4
  %call71 = call i32 @legal_identifier(i8* %51)
  %tobool72 = icmp ne i32 %call71, 0
  br i1 %tobool72, label %if.then73, label %if.else

if.then73:                                        ; preds = %lor.lhs.false, %land.lhs.true68
  %52 = load i8*, i8** %temp_string, align 4
  %53 = load i8*, i8** %tname, align 4
  %call74 = call i32 @parse_and_execute(i8* %52, i8* %53, i32 389)
  br label %if.end75

if.else:                                          ; preds = %lor.lhs.false, %if.then53
  %54 = load i8*, i8** %temp_string, align 4
  call void @sh_xfree(i8* %54, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 394)
  br label %if.end75

if.end75:                                         ; preds = %if.else, %if.then73
  %55 = load i8*, i8** %tname, align 4
  %call76 = call %struct.variable* @find_function(i8* %55)
  store %struct.variable* %call76, %struct.variable** %temp_var, align 4
  %tobool77 = icmp ne %struct.variable* %call76, null
  br i1 %tobool77, label %if.then78, label %if.else79

if.then78:                                        ; preds = %if.end75
  %56 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %56, i32 0, i32 5
  %57 = load i32, i32* %attributes, align 4
  %or = or i32 %57, 32769
  store i32 %or, i32* %attributes, align 4
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end87

if.else79:                                        ; preds = %if.end75
  %58 = load i8*, i8** %name, align 4
  %59 = load i8*, i8** %string, align 4
  %call80 = call %struct.variable* @bind_variable(i8* %58, i8* %59, i32 0)
  store %struct.variable* %call80, %struct.variable** %temp_var, align 4
  %tobool81 = icmp ne %struct.variable* %call80, null
  br i1 %tobool81, label %if.then82, label %if.end85

if.then82:                                        ; preds = %if.else79
  %60 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes83 = getelementptr inbounds %struct.variable, %struct.variable* %60, i32 0, i32 5
  %61 = load i32, i32* %attributes83, align 4
  %or84 = or i32 %61, 36865
  store i32 %or84, i32* %attributes83, align 4
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.then82, %if.else79
  store i32 1, i32* @last_command_exit_value, align 4
  %call86 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.4, i32 0, i32 0))
  %62 = load i8*, i8** %tname, align 4
  call void (i8*, ...) @report_error(i8* %call86, i8* %62)
  br label %if.end87

if.end87:                                         ; preds = %if.end85, %if.then78
  %63 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), align 1
  %64 = load i8*, i8** %tname, align 4
  %65 = load i32, i32* %namelen, align 4
  %arrayidx88 = getelementptr inbounds i8, i8* %64, i32 %65
  store i8 %63, i8* %arrayidx88, align 1
  br label %if.end132

if.else89:                                        ; preds = %land.lhs.true49, %cond.false43, %cond.true42, %land.lhs.true35, %land.lhs.true28, %land.lhs.true25, %cond.false, %cond.true, %land.lhs.true, %if.end13
  store i32 0, i32* %ro, align 4
  %66 = load i32, i32* @posixly_correct, align 4
  %tobool90 = icmp ne i32 %66, 0
  br i1 %tobool90, label %land.lhs.true91, label %if.end113

land.lhs.true91:                                  ; preds = %if.else89
  %67 = load i8*, i8** %name, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %67, i32 0
  %68 = load i8, i8* %arrayidx92, align 1
  %conv93 = sext i8 %68 to i32
  %69 = load i8, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), align 1
  %conv94 = sext i8 %69 to i32
  %cmp95 = icmp eq i32 %conv93, %conv94
  br i1 %cmp95, label %land.lhs.true97, label %if.end113

land.lhs.true97:                                  ; preds = %land.lhs.true91
  %70 = load i8*, i8** %name, align 4
  %call98 = call i32 @strcmp(i8* %70, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0))
  %cmp99 = icmp eq i32 %call98, 0
  br i1 %cmp99, label %if.then101, label %if.end113

if.then101:                                       ; preds = %land.lhs.true97
  %call102 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0))
  store %struct.variable* %call102, %struct.variable** %temp_var, align 4
  %71 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool103 = icmp ne %struct.variable* %71, null
  br i1 %tobool103, label %land.rhs104, label %land.end107

land.rhs104:                                      ; preds = %if.then101
  %72 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes105 = getelementptr inbounds %struct.variable, %struct.variable* %72, i32 0, i32 5
  %73 = load i32, i32* %attributes105, align 4
  %and = and i32 %73, 2
  %tobool106 = icmp ne i32 %and, 0
  br label %land.end107

land.end107:                                      ; preds = %land.rhs104, %if.then101
  %74 = phi i1 [ false, %if.then101 ], [ %tobool106, %land.rhs104 ]
  %land.ext = zext i1 %74 to i32
  store i32 %land.ext, i32* %ro, align 4
  %75 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool108 = icmp ne %struct.variable* %75, null
  br i1 %tobool108, label %if.then109, label %if.end112

if.then109:                                       ; preds = %land.end107
  %76 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes110 = getelementptr inbounds %struct.variable, %struct.variable* %76, i32 0, i32 5
  %77 = load i32, i32* %attributes110, align 4
  %and111 = and i32 %77, -3
  store i32 %and111, i32* %attributes110, align 4
  br label %if.end112

if.end112:                                        ; preds = %if.then109, %land.end107
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %land.lhs.true97, %land.lhs.true91, %if.else89
  %78 = load i8*, i8** %name, align 4
  %79 = load i8*, i8** %string, align 4
  %call114 = call %struct.variable* @bind_variable(i8* %78, i8* %79, i32 0)
  store %struct.variable* %call114, %struct.variable** %temp_var, align 4
  %80 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool115 = icmp ne %struct.variable* %80, null
  br i1 %tobool115, label %if.then116, label %if.end131

if.then116:                                       ; preds = %if.end113
  %81 = load i8*, i8** %name, align 4
  %call117 = call i32 @legal_identifier(i8* %81)
  %tobool118 = icmp ne i32 %call117, 0
  br i1 %tobool118, label %if.then119, label %if.else122

if.then119:                                       ; preds = %if.then116
  %82 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes120 = getelementptr inbounds %struct.variable, %struct.variable* %82, i32 0, i32 5
  %83 = load i32, i32* %attributes120, align 4
  %or121 = or i32 %83, 32769
  store i32 %or121, i32* %attributes120, align 4
  br label %if.end125

if.else122:                                       ; preds = %if.then116
  %84 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes123 = getelementptr inbounds %struct.variable, %struct.variable* %84, i32 0, i32 5
  %85 = load i32, i32* %attributes123, align 4
  %or124 = or i32 %85, 36865
  store i32 %or124, i32* %attributes123, align 4
  br label %if.end125

if.end125:                                        ; preds = %if.else122, %if.then119
  %86 = load i32, i32* %ro, align 4
  %tobool126 = icmp ne i32 %86, 0
  br i1 %tobool126, label %if.then127, label %if.end130

if.then127:                                       ; preds = %if.end125
  %87 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes128 = getelementptr inbounds %struct.variable, %struct.variable* %87, i32 0, i32 5
  %88 = load i32, i32* %attributes128, align 4
  %or129 = or i32 %88, 2
  store i32 %or129, i32* %attributes128, align 4
  br label %if.end130

if.end130:                                        ; preds = %if.then127, %if.end125
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end131

if.end131:                                        ; preds = %if.end130, %if.end113
  br label %if.end132

if.end132:                                        ; preds = %if.end131, %if.end87
  %89 = load i8*, i8** %name, align 4
  %90 = load i32, i32* %char_index, align 4
  %arrayidx133 = getelementptr inbounds i8, i8* %89, i32 %90
  store i8 61, i8* %arrayidx133, align 1
  %91 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool134 = icmp ne %struct.variable* %91, null
  br i1 %tobool134, label %land.lhs.true135, label %if.end145

land.lhs.true135:                                 ; preds = %if.end132
  %92 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes136 = getelementptr inbounds %struct.variable, %struct.variable* %92, i32 0, i32 5
  %93 = load i32, i32* %attributes136, align 4
  %and137 = and i32 %93, 8
  %cmp138 = icmp eq i32 %and137, 0
  br i1 %cmp138, label %if.then140, label %if.end145

if.then140:                                       ; preds = %land.lhs.true135
  %94 = load i8*, i8** %name, align 4
  %call141 = call i32 @strlen(i8* %94)
  %add142 = add i32 1, %call141
  %call143 = call i8* @sh_xmalloc(i32 %add142, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 459)
  %95 = load i8*, i8** %name, align 4
  %call144 = call i8* @strcpy(i8* %call143, i8* %95)
  %96 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %96, i32 0, i32 2
  store i8* %call144, i8** %exportstr, align 4
  br label %if.end145

if.end145:                                        ; preds = %if.then140, %land.lhs.true135, %if.end132
  br label %for.cond

for.end:                                          ; preds = %land.end
  call void @set_pwd()
  %97 = load i8*, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %call146 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* %97)
  store %struct.variable* %call146, %struct.variable** %temp_var, align 4
  %call147 = call i32 @getpid()
  store i32 %call147, i32* @dollar_dollar_pid, align 4
  %call148 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.8, i32 0, i32 0))
  store %struct.variable* %call148, %struct.variable** %temp_var, align 4
  %call149 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.10, i32 0, i32 0))
  store %struct.variable* %call149, %struct.variable** %temp_var, align 4
  %98 = load i32, i32* @interactive_shell, align 4
  %tobool150 = icmp ne i32 %98, 0
  br i1 %tobool150, label %if.then151, label %if.end154

if.then151:                                       ; preds = %for.end
  %99 = load i8*, i8** @primary_prompt, align 4
  %call152 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i8* %99)
  %100 = load i8*, i8** @secondary_prompt, align 4
  %call153 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8* %100)
  br label %if.end154

if.end154:                                        ; preds = %if.then151, %for.end
  %101 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp155 = icmp eq i32 %101, 0
  br i1 %cmp155, label %if.then157, label %if.else159

if.then157:                                       ; preds = %if.end154
  %call158 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i32 0)
  br label %if.end161

if.else159:                                       ; preds = %if.end154
  %call160 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0))
  br label %if.end161

if.end161:                                        ; preds = %if.else159, %if.then157
  %call162 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), i32 0)
  store %struct.variable* %call162, %struct.variable** %temp_var, align 4
  %102 = load %struct.variable*, %struct.variable** %temp_var, align 4
  call void @setifs(%struct.variable* %102)
  call void @set_machine_vars()
  %103 = load i32, i32* @interactive_shell, align 4
  %tobool163 = icmp ne i32 %103, 0
  br i1 %tobool163, label %if.then164, label %if.end169

if.then164:                                       ; preds = %if.end161
  %104 = load i32, i32* @posixly_correct, align 4
  %tobool165 = icmp ne i32 %104, 0
  %cond = select i1 %tobool165, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0)
  %call166 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.17, i32 0, i32 0), i8* %cond)
  store %struct.variable* %call166, %struct.variable** %temp_var, align 4
  %105 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes167 = getelementptr inbounds %struct.variable, %struct.variable* %105, i32 0, i32 5
  %106 = load i32, i32* %attributes167, align 4
  %or168 = or i32 %106, 16
  store i32 %or168, i32* %attributes167, align 4
  br label %if.end169

if.end169:                                        ; preds = %if.then164, %if.end161
  call void @initialize_shell_level()
  call void @set_ppid()
  %call170 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0), i32 0)
  store %struct.variable* %call170, %struct.variable** %temp_var, align 4
  %107 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes171 = getelementptr inbounds %struct.variable, %struct.variable* %107, i32 0, i32 5
  %108 = load i32, i32* %attributes171, align 4
  %or172 = or i32 %108, 16
  store i32 %or172, i32* %attributes171, align 4
  call void @getopts_reset(i32 0)
  %call173 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0), i32 0)
  store i32 1, i32* @sh_opterr, align 4
  %109 = load i32, i32* @login_shell, align 4
  %cmp174 = icmp eq i32 %109, 1
  br i1 %cmp174, label %land.lhs.true176, label %if.end180

land.lhs.true176:                                 ; preds = %if.end169
  %110 = load i32, i32* @posixly_correct, align 4
  %cmp177 = icmp eq i32 %110, 0
  br i1 %cmp177, label %if.then179, label %if.end180

if.then179:                                       ; preds = %land.lhs.true176
  call void @set_home_var()
  br label %if.end180

if.end180:                                        ; preds = %if.then179, %land.lhs.true176, %if.end169
  %call181 = call i8* @get_bash_name()
  store i8* %call181, i8** %name, align 4
  %111 = load i8*, i8** %name, align 4
  %call182 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i32 0, i32 0), i8* %111, i32 0)
  store %struct.variable* %call182, %struct.variable** %temp_var, align 4
  %112 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %112, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 552)
  call void @set_shell_var()
  %call183 = call i8* @shell_version_string()
  %call184 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.24, i32 0, i32 0), i8* %call183, i32 0)
  call void @make_vers_array()
  %113 = load i8*, i8** @command_execution_string, align 4
  %tobool185 = icmp ne i8* %113, null
  br i1 %tobool185, label %if.then186, label %if.end188

if.then186:                                       ; preds = %if.end180
  %114 = load i8*, i8** @command_execution_string, align 4
  %call187 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0), i8* %114, i32 0)
  br label %if.end188

if.end188:                                        ; preds = %if.then186, %if.end180
  %call189 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.26, i32 0, i32 0))
  store %struct.variable* %call189, %struct.variable** %temp_var, align 4
  %115 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool190 = icmp ne %struct.variable* %115, null
  br i1 %tobool190, label %if.end193, label %if.then191

if.then191:                                       ; preds = %if.end188
  %call192 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i32 0, i32 0))
  store %struct.variable* %call192, %struct.variable** %temp_var, align 4
  br label %if.end193

if.end193:                                        ; preds = %if.then191, %if.end188
  %116 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool194 = icmp ne %struct.variable* %116, null
  br i1 %tobool194, label %land.lhs.true195, label %if.end201

land.lhs.true195:                                 ; preds = %if.end193
  %117 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes196 = getelementptr inbounds %struct.variable, %struct.variable* %117, i32 0, i32 5
  %118 = load i32, i32* %attributes196, align 4
  %and197 = and i32 %118, 32768
  %tobool198 = icmp ne i32 %and197, 0
  br i1 %tobool198, label %if.then199, label %if.end201

if.then199:                                       ; preds = %land.lhs.true195
  %119 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %name200 = getelementptr inbounds %struct.variable, %struct.variable* %119, i32 0, i32 0
  %120 = load i8*, i8** %name200, align 4
  call void @sv_strict_posix(i8* %120)
  br label %if.end201

if.end201:                                        ; preds = %if.then199, %land.lhs.true195, %if.end193
  %121 = load i32, i32* @remember_on_history, align 4
  %tobool202 = icmp ne i32 %121, 0
  br i1 %tobool202, label %if.then203, label %if.end208

if.then203:                                       ; preds = %if.end201
  %122 = load i32, i32* @posixly_correct, align 4
  %tobool204 = icmp ne i32 %122, 0
  %cond205 = select i1 %tobool204, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.29, i32 0, i32 0)
  %call206 = call i8* @bash_tilde_expand(i8* %cond205, i32 0)
  store i8* %call206, i8** %name, align 4
  %123 = load i8*, i8** %name, align 4
  %call207 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.30, i32 0, i32 0), i8* %123)
  %124 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %124, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 586)
  br label %if.end208

if.end208:                                        ; preds = %if.then203, %if.end201
  call void @seedrand()
  %125 = load i32, i32* @interactive_shell, align 4
  %tobool209 = icmp ne i32 %125, 0
  br i1 %tobool209, label %if.then210, label %if.end224

if.then210:                                       ; preds = %if.end208
  %call211 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.31, i32 0, i32 0))
  store %struct.variable* %call211, %struct.variable** %temp_var, align 4
  %126 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool212 = icmp ne %struct.variable* %126, null
  br i1 %tobool212, label %if.end215, label %if.then213

if.then213:                                       ; preds = %if.then210
  %call214 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.32, i32 0, i32 0))
  store %struct.variable* %call214, %struct.variable** %temp_var, align 4
  br label %if.end215

if.end215:                                        ; preds = %if.then213, %if.then210
  %127 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool216 = icmp ne %struct.variable* %127, null
  br i1 %tobool216, label %land.lhs.true217, label %if.end223

land.lhs.true217:                                 ; preds = %if.end215
  %128 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes218 = getelementptr inbounds %struct.variable, %struct.variable* %128, i32 0, i32 5
  %129 = load i32, i32* %attributes218, align 4
  %and219 = and i32 %129, 32768
  %tobool220 = icmp ne i32 %and219, 0
  br i1 %tobool220, label %if.then221, label %if.end223

if.then221:                                       ; preds = %land.lhs.true217
  %130 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %name222 = getelementptr inbounds %struct.variable, %struct.variable* %130, i32 0, i32 0
  %131 = load i8*, i8** %name222, align 4
  call void @sv_ignoreeof(i8* %131)
  br label %if.end223

if.end223:                                        ; preds = %if.then221, %land.lhs.true217, %if.end215
  br label %if.end224

if.end224:                                        ; preds = %if.end223, %if.end208
  %132 = load i32, i32* @interactive_shell, align 4
  %tobool225 = icmp ne i32 %132, 0
  br i1 %tobool225, label %land.lhs.true226, label %if.end229

land.lhs.true226:                                 ; preds = %if.end224
  %133 = load i32, i32* @remember_on_history, align 4
  %tobool227 = icmp ne i32 %133, 0
  br i1 %tobool227, label %if.then228, label %if.end229

if.then228:                                       ; preds = %land.lhs.true226
  call void @sv_history_control(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i32 0, i32 0))
  call void @sv_histignore(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34, i32 0, i32 0))
  call void @sv_histtimefmt(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.35, i32 0, i32 0))
  br label %if.end229

if.end229:                                        ; preds = %if.then228, %land.lhs.true226, %if.end224
  call void @uidset()
  %call230 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.36, i32 0, i32 0))
  store %struct.variable* %call230, %struct.variable** %temp_var, align 4
  %134 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool231 = icmp ne %struct.variable* %134, null
  br i1 %tobool231, label %land.lhs.true232, label %if.end238

land.lhs.true232:                                 ; preds = %if.end229
  %135 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes233 = getelementptr inbounds %struct.variable, %struct.variable* %135, i32 0, i32 5
  %136 = load i32, i32* %attributes233, align 4
  %and234 = and i32 %136, 32768
  %tobool235 = icmp ne i32 %and234, 0
  br i1 %tobool235, label %if.then236, label %if.end238

if.then236:                                       ; preds = %land.lhs.true232
  %137 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %name237 = getelementptr inbounds %struct.variable, %struct.variable* %137, i32 0, i32 0
  %138 = load i8*, i8** %name237, align 4
  call void @sv_xtracefd(i8* %138)
  br label %if.end238

if.end238:                                        ; preds = %if.then236, %land.lhs.true232, %if.end229
  call void @sv_shcompat(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.37, i32 0, i32 0))
  call void @sv_funcnest(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.38, i32 0, i32 0))
  call void @initialize_dynamic_variables()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @create_variable_tables() #0 {
entry:
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %cmp = icmp eq %struct.var_context* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call %struct.var_context* @new_var_context(i8* null, i32 0)
  store %struct.var_context* %call, %struct.var_context** @global_variables, align 4
  store %struct.var_context* %call, %struct.var_context** @shell_variables, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %scope = getelementptr inbounds %struct.var_context, %struct.var_context* %1, i32 0, i32 1
  store i32 0, i32* %scope, align 4
  %call1 = call %struct.hash_table* @hash_create(i32 1024)
  %2 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 5
  store %struct.hash_table* %call1, %struct.hash_table** %table, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %cmp2 = icmp eq %struct.hash_table* %3, null
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call %struct.hash_table* @hash_create(i32 512)
  store %struct.hash_table* %call4, %struct.hash_table** @shell_functions, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %4 = load %struct.hash_table*, %struct.hash_table** @shell_function_defs, align 4
  %cmp6 = icmp eq %struct.hash_table* %4, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end5
  %call8 = call %struct.hash_table* @hash_create(i32 512)
  store %struct.hash_table* %call8, %struct.hash_table** @shell_function_defs, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end5
  ret void
}

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare i32 @strlen(i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @absolute_program(i8*) #1

declare i32 @legal_identifier(i8*) #1

declare i32 @parse_and_execute(i8*, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @find_function(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %call = call %struct.variable* @hash_lookup(i8* %0, %struct.hash_table* %1)
  ret %struct.variable* %call
}

; Function Attrs: noinline nounwind
define %struct.variable* @bind_variable(i8* %name, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  %nv = alloca %struct.variable*, align 4
  %vc = alloca %struct.var_context*, align 4
  %nvc = alloca %struct.var_context*, align 4
  %level = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %cmp = icmp eq %struct.var_context* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @create_variable_tables()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end3

land.lhs.true:                                    ; preds = %if.end
  %2 = load i8*, i8** %value.addr, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %land.lhs.true
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i8*, i8** %value.addr, align 4
  %call = call %struct.variable* @bind_tempenv_variable(i8* %3, i8* %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %land.lhs.true, %if.end
  %5 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %5, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3
  %6 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool4 = icmp ne %struct.var_context* %6, null
  br i1 %tobool4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags5 = getelementptr inbounds %struct.var_context, %struct.var_context* %7, i32 0, i32 2
  %8 = load i32, i32* %flags5, align 4
  %and = and i32 %8, 4
  %cmp6 = icmp ne i32 %and, 0
  br i1 %cmp6, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %9 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags7 = getelementptr inbounds %struct.var_context, %struct.var_context* %9, i32 0, i32 2
  %10 = load i32, i32* %flags7, align 4
  %and8 = and i32 %10, 8
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %if.then10, label %if.end66

if.then10:                                        ; preds = %lor.lhs.false, %for.body
  %11 = load i8*, i8** %name.addr, align 4
  %12 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %12, i32 0, i32 5
  %13 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call11 = call %struct.variable* @hash_lookup(i8* %11, %struct.hash_table* %13)
  store %struct.variable* %call11, %struct.variable** %v, align 4
  %14 = load %struct.var_context*, %struct.var_context** %vc, align 4
  store %struct.var_context* %14, %struct.var_context** %nvc, align 4
  %15 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool12 = icmp ne %struct.variable* %15, null
  br i1 %tobool12, label %land.lhs.true13, label %if.end59

land.lhs.true13:                                  ; preds = %if.then10
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 5
  %17 = load i32, i32* %attributes, align 4
  %and14 = and i32 %17, 2048
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end59

if.then16:                                        ; preds = %land.lhs.true13
  %18 = load %struct.variable*, %struct.variable** %v, align 4
  %19 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %call17 = call %struct.variable* @find_variable_nameref_context(%struct.variable* %18, %struct.var_context* %19, %struct.var_context** %nvc)
  store %struct.variable* %call17, %struct.variable** %nv, align 4
  %20 = load %struct.variable*, %struct.variable** %nv, align 4
  %cmp18 = icmp eq %struct.variable* %20, null
  br i1 %cmp18, label %if.then19, label %if.else51

if.then19:                                        ; preds = %if.then16
  %21 = load %struct.variable*, %struct.variable** %v, align 4
  %22 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %call20 = call %struct.variable* @find_variable_last_nameref_context(%struct.variable* %21, %struct.var_context* %22, %struct.var_context** %nvc)
  store %struct.variable* %call20, %struct.variable** %nv, align 4
  %23 = load %struct.variable*, %struct.variable** %nv, align 4
  %tobool21 = icmp ne %struct.variable* %23, null
  br i1 %tobool21, label %land.lhs.true22, label %if.else43

land.lhs.true22:                                  ; preds = %if.then19
  %24 = load %struct.variable*, %struct.variable** %nv, align 4
  %attributes23 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes23, align 4
  %and24 = and i32 %25, 2048
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %if.then26, label %if.else43

if.then26:                                        ; preds = %land.lhs.true22
  %26 = load %struct.variable*, %struct.variable** %nv, align 4
  %value27 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 1
  %27 = load i8*, i8** %value27, align 4
  %cmp28 = icmp eq i8* %27, null
  br i1 %cmp28, label %if.then29, label %if.else

if.then29:                                        ; preds = %if.then26
  %28 = load %struct.variable*, %struct.variable** %nv, align 4
  %name30 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 0
  %29 = load i8*, i8** %name30, align 4
  %30 = load i8*, i8** %value.addr, align 4
  %31 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %table31 = getelementptr inbounds %struct.var_context, %struct.var_context* %31, i32 0, i32 5
  %32 = load %struct.hash_table*, %struct.hash_table** %table31, align 4
  %33 = load i32, i32* %flags.addr, align 4
  %call32 = call %struct.variable* @bind_variable_internal(i8* %29, i8* %30, %struct.hash_table* %32, i32 0, i32 %33)
  store %struct.variable* %call32, %struct.variable** %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then26
  %34 = load %struct.variable*, %struct.variable** %nv, align 4
  %value33 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 1
  %35 = load i8*, i8** %value33, align 4
  %call34 = call i32 @valid_array_reference(i8* %35, i32 0)
  %tobool35 = icmp ne i32 %call34, 0
  br i1 %tobool35, label %if.then36, label %if.else39

if.then36:                                        ; preds = %if.else
  %36 = load %struct.variable*, %struct.variable** %nv, align 4
  %value37 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 1
  %37 = load i8*, i8** %value37, align 4
  %38 = load i8*, i8** %value.addr, align 4
  %39 = load i32, i32* %flags.addr, align 4
  %call38 = call %struct.variable* @assign_array_element(i8* %37, i8* %38, i32 %39)
  store %struct.variable* %call38, %struct.variable** %retval, align 4
  br label %return

if.else39:                                        ; preds = %if.else
  %40 = load %struct.variable*, %struct.variable** %nv, align 4
  %value40 = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 1
  %41 = load i8*, i8** %value40, align 4
  %42 = load i8*, i8** %value.addr, align 4
  %43 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %table41 = getelementptr inbounds %struct.var_context, %struct.var_context* %43, i32 0, i32 5
  %44 = load %struct.hash_table*, %struct.hash_table** %table41, align 4
  %45 = load i32, i32* %flags.addr, align 4
  %call42 = call %struct.variable* @bind_variable_internal(i8* %41, i8* %42, %struct.hash_table* %44, i32 0, i32 %45)
  store %struct.variable* %call42, %struct.variable** %retval, align 4
  br label %return

if.else43:                                        ; preds = %land.lhs.true22, %if.then19
  %46 = load %struct.variable*, %struct.variable** %nv, align 4
  %cmp44 = icmp eq %struct.variable* %46, @nameref_maxloop_value
  br i1 %cmp44, label %if.then45, label %if.else48

if.then45:                                        ; preds = %if.else43
  %call46 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.55, i32 0, i32 0))
  %47 = load %struct.variable*, %struct.variable** %v, align 4
  %name47 = getelementptr inbounds %struct.variable, %struct.variable* %47, i32 0, i32 0
  %48 = load i8*, i8** %name47, align 4
  call void (i8*, ...) @internal_warning(i8* %call46, i8* %48)
  store %struct.variable* null, %struct.variable** %v, align 4
  br label %if.end49

if.else48:                                        ; preds = %if.else43
  %49 = load %struct.variable*, %struct.variable** %nv, align 4
  store %struct.variable* %49, %struct.variable** %v, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.else48, %if.then45
  br label %if.end50

if.end50:                                         ; preds = %if.end49
  br label %if.end58

if.else51:                                        ; preds = %if.then16
  %50 = load %struct.variable*, %struct.variable** %nv, align 4
  %cmp52 = icmp eq %struct.variable* %50, @nameref_maxloop_value
  br i1 %cmp52, label %if.then53, label %if.else56

if.then53:                                        ; preds = %if.else51
  %call54 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.55, i32 0, i32 0))
  %51 = load %struct.variable*, %struct.variable** %v, align 4
  %name55 = getelementptr inbounds %struct.variable, %struct.variable* %51, i32 0, i32 0
  %52 = load i8*, i8** %name55, align 4
  call void (i8*, ...) @internal_warning(i8* %call54, i8* %52)
  store %struct.variable* null, %struct.variable** %v, align 4
  br label %if.end57

if.else56:                                        ; preds = %if.else51
  %53 = load %struct.variable*, %struct.variable** %nv, align 4
  store %struct.variable* %53, %struct.variable** %v, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.else56, %if.then53
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %if.end50
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %land.lhs.true13, %if.then10
  %54 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool60 = icmp ne %struct.variable* %54, null
  br i1 %tobool60, label %if.then61, label %if.end65

if.then61:                                        ; preds = %if.end59
  %55 = load %struct.variable*, %struct.variable** %v, align 4
  %name62 = getelementptr inbounds %struct.variable, %struct.variable* %55, i32 0, i32 0
  %56 = load i8*, i8** %name62, align 4
  %57 = load i8*, i8** %value.addr, align 4
  %58 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %table63 = getelementptr inbounds %struct.var_context, %struct.var_context* %58, i32 0, i32 5
  %59 = load %struct.hash_table*, %struct.hash_table** %table63, align 4
  %60 = load i32, i32* %flags.addr, align 4
  %call64 = call %struct.variable* @bind_variable_internal(i8* %56, i8* %57, %struct.hash_table* %59, i32 0, i32 %60)
  store %struct.variable* %call64, %struct.variable** %retval, align 4
  br label %return

if.end65:                                         ; preds = %if.end59
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end66
  %61 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %61, i32 0, i32 4
  %62 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %62, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %63 = load i8*, i8** %name.addr, align 4
  %64 = load i8*, i8** %value.addr, align 4
  %65 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table67 = getelementptr inbounds %struct.var_context, %struct.var_context* %65, i32 0, i32 5
  %66 = load %struct.hash_table*, %struct.hash_table** %table67, align 4
  %67 = load i32, i32* %flags.addr, align 4
  %call68 = call %struct.variable* @bind_variable_internal(i8* %63, i8* %64, %struct.hash_table* %66, i32 0, i32 %67)
  store %struct.variable* %call68, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then61, %if.else39, %if.then36, %if.then29
  %68 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %68
}

declare void @report_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %flags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.hash_table* null, %struct.hash_table** @last_table_searched, align 4
  store i32 0, i32* %flags, align 4
  %0 = load i32, i32* @expanding_redir, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @assigning_in_environment, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %2 = load i32, i32* @executing_builtin, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %entry
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i32, i32* %flags, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %4, i32 %5)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool2 = icmp ne %struct.variable* %6, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end7

land.lhs.true3:                                   ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 2048
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %land.lhs.true3
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %call6 = call %struct.variable* @find_variable_nameref(%struct.variable* %9)
  store %struct.variable* %call6, %struct.variable** %v, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %land.lhs.true3, %if.end
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %10
}

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @set_pwd() #0 {
entry:
  %temp_var = alloca %struct.variable*, align 4
  %home_var = alloca %struct.variable*, align 4
  %temp_string = alloca i8*, align 4
  %home_string = alloca i8*, align 4
  %current_dir = alloca i8*, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %home_var, align 4
  %0 = load %struct.variable*, %struct.variable** %home_var, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %home_var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %2, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %home_string, align 4
  %call1 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.42, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %temp_var, align 4
  %3 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool2 = icmp ne %struct.variable* %3, null
  br i1 %tobool2, label %land.lhs.true, label %if.else17

land.lhs.true:                                    ; preds = %cond.end
  %4 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, 32768
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %land.lhs.true4, label %if.else17

land.lhs.true4:                                   ; preds = %land.lhs.true
  %6 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value5, align 4
  store i8* %7, i8** %temp_string, align 4
  %tobool6 = icmp ne i8* %7, null
  br i1 %tobool6, label %land.lhs.true7, label %if.else17

land.lhs.true7:                                   ; preds = %land.lhs.true4
  %8 = load i8*, i8** %temp_string, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %9 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %land.lhs.true9, label %if.else17

land.lhs.true9:                                   ; preds = %land.lhs.true7
  %10 = load i8*, i8** %temp_string, align 4
  %call10 = call i32 @same_file(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.43, i32 0, i32 0), %struct.stat* null, %struct.stat* null)
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then, label %if.else17

if.then:                                          ; preds = %land.lhs.true9
  %11 = load i8*, i8** %temp_string, align 4
  %call12 = call i8* @sh_canonpath(i8* %11, i32 3)
  store i8* %call12, i8** %current_dir, align 4
  %12 = load i8*, i8** %current_dir, align 4
  %cmp13 = icmp eq i8* %12, null
  br i1 %cmp13, label %if.then15, label %if.else

if.then15:                                        ; preds = %if.then
  %call16 = call i8* @get_working_directory(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.44, i32 0, i32 0))
  store i8* %call16, i8** %current_dir, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %13 = load i8*, i8** %current_dir, align 4
  call void @set_working_directory(i8* %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then15
  %14 = load i8*, i8** %current_dir, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 877)
  br label %if.end40

if.else17:                                        ; preds = %land.lhs.true9, %land.lhs.true7, %land.lhs.true4, %land.lhs.true, %cond.end
  %15 = load i8*, i8** %home_string, align 4
  %tobool18 = icmp ne i8* %15, null
  br i1 %tobool18, label %land.lhs.true19, label %if.else29

land.lhs.true19:                                  ; preds = %if.else17
  %16 = load i32, i32* @interactive_shell, align 4
  %tobool20 = icmp ne i32 %16, 0
  br i1 %tobool20, label %land.lhs.true21, label %if.else29

land.lhs.true21:                                  ; preds = %land.lhs.true19
  %17 = load i32, i32* @login_shell, align 4
  %tobool22 = icmp ne i32 %17, 0
  br i1 %tobool22, label %land.lhs.true23, label %if.else29

land.lhs.true23:                                  ; preds = %land.lhs.true21
  %18 = load i8*, i8** %home_string, align 4
  %call24 = call i32 @same_file(i8* %18, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.43, i32 0, i32 0), %struct.stat* null, %struct.stat* null)
  %tobool25 = icmp ne i32 %call24, 0
  br i1 %tobool25, label %if.then26, label %if.else29

if.then26:                                        ; preds = %land.lhs.true23
  %19 = load i8*, i8** %home_string, align 4
  call void @set_working_directory(i8* %19)
  %20 = load i8*, i8** %home_string, align 4
  %call27 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.42, i32 0, i32 0), i8* %20, i32 0)
  store %struct.variable* %call27, %struct.variable** %temp_var, align 4
  br label %do.body

do.body:                                          ; preds = %if.then26
  %21 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes28 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 5
  %22 = load i32, i32* %attributes28, align 4
  %or = or i32 %22, 1
  store i32 %or, i32* %attributes28, align 4
  store i32 1, i32* @array_needs_making, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end39

if.else29:                                        ; preds = %land.lhs.true23, %land.lhs.true21, %land.lhs.true19, %if.else17
  %call30 = call i8* @get_working_directory(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.45, i32 0, i32 0))
  store i8* %call30, i8** %temp_string, align 4
  %23 = load i8*, i8** %temp_string, align 4
  %tobool31 = icmp ne i8* %23, null
  br i1 %tobool31, label %if.then32, label %if.end38

if.then32:                                        ; preds = %if.else29
  %24 = load i8*, i8** %temp_string, align 4
  %call33 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.42, i32 0, i32 0), i8* %24, i32 0)
  store %struct.variable* %call33, %struct.variable** %temp_var, align 4
  br label %do.body34

do.body34:                                        ; preds = %if.then32
  %25 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes35 = getelementptr inbounds %struct.variable, %struct.variable* %25, i32 0, i32 5
  %26 = load i32, i32* %attributes35, align 4
  %or36 = or i32 %26, 1
  store i32 %or36, i32* %attributes35, align 4
  store i32 1, i32* @array_needs_making, align 4
  br label %do.end37

do.end37:                                         ; preds = %do.body34
  %27 = load i8*, i8** %temp_string, align 4
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 893)
  br label %if.end38

if.end38:                                         ; preds = %do.end37, %if.else29
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %do.end
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end
  %call41 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.46, i32 0, i32 0))
  store %struct.variable* %call41, %struct.variable** %temp_var, align 4
  %28 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %cmp42 = icmp eq %struct.variable* %28, null
  br i1 %cmp42, label %if.then52, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end40
  %29 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %value44 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 1
  %30 = load i8*, i8** %value44, align 4
  %cmp45 = icmp eq i8* %30, null
  br i1 %cmp45, label %if.then52, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %lor.lhs.false
  %31 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %value48 = getelementptr inbounds %struct.variable, %struct.variable* %31, i32 0, i32 1
  %32 = load i8*, i8** %value48, align 4
  %call49 = call i32 @file_isdir(i8* %32)
  %cmp50 = icmp eq i32 %call49, 0
  br i1 %cmp50, label %if.then52, label %if.end56

if.then52:                                        ; preds = %lor.lhs.false47, %lor.lhs.false, %if.end40
  %call53 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.46, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call53, %struct.variable** %temp_var, align 4
  %33 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes54 = getelementptr inbounds %struct.variable, %struct.variable* %33, i32 0, i32 5
  %34 = load i32, i32* %attributes54, align 4
  %or55 = or i32 %34, 4097
  store i32 %or55, i32* %attributes54, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then52, %lor.lhs.false47
  ret void
}

; Function Attrs: noinline nounwind
define %struct.variable* @set_if_not(i8* %name, i8* %value) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %cmp = icmp eq %struct.var_context* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @create_variable_tables()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %1)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp1 = icmp eq %struct.variable* %2, null
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i8*, i8** %value.addr, align 4
  %5 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %5, i32 0, i32 5
  %6 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call3 = call %struct.variable* @bind_variable_internal(i8* %3, i8* %4, %struct.hash_table* %6, i32 1, i32 0)
  store %struct.variable* %call3, %struct.variable** %v, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %7
}

declare i32 @getpid() #1

declare void @setifs(%struct.variable*) #1

; Function Attrs: noinline nounwind
define internal void @set_machine_vars() #0 {
entry:
  %temp_var = alloca %struct.variable*, align 4
  %call = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.84, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.85, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %temp_var, align 4
  %call1 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.87, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %temp_var, align 4
  %call2 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.88, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.89, i32 0, i32 0))
  store %struct.variable* %call2, %struct.variable** %temp_var, align 4
  %0 = load i8*, i8** @current_host_name, align 4
  %call3 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.90, i32 0, i32 0), i8* %0)
  store %struct.variable* %call3, %struct.variable** %temp_var, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @initialize_shell_level() #0 {
entry:
  call void @adjust_shell_level(i32 1)
  ret void
}

; Function Attrs: noinline nounwind
define void @set_ppid() #0 {
entry:
  %namebuf = alloca [12 x i8], align 1
  %name = alloca i8*, align 4
  %temp_var = alloca %struct.variable*, align 4
  %call = call i32 @getppid()
  %conv = sext i32 %call to i64
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %namebuf, i32 0, i32 0
  %call1 = call i8* @inttostr(i64 %conv, i8* %arraydecay, i32 12)
  store i8* %call1, i8** %name, align 4
  %call2 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.47, i32 0, i32 0))
  store %struct.variable* %call2, %struct.variable** %temp_var, align 4
  %0 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, -4
  store i32 %and, i32* %attributes, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %name, align 4
  %call3 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.47, i32 0, i32 0), i8* %3, i32 0)
  store %struct.variable* %call3, %struct.variable** %temp_var, align 4
  %4 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes4 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes4, align 4
  %or = or i32 %5, 18
  store i32 %or, i32* %attributes4, align 4
  ret void
}

declare void @getopts_reset(i32) #1

; Function Attrs: noinline nounwind
define internal void @set_home_var() #0 {
entry:
  %temp_var = alloca %struct.variable*, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %temp_var, align 4
  %0 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @sh_get_home_dir()
  %call2 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0), i8* %call1, i32 0)
  store %struct.variable* %call2, %struct.variable** %temp_var, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal i8* @get_bash_name() #0 {
entry:
  %name = alloca i8*, align 4
  %cdir = alloca i8*, align 4
  %len = alloca i32, align 4
  %tname = alloca i8*, align 4
  %s = alloca i32, align 4
  %0 = load i32, i32* @login_shell, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @shell_name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp ne i32 %conv, 47
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %cmp3 = icmp eq i8* %3, null
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  call void @get_current_user_info()
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  %4 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %call = call i32 @strlen(i8* %4)
  %add = add i32 1, %call
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 733)
  %5 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %5)
  store i8* %call7, i8** %name, align 4
  br label %if.end81

if.else:                                          ; preds = %land.lhs.true, %entry
  %6 = load i8*, i8** @shell_name, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %7 to i32
  %cmp10 = icmp eq i32 %conv9, 47
  br i1 %cmp10, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.else
  %8 = load i8*, i8** @shell_name, align 4
  %call13 = call i32 @strlen(i8* %8)
  %add14 = add i32 1, %call13
  %call15 = call i8* @sh_xmalloc(i32 %add14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 736)
  %9 = load i8*, i8** @shell_name, align 4
  %call16 = call i8* @strcpy(i8* %call15, i8* %9)
  store i8* %call16, i8** %name, align 4
  br label %if.end80

if.else17:                                        ; preds = %if.else
  %10 = load i8*, i8** @shell_name, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %11 to i32
  %cmp20 = icmp eq i32 %conv19, 46
  br i1 %cmp20, label %land.lhs.true22, label %if.else44

land.lhs.true22:                                  ; preds = %if.else17
  %12 = load i8*, i8** @shell_name, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %12, i32 1
  %13 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %13 to i32
  %cmp25 = icmp eq i32 %conv24, 47
  br i1 %cmp25, label %if.then27, label %if.else44

if.then27:                                        ; preds = %land.lhs.true22
  %call28 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.42, i32 0, i32 0))
  store i8* %call28, i8** %cdir, align 4
  %14 = load i8*, i8** %cdir, align 4
  %tobool = icmp ne i8* %14, null
  br i1 %tobool, label %if.then29, label %if.else38

if.then29:                                        ; preds = %if.then27
  %15 = load i8*, i8** %cdir, align 4
  %call30 = call i32 @strlen(i8* %15)
  store i32 %call30, i32* %len, align 4
  %16 = load i32, i32* %len, align 4
  %17 = load i8*, i8** @shell_name, align 4
  %call31 = call i32 @strlen(i8* %17)
  %add32 = add i32 %16, %call31
  %add33 = add i32 %add32, 1
  %call34 = call i8* @sh_xmalloc(i32 %add33, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 747)
  store i8* %call34, i8** %name, align 4
  %18 = load i8*, i8** %name, align 4
  %19 = load i8*, i8** %cdir, align 4
  %call35 = call i8* @strcpy(i8* %18, i8* %19)
  %20 = load i8*, i8** %name, align 4
  %21 = load i32, i32* %len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8*, i8** @shell_name, align 4
  %add.ptr36 = getelementptr inbounds i8, i8* %22, i32 1
  %call37 = call i8* @strcpy(i8* %add.ptr, i8* %add.ptr36)
  br label %if.end43

if.else38:                                        ; preds = %if.then27
  %23 = load i8*, i8** @shell_name, align 4
  %call39 = call i32 @strlen(i8* %23)
  %add40 = add i32 1, %call39
  %call41 = call i8* @sh_xmalloc(i32 %add40, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 752)
  %24 = load i8*, i8** @shell_name, align 4
  %call42 = call i8* @strcpy(i8* %call41, i8* %24)
  store i8* %call42, i8** %name, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.else38, %if.then29
  br label %if.end79

if.else44:                                        ; preds = %land.lhs.true22, %if.else17
  %25 = load i8*, i8** @shell_name, align 4
  %call45 = call i8* @find_user_command(i8* %25)
  store i8* %call45, i8** %tname, align 4
  %26 = load i8*, i8** %tname, align 4
  %cmp46 = icmp eq i8* %26, null
  br i1 %cmp46, label %if.then48, label %if.else76

if.then48:                                        ; preds = %if.else44
  %27 = load i8*, i8** @shell_name, align 4
  %call49 = call i32 @file_status(i8* %27)
  store i32 %call49, i32* %s, align 4
  %28 = load i32, i32* %s, align 4
  %and = and i32 %28, 2
  %tobool50 = icmp ne i32 %and, 0
  br i1 %tobool50, label %if.then51, label %if.else66

if.then51:                                        ; preds = %if.then48
  %29 = load i8*, i8** @shell_name, align 4
  %call52 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.42, i32 0, i32 0))
  %call53 = call i8* @make_absolute(i8* %29, i8* %call52)
  store i8* %call53, i8** %tname, align 4
  %30 = load i8*, i8** @shell_name, align 4
  %31 = load i8, i8* %30, align 1
  %conv54 = sext i8 %31 to i32
  %cmp55 = icmp eq i32 %conv54, 46
  br i1 %cmp55, label %if.then57, label %if.else64

if.then57:                                        ; preds = %if.then51
  %32 = load i8*, i8** %tname, align 4
  %call58 = call i8* @sh_canonpath(i8* %32, i32 3)
  store i8* %call58, i8** %name, align 4
  %33 = load i8*, i8** %name, align 4
  %cmp59 = icmp eq i8* %33, null
  br i1 %cmp59, label %if.then61, label %if.else62

if.then61:                                        ; preds = %if.then57
  %34 = load i8*, i8** %tname, align 4
  store i8* %34, i8** %name, align 4
  br label %if.end63

if.else62:                                        ; preds = %if.then57
  %35 = load i8*, i8** %tname, align 4
  call void @sh_xfree(i8* %35, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 775)
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %if.then61
  br label %if.end65

if.else64:                                        ; preds = %if.then51
  %36 = load i8*, i8** %tname, align 4
  store i8* %36, i8** %name, align 4
  br label %if.end65

if.end65:                                         ; preds = %if.else64, %if.end63
  br label %if.end75

if.else66:                                        ; preds = %if.then48
  %37 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %cmp67 = icmp eq i8* %37, null
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.else66
  call void @get_current_user_info()
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.else66
  %38 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %call71 = call i32 @strlen(i8* %38)
  %add72 = add i32 1, %call71
  %call73 = call i8* @sh_xmalloc(i32 %add72, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 784)
  %39 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %call74 = call i8* @strcpy(i8* %call73, i8* %39)
  store i8* %call74, i8** %name, align 4
  br label %if.end75

if.end75:                                         ; preds = %if.end70, %if.end65
  br label %if.end78

if.else76:                                        ; preds = %if.else44
  %40 = load i8*, i8** %tname, align 4
  %call77 = call i8* @full_pathname(i8* %40)
  store i8* %call77, i8** %name, align 4
  %41 = load i8*, i8** %tname, align 4
  call void @sh_xfree(i8* %41, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 790)
  br label %if.end78

if.end78:                                         ; preds = %if.else76, %if.end75
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.end43
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %if.then12
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %if.end
  %42 = load i8*, i8** %name, align 4
  ret i8* %42
}

; Function Attrs: noinline nounwind
define internal void @set_shell_var() #0 {
entry:
  %temp_var = alloca %struct.variable*, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.91, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %temp_var, align 4
  %0 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %cmp1 = icmp eq i8* %1, null
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @get_current_user_info()
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %2 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 5), align 4
  %call3 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.91, i32 0, i32 0), i8* %2, i32 0)
  store %struct.variable* %call3, %struct.variable** %temp_var, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret void
}

declare i8* @shell_version_string() #1

; Function Attrs: noinline nounwind
define internal void @make_vers_array() #0 {
entry:
  %vv = alloca %struct.variable*, align 4
  %av = alloca %struct.array*, align 4
  %s = alloca i8*, align 4
  %d = alloca [32 x i8], align 1
  %b = alloca [12 x i8], align 1
  %call = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.94, i32 0, i32 0))
  %call1 = call %struct.variable* @make_new_array_variable(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.94, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %vv, align 4
  %0 = load %struct.variable*, %struct.variable** %vv, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %2 = bitcast i8* %1 to %struct.array*
  store %struct.array* %2, %struct.array** %av, align 4
  %arraydecay = getelementptr inbounds [32 x i8], [32 x i8]* %d, i32 0, i32 0
  %3 = load i8*, i8** @dist_version, align 4
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %3)
  %arraydecay3 = getelementptr inbounds [32 x i8], [32 x i8]* %d, i32 0, i32 0
  %call4 = call i8* @strchr(i8* %arraydecay3, i32 46)
  store i8* %call4, i8** %s, align 4
  %4 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  store i8 0, i8* %5, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.array*, %struct.array** %av, align 4
  %arraydecay5 = getelementptr inbounds [32 x i8], [32 x i8]* %d, i32 0, i32 0
  %call6 = call i32 @array_insert(%struct.array* %6, i64 0, i8* %arraydecay5)
  %7 = load %struct.array*, %struct.array** %av, align 4
  %8 = load i8*, i8** %s, align 4
  %call7 = call i32 @array_insert(%struct.array* %7, i64 1, i8* %8)
  %9 = load i32, i32* @patch_level, align 4
  %conv = sext i32 %9 to i64
  %arraydecay8 = getelementptr inbounds [12 x i8], [12 x i8]* %b, i32 0, i32 0
  %call9 = call i8* @inttostr(i64 %conv, i8* %arraydecay8, i32 12)
  store i8* %call9, i8** %s, align 4
  %10 = load %struct.array*, %struct.array** %av, align 4
  %11 = load i8*, i8** %s, align 4
  %call10 = call i32 @array_insert(%struct.array* %10, i64 2, i8* %11)
  %12 = load i32, i32* @build_version, align 4
  %conv11 = sext i32 %12 to i64
  %arraydecay12 = getelementptr inbounds [12 x i8], [12 x i8]* %b, i32 0, i32 0
  %call13 = call i8* @inttostr(i64 %conv11, i8* %arraydecay12, i32 12)
  store i8* %call13, i8** %s, align 4
  %13 = load %struct.array*, %struct.array** %av, align 4
  %14 = load i8*, i8** %s, align 4
  %call14 = call i32 @array_insert(%struct.array* %13, i64 3, i8* %14)
  %15 = load %struct.array*, %struct.array** %av, align 4
  %16 = load i8*, i8** @release_status, align 4
  %call15 = call i32 @array_insert(%struct.array* %15, i64 4, i8* %16)
  %17 = load %struct.array*, %struct.array** %av, align 4
  %call16 = call i32 @array_insert(%struct.array* %17, i64 5, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.89, i32 0, i32 0))
  %18 = load %struct.variable*, %struct.variable** %vv, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes, align 4
  %or = or i32 %19, 2
  store i32 %or, i32* %attributes, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_strict_posix(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  store i32 %land.ext, i32* @posixly_correct, align 4
  %5 = load i32, i32* @posixly_correct, align 4
  call void @posix_initialize(i32 %5)
  %6 = load i32, i32* @interactive_shell, align 4
  %tobool1 = icmp ne i32 %6, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  %7 = load i32, i32* @posixly_correct, align 4
  call void @posix_readline_initialize(i32 %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.end
  call void @set_shellopts()
  ret void
}

declare i8* @bash_tilde_expand(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @seedrand() #0 {
entry:
  %tv = alloca %struct.timeval, align 4
  %call = call i32 @gettimeofday(%struct.timeval* %tv, i8* null)
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0
  %0 = load i32, i32* %tv_sec, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1
  %1 = load i32, i32* %tv_usec, align 4
  %xor = xor i32 %0, %1
  %call1 = call i32 @getpid()
  %xor2 = xor i32 %xor, %call1
  call void @sbrand(i32 %xor2)
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_ignoreeof(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %tmp_var = alloca %struct.variable*, align 4
  %temp = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* @eof_encountered, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %tmp_var, align 4
  %1 = load %struct.variable*, %struct.variable** %tmp_var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %tmp_var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  store i32 %land.ext, i32* @ignoreeof, align 4
  %5 = load %struct.variable*, %struct.variable** %tmp_var, align 4
  %tobool1 = icmp ne %struct.variable* %5, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.end
  %6 = load %struct.variable*, %struct.variable** %tmp_var, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value2, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %7, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %temp, align 4
  %8 = load i8*, i8** %temp, align 4
  %tobool3 = icmp ne i8* %8, null
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %9 = load i8*, i8** %temp, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %tobool4 = icmp ne i32 %conv, 0
  br i1 %tobool4, label %land.lhs.true, label %cond.false9

land.lhs.true:                                    ; preds = %if.then
  %11 = load i8*, i8** %temp, align 4
  %call5 = call i32 @all_digits(i8* %11)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %cond.true7, label %cond.false9

cond.true7:                                       ; preds = %land.lhs.true
  %12 = load i8*, i8** %temp, align 4
  %call8 = call i32 @atoi(i8* %12)
  br label %cond.end10

cond.false9:                                      ; preds = %land.lhs.true, %if.then
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false9, %cond.true7
  %cond11 = phi i32 [ %call8, %cond.true7 ], [ 10, %cond.false9 ]
  store i32 %cond11, i32* @eof_encountered_limit, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end10, %cond.end
  call void @set_shellopts()
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_history_control(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %val = alloca i8*, align 4
  %tptr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* @history_control, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* %0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8*, i8** %temp, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %while.end

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %tptr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end50, %if.end
  %4 = load i8*, i8** %temp, align 4
  %call3 = call i8* @extract_colon_unit(i8* %4, i32* %tptr)
  store i8* %call3, i8** %val, align 4
  %tobool = icmp ne i8* %call3, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %val, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv4 = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.75, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp6 = icmp eq i32 %conv4, %conv5
  br i1 %cmp6, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %while.body
  %8 = load i8*, i8** %val, align 4
  %call8 = call i32 @strcmp(i8* %8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.75, i32 0, i32 0))
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true
  %9 = load i32, i32* @history_control, align 4
  %or = or i32 %9, 1
  store i32 %or, i32* @history_control, align 4
  br label %if.end50

if.else:                                          ; preds = %land.lhs.true, %while.body
  %10 = load i8*, i8** %val, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %11 to i32
  %12 = load i8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.76, i32 0, i32 0), align 1
  %conv14 = sext i8 %12 to i32
  %cmp15 = icmp eq i32 %conv13, %conv14
  br i1 %cmp15, label %land.lhs.true17, label %if.else23

land.lhs.true17:                                  ; preds = %if.else
  %13 = load i8*, i8** %val, align 4
  %call18 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.76, i32 0, i32 0))
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then21, label %if.else23

if.then21:                                        ; preds = %land.lhs.true17
  %14 = load i32, i32* @history_control, align 4
  %or22 = or i32 %14, 2
  store i32 %or22, i32* @history_control, align 4
  br label %if.end49

if.else23:                                        ; preds = %land.lhs.true17, %if.else
  %15 = load i8*, i8** %val, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %16 to i32
  %17 = load i8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.77, i32 0, i32 0), align 1
  %conv26 = sext i8 %17 to i32
  %cmp27 = icmp eq i32 %conv25, %conv26
  br i1 %cmp27, label %land.lhs.true29, label %if.else35

land.lhs.true29:                                  ; preds = %if.else23
  %18 = load i8*, i8** %val, align 4
  %call30 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.77, i32 0, i32 0))
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.then33, label %if.else35

if.then33:                                        ; preds = %land.lhs.true29
  %19 = load i32, i32* @history_control, align 4
  %or34 = or i32 %19, 3
  store i32 %or34, i32* @history_control, align 4
  br label %if.end48

if.else35:                                        ; preds = %land.lhs.true29, %if.else23
  %20 = load i8*, i8** %val, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %21 to i32
  %22 = load i8, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.78, i32 0, i32 0), align 1
  %conv38 = sext i8 %22 to i32
  %cmp39 = icmp eq i32 %conv37, %conv38
  br i1 %cmp39, label %land.lhs.true41, label %if.end47

land.lhs.true41:                                  ; preds = %if.else35
  %23 = load i8*, i8** %val, align 4
  %call42 = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.78, i32 0, i32 0))
  %cmp43 = icmp eq i32 %call42, 0
  br i1 %cmp43, label %if.then45, label %if.end47

if.then45:                                        ; preds = %land.lhs.true41
  %24 = load i32, i32* @history_control, align 4
  %or46 = or i32 %24, 4
  store i32 %or46, i32* @history_control, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %land.lhs.true41, %if.else35
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then33
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then21
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then11
  %25 = load i8*, i8** %val, align 4
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 5331)
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_histignore(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  call void @setup_history_ignore(i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_histtimefmt(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %call, null
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i8, i8* @history_comment_char, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i8 35, i8* @history_comment_char, align 1
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp4 = icmp ne %struct.variable* %2, null
  %conv5 = zext i1 %cmp4 to i32
  store i32 %conv5, i32* @history_write_timestamps, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @uidset() #0 {
entry:
  %buff = alloca [11 x i8], align 1
  %b = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %conv = zext i32 %0 to i64
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %buff, i32 0, i32 0
  %call = call i8* @inttostr(i64 %conv, i8* %arraydecay, i32 11)
  store i8* %call, i8** %b, align 4
  %call1 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.92, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %b, align 4
  %call3 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.92, i32 0, i32 0), i8* %2, i32 0)
  store %struct.variable* %call3, %struct.variable** %v, align 4
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %or = or i32 %4, 18
  store i32 %or, i32* %attributes, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %6 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 0), align 4
  %cmp4 = icmp ne i32 %5, %6
  br i1 %cmp4, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.end
  %7 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %conv7 = zext i32 %7 to i64
  %arraydecay8 = getelementptr inbounds [11 x i8], [11 x i8]* %buff, i32 0, i32 0
  %call9 = call i8* @inttostr(i64 %conv7, i8* %arraydecay8, i32 11)
  store i8* %call9, i8** %b, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then6, %if.end
  %call11 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.93, i32 0, i32 0))
  store %struct.variable* %call11, %struct.variable** %v, align 4
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp12 = icmp eq %struct.variable* %8, null
  br i1 %cmp12, label %if.then14, label %if.end18

if.then14:                                        ; preds = %if.end10
  %9 = load i8*, i8** %b, align 4
  %call15 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.93, i32 0, i32 0), i8* %9, i32 0)
  store %struct.variable* %call15, %struct.variable** %v, align 4
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes16 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes16, align 4
  %or17 = or i32 %11, 18
  store i32 %or17, i32* %attributes16, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then14, %if.end10
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_xtracefd(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %t = alloca i8*, align 4
  %e = alloca i8*, align 4
  %fd = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @xtrace_reset()
  br label %if.end26

if.end:                                           ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  store i8* %3, i8** %t, align 4
  %4 = load i8*, i8** %t, align 4
  %cmp1 = icmp eq i8* %4, null
  br i1 %cmp1, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i8*, i8** %t, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  call void @xtrace_reset()
  br label %if.end26

if.else:                                          ; preds = %lor.lhs.false
  %7 = load i8*, i8** %t, align 4
  %call5 = call i32 @strtol(i8* %7, i8** %e, i32 10)
  store i32 %call5, i32* %fd, align 4
  %8 = load i8*, i8** %e, align 4
  %9 = load i8*, i8** %t, align 4
  %cmp6 = icmp ne i8* %8, %9
  br i1 %cmp6, label %land.lhs.true, label %if.else22

land.lhs.true:                                    ; preds = %if.else
  %10 = load i8*, i8** %e, align 4
  %11 = load i8, i8* %10, align 1
  %conv8 = sext i8 %11 to i32
  %cmp9 = icmp eq i32 %conv8, 0
  br i1 %cmp9, label %land.lhs.true11, label %if.else22

land.lhs.true11:                                  ; preds = %land.lhs.true
  %12 = load i32, i32* %fd, align 4
  %call12 = call i32 @sh_validfd(i32 %12)
  %tobool = icmp ne i32 %call12, 0
  br i1 %tobool, label %if.then13, label %if.else22

if.then13:                                        ; preds = %land.lhs.true11
  %13 = load i32, i32* %fd, align 4
  %call14 = call %struct._IO_FILE* @fdopen(i32 %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.80, i32 0, i32 0))
  store %struct._IO_FILE* %call14, %struct._IO_FILE** %fp, align 4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %cmp15 = icmp eq %struct._IO_FILE* %14, null
  br i1 %cmp15, label %if.then17, label %if.else20

if.then17:                                        ; preds = %if.then13
  %call18 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.81, i32 0, i32 0))
  %15 = load i8*, i8** %name.addr, align 4
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  %value19 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 1
  %17 = load i8*, i8** %value19, align 4
  call void (i8*, ...) @internal_error(i8* %call18, i8* %15, i8* %17)
  br label %if.end21

if.else20:                                        ; preds = %if.then13
  %18 = load i32, i32* %fd, align 4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  call void @xtrace_set(i32 %18, %struct._IO_FILE* %19)
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %if.then17
  br label %if.end25

if.else22:                                        ; preds = %land.lhs.true11, %land.lhs.true, %if.else
  %call23 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.82, i32 0, i32 0))
  %20 = load i8*, i8** %name.addr, align 4
  %21 = load %struct.variable*, %struct.variable** %v, align 4
  %value24 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value24, align 4
  call void (i8*, ...) @internal_error(i8* %call23, i8* %20, i8* %22)
  br label %if.end25

if.end25:                                         ; preds = %if.else22, %if.end21
  br label %if.end26

if.end26:                                         ; preds = %if.then, %if.end25, %if.then4
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_shcompat(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %val = alloca i8*, align 4
  %tens = alloca i32, align 4
  %ones = alloca i32, align 4
  %compatval = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 44, i32* @shell_compatibility_level, align 4
  call void @set_compatibility_opts()
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  store i8* %3, i8** %val, align 4
  %4 = load i8*, i8** %val, align 4
  %cmp1 = icmp eq i8* %4, null
  br i1 %cmp1, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load i8*, i8** %val, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  store i32 44, i32* @shell_compatibility_level, align 4
  call void @set_compatibility_opts()
  br label %return

if.end5:                                          ; preds = %lor.lhs.false
  %7 = load i8*, i8** %val, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv6 = zext i8 %8 to i32
  %call7 = call i32 @isdigit(i32 %conv6) #5
  %tobool = icmp ne i32 %call7, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end5
  %9 = load i8*, i8** %val, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %10 to i32
  %cmp10 = icmp eq i32 %conv9, 46
  br i1 %cmp10, label %land.lhs.true12, label %if.else

land.lhs.true12:                                  ; preds = %land.lhs.true
  %11 = load i8*, i8** %val, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx13, align 1
  %conv14 = zext i8 %12 to i32
  %call15 = call i32 @isdigit(i32 %conv14) #5
  %tobool16 = icmp ne i32 %call15, 0
  br i1 %tobool16, label %land.lhs.true17, label %if.else

land.lhs.true17:                                  ; preds = %land.lhs.true12
  %13 = load i8*, i8** %val, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %13, i32 3
  %14 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %14 to i32
  %cmp20 = icmp eq i32 %conv19, 0
  br i1 %cmp20, label %if.then22, label %if.else

if.then22:                                        ; preds = %land.lhs.true17
  %15 = load i8*, i8** %val, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %16 to i32
  %sub = sub nsw i32 %conv24, 48
  store i32 %sub, i32* %tens, align 4
  %17 = load i8*, i8** %val, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %17, i32 2
  %18 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %18 to i32
  %sub27 = sub nsw i32 %conv26, 48
  store i32 %sub27, i32* %ones, align 4
  %19 = load i32, i32* %tens, align 4
  %mul = mul nsw i32 %19, 10
  %20 = load i32, i32* %ones, align 4
  %add = add nsw i32 %mul, %20
  store i32 %add, i32* %compatval, align 4
  br label %if.end54

if.else:                                          ; preds = %land.lhs.true17, %land.lhs.true12, %land.lhs.true, %if.end5
  %21 = load i8*, i8** %val, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx28, align 1
  %conv29 = zext i8 %22 to i32
  %call30 = call i32 @isdigit(i32 %conv29) #5
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %land.lhs.true32, label %if.else51

land.lhs.true32:                                  ; preds = %if.else
  %23 = load i8*, i8** %val, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %23, i32 1
  %24 = load i8, i8* %arrayidx33, align 1
  %conv34 = zext i8 %24 to i32
  %call35 = call i32 @isdigit(i32 %conv34) #5
  %tobool36 = icmp ne i32 %call35, 0
  br i1 %tobool36, label %land.lhs.true37, label %if.else51

land.lhs.true37:                                  ; preds = %land.lhs.true32
  %25 = load i8*, i8** %val, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %25, i32 2
  %26 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %26 to i32
  %cmp40 = icmp eq i32 %conv39, 0
  br i1 %cmp40, label %if.then42, label %if.else51

if.then42:                                        ; preds = %land.lhs.true37
  %27 = load i8*, i8** %val, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %28 to i32
  %sub45 = sub nsw i32 %conv44, 48
  store i32 %sub45, i32* %tens, align 4
  %29 = load i8*, i8** %val, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %29, i32 1
  %30 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %30 to i32
  %sub48 = sub nsw i32 %conv47, 48
  store i32 %sub48, i32* %ones, align 4
  %31 = load i32, i32* %tens, align 4
  %mul49 = mul nsw i32 %31, 10
  %32 = load i32, i32* %ones, align 4
  %add50 = add nsw i32 %mul49, %32
  store i32 %add50, i32* %compatval, align 4
  br label %if.end53

if.else51:                                        ; preds = %land.lhs.true37, %land.lhs.true32, %if.else
  br label %compat_error

compat_error:                                     ; preds = %if.then60, %if.else51
  %call52 = call i8* @libintl_gettext(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.83, i32 0, i32 0))
  %33 = load i8*, i8** %name.addr, align 4
  %34 = load i8*, i8** %val, align 4
  call void (i8*, ...) @internal_error(i8* %call52, i8* %33, i8* %34)
  store i32 44, i32* @shell_compatibility_level, align 4
  call void @set_compatibility_opts()
  br label %return

if.end53:                                         ; preds = %if.then42
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then22
  %35 = load i32, i32* %compatval, align 4
  %cmp55 = icmp slt i32 %35, 31
  br i1 %cmp55, label %if.then60, label %lor.lhs.false57

lor.lhs.false57:                                  ; preds = %if.end54
  %36 = load i32, i32* %compatval, align 4
  %cmp58 = icmp sgt i32 %36, 44
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %lor.lhs.false57, %if.end54
  br label %compat_error

if.end61:                                         ; preds = %lor.lhs.false57
  %37 = load i32, i32* %compatval, align 4
  store i32 %37, i32* @shell_compatibility_level, align 4
  call void @set_compatibility_opts()
  br label %return

return:                                           ; preds = %if.end61, %compat_error, %if.then4, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_funcnest(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %num = alloca i64, align 8
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* @funcnest_max, align 4
  br label %if.end5

if.else:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %call1 = call i32 @legal_number(i8* %3, i64* %num)
  %cmp2 = icmp eq i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  store i32 0, i32* @funcnest_max, align 4
  br label %if.end

if.else4:                                         ; preds = %if.else
  %4 = load i64, i64* %num, align 8
  %conv = trunc i64 %4 to i32
  store i32 %conv, i32* @funcnest_max, align 4
  br label %if.end

if.end:                                           ; preds = %if.else4, %if.then3
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @initialize_dynamic_variables() #0 {
entry:
  %v = alloca %struct.variable*, align 4
  %call = call %struct.variable* @init_seconds_var()
  store %struct.variable* %call, %struct.variable** %v, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call1 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.95, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_bash_command, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* null, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %call3 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.96, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call3, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value4 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_subshell, %struct.variable* (%struct.variable*)** %dynamic_value4, align 4
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func5 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_subshell, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func5, align 4
  br label %do.end6

do.end6:                                          ; preds = %do.body2
  br label %do.body7

do.body7:                                         ; preds = %do.end6
  %call8 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.97, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call8, %struct.variable** %v, align 4
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value9 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_random, %struct.variable* (%struct.variable*)** %dynamic_value9, align 4
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func10 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_random, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func10, align 4
  br label %do.end11

do.end11:                                         ; preds = %do.body7
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes, align 4
  %or = or i32 %7, 16
  store i32 %or, i32* %attributes, align 4
  br label %do.body12

do.body12:                                        ; preds = %do.end11
  %call13 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.98, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call13, %struct.variable** %v, align 4
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value14 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_lineno, %struct.variable* (%struct.variable*)** %dynamic_value14, align 4
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func15 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_lineno, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func15, align 4
  br label %do.end16

do.end16:                                         ; preds = %do.body12
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes17 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes17, align 4
  %or18 = or i32 %11, 16
  store i32 %or18, i32* %attributes17, align 4
  br label %do.body19

do.body19:                                        ; preds = %do.end16
  %call20 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.99, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call20, %struct.variable** %v, align 4
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value21 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_bashpid, %struct.variable* (%struct.variable*)** %dynamic_value21, align 4
  %13 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func22 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_assign, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func22, align 4
  br label %do.end23

do.end23:                                         ; preds = %do.body19
  %14 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes24 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes24, align 4
  %or25 = or i32 %15, 18
  store i32 %or25, i32* %attributes24, align 4
  br label %do.body26

do.body26:                                        ; preds = %do.end23
  %call27 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.100, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call27, %struct.variable** %v, align 4
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value28 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_histcmd, %struct.variable* (%struct.variable*)** %dynamic_value28, align 4
  %17 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func29 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* null, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func29, align 4
  br label %do.end30

do.end30:                                         ; preds = %do.body26
  %18 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes31 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes31, align 4
  %or32 = or i32 %19, 16
  store i32 %or32, i32* %attributes31, align 4
  br label %do.body33

do.body33:                                        ; preds = %do.end30
  %call34 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.73, i32 0, i32 0), i8* null, i32 0)
  store %struct.variable* %call34, %struct.variable** %v, align 4
  %20 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value35 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_comp_wordbreaks, %struct.variable* (%struct.variable*)** %dynamic_value35, align 4
  %21 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func36 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_comp_wordbreaks, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func36, align 4
  br label %do.end37

do.end37:                                         ; preds = %do.body33
  %call38 = call %struct.variable* @init_dynamic_array_var(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.101, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_dirstack, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_dirstack, i32 0)
  store %struct.variable* %call38, %struct.variable** %v, align 4
  %call39 = call %struct.variable* @init_dynamic_array_var(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.102, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_groupset, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_array_assign, i32 16384)
  store %struct.variable* %call39, %struct.variable** %v, align 4
  %call40 = call %struct.variable* @init_dynamic_array_var(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_self, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_array_assign, i32 24576)
  store %struct.variable* %call40, %struct.variable** %v, align 4
  %call41 = call %struct.variable* @init_dynamic_array_var(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.71, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_self, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_array_assign, i32 24576)
  store %struct.variable* %call41, %struct.variable** %v, align 4
  %call42 = call %struct.variable* @init_dynamic_array_var(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.103, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_self, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_array_assign, i32 24576)
  store %struct.variable* %call42, %struct.variable** %v, align 4
  %call43 = call %struct.variable* @init_dynamic_array_var(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.104, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_self, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_array_assign, i32 24576)
  store %struct.variable* %call43, %struct.variable** %v, align 4
  %call44 = call %struct.variable* @init_dynamic_assoc_var(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.105, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_hashcmd, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_hashcmd, i32 131072)
  store %struct.variable* %call44, %struct.variable** %v, align 4
  %call45 = call %struct.variable* @init_dynamic_assoc_var(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.106, i32 0, i32 0), %struct.variable* (%struct.variable*)* @get_aliasvar, %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_aliasvar, i32 131072)
  store %struct.variable* %call45, %struct.variable** %v, align 4
  %call46 = call %struct.variable* @init_funcname_var()
  store %struct.variable* %call46, %struct.variable** %v, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i8* @sh_get_home_dir() #0 {
entry:
  %0 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @get_current_user_info()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 6), align 4
  ret i8* %1
}

declare void @get_current_user_info() #1

; Function Attrs: noinline nounwind
define void @adjust_shell_level(i32 %change) #0 {
entry:
  %change.addr = alloca i32, align 4
  %new_level = alloca [5 x i8], align 1
  %old_SHLVL = alloca i8*, align 4
  %old_level = alloca i64, align 8
  %temp_var = alloca %struct.variable*, align 4
  store i32 %change, i32* %change.addr, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0))
  store i8* %call, i8** %old_SHLVL, align 4
  %0 = load i8*, i8** %old_SHLVL, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %old_SHLVL, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i8*, i8** %old_SHLVL, align 4
  %call4 = call i32 @legal_number(i8* %3, i64* %old_level)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  store i64 0, i64* %old_level, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false3
  %4 = load i64, i64* %old_level, align 8
  %5 = load i32, i32* %change.addr, align 4
  %conv7 = sext i32 %5 to i64
  %add = add nsw i64 %4, %conv7
  %conv8 = trunc i64 %add to i32
  store i32 %conv8, i32* @shell_level, align 4
  %6 = load i32, i32* @shell_level, align 4
  %cmp9 = icmp slt i32 %6, 0
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.end
  store i32 0, i32* @shell_level, align 4
  br label %if.end17

if.else:                                          ; preds = %if.end
  %7 = load i32, i32* @shell_level, align 4
  %cmp12 = icmp sge i32 %7, 1000
  br i1 %cmp12, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.else
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.40, i32 0, i32 0))
  %8 = load i32, i32* @shell_level, align 4
  call void (i8*, ...) @internal_warning(i8* %call15, i32 %8)
  store i32 1, i32* @shell_level, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then11
  %9 = load i32, i32* @shell_level, align 4
  %cmp18 = icmp slt i32 %9, 10
  br i1 %cmp18, label %if.then20, label %if.else24

if.then20:                                        ; preds = %if.end17
  %10 = load i32, i32* @shell_level, align 4
  %add21 = add nsw i32 %10, 48
  %conv22 = trunc i32 %add21 to i8
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 0
  store i8 %conv22, i8* %arrayidx, align 1
  %arrayidx23 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 1
  store i8 0, i8* %arrayidx23, align 1
  br label %if.end56

if.else24:                                        ; preds = %if.end17
  %11 = load i32, i32* @shell_level, align 4
  %cmp25 = icmp slt i32 %11, 100
  br i1 %cmp25, label %if.then27, label %if.else35

if.then27:                                        ; preds = %if.else24
  %12 = load i32, i32* @shell_level, align 4
  %div = sdiv i32 %12, 10
  %add28 = add nsw i32 %div, 48
  %conv29 = trunc i32 %add28 to i8
  %arrayidx30 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 0
  store i8 %conv29, i8* %arrayidx30, align 1
  %13 = load i32, i32* @shell_level, align 4
  %rem = srem i32 %13, 10
  %add31 = add nsw i32 %rem, 48
  %conv32 = trunc i32 %add31 to i8
  %arrayidx33 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 1
  store i8 %conv32, i8* %arrayidx33, align 1
  %arrayidx34 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 2
  store i8 0, i8* %arrayidx34, align 1
  br label %if.end55

if.else35:                                        ; preds = %if.else24
  %14 = load i32, i32* @shell_level, align 4
  %cmp36 = icmp slt i32 %14, 1000
  br i1 %cmp36, label %if.then38, label %if.end54

if.then38:                                        ; preds = %if.else35
  %15 = load i32, i32* @shell_level, align 4
  %div39 = sdiv i32 %15, 100
  %add40 = add nsw i32 %div39, 48
  %conv41 = trunc i32 %add40 to i8
  %arrayidx42 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 0
  store i8 %conv41, i8* %arrayidx42, align 1
  %16 = load i32, i32* @shell_level, align 4
  %rem43 = srem i32 %16, 100
  %conv44 = sext i32 %rem43 to i64
  store i64 %conv44, i64* %old_level, align 8
  %17 = load i64, i64* %old_level, align 8
  %div45 = sdiv i64 %17, 10
  %add46 = add nsw i64 %div45, 48
  %conv47 = trunc i64 %add46 to i8
  %arrayidx48 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 1
  store i8 %conv47, i8* %arrayidx48, align 1
  %18 = load i64, i64* %old_level, align 8
  %rem49 = srem i64 %18, 10
  %add50 = add nsw i64 %rem49, 48
  %conv51 = trunc i64 %add50 to i8
  %arrayidx52 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 2
  store i8 %conv51, i8* %arrayidx52, align 1
  %arrayidx53 = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 3
  store i8 0, i8* %arrayidx53, align 1
  br label %if.end54

if.end54:                                         ; preds = %if.then38, %if.else35
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.then27
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then20
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %new_level, i32 0, i32 0
  %call57 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.39, i32 0, i32 0), i8* %arraydecay, i32 0)
  store %struct.variable* %call57, %struct.variable** %temp_var, align 4
  br label %do.body

do.body:                                          ; preds = %if.end56
  %19 = load %struct.variable*, %struct.variable** %temp_var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes, align 4
  %or = or i32 %20, 1
  store i32 %or, i32* %attributes, align 4
  store i32 1, i32* @array_needs_making, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  ret void
}

; Function Attrs: noinline nounwind
define i8* @get_string_value(i8* %var_name) #0 {
entry:
  %var_name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %var_name, i8** %var_name.addr, align 4
  %0 = load i8*, i8** %var_name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %call1 = call i8* @get_variable_value(%struct.variable* %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call1, %cond.true ], [ null, %cond.false ]
  ret i8* %cond
}

declare i32 @legal_number(i8*, i64*) #1

declare void @internal_warning(i8*, ...) #1

declare i32 @same_file(i8*, i8*, %struct.stat*, %struct.stat*) #1

declare i8* @sh_canonpath(i8*, i32) #1

declare i8* @get_working_directory(i8*) #1

declare void @set_working_directory(i8*) #1

declare i32 @file_isdir(i8*) #1

declare i8* @inttostr(i64, i8*, i32) #1

declare i32 @getppid() #1

; Function Attrs: noinline nounwind
define void @sh_set_lines_and_columns(i32 %lines, i32 %cols) #0 {
entry:
  %lines.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  %val = alloca [12 x i8], align 1
  %v = alloca i8*, align 4
  store i32 %lines, i32* %lines.addr, align 4
  store i32 %cols, i32* %cols.addr, align 4
  %0 = load i32, i32* @winsize_assignment, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %lines.addr, align 4
  %conv = sext i32 %1 to i64
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %val, i32 0, i32 0
  %call = call i8* @inttostr(i64 %conv, i8* %arraydecay, i32 12)
  store i8* %call, i8** %v, align 4
  %2 = load i8*, i8** %v, align 4
  %call1 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.48, i32 0, i32 0), i8* %2, i32 0)
  %3 = load i32, i32* %cols.addr, align 4
  %conv2 = sext i32 %3 to i64
  %arraydecay3 = getelementptr inbounds [12 x i8], [12 x i8]* %val, i32 0, i32 0
  %call4 = call i8* @inttostr(i64 %conv2, i8* %arraydecay3, i32 12)
  store i8* %call4, i8** %v, align 4
  %4 = load i8*, i8** %v, align 4
  %call5 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.49, i32 0, i32 0), i8* %4, i32 0)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @print_var_list(%struct.variable** %list) #0 {
entry:
  %list.addr = alloca %struct.variable**, align 4
  %i = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store %struct.variable** %list, %struct.variable*** %list.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.variable**, %struct.variable*** %list.addr, align 4
  %tobool = icmp ne %struct.variable** %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %1 = load %struct.variable**, %struct.variable*** %list.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %1, i32 %2
  %3 = load %struct.variable*, %struct.variable** %arrayidx, align 4
  store %struct.variable* %3, %struct.variable** %var, align 4
  %tobool1 = icmp ne %struct.variable* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes, align 4
  %and = and i32 %6, 4096
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  call void @print_assignment(%struct.variable* %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  ret void
}

; Function Attrs: noinline nounwind
define void @print_assignment(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %1, null
  %conv = zext i1 %cmp to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end20

if.end:                                           ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 0
  %5 = load i8*, i8** %name, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), i8* %5)
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @print_var_function(%struct.variable* %6)
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end20

if.else:                                          ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes5 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes5, align 4
  %and6 = and i32 %8, 4
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @print_array_assignment(%struct.variable* %9, i32 0)
  br label %if.end19

if.else9:                                         ; preds = %if.else
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes10 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes10, align 4
  %and11 = and i32 %11, 64
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else9
  %12 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @print_assoc_assignment(%struct.variable* %12, i32 0)
  br label %if.end18

if.else14:                                        ; preds = %if.else9
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name15 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 0
  %14 = load i8*, i8** %name15, align 4
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.53, i32 0, i32 0), i8* %14)
  %15 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @print_var_value(%struct.variable* %15, i32 1)
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then13
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then8
  br label %if.end20

if.end20:                                         ; preds = %if.then, %if.end19, %if.then3
  ret void
}

; Function Attrs: noinline nounwind
define void @print_func_list(%struct.variable** %list) #0 {
entry:
  %list.addr = alloca %struct.variable**, align 4
  %i = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store %struct.variable** %list, %struct.variable*** %list.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.variable**, %struct.variable*** %list.addr, align 4
  %tobool = icmp ne %struct.variable** %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %1 = load %struct.variable**, %struct.variable*** %list.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %1, i32 %2
  %3 = load %struct.variable*, %struct.variable** %arrayidx, align 4
  store %struct.variable* %3, %struct.variable** %var, align 4
  %tobool1 = icmp ne %struct.variable* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 0
  %6 = load i8*, i8** %name, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.50, i32 0, i32 0), i8* %6)
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  call void @print_var_function(%struct.variable* %7)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.51, i32 0, i32 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @print_var_function(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %x = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value1 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value1, align 4
  %6 = bitcast i8* %5 to %struct.command*
  %call = call i8* @named_function_string(i8* null, %struct.command* %6, i32 3)
  store i8* %call, i8** %x, align 4
  %7 = load i8*, i8** %x, align 4
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), i8* %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

declare void @print_array_assignment(%struct.variable*, i32) #1

declare void @print_assoc_assignment(%struct.variable*, i32) #1

; Function Attrs: noinline nounwind
define void @print_var_value(%struct.variable* %var, i32 %quote) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %quote.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %quote, i32* %quote.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %1, null
  %conv = zext i1 %cmp to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end25

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %quote.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* @posixly_correct, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %land.lhs.true5, label %if.else

land.lhs.true5:                                   ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value6 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value6, align 4
  %call = call i32 @ansic_shouldquote(i8* %5)
  %tobool7 = icmp ne i32 %call, 0
  br i1 %tobool7, label %if.then8, label %if.else

if.then8:                                         ; preds = %land.lhs.true5
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value9 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value9, align 4
  %call10 = call i8* @ansic_quote(i8* %7, i32 0, i32* null)
  store i8* %call10, i8** %t, align 4
  %8 = load i8*, i8** %t, align 4
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), i8* %8)
  %9 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1084)
  br label %if.end25

if.else:                                          ; preds = %land.lhs.true5, %land.lhs.true, %if.end
  %10 = load i32, i32* %quote.addr, align 4
  %tobool12 = icmp ne i32 %10, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.else21

land.lhs.true13:                                  ; preds = %if.else
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value14 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  %12 = load i8*, i8** %value14, align 4
  %call15 = call i32 @sh_contains_shell_metas(i8* %12)
  %tobool16 = icmp ne i32 %call15, 0
  br i1 %tobool16, label %if.then17, label %if.else21

if.then17:                                        ; preds = %land.lhs.true13
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value18 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 1
  %14 = load i8*, i8** %value18, align 4
  %call19 = call i8* @sh_single_quote(i8* %14)
  store i8* %call19, i8** %t, align 4
  %15 = load i8*, i8** %t, align 4
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), i8* %15)
  %16 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1090)
  br label %if.end24

if.else21:                                        ; preds = %land.lhs.true13, %if.else
  %17 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value22 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 1
  %18 = load i8*, i8** %value22, align 4
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), i8* %18)
  br label %if.end24

if.end24:                                         ; preds = %if.else21, %if.then17
  br label %if.end25

if.end25:                                         ; preds = %if.then, %if.end24, %if.then8
  ret void
}

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

declare i32 @sh_contains_shell_metas(i8*) #1

declare i8* @sh_single_quote(i8*) #1

declare i8* @named_function_string(i8*, %struct.command*, i32) #1

; Function Attrs: noinline nounwind
define i32 @get_random_number() #0 {
entry:
  %rv = alloca i32, align 4
  %pid = alloca i32, align 4
  %call = call i32 @getpid()
  store i32 %call, i32* %pid, align 4
  %0 = load i32, i32* @subshell_environment, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @seeded_subshell, align 4
  %2 = load i32, i32* %pid, align 4
  %cmp = icmp ne i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @seedrand()
  %3 = load i32, i32* %pid, align 4
  store i32 %3, i32* @seeded_subshell, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %call1 = call i32 @brand()
  store i32 %call1, i32* %rv, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %4 = load i32, i32* %rv, align 4
  %5 = load i32, i32* @last_random_value, align 4
  %cmp2 = icmp eq i32 %4, %5
  br i1 %cmp2, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %6 = load i32, i32* %rv, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @brand() #0 {
entry:
  %h = alloca i32, align 4
  %l = alloca i32, align 4
  %0 = load i32, i32* @rseed, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 123459876, i32* @rseed, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @rseed, align 4
  %div = udiv i32 %1, 127773
  store i32 %div, i32* %h, align 4
  %2 = load i32, i32* @rseed, align 4
  %rem = urem i32 %2, 127773
  store i32 %rem, i32* %l, align 4
  %3 = load i32, i32* %l, align 4
  %mul = mul nsw i32 16807, %3
  %4 = load i32, i32* %h, align 4
  %mul1 = mul nsw i32 2836, %4
  %sub = sub nsw i32 %mul, %mul1
  store i32 %sub, i32* @rseed, align 4
  %5 = load i32, i32* @rseed, align 4
  %and = and i32 %5, 32767
  ret i32 %and
}

; Function Attrs: noinline nounwind
define void @make_funcname_visible(i32 %on_or_off) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.54, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 3
  %2 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %cmp1 = icmp eq %struct.variable* (%struct.variable*)* %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end4

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %on_or_off.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, -4097
  store i32 %and, i32* %attributes, align 4
  br label %if.end4

if.else:                                          ; preds = %if.end
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes3, align 4
  %or = or i32 %7, 4096
  store i32 %or, i32* %attributes3, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then, %if.else, %if.then2
  ret void
}

; Function Attrs: noinline nounwind
define %struct.variable* @var_lookup(i8* %name, %struct.var_context* %vcontext) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %vcontext.addr = alloca %struct.var_context*, align 4
  %vc = alloca %struct.var_context*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.var_context* %vcontext, %struct.var_context** %vcontext.addr, align 4
  store %struct.variable* null, %struct.variable** %v, align 4
  %0 = load %struct.var_context*, %struct.var_context** %vcontext.addr, align 4
  store %struct.var_context* %0, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool = icmp ne %struct.var_context* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 5
  %4 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.variable* @hash_lookup(i8* %2, %struct.hash_table* %4)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %tobool1 = icmp ne %struct.variable* %call, null
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %5, i32 0, i32 4
  %6 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %6, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %7
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @hash_lookup(i8* %name, %struct.hash_table* %hashed_vars) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %hashed_vars.addr = alloca %struct.hash_table*, align 4
  %bucket = alloca %struct.bucket_contents*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.hash_table* %hashed_vars, %struct.hash_table** %hashed_vars.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** %hashed_vars.addr, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %0, %struct.hash_table* %1, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %bucket, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %bucket, align 4
  %tobool = icmp ne %struct.bucket_contents* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.hash_table*, %struct.hash_table** %hashed_vars.addr, align 4
  store %struct.hash_table* %3, %struct.hash_table** @last_table_searched, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %bucket, align 4
  %tobool1 = icmp ne %struct.bucket_contents* %4, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %5 = load %struct.bucket_contents*, %struct.bucket_contents** %bucket, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %5, i32 0, i32 2
  %6 = load i8*, i8** %data, align 4
  %7 = bitcast i8* %6 to %struct.variable*
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %7, %cond.true ], [ null, %cond.false ]
  ret %struct.variable* %cond
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_nameref(%struct.variable* %v) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %v.addr = alloca %struct.variable*, align 4
  %level = alloca i32, align 4
  %flags = alloca i32, align 4
  %newname = alloca i8*, align 4
  %t = alloca i8*, align 4
  %orig = alloca %struct.variable*, align 4
  %oldv = alloca %struct.variable*, align 4
  store %struct.variable* %v, %struct.variable** %v.addr, align 4
  store i32 0, i32* %level, align 4
  %0 = load %struct.variable*, %struct.variable** %v.addr, align 4
  store %struct.variable* %0, %struct.variable** %orig, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end21, %entry
  %1 = load %struct.variable*, %struct.variable** %v.addr, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load %struct.variable*, %struct.variable** %v.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %level, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %level, align 4
  %6 = load i32, i32* %level, align 4
  %cmp = icmp sgt i32 %6, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %7 = load %struct.variable*, %struct.variable** %v.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 4
  store i8* %8, i8** %newname, align 4
  %9 = load i8*, i8** %newname, align 4
  %cmp2 = icmp eq i8* %9, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %10 = load i8*, i8** %newname, align 4
  %11 = load i8, i8* %10, align 1
  %conv = sext i8 %11 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %12 = load %struct.variable*, %struct.variable** %v.addr, align 4
  store %struct.variable* %12, %struct.variable** %oldv, align 4
  store i32 0, i32* %flags, align 4
  %13 = load i32, i32* @expanding_redir, align 4
  %cmp7 = icmp eq i32 %13, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end6
  %14 = load i32, i32* @assigning_in_environment, align 4
  %tobool9 = icmp ne i32 %14, 0
  br i1 %tobool9, label %if.then12, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %land.lhs.true
  %15 = load i32, i32* @executing_builtin, align 4
  %tobool11 = icmp ne i32 %15, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false10, %land.lhs.true
  %16 = load i32, i32* %flags, align 4
  %or = or i32 %16, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %lor.lhs.false10, %if.end6
  %17 = load i8*, i8** %newname, align 4
  %18 = load i32, i32* %flags, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %17, i32 %18)
  store %struct.variable* %call, %struct.variable** %v.addr, align 4
  %19 = load %struct.variable*, %struct.variable** %v.addr, align 4
  %20 = load %struct.variable*, %struct.variable** %orig, align 4
  %cmp14 = icmp eq %struct.variable* %19, %20
  br i1 %cmp14, label %if.then19, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %if.end13
  %21 = load %struct.variable*, %struct.variable** %v.addr, align 4
  %22 = load %struct.variable*, %struct.variable** %oldv, align 4
  %cmp17 = icmp eq %struct.variable* %21, %22
  br i1 %cmp17, label %if.then19, label %if.end21

if.then19:                                        ; preds = %lor.lhs.false16, %if.end13
  %call20 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.55, i32 0, i32 0))
  %23 = load %struct.variable*, %struct.variable** %orig, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 0
  %24 = load i8*, i8** %name, align 4
  call void (i8*, ...) @internal_warning(i8* %call20, i8* %24)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end21:                                         ; preds = %lor.lhs.false16
  br label %while.cond

while.end:                                        ; preds = %land.end
  %25 = load %struct.variable*, %struct.variable** %v.addr, align 4
  store %struct.variable* %25, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then19, %if.then5, %if.then
  %26 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %26
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @find_variable_internal(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  %search_tempenv = alloca i32, align 4
  %force_tempenv = alloca i32, align 4
  %vc = alloca %struct.var_context*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.variable* null, %struct.variable** %var, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 1
  store i32 %and, i32* %force_tempenv, align 4
  %1 = load i32, i32* %force_tempenv, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i32, i32* @expanding_redir, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %3 = load i32, i32* @subshell_environment, align 4
  %tobool1 = icmp ne i32 %3, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %4 = phi i1 [ false, %lor.rhs ], [ %tobool1, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %entry
  %5 = phi i1 [ true, %entry ], [ %4, %land.end ]
  %lor.ext = zext i1 %5 to i32
  store i32 %lor.ext, i32* %search_tempenv, align 4
  %6 = load i32, i32* %search_tempenv, align 4
  %tobool2 = icmp ne i32 %6, 0
  br i1 %tobool2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.end
  %7 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool3 = icmp ne %struct.hash_table* %7, null
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = load i8*, i8** %name.addr, align 4
  %9 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %call = call %struct.variable* @hash_lookup(i8* %8, %struct.hash_table* %9)
  store %struct.variable* %call, %struct.variable** %var, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %lor.end
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp4 = icmp eq %struct.variable* %10, null
  br i1 %cmp4, label %if.then5, label %if.end22

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %flags.addr, align 4
  %and6 = and i32 %11, 2
  %cmp7 = icmp eq i32 %and6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.then5
  %12 = load i8*, i8** %name.addr, align 4
  %13 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call9 = call %struct.variable* @var_lookup(i8* %12, %struct.var_context* %13)
  store %struct.variable* %call9, %struct.variable** %var, align 4
  br label %if.end21

if.else:                                          ; preds = %if.then5
  %14 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %14, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %15 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool10 = icmp ne %struct.var_context* %15, null
  br i1 %tobool10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i8*, i8** %name.addr, align 4
  %17 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %17, i32 0, i32 5
  %18 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call11 = call %struct.variable* @hash_lookup(i8* %16, %struct.hash_table* %18)
  store %struct.variable* %call11, %struct.variable** %var, align 4
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool12 = icmp ne %struct.variable* %19, null
  br i1 %tobool12, label %land.lhs.true13, label %if.end17

land.lhs.true13:                                  ; preds = %for.body
  %20 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes, align 4
  %and14 = and i32 %21, 4096
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %land.lhs.true13
  store %struct.variable* null, %struct.variable** %var, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %land.lhs.true13, %for.body
  %22 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool18 = icmp ne %struct.variable* %22, null
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end17
  br label %for.end

if.end20:                                         ; preds = %if.end17
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %23 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %23, i32 0, i32 4
  %24 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %24, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then19, %for.cond
  br label %if.end21

if.end21:                                         ; preds = %for.end, %if.then8
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.end
  %25 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp23 = icmp eq %struct.variable* %25, null
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end25:                                         ; preds = %if.end22
  %26 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 3
  %27 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %tobool26 = icmp ne %struct.variable* (%struct.variable*)* %27, null
  br i1 %tobool26, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end25
  %28 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value27 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 3
  %29 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value27, align 4
  %30 = load %struct.variable*, %struct.variable** %var, align 4
  %call28 = call %struct.variable* %29(%struct.variable* %30)
  br label %cond.end

cond.false:                                       ; preds = %if.end25
  %31 = load %struct.variable*, %struct.variable** %var, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call28, %cond.true ], [ %31, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then24
  %32 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %32
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_last_nameref(i8* %name, i32 %vflags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %vflags.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  %nv = alloca %struct.variable*, align 4
  %newname = alloca i8*, align 4
  %level = alloca i32, align 4
  %flags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %vflags, i32* %vflags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_noref(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  store %struct.variable* %call, %struct.variable** %nv, align 4
  store i32 0, i32* %level, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %level, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %level, align 4
  %6 = load i32, i32* %level, align 4
  %cmp = icmp sgt i32 %6, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 4
  store i8* %8, i8** %newname, align 4
  %9 = load i8*, i8** %newname, align 4
  %cmp2 = icmp eq i8* %9, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %10 = load i8*, i8** %newname, align 4
  %11 = load i8, i8* %10, align 1
  %conv = sext i8 %11 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end10

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %12 = load i32, i32* %vflags.addr, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then5
  %13 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %14, 4096
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %15 = load %struct.variable*, %struct.variable** %v, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %15, %cond.true ], [ null, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

if.end10:                                         ; preds = %lor.lhs.false
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %16, %struct.variable** %nv, align 4
  store i32 0, i32* %flags, align 4
  %17 = load i32, i32* @expanding_redir, align 4
  %cmp11 = icmp eq i32 %17, 0
  br i1 %cmp11, label %land.lhs.true13, label %if.end18

land.lhs.true13:                                  ; preds = %if.end10
  %18 = load i32, i32* @assigning_in_environment, align 4
  %tobool14 = icmp ne i32 %18, 0
  br i1 %tobool14, label %if.then17, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %land.lhs.true13
  %19 = load i32, i32* @executing_builtin, align 4
  %tobool16 = icmp ne i32 %19, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %lor.lhs.false15, %land.lhs.true13
  %20 = load i32, i32* %flags, align 4
  %or = or i32 %20, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %lor.lhs.false15, %if.end10
  %21 = load i8*, i8** %newname, align 4
  %22 = load i32, i32* %flags, align 4
  %call19 = call %struct.variable* @find_variable_internal(i8* %21, i32 %22)
  store %struct.variable* %call19, %struct.variable** %v, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %23 = load %struct.variable*, %struct.variable** %nv, align 4
  store %struct.variable* %23, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %cond.end, %if.then
  %24 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %24
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_noref(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %flags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %flags, align 4
  %0 = load i32, i32* @expanding_redir, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @assigning_in_environment, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %2 = load i32, i32* @executing_builtin, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %entry
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i32, i32* %flags, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %4, i32 %5)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %6
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_global_variable_last_nameref(i8* %name, i32 %vflags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %vflags.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  %nv = alloca %struct.variable*, align 4
  %newname = alloca i8*, align 4
  %level = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %vflags, i32* %vflags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_global_variable_noref(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  store %struct.variable* %call, %struct.variable** %nv, align 4
  store i32 0, i32* %level, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end10, %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %level, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %level, align 4
  %6 = load i32, i32* %level, align 4
  %cmp = icmp sgt i32 %6, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 4
  store i8* %8, i8** %newname, align 4
  %9 = load i8*, i8** %newname, align 4
  %cmp2 = icmp eq i8* %9, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %10 = load i8*, i8** %newname, align 4
  %11 = load i8, i8* %10, align 1
  %conv = sext i8 %11 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end10

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %12 = load i32, i32* %vflags.addr, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then5
  %13 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %14, 4096
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %15 = load %struct.variable*, %struct.variable** %v, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %15, %cond.true ], [ null, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

if.end10:                                         ; preds = %lor.lhs.false
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %16, %struct.variable** %nv, align 4
  %17 = load i8*, i8** %newname, align 4
  %call11 = call %struct.variable* @find_global_variable_noref(i8* %17)
  store %struct.variable* %call11, %struct.variable** %v, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %18 = load %struct.variable*, %struct.variable** %nv, align 4
  store %struct.variable* %18, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %cond.end, %if.then
  %19 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %19
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_global_variable_noref(i8* %name) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %call = call %struct.variable* @var_lookup(i8* %0, %struct.var_context* %1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 3
  %4 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %tobool = icmp ne %struct.variable* (%struct.variable*)* %4, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value1 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 3
  %6 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value1, align 4
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  %call2 = call %struct.variable* %6(%struct.variable* %7)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call2, %cond.true ], [ %8, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %9 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %9
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_nameref_for_create(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_last_nameref(i8* %0, i32 1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load i32, i32* %flags.addr, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool1 = icmp ne %struct.variable* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and3 = and i32 %4, 2048
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %land.lhs.true5, label %if.end

land.lhs.true5:                                   ; preds = %land.lhs.true2
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %6, 4096
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true5
  %call9 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.56, i32 0, i32 0))
  %7 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @internal_warning(i8* %call9, i8* %7)
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes10 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 5
  %9 = load i32, i32* %attributes10, align 4
  %and11 = and i32 %9, -2049
  store i32 %and11, i32* %attributes10, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true5, %land.lhs.true2, %land.lhs.true, %entry
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool12 = icmp ne %struct.variable* %10, null
  br i1 %tobool12, label %land.lhs.true13, label %if.end24

land.lhs.true13:                                  ; preds = %if.end
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes14 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 5
  %12 = load i32, i32* %attributes14, align 4
  %and15 = and i32 %12, 2048
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.then17, label %if.end24

if.then17:                                        ; preds = %land.lhs.true13
  %13 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 1
  %14 = load i8*, i8** %value, align 4
  %call18 = call i32 @legal_identifier(i8* %14)
  %cmp = icmp eq i32 %call18, 0
  br i1 %cmp, label %if.then19, label %if.end23

if.then19:                                        ; preds = %if.then17
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %value20 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 1
  %16 = load i8*, i8** %value20, align 4
  %tobool21 = icmp ne i8* %16, null
  br i1 %tobool21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then19
  %17 = load %struct.variable*, %struct.variable** %var, align 4
  %value22 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 1
  %18 = load i8*, i8** %value22, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %18, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.57, i32 0, i32 0), %cond.false ]
  call void @sh_invalidid(i8* %cond)
  store %struct.variable* @nameref_invalid_value, %struct.variable** %retval, align 4
  br label %return

if.end23:                                         ; preds = %if.then17
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %land.lhs.true13, %if.end
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %19, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %cond.end
  %20 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %20
}

declare void @sh_invalidid(i8*) #1

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_nameref_for_assignment(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_last_nameref(i8* %0, i32 1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %5, 4096
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %call6 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.56, i32 0, i32 0))
  %6 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @internal_warning(i8* %call6, i8* %6)
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %8, -2049
  store i32 %and8, i32* %attributes7, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool9 = icmp ne %struct.variable* %9, null
  br i1 %tobool9, label %land.lhs.true10, label %if.end21

land.lhs.true10:                                  ; preds = %if.end
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes11 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes11, align 4
  %and12 = and i32 %11, 2048
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.end21

if.then14:                                        ; preds = %land.lhs.true10
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 1
  %13 = load i8*, i8** %value, align 4
  %call15 = call i32 @valid_nameref_value(i8* %13, i32 1)
  %cmp = icmp eq i32 %call15, 0
  br i1 %cmp, label %if.then16, label %if.end20

if.then16:                                        ; preds = %if.then14
  %14 = load %struct.variable*, %struct.variable** %var, align 4
  %value17 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 1
  %15 = load i8*, i8** %value17, align 4
  %tobool18 = icmp ne i8* %15, null
  br i1 %tobool18, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then16
  %16 = load %struct.variable*, %struct.variable** %var, align 4
  %value19 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 1
  %17 = load i8*, i8** %value19, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then16
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %17, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.57, i32 0, i32 0), %cond.false ]
  call void @sh_invalidid(i8* %cond)
  store %struct.variable* @nameref_invalid_value, %struct.variable** %retval, align 4
  br label %return

if.end20:                                         ; preds = %if.then14
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %land.lhs.true10, %if.end
  %18 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %18, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %cond.end
  %19 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %19
}

declare i32 @valid_nameref_value(i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_tempenv(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %0, i32 1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %call2 = call %struct.variable* @find_variable_nameref(%struct.variable* %4)
  store %struct.variable* %call2, %struct.variable** %var, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  ret %struct.variable* %5
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_notempenv(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %0, i32 0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %call2 = call %struct.variable* @find_variable_nameref(%struct.variable* %4)
  store %struct.variable* %call2, %struct.variable** %var, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  ret %struct.variable* %5
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_global_variable(i8* %name) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %call = call %struct.variable* @var_lookup(i8* %0, %struct.var_context* %1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and = and i32 %4, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %call2 = call %struct.variable* @find_variable_nameref(%struct.variable* %5)
  store %struct.variable* %call2, %struct.variable** %var, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %6, null
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 3
  %8 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %tobool5 = icmp ne %struct.variable* (%struct.variable*)* %8, null
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end4
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value6 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 3
  %10 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value6, align 4
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %call7 = call %struct.variable* %10(%struct.variable* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.end4
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call7, %cond.true ], [ %12, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then3
  %13 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %13
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_shell_variable(i8* %name) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call = call %struct.variable* @var_lookup(i8* %0, %struct.var_context* %1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and = and i32 %4, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %call2 = call %struct.variable* @find_variable_nameref(%struct.variable* %5)
  store %struct.variable* %call2, %struct.variable** %var, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %6, null
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 3
  %8 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %tobool5 = icmp ne %struct.variable* (%struct.variable*)* %8, null
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end4
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %dynamic_value6 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 3
  %10 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %dynamic_value6, align 4
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %call7 = call %struct.variable* %10(%struct.variable* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.end4
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call7, %cond.true ], [ %12, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then3
  %13 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %13
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_no_invisible(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %flags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.hash_table* null, %struct.hash_table** @last_table_searched, align 4
  store i32 2, i32* %flags, align 4
  %0 = load i32, i32* @expanding_redir, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @assigning_in_environment, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %2 = load i32, i32* @executing_builtin, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %entry
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i32, i32* %flags, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %4, i32 %5)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool2 = icmp ne %struct.variable* %6, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end7

land.lhs.true3:                                   ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 2048
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %land.lhs.true3
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %call6 = call %struct.variable* @find_variable_nameref(%struct.variable* %9)
  store %struct.variable* %call6, %struct.variable** %v, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %land.lhs.true3, %if.end
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %10
}

; Function Attrs: noinline nounwind
define %struct.variable* @find_variable_for_assignment(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %flags = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.hash_table* null, %struct.hash_table** @last_table_searched, align 4
  store i32 0, i32* %flags, align 4
  %0 = load i32, i32* @expanding_redir, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @assigning_in_environment, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %2 = load i32, i32* @executing_builtin, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %entry
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i32, i32* %flags, align 4
  %call = call %struct.variable* @find_variable_internal(i8* %4, i32 %5)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool2 = icmp ne %struct.variable* %6, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end7

land.lhs.true3:                                   ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 2048
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %land.lhs.true3
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %call6 = call %struct.variable* @find_variable_nameref(%struct.variable* %9)
  store %struct.variable* %call6, %struct.variable** %v, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %land.lhs.true3, %if.end
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %10
}

; Function Attrs: noinline nounwind
define %struct.function_def* @find_function_def(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** @shell_function_defs, align 4
  %call = call %struct.variable* @hash_lookup(i8* %0, %struct.hash_table* %1)
  %2 = bitcast %struct.variable* %call to %struct.function_def*
  ret %struct.function_def* %2
}

; Function Attrs: noinline nounwind
define i8* @get_variable_value(%struct.variable* %var) #0 {
entry:
  %retval = alloca i8*, align 4
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.else2

if.then1:                                         ; preds = %if.else
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  %call = call i8* @array_reference(%struct.array* %5, i64 0)
  store i8* %call, i8** %retval, align 4
  br label %return

if.else2:                                         ; preds = %if.else
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %7, 64
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.else9

if.then6:                                         ; preds = %if.else2
  %8 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value7 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 1
  %9 = load i8*, i8** %value7, align 4
  %10 = bitcast i8* %9 to %struct.hash_table*
  %call8 = call i8* @assoc_reference(%struct.hash_table* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0))
  store i8* %call8, i8** %retval, align 4
  br label %return

if.else9:                                         ; preds = %if.else2
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value10 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  %12 = load i8*, i8** %value10, align 4
  store i8* %12, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else9, %if.then6, %if.then1, %if.then
  %13 = load i8*, i8** %retval, align 4
  ret i8* %13
}

declare i8* @array_reference(%struct.array*, i64) #1

declare i8* @assoc_reference(%struct.hash_table*, i8*) #1

; Function Attrs: noinline nounwind
define i8* @sh_get_env_value(i8* %v) #0 {
entry:
  %v.addr = alloca i8*, align 4
  store i8* %v, i8** %v.addr, align 4
  %0 = load i8*, i8** %v.addr, align 4
  %call = call i8* @get_string_value(i8* %0)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @bind_variable_internal(i8* %name, i8* %value, %struct.hash_table* %table, i32 %hflags, i32 %aflags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %hflags.addr = alloca i32, align 4
  %aflags.addr = alloca i32, align 4
  %newval = alloca i8*, align 4
  %tname = alloca i8*, align 4
  %entry1 = alloca %struct.variable*, align 4
  %tentry = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store i32 %hflags, i32* %hflags.addr, align 4
  store i32 %aflags, i32* %aflags.addr, align 4
  %0 = load i32, i32* %hflags.addr, align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %call = call %struct.variable* @hash_lookup(i8* %1, %struct.hash_table* %2)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ null, %cond.true ], [ %call, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %entry1, align 4
  %3 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool2 = icmp ne %struct.variable* %3, null
  br i1 %tobool2, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %cond.end
  %4 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and3 = and i32 %5, 2048
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %land.lhs.true5, label %if.end19

land.lhs.true5:                                   ; preds = %land.lhs.true
  %6 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %7, 4096
  %cmp = icmp eq i32 %and7, 0
  br i1 %cmp, label %land.lhs.true8, label %if.end19

land.lhs.true8:                                   ; preds = %land.lhs.true5
  %8 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %9 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table9 = getelementptr inbounds %struct.var_context, %struct.var_context* %9, i32 0, i32 5
  %10 = load %struct.hash_table*, %struct.hash_table** %table9, align 4
  %cmp10 = icmp eq %struct.hash_table* %8, %10
  br i1 %cmp10, label %if.then, label %if.end19

if.then:                                          ; preds = %land.lhs.true8
  %11 = load %struct.variable*, %struct.variable** %entry1, align 4
  %name11 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 0
  %12 = load i8*, i8** %name11, align 4
  %call12 = call %struct.variable* @find_global_variable(i8* %12)
  store %struct.variable* %call12, %struct.variable** %entry1, align 4
  %13 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp13 = icmp eq %struct.variable* %13, null
  br i1 %cmp13, label %if.then14, label %if.end

if.then14:                                        ; preds = %if.then
  %14 = load i8*, i8** %name.addr, align 4
  %call15 = call %struct.variable* @find_variable_last_nameref(i8* %14, i32 0)
  store %struct.variable* %call15, %struct.variable** %entry1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then14, %if.then
  %15 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp16 = icmp eq %struct.variable* %15, null
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  %16 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %16, %struct.variable** %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %land.lhs.true8, %land.lhs.true5, %land.lhs.true, %cond.end
  %17 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool20 = icmp ne %struct.variable* %17, null
  br i1 %tobool20, label %land.lhs.true21, label %if.else

land.lhs.true21:                                  ; preds = %if.end19
  %18 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %19, 4096
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %land.lhs.true25, label %if.else

land.lhs.true25:                                  ; preds = %land.lhs.true21
  %20 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes26 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes26, align 4
  %and27 = and i32 %21, 2048
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.else

if.then29:                                        ; preds = %land.lhs.true25
  %22 = load i32, i32* %aflags.addr, align 4
  %and30 = and i32 %22, 32
  %cmp31 = icmp eq i32 %and30, 0
  br i1 %cmp31, label %land.lhs.true32, label %if.end38

land.lhs.true32:                                  ; preds = %if.then29
  %23 = load i8*, i8** %value.addr, align 4
  %tobool33 = icmp ne i8* %23, null
  br i1 %tobool33, label %land.lhs.true34, label %if.end38

land.lhs.true34:                                  ; preds = %land.lhs.true32
  %24 = load i8*, i8** %value.addr, align 4
  %call35 = call i32 @valid_nameref_value(i8* %24, i32 0)
  %cmp36 = icmp eq i32 %call35, 0
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %land.lhs.true34
  %25 = load i8*, i8** %value.addr, align 4
  call void @sh_invalidid(i8* %25)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end38:                                         ; preds = %land.lhs.true34, %land.lhs.true32, %if.then29
  br label %assign_value

if.else:                                          ; preds = %land.lhs.true25, %land.lhs.true21, %if.end19
  %26 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool39 = icmp ne %struct.variable* %26, null
  br i1 %tobool39, label %land.lhs.true40, label %if.else80

land.lhs.true40:                                  ; preds = %if.else
  %27 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes41 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 5
  %28 = load i32, i32* %attributes41, align 4
  %and42 = and i32 %28, 2048
  %tobool43 = icmp ne i32 %and42, 0
  br i1 %tobool43, label %if.then44, label %if.else80

if.then44:                                        ; preds = %land.lhs.true40
  %29 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value45 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 1
  %30 = load i8*, i8** %value45, align 4
  store i8* %30, i8** %newval, align 4
  %31 = load i8*, i8** %newval, align 4
  %call46 = call i32 @valid_array_reference(i8* %31, i32 0)
  %tobool47 = icmp ne i32 %call46, 0
  br i1 %tobool47, label %if.then48, label %if.else75

if.then48:                                        ; preds = %if.then44
  %32 = load i8*, i8** %newval, align 4
  %call49 = call i8* @array_variable_name(i8* %32, i8** null, i32* null)
  store i8* %call49, i8** %tname, align 4
  %33 = load i8*, i8** %tname, align 4
  %tobool50 = icmp ne i8* %33, null
  br i1 %tobool50, label %land.lhs.true51, label %if.end69

land.lhs.true51:                                  ; preds = %if.then48
  %34 = load i8*, i8** %tname, align 4
  %call52 = call %struct.variable* @find_variable_noref(i8* %34)
  store %struct.variable* %call52, %struct.variable** %tentry, align 4
  %tobool53 = icmp ne %struct.variable* %call52, null
  br i1 %tobool53, label %land.lhs.true54, label %if.end69

land.lhs.true54:                                  ; preds = %land.lhs.true51
  %35 = load %struct.variable*, %struct.variable** %tentry, align 4
  %attributes55 = getelementptr inbounds %struct.variable, %struct.variable* %35, i32 0, i32 5
  %36 = load i32, i32* %attributes55, align 4
  %and56 = and i32 %36, 2048
  %tobool57 = icmp ne i32 %and56, 0
  br i1 %tobool57, label %if.then58, label %if.end69

if.then58:                                        ; preds = %land.lhs.true54
  %call59 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.56, i32 0, i32 0))
  %37 = load %struct.variable*, %struct.variable** %tentry, align 4
  %name60 = getelementptr inbounds %struct.variable, %struct.variable* %37, i32 0, i32 0
  %38 = load i8*, i8** %name60, align 4
  call void (i8*, ...) @internal_warning(i8* %call59, i8* %38)
  br label %do.body

do.body:                                          ; preds = %if.then58
  %39 = load %struct.variable*, %struct.variable** %tentry, align 4
  %value61 = getelementptr inbounds %struct.variable, %struct.variable* %39, i32 0, i32 1
  %40 = load i8*, i8** %value61, align 4
  %tobool62 = icmp ne i8* %40, null
  br i1 %tobool62, label %if.then63, label %if.end65

if.then63:                                        ; preds = %do.body
  %41 = load %struct.variable*, %struct.variable** %tentry, align 4
  %value64 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 1
  %42 = load i8*, i8** %value64, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2731)
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end65
  %43 = load %struct.variable*, %struct.variable** %tentry, align 4
  %value66 = getelementptr inbounds %struct.variable, %struct.variable* %43, i32 0, i32 1
  store i8* null, i8** %value66, align 4
  %44 = load %struct.variable*, %struct.variable** %tentry, align 4
  %attributes67 = getelementptr inbounds %struct.variable, %struct.variable* %44, i32 0, i32 5
  %45 = load i32, i32* %attributes67, align 4
  %and68 = and i32 %45, -2049
  store i32 %and68, i32* %attributes67, align 4
  br label %if.end69

if.end69:                                         ; preds = %do.end, %land.lhs.true54, %land.lhs.true51, %if.then48
  %46 = load i8*, i8** %tname, align 4
  call void @sh_xfree(i8* %46, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2735)
  %47 = load i8*, i8** %newval, align 4
  %48 = load %struct.variable*, %struct.variable** %entry1, align 4
  %49 = load i8*, i8** %value.addr, align 4
  %call70 = call i8* @make_variable_value(%struct.variable* %48, i8* %49, i32 0)
  %50 = load i32, i32* %aflags.addr, align 4
  %or = or i32 %50, 16
  %call71 = call %struct.variable* @assign_array_element(i8* %47, i8* %call70, i32 %or)
  store %struct.variable* %call71, %struct.variable** %entry1, align 4
  %51 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp72 = icmp eq %struct.variable* %51, null
  br i1 %cmp72, label %if.then73, label %if.end74

if.then73:                                        ; preds = %if.end69
  %52 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %52, %struct.variable** %retval, align 4
  br label %return

if.end74:                                         ; preds = %if.end69
  br label %if.end79

if.else75:                                        ; preds = %if.then44
  %53 = load i8*, i8** %newval, align 4
  %54 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %call76 = call %struct.variable* @make_new_variable(i8* %53, %struct.hash_table* %54)
  store %struct.variable* %call76, %struct.variable** %entry1, align 4
  %55 = load %struct.variable*, %struct.variable** %entry1, align 4
  %56 = load i8*, i8** %value.addr, align 4
  %call77 = call i8* @make_variable_value(%struct.variable* %55, i8* %56, i32 0)
  %57 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value78 = getelementptr inbounds %struct.variable, %struct.variable* %57, i32 0, i32 1
  store i8* %call77, i8** %value78, align 4
  br label %if.end79

if.end79:                                         ; preds = %if.else75, %if.end74
  br label %if.end194

if.else80:                                        ; preds = %land.lhs.true40, %if.else
  %58 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp81 = icmp eq %struct.variable* %58, null
  br i1 %cmp81, label %if.then82, label %if.else86

if.then82:                                        ; preds = %if.else80
  %59 = load i8*, i8** %name.addr, align 4
  %60 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %call83 = call %struct.variable* @make_new_variable(i8* %59, %struct.hash_table* %60)
  store %struct.variable* %call83, %struct.variable** %entry1, align 4
  %61 = load %struct.variable*, %struct.variable** %entry1, align 4
  %62 = load i8*, i8** %value.addr, align 4
  %call84 = call i8* @make_variable_value(%struct.variable* %61, i8* %62, i32 0)
  %63 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value85 = getelementptr inbounds %struct.variable, %struct.variable* %63, i32 0, i32 1
  store i8* %call84, i8** %value85, align 4
  br label %if.end193

if.else86:                                        ; preds = %if.else80
  %64 = load %struct.variable*, %struct.variable** %entry1, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %64, i32 0, i32 4
  %65 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  %tobool87 = icmp ne %struct.variable* (%struct.variable*, i8*, i64, i8*)* %65, null
  br i1 %tobool87, label %if.then88, label %if.else126

if.then88:                                        ; preds = %if.else86
  br label %do.body89

do.body89:                                        ; preds = %if.then88
  %66 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %66, i32 0, i32 2
  %67 = load i8*, i8** %exportstr, align 4
  %tobool90 = icmp ne i8* %67, null
  br i1 %tobool90, label %if.then91, label %if.end94

if.then91:                                        ; preds = %do.body89
  %68 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr92 = getelementptr inbounds %struct.variable, %struct.variable* %68, i32 0, i32 2
  %69 = load i8*, i8** %exportstr92, align 4
  call void @sh_xfree(i8* %69, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2755)
  %70 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr93 = getelementptr inbounds %struct.variable, %struct.variable* %70, i32 0, i32 2
  store i8* null, i8** %exportstr93, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.then91, %do.body89
  br label %do.end95

do.end95:                                         ; preds = %if.end94
  %71 = load i32, i32* %aflags.addr, align 4
  %and96 = and i32 %71, 1
  %tobool97 = icmp ne i32 %and96, 0
  br i1 %tobool97, label %cond.true98, label %cond.false100

cond.true98:                                      ; preds = %do.end95
  %72 = load %struct.variable*, %struct.variable** %entry1, align 4
  %73 = load i8*, i8** %value.addr, align 4
  %74 = load i32, i32* %aflags.addr, align 4
  %call99 = call i8* @make_variable_value(%struct.variable* %72, i8* %73, i32 %74)
  br label %cond.end101

cond.false100:                                    ; preds = %do.end95
  %75 = load i8*, i8** %value.addr, align 4
  br label %cond.end101

cond.end101:                                      ; preds = %cond.false100, %cond.true98
  %cond102 = phi i8* [ %call99, %cond.true98 ], [ %75, %cond.false100 ]
  store i8* %cond102, i8** %newval, align 4
  %76 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes103 = getelementptr inbounds %struct.variable, %struct.variable* %76, i32 0, i32 5
  %77 = load i32, i32* %attributes103, align 4
  %and104 = and i32 %77, 64
  %tobool105 = icmp ne i32 %and104, 0
  br i1 %tobool105, label %if.then106, label %if.else111

if.then106:                                       ; preds = %cond.end101
  %78 = load %struct.variable*, %struct.variable** %entry1, align 4
  %assign_func107 = getelementptr inbounds %struct.variable, %struct.variable* %78, i32 0, i32 4
  %79 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func107, align 4
  %80 = load %struct.variable*, %struct.variable** %entry1, align 4
  %81 = load i8*, i8** %newval, align 4
  %call108 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2758)
  %call109 = call i8* @strcpy(i8* %call108, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0))
  %call110 = call %struct.variable* %79(%struct.variable* %80, i8* %81, i64 -1, i8* %call109)
  store %struct.variable* %call110, %struct.variable** %entry1, align 4
  br label %if.end122

if.else111:                                       ; preds = %cond.end101
  %82 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes112 = getelementptr inbounds %struct.variable, %struct.variable* %82, i32 0, i32 5
  %83 = load i32, i32* %attributes112, align 4
  %and113 = and i32 %83, 4
  %tobool114 = icmp ne i32 %and113, 0
  br i1 %tobool114, label %if.then115, label %if.else118

if.then115:                                       ; preds = %if.else111
  %84 = load %struct.variable*, %struct.variable** %entry1, align 4
  %assign_func116 = getelementptr inbounds %struct.variable, %struct.variable* %84, i32 0, i32 4
  %85 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func116, align 4
  %86 = load %struct.variable*, %struct.variable** %entry1, align 4
  %87 = load i8*, i8** %newval, align 4
  %call117 = call %struct.variable* %85(%struct.variable* %86, i8* %87, i64 0, i8* null)
  store %struct.variable* %call117, %struct.variable** %entry1, align 4
  br label %if.end121

if.else118:                                       ; preds = %if.else111
  %88 = load %struct.variable*, %struct.variable** %entry1, align 4
  %assign_func119 = getelementptr inbounds %struct.variable, %struct.variable* %88, i32 0, i32 4
  %89 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func119, align 4
  %90 = load %struct.variable*, %struct.variable** %entry1, align 4
  %91 = load i8*, i8** %newval, align 4
  %call120 = call %struct.variable* %89(%struct.variable* %90, i8* %91, i64 -1, i8* null)
  store %struct.variable* %call120, %struct.variable** %entry1, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.else118, %if.then115
  br label %if.end122

if.end122:                                        ; preds = %if.end121, %if.then106
  %92 = load i8*, i8** %newval, align 4
  %93 = load i8*, i8** %value.addr, align 4
  %cmp123 = icmp ne i8* %92, %93
  br i1 %cmp123, label %if.then124, label %if.end125

if.then124:                                       ; preds = %if.end122
  %94 = load i8*, i8** %newval, align 4
  call void @sh_xfree(i8* %94, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2764)
  br label %if.end125

if.end125:                                        ; preds = %if.then124, %if.end122
  %95 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %95, %struct.variable** %retval, align 4
  br label %return

if.else126:                                       ; preds = %if.else86
  br label %assign_value

assign_value:                                     ; preds = %if.else126, %if.end38
  %96 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes127 = getelementptr inbounds %struct.variable, %struct.variable* %96, i32 0, i32 5
  %97 = load i32, i32* %attributes127, align 4
  %and128 = and i32 %97, 2
  %tobool129 = icmp ne i32 %and128, 0
  br i1 %tobool129, label %land.lhs.true130, label %lor.lhs.false

land.lhs.true130:                                 ; preds = %assign_value
  %98 = load i32, i32* %aflags.addr, align 4
  %and131 = and i32 %98, 32
  %cmp132 = icmp eq i32 %and131, 0
  br i1 %cmp132, label %if.then136, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true130, %assign_value
  %99 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes133 = getelementptr inbounds %struct.variable, %struct.variable* %99, i32 0, i32 5
  %100 = load i32, i32* %attributes133, align 4
  %and134 = and i32 %100, 16384
  %tobool135 = icmp ne i32 %and134, 0
  br i1 %tobool135, label %if.then136, label %if.end143

if.then136:                                       ; preds = %lor.lhs.false, %land.lhs.true130
  %101 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes137 = getelementptr inbounds %struct.variable, %struct.variable* %101, i32 0, i32 5
  %102 = load i32, i32* %attributes137, align 4
  %and138 = and i32 %102, 2
  %tobool139 = icmp ne i32 %and138, 0
  br i1 %tobool139, label %if.then140, label %if.end142

if.then140:                                       ; preds = %if.then136
  %103 = load %struct.variable*, %struct.variable** %entry1, align 4
  %name141 = getelementptr inbounds %struct.variable, %struct.variable* %103, i32 0, i32 0
  %104 = load i8*, i8** %name141, align 4
  call void @err_readonly(i8* %104)
  br label %if.end142

if.end142:                                        ; preds = %if.then140, %if.then136
  %105 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %105, %struct.variable** %retval, align 4
  br label %return

if.end143:                                        ; preds = %lor.lhs.false
  %106 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes144 = getelementptr inbounds %struct.variable, %struct.variable* %106, i32 0, i32 5
  %107 = load i32, i32* %attributes144, align 4
  %and145 = and i32 %107, -4097
  store i32 %and145, i32* %attributes144, align 4
  %108 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes146 = getelementptr inbounds %struct.variable, %struct.variable* %108, i32 0, i32 5
  %109 = load i32, i32* %attributes146, align 4
  %and147 = and i32 %109, 64
  %tobool148 = icmp ne i32 %and147, 0
  br i1 %tobool148, label %if.then153, label %lor.lhs.false149

lor.lhs.false149:                                 ; preds = %if.end143
  %110 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes150 = getelementptr inbounds %struct.variable, %struct.variable* %110, i32 0, i32 5
  %111 = load i32, i32* %attributes150, align 4
  %and151 = and i32 %111, 4
  %tobool152 = icmp ne i32 %and151, 0
  br i1 %tobool152, label %if.then153, label %if.else155

if.then153:                                       ; preds = %lor.lhs.false149, %if.end143
  %112 = load %struct.variable*, %struct.variable** %entry1, align 4
  %113 = load i8*, i8** %value.addr, align 4
  %114 = load i32, i32* %aflags.addr, align 4
  %call154 = call i8* @make_array_variable_value(%struct.variable* %112, i64 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0), i8* %113, i32 %114)
  store i8* %call154, i8** %newval, align 4
  br label %if.end157

if.else155:                                       ; preds = %lor.lhs.false149
  %115 = load %struct.variable*, %struct.variable** %entry1, align 4
  %116 = load i8*, i8** %value.addr, align 4
  %117 = load i32, i32* %aflags.addr, align 4
  %call156 = call i8* @make_variable_value(%struct.variable* %115, i8* %116, i32 %117)
  store i8* %call156, i8** %newval, align 4
  br label %if.end157

if.end157:                                        ; preds = %if.else155, %if.then153
  br label %do.body158

do.body158:                                       ; preds = %if.end157
  %118 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr159 = getelementptr inbounds %struct.variable, %struct.variable* %118, i32 0, i32 2
  %119 = load i8*, i8** %exportstr159, align 4
  %tobool160 = icmp ne i8* %119, null
  br i1 %tobool160, label %if.then161, label %if.end164

if.then161:                                       ; preds = %do.body158
  %120 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr162 = getelementptr inbounds %struct.variable, %struct.variable* %120, i32 0, i32 2
  %121 = load i8*, i8** %exportstr162, align 4
  call void @sh_xfree(i8* %121, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2789)
  %122 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr163 = getelementptr inbounds %struct.variable, %struct.variable* %122, i32 0, i32 2
  store i8* null, i8** %exportstr163, align 4
  br label %if.end164

if.end164:                                        ; preds = %if.then161, %do.body158
  br label %do.end165

do.end165:                                        ; preds = %if.end164
  %123 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes166 = getelementptr inbounds %struct.variable, %struct.variable* %123, i32 0, i32 5
  %124 = load i32, i32* %attributes166, align 4
  %and167 = and i32 %124, 64
  %tobool168 = icmp ne i32 %and167, 0
  br i1 %tobool168, label %if.then169, label %if.else174

if.then169:                                       ; preds = %do.end165
  %125 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value170 = getelementptr inbounds %struct.variable, %struct.variable* %125, i32 0, i32 1
  %126 = load i8*, i8** %value170, align 4
  %127 = bitcast i8* %126 to %struct.hash_table*
  %call171 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2798)
  %call172 = call i8* @strcpy(i8* %call171, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0))
  %128 = load i8*, i8** %newval, align 4
  %call173 = call i32 @assoc_insert(%struct.hash_table* %127, i8* %call172, i8* %128)
  %129 = load i8*, i8** %newval, align 4
  call void @sh_xfree(i8* %129, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2799)
  br label %if.end191

if.else174:                                       ; preds = %do.end165
  %130 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes175 = getelementptr inbounds %struct.variable, %struct.variable* %130, i32 0, i32 5
  %131 = load i32, i32* %attributes175, align 4
  %and176 = and i32 %131, 4
  %tobool177 = icmp ne i32 %and176, 0
  br i1 %tobool177, label %if.then178, label %if.else181

if.then178:                                       ; preds = %if.else174
  %132 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value179 = getelementptr inbounds %struct.variable, %struct.variable* %132, i32 0, i32 1
  %133 = load i8*, i8** %value179, align 4
  %134 = bitcast i8* %133 to %struct.array*
  %135 = load i8*, i8** %newval, align 4
  %call180 = call i32 @array_insert(%struct.array* %134, i64 0, i8* %135)
  %136 = load i8*, i8** %newval, align 4
  call void @sh_xfree(i8* %136, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2804)
  br label %if.end190

if.else181:                                       ; preds = %if.else174
  br label %do.body182

do.body182:                                       ; preds = %if.else181
  %137 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value183 = getelementptr inbounds %struct.variable, %struct.variable* %137, i32 0, i32 1
  %138 = load i8*, i8** %value183, align 4
  %tobool184 = icmp ne i8* %138, null
  br i1 %tobool184, label %if.then185, label %if.end187

if.then185:                                       ; preds = %do.body182
  %139 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value186 = getelementptr inbounds %struct.variable, %struct.variable* %139, i32 0, i32 1
  %140 = load i8*, i8** %value186, align 4
  call void @sh_xfree(i8* %140, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2809)
  br label %if.end187

if.end187:                                        ; preds = %if.then185, %do.body182
  br label %do.end188

do.end188:                                        ; preds = %if.end187
  %141 = load i8*, i8** %newval, align 4
  %142 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value189 = getelementptr inbounds %struct.variable, %struct.variable* %142, i32 0, i32 1
  store i8* %141, i8** %value189, align 4
  br label %if.end190

if.end190:                                        ; preds = %do.end188, %if.then178
  br label %if.end191

if.end191:                                        ; preds = %if.end190, %if.then169
  br label %if.end192

if.end192:                                        ; preds = %if.end191
  br label %if.end193

if.end193:                                        ; preds = %if.end192, %if.then82
  br label %if.end194

if.end194:                                        ; preds = %if.end193, %if.end79
  br label %if.end195

if.end195:                                        ; preds = %if.end194
  %143 = load i32, i32* @mark_modified_vars, align 4
  %tobool196 = icmp ne i32 %143, 0
  br i1 %tobool196, label %if.then197, label %if.end200

if.then197:                                       ; preds = %if.end195
  %144 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes198 = getelementptr inbounds %struct.variable, %struct.variable* %144, i32 0, i32 5
  %145 = load i32, i32* %attributes198, align 4
  %or199 = or i32 %145, 1
  store i32 %or199, i32* %attributes198, align 4
  br label %if.end200

if.end200:                                        ; preds = %if.then197, %if.end195
  %146 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes201 = getelementptr inbounds %struct.variable, %struct.variable* %146, i32 0, i32 5
  %147 = load i32, i32* %attributes201, align 4
  %and202 = and i32 %147, 1
  %tobool203 = icmp ne i32 %and202, 0
  br i1 %tobool203, label %if.then204, label %if.end205

if.then204:                                       ; preds = %if.end200
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end205

if.end205:                                        ; preds = %if.then204, %if.end200
  %148 = load %struct.variable*, %struct.variable** %entry1, align 4
  store %struct.variable* %148, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end205, %if.end142, %if.end125, %if.then73, %if.then37, %if.then17
  %149 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %149
}

; Function Attrs: noinline nounwind
define %struct.variable* @make_local_variable(i8* %name) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %new_var = alloca %struct.variable*, align 4
  %old_var = alloca %struct.variable*, align 4
  %old_ref = alloca %struct.variable*, align 4
  %vc = alloca %struct.var_context*, align 4
  %was_tmpvar = alloca i32, align 4
  %tmp_value = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_noref(i8* %0)
  store %struct.variable* %call, %struct.variable** %old_ref, align 4
  %1 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store %struct.variable* null, %struct.variable** %old_ref, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load i8*, i8** %name.addr, align 4
  %call1 = call %struct.variable* @find_variable(i8* %4)
  store %struct.variable* %call1, %struct.variable** %old_var, align 4
  %5 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %cmp2 = icmp eq %struct.variable* %5, null
  br i1 %cmp2, label %land.lhs.true3, label %if.end12

land.lhs.true3:                                   ; preds = %if.end
  %6 = load %struct.variable*, %struct.variable** %old_var, align 4
  %tobool4 = icmp ne %struct.variable* %6, null
  br i1 %tobool4, label %land.lhs.true5, label %if.end12

land.lhs.true5:                                   ; preds = %land.lhs.true3
  %7 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %8, 32
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %land.lhs.true9, label %if.end12

land.lhs.true9:                                   ; preds = %land.lhs.true5
  %9 = load %struct.variable*, %struct.variable** %old_var, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 6
  %10 = load i32, i32* %context, align 4
  %11 = load i32, i32* @variable_context, align 4
  %cmp10 = icmp eq i32 %10, %11
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true9
  %12 = load %struct.variable*, %struct.variable** %old_var, align 4
  store %struct.variable* %12, %struct.variable** %retval, align 4
  br label %return

if.end12:                                         ; preds = %land.lhs.true9, %land.lhs.true5, %land.lhs.true3, %if.end
  %13 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %tobool13 = icmp ne %struct.variable* %13, null
  br i1 %tobool13, label %land.lhs.true14, label %if.end22

land.lhs.true14:                                  ; preds = %if.end12
  %14 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %attributes15 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes15, align 4
  %and16 = and i32 %15, 32
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %land.lhs.true18, label %if.end22

land.lhs.true18:                                  ; preds = %land.lhs.true14
  %16 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %context19 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 6
  %17 = load i32, i32* %context19, align 4
  %18 = load i32, i32* @variable_context, align 4
  %cmp20 = icmp eq i32 %17, %18
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true18
  %19 = load %struct.variable*, %struct.variable** %old_ref, align 4
  store %struct.variable* %19, %struct.variable** %retval, align 4
  br label %return

if.end22:                                         ; preds = %land.lhs.true18, %land.lhs.true14, %if.end12
  %20 = load %struct.variable*, %struct.variable** %old_ref, align 4
  %tobool23 = icmp ne %struct.variable* %20, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  %21 = load %struct.variable*, %struct.variable** %old_ref, align 4
  store %struct.variable* %21, %struct.variable** %old_var, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end22
  %22 = load %struct.variable*, %struct.variable** %old_var, align 4
  %tobool26 = icmp ne %struct.variable* %22, null
  br i1 %tobool26, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end25
  %23 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes27 = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 5
  %24 = load i32, i32* %attributes27, align 4
  %and28 = and i32 %24, 1048576
  %tobool29 = icmp ne i32 %and28, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end25
  %25 = phi i1 [ false, %if.end25 ], [ %tobool29, %land.rhs ]
  %land.ext = zext i1 %25 to i32
  store i32 %land.ext, i32* %was_tmpvar, align 4
  %26 = load i32, i32* %was_tmpvar, align 4
  %tobool30 = icmp ne i32 %26, 0
  br i1 %tobool30, label %land.lhs.true31, label %if.end39

land.lhs.true31:                                  ; preds = %land.end
  %27 = load %struct.variable*, %struct.variable** %old_var, align 4
  %context32 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 6
  %28 = load i32, i32* %context32, align 4
  %29 = load i32, i32* @variable_context, align 4
  %cmp33 = icmp eq i32 %28, %29
  br i1 %cmp33, label %land.lhs.true34, label %if.end39

land.lhs.true34:                                  ; preds = %land.lhs.true31
  %30 = load %struct.hash_table*, %struct.hash_table** @last_table_searched, align 4
  %31 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %cmp35 = icmp ne %struct.hash_table* %30, %31
  br i1 %cmp35, label %if.then36, label %if.end39

if.then36:                                        ; preds = %land.lhs.true34
  %32 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes37 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 5
  %33 = load i32, i32* %attributes37, align 4
  %and38 = and i32 %33, -4097
  store i32 %and38, i32* %attributes37, align 4
  %34 = load %struct.variable*, %struct.variable** %old_var, align 4
  store %struct.variable* %34, %struct.variable** %retval, align 4
  br label %return

if.end39:                                         ; preds = %land.lhs.true34, %land.lhs.true31, %land.end
  %35 = load i32, i32* %was_tmpvar, align 4
  %tobool40 = icmp ne i32 %35, 0
  br i1 %tobool40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end39
  %36 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 1
  %37 = load i8*, i8** %value, align 4
  store i8* %37, i8** %tmp_value, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.end39
  %38 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %38, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end42
  %39 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool43 = icmp ne %struct.var_context* %39, null
  br i1 %tobool43, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %40 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %40, i32 0, i32 2
  %41 = load i32, i32* %flags, align 4
  %and44 = and i32 %41, 4
  %cmp45 = icmp ne i32 %and44, 0
  br i1 %cmp45, label %land.lhs.true46, label %if.end49

land.lhs.true46:                                  ; preds = %for.body
  %42 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %scope = getelementptr inbounds %struct.var_context, %struct.var_context* %42, i32 0, i32 1
  %43 = load i32, i32* %scope, align 4
  %44 = load i32, i32* @variable_context, align 4
  %cmp47 = icmp eq i32 %43, %44
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %land.lhs.true46
  br label %for.end

if.end49:                                         ; preds = %land.lhs.true46, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end49
  %45 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %45, i32 0, i32 4
  %46 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %46, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then48, %for.cond
  %47 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %cmp50 = icmp eq %struct.var_context* %47, null
  br i1 %cmp50, label %if.then51, label %if.else

if.then51:                                        ; preds = %for.end
  %call52 = call i8* @libintl_gettext(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.59, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call52)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.else:                                          ; preds = %for.end
  %48 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %48, i32 0, i32 5
  %49 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %cmp53 = icmp eq %struct.hash_table* %49, null
  br i1 %cmp53, label %if.then54, label %if.end57

if.then54:                                        ; preds = %if.else
  %call55 = call %struct.hash_table* @hash_create(i32 4)
  %50 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table56 = getelementptr inbounds %struct.var_context, %struct.var_context* %50, i32 0, i32 5
  store %struct.hash_table* %call55, %struct.hash_table** %table56, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then54, %if.else
  br label %if.end58

if.end58:                                         ; preds = %if.end57
  %51 = load %struct.variable*, %struct.variable** %old_var, align 4
  %tobool59 = icmp ne %struct.variable* %51, null
  br i1 %tobool59, label %land.lhs.true60, label %if.end83

land.lhs.true60:                                  ; preds = %if.end58
  %52 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes61 = getelementptr inbounds %struct.variable, %struct.variable* %52, i32 0, i32 5
  %53 = load i32, i32* %attributes61, align 4
  %and62 = and i32 %53, 16384
  %tobool63 = icmp ne i32 %and62, 0
  br i1 %tobool63, label %if.then70, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true60
  %54 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes64 = getelementptr inbounds %struct.variable, %struct.variable* %54, i32 0, i32 5
  %55 = load i32, i32* %attributes64, align 4
  %and65 = and i32 %55, 2
  %tobool66 = icmp ne i32 %and65, 0
  br i1 %tobool66, label %land.lhs.true67, label %if.end83

land.lhs.true67:                                  ; preds = %lor.lhs.false
  %56 = load %struct.variable*, %struct.variable** %old_var, align 4
  %context68 = getelementptr inbounds %struct.variable, %struct.variable* %56, i32 0, i32 6
  %57 = load i32, i32* %context68, align 4
  %cmp69 = icmp eq i32 %57, 0
  br i1 %cmp69, label %if.then70, label %if.end83

if.then70:                                        ; preds = %land.lhs.true67, %land.lhs.true60
  %58 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes71 = getelementptr inbounds %struct.variable, %struct.variable* %58, i32 0, i32 5
  %59 = load i32, i32* %attributes71, align 4
  %and72 = and i32 %59, 2
  %tobool73 = icmp ne i32 %and72, 0
  br i1 %tobool73, label %if.then74, label %if.else75

if.then74:                                        ; preds = %if.then70
  %60 = load i8*, i8** %name.addr, align 4
  call void @sh_readonly(i8* %60)
  br label %if.end82

if.else75:                                        ; preds = %if.then70
  %61 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes76 = getelementptr inbounds %struct.variable, %struct.variable* %61, i32 0, i32 5
  %62 = load i32, i32* %attributes76, align 4
  %and77 = and i32 %62, 16384
  %tobool78 = icmp ne i32 %and77, 0
  br i1 %tobool78, label %if.then79, label %if.end81

if.then79:                                        ; preds = %if.else75
  %call80 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.60, i32 0, i32 0))
  %63 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call80, i8* %63)
  br label %if.end81

if.end81:                                         ; preds = %if.then79, %if.else75
  br label %if.end82

if.end82:                                         ; preds = %if.end81, %if.then74
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end83:                                         ; preds = %land.lhs.true67, %lor.lhs.false, %if.end58
  %64 = load %struct.variable*, %struct.variable** %old_var, align 4
  %cmp84 = icmp eq %struct.variable* %64, null
  br i1 %cmp84, label %if.then85, label %if.else88

if.then85:                                        ; preds = %if.end83
  %65 = load i8*, i8** %name.addr, align 4
  %66 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table86 = getelementptr inbounds %struct.var_context, %struct.var_context* %66, i32 0, i32 5
  %67 = load %struct.hash_table*, %struct.hash_table** %table86, align 4
  %call87 = call %struct.variable* @make_new_variable(i8* %65, %struct.hash_table* %67)
  store %struct.variable* %call87, %struct.variable** %new_var, align 4
  br label %if.end102

if.else88:                                        ; preds = %if.end83
  %68 = load i8*, i8** %name.addr, align 4
  %69 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table89 = getelementptr inbounds %struct.var_context, %struct.var_context* %69, i32 0, i32 5
  %70 = load %struct.hash_table*, %struct.hash_table** %table89, align 4
  %call90 = call %struct.variable* @make_new_variable(i8* %68, %struct.hash_table* %70)
  store %struct.variable* %call90, %struct.variable** %new_var, align 4
  %71 = load i32, i32* %was_tmpvar, align 4
  %tobool91 = icmp ne i32 %71, 0
  br i1 %tobool91, label %if.then92, label %if.end97

if.then92:                                        ; preds = %if.else88
  %72 = load i8*, i8** %tmp_value, align 4
  %call93 = call i32 @strlen(i8* %72)
  %add = add i32 1, %call93
  %call94 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2452)
  %73 = load i8*, i8** %tmp_value, align 4
  %call95 = call i8* @strcpy(i8* %call94, i8* %73)
  %74 = load %struct.variable*, %struct.variable** %new_var, align 4
  %value96 = getelementptr inbounds %struct.variable, %struct.variable* %74, i32 0, i32 1
  store i8* %call95, i8** %value96, align 4
  br label %if.end97

if.end97:                                         ; preds = %if.then92, %if.else88
  %75 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes98 = getelementptr inbounds %struct.variable, %struct.variable* %75, i32 0, i32 5
  %76 = load i32, i32* %attributes98, align 4
  %and99 = and i32 %76, 1
  %tobool100 = icmp ne i32 %and99, 0
  %cond = select i1 %tobool100, i32 1, i32 0
  %77 = load %struct.variable*, %struct.variable** %new_var, align 4
  %attributes101 = getelementptr inbounds %struct.variable, %struct.variable* %77, i32 0, i32 5
  store i32 %cond, i32* %attributes101, align 4
  br label %if.end102

if.end102:                                        ; preds = %if.end97, %if.then85
  %78 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags103 = getelementptr inbounds %struct.var_context, %struct.var_context* %78, i32 0, i32 2
  %79 = load i32, i32* %flags103, align 4
  %or = or i32 %79, 1
  store i32 %or, i32* %flags103, align 4
  %80 = load i32, i32* @variable_context, align 4
  %81 = load %struct.variable*, %struct.variable** %new_var, align 4
  %context104 = getelementptr inbounds %struct.variable, %struct.variable* %81, i32 0, i32 6
  store i32 %80, i32* %context104, align 4
  %82 = load %struct.variable*, %struct.variable** %new_var, align 4
  %attributes105 = getelementptr inbounds %struct.variable, %struct.variable* %82, i32 0, i32 5
  %83 = load i32, i32* %attributes105, align 4
  %or106 = or i32 %83, 32
  store i32 %or106, i32* %attributes105, align 4
  %84 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %84, i32 0
  %85 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %85 to i32
  %cmp107 = icmp eq i32 %conv, 73
  br i1 %cmp107, label %land.lhs.true109, label %if.end125

land.lhs.true109:                                 ; preds = %if.end102
  %86 = load i8*, i8** %name.addr, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %86, i32 1
  %87 = load i8, i8* %arrayidx110, align 1
  %conv111 = sext i8 %87 to i32
  %cmp112 = icmp eq i32 %conv111, 70
  br i1 %cmp112, label %land.lhs.true114, label %if.end125

land.lhs.true114:                                 ; preds = %land.lhs.true109
  %88 = load i8*, i8** %name.addr, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %88, i32 2
  %89 = load i8, i8* %arrayidx115, align 1
  %conv116 = sext i8 %89 to i32
  %cmp117 = icmp eq i32 %conv116, 83
  br i1 %cmp117, label %land.lhs.true119, label %if.end125

land.lhs.true119:                                 ; preds = %land.lhs.true114
  %90 = load i8*, i8** %name.addr, align 4
  %arrayidx120 = getelementptr inbounds i8, i8* %90, i32 3
  %91 = load i8, i8* %arrayidx120, align 1
  %conv121 = sext i8 %91 to i32
  %cmp122 = icmp eq i32 %conv121, 0
  br i1 %cmp122, label %if.then124, label %if.end125

if.then124:                                       ; preds = %land.lhs.true119
  %92 = load %struct.variable*, %struct.variable** %new_var, align 4
  call void @setifs(%struct.variable* %92)
  br label %if.end125

if.end125:                                        ; preds = %if.then124, %land.lhs.true119, %land.lhs.true114, %land.lhs.true109, %if.end102
  %93 = load i32, i32* %was_tmpvar, align 4
  %cmp126 = icmp eq i32 %93, 0
  br i1 %cmp126, label %land.lhs.true128, label %if.end134

land.lhs.true128:                                 ; preds = %if.end125
  %94 = load i32, i32* @no_invisible_vars, align 4
  %cmp129 = icmp eq i32 %94, 0
  br i1 %cmp129, label %if.then131, label %if.end134

if.then131:                                       ; preds = %land.lhs.true128
  %95 = load %struct.variable*, %struct.variable** %new_var, align 4
  %attributes132 = getelementptr inbounds %struct.variable, %struct.variable* %95, i32 0, i32 5
  %96 = load i32, i32* %attributes132, align 4
  %or133 = or i32 %96, 4096
  store i32 %or133, i32* %attributes132, align 4
  br label %if.end134

if.end134:                                        ; preds = %if.then131, %land.lhs.true128, %if.end125
  %97 = load %struct.variable*, %struct.variable** %new_var, align 4
  store %struct.variable* %97, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end134, %if.end82, %if.then51, %if.then36, %if.then21, %if.then11
  %98 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %98
}

declare void @internal_error(i8*, ...) #1

declare %struct.hash_table* @hash_create(i32) #1

declare void @sh_readonly(i8*) #1

declare void @builtin_error(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @make_new_variable(i8* %name, %struct.hash_table* %table) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %entry1 = alloca %struct.variable*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @new_shell_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %cmp = icmp eq %struct.var_context* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @create_variable_tables()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call2 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2512)
  %3 = load i8*, i8** %name.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %3)
  %4 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %call5 = call %struct.bucket_contents* @hash_insert(i8* %call4, %struct.hash_table* %4, i32 1)
  store %struct.bucket_contents* %call5, %struct.bucket_contents** %elt, align 4
  %5 = load %struct.variable*, %struct.variable** %entry1, align 4
  %6 = bitcast %struct.variable* %5 to i8*
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %7, i32 0, i32 2
  store i8* %6, i8** %data, align 4
  %8 = load %struct.variable*, %struct.variable** %entry1, align 4
  ret %struct.variable* %8
}

; Function Attrs: noinline nounwind
define %struct.variable* @make_new_array_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %entry1 = alloca %struct.variable*, align 4
  %array = alloca %struct.array*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %1, i32 0, i32 5
  %2 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.variable* @make_new_variable(i8* %0, %struct.hash_table* %2)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %call2 = call %struct.array* @array_create()
  store %struct.array* %call2, %struct.array** %array, align 4
  %3 = load %struct.array*, %struct.array** %array, align 4
  %4 = bitcast %struct.array* %3 to i8*
  %5 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  store i8* %4, i8** %value, align 4
  %6 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes, align 4
  %or = or i32 %7, 4
  store i32 %or, i32* %attributes, align 4
  %8 = load %struct.variable*, %struct.variable** %entry1, align 4
  ret %struct.variable* %8
}

declare %struct.array* @array_create() #1

; Function Attrs: noinline nounwind
define %struct.variable* @make_local_array_variable(i8* %name, i32 %assoc_ok) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %assoc_ok.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  %array = alloca %struct.array*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %assoc_ok, i32* %assoc_ok.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @make_local_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false1

lor.lhs.false1:                                   ; preds = %lor.lhs.false
  %4 = load i32, i32* %assoc_ok.addr, align 4
  %tobool2 = icmp ne i32 %4, 0
  br i1 %tobool2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false1
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %6, 64
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %entry
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %7, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false1
  %call6 = call %struct.array* @array_create()
  store %struct.array* %call6, %struct.array** %array, align 4
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable_value(%struct.variable* %8)
  %9 = load %struct.array*, %struct.array** %array, align 4
  %10 = bitcast %struct.array* %9 to i8*
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  store i8* %10, i8** %value, align 4
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes7, align 4
  %or = or i32 %13, 4
  store i32 %or, i32* %attributes7, align 4
  %14 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %14, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %15 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %15
}

; Function Attrs: noinline nounwind
define internal void @dispose_variable_value(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %4 = bitcast i8* %3 to %struct.command*
  call void @dispose_command(%struct.command* %4)
  br label %if.end32

if.else:                                          ; preds = %entry
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %6, 4
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %if.then4, label %if.else6

if.then4:                                         ; preds = %if.else
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value5, align 4
  %9 = bitcast i8* %8 to %struct.array*
  call void @array_dispose(%struct.array* %9)
  br label %if.end31

if.else6:                                         ; preds = %if.else
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %11, 64
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.else6
  %12 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value11 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 1
  %13 = load i8*, i8** %value11, align 4
  %14 = bitcast i8* %13 to %struct.hash_table*
  call void @assoc_dispose(%struct.hash_table* %14)
  br label %if.end30

if.else12:                                        ; preds = %if.else6
  %15 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes13 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes13, align 4
  %and14 = and i32 %16, 2048
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.else21

if.then16:                                        ; preds = %if.else12
  br label %do.body

do.body:                                          ; preds = %if.then16
  %17 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value17 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 1
  %18 = load i8*, i8** %value17, align 4
  %tobool18 = icmp ne i8* %18, null
  br i1 %tobool18, label %if.then19, label %if.end

if.then19:                                        ; preds = %do.body
  %19 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value20 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 1
  %20 = load i8*, i8** %value20, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3313)
  br label %if.end

if.end:                                           ; preds = %if.then19, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end29

if.else21:                                        ; preds = %if.else12
  br label %do.body22

do.body22:                                        ; preds = %if.else21
  %21 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value23 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value23, align 4
  %tobool24 = icmp ne i8* %22, null
  br i1 %tobool24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %do.body22
  %23 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value26 = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 1
  %24 = load i8*, i8** %value26, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3315)
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %do.body22
  br label %do.end28

do.end28:                                         ; preds = %if.end27
  br label %if.end29

if.end29:                                         ; preds = %do.end28, %do.end
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then10
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.then4
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define %struct.variable* @make_new_assoc_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %entry1 = alloca %struct.variable*, align 4
  %hash = alloca %struct.hash_table*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %1, i32 0, i32 5
  %2 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.variable* @make_new_variable(i8* %0, %struct.hash_table* %2)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %call2 = call %struct.hash_table* @hash_create(i32 0)
  store %struct.hash_table* %call2, %struct.hash_table** %hash, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** %hash, align 4
  %4 = bitcast %struct.hash_table* %3 to i8*
  %5 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  store i8* %4, i8** %value, align 4
  %6 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes, align 4
  %or = or i32 %7, 64
  store i32 %or, i32* %attributes, align 4
  %8 = load %struct.variable*, %struct.variable** %entry1, align 4
  ret %struct.variable* %8
}

; Function Attrs: noinline nounwind
define %struct.variable* @make_local_assoc_variable(i8* %name) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %hash = alloca %struct.hash_table*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @make_local_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 64
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %4, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable_value(%struct.variable* %5)
  %call1 = call %struct.hash_table* @hash_create(i32 0)
  store %struct.hash_table* %call1, %struct.hash_table** %hash, align 4
  %6 = load %struct.hash_table*, %struct.hash_table** %hash, align 4
  %7 = bitcast %struct.hash_table* %6 to i8*
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 1
  store i8* %7, i8** %value, align 4
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes2 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes2, align 4
  %or = or i32 %10, 64
  store i32 %or, i32* %attributes2, align 4
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  store %struct.variable* %11, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %12 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %12
}

; Function Attrs: noinline nounwind
define i8* @make_variable_value(%struct.variable* %var, i8* %value, i32 %flags) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %retval1 = alloca i8*, align 4
  %oval = alloca i8*, align 4
  %lval = alloca i64, align 8
  %rval = alloca i64, align 8
  %expok = alloca i32, align 4
  %olen = alloca i32, align 4
  %op = alloca i32, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %flags.addr, align 4
  %and2 = and i32 %2, 1
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.then
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value5, align 4
  store i8* %4, i8** %oval, align 4
  %5 = load i8*, i8** %oval, align 4
  %call = call i64 @evalexp(i8* %5, i32* %expok)
  store i64 %call, i64* %lval, align 8
  %6 = load i32, i32* %expok, align 4
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  call void @top_level_cleanup()
  call void @jump_to_top_level(i32 2) #6
  unreachable

if.end:                                           ; preds = %if.then4
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  %7 = load i8*, i8** %value.addr, align 4
  %call8 = call i64 @evalexp(i8* %7, i32* %expok)
  store i64 %call8, i64* %rval, align 8
  %8 = load i32, i32* %expok, align 4
  %cmp9 = icmp eq i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  call void @top_level_cleanup()
  call void @jump_to_top_level(i32 2) #6
  unreachable

if.end11:                                         ; preds = %if.end7
  %9 = load i32, i32* %flags.addr, align 4
  %and12 = and i32 %9, 1
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  %10 = load i64, i64* %lval, align 8
  %11 = load i64, i64* %rval, align 8
  %add = add nsw i64 %11, %10
  store i64 %add, i64* %rval, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end11
  %12 = load i64, i64* %rval, align 8
  %call16 = call i8* @itos(i64 %12)
  store i8* %call16, i8** %retval1, align 4
  br label %if.end201

if.else:                                          ; preds = %entry
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes17 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes17, align 4
  %and18 = and i32 %14, 1024
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then27, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %15 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes20 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes20, align 4
  %and21 = and i32 %16, 256
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then27, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false
  %17 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes24 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes24, align 4
  %and25 = and i32 %18, 512
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then27, label %if.else113

if.then27:                                        ; preds = %lor.lhs.false23, %lor.lhs.false, %if.else
  %19 = load i32, i32* %flags.addr, align 4
  %and28 = and i32 %19, 1
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %if.then30, label %if.else89

if.then30:                                        ; preds = %if.then27
  %20 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %call31 = call i8* @get_variable_value(%struct.variable* %20)
  store i8* %call31, i8** %oval, align 4
  %21 = load i8*, i8** %oval, align 4
  %cmp32 = icmp eq i8* %21, null
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.then30
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.57, i32 0, i32 0), i8** %oval, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.then30
  %22 = load i8*, i8** %oval, align 4
  %tobool35 = icmp ne i8* %22, null
  br i1 %tobool35, label %land.lhs.true, label %cond.false49

land.lhs.true:                                    ; preds = %if.end34
  %23 = load i8*, i8** %oval, align 4
  %arrayidx = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %24 to i32
  %tobool36 = icmp ne i32 %conv, 0
  br i1 %tobool36, label %cond.true, label %cond.false49

cond.true:                                        ; preds = %land.lhs.true
  %25 = load i8*, i8** %oval, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %25, i32 1
  %26 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %26 to i32
  %tobool39 = icmp ne i32 %conv38, 0
  br i1 %tobool39, label %cond.true40, label %cond.false46

cond.true40:                                      ; preds = %cond.true
  %27 = load i8*, i8** %oval, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %27, i32 2
  %28 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %28 to i32
  %tobool43 = icmp ne i32 %conv42, 0
  br i1 %tobool43, label %cond.true44, label %cond.false

cond.true44:                                      ; preds = %cond.true40
  %29 = load i8*, i8** %oval, align 4
  %call45 = call i32 @strlen(i8* %29)
  br label %cond.end

cond.false:                                       ; preds = %cond.true40
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true44
  %cond = phi i32 [ %call45, %cond.true44 ], [ 2, %cond.false ]
  br label %cond.end47

cond.false46:                                     ; preds = %cond.true
  br label %cond.end47

cond.end47:                                       ; preds = %cond.false46, %cond.end
  %cond48 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false46 ]
  br label %cond.end50

cond.false49:                                     ; preds = %land.lhs.true, %if.end34
  br label %cond.end50

cond.end50:                                       ; preds = %cond.false49, %cond.end47
  %cond51 = phi i32 [ %cond48, %cond.end47 ], [ 0, %cond.false49 ]
  store i32 %cond51, i32* %olen, align 4
  %30 = load i32, i32* %olen, align 4
  %31 = load i8*, i8** %value.addr, align 4
  %tobool52 = icmp ne i8* %31, null
  br i1 %tobool52, label %cond.true53, label %cond.false78

cond.true53:                                      ; preds = %cond.end50
  %32 = load i8*, i8** %value.addr, align 4
  %tobool54 = icmp ne i8* %32, null
  br i1 %tobool54, label %land.lhs.true55, label %cond.false75

land.lhs.true55:                                  ; preds = %cond.true53
  %33 = load i8*, i8** %value.addr, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %33, i32 0
  %34 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %34 to i32
  %tobool58 = icmp ne i32 %conv57, 0
  br i1 %tobool58, label %cond.true59, label %cond.false75

cond.true59:                                      ; preds = %land.lhs.true55
  %35 = load i8*, i8** %value.addr, align 4
  %arrayidx60 = getelementptr inbounds i8, i8* %35, i32 1
  %36 = load i8, i8* %arrayidx60, align 1
  %conv61 = sext i8 %36 to i32
  %tobool62 = icmp ne i32 %conv61, 0
  br i1 %tobool62, label %cond.true63, label %cond.false72

cond.true63:                                      ; preds = %cond.true59
  %37 = load i8*, i8** %value.addr, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %37, i32 2
  %38 = load i8, i8* %arrayidx64, align 1
  %conv65 = sext i8 %38 to i32
  %tobool66 = icmp ne i32 %conv65, 0
  br i1 %tobool66, label %cond.true67, label %cond.false69

cond.true67:                                      ; preds = %cond.true63
  %39 = load i8*, i8** %value.addr, align 4
  %call68 = call i32 @strlen(i8* %39)
  br label %cond.end70

cond.false69:                                     ; preds = %cond.true63
  br label %cond.end70

cond.end70:                                       ; preds = %cond.false69, %cond.true67
  %cond71 = phi i32 [ %call68, %cond.true67 ], [ 2, %cond.false69 ]
  br label %cond.end73

cond.false72:                                     ; preds = %cond.true59
  br label %cond.end73

cond.end73:                                       ; preds = %cond.false72, %cond.end70
  %cond74 = phi i32 [ %cond71, %cond.end70 ], [ 1, %cond.false72 ]
  br label %cond.end76

cond.false75:                                     ; preds = %land.lhs.true55, %cond.true53
  br label %cond.end76

cond.end76:                                       ; preds = %cond.false75, %cond.end73
  %cond77 = phi i32 [ %cond74, %cond.end73 ], [ 0, %cond.false75 ]
  br label %cond.end79

cond.false78:                                     ; preds = %cond.end50
  br label %cond.end79

cond.end79:                                       ; preds = %cond.false78, %cond.end76
  %cond80 = phi i32 [ %cond77, %cond.end76 ], [ 0, %cond.false78 ]
  %add81 = add i32 %30, %cond80
  %add82 = add i32 %add81, 1
  %call83 = call i8* @sh_xmalloc(i32 %add82, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2637)
  store i8* %call83, i8** %retval1, align 4
  %40 = load i8*, i8** %retval1, align 4
  %41 = load i8*, i8** %oval, align 4
  %call84 = call i8* @strcpy(i8* %40, i8* %41)
  %42 = load i8*, i8** %value.addr, align 4
  %tobool85 = icmp ne i8* %42, null
  br i1 %tobool85, label %if.then86, label %if.end88

if.then86:                                        ; preds = %cond.end79
  %43 = load i8*, i8** %retval1, align 4
  %44 = load i32, i32* %olen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i8*, i8** %value.addr, align 4
  %call87 = call i8* @strcpy(i8* %add.ptr, i8* %45)
  br label %if.end88

if.end88:                                         ; preds = %if.then86, %cond.end79
  br label %if.end100

if.else89:                                        ; preds = %if.then27
  %46 = load i8*, i8** %value.addr, align 4
  %47 = load i8, i8* %46, align 1
  %tobool90 = icmp ne i8 %47, 0
  br i1 %tobool90, label %if.then91, label %if.else96

if.then91:                                        ; preds = %if.else89
  %48 = load i8*, i8** %value.addr, align 4
  %call92 = call i32 @strlen(i8* %48)
  %add93 = add i32 1, %call92
  %call94 = call i8* @sh_xmalloc(i32 %add93, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2643)
  %49 = load i8*, i8** %value.addr, align 4
  %call95 = call i8* @strcpy(i8* %call94, i8* %49)
  store i8* %call95, i8** %retval1, align 4
  br label %if.end99

if.else96:                                        ; preds = %if.else89
  %call97 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2646)
  store i8* %call97, i8** %retval1, align 4
  %50 = load i8*, i8** %retval1, align 4
  %arrayidx98 = getelementptr inbounds i8, i8* %50, i32 0
  store i8 0, i8* %arrayidx98, align 1
  br label %if.end99

if.end99:                                         ; preds = %if.else96, %if.then91
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.end88
  %51 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes101 = getelementptr inbounds %struct.variable, %struct.variable* %51, i32 0, i32 5
  %52 = load i32, i32* %attributes101, align 4
  %and102 = and i32 %52, 1024
  %tobool103 = icmp ne i32 %and102, 0
  br i1 %tobool103, label %cond.true104, label %cond.false105

cond.true104:                                     ; preds = %if.end100
  br label %cond.end110

cond.false105:                                    ; preds = %if.end100
  %53 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes106 = getelementptr inbounds %struct.variable, %struct.variable* %53, i32 0, i32 5
  %54 = load i32, i32* %attributes106, align 4
  %and107 = and i32 %54, 256
  %tobool108 = icmp ne i32 %and107, 0
  %cond109 = select i1 %tobool108, i32 2, i32 1
  br label %cond.end110

cond.end110:                                      ; preds = %cond.false105, %cond.true104
  %cond111 = phi i32 [ 4, %cond.true104 ], [ %cond109, %cond.false105 ]
  store i32 %cond111, i32* %op, align 4
  %55 = load i8*, i8** %retval1, align 4
  %56 = load i32, i32* %op, align 4
  %call112 = call i8* @sh_modcase(i8* %55, i8* null, i32 %56)
  store i8* %call112, i8** %oval, align 4
  %57 = load i8*, i8** %retval1, align 4
  call void @sh_xfree(i8* %57, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2652)
  %58 = load i8*, i8** %oval, align 4
  store i8* %58, i8** %retval1, align 4
  br label %if.end200

if.else113:                                       ; preds = %lor.lhs.false23
  %59 = load i8*, i8** %value.addr, align 4
  %tobool114 = icmp ne i8* %59, null
  br i1 %tobool114, label %if.then115, label %if.else198

if.then115:                                       ; preds = %if.else113
  %60 = load i32, i32* %flags.addr, align 4
  %and116 = and i32 %60, 1
  %tobool117 = icmp ne i32 %and116, 0
  br i1 %tobool117, label %if.then118, label %if.else186

if.then118:                                       ; preds = %if.then115
  %61 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %call119 = call i8* @get_variable_value(%struct.variable* %61)
  store i8* %call119, i8** %oval, align 4
  %62 = load i8*, i8** %oval, align 4
  %cmp120 = icmp eq i8* %62, null
  br i1 %cmp120, label %if.then122, label %if.end123

if.then122:                                       ; preds = %if.then118
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.57, i32 0, i32 0), i8** %oval, align 4
  br label %if.end123

if.end123:                                        ; preds = %if.then122, %if.then118
  %63 = load i8*, i8** %oval, align 4
  %tobool124 = icmp ne i8* %63, null
  br i1 %tobool124, label %land.lhs.true125, label %cond.false145

land.lhs.true125:                                 ; preds = %if.end123
  %64 = load i8*, i8** %oval, align 4
  %arrayidx126 = getelementptr inbounds i8, i8* %64, i32 0
  %65 = load i8, i8* %arrayidx126, align 1
  %conv127 = sext i8 %65 to i32
  %tobool128 = icmp ne i32 %conv127, 0
  br i1 %tobool128, label %cond.true129, label %cond.false145

cond.true129:                                     ; preds = %land.lhs.true125
  %66 = load i8*, i8** %oval, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %66, i32 1
  %67 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %67 to i32
  %tobool132 = icmp ne i32 %conv131, 0
  br i1 %tobool132, label %cond.true133, label %cond.false142

cond.true133:                                     ; preds = %cond.true129
  %68 = load i8*, i8** %oval, align 4
  %arrayidx134 = getelementptr inbounds i8, i8* %68, i32 2
  %69 = load i8, i8* %arrayidx134, align 1
  %conv135 = sext i8 %69 to i32
  %tobool136 = icmp ne i32 %conv135, 0
  br i1 %tobool136, label %cond.true137, label %cond.false139

cond.true137:                                     ; preds = %cond.true133
  %70 = load i8*, i8** %oval, align 4
  %call138 = call i32 @strlen(i8* %70)
  br label %cond.end140

cond.false139:                                    ; preds = %cond.true133
  br label %cond.end140

cond.end140:                                      ; preds = %cond.false139, %cond.true137
  %cond141 = phi i32 [ %call138, %cond.true137 ], [ 2, %cond.false139 ]
  br label %cond.end143

cond.false142:                                    ; preds = %cond.true129
  br label %cond.end143

cond.end143:                                      ; preds = %cond.false142, %cond.end140
  %cond144 = phi i32 [ %cond141, %cond.end140 ], [ 1, %cond.false142 ]
  br label %cond.end146

cond.false145:                                    ; preds = %land.lhs.true125, %if.end123
  br label %cond.end146

cond.end146:                                      ; preds = %cond.false145, %cond.end143
  %cond147 = phi i32 [ %cond144, %cond.end143 ], [ 0, %cond.false145 ]
  store i32 %cond147, i32* %olen, align 4
  %71 = load i32, i32* %olen, align 4
  %72 = load i8*, i8** %value.addr, align 4
  %tobool148 = icmp ne i8* %72, null
  br i1 %tobool148, label %cond.true149, label %cond.false174

cond.true149:                                     ; preds = %cond.end146
  %73 = load i8*, i8** %value.addr, align 4
  %tobool150 = icmp ne i8* %73, null
  br i1 %tobool150, label %land.lhs.true151, label %cond.false171

land.lhs.true151:                                 ; preds = %cond.true149
  %74 = load i8*, i8** %value.addr, align 4
  %arrayidx152 = getelementptr inbounds i8, i8* %74, i32 0
  %75 = load i8, i8* %arrayidx152, align 1
  %conv153 = sext i8 %75 to i32
  %tobool154 = icmp ne i32 %conv153, 0
  br i1 %tobool154, label %cond.true155, label %cond.false171

cond.true155:                                     ; preds = %land.lhs.true151
  %76 = load i8*, i8** %value.addr, align 4
  %arrayidx156 = getelementptr inbounds i8, i8* %76, i32 1
  %77 = load i8, i8* %arrayidx156, align 1
  %conv157 = sext i8 %77 to i32
  %tobool158 = icmp ne i32 %conv157, 0
  br i1 %tobool158, label %cond.true159, label %cond.false168

cond.true159:                                     ; preds = %cond.true155
  %78 = load i8*, i8** %value.addr, align 4
  %arrayidx160 = getelementptr inbounds i8, i8* %78, i32 2
  %79 = load i8, i8* %arrayidx160, align 1
  %conv161 = sext i8 %79 to i32
  %tobool162 = icmp ne i32 %conv161, 0
  br i1 %tobool162, label %cond.true163, label %cond.false165

cond.true163:                                     ; preds = %cond.true159
  %80 = load i8*, i8** %value.addr, align 4
  %call164 = call i32 @strlen(i8* %80)
  br label %cond.end166

cond.false165:                                    ; preds = %cond.true159
  br label %cond.end166

cond.end166:                                      ; preds = %cond.false165, %cond.true163
  %cond167 = phi i32 [ %call164, %cond.true163 ], [ 2, %cond.false165 ]
  br label %cond.end169

cond.false168:                                    ; preds = %cond.true155
  br label %cond.end169

cond.end169:                                      ; preds = %cond.false168, %cond.end166
  %cond170 = phi i32 [ %cond167, %cond.end166 ], [ 1, %cond.false168 ]
  br label %cond.end172

cond.false171:                                    ; preds = %land.lhs.true151, %cond.true149
  br label %cond.end172

cond.end172:                                      ; preds = %cond.false171, %cond.end169
  %cond173 = phi i32 [ %cond170, %cond.end169 ], [ 0, %cond.false171 ]
  br label %cond.end175

cond.false174:                                    ; preds = %cond.end146
  br label %cond.end175

cond.end175:                                      ; preds = %cond.false174, %cond.end172
  %cond176 = phi i32 [ %cond173, %cond.end172 ], [ 0, %cond.false174 ]
  %add177 = add i32 %71, %cond176
  %add178 = add i32 %add177, 1
  %call179 = call i8* @sh_xmalloc(i32 %add178, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2664)
  store i8* %call179, i8** %retval1, align 4
  %81 = load i8*, i8** %retval1, align 4
  %82 = load i8*, i8** %oval, align 4
  %call180 = call i8* @strcpy(i8* %81, i8* %82)
  %83 = load i8*, i8** %value.addr, align 4
  %tobool181 = icmp ne i8* %83, null
  br i1 %tobool181, label %if.then182, label %if.end185

if.then182:                                       ; preds = %cond.end175
  %84 = load i8*, i8** %retval1, align 4
  %85 = load i32, i32* %olen, align 4
  %add.ptr183 = getelementptr inbounds i8, i8* %84, i32 %85
  %86 = load i8*, i8** %value.addr, align 4
  %call184 = call i8* @strcpy(i8* %add.ptr183, i8* %86)
  br label %if.end185

if.end185:                                        ; preds = %if.then182, %cond.end175
  br label %if.end197

if.else186:                                       ; preds = %if.then115
  %87 = load i8*, i8** %value.addr, align 4
  %88 = load i8, i8* %87, align 1
  %tobool187 = icmp ne i8 %88, 0
  br i1 %tobool187, label %if.then188, label %if.else193

if.then188:                                       ; preds = %if.else186
  %89 = load i8*, i8** %value.addr, align 4
  %call189 = call i32 @strlen(i8* %89)
  %add190 = add i32 1, %call189
  %call191 = call i8* @sh_xmalloc(i32 %add190, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2670)
  %90 = load i8*, i8** %value.addr, align 4
  %call192 = call i8* @strcpy(i8* %call191, i8* %90)
  store i8* %call192, i8** %retval1, align 4
  br label %if.end196

if.else193:                                       ; preds = %if.else186
  %call194 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2673)
  store i8* %call194, i8** %retval1, align 4
  %91 = load i8*, i8** %retval1, align 4
  %arrayidx195 = getelementptr inbounds i8, i8* %91, i32 0
  store i8 0, i8* %arrayidx195, align 1
  br label %if.end196

if.end196:                                        ; preds = %if.else193, %if.then188
  br label %if.end197

if.end197:                                        ; preds = %if.end196, %if.end185
  br label %if.end199

if.else198:                                       ; preds = %if.else113
  store i8* null, i8** %retval1, align 4
  br label %if.end199

if.end199:                                        ; preds = %if.else198, %if.end197
  br label %if.end200

if.end200:                                        ; preds = %if.end199, %cond.end110
  br label %if.end201

if.end201:                                        ; preds = %if.end200, %if.end15
  %92 = load i8*, i8** %retval1, align 4
  ret i8* %92
}

declare i64 @evalexp(i8*, i32*) #1

declare void @top_level_cleanup() #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #3

declare i8* @itos(i64) #1

declare i8* @sh_modcase(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @bind_tempenv_variable(i8* %name, i8* %value) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %call = call %struct.variable* @hash_lookup(i8* %1, %struct.hash_table* %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call, %cond.true ], [ null, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %var, align 4
  %3 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool1 = icmp ne %struct.variable* %3, null
  br i1 %tobool1, label %if.then, label %if.end17

if.then:                                          ; preds = %cond.end
  br label %do.body

do.body:                                          ; preds = %if.then
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value2, align 4
  %tobool3 = icmp ne i8* %5, null
  br i1 %tobool3, label %if.then4, label %if.end

if.then4:                                         ; preds = %do.body
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value5, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4017)
  br label %if.end

if.end:                                           ; preds = %if.then4, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %8 = load i8*, i8** %value.addr, align 4
  %call6 = call i32 @strlen(i8* %8)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4018)
  %9 = load i8*, i8** %value.addr, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %9)
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %value9 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 1
  store i8* %call8, i8** %value9, align 4
  br label %do.body10

do.body10:                                        ; preds = %do.end
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 2
  %12 = load i8*, i8** %exportstr, align 4
  %tobool11 = icmp ne i8* %12, null
  br i1 %tobool11, label %if.then12, label %if.end15

if.then12:                                        ; preds = %do.body10
  %13 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr13 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 2
  %14 = load i8*, i8** %exportstr13, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4019)
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr14 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 2
  store i8* null, i8** %exportstr14, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then12, %do.body10
  br label %do.end16

do.end16:                                         ; preds = %if.end15
  br label %if.end17

if.end17:                                         ; preds = %do.end16, %cond.end
  %16 = load %struct.variable*, %struct.variable** %var, align 4
  ret %struct.variable* %16
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @find_variable_nameref_context(%struct.variable* %v, %struct.var_context* %vc, %struct.var_context** %nvcp) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %v.addr = alloca %struct.variable*, align 4
  %vc.addr = alloca %struct.var_context*, align 4
  %nvcp.addr = alloca %struct.var_context**, align 4
  %nv = alloca %struct.variable*, align 4
  %nv2 = alloca %struct.variable*, align 4
  %nvc = alloca %struct.var_context*, align 4
  store %struct.variable* %v, %struct.variable** %v.addr, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  store %struct.var_context** %nvcp, %struct.var_context*** %nvcp.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %v.addr, align 4
  store %struct.variable* %0, %struct.variable** %nv, align 4
  %1 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  store %struct.var_context* %1, %struct.var_context** %nvc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %tobool = icmp ne %struct.var_context* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.variable*, %struct.variable** %nv, align 4
  %4 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %call = call %struct.variable* @find_nameref_at_context(%struct.variable* %3, %struct.var_context* %4)
  store %struct.variable* %call, %struct.variable** %nv2, align 4
  %5 = load %struct.variable*, %struct.variable** %nv2, align 4
  %cmp = icmp eq %struct.variable* %5, @nameref_maxloop_value
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load %struct.variable*, %struct.variable** %nv2, align 4
  store %struct.variable* %6, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  %7 = load %struct.variable*, %struct.variable** %nv2, align 4
  %cmp1 = icmp eq %struct.variable* %7, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %for.inc

if.end3:                                          ; preds = %if.end
  %8 = load %struct.variable*, %struct.variable** %nv2, align 4
  store %struct.variable* %8, %struct.variable** %nv, align 4
  %9 = load %struct.var_context**, %struct.var_context*** %nvcp.addr, align 4
  %10 = load %struct.var_context*, %struct.var_context** %9, align 4
  %tobool4 = icmp ne %struct.var_context* %10, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  %11 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %12 = load %struct.var_context**, %struct.var_context*** %nvcp.addr, align 4
  store %struct.var_context* %11, %struct.var_context** %12, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end3
  %13 = load %struct.variable*, %struct.variable** %nv, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 5
  %14 = load i32, i32* %attributes, align 4
  %and = and i32 %14, 2048
  %cmp7 = icmp eq i32 %and, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  br label %for.end

if.end9:                                          ; preds = %if.end6
  br label %for.inc

for.inc:                                          ; preds = %if.end9, %if.then2
  %15 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %15, i32 0, i32 4
  %16 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %16, %struct.var_context** %nvc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then8, %for.cond
  %17 = load %struct.variable*, %struct.variable** %nv, align 4
  %attributes10 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes10, align 4
  %and11 = and i32 %18, 2048
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %19 = load %struct.variable*, %struct.variable** %nv, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ null, %cond.true ], [ %19, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %20 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %20
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @find_variable_last_nameref_context(%struct.variable* %v, %struct.var_context* %vc, %struct.var_context** %nvcp) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %v.addr = alloca %struct.variable*, align 4
  %vc.addr = alloca %struct.var_context*, align 4
  %nvcp.addr = alloca %struct.var_context**, align 4
  %nv = alloca %struct.variable*, align 4
  %nv2 = alloca %struct.variable*, align 4
  %nvc = alloca %struct.var_context*, align 4
  store %struct.variable* %v, %struct.variable** %v.addr, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  store %struct.var_context** %nvcp, %struct.var_context*** %nvcp.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %v.addr, align 4
  store %struct.variable* %0, %struct.variable** %nv, align 4
  %1 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  store %struct.var_context* %1, %struct.var_context** %nvc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %tobool = icmp ne %struct.var_context* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.variable*, %struct.variable** %nv, align 4
  %4 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %call = call %struct.variable* @find_nameref_at_context(%struct.variable* %3, %struct.var_context* %4)
  store %struct.variable* %call, %struct.variable** %nv2, align 4
  %5 = load %struct.variable*, %struct.variable** %nv2, align 4
  %cmp = icmp eq %struct.variable* %5, @nameref_maxloop_value
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load %struct.variable*, %struct.variable** %nv2, align 4
  store %struct.variable* %6, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  %7 = load %struct.variable*, %struct.variable** %nv2, align 4
  %cmp1 = icmp eq %struct.variable* %7, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %for.inc

if.end3:                                          ; preds = %if.end
  %8 = load %struct.variable*, %struct.variable** %nv2, align 4
  store %struct.variable* %8, %struct.variable** %nv, align 4
  %9 = load %struct.var_context**, %struct.var_context*** %nvcp.addr, align 4
  %10 = load %struct.var_context*, %struct.var_context** %9, align 4
  %tobool4 = icmp ne %struct.var_context* %10, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  %11 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %12 = load %struct.var_context**, %struct.var_context*** %nvcp.addr, align 4
  store %struct.var_context* %11, %struct.var_context** %12, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end3
  br label %for.inc

for.inc:                                          ; preds = %if.end6, %if.then2
  %13 = load %struct.var_context*, %struct.var_context** %nvc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %13, i32 0, i32 4
  %14 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %14, %struct.var_context** %nvc, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load %struct.variable*, %struct.variable** %nv, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes, align 4
  %and = and i32 %16, 2048
  %tobool7 = icmp ne i32 %and, 0
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %17 = load %struct.variable*, %struct.variable** %nv, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %17, %cond.true ], [ null, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %18 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %18
}

declare i32 @valid_array_reference(i8*, i32) #1

declare %struct.variable* @assign_array_element(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @bind_global_variable(i8* %name, i8* %value, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  %nv = alloca %struct.variable*, align 4
  %vc = alloca %struct.var_context*, align 4
  %nvc = alloca %struct.var_context*, align 4
  %level = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %cmp = icmp eq %struct.var_context* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @create_variable_tables()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i8*, i8** %value.addr, align 4
  %3 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 5
  %4 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %5 = load i32, i32* %flags.addr, align 4
  %call = call %struct.variable* @bind_variable_internal(i8* %1, i8* %2, %struct.hash_table* %4, i32 0, i32 %5)
  ret %struct.variable* %call
}

; Function Attrs: noinline nounwind
define %struct.variable* @bind_variable_value(%struct.variable* %var, i8* %value, i32 %aflags) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %var.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %aflags.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  %invis = alloca i32, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %aflags, i32* %aflags.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 4096
  store i32 %and, i32* %invis, align 4
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %3, -4097
  store i32 %and2, i32* %attributes1, align 4
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 4
  %5 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  %tobool = icmp ne %struct.variable* (%struct.variable*, i8*, i64, i8*)* %5, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %aflags.addr, align 4
  %and3 = and i32 %6, 1
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %8 = load i8*, i8** %value.addr, align 4
  %9 = load i32, i32* %aflags.addr, align 4
  %call = call i8* @make_variable_value(%struct.variable* %7, i8* %8, i32 %9)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %10 = load i8*, i8** %value.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %10, %cond.false ]
  store i8* %cond, i8** %t, align 4
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %assign_func5 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 4
  %12 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func5, align 4
  %13 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %14 = load i8*, i8** %t, align 4
  %call6 = call %struct.variable* %12(%struct.variable* %13, i8* %14, i64 -1, i8* null)
  %15 = load i8*, i8** %t, align 4
  %16 = load i8*, i8** %value.addr, align 4
  %cmp = icmp ne i8* %15, %16
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %cond.end
  %17 = load i8*, i8** %t, align 4
  %tobool7 = icmp ne i8* %17, null
  br i1 %tobool7, label %if.then8, label %if.end

if.then8:                                         ; preds = %land.lhs.true
  %18 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2948)
  br label %if.end

if.end:                                           ; preds = %if.then8, %land.lhs.true, %cond.end
  br label %if.end47

if.else:                                          ; preds = %entry
  %19 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %20 = load i8*, i8** %value.addr, align 4
  %21 = load i32, i32* %aflags.addr, align 4
  %call9 = call i8* @make_variable_value(%struct.variable* %19, i8* %20, i32 %21)
  store i8* %call9, i8** %t, align 4
  %22 = load i32, i32* %aflags.addr, align 4
  %and10 = and i32 %22, 48
  %cmp11 = icmp eq i32 %and10, 16
  br i1 %cmp11, label %land.lhs.true12, label %if.end28

land.lhs.true12:                                  ; preds = %if.else
  %23 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 0
  %24 = load i8*, i8** %name, align 4
  %25 = load i8*, i8** %t, align 4
  %call13 = call i32 @check_selfref(i8* %24, i8* %25, i32 0)
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then15, label %if.end28

if.then15:                                        ; preds = %land.lhs.true12
  %26 = load i32, i32* @variable_context, align 4
  %tobool16 = icmp ne i32 %26, 0
  br i1 %tobool16, label %if.then17, label %if.else20

if.then17:                                        ; preds = %if.then15
  %call18 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.55, i32 0, i32 0))
  %27 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name19 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 0
  %28 = load i8*, i8** %name19, align 4
  call void (i8*, ...) @internal_warning(i8* %call18, i8* %28)
  br label %if.end27

if.else20:                                        ; preds = %if.then15
  %call21 = call i8* @libintl_gettext(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.61, i32 0, i32 0))
  %29 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name22 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 0
  %30 = load i8*, i8** %name22, align 4
  call void (i8*, ...) @internal_error(i8* %call21, i8* %30)
  %31 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2960)
  %32 = load i32, i32* %invis, align 4
  %tobool23 = icmp ne i32 %32, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.else20
  %33 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes25 = getelementptr inbounds %struct.variable, %struct.variable* %33, i32 0, i32 5
  %34 = load i32, i32* %attributes25, align 4
  %or = or i32 %34, 4096
  store i32 %or, i32* %attributes25, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.else20
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end27:                                         ; preds = %if.then17
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %land.lhs.true12, %if.else
  %35 = load i32, i32* %aflags.addr, align 4
  %and29 = and i32 %35, 16
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %land.lhs.true31, label %if.end40

land.lhs.true31:                                  ; preds = %if.end28
  %36 = load i8*, i8** %t, align 4
  %call32 = call i32 @valid_nameref_value(i8* %36, i32 0)
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then34, label %if.end40

if.then34:                                        ; preds = %land.lhs.true31
  %37 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2968)
  %38 = load i32, i32* %invis, align 4
  %tobool35 = icmp ne i32 %38, 0
  br i1 %tobool35, label %if.then36, label %if.end39

if.then36:                                        ; preds = %if.then34
  %39 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes37 = getelementptr inbounds %struct.variable, %struct.variable* %39, i32 0, i32 5
  %40 = load i32, i32* %attributes37, align 4
  %or38 = or i32 %40, 4096
  store i32 %or38, i32* %attributes37, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then36, %if.then34
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end40:                                         ; preds = %land.lhs.true31, %if.end28
  br label %do.body

do.body:                                          ; preds = %if.end40
  %41 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value41 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 1
  %42 = load i8*, i8** %value41, align 4
  %tobool42 = icmp ne i8* %42, null
  br i1 %tobool42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %do.body
  %43 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value44 = getelementptr inbounds %struct.variable, %struct.variable* %43, i32 0, i32 1
  %44 = load i8*, i8** %value44, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2973)
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end45
  %45 = load i8*, i8** %t, align 4
  %46 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value46 = getelementptr inbounds %struct.variable, %struct.variable* %46, i32 0, i32 1
  store i8* %45, i8** %value46, align 4
  br label %if.end47

if.end47:                                         ; preds = %do.end, %if.end
  br label %do.body48

do.body48:                                        ; preds = %if.end47
  %47 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %47, i32 0, i32 2
  %48 = load i8*, i8** %exportstr, align 4
  %tobool49 = icmp ne i8* %48, null
  br i1 %tobool49, label %if.then50, label %if.end53

if.then50:                                        ; preds = %do.body48
  %49 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr51 = getelementptr inbounds %struct.variable, %struct.variable* %49, i32 0, i32 2
  %50 = load i8*, i8** %exportstr51, align 4
  call void @sh_xfree(i8* %50, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2977)
  %51 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr52 = getelementptr inbounds %struct.variable, %struct.variable* %51, i32 0, i32 2
  store i8* null, i8** %exportstr52, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then50, %do.body48
  br label %do.end54

do.end54:                                         ; preds = %if.end53
  %52 = load i32, i32* @mark_modified_vars, align 4
  %tobool55 = icmp ne i32 %52, 0
  br i1 %tobool55, label %if.then56, label %if.end59

if.then56:                                        ; preds = %do.end54
  %53 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes57 = getelementptr inbounds %struct.variable, %struct.variable* %53, i32 0, i32 5
  %54 = load i32, i32* %attributes57, align 4
  %or58 = or i32 %54, 1
  store i32 %or58, i32* %attributes57, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then56, %do.end54
  %55 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes60 = getelementptr inbounds %struct.variable, %struct.variable* %55, i32 0, i32 5
  %56 = load i32, i32* %attributes60, align 4
  %and61 = and i32 %56, 1
  %tobool62 = icmp ne i32 %and61, 0
  br i1 %tobool62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end59
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %if.end59
  %57 = load %struct.variable*, %struct.variable** %var.addr, align 4
  store %struct.variable* %57, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end64, %if.end39, %if.end26
  %58 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %58
}

declare i32 @check_selfref(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @bind_int_variable(i8* %lhs, i8* %rhs) #0 {
entry:
  %lhs.addr = alloca i8*, align 4
  %rhs.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %isint = alloca i32, align 4
  %isarr = alloca i32, align 4
  %implicitarray = alloca i32, align 4
  store i8* %lhs, i8** %lhs.addr, align 4
  store i8* %rhs, i8** %rhs.addr, align 4
  store i32 0, i32* %implicitarray, align 4
  store i32 0, i32* %isarr, align 4
  store i32 0, i32* %isint, align 4
  %0 = load i8*, i8** %lhs.addr, align 4
  %call = call i32 @valid_array_reference(i8* %0, i32 0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %isarr, align 4
  %1 = load i8*, i8** %lhs.addr, align 4
  %call1 = call %struct.variable* @array_variable_part(i8* %1, i8** null, i32* null)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %lhs.addr, align 4
  %call2 = call %struct.variable* @find_variable(i8* %2)
  store %struct.variable* %call2, %struct.variable** %v, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool3 = icmp ne %struct.variable* %3, null
  br i1 %tobool3, label %if.then4, label %if.end12

if.then4:                                         ; preds = %if.end
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, 16
  store i32 %and, i32* %isint, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes5 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes5, align 4
  %and6 = and i32 %7, -17
  store i32 %and6, i32* %attributes5, align 4
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 5
  %9 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %9, 4
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %if.then4
  %10 = load i32, i32* %isarr, align 4
  %cmp = icmp eq i32 %10, 0
  br i1 %cmp, label %if.then10, label %if.end11

if.then10:                                        ; preds = %land.lhs.true
  store i32 1, i32* %implicitarray, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %land.lhs.true, %if.then4
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end
  %11 = load i32, i32* %isarr, align 4
  %tobool13 = icmp ne i32 %11, 0
  br i1 %tobool13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.end12
  %12 = load i8*, i8** %lhs.addr, align 4
  %13 = load i8*, i8** %rhs.addr, align 4
  %call15 = call %struct.variable* @assign_array_element(i8* %12, i8* %13, i32 0)
  store %struct.variable* %call15, %struct.variable** %v, align 4
  br label %if.end23

if.else16:                                        ; preds = %if.end12
  %14 = load i32, i32* %implicitarray, align 4
  %tobool17 = icmp ne i32 %14, 0
  br i1 %tobool17, label %if.then18, label %if.else20

if.then18:                                        ; preds = %if.else16
  %15 = load i8*, i8** %lhs.addr, align 4
  %16 = load i8*, i8** %rhs.addr, align 4
  %call19 = call %struct.variable* @bind_array_variable(i8* %15, i64 0, i8* %16, i32 0)
  store %struct.variable* %call19, %struct.variable** %v, align 4
  br label %if.end22

if.else20:                                        ; preds = %if.else16
  %17 = load i8*, i8** %lhs.addr, align 4
  %18 = load i8*, i8** %rhs.addr, align 4
  %call21 = call %struct.variable* @bind_variable(i8* %17, i8* %18, i32 0)
  store %struct.variable* %call21, %struct.variable** %v, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then18
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then14
  %19 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool24 = icmp ne %struct.variable* %19, null
  br i1 %tobool24, label %if.then25, label %if.end32

if.then25:                                        ; preds = %if.end23
  %20 = load i32, i32* %isint, align 4
  %tobool26 = icmp ne i32 %20, 0
  br i1 %tobool26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.then25
  %21 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes28 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 5
  %22 = load i32, i32* %attributes28, align 4
  %or = or i32 %22, 16
  store i32 %or, i32* %attributes28, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.then25
  %23 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes30 = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 5
  %24 = load i32, i32* %attributes30, align 4
  %and31 = and i32 %24, -4097
  store i32 %and31, i32* %attributes30, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.end29, %if.end23
  %25 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool33 = icmp ne %struct.variable* %25, null
  br i1 %tobool33, label %land.lhs.true34, label %if.end40

land.lhs.true34:                                  ; preds = %if.end32
  %26 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes35 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes35, align 4
  %and36 = and i32 %27, 2048
  %tobool37 = icmp ne i32 %and36, 0
  br i1 %tobool37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %land.lhs.true34
  %call39 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.62, i32 0, i32 0))
  %28 = load i8*, i8** %lhs.addr, align 4
  call void (i8*, ...) @internal_warning(i8* %call39, i8* %28)
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %land.lhs.true34, %if.end32
  %29 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %29
}

declare %struct.variable* @array_variable_part(i8*, i8**, i32*) #1

declare %struct.variable* @bind_array_variable(i8*, i64, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @bind_var_to_int(i8* %var, i64 %val) #0 {
entry:
  %var.addr = alloca i8*, align 4
  %val.addr = alloca i64, align 8
  %ibuf = alloca [22 x i8], align 1
  %p = alloca i8*, align 4
  store i8* %var, i8** %var.addr, align 4
  store i64 %val, i64* %val.addr, align 8
  %0 = load i64, i64* %val.addr, align 8
  %conv = trunc i64 %0 to i32
  %arraydecay = getelementptr inbounds [22 x i8], [22 x i8]* %ibuf, i32 0, i32 0
  %call = call i8* @fmtulong(i32 %conv, i32 10, i8* %arraydecay, i32 22, i32 0)
  store i8* %call, i8** %p, align 4
  %1 = load i8*, i8** %var.addr, align 4
  %2 = load i8*, i8** %p, align 4
  %call1 = call %struct.variable* @bind_int_variable(i8* %1, i8* %2)
  ret %struct.variable* %call1
}

declare i8* @fmtulong(i32, i32, i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @bind_function(i8* %name, %struct.command* %value) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca %struct.command*, align 4
  %entry1 = alloca %struct.variable*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.command* %value, %struct.command** %value.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_function(i8* %0)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %1 = load %struct.variable*, %struct.variable** %entry1, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call2 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3073)
  %3 = load i8*, i8** %name.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %3)
  %4 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %call5 = call %struct.bucket_contents* @hash_insert(i8* %call4, %struct.hash_table* %4, i32 1)
  store %struct.bucket_contents* %call5, %struct.bucket_contents** %elt, align 4
  %5 = load i8*, i8** %name.addr, align 4
  %call6 = call %struct.variable* @new_shell_variable(i8* %5)
  store %struct.variable* %call6, %struct.variable** %entry1, align 4
  %6 = load %struct.variable*, %struct.variable** %entry1, align 4
  %7 = bitcast %struct.variable* %6 to i8*
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %8, i32 0, i32 2
  store i8* %7, i8** %data, align 4
  br label %if.end10

if.else:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.else
  %9 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 2
  %10 = load i8*, i8** %exportstr, align 4
  %tobool = icmp ne i8* %10, null
  br i1 %tobool, label %if.then7, label %if.end

if.then7:                                         ; preds = %do.body
  %11 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr8 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 2
  %12 = load i8*, i8** %exportstr8, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3078)
  %13 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr9 = getelementptr inbounds %struct.variable, %struct.variable* %13, i32 0, i32 2
  store i8* null, i8** %exportstr9, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end10

if.end10:                                         ; preds = %do.end, %if.then
  %14 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value11 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 1
  %15 = load i8*, i8** %value11, align 4
  %cmp12 = icmp ne i8* %15, null
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %16 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value14 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 1
  %17 = load i8*, i8** %value14, align 4
  %18 = bitcast i8* %17 to %struct.command*
  call void @dispose_command(%struct.command* %18)
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %19 = load %struct.command*, %struct.command** %value.addr, align 4
  %tobool16 = icmp ne %struct.command* %19, null
  br i1 %tobool16, label %if.then17, label %if.else20

if.then17:                                        ; preds = %if.end15
  %20 = load %struct.command*, %struct.command** %value.addr, align 4
  %call18 = call %struct.command* @copy_command(%struct.command* %20)
  %21 = bitcast %struct.command* %call18 to i8*
  %22 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value19 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 1
  store i8* %21, i8** %value19, align 4
  br label %if.end22

if.else20:                                        ; preds = %if.end15
  %23 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value21 = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 1
  store i8* null, i8** %value21, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %24 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes, align 4
  %or = or i32 %25, 8
  store i32 %or, i32* %attributes, align 4
  %26 = load i32, i32* @mark_modified_vars, align 4
  %tobool23 = icmp ne i32 %26, 0
  br i1 %tobool23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.end22
  %27 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes25 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 5
  %28 = load i32, i32* %attributes25, align 4
  %or26 = or i32 %28, 1
  store i32 %or26, i32* %attributes25, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %if.end22
  %29 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes28 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 5
  %30 = load i32, i32* %attributes28, align 4
  %and = and i32 %30, -4097
  store i32 %and, i32* %attributes28, align 4
  %31 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes29 = getelementptr inbounds %struct.variable, %struct.variable* %31, i32 0, i32 5
  %32 = load i32, i32* %attributes29, align 4
  %and30 = and i32 %32, 1
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end27
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end27
  call void @set_itemlist_dirty(%struct._list_of_items* @it_functions)
  %33 = load %struct.variable*, %struct.variable** %entry1, align 4
  ret %struct.variable* %33
}

declare %struct.bucket_contents* @hash_insert(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @new_shell_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %entry1 = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %call = call i8* @sh_xmalloc(i32 28, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2477)
  %0 = bitcast i8* %call to %struct.variable*
  store %struct.variable* %0, %struct.variable** %entry1, align 4
  %1 = load i8*, i8** %name.addr, align 4
  %call2 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 2479)
  %2 = load i8*, i8** %name.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %2)
  %3 = load %struct.variable*, %struct.variable** %entry1, align 4
  %name5 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 0
  store i8* %call4, i8** %name5, align 4
  %4 = load %struct.variable*, %struct.variable** %entry1, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  store i8* null, i8** %value, align 4
  %5 = load %struct.variable*, %struct.variable** %entry1, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 2
  store i8* null, i8** %exportstr, align 4
  %6 = load %struct.variable*, %struct.variable** %entry1, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* null, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %7 = load %struct.variable*, %struct.variable** %entry1, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* null, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  %8 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 5
  store i32 0, i32* %attributes, align 4
  %9 = load %struct.variable*, %struct.variable** %entry1, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 6
  store i32 0, i32* %context, align 4
  %10 = load %struct.variable*, %struct.variable** %entry1, align 4
  ret %struct.variable* %10
}

declare void @dispose_command(%struct.command*) #1

declare %struct.command* @copy_command(%struct.command*) #1

declare void @set_itemlist_dirty(%struct._list_of_items*) #1

; Function Attrs: noinline nounwind
define void @bind_function_def(i8* %name, %struct.function_def* %value) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca %struct.function_def*, align 4
  %entry1 = alloca %struct.function_def*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  %cmd = alloca %struct.command*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.function_def* %value, %struct.function_def** %value.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.function_def* @find_function_def(i8* %0)
  store %struct.function_def* %call, %struct.function_def** %entry1, align 4
  %1 = load %struct.function_def*, %struct.function_def** %entry1, align 4
  %tobool = icmp ne %struct.function_def* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.function_def*, %struct.function_def** %entry1, align 4
  call void @dispose_function_def_contents(%struct.function_def* %2)
  %3 = load %struct.function_def*, %struct.function_def** %value.addr, align 4
  %4 = load %struct.function_def*, %struct.function_def** %entry1, align 4
  %call2 = call %struct.function_def* @copy_function_def_contents(%struct.function_def* %3, %struct.function_def* %4)
  store %struct.function_def* %call2, %struct.function_def** %entry1, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load %struct.function_def*, %struct.function_def** %value.addr, align 4
  %command = getelementptr inbounds %struct.function_def, %struct.function_def* %5, i32 0, i32 3
  %6 = load %struct.command*, %struct.command** %command, align 4
  store %struct.command* %6, %struct.command** %cmd, align 4
  %7 = load %struct.function_def*, %struct.function_def** %value.addr, align 4
  %command3 = getelementptr inbounds %struct.function_def, %struct.function_def* %7, i32 0, i32 3
  store %struct.command* null, %struct.command** %command3, align 4
  %8 = load %struct.function_def*, %struct.function_def** %value.addr, align 4
  %call4 = call %struct.function_def* @copy_function_def(%struct.function_def* %8)
  store %struct.function_def* %call4, %struct.function_def** %entry1, align 4
  %9 = load %struct.command*, %struct.command** %cmd, align 4
  %10 = load %struct.function_def*, %struct.function_def** %value.addr, align 4
  %command5 = getelementptr inbounds %struct.function_def, %struct.function_def* %10, i32 0, i32 3
  store %struct.command* %9, %struct.command** %command5, align 4
  %11 = load i8*, i8** %name.addr, align 4
  %call6 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3130)
  %12 = load i8*, i8** %name.addr, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %12)
  %13 = load %struct.hash_table*, %struct.hash_table** @shell_function_defs, align 4
  %call9 = call %struct.bucket_contents* @hash_insert(i8* %call8, %struct.hash_table* %13, i32 1)
  store %struct.bucket_contents* %call9, %struct.bucket_contents** %elt, align 4
  %14 = load %struct.function_def*, %struct.function_def** %entry1, align 4
  %15 = bitcast %struct.function_def* %14 to i8**
  %16 = bitcast i8** %15 to i8*
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %17, i32 0, i32 2
  store i8* %16, i8** %data, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare void @dispose_function_def_contents(%struct.function_def*) #1

declare %struct.function_def* @copy_function_def_contents(%struct.function_def*, %struct.function_def*) #1

declare %struct.function_def* @copy_function_def(%struct.function_def*) #1

; Function Attrs: noinline nounwind
define i32 @assign_in_env(%struct.word_desc* %word, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %word.addr = alloca %struct.word_desc*, align 4
  %flags.addr = alloca i32, align 4
  %offset = alloca i32, align 4
  %aflags = alloca i32, align 4
  %name = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %value = alloca i8*, align 4
  %newname = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %string = alloca i8*, align 4
  store %struct.word_desc* %word, %struct.word_desc** %word.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 0
  %1 = load i8*, i8** %word1, align 4
  store i8* %1, i8** %string, align 4
  store i32 0, i32* %aflags, align 4
  %2 = load i8*, i8** %string, align 4
  %call = call i32 @assignment(i8* %2, i32 0)
  store i32 %call, i32* %offset, align 4
  %3 = load i8*, i8** %string, align 4
  %call2 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3154)
  %4 = load i8*, i8** %string, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %4)
  store i8* %call4, i8** %name, align 4
  store i8* %call4, i8** %newname, align 4
  store i8* null, i8** %value, align 4
  %5 = load i8*, i8** %name, align 4
  %6 = load i32, i32* %offset, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, 61
  br i1 %cmp, label %if.then, label %if.end62

if.then:                                          ; preds = %entry
  %8 = load i8*, i8** %name, align 4
  %9 = load i32, i32* %offset, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx6, align 1
  %10 = load i8*, i8** %name, align 4
  %11 = load i32, i32* %offset, align 4
  %sub = sub nsw i32 %11, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i32 %sub
  %12 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %12 to i32
  %cmp9 = icmp eq i32 %conv8, 43
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.then
  %13 = load i8*, i8** %name, align 4
  %14 = load i32, i32* %offset, align 4
  %sub12 = sub nsw i32 %14, 1
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i32 %sub12
  store i8 0, i8* %arrayidx13, align 1
  %15 = load i32, i32* %aflags, align 4
  %or = or i32 %15, 1
  store i32 %or, i32* %aflags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then11, %if.then
  %16 = load i8*, i8** %name, align 4
  %call14 = call %struct.variable* @find_variable(i8* %16)
  store %struct.variable* %call14, %struct.variable** %var, align 4
  %17 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp15 = icmp eq %struct.variable* %17, null
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.end
  %18 = load i8*, i8** %name, align 4
  %call18 = call %struct.variable* @find_variable_last_nameref(i8* %18, i32 1)
  store %struct.variable* %call18, %struct.variable** %var, align 4
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %19, null
  br i1 %tobool, label %land.lhs.true, label %if.end26

land.lhs.true:                                    ; preds = %if.then17
  %20 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes, align 4
  %and = and i32 %21, 2048
  %tobool19 = icmp ne i32 %and, 0
  br i1 %tobool19, label %land.lhs.true20, label %if.end26

land.lhs.true20:                                  ; preds = %land.lhs.true
  %22 = load %struct.variable*, %struct.variable** %var, align 4
  %value21 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 1
  %23 = load i8*, i8** %value21, align 4
  %call22 = call i32 @valid_nameref_value(i8* %23, i32 1)
  %tobool23 = icmp ne i32 %call22, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %land.lhs.true20
  %24 = load %struct.variable*, %struct.variable** %var, align 4
  %value25 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 1
  %25 = load i8*, i8** %value25, align 4
  store i8* %25, i8** %newname, align 4
  store %struct.variable* null, %struct.variable** %var, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %land.lhs.true20, %land.lhs.true, %if.then17
  br label %if.end28

if.else:                                          ; preds = %if.end
  %26 = load %struct.variable*, %struct.variable** %var, align 4
  %name27 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 0
  %27 = load i8*, i8** %name27, align 4
  store i8* %27, i8** %newname, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.end26
  %28 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool29 = icmp ne %struct.variable* %28, null
  br i1 %tobool29, label %land.lhs.true30, label %if.end43

land.lhs.true30:                                  ; preds = %if.end28
  %29 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes31 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 5
  %30 = load i32, i32* %attributes31, align 4
  %and32 = and i32 %30, 2
  %tobool33 = icmp ne i32 %and32, 0
  br i1 %tobool33, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true30
  %31 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes34 = getelementptr inbounds %struct.variable, %struct.variable* %31, i32 0, i32 5
  %32 = load i32, i32* %attributes34, align 4
  %and35 = and i32 %32, 16384
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %if.then37, label %if.end43

if.then37:                                        ; preds = %lor.lhs.false, %land.lhs.true30
  %33 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes38 = getelementptr inbounds %struct.variable, %struct.variable* %33, i32 0, i32 5
  %34 = load i32, i32* %attributes38, align 4
  %and39 = and i32 %34, 2
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.then37
  %35 = load i8*, i8** %name, align 4
  call void @err_readonly(i8* %35)
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.then37
  %36 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %36, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3190)
  store i32 0, i32* %retval, align 4
  br label %return

if.end43:                                         ; preds = %lor.lhs.false, %if.end28
  %37 = load i8*, i8** %name, align 4
  %38 = load i32, i32* %offset, align 4
  %add.ptr = getelementptr inbounds i8, i8* %37, i32 %38
  %add.ptr44 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  store i8* %add.ptr44, i8** %temp, align 4
  %39 = load i8*, i8** %temp, align 4
  %call45 = call i8* @expand_assignment_string_to_string(i8* %39, i32 0)
  store i8* %call45, i8** %value, align 4
  %40 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool46 = icmp ne %struct.variable* %40, null
  br i1 %tobool46, label %land.lhs.true47, label %if.end61

land.lhs.true47:                                  ; preds = %if.end43
  %41 = load i32, i32* %aflags, align 4
  %and48 = and i32 %41, 1
  %tobool49 = icmp ne i32 %and48, 0
  br i1 %tobool49, label %if.then50, label %if.end61

if.then50:                                        ; preds = %land.lhs.true47
  %42 = load i8*, i8** %value, align 4
  %cmp51 = icmp eq i8* %42, null
  br i1 %cmp51, label %if.then53, label %if.end56

if.then53:                                        ; preds = %if.then50
  %call54 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3201)
  store i8* %call54, i8** %value, align 4
  %43 = load i8*, i8** %value, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %43, i32 0
  store i8 0, i8* %arrayidx55, align 1
  br label %if.end56

if.end56:                                         ; preds = %if.then53, %if.then50
  %44 = load %struct.variable*, %struct.variable** %var, align 4
  %45 = load i8*, i8** %value, align 4
  %46 = load i32, i32* %aflags, align 4
  %call57 = call i8* @make_variable_value(%struct.variable* %44, i8* %45, i32 %46)
  store i8* %call57, i8** %temp, align 4
  br label %do.body

do.body:                                          ; preds = %if.end56
  %47 = load i8*, i8** %value, align 4
  %tobool58 = icmp ne i8* %47, null
  br i1 %tobool58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %do.body
  %48 = load i8*, i8** %value, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3205)
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end60
  %49 = load i8*, i8** %temp, align 4
  store i8* %49, i8** %value, align 4
  br label %if.end61

if.end61:                                         ; preds = %do.end, %land.lhs.true47, %if.end43
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %entry
  %50 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %cmp63 = icmp eq %struct.hash_table* %50, null
  br i1 %cmp63, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.end62
  %call66 = call %struct.hash_table* @hash_create(i32 4)
  store %struct.hash_table* %call66, %struct.hash_table** @temporary_env, align 4
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.end62
  %51 = load i8*, i8** %newname, align 4
  %52 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %call68 = call %struct.variable* @hash_lookup(i8* %51, %struct.hash_table* %52)
  store %struct.variable* %call68, %struct.variable** %var, align 4
  %53 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp69 = icmp eq %struct.variable* %53, null
  br i1 %cmp69, label %if.then71, label %if.else73

if.then71:                                        ; preds = %if.end67
  %54 = load i8*, i8** %newname, align 4
  %55 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %call72 = call %struct.variable* @make_new_variable(i8* %54, %struct.hash_table* %55)
  store %struct.variable* %call72, %struct.variable** %var, align 4
  br label %if.end81

if.else73:                                        ; preds = %if.end67
  br label %do.body74

do.body74:                                        ; preds = %if.else73
  %56 = load %struct.variable*, %struct.variable** %var, align 4
  %value75 = getelementptr inbounds %struct.variable, %struct.variable* %56, i32 0, i32 1
  %57 = load i8*, i8** %value75, align 4
  %tobool76 = icmp ne i8* %57, null
  br i1 %tobool76, label %if.then77, label %if.end79

if.then77:                                        ; preds = %do.body74
  %58 = load %struct.variable*, %struct.variable** %var, align 4
  %value78 = getelementptr inbounds %struct.variable, %struct.variable* %58, i32 0, i32 1
  %59 = load i8*, i8** %value78, align 4
  call void @sh_xfree(i8* %59, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3217)
  br label %if.end79

if.end79:                                         ; preds = %if.then77, %do.body74
  br label %do.end80

do.end80:                                         ; preds = %if.end79
  br label %if.end81

if.end81:                                         ; preds = %do.end80, %if.then71
  %60 = load i8*, i8** %value, align 4
  %cmp82 = icmp eq i8* %60, null
  br i1 %cmp82, label %if.then84, label %if.end87

if.then84:                                        ; preds = %if.end81
  %call85 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3221)
  store i8* %call85, i8** %value, align 4
  %61 = load i8*, i8** %value, align 4
  %arrayidx86 = getelementptr inbounds i8, i8* %61, i32 0
  store i8 0, i8* %arrayidx86, align 1
  br label %if.end87

if.end87:                                         ; preds = %if.then84, %if.end81
  %62 = load i8*, i8** %value, align 4
  %63 = load %struct.variable*, %struct.variable** %var, align 4
  %value88 = getelementptr inbounds %struct.variable, %struct.variable* %63, i32 0, i32 1
  store i8* %62, i8** %value88, align 4
  %64 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes89 = getelementptr inbounds %struct.variable, %struct.variable* %64, i32 0, i32 5
  %65 = load i32, i32* %attributes89, align 4
  %or90 = or i32 %65, 1048577
  store i32 %or90, i32* %attributes89, align 4
  %66 = load i32, i32* @variable_context, align 4
  %67 = load %struct.variable*, %struct.variable** %var, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %67, i32 0, i32 6
  store i32 %66, i32* %context, align 4
  br label %do.body91

do.body91:                                        ; preds = %if.end87
  %68 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %68, i32 0, i32 2
  %69 = load i8*, i8** %exportstr, align 4
  %tobool92 = icmp ne i8* %69, null
  br i1 %tobool92, label %if.then93, label %if.end96

if.then93:                                        ; preds = %do.body91
  %70 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr94 = getelementptr inbounds %struct.variable, %struct.variable* %70, i32 0, i32 2
  %71 = load i8*, i8** %exportstr94, align 4
  call void @sh_xfree(i8* %71, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3229)
  %72 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr95 = getelementptr inbounds %struct.variable, %struct.variable* %72, i32 0, i32 2
  store i8* null, i8** %exportstr95, align 4
  br label %if.end96

if.end96:                                         ; preds = %if.then93, %do.body91
  br label %do.end97

do.end97:                                         ; preds = %if.end96
  %73 = load i8*, i8** %newname, align 4
  %74 = load i8*, i8** %value, align 4
  %call98 = call i8* @mk_env_string(i8* %73, i8* %74, i32 0)
  %75 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr99 = getelementptr inbounds %struct.variable, %struct.variable* %75, i32 0, i32 2
  store i8* %call98, i8** %exportstr99, align 4
  store i32 1, i32* @array_needs_making, align 4
  %76 = load i32, i32* %flags.addr, align 4
  %tobool100 = icmp ne i32 %76, 0
  br i1 %tobool100, label %if.then101, label %if.end102

if.then101:                                       ; preds = %do.end97
  %77 = load i8*, i8** %newname, align 4
  call void @stupidly_hack_special_variables(i8* %77)
  br label %if.end102

if.end102:                                        ; preds = %if.then101, %do.end97
  %78 = load i32, i32* @echo_command_at_execute, align 4
  %tobool103 = icmp ne i32 %78, 0
  br i1 %tobool103, label %if.then104, label %if.end105

if.then104:                                       ; preds = %if.end102
  %79 = load i8*, i8** %name, align 4
  %80 = load i8*, i8** %value, align 4
  call void @xtrace_print_assignment(i8* %79, i8* %80, i32 0, i32 1)
  br label %if.end105

if.end105:                                        ; preds = %if.then104, %if.end102
  %81 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %81, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3242)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end105, %if.end42
  %82 = load i32, i32* %retval, align 4
  ret i32 %82
}

declare i32 @assignment(i8*, i32) #1

declare void @err_readonly(i8*) #1

declare i8* @expand_assignment_string_to_string(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @mk_env_string(i8* %name, i8* %value, i32 %isfunc) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %isfunc.addr = alloca i32, align 4
  %name_len = alloca i32, align 4
  %value_len = alloca i32, align 4
  %p = alloca i8*, align 4
  %q = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %isfunc, i32* %isfunc.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %name_len, align 4
  %1 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %cond.false14

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %value.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false14

cond.true:                                        ; preds = %land.lhs.true
  %4 = load i8*, i8** %value.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %5 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %cond.true5, label %cond.false11

cond.true5:                                       ; preds = %cond.true
  %6 = load i8*, i8** %value.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i32 2
  %7 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %7 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false

cond.true9:                                       ; preds = %cond.true5
  %8 = load i8*, i8** %value.addr, align 4
  %call10 = call i32 @strlen(i8* %8)
  br label %cond.end

cond.false:                                       ; preds = %cond.true5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true9
  %cond = phi i32 [ %call10, %cond.true9 ], [ 2, %cond.false ]
  br label %cond.end12

cond.false11:                                     ; preds = %cond.true
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.end
  %cond13 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false11 ]
  br label %cond.end15

cond.false14:                                     ; preds = %land.lhs.true, %entry
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.end12
  %cond16 = phi i32 [ %cond13, %cond.end12 ], [ 0, %cond.false14 ]
  store i32 %cond16, i32* %value_len, align 4
  %9 = load i32, i32* %isfunc.addr, align 4
  %tobool17 = icmp ne i32 %9, 0
  br i1 %tobool17, label %land.lhs.true18, label %if.else

land.lhs.true18:                                  ; preds = %cond.end15
  %10 = load i8*, i8** %value.addr, align 4
  %tobool19 = icmp ne i8* %10, null
  br i1 %tobool19, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true18
  %11 = load i32, i32* %name_len, align 4
  %add = add i32 10, %11
  %add20 = add i32 %add, 2
  %12 = load i32, i32* %value_len, align 4
  %add21 = add i32 %add20, %12
  %add22 = add i32 %add21, 2
  %call23 = call i8* @sh_xmalloc(i32 %add22, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4182)
  store i8* %call23, i8** %p, align 4
  %13 = load i8*, i8** %p, align 4
  store i8* %13, i8** %q, align 4
  %14 = load i8*, i8** %q, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 10, i32 1, i1 false)
  %15 = load i8*, i8** %q, align 4
  %add.ptr = getelementptr inbounds i8, i8* %15, i32 10
  store i8* %add.ptr, i8** %q, align 4
  %16 = load i8*, i8** %q, align 4
  %17 = load i8*, i8** %name.addr, align 4
  %18 = load i32, i32* %name_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %16, i8* %17, i32 %18, i32 1, i1 false)
  %19 = load i32, i32* %name_len, align 4
  %20 = load i8*, i8** %q, align 4
  %add.ptr24 = getelementptr inbounds i8, i8* %20, i32 %19
  store i8* %add.ptr24, i8** %q, align 4
  %21 = load i8*, i8** %q, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 2, i32 1, i1 false)
  %22 = load i8*, i8** %q, align 4
  %add.ptr25 = getelementptr inbounds i8, i8* %22, i32 2
  store i8* %add.ptr25, i8** %q, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true18, %cond.end15
  %23 = load i32, i32* %name_len, align 4
  %add26 = add i32 2, %23
  %24 = load i32, i32* %value_len, align 4
  %add27 = add i32 %add26, %24
  %call28 = call i8* @sh_xmalloc(i32 %add27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4193)
  store i8* %call28, i8** %p, align 4
  %25 = load i8*, i8** %p, align 4
  %26 = load i8*, i8** %name.addr, align 4
  %27 = load i32, i32* %name_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %25, i8* %26, i32 %27, i32 1, i1 false)
  %28 = load i8*, i8** %p, align 4
  %29 = load i32, i32* %name_len, align 4
  %add.ptr29 = getelementptr inbounds i8, i8* %28, i32 %29
  store i8* %add.ptr29, i8** %q, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %30 = load i8*, i8** %q, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %30, i32 0
  store i8 61, i8* %arrayidx30, align 1
  %31 = load i8*, i8** %value.addr, align 4
  %tobool31 = icmp ne i8* %31, null
  br i1 %tobool31, label %land.lhs.true32, label %if.else38

land.lhs.true32:                                  ; preds = %if.end
  %32 = load i8*, i8** %value.addr, align 4
  %33 = load i8, i8* %32, align 1
  %conv33 = sext i8 %33 to i32
  %tobool34 = icmp ne i32 %conv33, 0
  br i1 %tobool34, label %if.then35, label %if.else38

if.then35:                                        ; preds = %land.lhs.true32
  %34 = load i8*, i8** %q, align 4
  %add.ptr36 = getelementptr inbounds i8, i8* %34, i32 1
  %35 = load i8*, i8** %value.addr, align 4
  %36 = load i32, i32* %value_len, align 4
  %add37 = add i32 %36, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr36, i8* %35, i32 %add37, i32 1, i1 false)
  br label %if.end40

if.else38:                                        ; preds = %land.lhs.true32, %if.end
  %37 = load i8*, i8** %q, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %37, i32 1
  store i8 0, i8* %arrayidx39, align 1
  br label %if.end40

if.end40:                                         ; preds = %if.else38, %if.then35
  %38 = load i8*, i8** %p, align 4
  ret i8* %38
}

; Function Attrs: noinline nounwind
define void @stupidly_hack_special_variables(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i32, i32* @stupidly_hack_special_variables.sv_sorted, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @qsort(i8* bitcast ([37 x %struct.name_and_function]* @special_vars to i8*), i32 36, i32 8, i32 (i8*, i8*)* bitcast (i32 (%struct.name_and_function*, %struct.name_and_function*)* @sv_compare to i32 (i8*, i8*)*))
  store i32 1, i32* @stupidly_hack_special_variables.sv_sorted, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call i32 @find_special_var(i8* %1)
  store i32 %call, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %cmp1 = icmp ne i32 %2, -1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [37 x %struct.name_and_function], [37 x %struct.name_and_function]* @special_vars, i32 0, i32 %3
  %function = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %arrayidx, i32 0, i32 1
  %4 = load void (i8*)*, void (i8*)** %function, align 4
  %5 = load i8*, i8** %name.addr, align 4
  call void %4(i8* %5)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  ret void
}

declare void @xtrace_print_assignment(i8*, i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define void @dispose_variable(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 131072
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @dispose_variable_value(%struct.variable* %3)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  br label %do.body

do.body:                                          ; preds = %if.end3
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 2
  %5 = load i8*, i8** %exportstr, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then4, label %if.end6

if.then4:                                         ; preds = %do.body
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %exportstr5 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 2
  %7 = load i8*, i8** %exportstr5, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3328)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end6
  %8 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 0
  %9 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3330)
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %11, 1
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %do.end
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %do.end
  %12 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %13 = bitcast %struct.variable* %12 to i8*
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3335)
  br label %return

return:                                           ; preds = %if.end11, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i32 @unbind_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %nv = alloca %struct.variable*, align 4
  %r = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call = call %struct.variable* @var_lookup(i8* %0, %struct.var_context* %1)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and = and i32 %4, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %call2 = call %struct.variable* @find_variable_nameref(%struct.variable* %5)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call2, %cond.true ], [ null, %cond.false ]
  store %struct.variable* %cond, %struct.variable** %nv, align 4
  %6 = load %struct.variable*, %struct.variable** %nv, align 4
  %tobool3 = icmp ne %struct.variable* %6, null
  br i1 %tobool3, label %cond.true4, label %cond.false7

cond.true4:                                       ; preds = %cond.end
  %7 = load %struct.variable*, %struct.variable** %nv, align 4
  %name5 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 0
  %8 = load i8*, i8** %name5, align 4
  %9 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call6 = call i32 @makunbound(i8* %8, %struct.var_context* %9)
  br label %cond.end9

cond.false7:                                      ; preds = %cond.end
  %10 = load i8*, i8** %name.addr, align 4
  %11 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call8 = call i32 @makunbound(i8* %10, %struct.var_context* %11)
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false7, %cond.true4
  %cond10 = phi i32 [ %call6, %cond.true4 ], [ %call8, %cond.false7 ]
  store i32 %cond10, i32* %r, align 4
  %12 = load i32, i32* %r, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind
define i32 @makunbound(i8* %name, %struct.var_context* %vc) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %vc.addr = alloca %struct.var_context*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  %new_elt = alloca %struct.bucket_contents*, align 4
  %old_var = alloca %struct.variable*, align 4
  %v = alloca %struct.var_context*, align 4
  %t = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  store %struct.bucket_contents* null, %struct.bucket_contents** %elt, align 4
  %0 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  store %struct.var_context* %0, %struct.var_context** %v, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %v, align 4
  %tobool = icmp ne %struct.var_context* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load %struct.var_context*, %struct.var_context** %v, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 5
  %4 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %2, %struct.hash_table* %4, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %elt, align 4
  %tobool1 = icmp ne %struct.bucket_contents* %call, null
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load %struct.var_context*, %struct.var_context** %v, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %5, i32 0, i32 4
  %6 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %6, %struct.var_context** %v, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %cmp = icmp eq %struct.bucket_contents* %7, null
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %for.end
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %8, i32 0, i32 2
  %9 = load i8*, i8** %data, align 4
  %10 = bitcast i8* %9 to %struct.variable*
  store %struct.variable* %10, %struct.variable** %old_var, align 4
  %11 = load %struct.variable*, %struct.variable** %old_var, align 4
  %tobool4 = icmp ne %struct.variable* %11, null
  br i1 %tobool4, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end3
  %12 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes, align 4
  %and = and i32 %13, 1
  %tobool5 = icmp ne i32 %and, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true
  %14 = load i32, i32* @array_needs_making, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @array_needs_making, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %land.lhs.true, %if.end3
  %15 = load %struct.variable*, %struct.variable** %old_var, align 4
  %tobool8 = icmp ne %struct.variable* %15, null
  br i1 %tobool8, label %land.lhs.true9, label %if.end80

land.lhs.true9:                                   ; preds = %if.end7
  %16 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes10 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 5
  %17 = load i32, i32* %attributes10, align 4
  %and11 = and i32 %17, 32
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.end80

land.lhs.true13:                                  ; preds = %land.lhs.true9
  %18 = load i32, i32* @variable_context, align 4
  %19 = load %struct.variable*, %struct.variable** %old_var, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 6
  %20 = load i32, i32* %context, align 4
  %cmp14 = icmp eq i32 %18, %20
  br i1 %cmp14, label %if.then15, label %if.end80

if.then15:                                        ; preds = %land.lhs.true13
  %21 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes16 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 5
  %22 = load i32, i32* %attributes16, align 4
  %and17 = and i32 %22, 131072
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.then15
  %23 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 1
  store i8* null, i8** %value, align 4
  br label %if.end52

if.else:                                          ; preds = %if.then15
  %24 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes20 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes20, align 4
  %and21 = and i32 %25, 4
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.else25

if.then23:                                        ; preds = %if.else
  %26 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value24 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 1
  %27 = load i8*, i8** %value24, align 4
  %28 = bitcast i8* %27 to %struct.array*
  call void @array_dispose(%struct.array* %28)
  br label %if.end51

if.else25:                                        ; preds = %if.else
  %29 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes26 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 5
  %30 = load i32, i32* %attributes26, align 4
  %and27 = and i32 %30, 64
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.else31

if.then29:                                        ; preds = %if.else25
  %31 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value30 = getelementptr inbounds %struct.variable, %struct.variable* %31, i32 0, i32 1
  %32 = load i8*, i8** %value30, align 4
  %33 = bitcast i8* %32 to %struct.hash_table*
  call void @assoc_dispose(%struct.hash_table* %33)
  br label %if.end50

if.else31:                                        ; preds = %if.else25
  %34 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes32 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 5
  %35 = load i32, i32* %attributes32, align 4
  %and33 = and i32 %35, 2048
  %tobool34 = icmp ne i32 %and33, 0
  br i1 %tobool34, label %if.then35, label %if.else41

if.then35:                                        ; preds = %if.else31
  br label %do.body

do.body:                                          ; preds = %if.then35
  %36 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value36 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 1
  %37 = load i8*, i8** %value36, align 4
  %tobool37 = icmp ne i8* %37, null
  br i1 %tobool37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %do.body
  %38 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value39 = getelementptr inbounds %struct.variable, %struct.variable* %38, i32 0, i32 1
  %39 = load i8*, i8** %value39, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3517)
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end40
  br label %if.end49

if.else41:                                        ; preds = %if.else31
  br label %do.body42

do.body42:                                        ; preds = %if.else41
  %40 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value43 = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 1
  %41 = load i8*, i8** %value43, align 4
  %tobool44 = icmp ne i8* %41, null
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %do.body42
  %42 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value46 = getelementptr inbounds %struct.variable, %struct.variable* %42, i32 0, i32 1
  %43 = load i8*, i8** %value46, align 4
  call void @sh_xfree(i8* %43, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3519)
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %do.body42
  br label %do.end48

do.end48:                                         ; preds = %if.end47
  br label %if.end49

if.end49:                                         ; preds = %do.end48, %do.end
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then29
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then23
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then19
  %44 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes53 = getelementptr inbounds %struct.variable, %struct.variable* %44, i32 0, i32 5
  %45 = load i32, i32* %attributes53, align 4
  %and54 = and i32 %45, 1
  %tobool55 = icmp ne i32 %and54, 0
  br i1 %tobool55, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end52
  %46 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes56 = getelementptr inbounds %struct.variable, %struct.variable* %46, i32 0, i32 5
  %47 = load i32, i32* %attributes56, align 4
  %and57 = and i32 %47, 1048576
  %tobool58 = icmp ne i32 %and57, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end52
  %48 = phi i1 [ false, %if.end52 ], [ %tobool58, %land.rhs ]
  %cond = select i1 %48, i32 1, i32 0
  %49 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes59 = getelementptr inbounds %struct.variable, %struct.variable* %49, i32 0, i32 5
  store i32 %cond, i32* %attributes59, align 4
  %50 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes60 = getelementptr inbounds %struct.variable, %struct.variable* %50, i32 0, i32 5
  %51 = load i32, i32* %attributes60, align 4
  %or = or i32 %51, 32
  store i32 %or, i32* %attributes60, align 4
  %52 = load %struct.variable*, %struct.variable** %old_var, align 4
  %attributes61 = getelementptr inbounds %struct.variable, %struct.variable* %52, i32 0, i32 5
  %53 = load i32, i32* %attributes61, align 4
  %or62 = or i32 %53, 4096
  store i32 %or62, i32* %attributes61, align 4
  %54 = load %struct.variable*, %struct.variable** %old_var, align 4
  %value63 = getelementptr inbounds %struct.variable, %struct.variable* %54, i32 0, i32 1
  store i8* null, i8** %value63, align 4
  br label %do.body64

do.body64:                                        ; preds = %land.end
  %55 = load %struct.variable*, %struct.variable** %old_var, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %55, i32 0, i32 2
  %56 = load i8*, i8** %exportstr, align 4
  %tobool65 = icmp ne i8* %56, null
  br i1 %tobool65, label %if.then66, label %if.end69

if.then66:                                        ; preds = %do.body64
  %57 = load %struct.variable*, %struct.variable** %old_var, align 4
  %exportstr67 = getelementptr inbounds %struct.variable, %struct.variable* %57, i32 0, i32 2
  %58 = load i8*, i8** %exportstr67, align 4
  call void @sh_xfree(i8* %58, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3527)
  %59 = load %struct.variable*, %struct.variable** %old_var, align 4
  %exportstr68 = getelementptr inbounds %struct.variable, %struct.variable* %59, i32 0, i32 2
  store i8* null, i8** %exportstr68, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.then66, %do.body64
  br label %do.end70

do.end70:                                         ; preds = %if.end69
  %60 = load %struct.variable*, %struct.variable** %old_var, align 4
  %name71 = getelementptr inbounds %struct.variable, %struct.variable* %60, i32 0, i32 0
  %61 = load i8*, i8** %name71, align 4
  %call72 = call i32 @strlen(i8* %61)
  %add = add i32 1, %call72
  %call73 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3529)
  %62 = load %struct.variable*, %struct.variable** %old_var, align 4
  %name74 = getelementptr inbounds %struct.variable, %struct.variable* %62, i32 0, i32 0
  %63 = load i8*, i8** %name74, align 4
  %call75 = call i8* @strcpy(i8* %call73, i8* %63)
  %64 = load %struct.var_context*, %struct.var_context** %v, align 4
  %table76 = getelementptr inbounds %struct.var_context, %struct.var_context* %64, i32 0, i32 5
  %65 = load %struct.hash_table*, %struct.hash_table** %table76, align 4
  %call77 = call %struct.bucket_contents* @hash_insert(i8* %call75, %struct.hash_table* %65, i32 0)
  store %struct.bucket_contents* %call77, %struct.bucket_contents** %new_elt, align 4
  %66 = load %struct.variable*, %struct.variable** %old_var, align 4
  %67 = bitcast %struct.variable* %66 to i8*
  %68 = load %struct.bucket_contents*, %struct.bucket_contents** %new_elt, align 4
  %data78 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %68, i32 0, i32 2
  store i8* %67, i8** %data78, align 4
  %69 = load %struct.variable*, %struct.variable** %old_var, align 4
  %name79 = getelementptr inbounds %struct.variable, %struct.variable* %69, i32 0, i32 0
  %70 = load i8*, i8** %name79, align 4
  call void @stupidly_hack_special_variables(i8* %70)
  %71 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %71, i32 0, i32 1
  %72 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %72, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3533)
  %73 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %74 = bitcast %struct.bucket_contents* %73 to i8*
  call void @sh_xfree(i8* %74, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3534)
  store i32 0, i32* %retval, align 4
  br label %return

if.end80:                                         ; preds = %land.lhs.true13, %land.lhs.true9, %if.end7
  %75 = load i8*, i8** %name.addr, align 4
  %call81 = call i32 @strlen(i8* %75)
  %add82 = add i32 1, %call81
  %call83 = call i8* @sh_xmalloc(i32 %add82, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3541)
  %76 = load i8*, i8** %name.addr, align 4
  %call84 = call i8* @strcpy(i8* %call83, i8* %76)
  store i8* %call84, i8** %t, align 4
  %77 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %key85 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %77, i32 0, i32 1
  %78 = load i8*, i8** %key85, align 4
  call void @sh_xfree(i8* %78, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3543)
  %79 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %80 = bitcast %struct.bucket_contents* %79 to i8*
  call void @sh_xfree(i8* %80, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3544)
  %81 = load %struct.variable*, %struct.variable** %old_var, align 4
  call void @dispose_variable(%struct.variable* %81)
  %82 = load i8*, i8** %t, align 4
  call void @stupidly_hack_special_variables(i8* %82)
  %83 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %83, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3548)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end80, %do.end70, %if.then2
  %84 = load i32, i32* %retval, align 4
  ret i32 %84
}

; Function Attrs: noinline nounwind
define i32 @unbind_nameref(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call = call %struct.variable* @var_lookup(i8* %0, %struct.var_context* %1)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 5
  %4 = load i32, i32* %attributes, align 4
  %and = and i32 %4, 2048
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** %name.addr, align 4
  %6 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call2 = call i32 @makunbound(i8* %5, %struct.var_context* %6)
  store i32 %call2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define i32 @unbind_variable_noref(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call = call %struct.variable* @var_lookup(i8* %0, %struct.var_context* %1)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call1 = call i32 @makunbound(i8* %3, %struct.var_context* %4)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @check_unbind_variable(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.63, i32 0, i32 0))
  %4 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @internal_error(i8* %call2, i8* %4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.64, i32 0, i32 0))
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %5 = load i8*, i8** %name.addr, align 4
  %call3 = call i32 @unbind_variable(i8* %5)
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @unbind_func(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  %func = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %0, %struct.hash_table* %1, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %elt, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %cmp = icmp eq %struct.bucket_contents* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @set_itemlist_dirty(%struct._list_of_items* @it_functions)
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %3, i32 0, i32 2
  %4 = load i8*, i8** %data, align 4
  %5 = bitcast i8* %4 to %struct.variable*
  store %struct.variable* %5, %struct.variable** %func, align 4
  %6 = load %struct.variable*, %struct.variable** %func, align 4
  %tobool = icmp ne %struct.variable* %6, null
  br i1 %tobool, label %if.then1, label %if.end5

if.then1:                                         ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %func, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 1
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.then1
  %9 = load i32, i32* @array_needs_making, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* @array_needs_making, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.then1
  %10 = load %struct.variable*, %struct.variable** %func, align 4
  call void @dispose_variable(%struct.variable* %10)
  br label %if.end5

if.end5:                                          ; preds = %if.end4, %if.end
  %11 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %11, i32 0, i32 1
  %12 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3420)
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %14 = bitcast %struct.bucket_contents* %13 to i8*
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3421)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare %struct.bucket_contents* @hash_remove(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define i32 @unbind_function_def(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  %funcdef = alloca %struct.function_def*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** @shell_function_defs, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %0, %struct.hash_table* %1, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %elt, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %cmp = icmp eq %struct.bucket_contents* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %3, i32 0, i32 2
  %4 = load i8*, i8** %data, align 4
  %5 = bitcast i8* %4 to %struct.function_def*
  store %struct.function_def* %5, %struct.function_def** %funcdef, align 4
  %6 = load %struct.function_def*, %struct.function_def** %funcdef, align 4
  %tobool = icmp ne %struct.function_def* %6, null
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %7 = load %struct.function_def*, %struct.function_def** %funcdef, align 4
  call void @dispose_function_def(%struct.function_def* %7)
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %8, i32 0, i32 1
  %9 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3443)
  %10 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %11 = bitcast %struct.bucket_contents* %10 to i8*
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3444)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare void @dispose_function_def(%struct.function_def*) #1

; Function Attrs: noinline nounwind
define i32 @delete_var(i8* %name, %struct.var_context* %vc) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %vc.addr = alloca %struct.var_context*, align 4
  %elt = alloca %struct.bucket_contents*, align 4
  %old_var = alloca %struct.variable*, align 4
  %v = alloca %struct.var_context*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  store %struct.bucket_contents* null, %struct.bucket_contents** %elt, align 4
  %0 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  store %struct.var_context* %0, %struct.var_context** %v, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %v, align 4
  %tobool = icmp ne %struct.var_context* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load %struct.var_context*, %struct.var_context** %v, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 5
  %4 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %2, %struct.hash_table* %4, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %elt, align 4
  %tobool1 = icmp ne %struct.bucket_contents* %call, null
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load %struct.var_context*, %struct.var_context** %v, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %5, i32 0, i32 4
  %6 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %6, %struct.var_context** %v, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %cmp = icmp eq %struct.bucket_contents* %7, null
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %for.end
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %8, i32 0, i32 2
  %9 = load i8*, i8** %data, align 4
  %10 = bitcast i8* %9 to %struct.variable*
  store %struct.variable* %10, %struct.variable** %old_var, align 4
  %11 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %11, i32 0, i32 1
  %12 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3467)
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %elt, align 4
  %14 = bitcast %struct.bucket_contents* %13 to i8*
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3468)
  %15 = load %struct.variable*, %struct.variable** %old_var, align 4
  call void @dispose_variable(%struct.variable* %15)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then2
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

declare void @array_dispose(%struct.array*) #1

declare void @assoc_dispose(%struct.hash_table*) #1

; Function Attrs: noinline nounwind
define void @kill_all_local_variables() #0 {
entry:
  %vc = alloca %struct.var_context*, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %0, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool = icmp ne %struct.var_context* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 2
  %3 = load i32, i32* %flags, align 4
  %and = and i32 %3, 4
  %cmp = icmp ne i32 %and, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %4 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %scope = getelementptr inbounds %struct.var_context, %struct.var_context* %4, i32 0, i32 1
  %5 = load i32, i32* %scope, align 4
  %6 = load i32, i32* @variable_context, align 4
  %cmp1 = icmp eq i32 %5, %6
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %for.end

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %7, i32 0, i32 4
  %8 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %8, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %9 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %cmp2 = icmp eq %struct.var_context* %9, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.end
  br label %return

if.end4:                                          ; preds = %for.end
  %10 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %10, i32 0, i32 5
  %11 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %tobool5 = icmp ne %struct.hash_table* %11, null
  br i1 %tobool5, label %land.lhs.true6, label %if.end13

land.lhs.true6:                                   ; preds = %if.end4
  %12 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags7 = getelementptr inbounds %struct.var_context, %struct.var_context* %12, i32 0, i32 2
  %13 = load i32, i32* %flags7, align 4
  %and8 = and i32 %13, 1
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %land.lhs.true6
  %14 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table11 = getelementptr inbounds %struct.var_context, %struct.var_context* %14, i32 0, i32 5
  %15 = load %struct.hash_table*, %struct.hash_table** %table11, align 4
  call void @delete_all_variables(%struct.hash_table* %15)
  %16 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table12 = getelementptr inbounds %struct.var_context, %struct.var_context* %16, i32 0, i32 5
  %17 = load %struct.hash_table*, %struct.hash_table** %table12, align 4
  call void @hash_dispose(%struct.hash_table* %17)
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %land.lhs.true6, %if.end4
  %18 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table14 = getelementptr inbounds %struct.var_context, %struct.var_context* %18, i32 0, i32 5
  store %struct.hash_table* null, %struct.hash_table** %table14, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then3
  ret void
}

; Function Attrs: noinline nounwind
define void @delete_all_variables(%struct.hash_table* %hashed_vars) #0 {
entry:
  %hashed_vars.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %hashed_vars, %struct.hash_table** %hashed_vars.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %hashed_vars.addr, align 4
  call void @hash_flush(%struct.hash_table* %0, void (i8*)* @free_variable_hash_data)
  ret void
}

declare void @hash_dispose(%struct.hash_table*) #1

declare void @hash_flush(%struct.hash_table*, void (i8*)*) #1

; Function Attrs: noinline nounwind
define internal void @free_variable_hash_data(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.variable*
  store %struct.variable* %1, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable(%struct.variable* %2)
  ret void
}

; Function Attrs: noinline nounwind
define void @set_var_read_only(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %entry1 = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %entry1, align 4
  %1 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %if.end6, label %if.then

if.then:                                          ; preds = %do.body
  %2 = load i8*, i8** %name.addr, align 4
  %call2 = call %struct.variable* @bind_variable(i8* %2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.57, i32 0, i32 0), i32 0)
  store %struct.variable* %call2, %struct.variable** %entry1, align 4
  %3 = load i32, i32* @no_invisible_vars, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then
  %4 = load %struct.variable*, %struct.variable** %entry1, align 4
  %tobool4 = icmp ne %struct.variable* %4, null
  br i1 %tobool4, label %if.then5, label %if.end

if.then5:                                         ; preds = %land.lhs.true
  %5 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes, align 4
  %or = or i32 %6, 4096
  store i32 %or, i32* %attributes, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %land.lhs.true, %if.then
  br label %if.end6

if.end6:                                          ; preds = %if.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end6
  %7 = load %struct.variable*, %struct.variable** %entry1, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes7, align 4
  %or8 = or i32 %8, 2
  store i32 %or8, i32* %attributes7, align 4
  ret void
}

; Function Attrs: noinline nounwind
define %struct.variable** @map_over(i32 (%struct.variable*)* %function, %struct.var_context* %vc) #0 {
entry:
  %retval = alloca %struct.variable**, align 4
  %function.addr = alloca i32 (%struct.variable*)*, align 4
  %vc.addr = alloca %struct.var_context*, align 4
  %v = alloca %struct.var_context*, align 4
  %vlist = alloca %struct._vlist*, align 4
  %ret = alloca %struct.variable**, align 4
  %nentries = alloca i32, align 4
  store i32 (%struct.variable*)* %function, i32 (%struct.variable*)** %function.addr, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  store i32 0, i32* %nentries, align 4
  %0 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  store %struct.var_context* %0, %struct.var_context** %v, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %v, align 4
  %tobool = icmp ne %struct.var_context* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.var_context*, %struct.var_context** %v, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 5
  %3 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %tobool1 = icmp ne %struct.hash_table* %3, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %4 = load %struct.var_context*, %struct.var_context** %v, align 4
  %table2 = getelementptr inbounds %struct.var_context, %struct.var_context* %4, i32 0, i32 5
  %5 = load %struct.hash_table*, %struct.hash_table** %table2, align 4
  %nentries3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 2
  %6 = load i32, i32* %nentries3, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %6, %cond.true ], [ 0, %cond.false ]
  %7 = load i32, i32* %nentries, align 4
  %add = add nsw i32 %7, %cond
  store i32 %add, i32* %nentries, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %8 = load %struct.var_context*, %struct.var_context** %v, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 4
  %9 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %9, %struct.var_context** %v, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %nentries, align 4
  %cmp = icmp eq i32 %10, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  store %struct.variable** null, %struct.variable*** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.end
  %11 = load i32, i32* %nentries, align 4
  %call = call %struct._vlist* @vlist_alloc(i32 %11)
  store %struct._vlist* %call, %struct._vlist** %vlist, align 4
  %12 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  store %struct.var_context* %12, %struct.var_context** %v, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc8, %if.end
  %13 = load %struct.var_context*, %struct.var_context** %v, align 4
  %tobool5 = icmp ne %struct.var_context* %13, null
  br i1 %tobool5, label %for.body6, label %for.end10

for.body6:                                        ; preds = %for.cond4
  %14 = load %struct.var_context*, %struct.var_context** %v, align 4
  %table7 = getelementptr inbounds %struct.var_context, %struct.var_context* %14, i32 0, i32 5
  %15 = load %struct.hash_table*, %struct.hash_table** %table7, align 4
  %16 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %function.addr, align 4
  %17 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  call void @flatten(%struct.hash_table* %15, i32 (%struct.variable*)* %16, %struct._vlist* %17, i32 0)
  br label %for.inc8

for.inc8:                                         ; preds = %for.body6
  %18 = load %struct.var_context*, %struct.var_context** %v, align 4
  %down9 = getelementptr inbounds %struct.var_context, %struct.var_context* %18, i32 0, i32 4
  %19 = load %struct.var_context*, %struct.var_context** %down9, align 4
  store %struct.var_context* %19, %struct.var_context** %v, align 4
  br label %for.cond4

for.end10:                                        ; preds = %for.cond4
  %20 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list = getelementptr inbounds %struct._vlist, %struct._vlist* %20, i32 0, i32 0
  %21 = load %struct.variable**, %struct.variable*** %list, align 4
  store %struct.variable** %21, %struct.variable*** %ret, align 4
  %22 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %23 = bitcast %struct._vlist* %22 to i8*
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3742)
  %24 = load %struct.variable**, %struct.variable*** %ret, align 4
  store %struct.variable** %24, %struct.variable*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end10, %if.then
  %25 = load %struct.variable**, %struct.variable*** %retval, align 4
  ret %struct.variable** %25
}

; Function Attrs: noinline nounwind
define internal %struct._vlist* @vlist_alloc(i32 %nentries) #0 {
entry:
  %nentries.addr = alloca i32, align 4
  %vlist = alloca %struct._vlist*, align 4
  store i32 %nentries, i32* %nentries.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3672)
  %0 = bitcast i8* %call to %struct._vlist*
  store %struct._vlist* %0, %struct._vlist** %vlist, align 4
  %1 = load i32, i32* %nentries.addr, align 4
  %add = add nsw i32 %1, 1
  %mul = mul i32 %add, 4
  %call1 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3673)
  %2 = bitcast i8* %call1 to %struct.variable**
  %3 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list = getelementptr inbounds %struct._vlist, %struct._vlist* %3, i32 0, i32 0
  store %struct.variable** %2, %struct.variable*** %list, align 4
  %4 = load i32, i32* %nentries.addr, align 4
  %5 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list_size = getelementptr inbounds %struct._vlist, %struct._vlist* %5, i32 0, i32 1
  store i32 %4, i32* %list_size, align 4
  %6 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list_len = getelementptr inbounds %struct._vlist, %struct._vlist* %6, i32 0, i32 2
  store i32 0, i32* %list_len, align 4
  %7 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list2 = getelementptr inbounds %struct._vlist, %struct._vlist* %7, i32 0, i32 0
  %8 = load %struct.variable**, %struct.variable*** %list2, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %8, i32 0
  store %struct.variable* null, %struct.variable** %arrayidx, align 4
  %9 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  ret %struct._vlist* %9
}

; Function Attrs: noinline nounwind
define internal void @flatten(%struct.hash_table* %var_hash_table, i32 (%struct.variable*)* %func, %struct._vlist* %vlist, i32 %flags) #0 {
entry:
  %var_hash_table.addr = alloca %struct.hash_table*, align 4
  %func.addr = alloca i32 (%struct.variable*)*, align 4
  %vlist.addr = alloca %struct._vlist*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %r = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store %struct.hash_table* %var_hash_table, %struct.hash_table** %var_hash_table.addr, align 4
  store i32 (%struct.variable*)* %func, i32 (%struct.variable*)** %func.addr, align 4
  store %struct._vlist* %vlist, %struct._vlist** %vlist.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %cond.end
  %4 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %cmp3 = icmp eq %struct._vlist* %4, null
  br i1 %cmp3, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false2
  %5 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %func.addr, align 4
  %cmp4 = icmp eq i32 (%struct.variable*)* %5, null
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true, %cond.end, %entry
  br label %for.end28

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc27, %if.end
  %6 = load i32, i32* %i, align 4
  %7 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 1
  %8 = load i32, i32* %nbuckets, align 4
  %cmp5 = icmp slt i32 %6, %8
  br i1 %cmp5, label %for.body, label %for.end28

for.body:                                         ; preds = %for.cond
  %9 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %tobool6 = icmp ne %struct.hash_table* %9, null
  br i1 %tobool6, label %land.lhs.true7, label %cond.false11

land.lhs.true7:                                   ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %11 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %nbuckets8 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 1
  %12 = load i32, i32* %nbuckets8, align 4
  %cmp9 = icmp slt i32 %10, %12
  br i1 %cmp9, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %land.lhs.true7
  %13 = load %struct.hash_table*, %struct.hash_table** %var_hash_table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %13, i32 0, i32 0
  %14 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %14, i32 %15
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true7, %for.body
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %cond13 = phi %struct.bucket_contents* [ %16, %cond.true10 ], [ null, %cond.false11 ]
  store %struct.bucket_contents* %cond13, %struct.bucket_contents** %tlist, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %cond.end12
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool15 = icmp ne %struct.bucket_contents* %17, null
  br i1 %tobool15, label %for.body16, label %for.end

for.body16:                                       ; preds = %for.cond14
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 2
  %19 = load i8*, i8** %data, align 4
  %20 = bitcast i8* %19 to %struct.variable*
  store %struct.variable* %20, %struct.variable** %var, align 4
  %21 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %func.addr, align 4
  %tobool17 = icmp ne i32 (%struct.variable*)* %21, null
  br i1 %tobool17, label %cond.true18, label %cond.false19

cond.true18:                                      ; preds = %for.body16
  %22 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %func.addr, align 4
  %23 = load %struct.variable*, %struct.variable** %var, align 4
  %call = call i32 %22(%struct.variable* %23)
  br label %cond.end20

cond.false19:                                     ; preds = %for.body16
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true18
  %cond21 = phi i32 [ %call, %cond.true18 ], [ 1, %cond.false19 ]
  store i32 %cond21, i32* %r, align 4
  %24 = load i32, i32* %r, align 4
  %tobool22 = icmp ne i32 %24, 0
  br i1 %tobool22, label %land.lhs.true23, label %if.end26

land.lhs.true23:                                  ; preds = %cond.end20
  %25 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %tobool24 = icmp ne %struct._vlist* %25, null
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %land.lhs.true23
  %26 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %27 = load %struct.variable*, %struct.variable** %var, align 4
  %28 = load i32, i32* %flags.addr, align 4
  call void @vlist_add(%struct._vlist* %26, %struct.variable* %27, i32 %28)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %land.lhs.true23, %cond.end20
  br label %for.inc

for.inc:                                          ; preds = %if.end26
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 0
  %30 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %30, %struct.bucket_contents** %tlist, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  br label %for.inc27

for.inc27:                                        ; preds = %for.end
  %31 = load i32, i32* %i, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end28:                                        ; preds = %if.then, %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define %struct.variable** @map_over_funcs(i32 (%struct.variable*)* %function) #0 {
entry:
  %retval = alloca %struct.variable**, align 4
  %function.addr = alloca i32 (%struct.variable*)*, align 4
  %vlist = alloca %struct._vlist*, align 4
  %ret = alloca %struct.variable**, align 4
  store i32 (%struct.variable*)* %function, i32 (%struct.variable*)** %function.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  store %struct.variable** null, %struct.variable*** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %4 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %tobool2 = icmp ne %struct.hash_table* %4, null
  br i1 %tobool2, label %cond.true3, label %cond.false5

cond.true3:                                       ; preds = %if.end
  %5 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %nentries4 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 2
  %6 = load i32, i32* %nentries4, align 4
  br label %cond.end6

cond.false5:                                      ; preds = %if.end
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true3
  %cond7 = phi i32 [ %6, %cond.true3 ], [ 0, %cond.false5 ]
  %call = call %struct._vlist* @vlist_alloc(i32 %cond7)
  store %struct._vlist* %call, %struct._vlist** %vlist, align 4
  %7 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %8 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %function.addr, align 4
  %9 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  call void @flatten(%struct.hash_table* %7, i32 (%struct.variable*)* %8, %struct._vlist* %9, i32 0)
  %10 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list = getelementptr inbounds %struct._vlist, %struct._vlist* %10, i32 0, i32 0
  %11 = load %struct.variable**, %struct.variable*** %list, align 4
  store %struct.variable** %11, %struct.variable*** %ret, align 4
  %12 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %13 = bitcast %struct._vlist* %12 to i8*
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3761)
  %14 = load %struct.variable**, %struct.variable*** %ret, align 4
  store %struct.variable** %14, %struct.variable*** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end6, %if.then
  %15 = load %struct.variable**, %struct.variable*** %retval, align 4
  ret %struct.variable** %15
}

; Function Attrs: noinline nounwind
define void @sort_variables(%struct.variable** %array) #0 {
entry:
  %array.addr = alloca %struct.variable**, align 4
  store %struct.variable** %array, %struct.variable*** %array.addr, align 4
  %0 = load %struct.variable**, %struct.variable*** %array.addr, align 4
  %1 = bitcast %struct.variable** %0 to i8*
  %2 = load %struct.variable**, %struct.variable*** %array.addr, align 4
  %3 = bitcast %struct.variable** %2 to i8**
  %call = call i32 @strvec_len(i8** %3)
  call void @qsort(i8* %1, i32 %call, i32 4, i32 (i8*, i8*)* bitcast (i32 (%struct.variable**, %struct.variable**)* @qsort_var_comp to i32 (i8*, i8*)*))
  ret void
}

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

declare i32 @strvec_len(i8**) #1

; Function Attrs: noinline nounwind
define internal i32 @qsort_var_comp(%struct.variable** %var1, %struct.variable** %var2) #0 {
entry:
  %var1.addr = alloca %struct.variable**, align 4
  %var2.addr = alloca %struct.variable**, align 4
  %result = alloca i32, align 4
  store %struct.variable** %var1, %struct.variable*** %var1.addr, align 4
  store %struct.variable** %var2, %struct.variable*** %var2.addr, align 4
  %0 = load %struct.variable**, %struct.variable*** %var1.addr, align 4
  %1 = load %struct.variable*, %struct.variable** %0, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %4 = load %struct.variable**, %struct.variable*** %var2.addr, align 4
  %5 = load %struct.variable*, %struct.variable** %4, align 4
  %name1 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 0
  %6 = load i8*, i8** %name1, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %sub = sub nsw i32 %conv, %conv3
  store i32 %sub, i32* %result, align 4
  %cmp = icmp eq i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load %struct.variable**, %struct.variable*** %var1.addr, align 4
  %9 = load %struct.variable*, %struct.variable** %8, align 4
  %name5 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 0
  %10 = load i8*, i8** %name5, align 4
  %11 = load %struct.variable**, %struct.variable*** %var2.addr, align 4
  %12 = load %struct.variable*, %struct.variable** %11, align 4
  %name6 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 0
  %13 = load i8*, i8** %name6, align 4
  %call = call i32 @strcmp(i8* %10, i8* %13)
  store i32 %call, i32* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32, i32* %result, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_shell_variables() #0 {
entry:
  %call = call %struct.variable** @vapply(i32 (%struct.variable*)* null)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define internal %struct.variable** @vapply(i32 (%struct.variable*)* %func) #0 {
entry:
  %func.addr = alloca i32 (%struct.variable*)*, align 4
  %list = alloca %struct.variable**, align 4
  store i32 (%struct.variable*)* %func, i32 (%struct.variable*)** %func.addr, align 4
  %0 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %func.addr, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %call = call %struct.variable** @map_over(i32 (%struct.variable*)* %0, %struct.var_context* %1)
  store %struct.variable** %call, %struct.variable*** %list, align 4
  %2 = load %struct.variable**, %struct.variable*** %list, align 4
  %tobool = icmp ne %struct.variable** %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.variable**, %struct.variable*** %list, align 4
  call void @sort_variables(%struct.variable** %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.variable**, %struct.variable*** %list, align 4
  ret %struct.variable** %4
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_shell_functions() #0 {
entry:
  %call = call %struct.variable** @fapply(i32 (%struct.variable*)* null)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define internal %struct.variable** @fapply(i32 (%struct.variable*)* %func) #0 {
entry:
  %func.addr = alloca i32 (%struct.variable*)*, align 4
  %list = alloca %struct.variable**, align 4
  store i32 (%struct.variable*)* %func, i32 (%struct.variable*)** %func.addr, align 4
  %0 = load i32 (%struct.variable*)*, i32 (%struct.variable*)** %func.addr, align 4
  %call = call %struct.variable** @map_over_funcs(i32 (%struct.variable*)* %0)
  store %struct.variable** %call, %struct.variable*** %list, align 4
  %1 = load %struct.variable**, %struct.variable*** %list, align 4
  %tobool = icmp ne %struct.variable** %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.variable**, %struct.variable*** %list, align 4
  call void @sort_variables(%struct.variable** %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.variable**, %struct.variable*** %list, align 4
  ret %struct.variable** %3
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_visible_functions() #0 {
entry:
  %call = call %struct.variable** @fapply(i32 (%struct.variable*)* @visible_var)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define internal i32 @visible_var(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 4096
  %cmp = icmp eq i32 %and, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_visible_variables() #0 {
entry:
  %call = call %struct.variable** @vapply(i32 (%struct.variable*)* @visible_var)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_exported_variables() #0 {
entry:
  %call = call %struct.variable** @vapply(i32 (%struct.variable*)* @visible_and_exported)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define internal i32 @visible_and_exported(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 4096
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %3, 1
  %tobool = icmp ne i32 %and2, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define %struct.variable** @local_exported_variables() #0 {
entry:
  %call = call %struct.variable** @vapply(i32 (%struct.variable*)* @local_and_exported)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define internal i32 @local_and_exported(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 4096
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %3, 32
  %tobool = icmp ne i32 %and2, 0
  br i1 %tobool, label %land.lhs.true3, label %land.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 6
  %5 = load i32, i32* %context, align 4
  %6 = load i32, i32* @variable_context, align 4
  %cmp4 = icmp eq i32 %5, %6
  br i1 %cmp4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true3
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes5 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes5, align 4
  %and6 = and i32 %8, 1
  %tobool7 = icmp ne i32 %and6, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true3, %land.lhs.true, %entry
  %9 = phi i1 [ false, %land.lhs.true3 ], [ false, %land.lhs.true ], [ false, %entry ], [ %tobool7, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_local_variables() #0 {
entry:
  %retval = alloca %struct.variable**, align 4
  %vlist = alloca %struct._vlist*, align 4
  %ret = alloca %struct.variable**, align 4
  %vc = alloca %struct.var_context*, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %0, %struct.var_context** %vc, align 4
  %1 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %1, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool = icmp ne %struct.var_context* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 2
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 4
  %cmp = icmp ne i32 %and, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %5 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %scope = getelementptr inbounds %struct.var_context, %struct.var_context* %5, i32 0, i32 1
  %6 = load i32, i32* %scope, align 4
  %7 = load i32, i32* @variable_context, align 4
  %cmp1 = icmp eq i32 %6, %7
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %for.end

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 4
  %9 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %9, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %10 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %cmp2 = icmp eq %struct.var_context* %10, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.end
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.65, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call)
  store %struct.variable** null, %struct.variable*** %retval, align 4
  br label %return

if.end4:                                          ; preds = %for.end
  %11 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %11, i32 0, i32 5
  %12 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %cmp5 = icmp eq %struct.hash_table* %12, null
  br i1 %cmp5, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %13 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table6 = getelementptr inbounds %struct.var_context, %struct.var_context* %13, i32 0, i32 5
  %14 = load %struct.hash_table*, %struct.hash_table** %table6, align 4
  %tobool7 = icmp ne %struct.hash_table* %14, null
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %15 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table8 = getelementptr inbounds %struct.var_context, %struct.var_context* %15, i32 0, i32 5
  %16 = load %struct.hash_table*, %struct.hash_table** %table8, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %16, i32 0, i32 2
  %17 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %17, %cond.true ], [ 0, %cond.false ]
  %cmp9 = icmp eq i32 %cond, 0
  br i1 %cmp9, label %if.then16, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %cond.end
  %18 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags11 = getelementptr inbounds %struct.var_context, %struct.var_context* %18, i32 0, i32 2
  %19 = load i32, i32* %flags11, align 4
  %and12 = and i32 %19, 1
  %cmp13 = icmp ne i32 %and12, 0
  %conv = zext i1 %cmp13 to i32
  %cmp14 = icmp eq i32 %conv, 0
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %lor.lhs.false10, %cond.end, %if.end4
  store %struct.variable** null, %struct.variable*** %retval, align 4
  br label %return

if.end17:                                         ; preds = %lor.lhs.false10
  %20 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table18 = getelementptr inbounds %struct.var_context, %struct.var_context* %20, i32 0, i32 5
  %21 = load %struct.hash_table*, %struct.hash_table** %table18, align 4
  %tobool19 = icmp ne %struct.hash_table* %21, null
  br i1 %tobool19, label %cond.true20, label %cond.false23

cond.true20:                                      ; preds = %if.end17
  %22 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table21 = getelementptr inbounds %struct.var_context, %struct.var_context* %22, i32 0, i32 5
  %23 = load %struct.hash_table*, %struct.hash_table** %table21, align 4
  %nentries22 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %23, i32 0, i32 2
  %24 = load i32, i32* %nentries22, align 4
  br label %cond.end24

cond.false23:                                     ; preds = %if.end17
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true20
  %cond25 = phi i32 [ %24, %cond.true20 ], [ 0, %cond.false23 ]
  %call26 = call %struct._vlist* @vlist_alloc(i32 %cond25)
  store %struct._vlist* %call26, %struct._vlist** %vlist, align 4
  %25 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table27 = getelementptr inbounds %struct.var_context, %struct.var_context* %25, i32 0, i32 5
  %26 = load %struct.hash_table*, %struct.hash_table** %table27, align 4
  %27 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  call void @flatten(%struct.hash_table* %26, i32 (%struct.variable*)* @variable_in_context, %struct._vlist* %27, i32 0)
  %28 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %list = getelementptr inbounds %struct._vlist, %struct._vlist* %28, i32 0, i32 0
  %29 = load %struct.variable**, %struct.variable*** %list, align 4
  store %struct.variable** %29, %struct.variable*** %ret, align 4
  %30 = load %struct._vlist*, %struct._vlist** %vlist, align 4
  %31 = bitcast %struct._vlist* %30 to i8*
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3951)
  %32 = load %struct.variable**, %struct.variable*** %ret, align 4
  %tobool28 = icmp ne %struct.variable** %32, null
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %cond.end24
  %33 = load %struct.variable**, %struct.variable*** %ret, align 4
  call void @sort_variables(%struct.variable** %33)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %cond.end24
  %34 = load %struct.variable**, %struct.variable*** %ret, align 4
  store %struct.variable** %34, %struct.variable*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then16, %if.then3
  %35 = load %struct.variable**, %struct.variable*** %retval, align 4
  ret %struct.variable** %35
}

; Function Attrs: noinline nounwind
define internal i32 @variable_in_context(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 4096
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %3, 32
  %tobool = icmp ne i32 %and2, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 6
  %5 = load i32, i32* %context, align 4
  %6 = load i32, i32* @variable_context, align 4
  %cmp3 = icmp eq i32 %5, %6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %7 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define %struct.variable** @all_array_variables() #0 {
entry:
  %call = call %struct.variable** @vapply(i32 (%struct.variable*)* @visible_array_vars)
  ret %struct.variable** %call
}

; Function Attrs: noinline nounwind
define internal i32 @visible_array_vars(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 4096
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %3, 4
  %tobool = icmp ne i32 %and2, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define i8** @all_variables_matching_prefix(i8* %prefix) #0 {
entry:
  %retval = alloca i8**, align 4
  %prefix.addr = alloca i8*, align 4
  %varlist = alloca %struct.variable**, align 4
  %rlist = alloca i8**, align 4
  %vind = alloca i32, align 4
  %rind = alloca i32, align 4
  %plen = alloca i32, align 4
  store i8* %prefix, i8** %prefix.addr, align 4
  %0 = load i8*, i8** %prefix.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false13

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %prefix.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false13

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %prefix.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %4 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %cond.true5, label %cond.false10

cond.true5:                                       ; preds = %cond.true
  %5 = load i8*, i8** %prefix.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i32 2
  %6 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %6 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false

cond.true9:                                       ; preds = %cond.true5
  %7 = load i8*, i8** %prefix.addr, align 4
  %call = call i32 @strlen(i8* %7)
  br label %cond.end

cond.false:                                       ; preds = %cond.true5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true9
  %cond = phi i32 [ %call, %cond.true9 ], [ 2, %cond.false ]
  br label %cond.end11

cond.false10:                                     ; preds = %cond.true
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.end
  %cond12 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false10 ]
  br label %cond.end14

cond.false13:                                     ; preds = %land.lhs.true, %entry
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false13, %cond.end11
  %cond15 = phi i32 [ %cond12, %cond.end11 ], [ 0, %cond.false13 ]
  store i32 %cond15, i32* %plen, align 4
  %call16 = call %struct.variable** @all_visible_variables()
  store %struct.variable** %call16, %struct.variable*** %varlist, align 4
  store i32 0, i32* %vind, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end14
  %8 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %tobool17 = icmp ne %struct.variable** %8, null
  br i1 %tobool17, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %9 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %10 = load i32, i32* %vind, align 4
  %arrayidx18 = getelementptr inbounds %struct.variable*, %struct.variable** %9, i32 %10
  %11 = load %struct.variable*, %struct.variable** %arrayidx18, align 4
  %tobool19 = icmp ne %struct.variable* %11, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %12 = phi i1 [ false, %for.cond ], [ %tobool19, %land.rhs ]
  br i1 %12, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %vind, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %vind, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %14 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %cmp = icmp eq %struct.variable** %14, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %15 = load i32, i32* %vind, align 4
  %cmp21 = icmp eq i32 %15, 0
  br i1 %cmp21, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.end
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %16 = load i32, i32* %vind, align 4
  %add = add nsw i32 %16, 1
  %call23 = call i8** @strvec_create(i32 %add)
  store i8** %call23, i8*** %rlist, align 4
  store i32 0, i32* %rind, align 4
  store i32 0, i32* %vind, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc60, %if.end
  %17 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %18 = load i32, i32* %vind, align 4
  %arrayidx25 = getelementptr inbounds %struct.variable*, %struct.variable** %17, i32 %18
  %19 = load %struct.variable*, %struct.variable** %arrayidx25, align 4
  %tobool26 = icmp ne %struct.variable* %19, null
  br i1 %tobool26, label %for.body27, label %for.end62

for.body27:                                       ; preds = %for.cond24
  %20 = load i32, i32* %plen, align 4
  %cmp28 = icmp eq i32 %20, 0
  br i1 %cmp28, label %if.then48, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %for.body27
  %21 = load i32, i32* %plen, align 4
  %cmp31 = icmp eq i32 %21, 0
  br i1 %cmp31, label %cond.true33, label %cond.false34

cond.true33:                                      ; preds = %lor.lhs.false30
  br i1 true, label %if.then48, label %if.end59

cond.false34:                                     ; preds = %lor.lhs.false30
  %22 = load i8*, i8** %prefix.addr, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %22, i32 0
  %23 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %23 to i32
  %24 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %25 = load i32, i32* %vind, align 4
  %arrayidx37 = getelementptr inbounds %struct.variable*, %struct.variable** %24, i32 %25
  %26 = load %struct.variable*, %struct.variable** %arrayidx37, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 0
  %27 = load i8*, i8** %name, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %28 to i32
  %cmp40 = icmp eq i32 %conv36, %conv39
  br i1 %cmp40, label %land.lhs.true42, label %if.end59

land.lhs.true42:                                  ; preds = %cond.false34
  %29 = load i8*, i8** %prefix.addr, align 4
  %30 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %31 = load i32, i32* %vind, align 4
  %arrayidx43 = getelementptr inbounds %struct.variable*, %struct.variable** %30, i32 %31
  %32 = load %struct.variable*, %struct.variable** %arrayidx43, align 4
  %name44 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 0
  %33 = load i8*, i8** %name44, align 4
  %34 = load i32, i32* %plen, align 4
  %call45 = call i32 @strncmp(i8* %29, i8* %33, i32 %34)
  %cmp46 = icmp eq i32 %call45, 0
  br i1 %cmp46, label %if.then48, label %if.end59

if.then48:                                        ; preds = %land.lhs.true42, %cond.true33, %for.body27
  %35 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %36 = load i32, i32* %vind, align 4
  %arrayidx49 = getelementptr inbounds %struct.variable*, %struct.variable** %35, i32 %36
  %37 = load %struct.variable*, %struct.variable** %arrayidx49, align 4
  %name50 = getelementptr inbounds %struct.variable, %struct.variable* %37, i32 0, i32 0
  %38 = load i8*, i8** %name50, align 4
  %call51 = call i32 @strlen(i8* %38)
  %add52 = add i32 1, %call51
  %call53 = call i8* @sh_xmalloc(i32 %add52, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3991)
  %39 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %40 = load i32, i32* %vind, align 4
  %arrayidx54 = getelementptr inbounds %struct.variable*, %struct.variable** %39, i32 %40
  %41 = load %struct.variable*, %struct.variable** %arrayidx54, align 4
  %name55 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 0
  %42 = load i8*, i8** %name55, align 4
  %call56 = call i8* @strcpy(i8* %call53, i8* %42)
  %43 = load i8**, i8*** %rlist, align 4
  %44 = load i32, i32* %rind, align 4
  %inc57 = add nsw i32 %44, 1
  store i32 %inc57, i32* %rind, align 4
  %arrayidx58 = getelementptr inbounds i8*, i8** %43, i32 %44
  store i8* %call56, i8** %arrayidx58, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then48, %land.lhs.true42, %cond.false34, %cond.true33
  br label %for.inc60

for.inc60:                                        ; preds = %if.end59
  %45 = load i32, i32* %vind, align 4
  %inc61 = add nsw i32 %45, 1
  store i32 %inc61, i32* %vind, align 4
  br label %for.cond24

for.end62:                                        ; preds = %for.cond24
  %46 = load i8**, i8*** %rlist, align 4
  %47 = load i32, i32* %rind, align 4
  %arrayidx63 = getelementptr inbounds i8*, i8** %46, i32 %47
  store i8* null, i8** %arrayidx63, align 4
  %48 = load %struct.variable**, %struct.variable*** %varlist, align 4
  %49 = bitcast %struct.variable** %48 to i8*
  call void @sh_xfree(i8* %49, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3994)
  %50 = load i8**, i8*** %rlist, align 4
  store i8** %50, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end62, %if.then
  %51 = load i8**, i8*** %retval, align 4
  ret i8** %51
}

declare i8** @strvec_create(i32) #1

; Function Attrs: noinline nounwind
define %struct.variable* @find_tempenv_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %call = call %struct.variable* @hash_lookup(i8* %1, %struct.hash_table* %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable* [ %call, %cond.true ], [ null, %cond.false ]
  ret %struct.variable* %cond
}

; Function Attrs: noinline nounwind
define void @dispose_used_env_vars() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @dispose_temporary_env(void (i8*)* @propagate_temp_var)
  call void @maybe_make_export_env()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @dispose_temporary_env(void (i8*)* %pushf) #0 {
entry:
  %pushf.addr = alloca void (i8*)*, align 4
  %i = alloca i32, align 4
  store void (i8*)* %pushf, void (i8*)** %pushf.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  %add = add nsw i32 %cond, 1
  %call = call i8** @strvec_create(i32 %add)
  store i8** %call, i8*** @tempvar_list, align 4
  %3 = load i8**, i8*** @tempvar_list, align 4
  store i32 0, i32* @tvlist_ind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 0
  store i8* null, i8** %arrayidx, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %5 = load void (i8*)*, void (i8*)** %pushf.addr, align 4
  call void @hash_flush(%struct.hash_table* %4, void (i8*)* %5)
  %6 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  call void @hash_dispose(%struct.hash_table* %6)
  store %struct.hash_table* null, %struct.hash_table** @temporary_env, align 4
  %7 = load i8**, i8*** @tempvar_list, align 4
  %8 = load i32, i32* @tvlist_ind, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %7, i32 %8
  store i8* null, i8** %arrayidx1, align 4
  store i32 1, i32* @array_needs_making, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* @tvlist_ind, align 4
  %cmp = icmp slt i32 %9, %10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8**, i8*** @tempvar_list, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx2, align 4
  call void @stupidly_hack_special_variables(i8* %13)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i8**, i8*** @tempvar_list, align 4
  call void @strvec_dispose(i8** %15)
  store i8** null, i8*** @tempvar_list, align 4
  store i32 0, i32* @tvlist_ind, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @propagate_temp_var(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.variable*
  store %struct.variable* %1, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 1048576
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %5, 2097152
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %6 = load i8*, i8** %data.addr, align 4
  call void @push_temp_var(i8* %6)
  br label %if.end10

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 0
  %8 = load i8*, i8** %name, align 4
  %call = call i32 @find_special_var(i8* %8)
  %cmp = icmp sge i32 %call, 0
  br i1 %cmp, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %name5 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 0
  %10 = load i8*, i8** %name5, align 4
  %call6 = call i32 @strlen(i8* %10)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4091)
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %name8 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 0
  %12 = load i8*, i8** %name8, align 4
  %call9 = call i8* @strcpy(i8* %call7, i8* %12)
  %13 = load i8**, i8*** @tempvar_list, align 4
  %14 = load i32, i32* @tvlist_ind, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @tvlist_ind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %13, i32 %14
  store i8* %call9, i8** %arrayidx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable(%struct.variable* %15)
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @maybe_make_export_env() #0 {
entry:
  %temp_array = alloca i8**, align 4
  %new_size = alloca i32, align 4
  %tcxt = alloca %struct.var_context*, align 4
  %0 = load i32, i32* @array_needs_making, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end35

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** @export_env, align 4
  %tobool1 = icmp ne i8** %1, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i8**, i8*** @export_env, align 4
  call void @strvec_flush(i8** %2)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %call = call i32 @n_shell_variables()
  %3 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %tobool3 = icmp ne %struct.hash_table* %3, null
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load %struct.hash_table*, %struct.hash_table** @shell_functions, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 2
  %5 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ 0, %cond.false ]
  %add = add nsw i32 %call, %cond
  %add4 = add nsw i32 %add, 1
  %6 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool5 = icmp ne %struct.hash_table* %6, null
  br i1 %tobool5, label %cond.true6, label %cond.false8

cond.true6:                                       ; preds = %cond.end
  %7 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %nentries7 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 2
  %8 = load i32, i32* %nentries7, align 4
  br label %cond.end9

cond.false8:                                      ; preds = %cond.end
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false8, %cond.true6
  %cond10 = phi i32 [ %8, %cond.true6 ], [ 0, %cond.false8 ]
  %add11 = add nsw i32 %add4, %cond10
  store i32 %add11, i32* %new_size, align 4
  %9 = load i32, i32* %new_size, align 4
  %10 = load i32, i32* @export_env_size, align 4
  %cmp = icmp sgt i32 %9, %10
  br i1 %cmp, label %if.then12, label %if.end14

if.then12:                                        ; preds = %cond.end9
  %11 = load i32, i32* %new_size, align 4
  store i32 %11, i32* @export_env_size, align 4
  %12 = load i8**, i8*** @export_env, align 4
  %13 = load i32, i32* @export_env_size, align 4
  %call13 = call i8** @strvec_resize(i8** %12, i32 %13)
  store i8** %call13, i8*** @export_env, align 4
  %14 = load i8**, i8*** @export_env, align 4
  store i8** %14, i8*** @environ, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %cond.end9
  %15 = load i8**, i8*** @export_env, align 4
  store i32 0, i32* @export_env_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %15, i32 0
  store i8* null, i8** %arrayidx, align 4
  %16 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool15 = icmp ne %struct.hash_table* %16, null
  br i1 %tobool15, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.end14
  %call17 = call %struct.var_context* @new_var_context(i8* null, i32 0)
  store %struct.var_context* %call17, %struct.var_context** %tcxt, align 4
  %17 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %18 = load %struct.var_context*, %struct.var_context** %tcxt, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %18, i32 0, i32 5
  store %struct.hash_table* %17, %struct.hash_table** %table, align 4
  %19 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %20 = load %struct.var_context*, %struct.var_context** %tcxt, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %20, i32 0, i32 4
  store %struct.var_context* %19, %struct.var_context** %down, align 4
  br label %if.end18

if.else:                                          ; preds = %if.end14
  %21 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %21, %struct.var_context** %tcxt, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then16
  %22 = load %struct.var_context*, %struct.var_context** %tcxt, align 4
  %call19 = call i8** @make_var_export_array(%struct.var_context* %22)
  store i8** %call19, i8*** %temp_array, align 4
  %23 = load i8**, i8*** %temp_array, align 4
  %tobool20 = icmp ne i8** %23, null
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  %24 = load i8**, i8*** %temp_array, align 4
  call void @add_temp_array_to_env(i8** %24, i32 0, i32 0)
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end18
  %25 = load %struct.var_context*, %struct.var_context** %tcxt, align 4
  %26 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %cmp23 = icmp ne %struct.var_context* %25, %26
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  %27 = load %struct.var_context*, %struct.var_context** %tcxt, align 4
  %28 = bitcast %struct.var_context* %27 to i8*
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4507)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end22
  %29 = load i32, i32* @restricted, align 4
  %tobool26 = icmp ne i32 %29, 0
  br i1 %tobool26, label %cond.true27, label %cond.false28

cond.true27:                                      ; preds = %if.end25
  br label %cond.end30

cond.false28:                                     ; preds = %if.end25
  %call29 = call i8** @make_func_export_array()
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false28, %cond.true27
  %cond31 = phi i8** [ null, %cond.true27 ], [ %call29, %cond.false28 ]
  store i8** %cond31, i8*** %temp_array, align 4
  %30 = load i8**, i8*** %temp_array, align 4
  %tobool32 = icmp ne i8** %30, null
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %cond.end30
  %31 = load i8**, i8*** %temp_array, align 4
  call void @add_temp_array_to_env(i8** %31, i32 0, i32 0)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %cond.end30
  store i32 0, i32* @array_needs_making, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @merge_temporary_env() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @dispose_temporary_env(void (i8*)* @push_temp_var)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @push_temp_var(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  %binding_table = alloca %struct.hash_table*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.variable*
  store %struct.variable* %1, %struct.variable** %var, align 4
  %2 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 5
  %3 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  store %struct.hash_table* %3, %struct.hash_table** %binding_table, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %binding_table, align 4
  %cmp = icmp eq %struct.hash_table* %4, null
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %5 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %6 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %cmp1 = icmp eq %struct.var_context* %5, %6
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %call = call %struct.hash_table* @hash_create(i32 1024)
  %7 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table3 = getelementptr inbounds %struct.var_context, %struct.var_context* %7, i32 0, i32 5
  store %struct.hash_table* %call, %struct.hash_table** %table3, align 4
  %8 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table4 = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 5
  store %struct.hash_table* %call, %struct.hash_table** %table4, align 4
  store %struct.hash_table* %call, %struct.hash_table** %binding_table, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %call5 = call %struct.hash_table* @hash_create(i32 4)
  %9 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table6 = getelementptr inbounds %struct.var_context, %struct.var_context* %9, i32 0, i32 5
  store %struct.hash_table* %call5, %struct.hash_table** %table6, align 4
  store %struct.hash_table* %call5, %struct.hash_table** %binding_table, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end7

if.end7:                                          ; preds = %if.end, %entry
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 0
  %11 = load i8*, i8** %name, align 4
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 1
  %13 = load i8*, i8** %value, align 4
  %14 = load %struct.hash_table*, %struct.hash_table** %binding_table, align 4
  %call8 = call %struct.variable* @bind_variable_internal(i8* %11, i8* %13, %struct.hash_table* %14, i32 0, i32 32)
  store %struct.variable* %call8, %struct.variable** %v, align 4
  %15 = load %struct.hash_table*, %struct.hash_table** %binding_table, align 4
  %16 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table9 = getelementptr inbounds %struct.var_context, %struct.var_context* %16, i32 0, i32 5
  %17 = load %struct.hash_table*, %struct.hash_table** %table9, align 4
  %cmp10 = icmp eq %struct.hash_table* %15, %17
  br i1 %cmp10, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.end7
  %18 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes, align 4
  %and = and i32 %19, -3145729
  store i32 %and, i32* %attributes, align 4
  br label %if.end19

if.else12:                                        ; preds = %if.end7
  %20 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes13 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes13, align 4
  %or = or i32 %21, 2097152
  store i32 %or, i32* %attributes13, align 4
  %22 = load %struct.hash_table*, %struct.hash_table** %binding_table, align 4
  %23 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table14 = getelementptr inbounds %struct.var_context, %struct.var_context* %23, i32 0, i32 5
  %24 = load %struct.hash_table*, %struct.hash_table** %table14, align 4
  %cmp15 = icmp eq %struct.hash_table* %22, %24
  br i1 %cmp15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.else12
  %25 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %25, i32 0, i32 2
  %26 = load i32, i32* %flags, align 4
  %or17 = or i32 %26, 2
  store i32 %or17, i32* %flags, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.else12
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then11
  %27 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %27, null
  br i1 %tobool, label %if.then20, label %if.end24

if.then20:                                        ; preds = %if.end19
  %28 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes21 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes21, align 4
  %30 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes22, align 4
  %or23 = or i32 %31, %29
  store i32 %or23, i32* %attributes22, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then20, %if.end19
  %32 = load %struct.variable*, %struct.variable** %var, align 4
  %name25 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 0
  %33 = load i8*, i8** %name25, align 4
  %call26 = call i32 @find_special_var(i8* %33)
  %cmp27 = icmp sge i32 %call26, 0
  br i1 %cmp27, label %if.then28, label %if.end34

if.then28:                                        ; preds = %if.end24
  %34 = load %struct.variable*, %struct.variable** %var, align 4
  %name29 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 0
  %35 = load i8*, i8** %name29, align 4
  %call30 = call i32 @strlen(i8* %35)
  %add = add i32 1, %call30
  %call31 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4074)
  %36 = load %struct.variable*, %struct.variable** %var, align 4
  %name32 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 0
  %37 = load i8*, i8** %name32, align 4
  %call33 = call i8* @strcpy(i8* %call31, i8* %37)
  %38 = load i8**, i8*** @tempvar_list, align 4
  %39 = load i32, i32* @tvlist_ind, align 4
  %inc = add nsw i32 %39, 1
  store i32 %inc, i32* @tvlist_ind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %38, i32 %39
  store i8* %call33, i8** %arrayidx, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then28, %if.end24
  %40 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable(%struct.variable* %40)
  ret void
}

; Function Attrs: noinline nounwind
define void @flush_temporary_env() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  call void @hash_flush(%struct.hash_table* %1, void (i8*)* @free_variable_hash_data)
  %2 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  call void @hash_dispose(%struct.hash_table* %2)
  store %struct.hash_table* null, %struct.hash_table** @temporary_env, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define i8** @add_or_supercede_exported_var(i8* %assign, i32 %do_alloc) #0 {
entry:
  %retval = alloca i8**, align 4
  %assign.addr = alloca i8*, align 4
  %do_alloc.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %equal_offset = alloca i32, align 4
  store i8* %assign, i8** %assign.addr, align 4
  store i32 %do_alloc, i32* %do_alloc.addr, align 4
  %0 = load i8*, i8** %assign.addr, align 4
  %call = call i32 @assignment(i8* %0, i32 0)
  store i32 %call, i32* %equal_offset, align 4
  %1 = load i32, i32* %equal_offset, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** @export_env, align 4
  store i8** %2, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %assign.addr, align 4
  %4 = load i32, i32* %equal_offset, align 4
  %add = add nsw i32 %4, 1
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %add
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 40
  br i1 %cmp1, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end
  %6 = load i8*, i8** %assign.addr, align 4
  %7 = load i32, i32* %equal_offset, align 4
  %add.ptr = getelementptr inbounds i8, i8* %6, i32 %7
  %add.ptr3 = getelementptr inbounds i8, i8* %add.ptr, i32 2
  %call4 = call i32 @strncmp(i8* %add.ptr3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.66, i32 0, i32 0), i32 3)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %land.lhs.true
  %8 = load i32, i32* %equal_offset, align 4
  %add8 = add nsw i32 %8, 4
  store i32 %add8, i32* %equal_offset, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %land.lhs.true, %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end9
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* @export_env_index, align 4
  %cmp10 = icmp slt i32 %9, %10
  br i1 %cmp10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32, i32* %equal_offset, align 4
  %add12 = add nsw i32 %11, 1
  %cmp13 = icmp eq i32 %add12, 0
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br i1 true, label %if.then28, label %if.end37

cond.false:                                       ; preds = %for.body
  %12 = load i8*, i8** %assign.addr, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %13 to i32
  %14 = load i8**, i8*** @export_env, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx17, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %17 to i32
  %cmp20 = icmp eq i32 %conv16, %conv19
  br i1 %cmp20, label %land.lhs.true22, label %if.end37

land.lhs.true22:                                  ; preds = %cond.false
  %18 = load i8*, i8** %assign.addr, align 4
  %19 = load i8**, i8*** @export_env, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx23, align 4
  %22 = load i32, i32* %equal_offset, align 4
  %add24 = add nsw i32 %22, 1
  %call25 = call i32 @strncmp(i8* %18, i8* %21, i32 %add24)
  %cmp26 = icmp eq i32 %call25, 0
  br i1 %cmp26, label %if.then28, label %if.end37

if.then28:                                        ; preds = %land.lhs.true22, %cond.true
  %23 = load i8**, i8*** @export_env, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx29 = getelementptr inbounds i8*, i8** %23, i32 %24
  %25 = load i8*, i8** %arrayidx29, align 4
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4390)
  %26 = load i32, i32* %do_alloc.addr, align 4
  %tobool = icmp ne i32 %26, 0
  br i1 %tobool, label %cond.true30, label %cond.false35

cond.true30:                                      ; preds = %if.then28
  %27 = load i8*, i8** %assign.addr, align 4
  %call31 = call i32 @strlen(i8* %27)
  %add32 = add i32 1, %call31
  %call33 = call i8* @sh_xmalloc(i32 %add32, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4391)
  %28 = load i8*, i8** %assign.addr, align 4
  %call34 = call i8* @strcpy(i8* %call33, i8* %28)
  br label %cond.end

cond.false35:                                     ; preds = %if.then28
  %29 = load i8*, i8** %assign.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false35, %cond.true30
  %cond = phi i8* [ %call34, %cond.true30 ], [ %29, %cond.false35 ]
  %30 = load i8**, i8*** @export_env, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds i8*, i8** %30, i32 %31
  store i8* %cond, i8** %arrayidx36, align 4
  %32 = load i8**, i8*** @export_env, align 4
  store i8** %32, i8*** %retval, align 4
  br label %return

if.end37:                                         ; preds = %land.lhs.true22, %cond.false, %cond.true
  br label %for.inc

for.inc:                                          ; preds = %if.end37
  %33 = load i32, i32* %i, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %for.end
  %34 = load i32, i32* @export_env_index, align 4
  %35 = load i32, i32* @export_env_size, align 4
  %sub = sub nsw i32 %35, 1
  %cmp38 = icmp sge i32 %34, %sub
  br i1 %cmp38, label %if.then40, label %if.end43

if.then40:                                        ; preds = %do.body
  %36 = load i32, i32* @export_env_size, align 4
  %add41 = add nsw i32 %36, 16
  store i32 %add41, i32* @export_env_size, align 4
  %37 = load i8**, i8*** @export_env, align 4
  %38 = load i32, i32* @export_env_size, align 4
  %call42 = call i8** @strvec_resize(i8** %37, i32 %38)
  store i8** %call42, i8*** @export_env, align 4
  %39 = load i8**, i8*** @export_env, align 4
  store i8** %39, i8*** @environ, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then40, %do.body
  %40 = load i32, i32* %do_alloc.addr, align 4
  %tobool44 = icmp ne i32 %40, 0
  br i1 %tobool44, label %cond.true45, label %cond.false50

cond.true45:                                      ; preds = %if.end43
  %41 = load i8*, i8** %assign.addr, align 4
  %call46 = call i32 @strlen(i8* %41)
  %add47 = add i32 1, %call46
  %call48 = call i8* @sh_xmalloc(i32 %add47, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4395)
  %42 = load i8*, i8** %assign.addr, align 4
  %call49 = call i8* @strcpy(i8* %call48, i8* %42)
  br label %cond.end51

cond.false50:                                     ; preds = %if.end43
  %43 = load i8*, i8** %assign.addr, align 4
  br label %cond.end51

cond.end51:                                       ; preds = %cond.false50, %cond.true45
  %cond52 = phi i8* [ %call49, %cond.true45 ], [ %43, %cond.false50 ]
  %44 = load i8**, i8*** @export_env, align 4
  %45 = load i32, i32* @export_env_index, align 4
  %inc53 = add nsw i32 %45, 1
  store i32 %inc53, i32* @export_env_index, align 4
  %arrayidx54 = getelementptr inbounds i8*, i8** %44, i32 %45
  store i8* %cond52, i8** %arrayidx54, align 4
  %46 = load i8**, i8*** @export_env, align 4
  %47 = load i32, i32* @export_env_index, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %46, i32 %47
  store i8* null, i8** %arrayidx55, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end51
  %48 = load i8**, i8*** @export_env, align 4
  store i8** %48, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %cond.end, %if.then
  %49 = load i8**, i8*** %retval, align 4
  ret i8** %49
}

declare i8** @strvec_resize(i8**, i32) #1

; Function Attrs: noinline nounwind
define i32 @chkexport(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 1
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* @array_needs_making, align 4
  call void @maybe_make_export_env()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

declare void @strvec_flush(i8**) #1

; Function Attrs: noinline nounwind
define internal i32 @n_shell_variables() #0 {
entry:
  %vc = alloca %struct.var_context*, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %n, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %0, %struct.var_context** %vc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %tobool = icmp ne %struct.var_context* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 5
  %3 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %tobool1 = icmp ne %struct.hash_table* %3, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %4 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table2 = getelementptr inbounds %struct.var_context, %struct.var_context* %4, i32 0, i32 5
  %5 = load %struct.hash_table*, %struct.hash_table** %table2, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 2
  %6 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %6, %cond.true ], [ 0, %cond.false ]
  %7 = load i32, i32* %n, align 4
  %add = add nsw i32 %7, %cond
  store i32 %add, i32* %n, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %8 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 4
  %9 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %9, %struct.var_context** %vc, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %n, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define %struct.var_context* @new_var_context(i8* %name, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %vc = alloca %struct.var_context*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4570)
  %0 = bitcast i8* %call to %struct.var_context*
  store %struct.var_context* %0, %struct.var_context** %vc, align 4
  %1 = load i8*, i8** %name.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call1 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4571)
  %3 = load i8*, i8** %name.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call3, %cond.true ], [ null, %cond.false ]
  %4 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %name4 = getelementptr inbounds %struct.var_context, %struct.var_context* %4, i32 0, i32 0
  store i8* %cond, i8** %name4, align 4
  %5 = load i32, i32* @variable_context, align 4
  %6 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %scope = getelementptr inbounds %struct.var_context, %struct.var_context* %6, i32 0, i32 1
  store i32 %5, i32* %scope, align 4
  %7 = load i32, i32* %flags.addr, align 4
  %8 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags5 = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 2
  store i32 %7, i32* %flags5, align 4
  %9 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %9, i32 0, i32 4
  store %struct.var_context* null, %struct.var_context** %down, align 4
  %10 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %up = getelementptr inbounds %struct.var_context, %struct.var_context* %10, i32 0, i32 3
  store %struct.var_context* null, %struct.var_context** %up, align 4
  %11 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %11, i32 0, i32 5
  store %struct.hash_table* null, %struct.hash_table** %table, align 4
  %12 = load %struct.var_context*, %struct.var_context** %vc, align 4
  ret %struct.var_context* %12
}

; Function Attrs: noinline nounwind
define internal i8** @make_var_export_array(%struct.var_context* %vcxt) #0 {
entry:
  %retval = alloca i8**, align 4
  %vcxt.addr = alloca %struct.var_context*, align 4
  %list = alloca i8**, align 4
  %vars = alloca %struct.variable**, align 4
  store %struct.var_context* %vcxt, %struct.var_context** %vcxt.addr, align 4
  %0 = load %struct.var_context*, %struct.var_context** %vcxt.addr, align 4
  %call = call %struct.variable** @map_over(i32 (%struct.variable*)* @export_environment_candidate, %struct.var_context* %0)
  store %struct.variable** %call, %struct.variable*** %vars, align 4
  %1 = load %struct.variable**, %struct.variable*** %vars, align 4
  %cmp = icmp eq %struct.variable** %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.variable**, %struct.variable*** %vars, align 4
  %call1 = call i8** @make_env_array_from_var_list(%struct.variable** %2)
  store i8** %call1, i8*** %list, align 4
  %3 = load %struct.variable**, %struct.variable*** %vars, align 4
  %4 = bitcast %struct.variable** %3 to i8*
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4331)
  %5 = load i8**, i8*** %list, align 4
  store i8** %5, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i8**, i8*** %retval, align 4
  ret i8** %6
}

; Function Attrs: noinline nounwind
define internal void @add_temp_array_to_env(i8** %temp_array, i32 %do_alloc, i32 %do_supercede) #0 {
entry:
  %temp_array.addr = alloca i8**, align 4
  %do_alloc.addr = alloca i32, align 4
  %do_supercede.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8** %temp_array, i8*** %temp_array.addr, align 4
  store i32 %do_alloc, i32* %do_alloc.addr, align 4
  store i32 %do_supercede, i32* %do_supercede.addr, align 4
  %0 = load i8**, i8*** %temp_array.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8**, i8*** %temp_array.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %do_supercede.addr, align 4
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %for.body
  %5 = load i8**, i8*** %temp_array.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx3, align 4
  %8 = load i32, i32* %do_alloc.addr, align 4
  %call = call i8** @add_or_supercede_exported_var(i8* %7, i32 %8)
  store i8** %call, i8*** @export_env, align 4
  br label %if.end18

if.else:                                          ; preds = %for.body
  br label %do.body

do.body:                                          ; preds = %if.else
  %9 = load i32, i32* @export_env_index, align 4
  %10 = load i32, i32* @export_env_size, align 4
  %sub = sub nsw i32 %10, 1
  %cmp4 = icmp sge i32 %9, %sub
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %do.body
  %11 = load i32, i32* @export_env_size, align 4
  %add = add nsw i32 %11, 16
  store i32 %add, i32* @export_env_size, align 4
  %12 = load i8**, i8*** @export_env, align 4
  %13 = load i32, i32* @export_env_size, align 4
  %call6 = call i8** @strvec_resize(i8** %12, i32 %13)
  store i8** %call6, i8*** @export_env, align 4
  %14 = load i8**, i8*** @export_env, align 4
  store i8** %14, i8*** @environ, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %do.body
  %15 = load i32, i32* %do_alloc.addr, align 4
  %tobool8 = icmp ne i32 %15, 0
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end7
  %16 = load i8**, i8*** %temp_array.addr, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx9, align 4
  %call10 = call i32 @strlen(i8* %18)
  %add11 = add i32 1, %call10
  %call12 = call i8* @sh_xmalloc(i32 %add11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4414)
  %19 = load i8**, i8*** %temp_array.addr, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx13, align 4
  %call14 = call i8* @strcpy(i8* %call12, i8* %21)
  br label %cond.end

cond.false:                                       ; preds = %if.end7
  %22 = load i8**, i8*** %temp_array.addr, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx15, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call14, %cond.true ], [ %24, %cond.false ]
  %25 = load i8**, i8*** @export_env, align 4
  %26 = load i32, i32* @export_env_index, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* @export_env_index, align 4
  %arrayidx16 = getelementptr inbounds i8*, i8** %25, i32 %26
  store i8* %cond, i8** %arrayidx16, align 4
  %27 = load i8**, i8*** @export_env, align 4
  %28 = load i32, i32* @export_env_index, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %27, i32 %28
  store i8* null, i8** %arrayidx17, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  br label %if.end18

if.end18:                                         ; preds = %do.end, %if.then2
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %29 = load i32, i32* %i, align 4
  %inc19 = add nsw i32 %29, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %30 = load i8**, i8*** %temp_array.addr, align 4
  %31 = bitcast i8** %30 to i8*
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4417)
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal i8** @make_func_export_array() #0 {
entry:
  %retval = alloca i8**, align 4
  %list = alloca i8**, align 4
  %vars = alloca %struct.variable**, align 4
  %call = call %struct.variable** @map_over_funcs(i32 (%struct.variable*)* @visible_and_exported)
  store %struct.variable** %call, %struct.variable*** %vars, align 4
  %0 = load %struct.variable**, %struct.variable*** %vars, align 4
  %cmp = icmp eq %struct.variable** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.variable**, %struct.variable*** %vars, align 4
  %call1 = call i8** @make_env_array_from_var_list(%struct.variable** %1)
  store i8** %call1, i8*** %list, align 4
  %2 = load %struct.variable**, %struct.variable*** %vars, align 4
  %3 = bitcast %struct.variable** %2 to i8*
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4347)
  %4 = load i8**, i8*** %list, align 4
  store i8** %4, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i8**, i8*** %retval, align 4
  ret i8** %5
}

; Function Attrs: noinline nounwind
define void @update_export_env_inplace(i8* %env_prefix, i32 %preflen, i8* %value) #0 {
entry:
  %env_prefix.addr = alloca i8*, align 4
  %preflen.addr = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  %evar = alloca i8*, align 4
  store i8* %env_prefix, i8** %env_prefix.addr, align 4
  store i32 %preflen, i32* %preflen.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false13

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false13

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %value.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %4 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %cond.true5, label %cond.false10

cond.true5:                                       ; preds = %cond.true
  %5 = load i8*, i8** %value.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i32 2
  %6 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %6 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false

cond.true9:                                       ; preds = %cond.true5
  %7 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %7)
  br label %cond.end

cond.false:                                       ; preds = %cond.true5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true9
  %cond = phi i32 [ %call, %cond.true9 ], [ 2, %cond.false ]
  br label %cond.end11

cond.false10:                                     ; preds = %cond.true
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.end
  %cond12 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false10 ]
  br label %cond.end14

cond.false13:                                     ; preds = %land.lhs.true, %entry
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false13, %cond.end11
  %cond15 = phi i32 [ %cond12, %cond.end11 ], [ 0, %cond.false13 ]
  %8 = load i32, i32* %preflen.addr, align 4
  %add = add i32 %cond15, %8
  %add16 = add i32 %add, 1
  %call17 = call i8* @sh_xmalloc(i32 %add16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4539)
  store i8* %call17, i8** %evar, align 4
  %9 = load i8*, i8** %evar, align 4
  %10 = load i8*, i8** %env_prefix.addr, align 4
  %call18 = call i8* @strcpy(i8* %9, i8* %10)
  %11 = load i8*, i8** %value.addr, align 4
  %tobool19 = icmp ne i8* %11, null
  br i1 %tobool19, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end14
  %12 = load i8*, i8** %evar, align 4
  %13 = load i32, i32* %preflen.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8*, i8** %value.addr, align 4
  %call20 = call i8* @strcpy(i8* %add.ptr, i8* %14)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end14
  %15 = load i8*, i8** %evar, align 4
  %call21 = call i8** @add_or_supercede_exported_var(i8* %15, i32 0)
  store i8** %call21, i8*** @export_env, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @put_command_name_into_env(i8* %command_name) #0 {
entry:
  %command_name.addr = alloca i8*, align 4
  store i8* %command_name, i8** %command_name.addr, align 4
  %0 = load i8*, i8** %command_name.addr, align 4
  call void @update_export_env_inplace(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.67, i32 0, i32 0), i32 2, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @dispose_var_context(%struct.var_context* %vc) #0 {
entry:
  %vc.addr = alloca %struct.var_context*, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %name = getelementptr inbounds %struct.var_context, %struct.var_context* %0, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %name1 = getelementptr inbounds %struct.var_context, %struct.var_context* %2, i32 0, i32 0
  %3 = load i8*, i8** %name1, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4587)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %4 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %4, i32 0, i32 5
  %5 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %tobool2 = icmp ne %struct.hash_table* %5, null
  br i1 %tobool2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %do.end
  %6 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %table4 = getelementptr inbounds %struct.var_context, %struct.var_context* %6, i32 0, i32 5
  %7 = load %struct.hash_table*, %struct.hash_table** %table4, align 4
  call void @delete_all_variables(%struct.hash_table* %7)
  %8 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %table5 = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 5
  %9 = load %struct.hash_table*, %struct.hash_table** %table5, align 4
  call void @hash_dispose(%struct.hash_table* %9)
  br label %if.end6

if.end6:                                          ; preds = %if.then3, %do.end
  %10 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %11 = bitcast %struct.var_context* %10 to i8*
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4595)
  ret void
}

; Function Attrs: noinline nounwind
define %struct.var_context* @push_var_context(i8* %name, i32 %flags, %struct.hash_table* %tempvars) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %tempvars.addr = alloca %struct.hash_table*, align 4
  %vc = alloca %struct.var_context*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.hash_table* %tempvars, %struct.hash_table** %tempvars.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %1 = load i32, i32* %flags.addr, align 4
  %call = call %struct.var_context* @new_var_context(i8* %0, i32 %1)
  store %struct.var_context* %call, %struct.var_context** %vc, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** %tempvars.addr, align 4
  %3 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 5
  store %struct.hash_table* %2, %struct.hash_table** %table, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %tempvars.addr, align 4
  %tobool = icmp ne %struct.hash_table* %4, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load %struct.hash_table*, %struct.hash_table** %tempvars.addr, align 4
  call void @flatten(%struct.hash_table* %5, i32 (%struct.variable*)* @set_context, %struct._vlist* null, i32 0)
  %6 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %flags1 = getelementptr inbounds %struct.var_context, %struct.var_context* %6, i32 0, i32 2
  %7 = load i32, i32* %flags1, align 4
  %or = or i32 %7, 2
  store i32 %or, i32* %flags1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %9 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %9, i32 0, i32 4
  store %struct.var_context* %8, %struct.var_context** %down, align 4
  %10 = load %struct.var_context*, %struct.var_context** %vc, align 4
  %11 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %up = getelementptr inbounds %struct.var_context, %struct.var_context* %11, i32 0, i32 3
  store %struct.var_context* %10, %struct.var_context** %up, align 4
  %12 = load %struct.var_context*, %struct.var_context** %vc, align 4
  store %struct.var_context* %12, %struct.var_context** @shell_variables, align 4
  ret %struct.var_context* %12
}

; Function Attrs: noinline nounwind
define internal i32 @set_context(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load i32, i32* @variable_context, align 4
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 6
  store i32 %0, i32* %context, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define void @pop_var_context() #0 {
entry:
  %ret = alloca %struct.var_context*, align 4
  %vcxt = alloca %struct.var_context*, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %0, %struct.var_context** %vcxt, align 4
  %1 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %1, i32 0, i32 2
  %2 = load i32, i32* %flags, align 4
  %and = and i32 %2, 4
  %cmp = icmp ne i32 %and, 0
  %conv = zext i1 %cmp to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.68, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call)
  br label %if.end9

if.end:                                           ; preds = %entry
  %3 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 4
  %4 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %4, %struct.var_context** %ret, align 4
  %tobool = icmp ne %struct.var_context* %4, null
  br i1 %tobool, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %5 = load %struct.var_context*, %struct.var_context** %ret, align 4
  %up = getelementptr inbounds %struct.var_context, %struct.var_context* %5, i32 0, i32 3
  store %struct.var_context* null, %struct.var_context** %up, align 4
  %6 = load %struct.var_context*, %struct.var_context** %ret, align 4
  store %struct.var_context* %6, %struct.var_context** @shell_variables, align 4
  %7 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %7, i32 0, i32 5
  %8 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %tobool4 = icmp ne %struct.hash_table* %8, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.then3
  %9 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %table6 = getelementptr inbounds %struct.var_context, %struct.var_context* %9, i32 0, i32 5
  %10 = load %struct.hash_table*, %struct.hash_table** %table6, align 4
  call void @hash_flush(%struct.hash_table* %10, void (i8*)* @push_func_var)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.then3
  %11 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  call void @dispose_var_context(%struct.var_context* %11)
  br label %if.end9

if.else:                                          ; preds = %if.end
  %call8 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.69, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call8)
  br label %if.end9

if.end9:                                          ; preds = %if.then, %if.else, %if.end7
  ret void
}

; Function Attrs: noinline nounwind
define internal void @push_func_var(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.variable*
  store %struct.variable* %1, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 32
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 0
  %5 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.108, i32 0, i32 0), align 1
  %conv1 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %land.lhs.true3, label %if.else

land.lhs.true3:                                   ; preds = %land.lhs.true
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  %name4 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 0
  %9 = load i8*, i8** %name4, align 4
  %call = call i32 @strcmp(i8* %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.108, i32 0, i32 0))
  %cmp5 = icmp eq i32 %call, 0
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true3
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 1
  %11 = load i8*, i8** %value, align 4
  call void @set_current_options(i8* %11)
  br label %if.end77

if.else:                                          ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes7 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes7, align 4
  %and8 = and i32 %13, 1048576
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %land.lhs.true10, label %if.else74

land.lhs.true10:                                  ; preds = %if.else
  %14 = load i32, i32* @posixly_correct, align 4
  %tobool11 = icmp ne i32 %14, 0
  br i1 %tobool11, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true10
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes12 = getelementptr inbounds %struct.variable, %struct.variable* %15, i32 0, i32 5
  %16 = load i32, i32* %attributes12, align 4
  %and13 = and i32 %16, 2097152
  %tobool14 = icmp ne i32 %and13, 0
  br i1 %tobool14, label %if.then15, label %if.else74

if.then15:                                        ; preds = %lor.lhs.false, %land.lhs.true10
  %17 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %17, i32 0, i32 2
  %18 = load i32, i32* %flags, align 4
  %and16 = and i32 %18, 4
  %cmp17 = icmp ne i32 %and16, 0
  br i1 %cmp17, label %land.lhs.true24, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %if.then15
  %19 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %flags20 = getelementptr inbounds %struct.var_context, %struct.var_context* %19, i32 0, i32 2
  %20 = load i32, i32* %flags20, align 4
  %and21 = and i32 %20, 28
  %cmp22 = icmp eq i32 %and21, 16
  br i1 %cmp22, label %land.lhs.true24, label %if.end

land.lhs.true24:                                  ; preds = %lor.lhs.false19, %if.then15
  %21 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %21, i32 0, i32 5
  %22 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %cmp25 = icmp eq %struct.hash_table* %22, null
  br i1 %cmp25, label %if.then27, label %if.end

if.then27:                                        ; preds = %land.lhs.true24
  %call28 = call %struct.hash_table* @hash_create(i32 1024)
  %23 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table29 = getelementptr inbounds %struct.var_context, %struct.var_context* %23, i32 0, i32 5
  store %struct.hash_table* %call28, %struct.hash_table** %table29, align 4
  br label %if.end

if.end:                                           ; preds = %if.then27, %land.lhs.true24, %lor.lhs.false19
  %24 = load %struct.variable*, %struct.variable** %var, align 4
  %name30 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 0
  %25 = load i8*, i8** %name30, align 4
  %26 = load %struct.variable*, %struct.variable** %var, align 4
  %value31 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 1
  %27 = load i8*, i8** %value31, align 4
  %28 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table32 = getelementptr inbounds %struct.var_context, %struct.var_context* %28, i32 0, i32 5
  %29 = load %struct.hash_table*, %struct.hash_table** %table32, align 4
  %call33 = call %struct.variable* @bind_variable_internal(i8* %25, i8* %27, %struct.hash_table* %29, i32 0, i32 0)
  store %struct.variable* %call33, %struct.variable** %v, align 4
  %30 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes34 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes34, align 4
  %and35 = and i32 %31, 4
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %if.then41, label %lor.lhs.false37

lor.lhs.false37:                                  ; preds = %if.end
  %32 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes38 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 5
  %33 = load i32, i32* %attributes38, align 4
  %and39 = and i32 %33, 64
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %if.then41, label %if.end59

if.then41:                                        ; preds = %lor.lhs.false37, %if.end
  br label %do.body

do.body:                                          ; preds = %if.then41
  %34 = load %struct.variable*, %struct.variable** %v, align 4
  %value42 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 1
  %35 = load i8*, i8** %value42, align 4
  %tobool43 = icmp ne i8* %35, null
  br i1 %tobool43, label %if.then44, label %if.end46

if.then44:                                        ; preds = %do.body
  %36 = load %struct.variable*, %struct.variable** %v, align 4
  %value45 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 1
  %37 = load i8*, i8** %value45, align 4
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4654)
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end46
  %38 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes47 = getelementptr inbounds %struct.variable, %struct.variable* %38, i32 0, i32 5
  %39 = load i32, i32* %attributes47, align 4
  %and48 = and i32 %39, 4
  %tobool49 = icmp ne i32 %and48, 0
  br i1 %tobool49, label %if.then50, label %if.else54

if.then50:                                        ; preds = %do.end
  %40 = load %struct.variable*, %struct.variable** %var, align 4
  %value51 = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 1
  %41 = load i8*, i8** %value51, align 4
  %42 = bitcast i8* %41 to %struct.array*
  %call52 = call %struct.array* @array_copy(%struct.array* %42)
  %43 = bitcast %struct.array* %call52 to i8*
  %44 = load %struct.variable*, %struct.variable** %v, align 4
  %value53 = getelementptr inbounds %struct.variable, %struct.variable* %44, i32 0, i32 1
  store i8* %43, i8** %value53, align 4
  br label %if.end58

if.else54:                                        ; preds = %do.end
  %45 = load %struct.variable*, %struct.variable** %var, align 4
  %value55 = getelementptr inbounds %struct.variable, %struct.variable* %45, i32 0, i32 1
  %46 = load i8*, i8** %value55, align 4
  %47 = bitcast i8* %46 to %struct.hash_table*
  %call56 = call %struct.hash_table* @hash_copy(%struct.hash_table* %47, i8* (i8*)* null)
  %48 = bitcast %struct.hash_table* %call56 to i8*
  %49 = load %struct.variable*, %struct.variable** %v, align 4
  %value57 = getelementptr inbounds %struct.variable, %struct.variable* %49, i32 0, i32 1
  store i8* %48, i8** %value57, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.else54, %if.then50
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %lor.lhs.false37
  %50 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %51 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %cmp60 = icmp eq %struct.var_context* %50, %51
  br i1 %cmp60, label %if.then62, label %if.else65

if.then62:                                        ; preds = %if.end59
  %52 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes63 = getelementptr inbounds %struct.variable, %struct.variable* %52, i32 0, i32 5
  %53 = load i32, i32* %attributes63, align 4
  %and64 = and i32 %53, -3145729
  store i32 %and64, i32* %attributes63, align 4
  br label %if.end67

if.else65:                                        ; preds = %if.end59
  %54 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %flags66 = getelementptr inbounds %struct.var_context, %struct.var_context* %54, i32 0, i32 2
  %55 = load i32, i32* %flags66, align 4
  %or = or i32 %55, 2
  store i32 %or, i32* %flags66, align 4
  br label %if.end67

if.end67:                                         ; preds = %if.else65, %if.then62
  %56 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool68 = icmp ne %struct.variable* %56, null
  br i1 %tobool68, label %if.then69, label %if.end73

if.then69:                                        ; preds = %if.end67
  %57 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes70 = getelementptr inbounds %struct.variable, %struct.variable* %57, i32 0, i32 5
  %58 = load i32, i32* %attributes70, align 4
  %59 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes71 = getelementptr inbounds %struct.variable, %struct.variable* %59, i32 0, i32 5
  %60 = load i32, i32* %attributes71, align 4
  %or72 = or i32 %60, %58
  store i32 %or72, i32* %attributes71, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then69, %if.end67
  br label %if.end76

if.else74:                                        ; preds = %lor.lhs.false, %if.else
  %61 = load %struct.variable*, %struct.variable** %var, align 4
  %name75 = getelementptr inbounds %struct.variable, %struct.variable* %61, i32 0, i32 0
  %62 = load i8*, i8** %name75, align 4
  call void @stupidly_hack_special_variables(i8* %62)
  br label %if.end76

if.end76:                                         ; preds = %if.else74, %if.end73
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.then
  %63 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable(%struct.variable* %63)
  ret void
}

; Function Attrs: noinline nounwind
define void @delete_all_contexts(%struct.var_context* %vcxt) #0 {
entry:
  %vcxt.addr = alloca %struct.var_context*, align 4
  %v = alloca %struct.var_context*, align 4
  %t = alloca %struct.var_context*, align 4
  store %struct.var_context* %vcxt, %struct.var_context** %vcxt.addr, align 4
  %0 = load %struct.var_context*, %struct.var_context** %vcxt.addr, align 4
  store %struct.var_context* %0, %struct.var_context** %v, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.var_context*, %struct.var_context** %v, align 4
  %2 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %cmp = icmp ne %struct.var_context* %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.var_context*, %struct.var_context** %v, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 4
  %4 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %4, %struct.var_context** %t, align 4
  %5 = load %struct.var_context*, %struct.var_context** %v, align 4
  call void @dispose_var_context(%struct.var_context* %5)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load %struct.var_context*, %struct.var_context** %t, align 4
  store %struct.var_context* %6, %struct.var_context** %v, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %7, i32 0, i32 5
  %8 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  call void @delete_all_variables(%struct.hash_table* %8)
  %9 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  store %struct.var_context* %9, %struct.var_context** @shell_variables, align 4
  ret void
}

; Function Attrs: noinline nounwind
define %struct.var_context* @push_scope(i32 %flags, %struct.hash_table* %tmpvars) #0 {
entry:
  %flags.addr = alloca i32, align 4
  %tmpvars.addr = alloca %struct.hash_table*, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.hash_table* %tmpvars, %struct.hash_table** %tmpvars.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** %tmpvars.addr, align 4
  %call = call %struct.var_context* @push_var_context(i8* null, i32 %0, %struct.hash_table* %1)
  ret %struct.var_context* %call
}

; Function Attrs: noinline nounwind
define void @pop_scope(i32 %is_special) #0 {
entry:
  %is_special.addr = alloca i32, align 4
  %vcxt = alloca %struct.var_context*, align 4
  %ret = alloca %struct.var_context*, align 4
  store i32 %is_special, i32* %is_special.addr, align 4
  %0 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  store %struct.var_context* %0, %struct.var_context** %vcxt, align 4
  %1 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %flags = getelementptr inbounds %struct.var_context, %struct.var_context* %1, i32 0, i32 2
  %2 = load i32, i32* %flags, align 4
  %and = and i32 %2, 24
  %cmp = icmp ne i32 %and, 0
  %conv = zext i1 %cmp to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.70, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call)
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %down = getelementptr inbounds %struct.var_context, %struct.var_context* %3, i32 0, i32 4
  %4 = load %struct.var_context*, %struct.var_context** %down, align 4
  store %struct.var_context* %4, %struct.var_context** %ret, align 4
  %5 = load %struct.var_context*, %struct.var_context** %ret, align 4
  %tobool = icmp ne %struct.var_context* %5, null
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %6 = load %struct.var_context*, %struct.var_context** %ret, align 4
  %up = getelementptr inbounds %struct.var_context, %struct.var_context* %6, i32 0, i32 3
  store %struct.var_context* null, %struct.var_context** %up, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %7 = load %struct.var_context*, %struct.var_context** %ret, align 4
  store %struct.var_context* %7, %struct.var_context** @shell_variables, align 4
  br label %do.body

do.body:                                          ; preds = %if.end4
  %8 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %name = getelementptr inbounds %struct.var_context, %struct.var_context* %8, i32 0, i32 0
  %9 = load i8*, i8** %name, align 4
  %tobool5 = icmp ne i8* %9, null
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %do.body
  %10 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %name7 = getelementptr inbounds %struct.var_context, %struct.var_context* %10, i32 0, i32 0
  %11 = load i8*, i8** %name7, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4784)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end8
  %12 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %12, i32 0, i32 5
  %13 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %tobool9 = icmp ne %struct.hash_table* %13, null
  br i1 %tobool9, label %if.then10, label %if.end17

if.then10:                                        ; preds = %do.end
  %14 = load i32, i32* %is_special.addr, align 4
  %tobool11 = icmp ne i32 %14, 0
  br i1 %tobool11, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.then10
  %15 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %table13 = getelementptr inbounds %struct.var_context, %struct.var_context* %15, i32 0, i32 5
  %16 = load %struct.hash_table*, %struct.hash_table** %table13, align 4
  call void @hash_flush(%struct.hash_table* %16, void (i8*)* @push_func_var)
  br label %if.end15

if.else:                                          ; preds = %if.then10
  %17 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %table14 = getelementptr inbounds %struct.var_context, %struct.var_context* %17, i32 0, i32 5
  %18 = load %struct.hash_table*, %struct.hash_table** %table14, align 4
  call void @hash_flush(%struct.hash_table* %18, void (i8*)* @push_exported_var)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then12
  %19 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %table16 = getelementptr inbounds %struct.var_context, %struct.var_context* %19, i32 0, i32 5
  %20 = load %struct.hash_table*, %struct.hash_table** %table16, align 4
  call void @hash_dispose(%struct.hash_table* %20)
  br label %if.end17

if.end17:                                         ; preds = %if.end15, %do.end
  %21 = load %struct.var_context*, %struct.var_context** %vcxt, align 4
  %22 = bitcast %struct.var_context* %21 to i8*
  call void @sh_xfree(i8* %22, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4793)
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.end17, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @push_exported_var(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct.variable*
  store %struct.variable* %1, %struct.variable** %var, align 4
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 1048576
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %5, 1
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true
  %6 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes5 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes5, align 4
  %and6 = and i32 %7, 2097152
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true4
  %8 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes8 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 5
  %9 = load i32, i32* %attributes8, align 4
  %and9 = and i32 %9, -1048577
  store i32 %and9, i32* %attributes8, align 4
  %10 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 0
  %11 = load i8*, i8** %name, align 4
  %12 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 1
  %13 = load i8*, i8** %value, align 4
  %14 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %14, i32 0, i32 5
  %15 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.variable* @bind_variable_internal(i8* %11, i8* %13, %struct.hash_table* %15, i32 0, i32 0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %16 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  %17 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  %cmp = icmp eq %struct.var_context* %16, %17
  br i1 %cmp, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then
  %18 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes11 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes11, align 4
  %and12 = and i32 %19, -2097153
  store i32 %and12, i32* %attributes11, align 4
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.then
  %20 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool13 = icmp ne %struct.variable* %20, null
  br i1 %tobool13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.end
  %21 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes15 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 5
  %22 = load i32, i32* %attributes15, align 4
  %23 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes16 = getelementptr inbounds %struct.variable, %struct.variable* %23, i32 0, i32 5
  %24 = load i32, i32* %attributes16, align 4
  %or = or i32 %24, %22
  store i32 %or, i32* %attributes16, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then14, %if.end
  br label %if.end19

if.else:                                          ; preds = %land.lhs.true4, %land.lhs.true, %entry
  %25 = load %struct.variable*, %struct.variable** %var, align 4
  %name18 = getelementptr inbounds %struct.variable, %struct.variable* %25, i32 0, i32 0
  %26 = load i8*, i8** %name18, align 4
  call void @stupidly_hack_special_variables(i8* %26)
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.end17
  %27 = load %struct.variable*, %struct.variable** %var, align 4
  call void @dispose_variable(%struct.variable* %27)
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_ifs(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  call void @setifs(%struct.variable* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @push_context(i8* %name, i32 %is_subshell, %struct.hash_table* %tempvars) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %is_subshell.addr = alloca i32, align 4
  %tempvars.addr = alloca %struct.hash_table*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %is_subshell, i32* %is_subshell.addr, align 4
  store %struct.hash_table* %tempvars, %struct.hash_table** %tempvars.addr, align 4
  %0 = load i32, i32* %is_subshell.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @push_dollar_vars()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @variable_context, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @variable_context, align 4
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** %tempvars.addr, align 4
  %call = call %struct.var_context* @push_var_context(i8* %2, i32 4, %struct.hash_table* %3)
  ret void
}

; Function Attrs: noinline nounwind
define void @push_dollar_vars() #0 {
entry:
  %0 = load i32, i32* @dollar_arg_stack_index, align 4
  %add = add nsw i32 %0, 2
  %1 = load i32, i32* @dollar_arg_stack_slots, align 4
  %cmp = icmp sgt i32 %add, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %3 = bitcast %struct.word_list** %2 to i8*
  %4 = load i32, i32* @dollar_arg_stack_slots, align 4
  %add1 = add nsw i32 %4, 10
  store i32 %add1, i32* @dollar_arg_stack_slots, align 4
  %mul = mul i32 %add1, 4
  %call = call i8* @sh_xrealloc(i8* %3, i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4841)
  %5 = bitcast i8* %call to %struct.word_list**
  store %struct.word_list** %5, %struct.word_list*** @dollar_arg_stack, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call2 = call %struct.word_list* @list_rest_of_args()
  %6 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %7 = load i32, i32* @dollar_arg_stack_index, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @dollar_arg_stack_index, align 4
  %arrayidx = getelementptr inbounds %struct.word_list*, %struct.word_list** %6, i32 %7
  store %struct.word_list* %call2, %struct.word_list** %arrayidx, align 4
  %8 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %9 = load i32, i32* @dollar_arg_stack_index, align 4
  %arrayidx3 = getelementptr inbounds %struct.word_list*, %struct.word_list** %8, i32 %9
  store %struct.word_list* null, %struct.word_list** %arrayidx3, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @pop_context() #0 {
entry:
  call void @pop_dollar_vars()
  %0 = load i32, i32* @variable_context, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @variable_context, align 4
  call void @pop_var_context()
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define void @pop_dollar_vars() #0 {
entry:
  %0 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %tobool = icmp ne %struct.word_list** %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @dollar_arg_stack_index, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %3 = load i32, i32* @dollar_arg_stack_index, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* @dollar_arg_stack_index, align 4
  %arrayidx = getelementptr inbounds %struct.word_list*, %struct.word_list** %2, i32 %dec
  %4 = load %struct.word_list*, %struct.word_list** %arrayidx, align 4
  call void @remember_args(%struct.word_list* %4, i32 1)
  %5 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %6 = load i32, i32* @dollar_arg_stack_index, align 4
  %arrayidx1 = getelementptr inbounds %struct.word_list*, %struct.word_list** %5, i32 %6
  %7 = load %struct.word_list*, %struct.word_list** %arrayidx1, align 4
  call void @dispose_words(%struct.word_list* %7)
  %8 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %9 = load i32, i32* @dollar_arg_stack_index, align 4
  %arrayidx2 = getelementptr inbounds %struct.word_list*, %struct.word_list** %8, i32 %9
  store %struct.word_list* null, %struct.word_list** %arrayidx2, align 4
  call void @set_dollar_vars_unchanged()
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare %struct.word_list* @list_rest_of_args() #1

declare void @remember_args(%struct.word_list*, i32) #1

declare void @dispose_words(%struct.word_list*) #1

declare void @set_dollar_vars_unchanged() #1

; Function Attrs: noinline nounwind
define void @dispose_saved_dollar_vars() #0 {
entry:
  %0 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %tobool = icmp ne %struct.word_list** %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @dollar_arg_stack_index, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %3 = load i32, i32* @dollar_arg_stack_index, align 4
  %arrayidx = getelementptr inbounds %struct.word_list*, %struct.word_list** %2, i32 %3
  %4 = load %struct.word_list*, %struct.word_list** %arrayidx, align 4
  call void @dispose_words(%struct.word_list* %4)
  %5 = load %struct.word_list**, %struct.word_list*** @dollar_arg_stack, align 4
  %6 = load i32, i32* @dollar_arg_stack_index, align 4
  %arrayidx1 = getelementptr inbounds %struct.word_list*, %struct.word_list** %5, i32 %6
  store %struct.word_list* null, %struct.word_list** %arrayidx1, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @push_args(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %bash_argv_v = alloca %struct.variable*, align 4
  %bash_argc_v = alloca %struct.variable*, align 4
  %bash_argv_a = alloca %struct.array*, align 4
  %bash_argc_a = alloca %struct.array*, align 4
  %l = alloca %struct.word_list*, align 4
  %i = alloca i64, align 8
  %t = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.71, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %bash_argv_v, align 4
  %0 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %do.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %5, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %bash_argv_a, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %call3 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i32 0, i32 0))
  store %struct.variable* %call3, %struct.variable** %bash_argc_v, align 4
  %6 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %tobool4 = icmp ne %struct.variable* %6, null
  br i1 %tobool4, label %land.lhs.true5, label %cond.false11

land.lhs.true5:                                   ; preds = %do.body2
  %7 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %8, 4
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %land.lhs.true5
  %9 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %value10 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value10, align 4
  %11 = bitcast i8* %10 to %struct.array*
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true5, %do.body2
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi %struct.array* [ %11, %cond.true9 ], [ null, %cond.false11 ]
  store %struct.array* %cond13, %struct.array** %bash_argc_a, align 4
  br label %do.end14

do.end14:                                         ; preds = %cond.end12
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %12, %struct.word_list** %l, align 4
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end14
  %13 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool15 = icmp ne %struct.word_list* %13, null
  br i1 %tobool15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body16

do.body16:                                        ; preds = %for.body
  %14 = load %struct.array*, %struct.array** %bash_argv_a, align 4
  %15 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word17 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word17, align 4
  %call18 = call i32 @array_rshift(%struct.array* %14, i32 1, i8* %17)
  br label %do.end19

do.end19:                                         ; preds = %do.body16
  br label %for.inc

for.inc:                                          ; preds = %do.end19
  %18 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 0
  %19 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %19, %struct.word_list** %l, align 4
  %20 = load i64, i64* %i, align 8
  %inc = add nsw i64 %20, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load i64, i64* %i, align 8
  %call20 = call i8* @itos(i64 %21)
  store i8* %call20, i8** %t, align 4
  br label %do.body21

do.body21:                                        ; preds = %for.end
  %22 = load %struct.array*, %struct.array** %bash_argc_a, align 4
  %23 = load i8*, i8** %t, align 4
  %call22 = call i32 @array_rshift(%struct.array* %22, i32 1, i8* %23)
  br label %do.end23

do.end23:                                         ; preds = %do.body21
  %24 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4891)
  ret void
}

declare i32 @array_rshift(%struct.array*, i32, i8*) #1

; Function Attrs: noinline nounwind
define void @pop_args() #0 {
entry:
  %bash_argv_v = alloca %struct.variable*, align 4
  %bash_argc_v = alloca %struct.variable*, align 4
  %bash_argv_a = alloca %struct.array*, align 4
  %bash_argc_a = alloca %struct.array*, align 4
  %ce = alloca %struct.array_element*, align 4
  %i = alloca i64, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.71, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %bash_argv_v, align 4
  %0 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load %struct.variable*, %struct.variable** %bash_argv_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %do.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %5, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %bash_argv_a, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %call3 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.72, i32 0, i32 0))
  store %struct.variable* %call3, %struct.variable** %bash_argc_v, align 4
  %6 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %tobool4 = icmp ne %struct.variable* %6, null
  br i1 %tobool4, label %land.lhs.true5, label %cond.false11

land.lhs.true5:                                   ; preds = %do.body2
  %7 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %attributes6 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes6, align 4
  %and7 = and i32 %8, 4
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %land.lhs.true5
  %9 = load %struct.variable*, %struct.variable** %bash_argc_v, align 4
  %value10 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value10, align 4
  %11 = bitcast i8* %10 to %struct.array*
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true5, %do.body2
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi %struct.array* [ %11, %cond.true9 ], [ null, %cond.false11 ]
  store %struct.array* %cond13, %struct.array** %bash_argc_a, align 4
  br label %do.end14

do.end14:                                         ; preds = %cond.end12
  %12 = load %struct.array*, %struct.array** %bash_argc_a, align 4
  %call15 = call %struct.array_element* @array_shift(%struct.array* %12, i32 1, i32 0)
  store %struct.array_element* %call15, %struct.array_element** %ce, align 4
  %13 = load %struct.array_element*, %struct.array_element** %ce, align 4
  %cmp = icmp eq %struct.array_element* %13, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end14
  %14 = load %struct.array_element*, %struct.array_element** %ce, align 4
  %value16 = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 1
  %15 = load i8*, i8** %value16, align 8
  %call17 = call i32 @legal_number(i8* %15, i64* %i)
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %do.end14
  store i64 0, i64* %i, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %16 = load i64, i64* %i, align 8
  %cmp19 = icmp sgt i64 %16, 0
  br i1 %cmp19, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body20

do.body20:                                        ; preds = %for.body
  %17 = load %struct.array*, %struct.array** %bash_argv_a, align 4
  %call21 = call %struct.array_element* @array_shift(%struct.array* %17, i32 1, i32 0)
  call void @array_dispose_element(%struct.array_element* %call21)
  br label %do.end22

do.end22:                                         ; preds = %do.body20
  br label %for.inc

for.inc:                                          ; preds = %do.end22
  %18 = load i64, i64* %i, align 8
  %dec = add nsw i64 %18, -1
  store i64 %dec, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load %struct.array_element*, %struct.array_element** %ce, align 4
  call void @array_dispose_element(%struct.array_element* %19)
  ret void
}

declare %struct.array_element* @array_shift(%struct.array*, i32, i32) #1

declare void @array_dispose_element(%struct.array_element*) #1

; Function Attrs: noinline nounwind
define internal i32 @sv_compare(%struct.name_and_function* %sv1, %struct.name_and_function* %sv2) #0 {
entry:
  %sv1.addr = alloca %struct.name_and_function*, align 4
  %sv2.addr = alloca %struct.name_and_function*, align 4
  %r = alloca i32, align 4
  store %struct.name_and_function* %sv1, %struct.name_and_function** %sv1.addr, align 4
  store %struct.name_and_function* %sv2, %struct.name_and_function** %sv2.addr, align 4
  %0 = load %struct.name_and_function*, %struct.name_and_function** %sv1.addr, align 4
  %name = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %0, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load %struct.name_and_function*, %struct.name_and_function** %sv2.addr, align 4
  %name1 = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %3, i32 0, i32 0
  %4 = load i8*, i8** %name1, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %5 to i32
  %sub = sub nsw i32 %conv, %conv3
  store i32 %sub, i32* %r, align 4
  %cmp = icmp eq i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load %struct.name_and_function*, %struct.name_and_function** %sv1.addr, align 4
  %name5 = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %6, i32 0, i32 0
  %7 = load i8*, i8** %name5, align 4
  %8 = load %struct.name_and_function*, %struct.name_and_function** %sv2.addr, align 4
  %name6 = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %8, i32 0, i32 0
  %9 = load i8*, i8** %name6, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  store i32 %call, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load i32, i32* %r, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal i32 @find_special_var(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [37 x %struct.name_and_function], [37 x %struct.name_and_function]* @special_vars, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [37 x %struct.name_and_function], [37 x %struct.name_and_function]* @special_vars, i32 0, i32 %2
  %name3 = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %arrayidx2, i32 0, i32 0
  %3 = load i8*, i8** %name3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx4, align 1
  %conv = sext i8 %4 to i32
  %5 = load i8*, i8** %name.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %6 to i32
  %sub = sub nsw i32 %conv, %conv6
  store i32 %sub, i32* %r, align 4
  %7 = load i32, i32* %r, align 4
  %cmp = icmp eq i32 %7, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [37 x %struct.name_and_function], [37 x %struct.name_and_function]* @special_vars, i32 0, i32 %8
  %name9 = getelementptr inbounds %struct.name_and_function, %struct.name_and_function* %arrayidx8, i32 0, i32 0
  %9 = load i8*, i8** %name9, align 4
  %10 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strcmp(i8* %9, i8* %10)
  store i32 %call, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %11 = load i32, i32* %r, align 4
  %cmp10 = icmp eq i32 %11, 0
  br i1 %cmp10, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  %13 = load i32, i32* %r, align 4
  %cmp13 = icmp sgt i32 %13, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.else
  br label %for.end

if.end16:                                         ; preds = %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then15, %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then12
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind
define void @reinit_special_variables() #0 {
entry:
  call void @sv_comp_wordbreaks(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.73, i32 0, i32 0))
  call void @sv_globignore(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.74, i32 0, i32 0))
  call void @sv_opterr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_comp_wordbreaks(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %sv = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %sv, align 4
  %1 = load %struct.variable*, %struct.variable** %sv, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @reset_completer_word_break_chars()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_globignore(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i32, i32* @privileged_mode, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  call void @setup_glob_ignore(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_opterr(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %tt = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.22, i32 0, i32 0))
  store i8* %call, i8** %tt, align 4
  %0 = load i8*, i8** %tt, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %tt, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %tt, align 4
  %call2 = call i32 @atoi(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* @sh_opterr, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_path(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  call void @phash_flush()
  ret void
}

declare void @phash_flush() #1

; Function Attrs: noinline nounwind
define void @sv_mail(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 4
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 67
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @reset_mail_timer()
  br label %if.end

if.else:                                          ; preds = %entry
  call void @free_mail_files()
  call void @remember_mail_dates()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare void @reset_mail_timer() #1

declare void @free_mail_files() #1

declare void @remember_mail_dates() #1

; Function Attrs: noinline nounwind
define void @sv_execignore(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  call void @setup_exec_ignore(i8* %0)
  ret void
}

declare void @setup_exec_ignore(i8*) #1

declare void @setup_glob_ignore(i8*) #1

declare void @reset_completer_word_break_chars() #1

; Function Attrs: noinline nounwind
define void @sv_terminal(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i32, i32* @interactive_shell, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @no_line_editing, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0))
  %call1 = call i32 @rl_reset_terminal(i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

declare i32 @rl_reset_terminal(i8*) #1

; Function Attrs: noinline nounwind
define void @sv_hostfile(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @clear_hostname_list()
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* @hostname_list_initialized, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare void @clear_hostname_list() #1

; Function Attrs: noinline nounwind
define void @sv_histsize(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %num = alloca i64, align 8
  %hmax = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* %0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.else36

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %temp, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.else36

if.then:                                          ; preds = %land.lhs.true
  %4 = load i8*, i8** %temp, align 4
  %call2 = call i32 @legal_number(i8* %4, i64* %num)
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.then4, label %if.end35

if.then4:                                         ; preds = %if.then
  %5 = load i64, i64* %num, align 8
  %conv5 = trunc i64 %5 to i32
  store i32 %conv5, i32* %hmax, align 4
  %6 = load i32, i32* %hmax, align 4
  %cmp = icmp slt i32 %6, 0
  br i1 %cmp, label %land.lhs.true7, label %if.else

land.lhs.true7:                                   ; preds = %if.then4
  %7 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 4
  %8 = load i8, i8* %arrayidx, align 1
  %conv8 = sext i8 %8 to i32
  %cmp9 = icmp eq i32 %conv8, 83
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true7
  %call12 = call i32 @unstifle_history()
  br label %if.end34

if.else:                                          ; preds = %land.lhs.true7, %if.then4
  %9 = load i8*, i8** %name.addr, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %9, i32 4
  %10 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %10 to i32
  %cmp15 = icmp eq i32 %conv14, 83
  br i1 %cmp15, label %if.then17, label %if.else22

if.then17:                                        ; preds = %if.else
  %11 = load i32, i32* %hmax, align 4
  call void @stifle_history(i32 %11)
  %call18 = call i32 @where_history()
  store i32 %call18, i32* %hmax, align 4
  %12 = load i32, i32* @history_lines_this_session, align 4
  %13 = load i32, i32* %hmax, align 4
  %cmp19 = icmp sgt i32 %12, %13
  br i1 %cmp19, label %if.then21, label %if.end

if.then21:                                        ; preds = %if.then17
  %14 = load i32, i32* %hmax, align 4
  store i32 %14, i32* @history_lines_this_session, align 4
  br label %if.end

if.end:                                           ; preds = %if.then21, %if.then17
  br label %if.end33

if.else22:                                        ; preds = %if.else
  %15 = load i32, i32* %hmax, align 4
  %cmp23 = icmp sge i32 %15, 0
  br i1 %cmp23, label %if.then25, label %if.end32

if.then25:                                        ; preds = %if.else22
  %call26 = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.30, i32 0, i32 0))
  %16 = load i32, i32* %hmax, align 4
  %call27 = call i32 @history_truncate_file(i8* %call26, i32 %16)
  %17 = load i32, i32* %hmax, align 4
  %18 = load i32, i32* @history_lines_in_file, align 4
  %cmp28 = icmp slt i32 %17, %18
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.then25
  %19 = load i32, i32* %hmax, align 4
  store i32 %19, i32* @history_lines_in_file, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.then25
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.else22
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.then11
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then
  br label %if.end44

if.else36:                                        ; preds = %land.lhs.true, %entry
  %20 = load i8*, i8** %name.addr, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %20, i32 4
  %21 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %21 to i32
  %cmp39 = icmp eq i32 %conv38, 83
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.else36
  %call42 = call i32 @unstifle_history()
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.else36
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end35
  ret void
}

declare i32 @unstifle_history() #1

declare void @stifle_history(i32) #1

declare i32 @where_history() #1

declare i32 @history_truncate_file(i8*, i32) #1

declare void @setup_history_ignore(i8*) #1

declare i8* @extract_colon_unit(i8*, i32*) #1

; Function Attrs: noinline nounwind
define void @sv_histchars(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* %0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %temp, align 4
  %3 = load i8, i8* %2, align 1
  store i8 %3, i8* @history_expansion_char, align 1
  %4 = load i8*, i8** %temp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %if.then
  %6 = load i8*, i8** %temp, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %if.then5, label %if.end11

if.then5:                                         ; preds = %land.lhs.true
  %8 = load i8*, i8** %temp, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 1
  %9 = load i8, i8* %arrayidx6, align 1
  store i8 %9, i8* @history_subst_char, align 1
  %10 = load i8*, i8** %temp, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i32 2
  %11 = load i8, i8* %arrayidx7, align 1
  %tobool8 = icmp ne i8 %11, 0
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then5
  %12 = load i8*, i8** %temp, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i32 2
  %13 = load i8, i8* %arrayidx10, align 1
  store i8 %13, i8* @history_comment_char, align 1
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then5
  br label %if.end11

if.end11:                                         ; preds = %if.end, %land.lhs.true, %if.then
  br label %if.end12

if.else:                                          ; preds = %entry
  store i8 33, i8* @history_expansion_char, align 1
  store i8 94, i8* @history_subst_char, align 1
  store i8 35, i8* @history_comment_char, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.end11
  ret void
}

; Function Attrs: noinline nounwind
define void @sv_tz(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @chkexport(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @tzset()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @tzset() #1

declare i32 @all_digits(i8*) #1

declare i32 @atoi(i8*) #1

declare void @set_shellopts() #1

; Function Attrs: noinline nounwind
define void @sv_optind(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %tt = alloca i8*, align 4
  %s = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %var, align 4
  %0 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %call1 = call i8* @get_variable_value(%struct.variable* %1)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call1, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %tt, align 4
  %2 = load i8*, i8** %tt, align 4
  %tobool2 = icmp ne i8* %2, null
  br i1 %tobool2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i8*, i8** %tt, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %tobool3 = icmp ne i32 %conv, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** %tt, align 4
  %call4 = call i32 @atoi(i8* %5)
  store i32 %call4, i32* %s, align 4
  %6 = load i32, i32* %s, align 4
  %cmp = icmp slt i32 %6, 0
  br i1 %cmp, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %7 = load i32, i32* %s, align 4
  %cmp6 = icmp eq i32 %7, 1
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %lor.lhs.false, %if.then
  store i32 0, i32* %s, align 4
  br label %if.end

if.end:                                           ; preds = %if.then8, %lor.lhs.false
  br label %if.end9

if.else:                                          ; preds = %land.lhs.true, %cond.end
  store i32 0, i32* %s, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.end
  %8 = load i32, i32* %s, align 4
  call void @getopts_reset(i32 %8)
  ret void
}

declare void @posix_initialize(i32) #1

declare void @posix_readline_initialize(i32) #1

; Function Attrs: noinline nounwind
define void @sv_locale(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %v = alloca i8*, align 4
  %r = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* %0)
  store i8* %call, i8** %v, align 4
  %1 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 76
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %name.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %4 to i32
  %cmp4 = icmp eq i32 %conv3, 65
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** %name.addr, align 4
  %6 = load i8*, i8** %v, align 4
  %call6 = call i32 @set_lang(i8* %5, i8* %6)
  store i32 %call6, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i8*, i8** %name.addr, align 4
  %8 = load i8*, i8** %v, align 4
  %call7 = call i32 @set_locale_var(i8* %7, i8* %8)
  store i32 %call7, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %r, align 4
  %cmp8 = icmp eq i32 %9, 0
  br i1 %cmp8, label %land.lhs.true10, label %if.end12

land.lhs.true10:                                  ; preds = %if.end
  %10 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true10
  store i32 1, i32* @last_command_exit_value, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %land.lhs.true10, %if.end
  ret void
}

declare i32 @set_lang(i8*, i8*) #1

declare i32 @set_locale_var(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @set_pipestatus_array(i32* %ps, i32 %nproc) #0 {
entry:
  %ps.addr = alloca i32*, align 4
  %nproc.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  %a = alloca %struct.array*, align 4
  %ae = alloca %struct.array_element*, align 4
  %i = alloca i32, align 4
  %t = alloca i8*, align 4
  %tbuf = alloca [12 x i8], align 1
  store i32* %ps, i32** %ps.addr, align 4
  store i32 %nproc, i32* %nproc.addr, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.79, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call %struct.variable* @make_new_array_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.79, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %v, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %cmp2 = icmp eq i32 %and, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %if.end72

if.end4:                                          ; preds = %if.end
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  store %struct.array* %5, %struct.array** %a, align 4
  %6 = load %struct.array*, %struct.array** %a, align 4
  %cmp5 = icmp eq %struct.array* %6, null
  br i1 %cmp5, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %7 = load %struct.array*, %struct.array** %a, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 2
  %8 = load i32, i32* %num_elements, align 8
  %cmp6 = icmp eq i32 %8, 0
  br i1 %cmp6, label %if.then7, label %if.end12

if.then7:                                         ; preds = %lor.lhs.false, %if.end4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then7
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %nproc.addr, align 4
  %cmp8 = icmp slt i32 %9, %10
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %ps.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i32, i32* %11, i32 %12
  %13 = load i32, i32* %arrayidx, align 4
  %conv = sext i32 %13 to i64
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %tbuf, i32 0, i32 0
  %call9 = call i8* @inttostr(i64 %conv, i8* %arraydecay, i32 12)
  store i8* %call9, i8** %t, align 4
  %14 = load %struct.array*, %struct.array** %a, align 4
  %15 = load i32, i32* %i, align 4
  %conv10 = sext i32 %15 to i64
  %16 = load i8*, i8** %t, align 4
  %call11 = call i32 @array_insert(%struct.array* %14, i64 %conv10, i8* %16)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end72

if.end12:                                         ; preds = %lor.lhs.false
  %18 = load %struct.array*, %struct.array** %a, align 4
  %num_elements13 = getelementptr inbounds %struct.array, %struct.array* %18, i32 0, i32 2
  %19 = load i32, i32* %num_elements13, align 8
  %20 = load i32, i32* %nproc.addr, align 4
  %cmp14 = icmp eq i32 %19, %20
  br i1 %cmp14, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end12
  %21 = load i32, i32* %nproc.addr, align 4
  %cmp16 = icmp eq i32 %21, 1
  br i1 %cmp16, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true
  %22 = load %struct.array*, %struct.array** %a, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %22, i32 0, i32 3
  %23 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %23, i32 0, i32 2
  %24 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %24, %struct.array_element** %ae, align 4
  %25 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value19 = getelementptr inbounds %struct.array_element, %struct.array_element* %25, i32 0, i32 1
  %26 = load i8*, i8** %value19, align 8
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 5514)
  %27 = load i32*, i32** %ps.addr, align 4
  %arrayidx20 = getelementptr inbounds i32, i32* %27, i32 0
  %28 = load i32, i32* %arrayidx20, align 4
  %conv21 = sext i32 %28 to i64
  %call22 = call i8* @itos(i64 %conv21)
  %29 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value23 = getelementptr inbounds %struct.array_element, %struct.array_element* %29, i32 0, i32 1
  store i8* %call22, i8** %value23, align 8
  br label %if.end72

if.else:                                          ; preds = %land.lhs.true, %if.end12
  %30 = load %struct.array*, %struct.array** %a, align 4
  %num_elements24 = getelementptr inbounds %struct.array, %struct.array* %30, i32 0, i32 2
  %31 = load i32, i32* %num_elements24, align 8
  %32 = load i32, i32* %nproc.addr, align 4
  %cmp25 = icmp sle i32 %31, %32
  br i1 %cmp25, label %if.then27, label %if.else56

if.then27:                                        ; preds = %if.else
  %33 = load %struct.array*, %struct.array** %a, align 4
  %head28 = getelementptr inbounds %struct.array, %struct.array* %33, i32 0, i32 3
  %34 = load %struct.array_element*, %struct.array_element** %head28, align 4
  store %struct.array_element* %34, %struct.array_element** %ae, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc40, %if.then27
  %35 = load i32, i32* %i, align 4
  %36 = load %struct.array*, %struct.array** %a, align 4
  %num_elements30 = getelementptr inbounds %struct.array, %struct.array* %36, i32 0, i32 2
  %37 = load i32, i32* %num_elements30, align 8
  %cmp31 = icmp slt i32 %35, %37
  br i1 %cmp31, label %for.body33, label %for.end42

for.body33:                                       ; preds = %for.cond29
  %38 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next34 = getelementptr inbounds %struct.array_element, %struct.array_element* %38, i32 0, i32 2
  %39 = load %struct.array_element*, %struct.array_element** %next34, align 4
  store %struct.array_element* %39, %struct.array_element** %ae, align 4
  %40 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value35 = getelementptr inbounds %struct.array_element, %struct.array_element* %40, i32 0, i32 1
  %41 = load i8*, i8** %value35, align 8
  call void @sh_xfree(i8* %41, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 5524)
  %42 = load i32*, i32** %ps.addr, align 4
  %43 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds i32, i32* %42, i32 %43
  %44 = load i32, i32* %arrayidx36, align 4
  %conv37 = sext i32 %44 to i64
  %call38 = call i8* @itos(i64 %conv37)
  %45 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value39 = getelementptr inbounds %struct.array_element, %struct.array_element* %45, i32 0, i32 1
  store i8* %call38, i8** %value39, align 8
  br label %for.inc40

for.inc40:                                        ; preds = %for.body33
  %46 = load i32, i32* %i, align 4
  %inc41 = add nsw i32 %46, 1
  store i32 %inc41, i32* %i, align 4
  br label %for.cond29

for.end42:                                        ; preds = %for.cond29
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc53, %for.end42
  %47 = load i32, i32* %i, align 4
  %48 = load i32, i32* %nproc.addr, align 4
  %cmp44 = icmp slt i32 %47, %48
  br i1 %cmp44, label %for.body46, label %for.end55

for.body46:                                       ; preds = %for.cond43
  %49 = load i32*, i32** %ps.addr, align 4
  %50 = load i32, i32* %i, align 4
  %arrayidx47 = getelementptr inbounds i32, i32* %49, i32 %50
  %51 = load i32, i32* %arrayidx47, align 4
  %conv48 = sext i32 %51 to i64
  %arraydecay49 = getelementptr inbounds [12 x i8], [12 x i8]* %tbuf, i32 0, i32 0
  %call50 = call i8* @inttostr(i64 %conv48, i8* %arraydecay49, i32 12)
  store i8* %call50, i8** %t, align 4
  %52 = load %struct.array*, %struct.array** %a, align 4
  %53 = load i32, i32* %i, align 4
  %conv51 = sext i32 %53 to i64
  %54 = load i8*, i8** %t, align 4
  %call52 = call i32 @array_insert(%struct.array* %52, i64 %conv51, i8* %54)
  br label %for.inc53

for.inc53:                                        ; preds = %for.body46
  %55 = load i32, i32* %i, align 4
  %inc54 = add nsw i32 %55, 1
  store i32 %inc54, i32* %i, align 4
  br label %for.cond43

for.end55:                                        ; preds = %for.cond43
  br label %if.end71

if.else56:                                        ; preds = %if.else
  %56 = load %struct.array*, %struct.array** %a, align 4
  call void @array_flush(%struct.array* %56)
  store i32 0, i32* %i, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc68, %if.else56
  %57 = load i32*, i32** %ps.addr, align 4
  %58 = load i32, i32* %i, align 4
  %arrayidx58 = getelementptr inbounds i32, i32* %57, i32 %58
  %59 = load i32, i32* %arrayidx58, align 4
  %cmp59 = icmp ne i32 %59, -1
  br i1 %cmp59, label %for.body61, label %for.end70

for.body61:                                       ; preds = %for.cond57
  %60 = load i32*, i32** %ps.addr, align 4
  %61 = load i32, i32* %i, align 4
  %arrayidx62 = getelementptr inbounds i32, i32* %60, i32 %61
  %62 = load i32, i32* %arrayidx62, align 4
  %conv63 = sext i32 %62 to i64
  %arraydecay64 = getelementptr inbounds [12 x i8], [12 x i8]* %tbuf, i32 0, i32 0
  %call65 = call i8* @inttostr(i64 %conv63, i8* %arraydecay64, i32 12)
  store i8* %call65, i8** %t, align 4
  %63 = load %struct.array*, %struct.array** %a, align 4
  %64 = load i32, i32* %i, align 4
  %conv66 = sext i32 %64 to i64
  %65 = load i8*, i8** %t, align 4
  %call67 = call i32 @array_insert(%struct.array* %63, i64 %conv66, i8* %65)
  br label %for.inc68

for.inc68:                                        ; preds = %for.body61
  %66 = load i32, i32* %i, align 4
  %inc69 = add nsw i32 %66, 1
  store i32 %inc69, i32* %i, align 4
  br label %for.cond57

for.end70:                                        ; preds = %for.cond57
  br label %if.end71

if.end71:                                         ; preds = %for.end70, %for.end55
  br label %if.end72

if.end72:                                         ; preds = %if.then3, %for.end, %if.end71, %if.then18
  ret void
}

declare i32 @array_insert(%struct.array*, i64, i8*) #1

declare void @array_flush(%struct.array*) #1

; Function Attrs: noinline nounwind
define %struct.array* @save_pipestatus_array() #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %v = alloca %struct.variable*, align 4
  %a = alloca %struct.array*, align 4
  %a2 = alloca %struct.array*, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.79, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  %cmp3 = icmp eq %struct.array* %5, null
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %value4 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value4, align 4
  %8 = bitcast i8* %7 to %struct.array*
  store %struct.array* %8, %struct.array** %a, align 4
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value5, align 4
  %11 = bitcast i8* %10 to %struct.array*
  %call6 = call %struct.array* @array_copy(%struct.array* %11)
  store %struct.array* %call6, %struct.array** %a2, align 4
  %12 = load %struct.array*, %struct.array** %a2, align 4
  store %struct.array* %12, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %13 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %13
}

declare %struct.array* @array_copy(%struct.array*) #1

; Function Attrs: noinline nounwind
define void @restore_pipestatus_array(%struct.array* %a) #0 {
entry:
  %a.addr = alloca %struct.array*, align 4
  %v = alloca %struct.variable*, align 4
  %a2 = alloca %struct.array*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.79, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 5
  %2 = load i32, i32* %attributes, align 4
  %and = and i32 %2, 4
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %5 = bitcast i8* %4 to %struct.array*
  %cmp3 = icmp eq %struct.array* %5, null
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %value4 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value4, align 4
  %8 = bitcast i8* %7 to %struct.array*
  store %struct.array* %8, %struct.array** %a2, align 4
  %9 = load %struct.array*, %struct.array** %a.addr, align 4
  %10 = bitcast %struct.array* %9 to i8*
  %11 = load %struct.variable*, %struct.variable** %v, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  store i8* %10, i8** %value5, align 4
  %12 = load %struct.array*, %struct.array** %a2, align 4
  call void @array_dispose(%struct.array* %12)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @set_pipestatus_from_exit(i32 %s) #0 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %0 = load i32, i32* %s.addr, align 4
  store i32 %0, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @set_pipestatus_from_exit.v, i32 0, i32 0), align 4
  call void @set_pipestatus_array(i32* getelementptr inbounds ([2 x i32], [2 x i32]* @set_pipestatus_from_exit.v, i32 0, i32 0), i32 1)
  ret void
}

declare void @xtrace_reset() #1

declare i32 @strtol(i8*, i8**, i32) #1

declare i32 @sh_validfd(i32) #1

declare %struct._IO_FILE* @fdopen(i32, i8*) #1

declare void @xtrace_set(i32, %struct._IO_FILE*) #1

declare void @set_compatibility_opts() #1

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #4

declare i8* @find_user_command(i8*) #1

declare i32 @file_status(i8*) #1

declare i8* @make_absolute(i8*, i8*) #1

declare i8* @full_pathname(i8*) #1

declare i8* @strchr(i8*, i32) #1

declare i32 @gettimeofday(%struct.timeval*, i8*) #1

; Function Attrs: noinline nounwind
define internal void @sbrand(i32 %seed) #0 {
entry:
  %seed.addr = alloca i32, align 4
  store i32 %seed, i32* %seed.addr, align 4
  %0 = load i32, i32* %seed.addr, align 4
  store i32 %0, i32* @rseed, align 4
  store i32 0, i32* @last_random_value, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @init_seconds_var() #0 {
entry:
  %v = alloca %struct.variable*, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.107, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  %call1 = call i32 @legal_number(i8* %2, i64* @seconds_value_assigned)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i64 0, i64* @seconds_value_assigned, align 8
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  br label %do.body

do.body:                                          ; preds = %if.end3
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool4 = icmp ne %struct.variable* %3, null
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.body
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value5, align 4
  br label %cond.end

cond.false:                                       ; preds = %do.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %5, %cond.true ], [ null, %cond.false ]
  %call6 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.107, i32 0, i32 0), i8* %cond, i32 0)
  store %struct.variable* %call6, %struct.variable** %v, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_seconds, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @assign_seconds, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %8
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_bash_command(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %p = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @the_printed_command_except_trap, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1477)
  %2 = load i8*, i8** @the_printed_command_except_trap, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %2)
  store i8* %call2, i8** %p, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %call3 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1480)
  store i8* %call3, i8** %p, align 4
  %3 = load i8*, i8** %p, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.body

do.body:                                          ; preds = %if.end
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value, align 4
  %tobool4 = icmp ne i8* %5, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %do.body
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value6 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value6, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1483)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end7
  %8 = load i8*, i8** %p, align 4
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value8 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  store i8* %8, i8** %value8, align 4
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %10
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_subshell(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %p = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load i32, i32* @subshell_level, align 4
  %conv = sext i32 %0 to i64
  %call = call i8* @itos(i64 %conv)
  store i8* %call, i8** %p, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value1 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value1, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1449)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load i8*, i8** %p, align 4
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  store i8* %5, i8** %value2, align 4
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %7
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_subshell(%struct.variable* %var, i8* %value, i64 %unused, i8* %key) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %unused.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  %new_value = alloca i64, align 8
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %unused, i64* %unused.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @legal_number(i8* %3, i64* %new_value)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  store i64 0, i64* %new_value, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false3
  %4 = load i64, i64* %new_value, align 8
  %conv6 = trunc i64 %4 to i32
  store i32 %conv6, i32* @subshell_level, align 4
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %5
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_random(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %rv = alloca i32, align 4
  %p = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %call = call i32 @get_random_number()
  store i32 %call, i32* %rv, align 4
  %0 = load i32, i32* %rv, align 4
  store i32 %0, i32* @last_random_value, align 4
  %1 = load i32, i32* %rv, align 4
  %conv = sext i32 %1 to i64
  %call1 = call i8* @itos(i64 %conv)
  store i8* %call1, i8** %p, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value2, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1390)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes, align 4
  %or = or i32 %7, 16
  store i32 %or, i32* %attributes, align 4
  %8 = load i8*, i8** %p, align 4
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  store i8* %8, i8** %value3, align 4
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %10
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_random(%struct.variable* %self, i8* %value, i64 %unused, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %unused.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %unused, i64* %unused.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strtoul(i8* %0, i8** null, i32 10)
  call void @sbrand(i32 %call)
  %1 = load i32, i32* @subshell_environment, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 @getpid()
  store i32 %call1, i32* @seeded_subshell, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %2
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_lineno(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %p = alloca i8*, align 4
  %ln = alloca i32, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %call = call i32 @executing_line_number()
  store i32 %call, i32* %ln, align 4
  %0 = load i32, i32* %ln, align 4
  %conv = sext i32 %0 to i64
  %call1 = call i8* @itos(i64 %conv)
  store i8* %call1, i8** %p, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value2, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1422)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load i8*, i8** %p, align 4
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  store i8* %5, i8** %value3, align 4
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %7
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_lineno(%struct.variable* %var, i8* %value, i64 %unused, i8* %key) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %unused.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  %new_value = alloca i64, align 8
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %unused, i64* %unused.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @legal_number(i8* %3, i64* %new_value)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  store i64 0, i64* %new_value, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false3
  %4 = load i64, i64* %new_value, align 8
  %conv6 = trunc i64 %4 to i32
  store i32 %conv6, i32* @line_number_base, align 4
  store i32 %conv6, i32* @line_number, align 4
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %5
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_bashpid(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %pid = alloca i32, align 4
  %p = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %call = call i32 @getpid()
  store i32 %call, i32* %pid, align 4
  %0 = load i32, i32* %pid, align 4
  %conv = sext i32 %0 to i64
  %call1 = call i8* @itos(i64 %conv)
  store i8* %call1, i8** %p, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value2, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1464)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 5
  %6 = load i32, i32* %attributes, align 4
  %or = or i32 %6, 18
  store i32 %or, i32* %attributes, align 4
  %7 = load i8*, i8** %p, align 4
  %8 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 1
  store i8* %7, i8** %value3, align 4
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %9
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @null_assign(%struct.variable* %self, i8* %value, i64 %unused, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %unused.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %unused, i64* %unused.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %0
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_histcmd(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %p = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %call = call i32 @history_number()
  %conv = sext i32 %call to i64
  %call1 = call i8* @itos(i64 %conv)
  store i8* %call1, i8** %p, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value2, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1496)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %4 = load i8*, i8** %p, align 4
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  store i8* %4, i8** %value3, align 4
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %6
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_comp_wordbreaks(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @bash_readline_initialized, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @perform_hostname_completion, align 4
  %call = call i32 @enable_hostname_completion(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %do.body
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  %6 = load i8*, i8** %value3, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1512)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end4
  %7 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %call5 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call5
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1513)
  %8 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %8)
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value8 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  store i8* %call7, i8** %value8, align 4
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %10
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_comp_wordbreaks(%struct.variable* %self, i8* %value, i64 %unused, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %unused.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %unused, i64* %unused.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %2 = load i8*, i8** @rl_basic_word_break_characters, align 4
  %cmp = icmp ne i8* %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** @rl_completer_word_break_characters, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1529)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %4)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1531)
  %5 = load i8*, i8** %value.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %5)
  store i8* %call2, i8** @rl_completer_word_break_characters, align 4
  %6 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %6
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @init_dynamic_array_var(i8* %name, %struct.variable* (%struct.variable*)* %getfunc, %struct.variable* (%struct.variable*, i8*, i64, i8*)* %setfunc, i32 %attrs) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %getfunc.addr = alloca %struct.variable* (%struct.variable*)*, align 4
  %setfunc.addr = alloca %struct.variable* (%struct.variable*, i8*, i64, i8*)*, align 4
  %attrs.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.variable* (%struct.variable*)* %getfunc, %struct.variable* (%struct.variable*)** %getfunc.addr, align 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* %setfunc, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %setfunc.addr, align 4
  store i32 %attrs, i32* %attrs.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %2, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %3 = load i8*, i8** %name.addr, align 4
  %call1 = call %struct.variable* @make_new_array_variable(i8* %3)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  %4 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %getfunc.addr, align 4
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* %4, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %6 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %setfunc.addr, align 4
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* %6, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %8 = load i32, i32* %attrs.addr, align 4
  %tobool2 = icmp ne i32 %8, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  %9 = load i32, i32* %attrs.addr, align 4
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes, align 4
  %or = or i32 %11, %9
  store i32 %or, i32* %attributes, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.end
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %12, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %13 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %13
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_dirstack(%struct.variable* %self) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %a = alloca %struct.array*, align 4
  %l = alloca %struct.word_list*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %call = call %struct.word_list* @get_directory_stack(i32 0)
  store %struct.word_list* %call, %struct.word_list** %l, align 4
  %0 = load %struct.word_list*, %struct.word_list** %l, align 4
  %call1 = call %struct.array* @array_from_word_list(%struct.word_list* %0)
  store %struct.array* %call1, %struct.array** %a, align 4
  %1 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  %3 = bitcast i8* %2 to %struct.array*
  call void @array_dispose(%struct.array* %3)
  %4 = load %struct.word_list*, %struct.word_list** %l, align 4
  call void @dispose_words(%struct.word_list* %4)
  %5 = load %struct.array*, %struct.array** %a, align 4
  %6 = bitcast %struct.array* %5 to i8*
  %7 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  store i8* %6, i8** %value2, align 4
  %8 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %8
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_dirstack(%struct.variable* %self, i8* %value, i64 %ind, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %ind.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i64, i64* %ind.addr, align 8
  %1 = load i8*, i8** %value.addr, align 4
  call void @set_dirstack_element(i64 %0, i32 1, i8* %1)
  %2 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %2
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_groupset(%struct.variable* %self) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %i = alloca i32, align 4
  %ng = alloca i32, align 4
  %a = alloca %struct.array*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load i8**, i8*** @get_groupset.group_set, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8** @get_group_list(i32* %ng)
  store i8** %call, i8*** @get_groupset.group_set, align 4
  %1 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 4
  %3 = bitcast i8* %2 to %struct.array*
  store %struct.array* %3, %struct.array** %a, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %ng, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.array*, %struct.array** %a, align 4
  %7 = load i32, i32* %i, align 4
  %conv = sext i32 %7 to i64
  %8 = load i8**, i8*** @get_groupset.group_set, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %8, i32 %9
  %10 = load i8*, i8** %arrayidx, align 4
  %call2 = call i32 @array_insert(%struct.array* %6, i64 %conv, i8* %10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %12 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %12
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @null_array_assign(%struct.variable* %self, i8* %value, i64 %ind, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %ind.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %0
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_self(%struct.variable* %self) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %0
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @init_dynamic_assoc_var(i8* %name, %struct.variable* (%struct.variable*)* %getfunc, %struct.variable* (%struct.variable*, i8*, i64, i8*)* %setfunc, i32 %attrs) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %name.addr = alloca i8*, align 4
  %getfunc.addr = alloca %struct.variable* (%struct.variable*)*, align 4
  %setfunc.addr = alloca %struct.variable* (%struct.variable*, i8*, i64, i8*)*, align 4
  %attrs.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.variable* (%struct.variable*)* %getfunc, %struct.variable* (%struct.variable*)** %getfunc.addr, align 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* %setfunc, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %setfunc.addr, align 4
  store i32 %attrs, i32* %attrs.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %0)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %2, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %3 = load i8*, i8** %name.addr, align 4
  %call1 = call %struct.variable* @make_new_assoc_variable(i8* %3)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  %4 = load %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*)** %getfunc.addr, align 4
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* %4, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %6 = load %struct.variable* (%struct.variable*, i8*, i64, i8*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %setfunc.addr, align 4
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* %6, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %8 = load i32, i32* %attrs.addr, align 4
  %tobool2 = icmp ne i32 %8, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  %9 = load i32, i32* %attrs.addr, align 4
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes, align 4
  %or = or i32 %11, %9
  store i32 %or, i32* %attributes, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.end
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %12, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %13 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %13
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_hashcmd(%struct.variable* %self) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %call = call %struct.variable* @build_hashcmd(%struct.variable* %0)
  %1 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %1
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_hashcmd(%struct.variable* %self, i8* %value, i64 %ind, i8* %key) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %ind.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %call = call i8* @strchr(i8* %1, i32 47)
  %tobool1 = icmp ne i8* %call, null
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** %value.addr, align 4
  call void @sh_restricted(i8* %2)
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %3 = load i8*, i8** %key.addr, align 4
  %4 = load i8*, i8** %value.addr, align 4
  call void @phash_insert(i8* %3, i8* %4, i32 0, i32 0)
  %5 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %call2 = call %struct.variable* @build_hashcmd(%struct.variable* %5)
  store %struct.variable* %call2, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %6
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_aliasvar(%struct.variable* %self) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %call = call %struct.variable* @build_aliasvar(%struct.variable* %0)
  %1 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %1
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_aliasvar(%struct.variable* %self, i8* %value, i64 %ind, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %ind.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %ind, i64* %ind.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i8*, i8** %key.addr, align 4
  %1 = load i8*, i8** %value.addr, align 4
  call void @add_alias(i8* %0, i8* %1)
  %2 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %call = call %struct.variable* @build_aliasvar(%struct.variable* %2)
  ret %struct.variable* %call
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @init_funcname_var() #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.54, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %v, align 4
  %0 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %1, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %call1 = call %struct.variable* @make_new_array_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.54, i32 0, i32 0))
  store %struct.variable* %call1, %struct.variable** %v, align 4
  %2 = load %struct.variable*, %struct.variable** %v, align 4
  %dynamic_value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 3
  store %struct.variable* (%struct.variable*)* @get_funcname, %struct.variable* (%struct.variable*)** %dynamic_value, align 4
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %assign_func = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 4
  store %struct.variable* (%struct.variable*, i8*, i64, i8*)* @null_array_assign, %struct.variable* (%struct.variable*, i8*, i64, i8*)** %assign_func, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %or = or i32 %5, 20480
  store i32 %or, i32* %attributes, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  store %struct.variable* %6, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then
  %7 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %7
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_seconds(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %time_since_start = alloca i32, align 4
  %p = alloca i8*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %call = call i32 @time(i32* null)
  %0 = load i32, i32* @shell_start_time, align 4
  %sub = sub nsw i32 %call, %0
  store i32 %sub, i32* %time_since_start, align 4
  %1 = load i64, i64* @seconds_value_assigned, align 8
  %2 = load i32, i32* %time_since_start, align 4
  %conv = sext i32 %2 to i64
  %add = add nsw i64 %1, %conv
  %call1 = call i8* @itos(i64 %add)
  store i8* %call1, i8** %p, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 1
  %4 = load i8*, i8** %value, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %5 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value2 = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 1
  %6 = load i8*, i8** %value2, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1276)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %or = or i32 %8, 16
  store i32 %or, i32* %attributes, align 4
  %9 = load i8*, i8** %p, align 4
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 1
  store i8* %9, i8** %value3, align 4
  %11 = load %struct.variable*, %struct.variable** %var.addr, align 4
  ret %struct.variable* %11
}

; Function Attrs: noinline nounwind
define internal %struct.variable* @assign_seconds(%struct.variable* %self, i8* %value, i64 %unused, i8* %key) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  %value.addr = alloca i8*, align 4
  %unused.addr = alloca i64, align 8
  %key.addr = alloca i8*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i64 %unused, i64* %unused.addr, align 8
  store i8* %key, i8** %key.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %call = call i32 @legal_number(i8* %0, i64* @seconds_value_assigned)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, i64* @seconds_value_assigned, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @time(i32* null)
  store i32 %call1, i32* @shell_start_time, align 4
  %1 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %1
}

declare i32 @time(i32*) #1

declare i32 @strtoul(i8*, i8**, i32) #1

declare i32 @executing_line_number() #1

declare i32 @history_number() #1

declare i32 @enable_hostname_completion(i32) #1

declare %struct.word_list* @get_directory_stack(i32) #1

declare %struct.array* @array_from_word_list(%struct.word_list*) #1

declare void @set_dirstack_element(i64, i32, i8*) #1

declare i8** @get_group_list(i32*) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @build_hashcmd(%struct.variable* %self) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %self.addr = alloca %struct.variable*, align 4
  %h = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %k = alloca i8*, align 4
  %v = alloca i8*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %2 = bitcast i8* %1 to %struct.hash_table*
  store %struct.hash_table* %2, %struct.hash_table** %h, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %tobool = icmp ne %struct.hash_table* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  call void @assoc_dispose(%struct.hash_table* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %cmp = icmp eq %struct.hash_table* %5, null
  br i1 %cmp, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %6 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %tobool1 = icmp ne %struct.hash_table* %6, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %7 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 2
  %8 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ 0, %cond.false ]
  %cmp2 = icmp eq i32 %cond, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %cond.end, %if.end
  %9 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value4 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  store i8* null, i8** %value4, align 4
  %10 = load %struct.variable*, %struct.variable** %self.addr, align 4
  store %struct.variable* %10, %struct.variable** %retval, align 4
  br label %return

if.end5:                                          ; preds = %cond.end
  %11 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 1
  %12 = load i32, i32* %nbuckets, align 4
  %call = call %struct.hash_table* @hash_create(i32 %12)
  store %struct.hash_table* %call, %struct.hash_table** %h, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %if.end5
  %13 = load i32, i32* %i, align 4
  %14 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %nbuckets6 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %14, i32 0, i32 1
  %15 = load i32, i32* %nbuckets6, align 4
  %cmp7 = icmp slt i32 %13, %15
  br i1 %cmp7, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  %16 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %tobool8 = icmp ne %struct.hash_table* %16, null
  br i1 %tobool8, label %land.lhs.true, label %cond.false12

land.lhs.true:                                    ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %18 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %nbuckets9 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %18, i32 0, i32 1
  %19 = load i32, i32* %nbuckets9, align 4
  %cmp10 = icmp slt i32 %17, %19
  br i1 %cmp10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %land.lhs.true
  %20 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %20, i32 0, i32 0
  %21 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %21, i32 %22
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end13

cond.false12:                                     ; preds = %land.lhs.true, %for.body
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi %struct.bucket_contents* [ %23, %cond.true11 ], [ null, %cond.false12 ]
  store %struct.bucket_contents* %cond14, %struct.bucket_contents** %item, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc, %cond.end13
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %tobool16 = icmp ne %struct.bucket_contents* %24, null
  br i1 %tobool16, label %for.body17, label %for.end

for.body17:                                       ; preds = %for.cond15
  %25 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %25, i32 0, i32 1
  %26 = load i8*, i8** %key, align 4
  %call18 = call i32 @strlen(i8* %26)
  %add = add i32 1, %call18
  %call19 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1610)
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key20 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %27, i32 0, i32 1
  %28 = load i8*, i8** %key20, align 4
  %call21 = call i8* @strcpy(i8* %call19, i8* %28)
  store i8* %call21, i8** %k, align 4
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 2
  %30 = load i8*, i8** %data, align 4
  %31 = bitcast i8* %30 to %struct._pathdata*
  %path = getelementptr inbounds %struct._pathdata, %struct._pathdata* %31, i32 0, i32 0
  %32 = load i8*, i8** %path, align 4
  store i8* %32, i8** %v, align 4
  %33 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %34 = load i8*, i8** %k, align 4
  %35 = load i8*, i8** %v, align 4
  %call22 = call i32 @assoc_insert(%struct.hash_table* %33, i8* %34, i8* %35)
  br label %for.inc

for.inc:                                          ; preds = %for.body17
  %36 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %36, i32 0, i32 0
  %37 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %37, %struct.bucket_contents** %item, align 4
  br label %for.cond15

for.end:                                          ; preds = %for.cond15
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %38 = load i32, i32* %i, align 4
  %inc = add nsw i32 %38, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %39 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %40 = bitcast %struct.hash_table* %39 to i8*
  %41 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value25 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 1
  store i8* %40, i8** %value25, align 4
  %42 = load %struct.variable*, %struct.variable** %self.addr, align 4
  store %struct.variable* %42, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %for.end24, %if.then3
  %43 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %43
}

declare i32 @assoc_insert(%struct.hash_table*, i8*, i8*) #1

declare void @sh_restricted(i8*) #1

declare void @phash_insert(i8*, i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @build_aliasvar(%struct.variable* %self) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %self.addr = alloca %struct.variable*, align 4
  %h = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %k = alloca i8*, align 4
  %v = alloca i8*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 1
  %1 = load i8*, i8** %value, align 4
  %2 = bitcast i8* %1 to %struct.hash_table*
  store %struct.hash_table* %2, %struct.hash_table** %h, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %tobool = icmp ne %struct.hash_table* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  call void @assoc_dispose(%struct.hash_table* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp = icmp eq %struct.hash_table* %5, null
  br i1 %cmp, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %6 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %tobool1 = icmp ne %struct.hash_table* %6, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %7 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 2
  %8 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ 0, %cond.false ]
  %cmp2 = icmp eq i32 %cond, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %cond.end, %if.end
  %9 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value4 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  store i8* null, i8** %value4, align 4
  %10 = load %struct.variable*, %struct.variable** %self.addr, align 4
  store %struct.variable* %10, %struct.variable** %retval, align 4
  br label %return

if.end5:                                          ; preds = %cond.end
  %11 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 1
  %12 = load i32, i32* %nbuckets, align 4
  %call = call %struct.hash_table* @hash_create(i32 %12)
  store %struct.hash_table* %call, %struct.hash_table** %h, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %if.end5
  %13 = load i32, i32* %i, align 4
  %14 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nbuckets6 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %14, i32 0, i32 1
  %15 = load i32, i32* %nbuckets6, align 4
  %cmp7 = icmp slt i32 %13, %15
  br i1 %cmp7, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  %16 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %tobool8 = icmp ne %struct.hash_table* %16, null
  br i1 %tobool8, label %land.lhs.true, label %cond.false12

land.lhs.true:                                    ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %18 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %nbuckets9 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %18, i32 0, i32 1
  %19 = load i32, i32* %nbuckets9, align 4
  %cmp10 = icmp slt i32 %17, %19
  br i1 %cmp10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %land.lhs.true
  %20 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %20, i32 0, i32 0
  %21 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %21, i32 %22
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end13

cond.false12:                                     ; preds = %land.lhs.true, %for.body
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi %struct.bucket_contents* [ %23, %cond.true11 ], [ null, %cond.false12 ]
  store %struct.bucket_contents* %cond14, %struct.bucket_contents** %item, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc, %cond.end13
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %tobool16 = icmp ne %struct.bucket_contents* %24, null
  br i1 %tobool16, label %for.body17, label %for.end

for.body17:                                       ; preds = %for.cond15
  %25 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %25, i32 0, i32 1
  %26 = load i8*, i8** %key, align 4
  %call18 = call i32 @strlen(i8* %26)
  %add = add i32 1, %call18
  %call19 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 1671)
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key20 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %27, i32 0, i32 1
  %28 = load i8*, i8** %key20, align 4
  %call21 = call i8* @strcpy(i8* %call19, i8* %28)
  store i8* %call21, i8** %k, align 4
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 2
  %30 = load i8*, i8** %data, align 4
  %31 = bitcast i8* %30 to %struct.alias*
  %value22 = getelementptr inbounds %struct.alias, %struct.alias* %31, i32 0, i32 1
  %32 = load i8*, i8** %value22, align 4
  store i8* %32, i8** %v, align 4
  %33 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %34 = load i8*, i8** %k, align 4
  %35 = load i8*, i8** %v, align 4
  %call23 = call i32 @assoc_insert(%struct.hash_table* %33, i8* %34, i8* %35)
  br label %for.inc

for.inc:                                          ; preds = %for.body17
  %36 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %36, i32 0, i32 0
  %37 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %37, %struct.bucket_contents** %item, align 4
  br label %for.cond15

for.end:                                          ; preds = %for.cond15
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %38 = load i32, i32* %i, align 4
  %inc = add nsw i32 %38, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  %39 = load %struct.hash_table*, %struct.hash_table** %h, align 4
  %40 = bitcast %struct.hash_table* %39 to i8*
  %41 = load %struct.variable*, %struct.variable** %self.addr, align 4
  %value26 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 1
  store i8* %40, i8** %value26, align 4
  %42 = load %struct.variable*, %struct.variable** %self.addr, align 4
  store %struct.variable* %42, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %for.end25, %if.then3
  %43 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %43
}

declare void @add_alias(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @get_funcname(%struct.variable* %self) #0 {
entry:
  %self.addr = alloca %struct.variable*, align 4
  store %struct.variable* %self, %struct.variable** %self.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %self.addr, align 4
  ret %struct.variable* %0
}

declare %struct.bucket_contents* @hash_search(i8*, %struct.hash_table*, i32) #1

declare i8* @array_variable_name(i8*, i8**, i32*) #1

declare i8* @make_array_variable_value(%struct.variable*, i64, i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @find_nameref_at_context(%struct.variable* %v, %struct.var_context* %vc) #0 {
entry:
  %retval = alloca %struct.variable*, align 4
  %v.addr = alloca %struct.variable*, align 4
  %vc.addr = alloca %struct.var_context*, align 4
  %nv = alloca %struct.variable*, align 4
  %nv2 = alloca %struct.variable*, align 4
  %nvc = alloca %struct.var_context*, align 4
  %newname = alloca i8*, align 4
  %level = alloca i32, align 4
  store %struct.variable* %v, %struct.variable** %v.addr, align 4
  store %struct.var_context* %vc, %struct.var_context** %vc.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %v.addr, align 4
  store %struct.variable* %0, %struct.variable** %nv, align 4
  store i32 1, i32* %level, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end10, %entry
  %1 = load %struct.variable*, %struct.variable** %nv, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load %struct.variable*, %struct.variable** %nv, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 2048
  %tobool1 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %level, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %level, align 4
  %6 = load i32, i32* %level, align 4
  %cmp = icmp sgt i32 %6, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store %struct.variable* @nameref_maxloop_value, %struct.variable** %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %7 = load %struct.variable*, %struct.variable** %nv, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 4
  store i8* %8, i8** %newname, align 4
  %9 = load i8*, i8** %newname, align 4
  %cmp2 = icmp eq i8* %9, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %10 = load i8*, i8** %newname, align 4
  %11 = load i8, i8* %10, align 1
  %conv = sext i8 %11 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  store %struct.variable* null, %struct.variable** %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %12 = load i8*, i8** %newname, align 4
  %13 = load %struct.var_context*, %struct.var_context** %vc.addr, align 4
  %table = getelementptr inbounds %struct.var_context, %struct.var_context* %13, i32 0, i32 5
  %14 = load %struct.hash_table*, %struct.hash_table** %table, align 4
  %call = call %struct.variable* @hash_lookup(i8* %12, %struct.hash_table* %14)
  store %struct.variable* %call, %struct.variable** %nv2, align 4
  %15 = load %struct.variable*, %struct.variable** %nv2, align 4
  %cmp7 = icmp eq %struct.variable* %15, null
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  br label %while.end

if.end10:                                         ; preds = %if.end6
  %16 = load %struct.variable*, %struct.variable** %nv2, align 4
  store %struct.variable* %16, %struct.variable** %nv, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then9, %land.end
  %17 = load %struct.variable*, %struct.variable** %nv, align 4
  store %struct.variable* %17, %struct.variable** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then5, %if.then
  %18 = load %struct.variable*, %struct.variable** %retval, align 4
  ret %struct.variable* %18
}

; Function Attrs: noinline nounwind
define internal void @vlist_add(%struct._vlist* %vlist, %struct.variable* %var, i32 %flags) #0 {
entry:
  %vlist.addr = alloca %struct._vlist*, align 4
  %var.addr = alloca %struct.variable*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct._vlist* %vlist, %struct._vlist** %vlist.addr, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_len = getelementptr inbounds %struct._vlist, %struct._vlist* %1, i32 0, i32 2
  %2 = load i32, i32* %list_len, align 4
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %3, i32 0, i32 0
  %4 = load i8*, i8** %name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %6 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list = getelementptr inbounds %struct._vlist, %struct._vlist* %6, i32 0, i32 0
  %7 = load %struct.variable**, %struct.variable*** %list, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct.variable*, %struct.variable** %7, i32 %8
  %9 = load %struct.variable*, %struct.variable** %arrayidx1, align 4
  %name2 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 0
  %10 = load i8*, i8** %name2, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %11 to i32
  %cmp5 = icmp eq i32 %conv, %conv4
  br i1 %cmp5, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %12 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name7 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 0
  %13 = load i8*, i8** %name7, align 4
  %14 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list8 = getelementptr inbounds %struct._vlist, %struct._vlist* %14, i32 0, i32 0
  %15 = load %struct.variable**, %struct.variable*** %list8, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds %struct.variable*, %struct.variable** %15, i32 %16
  %17 = load %struct.variable*, %struct.variable** %arrayidx9, align 4
  %name10 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 0
  %18 = load i8*, i8** %name10, align 4
  %call = call i32 @strcmp(i8* %13, i8* %18)
  %cmp11 = icmp eq i32 %call, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %for.end

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %19 = load i32, i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %20 = load i32, i32* %i, align 4
  %21 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_len13 = getelementptr inbounds %struct._vlist, %struct._vlist* %21, i32 0, i32 2
  %22 = load i32, i32* %list_len13, align 4
  %cmp14 = icmp slt i32 %20, %22
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %for.end
  br label %return

if.end17:                                         ; preds = %for.end
  %23 = load i32, i32* %i, align 4
  %24 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_size = getelementptr inbounds %struct._vlist, %struct._vlist* %24, i32 0, i32 1
  %25 = load i32, i32* %list_size, align 4
  %cmp18 = icmp sge i32 %23, %25
  br i1 %cmp18, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end17
  %26 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %27 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_size21 = getelementptr inbounds %struct._vlist, %struct._vlist* %27, i32 0, i32 1
  %28 = load i32, i32* %list_size21, align 4
  %add = add nsw i32 %28, 16
  %call22 = call %struct._vlist* @vlist_realloc(%struct._vlist* %26, i32 %add)
  store %struct._vlist* %call22, %struct._vlist** %vlist.addr, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.end17
  %29 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %30 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list24 = getelementptr inbounds %struct._vlist, %struct._vlist* %30, i32 0, i32 0
  %31 = load %struct.variable**, %struct.variable*** %list24, align 4
  %32 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_len25 = getelementptr inbounds %struct._vlist, %struct._vlist* %32, i32 0, i32 2
  %33 = load i32, i32* %list_len25, align 4
  %inc26 = add nsw i32 %33, 1
  store i32 %inc26, i32* %list_len25, align 4
  %arrayidx27 = getelementptr inbounds %struct.variable*, %struct.variable** %31, i32 %33
  store %struct.variable* %29, %struct.variable** %arrayidx27, align 4
  %34 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list28 = getelementptr inbounds %struct._vlist, %struct._vlist* %34, i32 0, i32 0
  %35 = load %struct.variable**, %struct.variable*** %list28, align 4
  %36 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_len29 = getelementptr inbounds %struct._vlist, %struct._vlist* %36, i32 0, i32 2
  %37 = load i32, i32* %list_len29, align 4
  %arrayidx30 = getelementptr inbounds %struct.variable*, %struct.variable** %35, i32 %37
  store %struct.variable* null, %struct.variable** %arrayidx30, align 4
  br label %return

return:                                           ; preds = %if.end23, %if.then16
  ret void
}

; Function Attrs: noinline nounwind
define internal %struct._vlist* @vlist_realloc(%struct._vlist* %vlist, i32 %n) #0 {
entry:
  %retval = alloca %struct._vlist*, align 4
  %vlist.addr = alloca %struct._vlist*, align 4
  %n.addr = alloca i32, align 4
  store %struct._vlist* %vlist, %struct._vlist** %vlist.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %cmp = icmp eq %struct._vlist* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %call = call %struct._vlist* @vlist_alloc(i32 %1)
  store %struct._vlist* %call, %struct._vlist** %vlist.addr, align 4
  store %struct._vlist* %call, %struct._vlist** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4
  %3 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_size = getelementptr inbounds %struct._vlist, %struct._vlist* %3, i32 0, i32 1
  %4 = load i32, i32* %list_size, align 4
  %cmp1 = icmp sgt i32 %2, %4
  br i1 %cmp1, label %if.then2, label %if.end7

if.then2:                                         ; preds = %if.end
  %5 = load i32, i32* %n.addr, align 4
  %6 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_size3 = getelementptr inbounds %struct._vlist, %struct._vlist* %6, i32 0, i32 1
  store i32 %5, i32* %list_size3, align 4
  %7 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list = getelementptr inbounds %struct._vlist, %struct._vlist* %7, i32 0, i32 0
  %8 = load %struct.variable**, %struct.variable*** %list, align 4
  %9 = bitcast %struct.variable** %8 to i8*
  %10 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list_size4 = getelementptr inbounds %struct._vlist, %struct._vlist* %10, i32 0, i32 1
  %11 = load i32, i32* %list_size4, align 4
  %add = add nsw i32 %11, 1
  %mul = mul i32 %add, 4
  %call5 = call i8* @sh_xrealloc(i8* %9, i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 3691)
  %12 = bitcast i8* %call5 to %struct.variable**
  %13 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  %list6 = getelementptr inbounds %struct._vlist, %struct._vlist* %13, i32 0, i32 0
  store %struct.variable** %12, %struct.variable*** %list6, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then2, %if.end
  %14 = load %struct._vlist*, %struct._vlist** %vlist.addr, align 4
  store %struct._vlist* %14, %struct._vlist** %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %15 = load %struct._vlist*, %struct._vlist** %retval, align 4
  ret %struct._vlist* %15
}

declare void @strvec_dispose(i8**) #1

; Function Attrs: noinline nounwind
define internal i32 @export_environment_candidate(%struct.variable* %var) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %0, i32 0, i32 5
  %1 = load i32, i32* %attributes, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes1 = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes1, align 4
  %and2 = and i32 %3, 4096
  %cmp = icmp eq i32 %and2, 0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %4 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %5, 32768
  %tobool5 = icmp ne i32 %and4, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %6 = phi i1 [ true, %land.rhs ], [ %tobool5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %entry
  %7 = phi i1 [ false, %entry ], [ %6, %lor.end ]
  %land.ext = zext i1 %7 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define internal i8** @make_env_array_from_var_list(%struct.variable** %vars) #0 {
entry:
  %vars.addr = alloca %struct.variable**, align 4
  %i = alloca i32, align 4
  %list_index = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  %list = alloca i8**, align 4
  %value = alloca i8*, align 4
  store %struct.variable** %vars, %struct.variable*** %vars.addr, align 4
  %0 = load %struct.variable**, %struct.variable*** %vars.addr, align 4
  %1 = bitcast %struct.variable** %0 to i8**
  %call = call i32 @strvec_len(i8** %1)
  %add = add nsw i32 1, %call
  %call1 = call i8** @strvec_create(i32 %add)
  store i8** %call1, i8*** %list, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %list_index, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.variable**, %struct.variable*** %vars.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %2, i32 %3
  %4 = load %struct.variable*, %struct.variable** %arrayidx, align 4
  store %struct.variable* %4, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %4, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr = getelementptr inbounds %struct.variable, %struct.variable* %5, i32 0, i32 2
  %6 = load i8*, i8** %exportstr, align 4
  %tobool2 = icmp ne i8* %6, null
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %7 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr3 = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 2
  %8 = load i8*, i8** %exportstr3, align 4
  store i8* %8, i8** %value, align 4
  br label %if.end22

if.else:                                          ; preds = %for.body
  %9 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes, align 4
  %and = and i32 %10, 8
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.then5, label %if.else8

if.then5:                                         ; preds = %if.else
  %11 = load %struct.variable*, %struct.variable** %var, align 4
  %value6 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  %12 = load i8*, i8** %value6, align 4
  %13 = bitcast i8* %12 to %struct.command*
  %call7 = call i8* @named_function_string(i8* null, %struct.command* %13, i32 0)
  store i8* %call7, i8** %value, align 4
  br label %if.end21

if.else8:                                         ; preds = %if.else
  %14 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes9 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes9, align 4
  %and10 = and i32 %15, 4
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.else8
  br label %for.inc

if.else13:                                        ; preds = %if.else8
  %16 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes14 = getelementptr inbounds %struct.variable, %struct.variable* %16, i32 0, i32 5
  %17 = load i32, i32* %attributes14, align 4
  %and15 = and i32 %17, 64
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.then17, label %if.else18

if.then17:                                        ; preds = %if.else13
  br label %for.inc

if.else18:                                        ; preds = %if.else13
  %18 = load %struct.variable*, %struct.variable** %var, align 4
  %value19 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 1
  %19 = load i8*, i8** %value19, align 4
  store i8* %19, i8** %value, align 4
  br label %if.end

if.end:                                           ; preds = %if.else18
  br label %if.end20

if.end20:                                         ; preds = %if.end
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then5
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then
  %20 = load i8*, i8** %value, align 4
  %tobool23 = icmp ne i8* %20, null
  br i1 %tobool23, label %if.then24, label %if.end53

if.then24:                                        ; preds = %if.end22
  %21 = load i8*, i8** %value, align 4
  %22 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr25 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 2
  %23 = load i8*, i8** %exportstr25, align 4
  %cmp = icmp eq i8* %21, %23
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then24
  %24 = load i8*, i8** %value, align 4
  %call26 = call i32 @strlen(i8* %24)
  %add27 = add i32 1, %call26
  %call28 = call i8* @sh_xmalloc(i32 %add27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4288)
  %25 = load i8*, i8** %value, align 4
  %call29 = call i8* @strcpy(i8* %call28, i8* %25)
  br label %cond.end

cond.false:                                       ; preds = %if.then24
  %26 = load %struct.variable*, %struct.variable** %var, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 0
  %27 = load i8*, i8** %name, align 4
  %28 = load i8*, i8** %value, align 4
  %29 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes30 = getelementptr inbounds %struct.variable, %struct.variable* %29, i32 0, i32 5
  %30 = load i32, i32* %attributes30, align 4
  %and31 = and i32 %30, 8
  %call32 = call i8* @mk_env_string(i8* %27, i8* %28, i32 %and31)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call29, %cond.true ], [ %call32, %cond.false ]
  %31 = load i8**, i8*** %list, align 4
  %32 = load i32, i32* %list_index, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %31, i32 %32
  store i8* %cond, i8** %arrayidx33, align 4
  %33 = load i8*, i8** %value, align 4
  %34 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr34 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 2
  %35 = load i8*, i8** %exportstr34, align 4
  %cmp35 = icmp eq i8* %33, %35
  %conv = zext i1 %cmp35 to i32
  %cmp36 = icmp eq i32 %conv, 0
  br i1 %cmp36, label %if.then38, label %if.end52

if.then38:                                        ; preds = %cond.end
  %36 = load i8**, i8*** %list, align 4
  %37 = load i32, i32* %list_index, align 4
  %arrayidx39 = getelementptr inbounds i8*, i8** %36, i32 %37
  %38 = load i8*, i8** %arrayidx39, align 4
  %tobool40 = icmp ne i8* %38, null
  br i1 %tobool40, label %cond.true41, label %cond.false48

cond.true41:                                      ; preds = %if.then38
  %39 = load i8**, i8*** %list, align 4
  %40 = load i32, i32* %list_index, align 4
  %arrayidx42 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx42, align 4
  %call43 = call i32 @strlen(i8* %41)
  %add44 = add i32 1, %call43
  %call45 = call i8* @sh_xmalloc(i32 %add44, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 4292)
  %42 = load i8**, i8*** %list, align 4
  %43 = load i32, i32* %list_index, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %42, i32 %43
  %44 = load i8*, i8** %arrayidx46, align 4
  %call47 = call i8* @strcpy(i8* %call45, i8* %44)
  br label %cond.end49

cond.false48:                                     ; preds = %if.then38
  br label %cond.end49

cond.end49:                                       ; preds = %cond.false48, %cond.true41
  %cond50 = phi i8* [ %call47, %cond.true41 ], [ null, %cond.false48 ]
  %45 = load %struct.variable*, %struct.variable** %var, align 4
  %exportstr51 = getelementptr inbounds %struct.variable, %struct.variable* %45, i32 0, i32 2
  store i8* %cond50, i8** %exportstr51, align 4
  br label %if.end52

if.end52:                                         ; preds = %cond.end49, %cond.end
  %46 = load i32, i32* %list_index, align 4
  %inc = add nsw i32 %46, 1
  store i32 %inc, i32* %list_index, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end22
  br label %for.inc

for.inc:                                          ; preds = %if.end53, %if.then17, %if.then12
  %47 = load i32, i32* %i, align 4
  %inc54 = add nsw i32 %47, 1
  store i32 %inc54, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %48 = load i8**, i8*** %list, align 4
  %49 = load i32, i32* %list_index, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %48, i32 %49
  store i8* null, i8** %arrayidx55, align 4
  %50 = load i8**, i8*** %list, align 4
  ret i8** %50
}

declare void @set_current_options(i8*) #1

declare %struct.hash_table* @hash_copy(%struct.hash_table*, i8* (i8*)*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }
attributes #6 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
