; ModuleID = 'shopt.c'
source_filename = "shopt.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.anon = type { i8*, i32*, i32 (i8*, i32)* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"psuoq\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.1 = private unnamed_addr constant [50 x i8] c"cannot set and unset shell options simultaneously\00", align 1
@cdspelling = external global i32, align 4
@cdable_vars = external global i32, align 4
@autocd = external global i32, align 4
@check_hashed_filenames = external global i32, align 4
@check_window_size = external global i32, align 4
@glob_dot_filenames = external global i32, align 4
@allow_null_glob_expansion = external global i32, align 4
@no_exit_on_failed_exec = external global i32, align 4
@expand_aliases = external global i32, align 4
@extended_quote = external global i32, align 4
@fail_glob_expansion = external global i32, align 4
@glob_asciirange = external global i32, align 4
@glob_star = external global i32, align 4
@gnu_error_format = external global i32, align 4
@hup_on_exit = external global i32, align 4
@inherit_errexit = external global i32, align 4
@interactive_comments = external global i32, align 4
@lastpipe_opt = external global i32, align 4
@mail_warning = external global i32, align 4
@match_ignore_case = external global i32, align 4
@glob_ignore_case = external global i32, align 4
@print_shift_error = external global i32, align 4
@promptvars = external global i32, align 4
@source_uses_path = external global i32, align 4
@extended_glob = external global i32, align 4
@literal_history = external global i32, align 4
@force_append_history = external global i32, align 4
@command_oriented_history = external global i32, align 4
@complete_fullquote = external global i32, align 4
@force_fignore = external global i32, align 4
@history_reediting = external global i32, align 4
@hist_verify = external global i32, align 4
@perform_hostname_completion = external global i32, align 4
@dircomplete_expand = external global i32, align 4
@dircomplete_spelling = external global i32, align 4
@no_empty_command_completion = external global i32, align 4
@prog_completion_enabled = external global i32, align 4
@xpg_echo = external global i32, align 4
@login_shell = external global i32, align 4
@shopt_login_shell = internal global i32 0, align 4
@shopt_compat32 = internal global i32 0, align 4
@shopt_compat31 = internal global i32 0, align 4
@shopt_compat43 = internal global i32 0, align 4
@shopt_compat42 = internal global i32 0, align 4
@shopt_compat41 = internal global i32 0, align 4
@shopt_compat40 = internal global i32 0, align 4
@shell_compatibility_level = external global i32, align 4
@shopt_vars = internal global [48 x %struct.anon] [%struct.anon { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i32* @autocd, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i32 0, i32 0), i32* @cdable_vars, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.10, i32 0, i32 0), i32* @cdspelling, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0), i32* @check_hashed_filenames, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i32* @check_window_size, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i32* @command_oriented_history, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i32* @shopt_compat31, i32 (i8*, i32)* @set_compatibility_level }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.15, i32 0, i32 0), i32* @shopt_compat32, i32 (i8*, i32)* @set_compatibility_level }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.16, i32 0, i32 0), i32* @shopt_compat40, i32 (i8*, i32)* @set_compatibility_level }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i32 0, i32 0), i32* @shopt_compat41, i32 (i8*, i32)* @set_compatibility_level }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.18, i32 0, i32 0), i32* @shopt_compat42, i32 (i8*, i32)* @set_compatibility_level }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.19, i32 0, i32 0), i32* @shopt_compat43, i32 (i8*, i32)* @set_compatibility_level }, %struct.anon { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.20, i32 0, i32 0), i32* @complete_fullquote, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.21, i32 0, i32 0), i32* @dircomplete_expand, i32 (i8*, i32)* @shopt_set_complete_direxpand }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.22, i32 0, i32 0), i32* @dircomplete_spelling, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0), i32* @glob_dot_filenames, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.24, i32 0, i32 0), i32* @no_exit_on_failed_exec, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.25, i32 0, i32 0), i32* @expand_aliases, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.26, i32 0, i32 0), i32* @debugging_mode, i32 (i8*, i32)* @shopt_set_debug_mode }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.27, i32 0, i32 0), i32* @extended_glob, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), i32* @extended_quote, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.29, i32 0, i32 0), i32* @fail_glob_expansion, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.30, i32 0, i32 0), i32* @force_fignore, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.31, i32 0, i32 0), i32* @glob_asciirange, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.32, i32 0, i32 0), i32* @glob_star, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.33, i32 0, i32 0), i32* @gnu_error_format, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34, i32 0, i32 0), i32* @force_append_history, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.35, i32 0, i32 0), i32* @history_reediting, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.36, i32 0, i32 0), i32* @hist_verify, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.37, i32 0, i32 0), i32* @perform_hostname_completion, i32 (i8*, i32)* @shopt_enable_hostname_completion }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.38, i32 0, i32 0), i32* @hup_on_exit, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.39, i32 0, i32 0), i32* @inherit_errexit, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.40, i32 0, i32 0), i32* @interactive_comments, i32 (i8*, i32)* @set_shellopts_after_change }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.41, i32 0, i32 0), i32* @lastpipe_opt, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.42, i32 0, i32 0), i32* @literal_history, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.43, i32 0, i32 0), i32* @shopt_login_shell, i32 (i8*, i32)* @set_login_shell }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0), i32* @mail_warning, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.45, i32 0, i32 0), i32* @no_empty_command_completion, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.46, i32 0, i32 0), i32* @glob_ignore_case, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.47, i32 0, i32 0), i32* @match_ignore_case, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.48, i32 0, i32 0), i32* @allow_null_glob_expansion, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.49, i32 0, i32 0), i32* @prog_completion_enabled, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.50, i32 0, i32 0), i32* @promptvars, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.51, i32 0, i32 0), i32* @restricted_shell, i32 (i8*, i32)* @set_restricted_shell }, %struct.anon { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.52, i32 0, i32 0), i32* @print_shift_error, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.53, i32 0, i32 0), i32* @source_uses_path, i32 (i8*, i32)* null }, %struct.anon { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.54, i32 0, i32 0), i32* @xpg_echo, i32 (i8*, i32)* null }, %struct.anon zeroinitializer], align 4
@.str.2 = private unnamed_addr constant [12 x i8] c"./shopt.def\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"BASHOPTS\00", align 1
@mark_modified_vars = external global i32, align 4
@.str.4 = private unnamed_addr constant [12 x i8] c"set %co %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"%-15s\09%s\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"on\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"off\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"autocd\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"cdable_vars\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"cdspell\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"checkhash\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"checkwinsize\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c"cmdhist\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"compat31\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"compat32\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"compat40\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"compat41\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"compat42\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"compat43\00", align 1
@.str.20 = private unnamed_addr constant [19 x i8] c"complete_fullquote\00", align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"direxpand\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"dirspell\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"dotglob\00", align 1
@.str.24 = private unnamed_addr constant [9 x i8] c"execfail\00", align 1
@.str.25 = private unnamed_addr constant [15 x i8] c"expand_aliases\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c"extdebug\00", align 1
@debugging_mode = external global i32, align 4
@.str.27 = private unnamed_addr constant [8 x i8] c"extglob\00", align 1
@.str.28 = private unnamed_addr constant [9 x i8] c"extquote\00", align 1
@.str.29 = private unnamed_addr constant [9 x i8] c"failglob\00", align 1
@.str.30 = private unnamed_addr constant [14 x i8] c"force_fignore\00", align 1
@.str.31 = private unnamed_addr constant [16 x i8] c"globasciiranges\00", align 1
@.str.32 = private unnamed_addr constant [9 x i8] c"globstar\00", align 1
@.str.33 = private unnamed_addr constant [11 x i8] c"gnu_errfmt\00", align 1
@.str.34 = private unnamed_addr constant [11 x i8] c"histappend\00", align 1
@.str.35 = private unnamed_addr constant [11 x i8] c"histreedit\00", align 1
@.str.36 = private unnamed_addr constant [11 x i8] c"histverify\00", align 1
@.str.37 = private unnamed_addr constant [13 x i8] c"hostcomplete\00", align 1
@.str.38 = private unnamed_addr constant [10 x i8] c"huponexit\00", align 1
@.str.39 = private unnamed_addr constant [16 x i8] c"inherit_errexit\00", align 1
@.str.40 = private unnamed_addr constant [21 x i8] c"interactive_comments\00", align 1
@.str.41 = private unnamed_addr constant [9 x i8] c"lastpipe\00", align 1
@.str.42 = private unnamed_addr constant [8 x i8] c"lithist\00", align 1
@.str.43 = private unnamed_addr constant [12 x i8] c"login_shell\00", align 1
@.str.44 = private unnamed_addr constant [9 x i8] c"mailwarn\00", align 1
@.str.45 = private unnamed_addr constant [24 x i8] c"no_empty_cmd_completion\00", align 1
@.str.46 = private unnamed_addr constant [11 x i8] c"nocaseglob\00", align 1
@.str.47 = private unnamed_addr constant [12 x i8] c"nocasematch\00", align 1
@.str.48 = private unnamed_addr constant [9 x i8] c"nullglob\00", align 1
@.str.49 = private unnamed_addr constant [9 x i8] c"progcomp\00", align 1
@.str.50 = private unnamed_addr constant [11 x i8] c"promptvars\00", align 1
@.str.51 = private unnamed_addr constant [17 x i8] c"restricted_shell\00", align 1
@restricted_shell = external global i32, align 4
@.str.52 = private unnamed_addr constant [14 x i8] c"shift_verbose\00", align 1
@.str.53 = private unnamed_addr constant [11 x i8] c"sourcepath\00", align 1
@.str.54 = private unnamed_addr constant [9 x i8] c"xpg_echo\00", align 1
@function_trace_mode = external global i32, align 4
@error_trace_mode = external global i32, align 4
@set_restricted_shell.save_restricted = internal global i32 -1, align 4
@shell_name = external global i8*, align 4
@.str.55 = private unnamed_addr constant [30 x i8] c"%s: invalid shell option name\00", align 1
@.str.56 = private unnamed_addr constant [13 x i8] c"shopt %s %s\0A\00", align 1
@.str.57 = private unnamed_addr constant [3 x i8] c"-s\00", align 1
@.str.58 = private unnamed_addr constant [3 x i8] c"-u\00", align 1

; Function Attrs: noinline nounwind
define i32 @shopt_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %opt = alloca i32, align 4
  %flags = alloca i32, align 4
  %rval = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %flags, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 115, label %sw.bb
    i32 117, label %sw.bb1
    i32 113, label %sw.bb3
    i32 111, label %sw.bb5
    i32 112, label %sw.bb7
    i32 -99, label %sw.bb9
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i32, i32* %flags, align 4
  %or = or i32 %2, 1
  store i32 %or, i32* %flags, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  %3 = load i32, i32* %flags, align 4
  %or2 = or i32 %3, 2
  store i32 %or2, i32* %flags, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  %4 = load i32, i32* %flags, align 4
  %or4 = or i32 %4, 4
  store i32 %or4, i32* %flags, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  %5 = load i32, i32* %flags, align 4
  %or6 = or i32 %5, 8
  store i32 %or6, i32* %flags, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %6 = load i32, i32* %flags, align 4
  %or8 = or i32 %6, 16
  store i32 %or8, i32* %flags, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb7, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %7, %struct.word_list** %list.addr, align 4
  %8 = load i32, i32* %flags, align 4
  %and = and i32 %8, 3
  %cmp10 = icmp eq i32 %and, 3
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %call11 = call i8* @libintl_gettext(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.1, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call11)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end
  store i32 0, i32* %rval, align 4
  %9 = load i32, i32* %flags, align 4
  %and12 = and i32 %9, 8
  %tobool = icmp ne i32 %and12, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %10 = load i32, i32* %flags, align 4
  %and13 = and i32 %10, 3
  %cmp14 = icmp eq i32 %and13, 0
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %land.lhs.true
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %12 = load i32, i32* %flags, align 4
  %call16 = call i32 @list_shopt_o_options(%struct.word_list* %11, i32 %12)
  store i32 %call16, i32* %rval, align 4
  br label %if.end59

if.else:                                          ; preds = %land.lhs.true, %if.end
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool17 = icmp ne %struct.word_list* %13, null
  br i1 %tobool17, label %land.lhs.true18, label %if.else26

land.lhs.true18:                                  ; preds = %if.else
  %14 = load i32, i32* %flags, align 4
  %and19 = and i32 %14, 8
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.else26

if.then21:                                        ; preds = %land.lhs.true18
  %15 = load i32, i32* %flags, align 4
  %and22 = and i32 %15, 1
  %tobool23 = icmp ne i32 %and22, 0
  %cond = select i1 %tobool23, i32 45, i32 43
  %16 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %17 = load i32, i32* %flags, align 4
  %and24 = and i32 %17, 4
  %call25 = call i32 @set_shopt_o_options(i32 %cond, %struct.word_list* %16, i32 %and24)
  store i32 %call25, i32* %rval, align 4
  br label %if.end58

if.else26:                                        ; preds = %land.lhs.true18, %if.else
  %18 = load i32, i32* %flags, align 4
  %and27 = and i32 %18, 8
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.else34

if.then29:                                        ; preds = %if.else26
  %19 = load i32, i32* %flags, align 4
  %and30 = and i32 %19, 1
  %tobool31 = icmp ne i32 %and30, 0
  %cond32 = select i1 %tobool31, i32 1, i32 0
  %20 = load i32, i32* %flags, align 4
  %call33 = call i32 @list_some_o_options(i32 %cond32, i32 %20)
  store i32 %call33, i32* %rval, align 4
  br label %if.end57

if.else34:                                        ; preds = %if.else26
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool35 = icmp ne %struct.word_list* %21, null
  br i1 %tobool35, label %land.lhs.true36, label %if.else45

land.lhs.true36:                                  ; preds = %if.else34
  %22 = load i32, i32* %flags, align 4
  %and37 = and i32 %22, 3
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then39, label %if.else45

if.then39:                                        ; preds = %land.lhs.true36
  %23 = load i32, i32* %flags, align 4
  %and40 = and i32 %23, 1
  %tobool41 = icmp ne i32 %and40, 0
  %cond42 = select i1 %tobool41, i32 1, i32 0
  %24 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %25 = load i32, i32* %flags, align 4
  %and43 = and i32 %25, 4
  %call44 = call i32 @toggle_shopts(i32 %cond42, %struct.word_list* %24, i32 %and43)
  store i32 %call44, i32* %rval, align 4
  br label %if.end56

if.else45:                                        ; preds = %land.lhs.true36, %if.else34
  %26 = load i32, i32* %flags, align 4
  %and46 = and i32 %26, 3
  %cmp47 = icmp eq i32 %and46, 0
  br i1 %cmp47, label %if.then48, label %if.else50

if.then48:                                        ; preds = %if.else45
  %27 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %28 = load i32, i32* %flags, align 4
  %call49 = call i32 @list_shopts(%struct.word_list* %27, i32 %28)
  store i32 %call49, i32* %rval, align 4
  br label %if.end55

if.else50:                                        ; preds = %if.else45
  %29 = load i32, i32* %flags, align 4
  %and51 = and i32 %29, 1
  %tobool52 = icmp ne i32 %and51, 0
  %cond53 = select i1 %tobool52, i32 1, i32 0
  %30 = load i32, i32* %flags, align 4
  %call54 = call i32 @list_some_shopts(i32 %cond53, i32 %30)
  store i32 %call54, i32* %rval, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.else50, %if.then48
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then39
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then29
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %if.then21
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.then15
  %31 = load i32, i32* %rval, align 4
  store i32 %31, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end59, %if.then, %sw.default, %sw.bb9
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @list_shopt_o_options(%struct.word_list* %list, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %flags.addr = alloca i32, align 4
  %l = alloca %struct.word_list*, align 4
  %val = alloca i32, align 4
  %rval = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %flags.addr, align 4
  %and = and i32 %1, 4
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %flags.addr, align 4
  %and3 = and i32 %2, 16
  call void @list_minus_o_opts(i32 -1, i32 %and3)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %call = call i32 @sh_chkwrite(i32 0)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %entry
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %3, %struct.word_list** %l, align 4
  store i32 0, i32* %rval, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %4, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word5, align 4
  %call6 = call i32 @minus_o_option_value(i8* %7)
  store i32 %call6, i32* %val, align 4
  %8 = load i32, i32* %val, align 4
  %cmp7 = icmp eq i32 %8, -1
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %for.body
  %9 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word9 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word9, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word10, align 4
  call void @sh_invalidoptname(i8* %11)
  store i32 1, i32* %rval, align 4
  br label %for.inc

if.end11:                                         ; preds = %for.body
  %12 = load i32, i32* %val, align 4
  %cmp12 = icmp eq i32 %12, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end11
  store i32 1, i32* %rval, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end11
  %13 = load i32, i32* %flags.addr, align 4
  %and15 = and i32 %13, 4
  %cmp16 = icmp eq i32 %and15, 0
  br i1 %cmp16, label %if.then17, label %if.end31

if.then17:                                        ; preds = %if.end14
  %14 = load i32, i32* %flags.addr, align 4
  %and18 = and i32 %14, 16
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then20, label %if.else

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %val, align 4
  %tobool21 = icmp ne i32 %15, 0
  %cond = select i1 %tobool21, i32 45, i32 43
  %16 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word22 = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 1
  %17 = load %struct.word_desc*, %struct.word_desc** %word22, align 4
  %word23 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word23, align 4
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0), i32 %cond, i8* %18)
  br label %if.end30

if.else:                                          ; preds = %if.then17
  %19 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word25 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word25, align 4
  %word26 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word26, align 4
  %22 = load i32, i32* %val, align 4
  %tobool27 = icmp ne i32 %22, 0
  %cond28 = select i1 %tobool27, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0)
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i8* %21, i8* %cond28)
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then20
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.end14
  br label %for.inc

for.inc:                                          ; preds = %if.end31, %if.then8
  %23 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %23, i32 0, i32 0
  %24 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %24, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %25 = load i32, i32* %rval, align 4
  %call32 = call i32 @sh_chkwrite(i32 %25)
  store i32 %call32, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.end
  %26 = load i32, i32* %retval, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind
define internal i32 @set_shopt_o_options(i32 %mode, %struct.word_list* %list, i32 %quiet) #0 {
entry:
  %mode.addr = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %quiet.addr = alloca i32, align 4
  %l = alloca %struct.word_list*, align 4
  %rval = alloca i32, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %quiet, i32* %quiet.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %l, align 4
  store i32 0, i32* %rval, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %mode.addr, align 4
  %3 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word1, align 4
  %call = call i32 @set_minus_o_option(i32 %2, i8* %5)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %rval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 0
  %7 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %7, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @set_shellopts()
  %8 = load i32, i32* %rval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @list_some_o_options(i32 %mode, i32 %flags) #0 {
entry:
  %mode.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 4
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %mode.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %and1 = and i32 %2, 16
  call void @list_minus_o_opts(i32 %1, i32 %and1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 @sh_chkwrite(i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @toggle_shopts(i32 %mode, %struct.word_list* %list, i32 %quiet) #0 {
entry:
  %mode.addr = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %quiet.addr = alloca i32, align 4
  %l = alloca %struct.word_list*, align 4
  %ind = alloca i32, align 4
  %rval = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %quiet, i32* %quiet.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %l, align 4
  store i32 0, i32* %rval, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %3, i32 0, i32 0
  %4 = load i8*, i8** %word1, align 4
  %call = call i32 @find_shopt(i8* %4)
  store i32 %call, i32* %ind, align 4
  %5 = load i32, i32* %ind, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %6 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word2 = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 1
  %7 = load %struct.word_desc*, %struct.word_desc** %word2, align 4
  %word3 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word3, align 4
  call void @shopt_error(i8* %8)
  store i32 1, i32* %rval, align 4
  br label %if.end11

if.else:                                          ; preds = %for.body
  %9 = load i32, i32* %mode.addr, align 4
  %10 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %10
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 1
  %11 = load i32*, i32** %value, align 4
  store i32 %9, i32* %11, align 4
  %12 = load i32, i32* %ind, align 4
  %arrayidx4 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %12
  %set_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx4, i32 0, i32 2
  %13 = load i32 (i8*, i32)*, i32 (i8*, i32)** %set_func, align 4
  %tobool5 = icmp ne i32 (i8*, i32)* %13, null
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.else
  %14 = load i32, i32* %ind, align 4
  %arrayidx7 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %14
  %set_func8 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx7, i32 0, i32 2
  %15 = load i32 (i8*, i32)*, i32 (i8*, i32)** %set_func8, align 4
  %16 = load i32, i32* %ind, align 4
  %arrayidx9 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %16
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx9, i32 0, i32 0
  %17 = load i8*, i8** %name, align 4
  %18 = load i32, i32* %mode.addr, align 4
  %call10 = call i32 %15(i8* %17, i32 %18)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %19 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 0
  %20 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %20, %struct.word_list** %l, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call12 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
  store %struct.variable* %call12, %struct.variable** %v, align 4
  %tobool13 = icmp ne %struct.variable* %call12, null
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %for.end
  call void @set_bashopts()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %for.end
  %21 = load i32, i32* %rval, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind
define internal i32 @list_shopts(%struct.word_list* %list, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %flags.addr = alloca i32, align 4
  %l = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %val = alloca i32, align 4
  %rval = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %1
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %3
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 1
  %4 = load i32*, i32** %value, align 4
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %val, align 4
  %6 = load i32, i32* %flags.addr, align 4
  %and = and i32 %6, 4
  %cmp2 = icmp eq i32 %and, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %7
  %name5 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx4, i32 0, i32 0
  %8 = load i8*, i8** %name5, align 4
  %9 = load i32, i32* %val, align 4
  %10 = load i32, i32* %flags.addr, align 4
  call void @print_shopt(i8* %8, i32 %9, i32 %10)
  br label %if.end

if.end:                                           ; preds = %if.then3, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call i32 @sh_chkwrite(i32 0)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %entry
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %12, %struct.word_list** %l, align 4
  store i32 0, i32* %rval, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc28, %if.end6
  %13 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool8 = icmp ne %struct.word_list* %13, null
  br i1 %tobool8, label %for.body9, label %for.end29

for.body9:                                        ; preds = %for.cond7
  %14 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word10, align 4
  %call11 = call i32 @find_shopt(i8* %16)
  store i32 %call11, i32* %i, align 4
  %17 = load i32, i32* %i, align 4
  %cmp12 = icmp slt i32 %17, 0
  br i1 %cmp12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %for.body9
  %18 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word15, align 4
  call void @shopt_error(i8* %20)
  store i32 1, i32* %rval, align 4
  br label %for.inc28

if.end16:                                         ; preds = %for.body9
  %21 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %21
  %value18 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx17, i32 0, i32 1
  %22 = load i32*, i32** %value18, align 4
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %val, align 4
  %24 = load i32, i32* %val, align 4
  %cmp19 = icmp eq i32 %24, 0
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end16
  store i32 1, i32* %rval, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end16
  %25 = load i32, i32* %flags.addr, align 4
  %and22 = and i32 %25, 4
  %cmp23 = icmp eq i32 %and22, 0
  br i1 %cmp23, label %if.then24, label %if.end27

if.then24:                                        ; preds = %if.end21
  %26 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word25 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 1
  %27 = load %struct.word_desc*, %struct.word_desc** %word25, align 4
  %word26 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %27, i32 0, i32 0
  %28 = load i8*, i8** %word26, align 4
  %29 = load i32, i32* %val, align 4
  %30 = load i32, i32* %flags.addr, align 4
  call void @print_shopt(i8* %28, i32 %29, i32 %30)
  br label %if.end27

if.end27:                                         ; preds = %if.then24, %if.end21
  br label %for.inc28

for.inc28:                                        ; preds = %if.end27, %if.then13
  %31 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 0
  %32 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %32, %struct.word_list** %l, align 4
  br label %for.cond7

for.end29:                                        ; preds = %for.cond7
  %33 = load i32, i32* %rval, align 4
  %call30 = call i32 @sh_chkwrite(i32 %33)
  store i32 %call30, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end29, %for.end
  %34 = load i32, i32* %retval, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind
define internal i32 @list_some_shopts(i32 %mode, i32 %flags) #0 {
entry:
  %mode.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %2
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 1
  %3 = load i32*, i32** %value, align 4
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %val, align 4
  %5 = load i32, i32* %flags.addr, align 4
  %and = and i32 %5, 4
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %6 = load i32, i32* %mode.addr, align 4
  %7 = load i32, i32* %val, align 4
  %cmp2 = icmp eq i32 %6, %7
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %8
  %name4 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx3, i32 0, i32 0
  %9 = load i8*, i8** %name4, align 4
  %10 = load i32, i32* %val, align 4
  %11 = load i32, i32* %flags.addr, align 4
  call void @print_shopt(i8* %9, i32 %10, i32 %11)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call i32 @sh_chkwrite(i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define void @reset_shopt_options() #0 {
entry:
  store i32 0, i32* @cdspelling, align 4
  store i32 0, i32* @cdable_vars, align 4
  store i32 0, i32* @autocd, align 4
  store i32 0, i32* @check_hashed_filenames, align 4
  store i32 0, i32* @check_window_size, align 4
  store i32 0, i32* @glob_dot_filenames, align 4
  store i32 0, i32* @allow_null_glob_expansion, align 4
  store i32 0, i32* @no_exit_on_failed_exec, align 4
  store i32 0, i32* @expand_aliases, align 4
  store i32 1, i32* @extended_quote, align 4
  store i32 0, i32* @fail_glob_expansion, align 4
  store i32 0, i32* @glob_asciirange, align 4
  store i32 0, i32* @glob_star, align 4
  store i32 0, i32* @gnu_error_format, align 4
  store i32 0, i32* @hup_on_exit, align 4
  store i32 0, i32* @inherit_errexit, align 4
  store i32 1, i32* @interactive_comments, align 4
  store i32 0, i32* @lastpipe_opt, align 4
  store i32 0, i32* @mail_warning, align 4
  store i32 0, i32* @match_ignore_case, align 4
  store i32 0, i32* @glob_ignore_case, align 4
  store i32 0, i32* @print_shift_error, align 4
  store i32 1, i32* @promptvars, align 4
  store i32 1, i32* @source_uses_path, align 4
  store i32 0, i32* @extended_glob, align 4
  store i32 0, i32* @literal_history, align 4
  store i32 0, i32* @force_append_history, align 4
  store i32 1, i32* @command_oriented_history, align 4
  store i32 1, i32* @complete_fullquote, align 4
  store i32 1, i32* @force_fignore, align 4
  store i32 0, i32* @history_reediting, align 4
  store i32 0, i32* @hist_verify, align 4
  store i32 1, i32* @perform_hostname_completion, align 4
  store i32 0, i32* @dircomplete_expand, align 4
  store i32 0, i32* @dircomplete_spelling, align 4
  store i32 0, i32* @no_empty_command_completion, align 4
  store i32 1, i32* @prog_completion_enabled, align 4
  store i32 0, i32* @xpg_echo, align 4
  %0 = load i32, i32* @login_shell, align 4
  store i32 %0, i32* @shopt_login_shell, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @set_compatibility_opts() #0 {
entry:
  store i32 0, i32* @shopt_compat32, align 4
  store i32 0, i32* @shopt_compat31, align 4
  store i32 0, i32* @shopt_compat43, align 4
  store i32 0, i32* @shopt_compat42, align 4
  store i32 0, i32* @shopt_compat41, align 4
  store i32 0, i32* @shopt_compat40, align 4
  %0 = load i32, i32* @shell_compatibility_level, align 4
  switch i32 %0, label %sw.epilog [
    i32 44, label %sw.bb
    i32 43, label %sw.bb1
    i32 42, label %sw.bb2
    i32 41, label %sw.bb3
    i32 40, label %sw.bb4
    i32 32, label %sw.bb5
    i32 31, label %sw.bb6
  ]

sw.bb:                                            ; preds = %entry
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store i32 1, i32* @shopt_compat43, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  store i32 1, i32* @shopt_compat42, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  store i32 1, i32* @shopt_compat41, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  store i32 1, i32* @shopt_compat40, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  store i32 1, i32* @shopt_compat32, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  store i32 1, i32* @shopt_compat31, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  ret void
}

; Function Attrs: noinline nounwind
define i32 @set_login_shell(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* @login_shell, align 4
  %cmp = icmp ne i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @shopt_login_shell, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i8** @get_shopt_options() #0 {
entry:
  %ret = alloca i8**, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 48, i32* %n, align 4
  %0 = load i32, i32* %n, align 4
  %add = add nsw i32 %0, 1
  %call = call i8** @strvec_create(i32 %add)
  store i8** %call, i8*** %ret, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %1
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %3
  %name2 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx1, i32 0, i32 0
  %4 = load i8*, i8** %name2, align 4
  %call3 = call i32 @strlen(i8* %4)
  %add4 = add i32 1, %call3
  %call5 = call i8* @sh_xmalloc(i32 %add4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 698)
  %5 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %5
  %name7 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx6, i32 0, i32 0
  %6 = load i8*, i8** %name7, align 4
  %call8 = call i8* @strcpy(i8* %call5, i8* %6)
  %7 = load i8**, i8*** %ret, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %7, i32 %8
  store i8* %call8, i8** %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i8**, i8*** %ret, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %10, i32 %11
  store i8* null, i8** %arrayidx10, align 4
  %12 = load i8**, i8*** %ret, align 4
  ret i8** %12
}

declare i8** @strvec_create(i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @shopt_setopt(i8* %name, i32 %mode) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  %wl = alloca %struct.word_list*, align 4
  %r = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.word_desc* @make_word(i8* %0)
  %call1 = call %struct.word_list* @make_word_list(%struct.word_desc* %call, %struct.word_list* null)
  store %struct.word_list* %call1, %struct.word_list** %wl, align 4
  %1 = load i32, i32* %mode.addr, align 4
  %2 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %call2 = call i32 @toggle_shopts(i32 %1, %struct.word_list* %2, i32 0)
  store i32 %call2, i32* %r, align 4
  %3 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %3)
  %4 = load i32, i32* %r, align 4
  ret i32 %4
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_word(i8*) #1

declare void @dispose_words(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define i32 @shopt_listopt(i8* %name, i32 %reusable) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %reusable.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %reusable, i32* %reusable.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %reusable.addr, align 4
  %tobool = icmp ne i32 %1, 0
  %cond = select i1 %tobool, i32 16, i32 0
  %call = call i32 @list_shopts(%struct.word_list* null, i32 %cond)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call1 = call i32 @find_shopt(i8* %2)
  store i32 %call1, i32* %i, align 4
  %3 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i8*, i8** %name.addr, align 4
  call void @shopt_error(i8* %4)
  store i32 1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %5 = load i8*, i8** %name.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %6
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 1
  %7 = load i32*, i32** %value, align 4
  %8 = load i32, i32* %7, align 4
  %9 = load i32, i32* %reusable.addr, align 4
  %tobool5 = icmp ne i32 %9, 0
  %cond6 = select i1 %tobool5, i32 16, i32 0
  call void @print_shopt(i8* %5, i32 %8, i32 %cond6)
  %call7 = call i32 @sh_chkwrite(i32 0)
  store i32 %call7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal i32 @find_shopt(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %0
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
  %arrayidx3 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %4
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
  %arrayidx8 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %8
  %name9 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx8, i32 0, i32 0
  %9 = load i8*, i8** %name9, align 4
  %call = call i32 @strcmp(i8* %7, i8* %9)
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %i, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind
define internal void @shopt_error(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.55, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_shopt(i8* %name, i32 %val, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %val.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %val, i32* %val.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val.addr, align 4
  %tobool1 = icmp ne i32 %1, 0
  %cond = select i1 %tobool1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.57, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.58, i32 0, i32 0)
  %2 = load i8*, i8** %name.addr, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.56, i32 0, i32 0), i8* %cond, i8* %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i32, i32* %val.addr, align 4
  %tobool2 = icmp ne i32 %4, 0
  %cond3 = select i1 %tobool2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0)
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0), i8* %3, i8* %cond3)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i32 @sh_chkwrite(i32) #1

; Function Attrs: noinline nounwind
define void @set_bashopts() #0 {
entry:
  %value = alloca i8*, align 4
  %tflag = alloca [48 x i8], align 1
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
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [48 x i8], [48 x i8]* %tflag, i32 0, i32 %2
  store i8 0, i8* %arrayidx1, align 1
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %3
  %value3 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx2, i32 0, i32 1
  %4 = load i32*, i32** %value3, align 4
  %5 = load i32, i32* %4, align 4
  %tobool4 = icmp ne i32 %5, 0
  br i1 %tobool4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %6
  %name6 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx5, i32 0, i32 0
  %7 = load i8*, i8** %name6, align 4
  %call = call i32 @strlen(i8* %7)
  %add = add i32 %call, 1
  %8 = load i32, i32* %vsize, align 4
  %add7 = add i32 %8, %add
  store i32 %add7, i32* %vsize, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [48 x i8], [48 x i8]* %tflag, i32 0, i32 %9
  store i8 1, i8* %arrayidx8, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %vsize, align 4
  %add9 = add nsw i32 %11, 1
  %call10 = call i8* @sh_xmalloc(i32 %add9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 761)
  store i8* %call10, i8** %value, align 4
  store i32 0, i32* %vptr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc29, %for.end
  %12 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %12
  %name13 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx12, i32 0, i32 0
  %13 = load i8*, i8** %name13, align 4
  %tobool14 = icmp ne i8* %13, null
  br i1 %tobool14, label %for.body15, label %for.end31

for.body15:                                       ; preds = %for.cond11
  %14 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds [48 x i8], [48 x i8]* %tflag, i32 0, i32 %14
  %15 = load i8, i8* %arrayidx16, align 1
  %tobool17 = icmp ne i8 %15, 0
  br i1 %tobool17, label %if.then18, label %if.end28

if.then18:                                        ; preds = %for.body15
  %16 = load i8*, i8** %value, align 4
  %17 = load i32, i32* %vptr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %18
  %name20 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx19, i32 0, i32 0
  %19 = load i8*, i8** %name20, align 4
  %call21 = call i8* @strcpy(i8* %add.ptr, i8* %19)
  %20 = load i32, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %20
  %name23 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx22, i32 0, i32 0
  %21 = load i8*, i8** %name23, align 4
  %call24 = call i32 @strlen(i8* %21)
  %22 = load i32, i32* %vptr, align 4
  %add25 = add i32 %22, %call24
  store i32 %add25, i32* %vptr, align 4
  %23 = load i8*, i8** %value, align 4
  %24 = load i32, i32* %vptr, align 4
  %inc26 = add nsw i32 %24, 1
  store i32 %inc26, i32* %vptr, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %23, i32 %24
  store i8 58, i8* %arrayidx27, align 1
  br label %if.end28

if.end28:                                         ; preds = %if.then18, %for.body15
  br label %for.inc29

for.inc29:                                        ; preds = %if.end28
  %25 = load i32, i32* %i, align 4
  %inc30 = add nsw i32 %25, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond11

for.end31:                                        ; preds = %for.cond11
  %26 = load i32, i32* %vptr, align 4
  %tobool32 = icmp ne i32 %26, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %for.end31
  %27 = load i32, i32* %vptr, align 4
  %dec = add nsw i32 %27, -1
  store i32 %dec, i32* %vptr, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %for.end31
  %28 = load i8*, i8** %value, align 4
  %29 = load i32, i32* %vptr, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %28, i32 %29
  store i8 0, i8* %arrayidx35, align 1
  %call36 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
  store %struct.variable* %call36, %struct.variable** %v, align 4
  %30 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool37 = icmp ne %struct.variable* %30, null
  br i1 %tobool37, label %if.then38, label %if.else

if.then38:                                        ; preds = %if.end34
  %31 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %31, i32 0, i32 5
  %32 = load i32, i32* %attributes, align 4
  %and = and i32 %32, -3
  store i32 %and, i32* %attributes, align 4
  %33 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes39 = getelementptr inbounds %struct.variable, %struct.variable* %33, i32 0, i32 5
  %34 = load i32, i32* %attributes39, align 4
  %and40 = and i32 %34, 1
  store i32 %and40, i32* %exported, align 4
  br label %if.end41

if.else:                                          ; preds = %if.end34
  store i32 0, i32* %exported, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then38
  %35 = load i8*, i8** %value, align 4
  %call42 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0), i8* %35, i32 0)
  store %struct.variable* %call42, %struct.variable** %v, align 4
  %36 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes43 = getelementptr inbounds %struct.variable, %struct.variable* %36, i32 0, i32 5
  %37 = load i32, i32* %attributes43, align 4
  %or = or i32 %37, 2
  store i32 %or, i32* %attributes43, align 4
  %38 = load i32, i32* @mark_modified_vars, align 4
  %tobool44 = icmp ne i32 %38, 0
  br i1 %tobool44, label %land.lhs.true, label %if.end52

land.lhs.true:                                    ; preds = %if.end41
  %39 = load i32, i32* %exported, align 4
  %cmp = icmp eq i32 %39, 0
  br i1 %cmp, label %land.lhs.true45, label %if.end52

land.lhs.true45:                                  ; preds = %land.lhs.true
  %40 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes46 = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 5
  %41 = load i32, i32* %attributes46, align 4
  %and47 = and i32 %41, 1
  %tobool48 = icmp ne i32 %and47, 0
  br i1 %tobool48, label %if.then49, label %if.end52

if.then49:                                        ; preds = %land.lhs.true45
  %42 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes50 = getelementptr inbounds %struct.variable, %struct.variable* %42, i32 0, i32 5
  %43 = load i32, i32* %attributes50, align 4
  %and51 = and i32 %43, -2
  store i32 %and51, i32* %attributes50, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then49, %land.lhs.true45, %land.lhs.true, %if.end41
  %44 = load i8*, i8** %value, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 798)
  ret void
}

declare %struct.variable* @find_variable(i8*) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @parse_bashopts(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  %vname = alloca i8*, align 4
  %vptr = alloca i32, align 4
  %ind = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 0, i32* %vptr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end10, %entry
  %0 = load i8*, i8** %value.addr, align 4
  %call = call i8* @extract_colon_unit(i8* %0, i32* %vptr)
  store i8* %call, i8** %vname, align 4
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** %vname, align 4
  %call1 = call i32 @find_shopt(i8* %1)
  store i32 %call1, i32* %ind, align 4
  %2 = load i32, i32* %ind, align 4
  %cmp = icmp sge i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end10

if.then:                                          ; preds = %while.body
  %3 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %3
  %value2 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 1
  %4 = load i32*, i32** %value2, align 4
  store i32 1, i32* %4, align 4
  %5 = load i32, i32* %ind, align 4
  %arrayidx3 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %5
  %set_func = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx3, i32 0, i32 2
  %6 = load i32 (i8*, i32)*, i32 (i8*, i32)** %set_func, align 4
  %tobool4 = icmp ne i32 (i8*, i32)* %6, null
  br i1 %tobool4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  %7 = load i32, i32* %ind, align 4
  %arrayidx6 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %7
  %set_func7 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx6, i32 0, i32 2
  %8 = load i32 (i8*, i32)*, i32 (i8*, i32)** %set_func7, align 4
  %9 = load i32, i32* %ind, align 4
  %arrayidx8 = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %9
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx8, i32 0, i32 0
  %10 = load i8*, i8** %name, align 4
  %call9 = call i32 %8(i8* %10, i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  br label %if.end10

if.end10:                                         ; preds = %if.end, %while.body
  %11 = load i8*, i8** %vname, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 818)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare i8* @extract_colon_unit(i8*, i32*) #1

; Function Attrs: noinline nounwind
define void @initialize_bashopts(i32 %no_bashopts) #0 {
entry:
  %no_bashopts.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  store i32 %no_bashopts, i32* %no_bashopts.addr, align 4
  %0 = load i32, i32* %no_bashopts.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end16

if.then:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
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
  %call10 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 835)
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
  call void @parse_bashopts(i8* %13)
  %14 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 839)
  br label %if.end

if.end:                                           ; preds = %if.then14, %cond.end
  br label %if.end15

if.end15:                                         ; preds = %if.end, %land.lhs.true, %if.then
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %entry
  call void @set_bashopts()
  ret void
}

declare void @list_minus_o_opts(i32, i32) #1

declare i32 @minus_o_option_value(i8*) #1

declare void @sh_invalidoptname(i8*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @set_minus_o_option(i32, i8*) #1

declare void @set_shellopts() #1

; Function Attrs: noinline nounwind
define internal i32 @set_compatibility_level(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  %ind = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* %mode.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @shopt_compat32, align 4
  store i32 0, i32* @shopt_compat31, align 4
  store i32 0, i32* @shopt_compat43, align 4
  store i32 0, i32* @shopt_compat42, align 4
  store i32 0, i32* @shopt_compat41, align 4
  store i32 0, i32* @shopt_compat40, align 4
  %1 = load i8*, i8** %option_name.addr, align 4
  %call = call i32 @find_shopt(i8* %1)
  store i32 %call, i32* %ind, align 4
  %2 = load i32, i32* %mode.addr, align 4
  %3 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds [48 x %struct.anon], [48 x %struct.anon]* @shopt_vars, i32 0, i32 %3
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 1
  %4 = load i32*, i32** %value, align 4
  store i32 %2, i32* %4, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* @shopt_compat31, align 4
  %tobool1 = icmp ne i32 %5, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store i32 31, i32* @shell_compatibility_level, align 4
  br label %if.end23

if.else:                                          ; preds = %if.end
  %6 = load i32, i32* @shopt_compat32, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  store i32 32, i32* @shell_compatibility_level, align 4
  br label %if.end22

if.else5:                                         ; preds = %if.else
  %7 = load i32, i32* @shopt_compat40, align 4
  %tobool6 = icmp ne i32 %7, 0
  br i1 %tobool6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %if.else5
  store i32 40, i32* @shell_compatibility_level, align 4
  br label %if.end21

if.else8:                                         ; preds = %if.else5
  %8 = load i32, i32* @shopt_compat41, align 4
  %tobool9 = icmp ne i32 %8, 0
  br i1 %tobool9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else8
  store i32 41, i32* @shell_compatibility_level, align 4
  br label %if.end20

if.else11:                                        ; preds = %if.else8
  %9 = load i32, i32* @shopt_compat42, align 4
  %tobool12 = icmp ne i32 %9, 0
  br i1 %tobool12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else11
  store i32 42, i32* @shell_compatibility_level, align 4
  br label %if.end19

if.else14:                                        ; preds = %if.else11
  %10 = load i32, i32* @shopt_compat43, align 4
  %tobool15 = icmp ne i32 %10, 0
  br i1 %tobool15, label %if.then16, label %if.else17

if.then16:                                        ; preds = %if.else14
  store i32 43, i32* @shell_compatibility_level, align 4
  br label %if.end18

if.else17:                                        ; preds = %if.else14
  store i32 44, i32* @shell_compatibility_level, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else17, %if.then16
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then13
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then10
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then7
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then4
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then2
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @shopt_set_complete_direxpand(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  call void @set_directory_hook()
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @shopt_set_debug_mode(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* @debugging_mode, align 4
  store i32 %0, i32* @function_trace_mode, align 4
  store i32 %0, i32* @error_trace_mode, align 4
  call void @set_shellopts()
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @shopt_enable_hostname_completion(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* %mode.addr, align 4
  %call = call i32 @enable_hostname_completion(i32 %0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @set_shellopts_after_change(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  call void @set_shellopts()
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @set_restricted_shell(i8* %option_name, i32 %mode) #0 {
entry:
  %option_name.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  store i8* %option_name, i8** %option_name.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* @set_restricted_shell.save_restricted, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @shell_name, align 4
  %call = call i32 @shell_is_restricted(i8* %1)
  store i32 %call, i32* @set_restricted_shell.save_restricted, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @set_restricted_shell.save_restricted, align 4
  store i32 %2, i32* @restricted_shell, align 4
  ret i32 0
}

declare void @set_directory_hook() #1

declare i32 @enable_hostname_completion(i32) #1

declare i32 @shell_is_restricted(i8*) #1

declare i32 @strcmp(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
