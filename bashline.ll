; ModuleID = 'bashline.c'
source_filename = "bashline.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._IO_FILE = type opaque
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.alias = type { i8*, i8*, i8 }
%struct.STRING_INT_ALIST = type { i8*, i32 }
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.servent = type { i8*, i8**, i32, i8* }
%struct.group = type { i8*, i8*, i32, i8** }
%struct.ignorevar = type { i8*, %struct.ign*, i32, i8*, i32 (%struct.ign*)* }
%struct.ign = type { i8*, i32, i32 }
%struct.__mbstate_t = type { i32, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct._sh_parser_state_t = type { i32, i32*, i8*, i32, i32, i32, i8**, i32, i32, i32, i32, %struct.array*, i32 (%struct.word_list*)*, i32 (%struct.word_list*)*, i32, i32, i32, i32, [16 x %struct.redirect*] }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%struct._hist_entry = type { i8*, i8*, i8* }

@bash_readline_initialized = global i32 0, align 4
@perform_hostname_completion = global i32 1, align 4
@force_fignore = global i32 1, align 4
@dircomplete_spelling = global i32 0, align 4
@dircomplete_expand = global i32 0, align 4
@dircomplete_expand_relpath = global i32 0, align 4
@complete_fullquote = global i32 1, align 4
@.str = private unnamed_addr constant [14 x i8] c"comment-begin\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@bash_completer_word_break_characters = internal global i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.43, i32 0, i32 0), align 4
@.str.2 = private unnamed_addr constant [11 x i8] c"bashline.c\00", align 1
@bash_nohostname_word_break_characters = internal global i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.44, i32 0, i32 0), align 4
@rl_completer_word_break_characters = external global i8*, align 4
@.str.3 = private unnamed_addr constant [3 x i8] c"$@\00", align 1
@rl_special_prefixes = external global i8*, align 4
@.str.4 = private unnamed_addr constant [2 x i8] c"$\00", align 1
@rl_basic_word_break_characters = external global i8*, align 4
@.str.5 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@rl_terminal_name = external global i8*, align 4
@stdin = external constant %struct._IO_FILE*, align 4
@rl_instream = external global %struct._IO_FILE*, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@rl_outstream = external global %struct._IO_FILE*, align 4
@.str.6 = private unnamed_addr constant [5 x i8] c"Bash\00", align 1
@rl_readline_name = external global i8*, align 4
@.str.7 = private unnamed_addr constant [18 x i8] c"shell-expand-line\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"history-expand-line\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"magic-space\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"shell-forward-word\00", align 1
@.str.11 = private unnamed_addr constant [20 x i8] c"shell-backward-word\00", align 1
@.str.12 = private unnamed_addr constant [16 x i8] c"shell-kill-word\00", align 1
@.str.13 = private unnamed_addr constant [25 x i8] c"shell-backward-kill-word\00", align 1
@.str.14 = private unnamed_addr constant [18 x i8] c"alias-expand-line\00", align 1
@.str.15 = private unnamed_addr constant [30 x i8] c"history-and-alias-expand-line\00", align 1
@.str.16 = private unnamed_addr constant [21 x i8] c"insert-last-argument\00", align 1
@.str.17 = private unnamed_addr constant [21 x i8] c"operate-and-get-next\00", align 1
@.str.18 = private unnamed_addr constant [22 x i8] c"display-shell-version\00", align 1
@.str.19 = private unnamed_addr constant [25 x i8] c"edit-and-execute-command\00", align 1
@.str.20 = private unnamed_addr constant [21 x i8] c"complete-into-braces\00", align 1
@.str.21 = private unnamed_addr constant [18 x i8] c"complete-filename\00", align 1
@.str.22 = private unnamed_addr constant [30 x i8] c"possible-filename-completions\00", align 1
@.str.23 = private unnamed_addr constant [18 x i8] c"complete-username\00", align 1
@.str.24 = private unnamed_addr constant [30 x i8] c"possible-username-completions\00", align 1
@.str.25 = private unnamed_addr constant [18 x i8] c"complete-hostname\00", align 1
@.str.26 = private unnamed_addr constant [30 x i8] c"possible-hostname-completions\00", align 1
@.str.27 = private unnamed_addr constant [18 x i8] c"complete-variable\00", align 1
@.str.28 = private unnamed_addr constant [30 x i8] c"possible-variable-completions\00", align 1
@.str.29 = private unnamed_addr constant [17 x i8] c"complete-command\00", align 1
@.str.30 = private unnamed_addr constant [29 x i8] c"possible-command-completions\00", align 1
@.str.31 = private unnamed_addr constant [19 x i8] c"glob-complete-word\00", align 1
@.str.32 = private unnamed_addr constant [17 x i8] c"glob-expand-word\00", align 1
@.str.33 = private unnamed_addr constant [21 x i8] c"glob-list-expansions\00", align 1
@.str.34 = private unnamed_addr constant [25 x i8] c"dynamic-complete-history\00", align 1
@.str.35 = private unnamed_addr constant [15 x i8] c"dabbrev-expand\00", align 1
@rl_readline_state = external global i32, align 4
@emacs_meta_keymap = external global [257 x %struct._keymap_entry], align 4
@emacs_standard_keymap = external global [257 x %struct._keymap_entry], align 4
@emacs_ctlx_keymap = external global [257 x %struct._keymap_entry], align 4
@vi_movement_keymap = external global [257 x %struct._keymap_entry], align 4
@rl_attempted_completion_function = external global i8** (i8*, i32, i32)*, align 4
@rl_filename_rewrite_hook = external global i8* (i8*, i32)*, align 4
@rl_filename_stat_hook = external global i32 (i8**)*, align 4
@rl_ignore_some_completions_function = external global i32 (i8**)*, align 4
@.str.36 = private unnamed_addr constant [3 x i8] c"'\22\00", align 1
@rl_completer_quote_characters = external global i8*, align 4
@default_filename_quote_characters = internal global i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.45, i32 0, i32 0), align 4
@rl_filename_quote_characters = external global i8*, align 4
@rl_filename_quoting_function = external global i8* (i8*, i32, i8*)*, align 4
@rl_filename_dequoting_function = external global i8* (i8*, i32)*, align 4
@rl_char_is_quoted_p = external global i32 (i8*, i32)*, align 4
@rl_signal_event_hook = external global i32 ()*, align 4
@rl_completion_entry_function = external global i8* (i8*, i32)*, align 4
@rl_sort_completion_matches = external global i32, align 4
@push_to_readline = internal global i8* null, align 4
@rl_startup_hook = external global i32 ()*, align 4
@old_rl_startup_hook = internal global i32 ()* null, align 4
@hostname_list_initialized = global i32 0, align 4
@hostname_list = internal global i8** null, align 4
@hostname_list_length = internal global i32 0, align 4
@rl_completion_append_character = external global i32, align 4
@no_empty_command_completion = common global i32 0, align 4
@dot_in_path = internal global i32 0, align 4
@rl_completion_suppress_append = external global i32, align 4
@rl_filename_completion_desired = external global i32, align 4
@rl_completion_type = external global i32, align 4
@command_word_completion_function.hint = internal global i8* null, align 4
@command_word_completion_function.path = internal global i8* null, align 4
@command_word_completion_function.val = internal global i8* null, align 4
@command_word_completion_function.filename_hint = internal global i8* null, align 4
@command_word_completion_function.fnhint = internal global i8* null, align 4
@command_word_completion_function.dequoted_hint = internal global i8* null, align 4
@command_word_completion_function.directory_part = internal global i8* null, align 4
@command_word_completion_function.glob_matches = internal global i8** null, align 4
@command_word_completion_function.path_index = internal global i32 0, align 4
@command_word_completion_function.hint_len = internal global i32 0, align 4
@command_word_completion_function.dequoted_len = internal global i32 0, align 4
@command_word_completion_function.istate = internal global i32 0, align 4
@command_word_completion_function.igncase = internal global i32 0, align 4
@command_word_completion_function.mapping_over = internal global i32 0, align 4
@command_word_completion_function.local_index = internal global i32 0, align 4
@command_word_completion_function.searching_path = internal global i32 0, align 4
@command_word_completion_function.hint_is_dir = internal global i32 0, align 4
@command_word_completion_function.old_glob_ignore_case = internal global i32 0, align 4
@command_word_completion_function.globpat = internal global i32 0, align 4
@command_word_completion_function.varlist = internal global %struct.variable** null, align 4
@command_word_completion_function.alias_list = internal global %struct.alias** null, align 4
@.str.37 = private unnamed_addr constant [23 x i8] c"completion-ignore-case\00", align 1
@rl_completion_found_quote = external global i32, align 4
@rl_completion_quote_character = external global i32, align 4
@.str.38 = private unnamed_addr constant [5 x i8] c"PATH\00", align 1
@word_token_alist = external global [0 x %struct.STRING_INT_ALIST], align 4
@num_shell_builtins = external global i32, align 4
@shell_builtins = external global %struct.builtin*, align 4
@glob_ignore_case = external global i32, align 4
@glob_error_return = external global i8*, align 4
@.str.39 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.40 = private unnamed_addr constant [4 x i8] c"\22'\5C\00", align 1
@filename_bstab = internal global [256 x i8] zeroinitializer, align 1
@.str.41 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@bash_servicename_completion_function.sname = internal global i8* null, align 4
@bash_servicename_completion_function.srvent = internal global %struct.servent* null, align 4
@bash_servicename_completion_function.snamelen = internal global i32 0, align 4
@bash_servicename_completion_function.firstc = internal global i32 0, align 4
@bash_groupname_completion_function.gname = internal global i8* null, align 4
@bash_groupname_completion_function.grent = internal global %struct.group* null, align 4
@bash_groupname_completion_function.gnamelen = internal global i32 0, align 4
@rl_directory_completion_hook = external global i32 (i8**)*, align 4
@rl_directory_rewrite_hook = external global i32 (i8**)*, align 4
@cmd_xmap = internal global %struct._keymap_entry* null, align 4
@.str.42 = private unnamed_addr constant [28 x i8] c"%s: missing colon separator\00", align 1
@rl_dispatching = external global i32, align 4
@.str.43 = private unnamed_addr constant [15 x i8] c" \09\0A\22'@><=;|&(:\00", align 1
@.str.44 = private unnamed_addr constant [14 x i8] c" \09\0A\22'><=;|&(:\00", align 1
@.str.45 = private unnamed_addr constant [26 x i8] c" \09\0A\5C\22'@<>=;|&()#$`?*[!:{~\00", align 1
@.str.46 = private unnamed_addr constant [9 x i8] c"HOSTFILE\00", align 1
@.str.47 = private unnamed_addr constant [25 x i8] c"hostname_completion_file\00", align 1
@.str.48 = private unnamed_addr constant [11 x i8] c"/etc/hosts\00", align 1
@.str.49 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.50 = private unnamed_addr constant [10 x i8] c"$include \00", align 1
@hostname_list_size = internal global i32 0, align 4
@history_length = external global i32, align 4
@history_max_entries = external global i32, align 4
@saved_history_line_to_use = internal global i32 -1, align 4
@hist_last_line_added = external global i32, align 4
@last_saved_history_line = internal global i32 -1, align 4
@posixly_correct = external global i32, align 4
@.str.51 = private unnamed_addr constant [9 x i8] c"fc -e vi\00", align 1
@.str.52 = private unnamed_addr constant [33 x i8] c"fc -e \22${VISUAL:-${EDITOR:-vi}}\22\00", align 1
@current_command_line_count = external global i32, align 4
@saved_command_line_count = external global i32, align 4
@rl_explicit_arg = external global i32, align 4
@.str.53 = private unnamed_addr constant [6 x i8] c"%s %d\00", align 1
@rl_line_buffer = external global i8*, align 4
@history_lines_this_session = external global i32, align 4
@.str.54 = private unnamed_addr constant [11 x i8] c"input-meta\00", align 1
@rl_deprep_term_function = external global void ()*, align 4
@.str.55 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@.str.56 = private unnamed_addr constant [7 x i8] c"C-xC-e\00", align 1
@rl_prep_term_function = external global void (i32)*, align 4
@rl_end = external global i32, align 4
@rl_point = external global i32, align 4
@rl_done = external global i32, align 4
@.str.57 = private unnamed_addr constant [36 x i8] c"fc -e \22${VISUAL:-${EDITOR:-emacs}}\22\00", align 1
@locale_mb_cur_max = external global i32, align 4
@sh_syntaxtab = external global [0 x i32], align 4
@.str.58 = private unnamed_addr constant [2 x i8] c"'\00", align 1
@.str.59 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@is_basic_table = external constant [0 x i32], align 4
@rl_editing_mode = external global i32, align 4
@rl_mark = external global i32, align 4
@.str.60 = private unnamed_addr constant [7 x i8] c";|&{(`\00", align 1
@current_prompt_string = external global i8*, align 4
@ps1_prompt = external global i8*, align 4
@rl_attempted_completion_over = external global i32, align 4
@.str.61 = private unnamed_addr constant [2 x i8] c"`\00", align 1
@prog_completion_enabled = external global i32, align 4
@prog_complete_matches = internal global i8** null, align 4
@.str.62 = private unnamed_addr constant [11 x i8] c"_EmptycmD_\00", align 1
@.str.63 = private unnamed_addr constant [4 x i8] c"$<>\00", align 1
@.str.64 = private unnamed_addr constant [11 x i8] c"()<>;&| \09\0A\00", align 1
@prog_complete_return.ind = internal global i32 0, align 4
@command_subst_completion_function.matches = internal global i8** null, align 4
@command_subst_completion_function.orig_start = internal global i8* null, align 4
@command_subst_completion_function.filename_text = internal global i8* null, align 4
@command_subst_completion_function.cmd_index = internal global i32 0, align 4
@command_subst_completion_function.start_len = internal global i32 0, align 4
@rl_completion_suppress_quote = external global i32, align 4
@rl_filename_quoting_desired = external global i32, align 4
@variable_completion_function.varlist = internal global i8** null, align 4
@variable_completion_function.varlist_index = internal global i32 0, align 4
@variable_completion_function.varname = internal global i8* null, align 4
@variable_completion_function.namelen = internal global i32 0, align 4
@variable_completion_function.first_char = internal global i32 0, align 4
@variable_completion_function.first_char_loc = internal global i32 0, align 4
@.str.65 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@hostname_completion_function.list = internal global i8** null, align 4
@hostname_completion_function.list_index = internal global i32 0, align 4
@hostname_completion_function.first_char = internal global i32 0, align 4
@hostname_completion_function.first_char_loc = internal global i32 0, align 4
@hist_verify = external global i32, align 4
@.str.66 = private unnamed_addr constant [3 x i8] c"\0D\0A\00", align 1
@fignore = internal global %struct.ignorevar { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.67, i32 0, i32 0), %struct.ign* null, i32 0, i8* null, i32 (%struct.ign*)* null }, align 4
@.str.67 = private unnamed_addr constant [8 x i8] c"FIGNORE\00", align 1
@unbound_vars_is_error = external global i32, align 4
@no_symbolic_links = external global i32, align 4
@.str.68 = private unnamed_addr constant [13 x i8] c"symlink-hook\00", align 1
@custom_filename_quote_characters = internal global i8* null, align 4
@rl_last_func = external global i32 (i32, i32)*, align 4
@history_completion_generator.local_index = internal global i32 0, align 4
@history_completion_generator.len = internal global i32 0, align 4
@history_completion_generator.text = internal global i8* null, align 4
@dabbrev_expand_active = internal global i32 0, align 4
@history_completion_array = internal global i8** null, align 4
@harry_size = internal global i32 0, align 4
@harry_len = internal global i32 0, align 4
@rl_menu_completion_entry_function = external global i8* (i8*, i32)*, align 4
@.str.69 = private unnamed_addr constant [6 x i8] c" \09\0A\22'\00", align 1
@glob_complete_word.matches = internal global i8** null, align 4
@glob_complete_word.ind = internal global i32 0, align 4
@globorig = internal global i8* null, align 4
@globtext = internal global i8* null, align 4
@completion_quoting_style = internal global i32 3, align 4
@history_expansion = external global i32, align 4
@history_expansion_inhibited = external global i32, align 4
@.str.70 = private unnamed_addr constant [46 x i8] c"%s: first non-whitespace character is not `\22'\00", align 1
@.str.71 = private unnamed_addr constant [22 x i8] c"no closing `%c' in %s\00", align 1
@rl_executing_keyseq = external global i8*, align 4
@.str.72 = private unnamed_addr constant [58 x i8] c"bash_execute_unix_command: cannot find keymap for command\00", align 1
@.str.73 = private unnamed_addr constant [3 x i8] c"ce\00", align 1
@.str.74 = private unnamed_addr constant [14 x i8] c"READLINE_LINE\00", align 1
@.str.75 = private unnamed_addr constant [15 x i8] c"READLINE_POINT\00", align 1
@array_needs_making = external global i32, align 4
@.str.76 = private unnamed_addr constant [26 x i8] c"bash_execute_unix_command\00", align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@sigalrm_seen = external global i32, align 4

; Function Attrs: noinline nounwind
define void @posix_readline_initialize(i32 %on_or_off) #0 {
entry:
  %on_or_off.addr = alloca i32, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  %0 = load i32, i32* %on_or_off.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @rl_variable_bind(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %on_or_off.addr, align 4
  %tobool1 = icmp ne i32 %1, 0
  %cond = select i1 %tobool1, i32 (i32, i32)* @rl_insert, i32 (i32, i32)* @rl_complete
  %call2 = call i32 @rl_bind_key_in_map(i32 9, i32 (i32, i32)* %cond, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  ret void
}

declare i32 @rl_variable_bind(i8*, i8*) #1

declare i32 @rl_bind_key_in_map(i32, i32 (i32, i32)*, %struct._keymap_entry*) #1

declare i32 @rl_insert(i32, i32) #1

declare i32 @rl_complete(i32, i32) #1

; Function Attrs: noinline nounwind
define void @reset_completer_word_break_chars() #0 {
entry:
  %0 = load i32, i32* @perform_hostname_completion, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** @bash_completer_word_break_characters, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 337)
  %2 = load i8*, i8** @bash_completer_word_break_characters, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i8*, i8** @bash_nohostname_word_break_characters, align 4
  %call3 = call i32 @strlen(i8* %3)
  %add4 = add i32 1, %call3
  %call5 = call i8* @sh_xmalloc(i32 %add4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 337)
  %4 = load i8*, i8** @bash_nohostname_word_break_characters, align 4
  %call6 = call i8* @strcpy(i8* %call5, i8* %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call2, %cond.true ], [ %call6, %cond.false ]
  store i8* %cond, i8** @rl_completer_word_break_characters, align 4
  ret void
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @enable_hostname_completion(i32 %on_or_off) #0 {
entry:
  %retval = alloca i32, align 4
  %on_or_off.addr = alloca i32, align 4
  %old_value = alloca i32, align 4
  %at = alloca i8*, align 4
  %nv = alloca i8*, align 4
  %nval = alloca i8*, align 4
  store i32 %on_or_off, i32* %on_or_off.addr, align 4
  %0 = load i32, i32* @perform_hostname_completion, align 4
  store i32 %0, i32* %old_value, align 4
  %1 = load i32, i32* %on_or_off.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* @perform_hostname_completion, align 4
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8** @rl_special_prefixes, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* @perform_hostname_completion, align 4
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** @rl_special_prefixes, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* @bash_readline_initialized, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %land.lhs.true, label %if.else14

land.lhs.true:                                    ; preds = %if.end
  %3 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %cmp1 = icmp eq i8* %3, null
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %4 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %5 = load i8*, i8** @rl_basic_word_break_characters, align 4
  %cmp2 = icmp eq i8* %4, %5
  br i1 %cmp2, label %if.then3, label %if.else14

if.then3:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %6 = load i32, i32* %on_or_off.addr, align 4
  %tobool4 = icmp ne i32 %6, 0
  br i1 %tobool4, label %if.then5, label %if.else8

if.then5:                                         ; preds = %if.then3
  %7 = load i8*, i8** @bash_completer_word_break_characters, align 4
  %call = call i32 @strlen(i8* %7)
  %add = add i32 1, %call
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 375)
  %8 = load i8*, i8** @bash_completer_word_break_characters, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %8)
  store i8* %call7, i8** @rl_completer_word_break_characters, align 4
  br label %if.end13

if.else8:                                         ; preds = %if.then3
  %9 = load i8*, i8** @bash_nohostname_word_break_characters, align 4
  %call9 = call i32 @strlen(i8* %9)
  %add10 = add i32 1, %call9
  %call11 = call i8* @sh_xmalloc(i32 %add10, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 377)
  %10 = load i8*, i8** @bash_nohostname_word_break_characters, align 4
  %call12 = call i8* @strcpy(i8* %call11, i8* %10)
  store i8* %call12, i8** @rl_completer_word_break_characters, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.else8, %if.then5
  br label %if.end42

if.else14:                                        ; preds = %lor.lhs.false, %if.end
  %11 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %call15 = call i8* @strchr(i8* %11, i32 64)
  store i8* %call15, i8** %at, align 4
  %12 = load i8*, i8** %at, align 4
  %cmp16 = icmp eq i8* %12, null
  br i1 %cmp16, label %land.lhs.true17, label %lor.lhs.false19

land.lhs.true17:                                  ; preds = %if.else14
  %13 = load i32, i32* %on_or_off.addr, align 4
  %cmp18 = icmp eq i32 %13, 0
  br i1 %cmp18, label %if.then23, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %land.lhs.true17, %if.else14
  %14 = load i8*, i8** %at, align 4
  %cmp20 = icmp ne i8* %14, null
  br i1 %cmp20, label %land.lhs.true21, label %if.end24

land.lhs.true21:                                  ; preds = %lor.lhs.false19
  %15 = load i32, i32* %on_or_off.addr, align 4
  %cmp22 = icmp ne i32 %15, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %land.lhs.true21, %land.lhs.true17
  %16 = load i32, i32* %old_value, align 4
  store i32 %16, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %land.lhs.true21, %lor.lhs.false19
  %17 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %call25 = call i32 @strlen(i8* %17)
  %add26 = add i32 %call25, 1
  %18 = load i32, i32* %on_or_off.addr, align 4
  %add27 = add i32 %add26, %18
  %call28 = call i8* @sh_xmalloc(i32 %add27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 387)
  store i8* %call28, i8** %nval, align 4
  %19 = load i32, i32* %on_or_off.addr, align 4
  %cmp29 = icmp eq i32 %19, 0
  br i1 %cmp29, label %if.then30, label %if.else39

if.then30:                                        ; preds = %if.end24
  %20 = load i8*, i8** %nval, align 4
  store i8* %20, i8** %nv, align 4
  %21 = load i8*, i8** @rl_completer_word_break_characters, align 4
  store i8* %21, i8** %at, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end38, %if.then30
  %22 = load i8*, i8** %at, align 4
  %23 = load i8, i8* %22, align 1
  %tobool31 = icmp ne i8 %23, 0
  br i1 %tobool31, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %24 = load i8*, i8** %at, align 4
  %25 = load i8, i8* %24, align 1
  %conv = sext i8 %25 to i32
  %cmp32 = icmp ne i32 %conv, 64
  br i1 %cmp32, label %if.then34, label %if.else36

if.then34:                                        ; preds = %for.body
  %26 = load i8*, i8** %at, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr, i8** %at, align 4
  %27 = load i8, i8* %26, align 1
  %28 = load i8*, i8** %nv, align 4
  %incdec.ptr35 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr35, i8** %nv, align 4
  store i8 %27, i8* %28, align 1
  br label %if.end38

if.else36:                                        ; preds = %for.body
  %29 = load i8*, i8** %at, align 4
  %incdec.ptr37 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr37, i8** %at, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.else36, %if.then34
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %30 = load i8*, i8** %nv, align 4
  store i8 0, i8* %30, align 1
  br label %if.end41

if.else39:                                        ; preds = %if.end24
  %31 = load i8*, i8** %nval, align 4
  %arrayidx = getelementptr inbounds i8, i8* %31, i32 0
  store i8 64, i8* %arrayidx, align 1
  %32 = load i8*, i8** %nval, align 4
  %add.ptr = getelementptr inbounds i8, i8* %32, i32 1
  %33 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %call40 = call i8* @strcpy(i8* %add.ptr, i8* %33)
  br label %if.end41

if.end41:                                         ; preds = %if.else39, %for.end
  %34 = load i8*, i8** @rl_completer_word_break_characters, align 4
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 407)
  %35 = load i8*, i8** %nval, align 4
  store i8* %35, i8** @rl_completer_word_break_characters, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end13
  %36 = load i32, i32* %old_value, align 4
  store i32 %36, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end42, %if.then23
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

declare i8* @strchr(i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @initialize_readline() #0 {
entry:
  %func = alloca i32 (i32, i32)*, align 4
  %kseq = alloca [2 x i8], align 1
  %0 = load i32, i32* @bash_readline_initialized, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  store i8* %call, i8** @rl_terminal_name, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  store %struct._IO_FILE* %1, %struct._IO_FILE** @rl_instream, align 4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  store %struct._IO_FILE* %2, %struct._IO_FILE** @rl_outstream, align 4
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8** @rl_readline_name, align 4
  %call1 = call i32 @rl_add_defun(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i32 0, i32 0), i32 (i32, i32)* @shell_expand_line, i32 -1)
  %call2 = call i32 @rl_add_defun(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0), i32 (i32, i32)* @history_expand_line, i32 -1)
  %call3 = call i32 @rl_add_defun(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i32 0, i32 0), i32 (i32, i32)* @tcsh_magic_space, i32 -1)
  %call4 = call i32 @rl_add_defun(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.10, i32 0, i32 0), i32 (i32, i32)* @bash_forward_shellword, i32 -1)
  %call5 = call i32 @rl_add_defun(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.11, i32 0, i32 0), i32 (i32, i32)* @bash_backward_shellword, i32 -1)
  %call6 = call i32 @rl_add_defun(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.12, i32 0, i32 0), i32 (i32, i32)* @bash_kill_shellword, i32 -1)
  %call7 = call i32 @rl_add_defun(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i32 0, i32 0), i32 (i32, i32)* @bash_backward_kill_shellword, i32 -1)
  %call8 = call i32 @rl_add_defun(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.14, i32 0, i32 0), i32 (i32, i32)* @alias_expand_line, i32 -1)
  %call9 = call i32 @rl_add_defun(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.15, i32 0, i32 0), i32 (i32, i32)* @history_and_alias_expand_line, i32 -1)
  %call10 = call i32 @rl_add_defun(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.16, i32 0, i32 0), i32 (i32, i32)* @rl_yank_last_arg, i32 -1)
  %call11 = call i32 @rl_add_defun(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17, i32 0, i32 0), i32 (i32, i32)* @operate_and_get_next, i32 -1)
  %call12 = call i32 @rl_add_defun(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i32 0, i32 0), i32 (i32, i32)* @display_shell_version, i32 -1)
  %call13 = call i32 @rl_add_defun(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.19, i32 0, i32 0), i32 (i32, i32)* @emacs_edit_and_execute_command, i32 -1)
  %call14 = call i32 @rl_add_defun(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.20, i32 0, i32 0), i32 (i32, i32)* @bash_brace_completion, i32 -1)
  %call15 = call i32 @rl_add_defun(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.21, i32 0, i32 0), i32 (i32, i32)* @bash_complete_filename, i32 -1)
  %call16 = call i32 @rl_add_defun(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.22, i32 0, i32 0), i32 (i32, i32)* @bash_possible_filename_completions, i32 -1)
  %call17 = call i32 @rl_add_defun(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.23, i32 0, i32 0), i32 (i32, i32)* @bash_complete_username, i32 -1)
  %call18 = call i32 @rl_add_defun(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.24, i32 0, i32 0), i32 (i32, i32)* @bash_possible_username_completions, i32 -1)
  %call19 = call i32 @rl_add_defun(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.25, i32 0, i32 0), i32 (i32, i32)* @bash_complete_hostname, i32 -1)
  %call20 = call i32 @rl_add_defun(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.26, i32 0, i32 0), i32 (i32, i32)* @bash_possible_hostname_completions, i32 -1)
  %call21 = call i32 @rl_add_defun(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.27, i32 0, i32 0), i32 (i32, i32)* @bash_complete_variable, i32 -1)
  %call22 = call i32 @rl_add_defun(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.28, i32 0, i32 0), i32 (i32, i32)* @bash_possible_variable_completions, i32 -1)
  %call23 = call i32 @rl_add_defun(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.29, i32 0, i32 0), i32 (i32, i32)* @bash_complete_command, i32 -1)
  %call24 = call i32 @rl_add_defun(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.30, i32 0, i32 0), i32 (i32, i32)* @bash_possible_command_completions, i32 -1)
  %call25 = call i32 @rl_add_defun(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.31, i32 0, i32 0), i32 (i32, i32)* @bash_glob_complete_word, i32 -1)
  %call26 = call i32 @rl_add_defun(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.32, i32 0, i32 0), i32 (i32, i32)* @bash_glob_expand_word, i32 -1)
  %call27 = call i32 @rl_add_defun(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.33, i32 0, i32 0), i32 (i32, i32)* @bash_glob_list_expansions, i32 -1)
  %call28 = call i32 @rl_add_defun(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.34, i32 0, i32 0), i32 (i32, i32)* @dynamic_complete_history, i32 -1)
  %call29 = call i32 @rl_add_defun(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.35, i32 0, i32 0), i32 (i32, i32)* @bash_dabbrev_expand, i32 -1)
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, 2
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end
  %call31 = call i32 @rl_initialize()
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.end
  %call33 = call i32 @rl_bind_key_if_unbound_in_map(i32 5, i32 (i32, i32)* @shell_expand_line, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call34 = call i32 @rl_bind_key_if_unbound_in_map(i32 94, i32 (i32, i32)* @history_expand_line, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call35 = call i32 @rl_bind_key_if_unbound_in_map(i32 15, i32 (i32, i32)* @operate_and_get_next, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  %call36 = call i32 @rl_bind_key_if_unbound_in_map(i32 22, i32 (i32, i32)* @display_shell_version, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  store i8 10, i8* %arrayidx, align 1
  %arrayidx37 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 1
  store i8 0, i8* %arrayidx37, align 1
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  %call38 = call i32 (i32, i32)* @rl_function_of_keyseq(i8* %arraydecay, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0), i32* null)
  store i32 (i32, i32)* %call38, i32 (i32, i32)** %func, align 4
  %4 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp39 = icmp eq i32 (i32, i32)* %4, @rl_vi_editing_mode
  br i1 %cmp39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.end32
  %call41 = call i32 @rl_unbind_key_in_map(i32 10, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end32
  %arrayidx43 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  store i8 13, i8* %arrayidx43, align 1
  %arraydecay44 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  %call45 = call i32 (i32, i32)* @rl_function_of_keyseq(i8* %arraydecay44, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0), i32* null)
  store i32 (i32, i32)* %call45, i32 (i32, i32)** %func, align 4
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp46 = icmp eq i32 (i32, i32)* %5, @rl_vi_editing_mode
  br i1 %cmp46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %if.end42
  %call48 = call i32 @rl_unbind_key_in_map(i32 13, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %if.end42
  %call50 = call i32 @rl_unbind_key_in_map(i32 5, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  %call51 = call i32 @rl_bind_key_if_unbound_in_map(i32 123, i32 (i32, i32)* @bash_brace_completion, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call52 = call i32 @rl_bind_key_if_unbound_in_map(i32 47, i32 (i32, i32)* @bash_complete_filename, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call53 = call i32 @rl_bind_key_if_unbound_in_map(i32 47, i32 (i32, i32)* @bash_possible_filename_completions, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %arrayidx54 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  store i8 126, i8* %arrayidx54, align 1
  %arrayidx55 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 1
  store i8 0, i8* %arrayidx55, align 1
  %arraydecay56 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  %call57 = call i32 (i32, i32)* @rl_function_of_keyseq(i8* %arraydecay56, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0), i32* null)
  store i32 (i32, i32)* %call57, i32 (i32, i32)** %func, align 4
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp58 = icmp eq i32 (i32, i32)* %6, null
  br i1 %cmp58, label %if.then60, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end49
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp59 = icmp eq i32 (i32, i32)* %7, @rl_tilde_expand
  br i1 %cmp59, label %if.then60, label %if.end63

if.then60:                                        ; preds = %lor.lhs.false, %if.end49
  %arraydecay61 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  %call62 = call i32 @rl_bind_keyseq_in_map(i8* %arraydecay61, i32 (i32, i32)* @bash_complete_username, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  br label %if.end63

if.end63:                                         ; preds = %if.then60, %lor.lhs.false
  %call64 = call i32 @rl_bind_key_if_unbound_in_map(i32 126, i32 (i32, i32)* @bash_possible_username_completions, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %call65 = call i32 @rl_bind_key_if_unbound_in_map(i32 64, i32 (i32, i32)* @bash_complete_hostname, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call66 = call i32 @rl_bind_key_if_unbound_in_map(i32 64, i32 (i32, i32)* @bash_possible_hostname_completions, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %call67 = call i32 @rl_bind_key_if_unbound_in_map(i32 36, i32 (i32, i32)* @bash_complete_variable, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call68 = call i32 @rl_bind_key_if_unbound_in_map(i32 36, i32 (i32, i32)* @bash_possible_variable_completions, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %call69 = call i32 @rl_bind_key_if_unbound_in_map(i32 33, i32 (i32, i32)* @bash_complete_command, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call70 = call i32 @rl_bind_key_if_unbound_in_map(i32 33, i32 (i32, i32)* @bash_possible_command_completions, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %call71 = call i32 @rl_bind_key_if_unbound_in_map(i32 103, i32 (i32, i32)* @bash_glob_complete_word, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  %call72 = call i32 @rl_bind_key_if_unbound_in_map(i32 42, i32 (i32, i32)* @bash_glob_expand_word, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %call73 = call i32 @rl_bind_key_if_unbound_in_map(i32 103, i32 (i32, i32)* @bash_glob_list_expansions, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %arrayidx74 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  store i8 9, i8* %arrayidx74, align 1
  %arrayidx75 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 1
  store i8 0, i8* %arrayidx75, align 1
  %arraydecay76 = getelementptr inbounds [2 x i8], [2 x i8]* %kseq, i32 0, i32 0
  %call77 = call i32 (i32, i32)* @rl_function_of_keyseq(i8* %arraydecay76, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0), i32* null)
  store i32 (i32, i32)* %call77, i32 (i32, i32)** %func, align 4
  %8 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp78 = icmp eq i32 (i32, i32)* %8, null
  br i1 %cmp78, label %if.then81, label %lor.lhs.false79

lor.lhs.false79:                                  ; preds = %if.end63
  %9 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp80 = icmp eq i32 (i32, i32)* %9, @rl_tab_insert
  br i1 %cmp80, label %if.then81, label %if.end83

if.then81:                                        ; preds = %lor.lhs.false79, %if.end63
  %call82 = call i32 @rl_bind_key_in_map(i32 9, i32 (i32, i32)* @dynamic_complete_history, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0))
  br label %if.end83

if.end83:                                         ; preds = %if.then81, %lor.lhs.false79
  store i8** (i8*, i32, i32)* @attempt_shell_completion, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  call void @set_directory_hook()
  store i8* (i8*, i32)* @bash_filename_rewrite_hook, i8* (i8*, i32)** @rl_filename_rewrite_hook, align 4
  store i32 (i8**)* @bash_filename_stat_hook, i32 (i8**)** @rl_filename_stat_hook, align 4
  store i32 (i8**)* @filename_completion_ignore, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %call84 = call i32 @rl_bind_key_if_unbound_in_map(i32 5, i32 (i32, i32)* @emacs_edit_and_execute_command, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0))
  %call85 = call i32 @rl_bind_key_if_unbound_in_map(i32 118, i32 (i32, i32)* @vi_edit_and_execute_command, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  %call86 = call i32 @rl_bind_key_if_unbound_in_map(i32 64, i32 (i32, i32)* @posix_edit_macros, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  %call87 = call i32 @rl_bind_key_in_map(i32 92, i32 (i32, i32)* @bash_vi_complete, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  %call88 = call i32 @rl_bind_key_in_map(i32 42, i32 (i32, i32)* @bash_vi_complete, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  %call89 = call i32 @rl_bind_key_in_map(i32 61, i32 (i32, i32)* @bash_vi_complete, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8** @rl_completer_quote_characters, align 4
  %10 = load i32, i32* @perform_hostname_completion, align 4
  %call90 = call i32 @enable_hostname_completion(i32 %10)
  %11 = load i8*, i8** @default_filename_quote_characters, align 4
  store i8* %11, i8** @rl_filename_quote_characters, align 4
  %12 = load i8*, i8** @rl_filename_quote_characters, align 4
  call void @set_filename_bstab(i8* %12)
  store i8* (i8*, i32, i8*)* @bash_quote_filename, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  store i8* (i8*, i32)* @bash_dequote_filename, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  store i32 (i8*, i32)* @char_is_quoted, i32 (i8*, i32)** @rl_char_is_quoted_p, align 4
  store i32 1, i32* @bash_readline_initialized, align 4
  br label %return

return:                                           ; preds = %if.end83, %if.then
  ret void
}

declare i8* @get_string_value(i8*) #1

declare i32 @rl_add_defun(i8*, i32 (i32, i32)*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @shell_expand_line(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %new_line = alloca i8*, align 4
  %expanded_string = alloca %struct.word_list*, align 4
  %alias_line = alloca i8*, align 4
  %old_point = alloca i32, align 4
  %at_end = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i8* null, i8** %new_line, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i8* @history_expand_line_internal(i8* %0)
  store i8* %call, i8** %new_line, align 4
  %1 = load i8*, i8** %new_line, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %new_line, align 4
  %call1 = call i8* @alias_expand(i8* %2)
  store i8* %call1, i8** %alias_line, align 4
  %3 = load i8*, i8** %new_line, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2719)
  %4 = load i8*, i8** %alias_line, align 4
  store i8* %4, i8** %new_line, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %new_line, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %if.then3, label %if.else36

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* @rl_point, align 4
  store i32 %6, i32* %old_point, align 4
  %7 = load i32, i32* @rl_point, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp = icmp eq i32 %7, %8
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %at_end, align 4
  %9 = load i8*, i8** %new_line, align 4
  call void @maybe_make_readline_line(i8* %9)
  %10 = load i8*, i8** %new_line, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2732)
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %call4 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call4
  %call5 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2736)
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %call6 = call i8* @strcpy(i8* %call5, i8* %12)
  store i8* %call6, i8** %new_line, align 4
  %13 = load i8*, i8** %new_line, align 4
  %call7 = call %struct.word_list* @expand_string(i8* %13, i32 0)
  store %struct.word_list* %call7, %struct.word_list** %expanded_string, align 4
  br label %do.body

do.body:                                          ; preds = %if.then3
  %14 = load i8*, i8** %new_line, align 4
  %tobool8 = icmp ne i8* %14, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  %15 = load i8*, i8** %new_line, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2738)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %16 = load %struct.word_list*, %struct.word_list** %expanded_string, align 4
  %cmp11 = icmp eq %struct.word_list* %16, null
  br i1 %cmp11, label %if.then13, label %if.else

if.then13:                                        ; preds = %do.end
  %call14 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2741)
  store i8* %call14, i8** %new_line, align 4
  %17 = load i8*, i8** %new_line, align 4
  %arrayidx = getelementptr inbounds i8, i8* %17, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end16

if.else:                                          ; preds = %do.end
  %18 = load %struct.word_list*, %struct.word_list** %expanded_string, align 4
  %call15 = call i8* @string_list(%struct.word_list* %18)
  store i8* %call15, i8** %new_line, align 4
  %19 = load %struct.word_list*, %struct.word_list** %expanded_string, align 4
  call void @dispose_words(%struct.word_list* %19)
  br label %if.end16

if.end16:                                         ; preds = %if.else, %if.then13
  %20 = load i8*, i8** %new_line, align 4
  call void @maybe_make_readline_line(i8* %20)
  %21 = load i8*, i8** %new_line, align 4
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2751)
  %22 = load i32, i32* %at_end, align 4
  %tobool17 = icmp ne i32 %22, 0
  br i1 %tobool17, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.end16
  %23 = load i32, i32* @rl_end, align 4
  store i32 %23, i32* @rl_point, align 4
  br label %if.end35

if.else19:                                        ; preds = %if.end16
  %24 = load i32, i32* %old_point, align 4
  %25 = load i32, i32* @rl_end, align 4
  %cmp20 = icmp slt i32 %24, %25
  br i1 %cmp20, label %if.then22, label %if.end34

if.then22:                                        ; preds = %if.else19
  %26 = load i32, i32* %old_point, align 4
  store i32 %26, i32* @rl_point, align 4
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* @rl_point, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %29 to i32
  %cmp25 = icmp eq i32 %conv24, 32
  br i1 %cmp25, label %if.end33, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then22
  %30 = load i8*, i8** @rl_line_buffer, align 4
  %31 = load i32, i32* @rl_point, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %32 to i32
  %cmp29 = icmp eq i32 %conv28, 9
  br i1 %cmp29, label %if.end33, label %if.then31

if.then31:                                        ; preds = %lor.lhs.false
  %call32 = call i32 @rl_forward_word(i32 1, i32 0)
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %lor.lhs.false, %if.then22
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.else19
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then18
  store i32 0, i32* %retval, align 4
  br label %return

if.else36:                                        ; preds = %if.end
  call void @cleanup_expansion_error()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else36, %if.end35
  %33 = load i32, i32* %retval, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind
define internal i32 @history_expand_line(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %new_line = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i8* @history_expand_line_internal(i8* %0)
  store i8* %call, i8** %new_line, align 4
  %1 = load i8*, i8** %new_line, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %new_line, align 4
  call void @set_up_new_line(i8* %2)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  call void @cleanup_expansion_error()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define internal i32 @tcsh_magic_space(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %dist_from_end = alloca i32, align 4
  %old_point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %old_point, align 4
  %1 = load i32, i32* @rl_end, align 4
  %2 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %1, %2
  store i32 %sub, i32* %dist_from_end, align 4
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @history_expand_line(i32 %3, i32 %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %old_point, align 4
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %6 = load i32, i32* %old_point, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %7 = load i32, i32* @rl_end, align 4
  %8 = load i32, i32* %dist_from_end, align 4
  %sub2 = sub nsw i32 %7, %8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %6, %cond.true ], [ %sub2, %cond.false ]
  store i32 %cond, i32* @rl_point, align 4
  %call3 = call i32 @rl_insert(i32 1, i32 32)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %cond.end
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define internal i32 @bash_forward_shellword(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %slen = alloca i32, align 4
  %sindex = alloca i32, align 4
  %c = alloca i32, align 4
  %p = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  %state_bak67 = alloca %struct.__mbstate_t, align 4
  %mblength68 = alloca i32, align 4
  %_f69 = alloca i32, align 4
  %state_bak111 = alloca %struct.__mbstate_t, align 4
  %mblength112 = alloca i32, align 4
  %_f113 = alloca i32, align 4
  %state_bak195 = alloca %struct.__mbstate_t, align 4
  %mblength196 = alloca i32, align 4
  %_f197 = alloca i32, align 4
  %state_bak240 = alloca %struct.__mbstate_t, align 4
  %mblength241 = alloca i32, align 4
  %_f242 = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %2
  %3 = load i32, i32* %key.addr, align 4
  %call = call i32 @bash_backward_shellword(i32 %sub, i32 %3)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* @rl_point, align 4
  store i32 %4, i32* %p, align 4
  %5 = load i32, i32* @rl_end, align 4
  store i32 %5, i32* %slen, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end295, %do.end43, %if.end
  %6 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %while.body, label %while.end297

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %p, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp eq i32 %7, %8
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %while.body
  %9 = load i32, i32* @rl_end, align 4
  store i32 %9, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %while.body
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* %p, align 4
  %call4 = call i32 @char_is_quoted(i8* %10, i32 %11)
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %land.lhs.true, label %if.end44

land.lhs.true:                                    ; preds = %if.end3
  %12 = load i32, i32* %p, align 4
  %cmp6 = icmp sgt i32 %12, 0
  br i1 %cmp6, label %land.lhs.true7, label %if.end44

land.lhs.true7:                                   ; preds = %land.lhs.true
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* %p, align 4
  %sub8 = sub nsw i32 %14, 1
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 %sub8
  %15 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %15 to i32
  %cmp9 = icmp ne i32 %conv, 92
  br i1 %cmp9, label %if.then11, label %if.end44

if.then11:                                        ; preds = %land.lhs.true7
  br label %do.body

do.body:                                          ; preds = %land.end, %if.then11
  br label %do.body12

do.body12:                                        ; preds = %do.body
  %16 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp13 = icmp sgt i32 %16, 1
  br i1 %cmp13, label %if.then15, label %if.else36

if.then15:                                        ; preds = %do.body12
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* %p, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx16, align 1
  %call17 = call i32 @is_basic(i8 signext %19)
  store i32 %call17, i32* %_f, align 4
  %20 = load i32, i32* %_f, align 4
  %tobool18 = icmp ne i32 %20, 0
  br i1 %tobool18, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.then15
  store i32 1, i32* %mblength, align 4
  br label %if.end22

if.else:                                          ; preds = %if.then15
  %21 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %22 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %22, i32 8, i32 4, i1 false)
  %23 = load i8*, i8** @rl_line_buffer, align 4
  %24 = load i32, i32* %p, align 4
  %add.ptr = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i32, i32* %slen, align 4
  %26 = load i32, i32* %p, align 4
  %sub20 = sub i32 %25, %26
  %call21 = call i32 @mbrlen(i8* %add.ptr, i32 %sub20, %struct.__mbstate_t* %state)
  store i32 %call21, i32* %mblength, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then19
  %27 = load i32, i32* %mblength, align 4
  %cmp23 = icmp eq i32 %27, -2
  br i1 %cmp23, label %if.then27, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end22
  %28 = load i32, i32* %mblength, align 4
  %cmp25 = icmp eq i32 %28, -1
  br i1 %cmp25, label %if.then27, label %if.else28

if.then27:                                        ; preds = %lor.lhs.false, %if.end22
  %29 = bitcast %struct.__mbstate_t* %state to i8*
  %30 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %29, i8* %30, i32 8, i32 4, i1 false)
  %31 = load i32, i32* %p, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %p, align 4
  br label %if.end35

if.else28:                                        ; preds = %lor.lhs.false
  %32 = load i32, i32* %mblength, align 4
  %cmp29 = icmp eq i32 %32, 0
  br i1 %cmp29, label %if.then31, label %if.else33

if.then31:                                        ; preds = %if.else28
  %33 = load i32, i32* %p, align 4
  %inc32 = add nsw i32 %33, 1
  store i32 %inc32, i32* %p, align 4
  br label %if.end34

if.else33:                                        ; preds = %if.else28
  %34 = load i32, i32* %mblength, align 4
  %35 = load i32, i32* %p, align 4
  %add = add i32 %35, %34
  store i32 %add, i32* %p, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.else33, %if.then31
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then27
  br label %if.end38

if.else36:                                        ; preds = %do.body12
  %36 = load i32, i32* %p, align 4
  %inc37 = add nsw i32 %36, 1
  store i32 %inc37, i32* %p, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.else36, %if.end35
  br label %do.end

do.end:                                           ; preds = %if.end38
  br label %do.cond

do.cond:                                          ; preds = %do.end
  %37 = load i32, i32* %p, align 4
  %38 = load i32, i32* @rl_end, align 4
  %cmp39 = icmp slt i32 %37, %38
  br i1 %cmp39, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %39 = load i8*, i8** @rl_line_buffer, align 4
  %40 = load i32, i32* %p, align 4
  %call41 = call i32 @char_is_quoted(i8* %39, i32 %40)
  %tobool42 = icmp ne i32 %call41, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %41 = phi i1 [ false, %do.cond ], [ %tobool42, %land.rhs ]
  br i1 %41, label %do.body, label %do.end43

do.end43:                                         ; preds = %land.end
  %42 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %42, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

if.end44:                                         ; preds = %land.lhs.true7, %land.lhs.true, %if.end3
  br label %while.cond45

while.cond45:                                     ; preds = %if.end155, %do.end99, %if.end44
  %43 = load i32, i32* %p, align 4
  %44 = load i32, i32* @rl_end, align 4
  %cmp46 = icmp slt i32 %43, %44
  br i1 %cmp46, label %land.lhs.true48, label %land.end61

land.lhs.true48:                                  ; preds = %while.cond45
  %45 = load i8*, i8** @rl_line_buffer, align 4
  %46 = load i32, i32* %p, align 4
  %arrayidx49 = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8, i8* %arrayidx49, align 1
  %conv50 = sext i8 %47 to i32
  store i32 %conv50, i32* %c, align 4
  %tobool51 = icmp ne i32 %conv50, 0
  br i1 %tobool51, label %land.rhs52, label %land.end61

land.rhs52:                                       ; preds = %land.lhs.true48
  %48 = load i32, i32* %c, align 4
  %conv53 = trunc i32 %48 to i8
  %idxprom = zext i8 %conv53 to i32
  %arrayidx54 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %49 = load i32, i32* %arrayidx54, align 4
  %and = and i32 %49, 1
  %tobool55 = icmp ne i32 %and, 0
  br i1 %tobool55, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs52
  %50 = load i32, i32* %c, align 4
  %conv56 = trunc i32 %50 to i8
  %idxprom57 = zext i8 %conv56 to i32
  %arrayidx58 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom57
  %51 = load i32, i32* %arrayidx58, align 4
  %and59 = and i32 %51, 8192
  %tobool60 = icmp ne i32 %and59, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs52
  %52 = phi i1 [ true, %land.rhs52 ], [ %tobool60, %lor.rhs ]
  br label %land.end61

land.end61:                                       ; preds = %lor.end, %land.lhs.true48, %while.cond45
  %53 = phi i1 [ false, %land.lhs.true48 ], [ false, %while.cond45 ], [ %52, %lor.end ]
  br i1 %53, label %while.body62, label %while.end

while.body62:                                     ; preds = %land.end61
  %54 = load i32, i32* %c, align 4
  switch i32 %54, label %sw.default [
    i32 92, label %sw.bb
    i32 39, label %sw.bb145
    i32 34, label %sw.bb148
  ]

sw.default:                                       ; preds = %while.body62
  br label %do.body63

do.body63:                                        ; preds = %sw.default
  %55 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp64 = icmp sgt i32 %55, 1
  br i1 %cmp64, label %if.then66, label %if.else95

if.then66:                                        ; preds = %do.body63
  %56 = load i8*, i8** @rl_line_buffer, align 4
  %57 = load i32, i32* %p, align 4
  %arrayidx70 = getelementptr inbounds i8, i8* %56, i32 %57
  %58 = load i8, i8* %arrayidx70, align 1
  %call71 = call i32 @is_basic(i8 signext %58)
  store i32 %call71, i32* %_f69, align 4
  %59 = load i32, i32* %_f69, align 4
  %tobool72 = icmp ne i32 %59, 0
  br i1 %tobool72, label %if.then73, label %if.else74

if.then73:                                        ; preds = %if.then66
  store i32 1, i32* %mblength68, align 4
  br label %if.end78

if.else74:                                        ; preds = %if.then66
  %60 = bitcast %struct.__mbstate_t* %state_bak67 to i8*
  %61 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %60, i8* %61, i32 8, i32 4, i1 false)
  %62 = load i8*, i8** @rl_line_buffer, align 4
  %63 = load i32, i32* %p, align 4
  %add.ptr75 = getelementptr inbounds i8, i8* %62, i32 %63
  %64 = load i32, i32* %slen, align 4
  %65 = load i32, i32* %p, align 4
  %sub76 = sub i32 %64, %65
  %call77 = call i32 @mbrlen(i8* %add.ptr75, i32 %sub76, %struct.__mbstate_t* %state)
  store i32 %call77, i32* %mblength68, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.else74, %if.then73
  %66 = load i32, i32* %mblength68, align 4
  %cmp79 = icmp eq i32 %66, -2
  br i1 %cmp79, label %if.then84, label %lor.lhs.false81

lor.lhs.false81:                                  ; preds = %if.end78
  %67 = load i32, i32* %mblength68, align 4
  %cmp82 = icmp eq i32 %67, -1
  br i1 %cmp82, label %if.then84, label %if.else86

if.then84:                                        ; preds = %lor.lhs.false81, %if.end78
  %68 = bitcast %struct.__mbstate_t* %state to i8*
  %69 = bitcast %struct.__mbstate_t* %state_bak67 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %68, i8* %69, i32 8, i32 4, i1 false)
  %70 = load i32, i32* %p, align 4
  %inc85 = add nsw i32 %70, 1
  store i32 %inc85, i32* %p, align 4
  br label %if.end94

if.else86:                                        ; preds = %lor.lhs.false81
  %71 = load i32, i32* %mblength68, align 4
  %cmp87 = icmp eq i32 %71, 0
  br i1 %cmp87, label %if.then89, label %if.else91

if.then89:                                        ; preds = %if.else86
  %72 = load i32, i32* %p, align 4
  %inc90 = add nsw i32 %72, 1
  store i32 %inc90, i32* %p, align 4
  br label %if.end93

if.else91:                                        ; preds = %if.else86
  %73 = load i32, i32* %mblength68, align 4
  %74 = load i32, i32* %p, align 4
  %add92 = add i32 %74, %73
  store i32 %add92, i32* %p, align 4
  br label %if.end93

if.end93:                                         ; preds = %if.else91, %if.then89
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.then84
  br label %if.end97

if.else95:                                        ; preds = %do.body63
  %75 = load i32, i32* %p, align 4
  %inc96 = add nsw i32 %75, 1
  store i32 %inc96, i32* %p, align 4
  br label %if.end97

if.end97:                                         ; preds = %if.else95, %if.end94
  br label %do.end99

do.end99:                                         ; preds = %if.end97
  br label %while.cond45

sw.bb:                                            ; preds = %while.body62
  %76 = load i32, i32* %p, align 4
  %77 = load i32, i32* @rl_end, align 4
  %cmp100 = icmp slt i32 %76, %77
  br i1 %cmp100, label %land.lhs.true102, label %if.end144

land.lhs.true102:                                 ; preds = %sw.bb
  %78 = load i8*, i8** @rl_line_buffer, align 4
  %79 = load i32, i32* %p, align 4
  %arrayidx103 = getelementptr inbounds i8, i8* %78, i32 %79
  %80 = load i8, i8* %arrayidx103, align 1
  %conv104 = sext i8 %80 to i32
  %tobool105 = icmp ne i32 %conv104, 0
  br i1 %tobool105, label %if.then106, label %if.end144

if.then106:                                       ; preds = %land.lhs.true102
  br label %do.body107

do.body107:                                       ; preds = %if.then106
  %81 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp108 = icmp sgt i32 %81, 1
  br i1 %cmp108, label %if.then110, label %if.else139

if.then110:                                       ; preds = %do.body107
  %82 = load i8*, i8** @rl_line_buffer, align 4
  %83 = load i32, i32* %p, align 4
  %arrayidx114 = getelementptr inbounds i8, i8* %82, i32 %83
  %84 = load i8, i8* %arrayidx114, align 1
  %call115 = call i32 @is_basic(i8 signext %84)
  store i32 %call115, i32* %_f113, align 4
  %85 = load i32, i32* %_f113, align 4
  %tobool116 = icmp ne i32 %85, 0
  br i1 %tobool116, label %if.then117, label %if.else118

if.then117:                                       ; preds = %if.then110
  store i32 1, i32* %mblength112, align 4
  br label %if.end122

if.else118:                                       ; preds = %if.then110
  %86 = bitcast %struct.__mbstate_t* %state_bak111 to i8*
  %87 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %86, i8* %87, i32 8, i32 4, i1 false)
  %88 = load i8*, i8** @rl_line_buffer, align 4
  %89 = load i32, i32* %p, align 4
  %add.ptr119 = getelementptr inbounds i8, i8* %88, i32 %89
  %90 = load i32, i32* %slen, align 4
  %91 = load i32, i32* %p, align 4
  %sub120 = sub i32 %90, %91
  %call121 = call i32 @mbrlen(i8* %add.ptr119, i32 %sub120, %struct.__mbstate_t* %state)
  store i32 %call121, i32* %mblength112, align 4
  br label %if.end122

if.end122:                                        ; preds = %if.else118, %if.then117
  %92 = load i32, i32* %mblength112, align 4
  %cmp123 = icmp eq i32 %92, -2
  br i1 %cmp123, label %if.then128, label %lor.lhs.false125

lor.lhs.false125:                                 ; preds = %if.end122
  %93 = load i32, i32* %mblength112, align 4
  %cmp126 = icmp eq i32 %93, -1
  br i1 %cmp126, label %if.then128, label %if.else130

if.then128:                                       ; preds = %lor.lhs.false125, %if.end122
  %94 = bitcast %struct.__mbstate_t* %state to i8*
  %95 = bitcast %struct.__mbstate_t* %state_bak111 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %94, i8* %95, i32 8, i32 4, i1 false)
  %96 = load i32, i32* %p, align 4
  %inc129 = add nsw i32 %96, 1
  store i32 %inc129, i32* %p, align 4
  br label %if.end138

if.else130:                                       ; preds = %lor.lhs.false125
  %97 = load i32, i32* %mblength112, align 4
  %cmp131 = icmp eq i32 %97, 0
  br i1 %cmp131, label %if.then133, label %if.else135

if.then133:                                       ; preds = %if.else130
  %98 = load i32, i32* %p, align 4
  %inc134 = add nsw i32 %98, 1
  store i32 %inc134, i32* %p, align 4
  br label %if.end137

if.else135:                                       ; preds = %if.else130
  %99 = load i32, i32* %mblength112, align 4
  %100 = load i32, i32* %p, align 4
  %add136 = add i32 %100, %99
  store i32 %add136, i32* %p, align 4
  br label %if.end137

if.end137:                                        ; preds = %if.else135, %if.then133
  br label %if.end138

if.end138:                                        ; preds = %if.end137, %if.then128
  br label %if.end141

if.else139:                                       ; preds = %do.body107
  %101 = load i32, i32* %p, align 4
  %inc140 = add nsw i32 %101, 1
  store i32 %inc140, i32* %p, align 4
  br label %if.end141

if.end141:                                        ; preds = %if.else139, %if.end138
  br label %do.end143

do.end143:                                        ; preds = %if.end141
  br label %if.end144

if.end144:                                        ; preds = %do.end143, %land.lhs.true102, %sw.bb
  br label %sw.epilog

sw.bb145:                                         ; preds = %while.body62
  %102 = load i8*, i8** @rl_line_buffer, align 4
  %103 = load i32, i32* %p, align 4
  %inc146 = add nsw i32 %103, 1
  store i32 %inc146, i32* %p, align 4
  %call147 = call i32 @skip_to_delim(i8* %102, i32 %inc146, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0), i32 1)
  store i32 %call147, i32* %p, align 4
  br label %sw.epilog

sw.bb148:                                         ; preds = %while.body62
  %104 = load i8*, i8** @rl_line_buffer, align 4
  %105 = load i32, i32* %p, align 4
  %inc149 = add nsw i32 %105, 1
  store i32 %inc149, i32* %p, align 4
  %call150 = call i32 @skip_to_delim(i8* %104, i32 %inc149, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i32 1)
  store i32 %call150, i32* %p, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb148, %sw.bb145, %if.end144
  %106 = load i32, i32* %p, align 4
  %107 = load i32, i32* @rl_end, align 4
  %cmp151 = icmp slt i32 %106, %107
  br i1 %cmp151, label %if.then153, label %if.end155

if.then153:                                       ; preds = %sw.epilog
  %108 = load i32, i32* %p, align 4
  %inc154 = add nsw i32 %108, 1
  store i32 %inc154, i32* %p, align 4
  br label %if.end155

if.end155:                                        ; preds = %if.then153, %sw.epilog
  br label %while.cond45

while.end:                                        ; preds = %land.end61
  %109 = load i8*, i8** @rl_line_buffer, align 4
  %110 = load i32, i32* %p, align 4
  %arrayidx156 = getelementptr inbounds i8, i8* %109, i32 %110
  %111 = load i8, i8* %arrayidx156, align 1
  %conv157 = sext i8 %111 to i32
  %cmp158 = icmp eq i32 %conv157, 0
  br i1 %cmp158, label %if.then163, label %lor.lhs.false160

lor.lhs.false160:                                 ; preds = %while.end
  %112 = load i32, i32* %p, align 4
  %113 = load i32, i32* @rl_end, align 4
  %cmp161 = icmp eq i32 %112, %113
  br i1 %cmp161, label %if.then163, label %if.end165

if.then163:                                       ; preds = %lor.lhs.false160, %while.end
  %114 = load i32, i32* @rl_end, align 4
  store i32 %114, i32* @rl_point, align 4
  %call164 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end165:                                        ; preds = %lor.lhs.false160
  br label %while.cond166

while.cond166:                                    ; preds = %if.end285, %do.end227, %if.end165
  %115 = load i32, i32* %p, align 4
  %116 = load i32, i32* @rl_end, align 4
  %cmp167 = icmp slt i32 %115, %116
  br i1 %cmp167, label %land.lhs.true169, label %land.end188

land.lhs.true169:                                 ; preds = %while.cond166
  %117 = load i8*, i8** @rl_line_buffer, align 4
  %118 = load i32, i32* %p, align 4
  %arrayidx170 = getelementptr inbounds i8, i8* %117, i32 %118
  %119 = load i8, i8* %arrayidx170, align 1
  %conv171 = sext i8 %119 to i32
  store i32 %conv171, i32* %c, align 4
  %tobool172 = icmp ne i32 %conv171, 0
  br i1 %tobool172, label %land.rhs173, label %land.end188

land.rhs173:                                      ; preds = %land.lhs.true169
  %120 = load i32, i32* %c, align 4
  %conv174 = trunc i32 %120 to i8
  %idxprom175 = zext i8 %conv174 to i32
  %arrayidx176 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom175
  %121 = load i32, i32* %arrayidx176, align 4
  %and177 = and i32 %121, 1
  %tobool178 = icmp ne i32 %and177, 0
  br i1 %tobool178, label %lor.end185, label %lor.rhs179

lor.rhs179:                                       ; preds = %land.rhs173
  %122 = load i32, i32* %c, align 4
  %conv180 = trunc i32 %122 to i8
  %idxprom181 = zext i8 %conv180 to i32
  %arrayidx182 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom181
  %123 = load i32, i32* %arrayidx182, align 4
  %and183 = and i32 %123, 8192
  %tobool184 = icmp ne i32 %and183, 0
  br label %lor.end185

lor.end185:                                       ; preds = %lor.rhs179, %land.rhs173
  %124 = phi i1 [ true, %land.rhs173 ], [ %tobool184, %lor.rhs179 ]
  %lor.ext = zext i1 %124 to i32
  %cmp186 = icmp eq i32 %lor.ext, 0
  br label %land.end188

land.end188:                                      ; preds = %lor.end185, %land.lhs.true169, %while.cond166
  %125 = phi i1 [ false, %land.lhs.true169 ], [ false, %while.cond166 ], [ %cmp186, %lor.end185 ]
  br i1 %125, label %while.body189, label %while.end286

while.body189:                                    ; preds = %land.end188
  %126 = load i32, i32* %c, align 4
  switch i32 %126, label %sw.default190 [
    i32 92, label %sw.bb228
    i32 39, label %sw.bb274
    i32 34, label %sw.bb277
  ]

sw.default190:                                    ; preds = %while.body189
  br label %do.body191

do.body191:                                       ; preds = %sw.default190
  %127 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp192 = icmp sgt i32 %127, 1
  br i1 %cmp192, label %if.then194, label %if.else223

if.then194:                                       ; preds = %do.body191
  %128 = load i8*, i8** @rl_line_buffer, align 4
  %129 = load i32, i32* %p, align 4
  %arrayidx198 = getelementptr inbounds i8, i8* %128, i32 %129
  %130 = load i8, i8* %arrayidx198, align 1
  %call199 = call i32 @is_basic(i8 signext %130)
  store i32 %call199, i32* %_f197, align 4
  %131 = load i32, i32* %_f197, align 4
  %tobool200 = icmp ne i32 %131, 0
  br i1 %tobool200, label %if.then201, label %if.else202

if.then201:                                       ; preds = %if.then194
  store i32 1, i32* %mblength196, align 4
  br label %if.end206

if.else202:                                       ; preds = %if.then194
  %132 = bitcast %struct.__mbstate_t* %state_bak195 to i8*
  %133 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %132, i8* %133, i32 8, i32 4, i1 false)
  %134 = load i8*, i8** @rl_line_buffer, align 4
  %135 = load i32, i32* %p, align 4
  %add.ptr203 = getelementptr inbounds i8, i8* %134, i32 %135
  %136 = load i32, i32* %slen, align 4
  %137 = load i32, i32* %p, align 4
  %sub204 = sub i32 %136, %137
  %call205 = call i32 @mbrlen(i8* %add.ptr203, i32 %sub204, %struct.__mbstate_t* %state)
  store i32 %call205, i32* %mblength196, align 4
  br label %if.end206

if.end206:                                        ; preds = %if.else202, %if.then201
  %138 = load i32, i32* %mblength196, align 4
  %cmp207 = icmp eq i32 %138, -2
  br i1 %cmp207, label %if.then212, label %lor.lhs.false209

lor.lhs.false209:                                 ; preds = %if.end206
  %139 = load i32, i32* %mblength196, align 4
  %cmp210 = icmp eq i32 %139, -1
  br i1 %cmp210, label %if.then212, label %if.else214

if.then212:                                       ; preds = %lor.lhs.false209, %if.end206
  %140 = bitcast %struct.__mbstate_t* %state to i8*
  %141 = bitcast %struct.__mbstate_t* %state_bak195 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %140, i8* %141, i32 8, i32 4, i1 false)
  %142 = load i32, i32* %p, align 4
  %inc213 = add nsw i32 %142, 1
  store i32 %inc213, i32* %p, align 4
  br label %if.end222

if.else214:                                       ; preds = %lor.lhs.false209
  %143 = load i32, i32* %mblength196, align 4
  %cmp215 = icmp eq i32 %143, 0
  br i1 %cmp215, label %if.then217, label %if.else219

if.then217:                                       ; preds = %if.else214
  %144 = load i32, i32* %p, align 4
  %inc218 = add nsw i32 %144, 1
  store i32 %inc218, i32* %p, align 4
  br label %if.end221

if.else219:                                       ; preds = %if.else214
  %145 = load i32, i32* %mblength196, align 4
  %146 = load i32, i32* %p, align 4
  %add220 = add i32 %146, %145
  store i32 %add220, i32* %p, align 4
  br label %if.end221

if.end221:                                        ; preds = %if.else219, %if.then217
  br label %if.end222

if.end222:                                        ; preds = %if.end221, %if.then212
  br label %if.end225

if.else223:                                       ; preds = %do.body191
  %147 = load i32, i32* %p, align 4
  %inc224 = add nsw i32 %147, 1
  store i32 %inc224, i32* %p, align 4
  br label %if.end225

if.end225:                                        ; preds = %if.else223, %if.end222
  br label %do.end227

do.end227:                                        ; preds = %if.end225
  br label %while.cond166

sw.bb228:                                         ; preds = %while.body189
  %148 = load i32, i32* %p, align 4
  %149 = load i32, i32* @rl_end, align 4
  %cmp229 = icmp slt i32 %148, %149
  br i1 %cmp229, label %land.lhs.true231, label %if.end273

land.lhs.true231:                                 ; preds = %sw.bb228
  %150 = load i8*, i8** @rl_line_buffer, align 4
  %151 = load i32, i32* %p, align 4
  %arrayidx232 = getelementptr inbounds i8, i8* %150, i32 %151
  %152 = load i8, i8* %arrayidx232, align 1
  %conv233 = sext i8 %152 to i32
  %tobool234 = icmp ne i32 %conv233, 0
  br i1 %tobool234, label %if.then235, label %if.end273

if.then235:                                       ; preds = %land.lhs.true231
  br label %do.body236

do.body236:                                       ; preds = %if.then235
  %153 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp237 = icmp sgt i32 %153, 1
  br i1 %cmp237, label %if.then239, label %if.else268

if.then239:                                       ; preds = %do.body236
  %154 = load i8*, i8** @rl_line_buffer, align 4
  %155 = load i32, i32* %p, align 4
  %arrayidx243 = getelementptr inbounds i8, i8* %154, i32 %155
  %156 = load i8, i8* %arrayidx243, align 1
  %call244 = call i32 @is_basic(i8 signext %156)
  store i32 %call244, i32* %_f242, align 4
  %157 = load i32, i32* %_f242, align 4
  %tobool245 = icmp ne i32 %157, 0
  br i1 %tobool245, label %if.then246, label %if.else247

if.then246:                                       ; preds = %if.then239
  store i32 1, i32* %mblength241, align 4
  br label %if.end251

if.else247:                                       ; preds = %if.then239
  %158 = bitcast %struct.__mbstate_t* %state_bak240 to i8*
  %159 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %158, i8* %159, i32 8, i32 4, i1 false)
  %160 = load i8*, i8** @rl_line_buffer, align 4
  %161 = load i32, i32* %p, align 4
  %add.ptr248 = getelementptr inbounds i8, i8* %160, i32 %161
  %162 = load i32, i32* %slen, align 4
  %163 = load i32, i32* %p, align 4
  %sub249 = sub i32 %162, %163
  %call250 = call i32 @mbrlen(i8* %add.ptr248, i32 %sub249, %struct.__mbstate_t* %state)
  store i32 %call250, i32* %mblength241, align 4
  br label %if.end251

if.end251:                                        ; preds = %if.else247, %if.then246
  %164 = load i32, i32* %mblength241, align 4
  %cmp252 = icmp eq i32 %164, -2
  br i1 %cmp252, label %if.then257, label %lor.lhs.false254

lor.lhs.false254:                                 ; preds = %if.end251
  %165 = load i32, i32* %mblength241, align 4
  %cmp255 = icmp eq i32 %165, -1
  br i1 %cmp255, label %if.then257, label %if.else259

if.then257:                                       ; preds = %lor.lhs.false254, %if.end251
  %166 = bitcast %struct.__mbstate_t* %state to i8*
  %167 = bitcast %struct.__mbstate_t* %state_bak240 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %166, i8* %167, i32 8, i32 4, i1 false)
  %168 = load i32, i32* %p, align 4
  %inc258 = add nsw i32 %168, 1
  store i32 %inc258, i32* %p, align 4
  br label %if.end267

if.else259:                                       ; preds = %lor.lhs.false254
  %169 = load i32, i32* %mblength241, align 4
  %cmp260 = icmp eq i32 %169, 0
  br i1 %cmp260, label %if.then262, label %if.else264

if.then262:                                       ; preds = %if.else259
  %170 = load i32, i32* %p, align 4
  %inc263 = add nsw i32 %170, 1
  store i32 %inc263, i32* %p, align 4
  br label %if.end266

if.else264:                                       ; preds = %if.else259
  %171 = load i32, i32* %mblength241, align 4
  %172 = load i32, i32* %p, align 4
  %add265 = add i32 %172, %171
  store i32 %add265, i32* %p, align 4
  br label %if.end266

if.end266:                                        ; preds = %if.else264, %if.then262
  br label %if.end267

if.end267:                                        ; preds = %if.end266, %if.then257
  br label %if.end270

if.else268:                                       ; preds = %do.body236
  %173 = load i32, i32* %p, align 4
  %inc269 = add nsw i32 %173, 1
  store i32 %inc269, i32* %p, align 4
  br label %if.end270

if.end270:                                        ; preds = %if.else268, %if.end267
  br label %do.end272

do.end272:                                        ; preds = %if.end270
  br label %if.end273

if.end273:                                        ; preds = %do.end272, %land.lhs.true231, %sw.bb228
  br label %sw.epilog280

sw.bb274:                                         ; preds = %while.body189
  %174 = load i8*, i8** @rl_line_buffer, align 4
  %175 = load i32, i32* %p, align 4
  %inc275 = add nsw i32 %175, 1
  store i32 %inc275, i32* %p, align 4
  %call276 = call i32 @skip_to_delim(i8* %174, i32 %inc275, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0), i32 1)
  store i32 %call276, i32* %p, align 4
  br label %sw.epilog280

sw.bb277:                                         ; preds = %while.body189
  %176 = load i8*, i8** @rl_line_buffer, align 4
  %177 = load i32, i32* %p, align 4
  %inc278 = add nsw i32 %177, 1
  store i32 %inc278, i32* %p, align 4
  %call279 = call i32 @skip_to_delim(i8* %176, i32 %inc278, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i32 1)
  store i32 %call279, i32* %p, align 4
  br label %sw.epilog280

sw.epilog280:                                     ; preds = %sw.bb277, %sw.bb274, %if.end273
  %178 = load i32, i32* %p, align 4
  %179 = load i32, i32* @rl_end, align 4
  %cmp281 = icmp slt i32 %178, %179
  br i1 %cmp281, label %if.then283, label %if.end285

if.then283:                                       ; preds = %sw.epilog280
  %180 = load i32, i32* %p, align 4
  %inc284 = add nsw i32 %180, 1
  store i32 %inc284, i32* %p, align 4
  br label %if.end285

if.end285:                                        ; preds = %if.then283, %sw.epilog280
  br label %while.cond166

while.end286:                                     ; preds = %land.end188
  %181 = load i32, i32* %p, align 4
  %182 = load i32, i32* @rl_end, align 4
  %cmp287 = icmp eq i32 %181, %182
  br i1 %cmp287, label %if.then294, label %lor.lhs.false289

lor.lhs.false289:                                 ; preds = %while.end286
  %183 = load i8*, i8** @rl_line_buffer, align 4
  %184 = load i32, i32* %p, align 4
  %arrayidx290 = getelementptr inbounds i8, i8* %183, i32 %184
  %185 = load i8, i8* %arrayidx290, align 1
  %conv291 = sext i8 %185 to i32
  %cmp292 = icmp eq i32 %conv291, 0
  br i1 %cmp292, label %if.then294, label %if.end295

if.then294:                                       ; preds = %lor.lhs.false289, %while.end286
  %186 = load i32, i32* @rl_end, align 4
  store i32 %186, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end295:                                        ; preds = %lor.lhs.false289
  %187 = load i32, i32* %count.addr, align 4
  %dec296 = add nsw i32 %187, -1
  store i32 %dec296, i32* %count.addr, align 4
  br label %while.cond

while.end297:                                     ; preds = %while.cond
  %188 = load i32, i32* %p, align 4
  store i32 %188, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end297, %if.then294, %if.then163, %if.then2, %if.then
  %189 = load i32, i32* %retval, align 4
  ret i32 %189
}

; Function Attrs: noinline nounwind
define internal i32 @bash_backward_shellword(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %slen = alloca i32, align 4
  %sindex = alloca i32, align 4
  %c = alloca i32, align 4
  %p = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_x = alloca i32, align 4
  %_p = alloca i32, align 4
  %state_bak76 = alloca %struct.__mbstate_t, align 4
  %mblength77 = alloca i32, align 4
  %_x78 = alloca i32, align 4
  %_p79 = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %2
  %3 = load i32, i32* %key.addr, align 4
  %call = call i32 @bash_forward_shellword(i32 %sub, i32 %3)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* @rl_point, align 4
  store i32 %4, i32* %p, align 4
  %5 = load i32, i32* @rl_end, align 4
  store i32 %5, i32* %slen, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end108, %if.end
  %6 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %while.body, label %while.end110

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %p, align 4
  %cmp1 = icmp eq i32 %7, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %while.body
  store i32 0, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %while.body
  br label %while.cond4

while.cond4:                                      ; preds = %if.end3
  %8 = load i32, i32* %p, align 4
  %cmp5 = icmp sgt i32 %8, 0
  br i1 %cmp5, label %while.body6, label %while.end44

while.body6:                                      ; preds = %while.cond4
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %10 = load i32, i32* %p, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %11 to i32
  store i32 %conv, i32* %c, align 4
  %12 = load i32, i32* %c, align 4
  %conv7 = trunc i32 %12 to i8
  %idxprom = zext i8 %conv7 to i32
  %arrayidx8 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %13 = load i32, i32* %arrayidx8, align 4
  %and = and i32 %13, 1
  %tobool9 = icmp ne i32 %and, 0
  br i1 %tobool9, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body6
  %14 = load i32, i32* %c, align 4
  %conv10 = trunc i32 %14 to i8
  %idxprom11 = zext i8 %conv10 to i32
  %arrayidx12 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom11
  %15 = load i32, i32* %arrayidx12, align 4
  %and13 = and i32 %15, 8192
  %tobool14 = icmp ne i32 %and13, 0
  br i1 %tobool14, label %land.lhs.true, label %if.end43

land.lhs.true:                                    ; preds = %lor.lhs.false, %while.body6
  %16 = load i8*, i8** @rl_line_buffer, align 4
  %17 = load i32, i32* %p, align 4
  %call15 = call i32 @char_is_quoted(i8* %16, i32 %17)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.end43

if.then18:                                        ; preds = %land.lhs.true
  br label %do.body

do.body:                                          ; preds = %if.then18
  %18 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp19 = icmp sgt i32 %18, 1
  br i1 %cmp19, label %if.then21, label %if.else41

if.then21:                                        ; preds = %do.body
  store i32 0, i32* %_p, align 4
  store i32 0, i32* %_x, align 4
  br label %while.cond22

while.cond22:                                     ; preds = %if.end40, %if.then21
  %19 = load i32, i32* %_x, align 4
  %20 = load i32, i32* %p, align 4
  %cmp23 = icmp slt i32 %19, %20
  br i1 %cmp23, label %while.body25, label %while.end

while.body25:                                     ; preds = %while.cond22
  %21 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %22 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %22, i32 8, i32 4, i1 false)
  %23 = load i8*, i8** @rl_line_buffer, align 4
  %24 = load i32, i32* %_x, align 4
  %add.ptr = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i32, i32* %slen, align 4
  %26 = load i32, i32* %_x, align 4
  %sub26 = sub i32 %25, %26
  %call27 = call i32 @mbrlen(i8* %add.ptr, i32 %sub26, %struct.__mbstate_t* %state)
  store i32 %call27, i32* %mblength, align 4
  %27 = load i32, i32* %mblength, align 4
  %cmp28 = icmp eq i32 %27, -2
  br i1 %cmp28, label %if.then33, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %while.body25
  %28 = load i32, i32* %mblength, align 4
  %cmp31 = icmp eq i32 %28, -1
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %lor.lhs.false30, %while.body25
  %29 = bitcast %struct.__mbstate_t* %state to i8*
  %30 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %29, i8* %30, i32 8, i32 4, i1 false)
  %31 = load i32, i32* %_x, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %_x, align 4
  br label %if.end40

if.else:                                          ; preds = %lor.lhs.false30
  %32 = load i32, i32* %mblength, align 4
  %cmp34 = icmp eq i32 %32, 0
  br i1 %cmp34, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.else
  %33 = load i32, i32* %_x, align 4
  %inc37 = add nsw i32 %33, 1
  store i32 %inc37, i32* %_x, align 4
  br label %if.end39

if.else38:                                        ; preds = %if.else
  %34 = load i32, i32* %_x, align 4
  store i32 %34, i32* %_p, align 4
  %35 = load i32, i32* %mblength, align 4
  %36 = load i32, i32* %_x, align 4
  %add = add i32 %36, %35
  store i32 %add, i32* %_x, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %if.then36
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then33
  br label %while.cond22

while.end:                                        ; preds = %while.cond22
  %37 = load i32, i32* %_p, align 4
  store i32 %37, i32* %p, align 4
  br label %if.end42

if.else41:                                        ; preds = %do.body
  %38 = load i32, i32* %p, align 4
  %dec = add nsw i32 %38, -1
  store i32 %dec, i32* %p, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.else41, %while.end
  br label %do.end

do.end:                                           ; preds = %if.end42
  br label %if.end43

if.end43:                                         ; preds = %do.end, %land.lhs.true, %lor.lhs.false
  br label %while.end44

while.end44:                                      ; preds = %if.end43, %while.cond4
  %39 = load i32, i32* %p, align 4
  %cmp45 = icmp eq i32 %39, 0
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %while.end44
  store i32 0, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end48:                                         ; preds = %while.end44
  br label %while.cond49

while.cond49:                                     ; preds = %do.end107, %if.end48
  %40 = load i32, i32* %p, align 4
  %cmp50 = icmp sgt i32 %40, 0
  br i1 %cmp50, label %while.body52, label %while.end108

while.body52:                                     ; preds = %while.cond49
  %41 = load i8*, i8** @rl_line_buffer, align 4
  %42 = load i32, i32* %p, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %43 to i32
  store i32 %conv54, i32* %c, align 4
  %44 = load i32, i32* %c, align 4
  %conv55 = trunc i32 %44 to i8
  %idxprom56 = zext i8 %conv55 to i32
  %arrayidx57 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom56
  %45 = load i32, i32* %arrayidx57, align 4
  %and58 = and i32 %45, 1
  %tobool59 = icmp ne i32 %and58, 0
  br i1 %tobool59, label %land.lhs.true66, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %while.body52
  %46 = load i32, i32* %c, align 4
  %conv61 = trunc i32 %46 to i8
  %idxprom62 = zext i8 %conv61 to i32
  %arrayidx63 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom62
  %47 = load i32, i32* %arrayidx63, align 4
  %and64 = and i32 %47, 8192
  %tobool65 = icmp ne i32 %and64, 0
  br i1 %tobool65, label %land.lhs.true66, label %if.end71

land.lhs.true66:                                  ; preds = %lor.lhs.false60, %while.body52
  %48 = load i8*, i8** @rl_line_buffer, align 4
  %49 = load i32, i32* %p, align 4
  %call67 = call i32 @char_is_quoted(i8* %48, i32 %49)
  %cmp68 = icmp eq i32 %call67, 0
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %land.lhs.true66
  br label %while.end108

if.end71:                                         ; preds = %land.lhs.true66, %lor.lhs.false60
  br label %do.body72

do.body72:                                        ; preds = %if.end71
  %50 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp73 = icmp sgt i32 %50, 1
  br i1 %cmp73, label %if.then75, label %if.else104

if.then75:                                        ; preds = %do.body72
  store i32 0, i32* %_p79, align 4
  store i32 0, i32* %_x78, align 4
  br label %while.cond80

while.cond80:                                     ; preds = %if.end102, %if.then75
  %51 = load i32, i32* %_x78, align 4
  %52 = load i32, i32* %p, align 4
  %cmp81 = icmp slt i32 %51, %52
  br i1 %cmp81, label %while.body83, label %while.end103

while.body83:                                     ; preds = %while.cond80
  %53 = bitcast %struct.__mbstate_t* %state_bak76 to i8*
  %54 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %53, i8* %54, i32 8, i32 4, i1 false)
  %55 = load i8*, i8** @rl_line_buffer, align 4
  %56 = load i32, i32* %_x78, align 4
  %add.ptr84 = getelementptr inbounds i8, i8* %55, i32 %56
  %57 = load i32, i32* %slen, align 4
  %58 = load i32, i32* %_x78, align 4
  %sub85 = sub i32 %57, %58
  %call86 = call i32 @mbrlen(i8* %add.ptr84, i32 %sub85, %struct.__mbstate_t* %state)
  store i32 %call86, i32* %mblength77, align 4
  %59 = load i32, i32* %mblength77, align 4
  %cmp87 = icmp eq i32 %59, -2
  br i1 %cmp87, label %if.then92, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %while.body83
  %60 = load i32, i32* %mblength77, align 4
  %cmp90 = icmp eq i32 %60, -1
  br i1 %cmp90, label %if.then92, label %if.else94

if.then92:                                        ; preds = %lor.lhs.false89, %while.body83
  %61 = bitcast %struct.__mbstate_t* %state to i8*
  %62 = bitcast %struct.__mbstate_t* %state_bak76 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %61, i8* %62, i32 8, i32 4, i1 false)
  %63 = load i32, i32* %_x78, align 4
  %inc93 = add nsw i32 %63, 1
  store i32 %inc93, i32* %_x78, align 4
  br label %if.end102

if.else94:                                        ; preds = %lor.lhs.false89
  %64 = load i32, i32* %mblength77, align 4
  %cmp95 = icmp eq i32 %64, 0
  br i1 %cmp95, label %if.then97, label %if.else99

if.then97:                                        ; preds = %if.else94
  %65 = load i32, i32* %_x78, align 4
  %inc98 = add nsw i32 %65, 1
  store i32 %inc98, i32* %_x78, align 4
  br label %if.end101

if.else99:                                        ; preds = %if.else94
  %66 = load i32, i32* %_x78, align 4
  store i32 %66, i32* %_p79, align 4
  %67 = load i32, i32* %mblength77, align 4
  %68 = load i32, i32* %_x78, align 4
  %add100 = add i32 %68, %67
  store i32 %add100, i32* %_x78, align 4
  br label %if.end101

if.end101:                                        ; preds = %if.else99, %if.then97
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %if.then92
  br label %while.cond80

while.end103:                                     ; preds = %while.cond80
  %69 = load i32, i32* %_p79, align 4
  store i32 %69, i32* %p, align 4
  br label %if.end106

if.else104:                                       ; preds = %do.body72
  %70 = load i32, i32* %p, align 4
  %dec105 = add nsw i32 %70, -1
  store i32 %dec105, i32* %p, align 4
  br label %if.end106

if.end106:                                        ; preds = %if.else104, %while.end103
  br label %do.end107

do.end107:                                        ; preds = %if.end106
  br label %while.cond49

while.end108:                                     ; preds = %if.then70, %while.cond49
  %71 = load i32, i32* %count.addr, align 4
  %dec109 = add nsw i32 %71, -1
  store i32 %dec109, i32* %count.addr, align 4
  br label %while.cond

while.end110:                                     ; preds = %while.cond
  %72 = load i32, i32* %p, align 4
  store i32 %72, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end110, %if.then47, %if.then2, %if.then
  %73 = load i32, i32* %retval, align 4
  ret i32 %73
}

; Function Attrs: noinline nounwind
define internal i32 @bash_kill_shellword(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @bash_backward_kill_shellword(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %p, align 4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @bash_forward_shellword(i32 %4, i32 %5)
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %p, align 4
  %cmp2 = icmp ne i32 %6, %7
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %8 = load i32, i32* %p, align 4
  %9 = load i32, i32* @rl_point, align 4
  %call4 = call i32 @rl_kill_text(i32 %8, i32 %9)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %10 = load i32, i32* %p, align 4
  store i32 %10, i32* @rl_point, align 4
  %11 = load i32, i32* @rl_editing_mode, align 4
  %cmp6 = icmp eq i32 %11, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  %12 = load i32, i32* @rl_point, align 4
  store i32 %12, i32* @rl_mark, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define internal i32 @bash_backward_kill_shellword(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @bash_kill_shellword(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %p, align 4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @bash_backward_shellword(i32 %4, i32 %5)
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %p, align 4
  %cmp2 = icmp ne i32 %6, %7
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %8 = load i32, i32* %p, align 4
  %9 = load i32, i32* @rl_point, align 4
  %call4 = call i32 @rl_kill_text(i32 %8, i32 %9)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %10 = load i32, i32* @rl_editing_mode, align 4
  %cmp6 = icmp eq i32 %10, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  %11 = load i32, i32* @rl_point, align 4
  store i32 %11, i32* @rl_mark, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind
define internal i32 @alias_expand_line(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %new_line = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i8* @alias_expand(i8* %0)
  store i8* %call, i8** %new_line, align 4
  %1 = load i8*, i8** %new_line, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %new_line, align 4
  call void @set_up_new_line(i8* %2)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  call void @cleanup_expansion_error()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define internal i32 @history_and_alias_expand_line(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %new_line = alloca i8*, align 4
  %alias_line = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i8* null, i8** %new_line, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i8* @history_expand_line_internal(i8* %0)
  store i8* %call, i8** %new_line, align 4
  %1 = load i8*, i8** %new_line, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %new_line, align 4
  %call1 = call i8* @alias_expand(i8* %2)
  store i8* %call1, i8** %alias_line, align 4
  %3 = load i8*, i8** %new_line, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2680)
  %4 = load i8*, i8** %alias_line, align 4
  store i8* %4, i8** %new_line, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %new_line, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %6 = load i8*, i8** %new_line, align 4
  call void @set_up_new_line(i8* %6)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  call void @cleanup_expansion_error()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then3
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @rl_yank_last_arg(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @operate_and_get_next(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %where = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %call = call i32 @rl_newline(i32 1, i32 %0)
  %call1 = call i32 @where_history()
  store i32 %call1, i32* %where, align 4
  %call2 = call i32 @history_is_stifled()
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @history_length, align 4
  %2 = load i32, i32* @history_max_entries, align 4
  %cmp = icmp sge i32 %1, %2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* %where, align 4
  %4 = load i32, i32* @history_length, align 4
  %sub = sub nsw i32 %4, 1
  %cmp3 = icmp sge i32 %3, %sub
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %5 = load i32, i32* %where, align 4
  store i32 %5, i32* @saved_history_line_to_use, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %6 = load i32, i32* %where, align 4
  %add = add nsw i32 %6, 1
  store i32 %add, i32* @saved_history_line_to_use, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i32 ()*, i32 ()** @rl_startup_hook, align 4
  store i32 ()* %7, i32 ()** @old_rl_startup_hook, align 4
  store i32 ()* @set_saved_history, i32 ()** @rl_startup_hook, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @display_shell_version(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %call = call i32 @rl_crlf()
  call void @show_shell_version(i32 0)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call1 = call i32 @putc(i32 13, %struct._IO_FILE* %0)
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call2 = call i32 @fflush(%struct._IO_FILE* %1)
  %call3 = call i32 @rl_on_new_line()
  call void @rl_redisplay()
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @emacs_edit_and_execute_command(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* %c.addr, align 4
  %call = call i32 @edit_and_execute_command(i32 %0, i32 %1, i32 1, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.57, i32 0, i32 0))
  ret i32 %call
}

declare i32 @bash_brace_completion(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_filename(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @rl_completion_mode(i32 (i32, i32)* @bash_complete_filename)
  %call1 = call i32 @bash_complete_filename_internal(i32 %call)
  ret i32 %call1
}

; Function Attrs: noinline nounwind
define internal i32 @bash_possible_filename_completions(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @bash_complete_filename_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_username(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @rl_completion_mode(i32 (i32, i32)* @bash_complete_username)
  %call1 = call i32 @bash_complete_username_internal(i32 %call)
  ret i32 %call1
}

; Function Attrs: noinline nounwind
define internal i32 @bash_possible_username_completions(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @bash_complete_username_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_hostname(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @rl_completion_mode(i32 (i32, i32)* @bash_complete_hostname)
  %call1 = call i32 @bash_complete_hostname_internal(i32 %call)
  ret i32 %call1
}

; Function Attrs: noinline nounwind
define internal i32 @bash_possible_hostname_completions(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @bash_complete_hostname_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_variable(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @rl_completion_mode(i32 (i32, i32)* @bash_complete_variable)
  %call1 = call i32 @bash_complete_variable_internal(i32 %call)
  ret i32 %call1
}

; Function Attrs: noinline nounwind
define internal i32 @bash_possible_variable_completions(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @bash_complete_variable_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_command(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @rl_completion_mode(i32 (i32, i32)* @bash_complete_command)
  %call1 = call i32 @bash_complete_command_internal(i32 %call)
  ret i32 %call1
}

; Function Attrs: noinline nounwind
define internal i32 @bash_possible_command_completions(i32 %ignore, i32 %ignore2) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @bash_complete_command_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_glob_complete_word(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %orig_quoting_function = alloca i8* (i8*, i32, i8*)*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* @rl_explicit_arg, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8* (i8*, i32, i8*)*, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  store i8* (i8*, i32, i8*)* %1, i8* (i8*, i32, i8*)** %orig_quoting_function, align 4
  store i8* (i8*, i32, i8*)* @bash_glob_quote_filename, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  %call = call i32 @rl_completion_mode(i32 (i32, i32)* @bash_glob_complete_word)
  %call1 = call i32 @bash_glob_completion_internal(i32 %call)
  store i32 %call1, i32* %r, align 4
  %2 = load i8* (i8*, i32, i8*)*, i8* (i8*, i32, i8*)** %orig_quoting_function, align 4
  store i8* (i8*, i32, i8*)* %2, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  %3 = load i32, i32* %r, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define internal i32 @bash_glob_expand_word(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @bash_glob_completion_internal(i32 42)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_glob_list_expansions(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @bash_glob_completion_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @dynamic_complete_history(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %orig_func = alloca i8* (i8*, i32)*, align 4
  %orig_attempt_func = alloca i8** (i8*, i32, i32)*, align 4
  %orig_ignore_func = alloca i32 (i8**)*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8* (i8*, i32)* %0, i8* (i8*, i32)** %orig_func, align 4
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %1, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  %2 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i32 (i8**)* %2, i32 (i8**)** %orig_ignore_func, align 4
  store i8* (i8*, i32)* @history_completion_generator, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i32 (i8**)* @filename_completion_ignore, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp eq i32 (i32, i32)* %3, @dynamic_complete_history
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @rl_complete_internal(i32 63)
  store i32 %call, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i32 @rl_complete_internal(i32 9)
  store i32 %call1, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i8* (i8*, i32)*, i8* (i8*, i32)** %orig_func, align 4
  store i8* (i8*, i32)* %4, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %5 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  store i8** (i8*, i32, i32)* %5, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %6 = load i32 (i8**)*, i32 (i8**)** %orig_ignore_func, align 4
  store i32 (i8**)* %6, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %7 = load i32, i32* %r, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define internal i32 @bash_dabbrev_expand(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %orig_suppress = alloca i32, align 4
  %orig_sort = alloca i32, align 4
  %orig_func = alloca i8* (i8*, i32)*, align 4
  %orig_attempt_func = alloca i8** (i8*, i32, i32)*, align 4
  %orig_ignore_func = alloca i32 (i8**)*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  store i8* (i8*, i32)* %0, i8* (i8*, i32)** %orig_func, align 4
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %1, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  %2 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i32 (i8**)* %2, i32 (i8**)** %orig_ignore_func, align 4
  %3 = load i32, i32* @rl_completion_suppress_append, align 4
  store i32 %3, i32* %orig_suppress, align 4
  %4 = load i32, i32* @rl_sort_completion_matches, align 4
  store i32 %4, i32* %orig_sort, align 4
  store i8* (i8*, i32)* @history_completion_generator, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i32 (i8**)* @filename_completion_ignore, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i32 0, i32* @rl_filename_completion_desired, align 4
  store i32 1, i32* @rl_completion_suppress_append, align 4
  store i32 0, i32* @rl_sort_completion_matches, align 4
  store i32 1, i32* @dabbrev_expand_active, align 4
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp eq i32 (i32, i32)* %5, @bash_dabbrev_expand
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 (i32, i32)* @rl_menu_complete, i32 (i32, i32)** @rl_last_func, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_menu_complete(i32 %6, i32 %7)
  store i32 %call, i32* %r, align 4
  store i32 0, i32* @dabbrev_expand_active, align 4
  store i32 (i32, i32)* @bash_dabbrev_expand, i32 (i32, i32)** @rl_last_func, align 4
  %8 = load i8* (i8*, i32)*, i8* (i8*, i32)** %orig_func, align 4
  store i8* (i8*, i32)* %8, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  %9 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  store i8** (i8*, i32, i32)* %9, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %10 = load i32 (i8**)*, i32 (i8**)** %orig_ignore_func, align 4
  store i32 (i8**)* %10, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %11 = load i32, i32* %orig_suppress, align 4
  store i32 %11, i32* @rl_completion_suppress_append, align 4
  %12 = load i32, i32* %orig_sort, align 4
  store i32 %12, i32* @rl_sort_completion_matches, align 4
  %13 = load i32, i32* %r, align 4
  ret i32 %13
}

declare i32 @rl_initialize() #1

declare i32 @rl_bind_key_if_unbound_in_map(i32, i32 (i32, i32)*, %struct._keymap_entry*) #1

declare i32 (i32, i32)* @rl_function_of_keyseq(i8*, %struct._keymap_entry*, i32*) #1

declare i32 @rl_vi_editing_mode(i32, i32) #1

declare i32 @rl_unbind_key_in_map(i32, %struct._keymap_entry*) #1

declare i32 @rl_tilde_expand(i32, i32) #1

declare i32 @rl_bind_keyseq_in_map(i8*, i32 (i32, i32)*, %struct._keymap_entry*) #1

declare i32 @rl_tab_insert(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i8** @attempt_shell_completion(i8* %text, i32 %start, i32 %end) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %in_command_position = alloca i32, align 4
  %ti = alloca i32, align 4
  %saveti = alloca i32, align 4
  %qc = alloca i32, align 4
  %dflags = alloca i32, align 4
  %matches = alloca i8**, align 4
  %command_separator_chars = alloca i8*, align 4
  %have_progcomps = alloca i32, align 4
  %was_assignment = alloca i32, align 4
  %s = alloca i32, align 4
  %e = alloca i32, align 4
  %s1 = alloca i32, align 4
  %e1 = alloca i32, align 4
  %os = alloca i32, align 4
  %foundcs = alloca i32, align 4
  %n = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i8** %command_separator_chars, align 4
  store i8** null, i8*** %matches, align 4
  store i32 (i8**)* @filename_completion_ignore, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %0 = load i8*, i8** @default_filename_quote_characters, align 4
  store i8* %0, i8** @rl_filename_quote_characters, align 4
  %1 = load i8*, i8** @rl_filename_quote_characters, align 4
  call void @set_filename_bstab(i8* %1)
  call void @set_directory_hook()
  store i32 (i8**)* @bash_filename_stat_hook, i32 (i8**)** @rl_filename_stat_hook, align 4
  store i32 1, i32* @rl_sort_completion_matches, align 4
  %2 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %2, 1
  store i32 %sub, i32* %ti, align 4
  store i32 -1, i32* %qc, align 4
  store i32 -1, i32* %saveti, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i32, i32* %ti, align 4
  %cmp = icmp sgt i32 %3, -1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* %ti, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* %ti, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %10 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %11 = phi i1 [ false, %while.cond ], [ %10, %lor.end ]
  br i1 %11, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %12 = load i32, i32* %ti, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %ti, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %13 = load i32, i32* %ti, align 4
  %cmp7 = icmp sge i32 %13, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* %ti, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %16 to i32
  %cmp11 = icmp eq i32 %conv10, 34
  br i1 %cmp11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* %ti, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %19 to i32
  %cmp15 = icmp eq i32 %conv14, 39
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* %ti, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %22 to i32
  store i32 %conv18, i32* %qc, align 4
  %23 = load i32, i32* %ti, align 4
  %dec19 = add nsw i32 %23, -1
  store i32 %dec19, i32* %ti, align 4
  store i32 %23, i32* %saveti, align 4
  br label %while.cond20

while.cond20:                                     ; preds = %while.body35, %if.then
  %24 = load i32, i32* %ti, align 4
  %cmp21 = icmp sgt i32 %24, -1
  br i1 %cmp21, label %land.rhs23, label %land.end34

land.rhs23:                                       ; preds = %while.cond20
  %25 = load i8*, i8** @rl_line_buffer, align 4
  %26 = load i32, i32* %ti, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %27 to i32
  %cmp26 = icmp eq i32 %conv25, 32
  br i1 %cmp26, label %lor.end33, label %lor.rhs28

lor.rhs28:                                        ; preds = %land.rhs23
  %28 = load i8*, i8** @rl_line_buffer, align 4
  %29 = load i32, i32* %ti, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %30 to i32
  %cmp31 = icmp eq i32 %conv30, 9
  br label %lor.end33

lor.end33:                                        ; preds = %lor.rhs28, %land.rhs23
  %31 = phi i1 [ true, %land.rhs23 ], [ %cmp31, %lor.rhs28 ]
  br label %land.end34

land.end34:                                       ; preds = %lor.end33, %while.cond20
  %32 = phi i1 [ false, %while.cond20 ], [ %31, %lor.end33 ]
  br i1 %32, label %while.body35, label %while.end37

while.body35:                                     ; preds = %land.end34
  %33 = load i32, i32* %ti, align 4
  %dec36 = add nsw i32 %33, -1
  store i32 %dec36, i32* %ti, align 4
  br label %while.cond20

while.end37:                                      ; preds = %land.end34
  br label %if.end

if.end:                                           ; preds = %while.end37, %lor.lhs.false, %while.end
  store i32 0, i32* %in_command_position, align 4
  %34 = load i32, i32* %ti, align 4
  %cmp38 = icmp slt i32 %34, 0
  br i1 %cmp38, label %if.then40, label %if.else48

if.then40:                                        ; preds = %if.end
  %35 = load i8*, i8** @current_prompt_string, align 4
  %36 = load i8*, i8** @ps1_prompt, align 4
  %cmp41 = icmp eq i8* %35, %36
  br i1 %cmp41, label %if.then43, label %if.else

if.then43:                                        ; preds = %if.then40
  %37 = load i32, i32* %in_command_position, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %in_command_position, align 4
  br label %if.end47

if.else:                                          ; preds = %if.then40
  %call = call i32 @parser_in_command_position()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.else
  %38 = load i32, i32* %in_command_position, align 4
  %inc45 = add nsw i32 %38, 1
  store i32 %inc45, i32* %in_command_position, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %if.else
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then43
  br label %if.end66

if.else48:                                        ; preds = %if.end
  %39 = load i8*, i8** @rl_line_buffer, align 4
  %40 = load i32, i32* %ti, align 4
  %arrayidx49 = getelementptr inbounds i8, i8* %39, i32 %40
  %41 = load i8, i8* %arrayidx49, align 1
  %conv50 = sext i8 %41 to i32
  %tobool51 = icmp ne i32 %conv50, 0
  br i1 %tobool51, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else48
  %42 = load i8*, i8** %command_separator_chars, align 4
  %43 = load i8*, i8** @rl_line_buffer, align 4
  %44 = load i32, i32* %ti, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %45 to i32
  %call54 = call i8* @mbschr(i8* %42, i32 %conv53)
  %cmp55 = icmp ne i8* %call54, null
  br i1 %cmp55, label %if.then57, label %if.else64

cond.false:                                       ; preds = %if.else48
  br i1 false, label %if.then57, label %if.else64

if.then57:                                        ; preds = %cond.false, %cond.true
  %46 = load i32, i32* %in_command_position, align 4
  %inc58 = add nsw i32 %46, 1
  store i32 %inc58, i32* %in_command_position, align 4
  %47 = load i32, i32* %ti, align 4
  %call59 = call i32 @check_redir(i32 %47)
  %cmp60 = icmp eq i32 %call59, 1
  br i1 %cmp60, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.then57
  store i32 0, i32* %in_command_position, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %if.then57
  br label %if.end65

if.else64:                                        ; preds = %cond.false, %cond.true
  br label %if.end65

if.end65:                                         ; preds = %if.else64, %if.end63
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.end47
  %48 = load i32, i32* %in_command_position, align 4
  %tobool67 = icmp ne i32 %48, 0
  br i1 %tobool67, label %land.lhs.true68, label %if.end72

land.lhs.true68:                                  ; preds = %if.end66
  %49 = load i8*, i8** %text.addr, align 4
  %50 = load i32, i32* %ti, align 4
  %call69 = call i32 @invalid_completion(i8* %49, i32 %50)
  %tobool70 = icmp ne i32 %call69, 0
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %land.lhs.true68
  store i32 1, i32* @rl_attempted_completion_over, align 4
  store i8** null, i8*** %retval, align 4
  br label %return

if.end72:                                         ; preds = %land.lhs.true68, %if.end66
  %51 = load i32, i32* %in_command_position, align 4
  %tobool73 = icmp ne i32 %51, 0
  br i1 %tobool73, label %land.lhs.true74, label %if.end91

land.lhs.true74:                                  ; preds = %if.end72
  %52 = load i32, i32* %ti, align 4
  %cmp75 = icmp sge i32 %52, 0
  br i1 %cmp75, label %land.lhs.true77, label %if.end91

land.lhs.true77:                                  ; preds = %land.lhs.true74
  %53 = load i8*, i8** @rl_line_buffer, align 4
  %54 = load i32, i32* %ti, align 4
  %arrayidx78 = getelementptr inbounds i8, i8* %53, i32 %54
  %55 = load i8, i8* %arrayidx78, align 1
  %conv79 = sext i8 %55 to i32
  %cmp80 = icmp eq i32 %conv79, 96
  br i1 %cmp80, label %land.lhs.true82, label %if.end91

land.lhs.true82:                                  ; preds = %land.lhs.true77
  %56 = load i8*, i8** %text.addr, align 4
  %57 = load i8, i8* %56, align 1
  %conv83 = sext i8 %57 to i32
  %cmp84 = icmp ne i32 %conv83, 96
  br i1 %cmp84, label %land.lhs.true86, label %if.end91

land.lhs.true86:                                  ; preds = %land.lhs.true82
  %58 = load i8*, i8** @rl_line_buffer, align 4
  %59 = load i32, i32* %end.addr, align 4
  %call87 = call i32 @unclosed_pair(i8* %58, i32 %59, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.61, i32 0, i32 0))
  %cmp88 = icmp eq i32 %call87, 0
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %land.lhs.true86
  store i32 0, i32* %in_command_position, align 4
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %land.lhs.true86, %land.lhs.true82, %land.lhs.true77, %land.lhs.true74, %if.end72
  %60 = load i8*, i8** %text.addr, align 4
  %61 = load i8, i8* %60, align 1
  %conv92 = sext i8 %61 to i32
  %cmp93 = icmp eq i32 %conv92, 96
  br i1 %cmp93, label %land.lhs.true95, label %if.end108

land.lhs.true95:                                  ; preds = %if.end91
  %62 = load i32, i32* @rl_completion_quote_character, align 4
  %cmp96 = icmp ne i32 %62, 39
  br i1 %cmp96, label %land.lhs.true98, label %if.end108

land.lhs.true98:                                  ; preds = %land.lhs.true95
  %63 = load i32, i32* %in_command_position, align 4
  %tobool99 = icmp ne i32 %63, 0
  br i1 %tobool99, label %if.then106, label %lor.lhs.false100

lor.lhs.false100:                                 ; preds = %land.lhs.true98
  %64 = load i8*, i8** @rl_line_buffer, align 4
  %65 = load i32, i32* %start.addr, align 4
  %call101 = call i32 @unclosed_pair(i8* %64, i32 %65, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.61, i32 0, i32 0))
  %tobool102 = icmp ne i32 %call101, 0
  br i1 %tobool102, label %land.lhs.true103, label %if.end108

land.lhs.true103:                                 ; preds = %lor.lhs.false100
  %66 = load i8*, i8** @rl_line_buffer, align 4
  %67 = load i32, i32* %end.addr, align 4
  %call104 = call i32 @unclosed_pair(i8* %66, i32 %67, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.61, i32 0, i32 0))
  %tobool105 = icmp ne i32 %call104, 0
  br i1 %tobool105, label %if.then106, label %if.end108

if.then106:                                       ; preds = %land.lhs.true103, %land.lhs.true98
  %68 = load i8*, i8** %text.addr, align 4
  %call107 = call i8** @rl_completion_matches(i8* %68, i8* (i8*, i32)* @command_subst_completion_function)
  store i8** %call107, i8*** %matches, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %land.lhs.true103, %lor.lhs.false100, %land.lhs.true95, %if.end91
  %69 = load i32, i32* @prog_completion_enabled, align 4
  %tobool109 = icmp ne i32 %69, 0
  br i1 %tobool109, label %land.rhs110, label %land.end114

land.rhs110:                                      ; preds = %if.end108
  %call111 = call i32 @progcomp_size()
  %cmp112 = icmp sgt i32 %call111, 0
  br label %land.end114

land.end114:                                      ; preds = %land.rhs110, %if.end108
  %70 = phi i1 [ false, %if.end108 ], [ %cmp112, %land.rhs110 ]
  %land.ext = zext i1 %70 to i32
  store i32 %land.ext, i32* %have_progcomps, align 4
  %71 = load i8**, i8*** %matches, align 4
  %cmp115 = icmp eq i8** %71, null
  br i1 %cmp115, label %land.lhs.true117, label %if.end393

land.lhs.true117:                                 ; preds = %land.end114
  %72 = load i32, i32* %in_command_position, align 4
  %cmp118 = icmp eq i32 %72, 0
  br i1 %cmp118, label %land.lhs.true125, label %lor.lhs.false120

lor.lhs.false120:                                 ; preds = %land.lhs.true117
  %73 = load i8*, i8** %text.addr, align 4
  %arrayidx121 = getelementptr inbounds i8, i8* %73, i32 0
  %74 = load i8, i8* %arrayidx121, align 1
  %conv122 = sext i8 %74 to i32
  %cmp123 = icmp eq i32 %conv122, 0
  br i1 %cmp123, label %land.lhs.true125, label %if.end393

land.lhs.true125:                                 ; preds = %lor.lhs.false120, %land.lhs.true117
  %75 = load i8*, i8** @current_prompt_string, align 4
  %76 = load i8*, i8** @ps1_prompt, align 4
  %cmp126 = icmp eq i8* %75, %76
  br i1 %cmp126, label %if.then128, label %if.end393

if.then128:                                       ; preds = %land.lhs.true125
  %77 = load i8**, i8*** @prog_complete_matches, align 4
  %tobool129 = icmp ne i8** %77, null
  br i1 %tobool129, label %if.then130, label %if.end131

if.then130:                                       ; preds = %if.then128
  %78 = load i8**, i8*** @prog_complete_matches, align 4
  %79 = bitcast i8** %78 to i8*
  call void @sh_xfree(i8* %79, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1519)
  br label %if.end131

if.end131:                                        ; preds = %if.then130, %if.then128
  store i8** null, i8*** @prog_complete_matches, align 4
  %80 = load i32, i32* %start.addr, align 4
  store i32 %80, i32* %os, align 4
  store i8* null, i8** %n, align 4
  store i32 0, i32* %was_assignment, align 4
  %81 = load i32, i32* %os, align 4
  %call132 = call i32 @find_cmd_start(i32 %81)
  store i32 %call132, i32* %s, align 4
  %82 = load i32, i32* %end.addr, align 4
  %call133 = call i32 @find_cmd_end(i32 %82)
  store i32 %call133, i32* %e, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end131
  %83 = load i32, i32* %s, align 4
  %84 = load i32, i32* @rl_end, align 4
  %cmp134 = icmp sgt i32 %83, %84
  br i1 %cmp134, label %if.then136, label %if.else137

if.then136:                                       ; preds = %do.body
  %85 = load i32, i32* %e1, align 4
  store i32 %85, i32* %s, align 4
  store i32 %85, i32* %s1, align 4
  br label %do.end152

if.else137:                                       ; preds = %do.body
  %86 = load i32, i32* %was_assignment, align 4
  %tobool138 = icmp ne i32 %86, 0
  br i1 %tobool138, label %land.lhs.true139, label %if.end143

land.lhs.true139:                                 ; preds = %if.else137
  %87 = load i32, i32* %s, align 4
  %88 = load i32, i32* @rl_point, align 4
  %cmp140 = icmp sgt i32 %87, %88
  br i1 %cmp140, label %if.then142, label %if.end143

if.then142:                                       ; preds = %land.lhs.true139
  %89 = load i32, i32* %e1, align 4
  store i32 %89, i32* %s, align 4
  store i32 %89, i32* %s1, align 4
  br label %do.end152

if.end143:                                        ; preds = %land.lhs.true139, %if.else137
  br label %if.end144

if.end144:                                        ; preds = %if.end143
  br label %do.body145

do.body145:                                       ; preds = %if.end144
  %90 = load i8*, i8** %n, align 4
  %tobool146 = icmp ne i8* %90, null
  br i1 %tobool146, label %if.then147, label %if.end148

if.then147:                                       ; preds = %do.body145
  %91 = load i8*, i8** %n, align 4
  call void @sh_xfree(i8* %91, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1545)
  br label %if.end148

if.end148:                                        ; preds = %if.then147, %do.body145
  br label %do.end

do.end:                                           ; preds = %if.end148
  %92 = load i32, i32* %s, align 4
  %call149 = call i8* @find_cmd_name(i32 %92, i32* %s1, i32* %e1)
  store i8* %call149, i8** %n, align 4
  %93 = load i32, i32* %e1, align 4
  %add = add nsw i32 %93, 1
  store i32 %add, i32* %s, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.end
  %94 = load i8*, i8** %n, align 4
  %call150 = call i32 @assignment(i8* %94, i32 0)
  store i32 %call150, i32* %was_assignment, align 4
  %tobool151 = icmp ne i32 %call150, 0
  br i1 %tobool151, label %do.body, label %do.end152

do.end152:                                        ; preds = %do.cond, %if.then142, %if.then136
  %95 = load i32, i32* %s1, align 4
  store i32 %95, i32* %s, align 4
  %96 = load i32, i32* %start.addr, align 4
  %cmp153 = icmp eq i32 %96, 0
  br i1 %cmp153, label %land.lhs.true155, label %if.else167

land.lhs.true155:                                 ; preds = %do.end152
  %97 = load i32, i32* %end.addr, align 4
  %cmp156 = icmp eq i32 %97, 0
  br i1 %cmp156, label %land.lhs.true158, label %if.else167

land.lhs.true158:                                 ; preds = %land.lhs.true155
  %98 = load i32, i32* %e, align 4
  %cmp159 = icmp ne i32 %98, 0
  br i1 %cmp159, label %land.lhs.true161, label %if.else167

land.lhs.true161:                                 ; preds = %land.lhs.true158
  %99 = load i8*, i8** %text.addr, align 4
  %arrayidx162 = getelementptr inbounds i8, i8* %99, i32 0
  %100 = load i8, i8* %arrayidx162, align 1
  %conv163 = sext i8 %100 to i32
  %cmp164 = icmp eq i32 %conv163, 0
  br i1 %cmp164, label %if.then166, label %if.else167

if.then166:                                       ; preds = %land.lhs.true161
  store i32 0, i32* %foundcs, align 4
  br label %if.end371

if.else167:                                       ; preds = %land.lhs.true161, %land.lhs.true158, %land.lhs.true155, %do.end152
  %101 = load i32, i32* %start.addr, align 4
  %102 = load i32, i32* %end.addr, align 4
  %cmp168 = icmp eq i32 %101, %102
  br i1 %cmp168, label %land.lhs.true170, label %if.else180

land.lhs.true170:                                 ; preds = %if.else167
  %103 = load i32, i32* %start.addr, align 4
  %104 = load i32, i32* %s1, align 4
  %cmp171 = icmp eq i32 %103, %104
  br i1 %cmp171, label %land.lhs.true173, label %if.else180

land.lhs.true173:                                 ; preds = %land.lhs.true170
  %105 = load i32, i32* %e, align 4
  %cmp174 = icmp ne i32 %105, 0
  br i1 %cmp174, label %land.lhs.true176, label %if.else180

land.lhs.true176:                                 ; preds = %land.lhs.true173
  %106 = load i32, i32* %e1, align 4
  %107 = load i32, i32* %end.addr, align 4
  %cmp177 = icmp sgt i32 %106, %107
  br i1 %cmp177, label %if.then179, label %if.else180

if.then179:                                       ; preds = %land.lhs.true176
  store i32 0, i32* %foundcs, align 4
  br label %if.end370

if.else180:                                       ; preds = %land.lhs.true176, %land.lhs.true173, %land.lhs.true170, %if.else167
  %108 = load i32, i32* %e, align 4
  %cmp181 = icmp eq i32 %108, 0
  br i1 %cmp181, label %land.lhs.true183, label %if.else195

land.lhs.true183:                                 ; preds = %if.else180
  %109 = load i32, i32* %e, align 4
  %110 = load i32, i32* %s, align 4
  %cmp184 = icmp eq i32 %109, %110
  br i1 %cmp184, label %land.lhs.true186, label %if.else195

land.lhs.true186:                                 ; preds = %land.lhs.true183
  %111 = load i8*, i8** %text.addr, align 4
  %arrayidx187 = getelementptr inbounds i8, i8* %111, i32 0
  %112 = load i8, i8* %arrayidx187, align 1
  %conv188 = sext i8 %112 to i32
  %cmp189 = icmp eq i32 %conv188, 0
  br i1 %cmp189, label %land.lhs.true191, label %if.else195

land.lhs.true191:                                 ; preds = %land.lhs.true186
  %113 = load i32, i32* %have_progcomps, align 4
  %tobool192 = icmp ne i32 %113, 0
  br i1 %tobool192, label %if.then193, label %if.else195

if.then193:                                       ; preds = %land.lhs.true191
  %114 = load i8*, i8** %text.addr, align 4
  %115 = load i32, i32* %s, align 4
  %116 = load i32, i32* %e, align 4
  %call194 = call i8** @programmable_completions(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.62, i32 0, i32 0), i8* %114, i32 %115, i32 %116, i32* %foundcs)
  store i8** %call194, i8*** @prog_complete_matches, align 4
  br label %if.end369

if.else195:                                       ; preds = %land.lhs.true191, %land.lhs.true186, %land.lhs.true183, %if.else180
  %117 = load i32, i32* %start.addr, align 4
  %118 = load i32, i32* %end.addr, align 4
  %cmp196 = icmp eq i32 %117, %118
  br i1 %cmp196, label %land.lhs.true198, label %if.else217

land.lhs.true198:                                 ; preds = %if.else195
  %119 = load i8*, i8** %text.addr, align 4
  %arrayidx199 = getelementptr inbounds i8, i8* %119, i32 0
  %120 = load i8, i8* %arrayidx199, align 1
  %conv200 = sext i8 %120 to i32
  %cmp201 = icmp eq i32 %conv200, 0
  br i1 %cmp201, label %land.lhs.true203, label %if.else217

land.lhs.true203:                                 ; preds = %land.lhs.true198
  %121 = load i32, i32* %s1, align 4
  %122 = load i32, i32* %start.addr, align 4
  %cmp204 = icmp sgt i32 %121, %122
  br i1 %cmp204, label %land.lhs.true206, label %if.else217

land.lhs.true206:                                 ; preds = %land.lhs.true203
  %123 = load i8*, i8** @rl_line_buffer, align 4
  %124 = load i32, i32* %start.addr, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %123, i32 %124
  %125 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %125 to i32
  %cmp209 = icmp eq i32 %conv208, 32
  br i1 %cmp209, label %if.then216, label %lor.lhs.false211

lor.lhs.false211:                                 ; preds = %land.lhs.true206
  %126 = load i8*, i8** @rl_line_buffer, align 4
  %127 = load i32, i32* %start.addr, align 4
  %arrayidx212 = getelementptr inbounds i8, i8* %126, i32 %127
  %128 = load i8, i8* %arrayidx212, align 1
  %conv213 = sext i8 %128 to i32
  %cmp214 = icmp eq i32 %conv213, 9
  br i1 %cmp214, label %if.then216, label %if.else217

if.then216:                                       ; preds = %lor.lhs.false211, %land.lhs.true206
  store i32 0, i32* %foundcs, align 4
  br label %if.end368

if.else217:                                       ; preds = %lor.lhs.false211, %land.lhs.true203, %land.lhs.true198, %if.else195
  %129 = load i32, i32* %e, align 4
  %130 = load i32, i32* %s, align 4
  %cmp218 = icmp sgt i32 %129, %130
  br i1 %cmp218, label %land.lhs.true220, label %if.else264

land.lhs.true220:                                 ; preds = %if.else217
  %131 = load i32, i32* %was_assignment, align 4
  %cmp221 = icmp eq i32 %131, 0
  br i1 %cmp221, label %land.lhs.true223, label %if.else264

land.lhs.true223:                                 ; preds = %land.lhs.true220
  %132 = load i32, i32* %e1, align 4
  %133 = load i32, i32* %end.addr, align 4
  %cmp224 = icmp eq i32 %132, %133
  br i1 %cmp224, label %land.lhs.true226, label %if.else264

land.lhs.true226:                                 ; preds = %land.lhs.true223
  %134 = load i8*, i8** @rl_line_buffer, align 4
  %135 = load i32, i32* %e, align 4
  %arrayidx227 = getelementptr inbounds i8, i8* %134, i32 %135
  %136 = load i8, i8* %arrayidx227, align 1
  %conv228 = sext i8 %136 to i32
  %cmp229 = icmp eq i32 %conv228, 0
  br i1 %cmp229, label %land.lhs.true231, label %if.else264

land.lhs.true231:                                 ; preds = %land.lhs.true226
  %137 = load i8*, i8** @rl_line_buffer, align 4
  %138 = load i32, i32* %e, align 4
  %sub232 = sub nsw i32 %138, 1
  %arrayidx233 = getelementptr inbounds i8, i8* %137, i32 %sub232
  %139 = load i8, i8* %arrayidx233, align 1
  %conv234 = sext i8 %139 to i32
  %cmp235 = icmp eq i32 %conv234, 32
  br i1 %cmp235, label %lor.end243, label %lor.rhs237

lor.rhs237:                                       ; preds = %land.lhs.true231
  %140 = load i8*, i8** @rl_line_buffer, align 4
  %141 = load i32, i32* %e, align 4
  %sub238 = sub nsw i32 %141, 1
  %arrayidx239 = getelementptr inbounds i8, i8* %140, i32 %sub238
  %142 = load i8, i8* %arrayidx239, align 1
  %conv240 = sext i8 %142 to i32
  %cmp241 = icmp eq i32 %conv240, 9
  br label %lor.end243

lor.end243:                                       ; preds = %lor.rhs237, %land.lhs.true231
  %143 = phi i1 [ true, %land.lhs.true231 ], [ %cmp241, %lor.rhs237 ]
  %lor.ext = zext i1 %143 to i32
  %cmp244 = icmp eq i32 %lor.ext, 0
  br i1 %cmp244, label %if.then246, label %if.else264

if.then246:                                       ; preds = %lor.end243
  store i32 0, i32* %foundcs, align 4
  %144 = load i32, i32* %s, align 4
  %145 = load i32, i32* %start.addr, align 4
  %cmp247 = icmp eq i32 %144, %145
  br i1 %cmp247, label %land.rhs249, label %land.end262

land.rhs249:                                      ; preds = %if.then246
  %146 = load i8*, i8** %n, align 4
  %arrayidx250 = getelementptr inbounds i8, i8* %146, i32 0
  %147 = load i8, i8* %arrayidx250, align 1
  %conv251 = sext i8 %147 to i32
  %148 = load i8*, i8** %text.addr, align 4
  %arrayidx252 = getelementptr inbounds i8, i8* %148, i32 0
  %149 = load i8, i8* %arrayidx252, align 1
  %conv253 = sext i8 %149 to i32
  %cmp254 = icmp eq i32 %conv251, %conv253
  br i1 %cmp254, label %land.rhs256, label %land.end260

land.rhs256:                                      ; preds = %land.rhs249
  %150 = load i8*, i8** %n, align 4
  %151 = load i8*, i8** %text.addr, align 4
  %call257 = call i32 @strcmp(i8* %150, i8* %151)
  %cmp258 = icmp eq i32 %call257, 0
  br label %land.end260

land.end260:                                      ; preds = %land.rhs256, %land.rhs249
  %152 = phi i1 [ false, %land.rhs249 ], [ %cmp258, %land.rhs256 ]
  br label %land.end262

land.end262:                                      ; preds = %land.end260, %if.then246
  %153 = phi i1 [ false, %if.then246 ], [ %152, %land.end260 ]
  %land.ext263 = zext i1 %153 to i32
  store i32 %land.ext263, i32* %in_command_position, align 4
  br label %if.end367

if.else264:                                       ; preds = %lor.end243, %land.lhs.true226, %land.lhs.true223, %land.lhs.true220, %if.else217
  %154 = load i32, i32* %e, align 4
  %155 = load i32, i32* %s, align 4
  %cmp265 = icmp sgt i32 %154, %155
  br i1 %cmp265, label %land.lhs.true267, label %if.else291

land.lhs.true267:                                 ; preds = %if.else264
  %156 = load i32, i32* %was_assignment, align 4
  %cmp268 = icmp eq i32 %156, 0
  br i1 %cmp268, label %land.lhs.true270, label %if.else291

land.lhs.true270:                                 ; preds = %land.lhs.true267
  %157 = load i32, i32* %have_progcomps, align 4
  %tobool271 = icmp ne i32 %157, 0
  br i1 %tobool271, label %if.then272, label %if.else291

if.then272:                                       ; preds = %land.lhs.true270
  %158 = load i8*, i8** %n, align 4
  %159 = load i8*, i8** %text.addr, align 4
  %160 = load i32, i32* %s, align 4
  %161 = load i32, i32* %e, align 4
  %call273 = call i8** @programmable_completions(i8* %158, i8* %159, i32 %160, i32 %161, i32* %foundcs)
  store i8** %call273, i8*** @prog_complete_matches, align 4
  %162 = load i32, i32* %s, align 4
  %163 = load i32, i32* %start.addr, align 4
  %cmp274 = icmp eq i32 %162, %163
  br i1 %cmp274, label %land.rhs276, label %land.end289

land.rhs276:                                      ; preds = %if.then272
  %164 = load i8*, i8** %n, align 4
  %arrayidx277 = getelementptr inbounds i8, i8* %164, i32 0
  %165 = load i8, i8* %arrayidx277, align 1
  %conv278 = sext i8 %165 to i32
  %166 = load i8*, i8** %text.addr, align 4
  %arrayidx279 = getelementptr inbounds i8, i8* %166, i32 0
  %167 = load i8, i8* %arrayidx279, align 1
  %conv280 = sext i8 %167 to i32
  %cmp281 = icmp eq i32 %conv278, %conv280
  br i1 %cmp281, label %land.rhs283, label %land.end287

land.rhs283:                                      ; preds = %land.rhs276
  %168 = load i8*, i8** %n, align 4
  %169 = load i8*, i8** %text.addr, align 4
  %call284 = call i32 @strcmp(i8* %168, i8* %169)
  %cmp285 = icmp eq i32 %call284, 0
  br label %land.end287

land.end287:                                      ; preds = %land.rhs283, %land.rhs276
  %170 = phi i1 [ false, %land.rhs276 ], [ %cmp285, %land.rhs283 ]
  br label %land.end289

land.end289:                                      ; preds = %land.end287, %if.then272
  %171 = phi i1 [ false, %if.then272 ], [ %170, %land.end287 ]
  %land.ext290 = zext i1 %171 to i32
  store i32 %land.ext290, i32* %in_command_position, align 4
  br label %if.end366

if.else291:                                       ; preds = %land.lhs.true270, %land.lhs.true267, %if.else264
  %172 = load i32, i32* %s, align 4
  %173 = load i32, i32* %e, align 4
  %cmp292 = icmp sge i32 %172, %173
  br i1 %cmp292, label %land.lhs.true294, label %if.else324

land.lhs.true294:                                 ; preds = %if.else291
  %174 = load i8*, i8** %n, align 4
  %arrayidx295 = getelementptr inbounds i8, i8* %174, i32 0
  %175 = load i8, i8* %arrayidx295, align 1
  %conv296 = sext i8 %175 to i32
  %cmp297 = icmp eq i32 %conv296, 0
  br i1 %cmp297, label %land.lhs.true299, label %if.else324

land.lhs.true299:                                 ; preds = %land.lhs.true294
  %176 = load i8*, i8** %text.addr, align 4
  %arrayidx300 = getelementptr inbounds i8, i8* %176, i32 0
  %177 = load i8, i8* %arrayidx300, align 1
  %conv301 = sext i8 %177 to i32
  %cmp302 = icmp eq i32 %conv301, 0
  br i1 %cmp302, label %land.lhs.true304, label %if.else324

land.lhs.true304:                                 ; preds = %land.lhs.true299
  %178 = load i32, i32* %start.addr, align 4
  %cmp305 = icmp sgt i32 %178, 0
  br i1 %cmp305, label %land.lhs.true307, label %if.else324

land.lhs.true307:                                 ; preds = %land.lhs.true304
  %179 = load i32, i32* %was_assignment, align 4
  %cmp308 = icmp eq i32 %179, 0
  br i1 %cmp308, label %land.lhs.true310, label %if.else324

land.lhs.true310:                                 ; preds = %land.lhs.true307
  %180 = load i8*, i8** @rl_line_buffer, align 4
  %181 = load i32, i32* %start.addr, align 4
  %sub311 = sub nsw i32 %181, 1
  %arrayidx312 = getelementptr inbounds i8, i8* %180, i32 %sub311
  %182 = load i8, i8* %arrayidx312, align 1
  %conv313 = sext i8 %182 to i32
  %tobool314 = icmp ne i32 %conv313, 0
  br i1 %tobool314, label %cond.true315, label %cond.false322

cond.true315:                                     ; preds = %land.lhs.true310
  %183 = load i8*, i8** @rl_line_buffer, align 4
  %184 = load i32, i32* %start.addr, align 4
  %sub316 = sub nsw i32 %184, 1
  %arrayidx317 = getelementptr inbounds i8, i8* %183, i32 %sub316
  %185 = load i8, i8* %arrayidx317, align 1
  %conv318 = sext i8 %185 to i32
  %call319 = call i8* @mbschr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i32 %conv318)
  %cmp320 = icmp ne i8* %call319, null
  br i1 %cmp320, label %if.then323, label %if.else324

cond.false322:                                    ; preds = %land.lhs.true310
  br i1 false, label %if.then323, label %if.else324

if.then323:                                       ; preds = %cond.false322, %cond.true315
  store i32 0, i32* %foundcs, align 4
  store i32 1, i32* %in_command_position, align 4
  br label %if.end365

if.else324:                                       ; preds = %cond.false322, %cond.true315, %land.lhs.true307, %land.lhs.true304, %land.lhs.true299, %land.lhs.true294, %if.else291
  %186 = load i32, i32* %s, align 4
  %187 = load i32, i32* %e, align 4
  %cmp325 = icmp sge i32 %186, %187
  br i1 %cmp325, label %land.lhs.true327, label %if.else341

land.lhs.true327:                                 ; preds = %if.else324
  %188 = load i8*, i8** %n, align 4
  %arrayidx328 = getelementptr inbounds i8, i8* %188, i32 0
  %189 = load i8, i8* %arrayidx328, align 1
  %conv329 = sext i8 %189 to i32
  %cmp330 = icmp eq i32 %conv329, 0
  br i1 %cmp330, label %land.lhs.true332, label %if.else341

land.lhs.true332:                                 ; preds = %land.lhs.true327
  %190 = load i8*, i8** %text.addr, align 4
  %arrayidx333 = getelementptr inbounds i8, i8* %190, i32 0
  %191 = load i8, i8* %arrayidx333, align 1
  %conv334 = sext i8 %191 to i32
  %cmp335 = icmp eq i32 %conv334, 0
  br i1 %cmp335, label %land.lhs.true337, label %if.else341

land.lhs.true337:                                 ; preds = %land.lhs.true332
  %192 = load i32, i32* %start.addr, align 4
  %cmp338 = icmp sgt i32 %192, 0
  br i1 %cmp338, label %if.then340, label %if.else341

if.then340:                                       ; preds = %land.lhs.true337
  store i32 0, i32* %foundcs, align 4
  %193 = load i32, i32* %was_assignment, align 4
  store i32 %193, i32* %in_command_position, align 4
  br label %if.end364

if.else341:                                       ; preds = %land.lhs.true337, %land.lhs.true332, %land.lhs.true327, %if.else324
  %194 = load i32, i32* %s, align 4
  %195 = load i32, i32* %start.addr, align 4
  %cmp342 = icmp eq i32 %194, %195
  br i1 %cmp342, label %land.lhs.true344, label %if.else362

land.lhs.true344:                                 ; preds = %if.else341
  %196 = load i32, i32* %e, align 4
  %197 = load i32, i32* %end.addr, align 4
  %cmp345 = icmp eq i32 %196, %197
  br i1 %cmp345, label %land.lhs.true347, label %if.else362

land.lhs.true347:                                 ; preds = %land.lhs.true344
  %198 = load i8*, i8** %n, align 4
  %arrayidx348 = getelementptr inbounds i8, i8* %198, i32 0
  %199 = load i8, i8* %arrayidx348, align 1
  %conv349 = sext i8 %199 to i32
  %200 = load i8*, i8** %text.addr, align 4
  %arrayidx350 = getelementptr inbounds i8, i8* %200, i32 0
  %201 = load i8, i8* %arrayidx350, align 1
  %conv351 = sext i8 %201 to i32
  %cmp352 = icmp eq i32 %conv349, %conv351
  br i1 %cmp352, label %land.lhs.true354, label %if.else362

land.lhs.true354:                                 ; preds = %land.lhs.true347
  %202 = load i8*, i8** %n, align 4
  %203 = load i8*, i8** %text.addr, align 4
  %call355 = call i32 @strcmp(i8* %202, i8* %203)
  %cmp356 = icmp eq i32 %call355, 0
  br i1 %cmp356, label %land.lhs.true358, label %if.else362

land.lhs.true358:                                 ; preds = %land.lhs.true354
  %204 = load i32, i32* %start.addr, align 4
  %cmp359 = icmp sgt i32 %204, 0
  br i1 %cmp359, label %if.then361, label %if.else362

if.then361:                                       ; preds = %land.lhs.true358
  store i32 0, i32* %foundcs, align 4
  store i32 1, i32* %in_command_position, align 4
  br label %if.end363

if.else362:                                       ; preds = %land.lhs.true358, %land.lhs.true354, %land.lhs.true347, %land.lhs.true344, %if.else341
  store i32 0, i32* %foundcs, align 4
  br label %if.end363

if.end363:                                        ; preds = %if.else362, %if.then361
  br label %if.end364

if.end364:                                        ; preds = %if.end363, %if.then340
  br label %if.end365

if.end365:                                        ; preds = %if.end364, %if.then323
  br label %if.end366

if.end366:                                        ; preds = %if.end365, %land.end289
  br label %if.end367

if.end367:                                        ; preds = %if.end366, %land.end262
  br label %if.end368

if.end368:                                        ; preds = %if.end367, %if.then216
  br label %if.end369

if.end369:                                        ; preds = %if.end368, %if.then193
  br label %if.end370

if.end370:                                        ; preds = %if.end369, %if.then179
  br label %if.end371

if.end371:                                        ; preds = %if.end370, %if.then166
  br label %do.body372

do.body372:                                       ; preds = %if.end371
  %205 = load i8*, i8** %n, align 4
  %tobool373 = icmp ne i8* %205, null
  br i1 %tobool373, label %if.then374, label %if.end375

if.then374:                                       ; preds = %do.body372
  %206 = load i8*, i8** %n, align 4
  call void @sh_xfree(i8* %206, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1600)
  br label %if.end375

if.end375:                                        ; preds = %if.then374, %do.body372
  br label %do.end377

do.end377:                                        ; preds = %if.end375
  %207 = load i32, i32* %foundcs, align 4
  %tobool378 = icmp ne i32 %207, 0
  br i1 %tobool378, label %if.then379, label %if.end392

if.then379:                                       ; preds = %do.end377
  %208 = load i32, i32* %foundcs, align 4
  call void @pcomp_set_readline_variables(i32 %208, i32 1)
  %209 = load i8*, i8** %text.addr, align 4
  %call380 = call i8** @rl_completion_matches(i8* %209, i8* (i8*, i32)* @prog_complete_return)
  store i8** %call380, i8*** %matches, align 4
  %210 = load i32, i32* %foundcs, align 4
  %and = and i32 %210, 2
  %cmp381 = icmp eq i32 %and, 0
  br i1 %cmp381, label %if.then383, label %if.end384

if.then383:                                       ; preds = %if.then379
  store i32 1, i32* @rl_attempted_completion_over, align 4
  br label %if.end384

if.end384:                                        ; preds = %if.then383, %if.then379
  %211 = load i8**, i8*** %matches, align 4
  %tobool385 = icmp ne i8** %211, null
  br i1 %tobool385, label %if.then390, label %lor.lhs.false386

lor.lhs.false386:                                 ; preds = %if.end384
  %212 = load i32, i32* %foundcs, align 4
  %and387 = and i32 %212, 64
  %cmp388 = icmp eq i32 %and387, 0
  br i1 %cmp388, label %if.then390, label %if.end391

if.then390:                                       ; preds = %lor.lhs.false386, %if.end384
  %213 = load i8**, i8*** %matches, align 4
  store i8** %213, i8*** %retval, align 4
  br label %return

if.end391:                                        ; preds = %lor.lhs.false386
  br label %if.end392

if.end392:                                        ; preds = %if.end391, %do.end377
  br label %if.end393

if.end393:                                        ; preds = %if.end392, %land.lhs.true125, %lor.lhs.false120, %land.end114
  %214 = load i8**, i8*** %matches, align 4
  %cmp394 = icmp eq i8** %214, null
  br i1 %cmp394, label %if.then396, label %if.end401

if.then396:                                       ; preds = %if.end393
  store i32 0, i32* %dflags, align 4
  %215 = load i32, i32* %in_command_position, align 4
  %tobool397 = icmp ne i32 %215, 0
  br i1 %tobool397, label %if.then398, label %if.end399

if.then398:                                       ; preds = %if.then396
  %216 = load i32, i32* %dflags, align 4
  %or = or i32 %216, 1
  store i32 %or, i32* %dflags, align 4
  br label %if.end399

if.end399:                                        ; preds = %if.then398, %if.then396
  %217 = load i8*, i8** %text.addr, align 4
  %218 = load i32, i32* %start.addr, align 4
  %219 = load i32, i32* %end.addr, align 4
  %220 = load i32, i32* %qc, align 4
  %221 = load i32, i32* %dflags, align 4
  %call400 = call i8** @bash_default_completion(i8* %217, i32 %218, i32 %219, i32 %220, i32 %221)
  store i8** %call400, i8*** %matches, align 4
  br label %if.end401

if.end401:                                        ; preds = %if.end399, %if.end393
  %222 = load i8**, i8*** %matches, align 4
  store i8** %222, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end401, %if.then390, %if.then71
  %223 = load i8**, i8*** %retval, align 4
  ret i8** %223
}

; Function Attrs: noinline nounwind
define void @set_directory_hook() #0 {
entry:
  %0 = load i32, i32* @dircomplete_expand, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 (i8**)* @bash_directory_completion_hook, i32 (i8**)** @rl_directory_completion_hook, align 4
  store i32 (i8**)* null, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 (i8**)* @bash_directory_completion_hook, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  store i32 (i8**)* null, i32 (i8**)** @rl_directory_completion_hook, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal i8* @bash_filename_rewrite_hook(i8* %fname, i32 %fnlen) #0 {
entry:
  %fname.addr = alloca i8*, align 4
  %fnlen.addr = alloca i32, align 4
  %conv = alloca i8*, align 4
  store i8* %fname, i8** %fname.addr, align 4
  store i32 %fnlen, i32* %fnlen.addr, align 4
  %0 = load i8*, i8** %fname.addr, align 4
  %1 = load i32, i32* %fnlen.addr, align 4
  %call = call i8* @fnx_fromfs(i8* %0, i32 %1)
  store i8* %call, i8** %conv, align 4
  %2 = load i8*, i8** %conv, align 4
  %3 = load i8*, i8** %fname.addr, align 4
  %cmp = icmp ne i8* %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %conv, align 4
  %call2 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3055)
  %5 = load i8*, i8** %conv, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %5)
  store i8* %call4, i8** %conv, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i8*, i8** %conv, align 4
  ret i8* %6
}

; Function Attrs: noinline nounwind
define internal i32 @bash_filename_stat_hook(i8** %dirname) #0 {
entry:
  %retval = alloca i32, align 4
  %dirname.addr = alloca i8**, align 4
  %local_dirname = alloca i8*, align 4
  %new_dirname = alloca i8*, align 4
  %t = alloca i8*, align 4
  %should_expand_dirname = alloca i32, align 4
  %return_value = alloca i32, align 4
  %global_nounset = alloca i32, align 4
  %wl = alloca %struct.word_list*, align 4
  %sb = alloca %struct.stat, align 8
  %temp1 = alloca i8*, align 4
  %temp2 = alloca i8*, align 4
  store i8** %dirname, i8*** %dirname.addr, align 4
  %0 = load i8**, i8*** %dirname.addr, align 4
  %1 = load i8*, i8** %0, align 4
  store i8* %1, i8** %local_dirname, align 4
  store i32 0, i32* %return_value, align 4
  store i32 0, i32* %should_expand_dirname, align 4
  %2 = load i8*, i8** %local_dirname, align 4
  %call = call i8* @mbschr(i8* %2, i32 36)
  store i8* %call, i8** %t, align 4
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 36, i32* %should_expand_dirname, align 4
  br label %if.end4

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %local_dirname, align 4
  %call1 = call i8* @mbschr(i8* %3, i32 96)
  store i8* %call1, i8** %t, align 4
  %tobool2 = icmp ne i8* %call1, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  store i32 96, i32* %should_expand_dirname, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %4 = load i32, i32* %should_expand_dirname, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end4
  %5 = load i8*, i8** %local_dirname, align 4
  %call6 = call i32 @directory_exists(i8* %5, i32 0)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true
  store i32 0, i32* %should_expand_dirname, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %land.lhs.true, %if.end4
  %6 = load i32, i32* %should_expand_dirname, align 4
  %tobool10 = icmp ne i32 %6, 0
  br i1 %tobool10, label %if.then11, label %if.end36

if.then11:                                        ; preds = %if.end9
  %7 = load i8*, i8** %local_dirname, align 4
  %call12 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call12
  %call13 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3155)
  %8 = load i8*, i8** %local_dirname, align 4
  %call14 = call i8* @strcpy(i8* %call13, i8* %8)
  store i8* %call14, i8** %new_dirname, align 4
  %9 = load i32, i32* @unbound_vars_is_error, align 4
  store i32 %9, i32* %global_nounset, align 4
  store i32 0, i32* @unbound_vars_is_error, align 4
  %10 = load i8*, i8** %new_dirname, align 4
  %call15 = call %struct.word_list* @expand_prompt_string(i8* %10, i32 0, i32 135267328)
  store %struct.word_list* %call15, %struct.word_list** %wl, align 4
  %11 = load i32, i32* %global_nounset, align 4
  store i32 %11, i32* @unbound_vars_is_error, align 4
  %12 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool16 = icmp ne %struct.word_list* %12, null
  br i1 %tobool16, label %if.then17, label %if.else34

if.then17:                                        ; preds = %if.then11
  %13 = load i8*, i8** %new_dirname, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3164)
  %14 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %call18 = call i8* @string_list(%struct.word_list* %14)
  store i8* %call18, i8** %new_dirname, align 4
  %15 = load i8*, i8** %new_dirname, align 4
  %tobool19 = icmp ne i8* %15, null
  br i1 %tobool19, label %land.lhs.true20, label %if.else32

land.lhs.true20:                                  ; preds = %if.then17
  %16 = load i8*, i8** %new_dirname, align 4
  %17 = load i8, i8* %16, align 1
  %conv = sext i8 %17 to i32
  %tobool21 = icmp ne i32 %conv, 0
  br i1 %tobool21, label %if.then22, label %if.else32

if.then22:                                        ; preds = %land.lhs.true20
  %18 = load i8*, i8** %local_dirname, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3171)
  %19 = load i8*, i8** %new_dirname, align 4
  %20 = load i8**, i8*** %dirname.addr, align 4
  store i8* %19, i8** %20, align 4
  store i8* %19, i8** %local_dirname, align 4
  %21 = load i8*, i8** %local_dirname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx, align 1
  %conv23 = sext i8 %22 to i32
  %23 = load i8**, i8*** %dirname.addr, align 4
  %24 = load i8*, i8** %23, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %24, i32 0
  %25 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %25 to i32
  %cmp = icmp eq i32 %conv23, %conv25
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then22
  %26 = load i8*, i8** %local_dirname, align 4
  %27 = load i8**, i8*** %dirname.addr, align 4
  %28 = load i8*, i8** %27, align 4
  %call27 = call i32 @strcmp(i8* %26, i8* %28)
  %cmp28 = icmp eq i32 %call27, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then22
  %29 = phi i1 [ false, %if.then22 ], [ %cmp28, %land.rhs ]
  %land.ext = zext i1 %29 to i32
  %cmp30 = icmp eq i32 %land.ext, 0
  %conv31 = zext i1 %cmp30 to i32
  store i32 %conv31, i32* %return_value, align 4
  br label %if.end33

if.else32:                                        ; preds = %land.lhs.true20, %if.then17
  %30 = load i8*, i8** %new_dirname, align 4
  call void @sh_xfree(i8* %30, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3176)
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %land.end
  %31 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %31)
  br label %if.end35

if.else34:                                        ; preds = %if.then11
  %32 = load i8*, i8** %new_dirname, align 4
  call void @sh_xfree(i8* %32, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3180)
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.end33
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end9
  %33 = load i32, i32* @no_symbolic_links, align 4
  %cmp37 = icmp eq i32 %33, 0
  br i1 %cmp37, label %land.lhs.true39, label %if.end55

land.lhs.true39:                                  ; preds = %if.end36
  %34 = load i8*, i8** %local_dirname, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %35 to i32
  %cmp42 = icmp ne i32 %conv41, 46
  br i1 %cmp42, label %if.then47, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true39
  %36 = load i8*, i8** %local_dirname, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %36, i32 1
  %37 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %37 to i32
  %tobool46 = icmp ne i32 %conv45, 0
  br i1 %tobool46, label %if.then47, label %if.end55

if.then47:                                        ; preds = %lor.lhs.false, %land.lhs.true39
  %call48 = call i8* @get_working_directory(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.68, i32 0, i32 0))
  store i8* %call48, i8** %t, align 4
  %38 = load i8*, i8** %local_dirname, align 4
  %39 = load i8*, i8** %t, align 4
  %call49 = call i8* @make_absolute(i8* %38, i8* %39)
  store i8* %call49, i8** %temp1, align 4
  %40 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %40, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3192)
  %41 = load i8*, i8** %temp1, align 4
  %call50 = call i8* @sh_canonpath(i8* %41, i32 3)
  store i8* %call50, i8** %temp2, align 4
  %42 = load i8*, i8** %temp2, align 4
  %cmp51 = icmp eq i8* %42, null
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.then47
  %43 = load i8*, i8** %temp1, align 4
  call void @sh_xfree(i8* %43, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3198)
  %44 = load i32, i32* %return_value, align 4
  store i32 %44, i32* %retval, align 4
  br label %return

if.end54:                                         ; preds = %if.then47
  %45 = load i8*, i8** %local_dirname, align 4
  call void @sh_xfree(i8* %45, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3202)
  %46 = load i8*, i8** %temp2, align 4
  %47 = load i8**, i8*** %dirname.addr, align 4
  store i8* %46, i8** %47, align 4
  %48 = load i8*, i8** %temp1, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3204)
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %lor.lhs.false, %if.end36
  %49 = load i32, i32* %return_value, align 4
  store i32 %49, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end55, %if.then53
  %50 = load i32, i32* %retval, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind
define internal i32 @filename_completion_ignore(i8** %names) #0 {
entry:
  %retval = alloca i32, align 4
  %names.addr = alloca i8**, align 4
  store i8** %names, i8*** %names.addr, align 4
  call void @setup_ignore_patterns(%struct.ignorevar* @fignore)
  %0 = load i32, i32* getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @fignore, i32 0, i32 2), align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %names.addr, align 4
  call void @_ignore_completion_names(i8** %1, i32 (i8*)* @name_is_acceptable)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define internal i32 @vi_edit_and_execute_command(i32 %count, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %c.addr, align 4
  %call = call i32 @edit_and_execute_command(i32 %1, i32 %2, i32 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.51, i32 0, i32 0))
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %c.addr, align 4
  %call1 = call i32 @edit_and_execute_command(i32 %3, i32 %4, i32 0, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.52, i32 0, i32 0))
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define internal i32 @posix_edit_macros(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %alias_name = alloca [3 x i8], align 1
  %alias_value = alloca i8*, align 4
  %macro = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %c, align 4
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %alias_name, i32 0, i32 0
  store i8 95, i8* %arrayidx, align 1
  %0 = load i32, i32* %c, align 4
  %conv = trunc i32 %0 to i8
  %arrayidx1 = getelementptr inbounds [3 x i8], [3 x i8]* %alias_name, i32 0, i32 1
  store i8 %conv, i8* %arrayidx1, align 1
  %arrayidx2 = getelementptr inbounds [3 x i8], [3 x i8]* %alias_name, i32 0, i32 2
  store i8 0, i8* %arrayidx2, align 1
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %alias_name, i32 0, i32 0
  %call3 = call i8* @get_alias_value(i8* %arraydecay)
  store i8* %call3, i8** %alias_value, align 4
  %1 = load i8*, i8** %alias_value, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %alias_value, align 4
  %3 = load i8, i8* %2, align 1
  %conv4 = sext i8 %3 to i32
  %tobool5 = icmp ne i32 %conv4, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i8*, i8** %alias_value, align 4
  %call6 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1042)
  %5 = load i8*, i8** %alias_value, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %5)
  store i8* %call8, i8** %macro, align 4
  %6 = load i8*, i8** %macro, align 4
  call void @rl_push_macro_input(i8* %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @bash_vi_complete(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %p = alloca i32, align 4
  %r = alloca i32, align 4
  %t = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** @rl_line_buffer, align 4
  %3 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %if.end18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %if.end18, label %if.then

if.then:                                          ; preds = %lor.lhs.false
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %9 = load i32, i32* @rl_point, align 4
  %add = add nsw i32 %9, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i32 %add
  %10 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %10 to i32
  %cmp9 = icmp eq i32 %conv8, 32
  br i1 %cmp9, label %if.end, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %if.then
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %12 = load i32, i32* @rl_point, align 4
  %add12 = add nsw i32 %12, 1
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i32 %add12
  %13 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %13 to i32
  %cmp15 = icmp eq i32 %conv14, 9
  br i1 %cmp15, label %if.end, label %if.then17

if.then17:                                        ; preds = %lor.lhs.false11
  %call = call i32 @rl_vi_end_word(i32 1, i32 69)
  br label %if.end

if.end:                                           ; preds = %if.then17, %lor.lhs.false11, %if.then
  %14 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end, %lor.lhs.false, %land.lhs.true, %entry
  store i8* null, i8** %t, align 4
  %15 = load i32, i32* @rl_point, align 4
  %cmp19 = icmp sgt i32 %15, 0
  br i1 %cmp19, label %if.then21, label %if.end24

if.then21:                                        ; preds = %if.end18
  %16 = load i32, i32* @rl_point, align 4
  store i32 %16, i32* %p, align 4
  %call22 = call i32 @rl_vi_bWord(i32 1, i32 66)
  %17 = load i32, i32* @rl_point, align 4
  store i32 %17, i32* %r, align 4
  %18 = load i32, i32* %p, align 4
  store i32 %18, i32* @rl_point, align 4
  %19 = load i32, i32* %r, align 4
  store i32 %19, i32* %p, align 4
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* %p, align 4
  %22 = load i32, i32* @rl_point, align 4
  %call23 = call i8* @substring(i8* %20, i32 %21, i32 %22)
  store i8* %call23, i8** %t, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %if.end18
  %23 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %23, null
  br i1 %tobool, label %land.lhs.true25, label %if.end30

land.lhs.true25:                                  ; preds = %if.end24
  %24 = load i8*, i8** %t, align 4
  %call26 = call i32 @glob_pattern_p(i8* %24)
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %land.lhs.true25
  store i32 1, i32* @rl_explicit_arg, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %land.lhs.true25, %if.end24
  br label %do.body

do.body:                                          ; preds = %if.end30
  %25 = load i8*, i8** %t, align 4
  %tobool31 = icmp ne i8* %25, null
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %do.body
  %26 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3828)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end33
  %27 = load i32, i32* %key.addr, align 4
  %cmp34 = icmp eq i32 %27, 42
  br i1 %cmp34, label %if.then36, label %if.else

if.then36:                                        ; preds = %do.end
  %28 = load i32, i32* %count.addr, align 4
  %29 = load i32, i32* %key.addr, align 4
  %call37 = call i32 @bash_glob_expand_word(i32 %28, i32 %29)
  store i32 %call37, i32* %r, align 4
  br label %if.end51

if.else:                                          ; preds = %do.end
  %30 = load i32, i32* %key.addr, align 4
  %cmp38 = icmp eq i32 %30, 61
  br i1 %cmp38, label %if.then40, label %if.else42

if.then40:                                        ; preds = %if.else
  %31 = load i32, i32* %count.addr, align 4
  %32 = load i32, i32* %key.addr, align 4
  %call41 = call i32 @bash_glob_list_expansions(i32 %31, i32 %32)
  store i32 %call41, i32* %r, align 4
  br label %if.end50

if.else42:                                        ; preds = %if.else
  %33 = load i32, i32* %key.addr, align 4
  %cmp43 = icmp eq i32 %33, 92
  br i1 %cmp43, label %if.then45, label %if.else47

if.then45:                                        ; preds = %if.else42
  %34 = load i32, i32* %count.addr, align 4
  %35 = load i32, i32* %key.addr, align 4
  %call46 = call i32 @bash_glob_complete_word(i32 %34, i32 %35)
  store i32 %call46, i32* %r, align 4
  br label %if.end49

if.else47:                                        ; preds = %if.else42
  %36 = load i32, i32* %key.addr, align 4
  %call48 = call i32 @rl_complete(i32 0, i32 %36)
  store i32 %call48, i32* %r, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.else47, %if.then45
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then40
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then36
  %37 = load i32, i32* %key.addr, align 4
  %cmp52 = icmp eq i32 %37, 42
  br i1 %cmp52, label %if.then57, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %if.end51
  %38 = load i32, i32* %key.addr, align 4
  %cmp55 = icmp eq i32 %38, 92
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %lor.lhs.false54, %if.end51
  %39 = load i32, i32* %key.addr, align 4
  call void @rl_vi_start_inserting(i32 %39, i32 1, i32 1)
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %lor.lhs.false54
  %40 = load i32, i32* %r, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind
define internal void @set_filename_bstab(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  call void @llvm.memset.p0i8.i32(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @filename_bstab, i32 0, i32 0), i8 0, i32 256, i32 1, i1 false)
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %idxprom = sext i8 %6 to i32
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @filename_bstab, i32 0, i32 %idxprom
  store i8 1, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  ret void
}

; Function Attrs: noinline nounwind
define internal i8* @bash_quote_filename(i8* %s, i32 %rtype, i8* %qcp) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %rtype.addr = alloca i32, align 4
  %qcp.addr = alloca i8*, align 4
  %rtext = alloca i8*, align 4
  %mtext = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %rlen = alloca i32, align 4
  %cs = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %rtype, i32* %rtype.addr, align 4
  store i8* %qcp, i8** %qcp.addr, align 4
  store i8* null, i8** %rtext, align 4
  %0 = load i32, i32* @completion_quoting_style, align 4
  store i32 %0, i32* %cs, align 4
  %1 = load i8*, i8** %qcp.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %cs, align 4
  %cmp2 = icmp eq i32 %3, 3
  br i1 %cmp2, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** %s.addr, align 4
  %call = call i8* @mbschr(i8* %4, i32 10)
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true4
  store i32 2, i32* %cs, align 4
  br label %if.end32

if.else:                                          ; preds = %land.lhs.true4, %land.lhs.true, %entry
  %5 = load i8*, i8** %qcp.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 34
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  store i32 1, i32* %cs, align 4
  br label %if.end31

if.else9:                                         ; preds = %if.else
  %7 = load i8*, i8** %qcp.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv10 = sext i8 %8 to i32
  %cmp11 = icmp eq i32 %conv10, 39
  br i1 %cmp11, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else9
  store i32 2, i32* %cs, align 4
  br label %if.end30

if.else14:                                        ; preds = %if.else9
  %9 = load i8*, i8** %qcp.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv15 = sext i8 %10 to i32
  %cmp16 = icmp eq i32 %conv15, 0
  br i1 %cmp16, label %land.lhs.true18, label %if.end

land.lhs.true18:                                  ; preds = %if.else14
  %11 = load i32, i32* @history_expansion, align 4
  %tobool19 = icmp ne i32 %11, 0
  br i1 %tobool19, label %land.lhs.true20, label %if.end

land.lhs.true20:                                  ; preds = %land.lhs.true18
  %12 = load i32, i32* %cs, align 4
  %cmp21 = icmp eq i32 %12, 1
  br i1 %cmp21, label %land.lhs.true23, label %if.end

land.lhs.true23:                                  ; preds = %land.lhs.true20
  %13 = load i32, i32* @history_expansion_inhibited, align 4
  %cmp24 = icmp eq i32 %13, 0
  br i1 %cmp24, label %land.lhs.true26, label %if.end

land.lhs.true26:                                  ; preds = %land.lhs.true23
  %14 = load i8*, i8** %s.addr, align 4
  %call27 = call i8* @mbschr(i8* %14, i32 33)
  %tobool28 = icmp ne i8* %call27, null
  br i1 %tobool28, label %if.then29, label %if.end

if.then29:                                        ; preds = %land.lhs.true26
  store i32 3, i32* %cs, align 4
  br label %if.end

if.end:                                           ; preds = %if.then29, %land.lhs.true26, %land.lhs.true23, %land.lhs.true20, %land.lhs.true18, %if.else14
  br label %if.end30

if.end30:                                         ; preds = %if.end, %if.then13
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.then8
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then
  %15 = load i8*, i8** %qcp.addr, align 4
  %16 = load i8, i8* %15, align 1
  %conv33 = sext i8 %16 to i32
  %cmp34 = icmp eq i32 %conv33, 34
  br i1 %cmp34, label %land.lhs.true36, label %if.end48

land.lhs.true36:                                  ; preds = %if.end32
  %17 = load i32, i32* @history_expansion, align 4
  %tobool37 = icmp ne i32 %17, 0
  br i1 %tobool37, label %land.lhs.true38, label %if.end48

land.lhs.true38:                                  ; preds = %land.lhs.true36
  %18 = load i32, i32* %cs, align 4
  %cmp39 = icmp eq i32 %18, 1
  br i1 %cmp39, label %land.lhs.true41, label %if.end48

land.lhs.true41:                                  ; preds = %land.lhs.true38
  %19 = load i32, i32* @history_expansion_inhibited, align 4
  %cmp42 = icmp eq i32 %19, 0
  br i1 %cmp42, label %land.lhs.true44, label %if.end48

land.lhs.true44:                                  ; preds = %land.lhs.true41
  %20 = load i8*, i8** %s.addr, align 4
  %call45 = call i8* @mbschr(i8* %20, i32 33)
  %tobool46 = icmp ne i8* %call45, null
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %land.lhs.true44
  store i32 3, i32* %cs, align 4
  %21 = load i8*, i8** %qcp.addr, align 4
  store i8 0, i8* %21, align 1
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %land.lhs.true44, %land.lhs.true41, %land.lhs.true38, %land.lhs.true36, %if.end32
  %22 = load i8*, i8** %s.addr, align 4
  store i8* %22, i8** %mtext, align 4
  %23 = load i8*, i8** %mtext, align 4
  %arrayidx = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx, align 1
  %conv49 = sext i8 %24 to i32
  %cmp50 = icmp eq i32 %conv49, 126
  br i1 %cmp50, label %land.lhs.true52, label %if.end60

land.lhs.true52:                                  ; preds = %if.end48
  %25 = load i32, i32* %rtype.addr, align 4
  %cmp53 = icmp eq i32 %25, 1
  br i1 %cmp53, label %land.lhs.true55, label %if.end60

land.lhs.true55:                                  ; preds = %land.lhs.true52
  %26 = load i32, i32* %cs, align 4
  %cmp56 = icmp ne i32 %26, 3
  br i1 %cmp56, label %if.then58, label %if.end60

if.then58:                                        ; preds = %land.lhs.true55
  %27 = load i8*, i8** %s.addr, align 4
  %call59 = call i8* @bash_tilde_expand(i8* %27, i32 0)
  store i8* %call59, i8** %mtext, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.then58, %land.lhs.true55, %land.lhs.true52, %if.end48
  %28 = load i32, i32* %cs, align 4
  switch i32 %28, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb62
    i32 3, label %sw.bb64
  ]

sw.bb:                                            ; preds = %if.end60
  %29 = load i8*, i8** %mtext, align 4
  %call61 = call i8* @sh_double_quote(i8* %29)
  store i8* %call61, i8** %rtext, align 4
  br label %sw.epilog

sw.bb62:                                          ; preds = %if.end60
  %30 = load i8*, i8** %mtext, align 4
  %call63 = call i8* @sh_single_quote(i8* %30)
  store i8* %call63, i8** %rtext, align 4
  br label %sw.epilog

sw.bb64:                                          ; preds = %if.end60
  %31 = load i8*, i8** %mtext, align 4
  %32 = load i32, i32* @complete_fullquote, align 4
  %tobool65 = icmp ne i32 %32, 0
  %cond = select i1 %tobool65, i8* null, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @filename_bstab, i32 0, i32 0)
  %call66 = call i8* @sh_backslash_quote(i8* %31, i8* %cond, i32 0)
  store i8* %call66, i8** %rtext, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end60, %sw.bb64, %sw.bb62, %sw.bb
  %33 = load i8*, i8** %mtext, align 4
  %34 = load i8*, i8** %s.addr, align 4
  %cmp67 = icmp ne i8* %33, %34
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %sw.epilog
  %35 = load i8*, i8** %mtext, align 4
  call void @sh_xfree(i8* %35, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4019)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %sw.epilog
  %36 = load i8*, i8** %rtext, align 4
  %tobool71 = icmp ne i8* %36, null
  br i1 %tobool71, label %land.lhs.true72, label %if.end77

land.lhs.true72:                                  ; preds = %if.end70
  %37 = load i32, i32* %cs, align 4
  %cmp73 = icmp eq i32 %37, 3
  br i1 %cmp73, label %if.then75, label %if.end77

if.then75:                                        ; preds = %land.lhs.true72
  %38 = load i8*, i8** %rtext, align 4
  %call76 = call i8* @quote_word_break_chars(i8* %38)
  store i8* %call76, i8** %mtext, align 4
  %39 = load i8*, i8** %rtext, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4026)
  %40 = load i8*, i8** %mtext, align 4
  store i8* %40, i8** %rtext, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %land.lhs.true72, %if.end70
  %41 = load i8*, i8** %rtext, align 4
  %tobool78 = icmp ne i8* %41, null
  br i1 %tobool78, label %if.then79, label %if.else83

if.then79:                                        ; preds = %if.end77
  %42 = load i8*, i8** %rtext, align 4
  %call80 = call i32 @strlen(i8* %42)
  store i32 %call80, i32* %rlen, align 4
  %43 = load i32, i32* %rlen, align 4
  %add = add nsw i32 %43, 1
  %call81 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4035)
  store i8* %call81, i8** %ret, align 4
  %44 = load i8*, i8** %ret, align 4
  %45 = load i8*, i8** %rtext, align 4
  %call82 = call i8* @strcpy(i8* %44, i8* %45)
  br label %if.end86

if.else83:                                        ; preds = %if.end77
  store i32 1, i32* %rlen, align 4
  %call84 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4040)
  store i8* %call84, i8** %ret, align 4
  %46 = load i8*, i8** %ret, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %46, i32 0
  store i8 0, i8* %arrayidx85, align 1
  br label %if.end86

if.end86:                                         ; preds = %if.else83, %if.then79
  %47 = load i32, i32* %rtype.addr, align 4
  %cmp87 = icmp eq i32 %47, 2
  br i1 %cmp87, label %land.lhs.true89, label %if.end94

land.lhs.true89:                                  ; preds = %if.end86
  %48 = load i32, i32* %cs, align 4
  %cmp90 = icmp ne i32 %48, 3
  br i1 %cmp90, label %if.then92, label %if.end94

if.then92:                                        ; preds = %land.lhs.true89
  %49 = load i8*, i8** %ret, align 4
  %50 = load i32, i32* %rlen, align 4
  %sub = sub nsw i32 %50, 1
  %arrayidx93 = getelementptr inbounds i8, i8* %49, i32 %sub
  store i8 0, i8* %arrayidx93, align 1
  br label %if.end94

if.end94:                                         ; preds = %if.then92, %land.lhs.true89, %if.end86
  %51 = load i8*, i8** %rtext, align 4
  call void @sh_xfree(i8* %51, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4047)
  %52 = load i8*, i8** %ret, align 4
  ret i8* %52
}

; Function Attrs: noinline nounwind
define internal i8* @bash_dequote_filename(i8* %text, i32 %quote_char) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %quote_char.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  %p = alloca i8*, align 4
  %r = alloca i8*, align 4
  %l = alloca i32, align 4
  %quoted = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %quote_char, i32* %quote_char.addr, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %l, align 4
  %1 = load i32, i32* %l, align 4
  %add = add nsw i32 %1, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3862)
  store i8* %call1, i8** %ret, align 4
  %2 = load i32, i32* %quote_char.addr, align 4
  store i32 %2, i32* %quoted, align 4
  %3 = load i8*, i8** %text.addr, align 4
  store i8* %3, i8** %p, align 4
  %4 = load i8*, i8** %ret, align 4
  store i8* %4, i8** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %6 = load i8*, i8** %p, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %8 = phi i1 [ false, %for.cond ], [ %tobool2, %land.rhs ]
  br i1 %8, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %9 = load i8*, i8** %p, align 4
  %10 = load i8, i8* %9, align 1
  %conv3 = sext i8 %10 to i32
  %cmp = icmp eq i32 %conv3, 92
  br i1 %cmp, label %if.then, label %if.end23

if.then:                                          ; preds = %for.body
  %11 = load i32, i32* %quoted, align 4
  %cmp5 = icmp eq i32 %11, 39
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %12 = load i8*, i8** %p, align 4
  %13 = load i8, i8* %12, align 1
  %14 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 %13, i8* %14, align 1
  br label %if.end15

if.else:                                          ; preds = %if.then
  %15 = load i32, i32* %quoted, align 4
  %cmp8 = icmp eq i32 %15, 34
  br i1 %cmp8, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.else
  %16 = load i8*, i8** %p, align 4
  %arrayidx = getelementptr inbounds i8, i8* %16, i32 1
  %17 = load i8, i8* %arrayidx, align 1
  %idxprom = sext i8 %17 to i32
  %arrayidx10 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %18 = load i32, i32* %arrayidx10, align 4
  %and = and i32 %18, 64
  %cmp11 = icmp eq i32 %and, 0
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %land.lhs.true
  %19 = load i8*, i8** %p, align 4
  %20 = load i8, i8* %19, align 1
  %21 = load i8*, i8** %r, align 4
  %incdec.ptr14 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr14, i8** %r, align 4
  store i8 %20, i8* %21, align 1
  br label %if.end

if.end:                                           ; preds = %if.then13, %land.lhs.true, %if.else
  br label %if.end15

if.end15:                                         ; preds = %if.end, %if.then7
  %22 = load i8*, i8** %p, align 4
  %incdec.ptr16 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr16, i8** %p, align 4
  %23 = load i8, i8* %incdec.ptr16, align 1
  %24 = load i8*, i8** %r, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr17, i8** %r, align 4
  store i8 %23, i8* %24, align 1
  %25 = load i8*, i8** %p, align 4
  %26 = load i8, i8* %25, align 1
  %conv18 = sext i8 %26 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  %27 = load i8*, i8** %ret, align 4
  store i8* %27, i8** %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end15
  br label %for.inc

if.end23:                                         ; preds = %for.body
  %28 = load i32, i32* %quoted, align 4
  %tobool24 = icmp ne i32 %28, 0
  br i1 %tobool24, label %land.lhs.true25, label %if.end30

land.lhs.true25:                                  ; preds = %if.end23
  %29 = load i8*, i8** %p, align 4
  %30 = load i8, i8* %29, align 1
  %conv26 = sext i8 %30 to i32
  %31 = load i32, i32* %quoted, align 4
  %cmp27 = icmp eq i32 %conv26, %31
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %land.lhs.true25
  store i32 0, i32* %quoted, align 4
  br label %for.inc

if.end30:                                         ; preds = %land.lhs.true25, %if.end23
  %32 = load i32, i32* %quoted, align 4
  %cmp31 = icmp eq i32 %32, 0
  br i1 %cmp31, label %land.lhs.true33, label %if.end42

land.lhs.true33:                                  ; preds = %if.end30
  %33 = load i8*, i8** %p, align 4
  %34 = load i8, i8* %33, align 1
  %conv34 = sext i8 %34 to i32
  %cmp35 = icmp eq i32 %conv34, 39
  br i1 %cmp35, label %if.then40, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true33
  %35 = load i8*, i8** %p, align 4
  %36 = load i8, i8* %35, align 1
  %conv37 = sext i8 %36 to i32
  %cmp38 = icmp eq i32 %conv37, 34
  br i1 %cmp38, label %if.then40, label %if.end42

if.then40:                                        ; preds = %lor.lhs.false, %land.lhs.true33
  %37 = load i8*, i8** %p, align 4
  %38 = load i8, i8* %37, align 1
  %conv41 = sext i8 %38 to i32
  store i32 %conv41, i32* %quoted, align 4
  br label %for.inc

if.end42:                                         ; preds = %lor.lhs.false, %if.end30
  %39 = load i8*, i8** %p, align 4
  %40 = load i8, i8* %39, align 1
  %41 = load i8*, i8** %r, align 4
  %incdec.ptr43 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %incdec.ptr43, i8** %r, align 4
  store i8 %40, i8* %41, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end42, %if.then40, %if.then29, %if.end22
  %42 = load i8*, i8** %p, align 4
  %incdec.ptr44 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr44, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %43 = load i8*, i8** %r, align 4
  store i8 0, i8* %43, align 1
  %44 = load i8*, i8** %ret, align 4
  store i8* %44, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then21
  %45 = load i8*, i8** %retval, align 4
  ret i8* %45
}

declare i32 @char_is_quoted(i8*, i32) #1

; Function Attrs: noinline nounwind
define void @bashline_reinitialize() #0 {
entry:
  store i32 0, i32* @bash_readline_initialized, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @bashline_set_event_hook() #0 {
entry:
  store i32 ()* @bash_event_hook, i32 ()** @rl_signal_event_hook, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @bash_event_hook() #0 {
entry:
  %0 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* @sigalrm_seen, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @rl_cleanup_after_signal()
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false2
  call void @bashline_reset_event_hook()
  call void @check_signals_and_traps()
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @bashline_reset_event_hook() #0 {
entry:
  store i32 ()* null, i32 ()** @rl_signal_event_hook, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @bashline_reset() #0 {
entry:
  call void @tilde_initialize()
  store i8** (i8*, i32, i32)* @attempt_shell_completion, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8* (i8*, i32)* null, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i32 (i8**)* @filename_completion_ignore, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %0 = load i8*, i8** @default_filename_quote_characters, align 4
  store i8* %0, i8** @rl_filename_quote_characters, align 4
  %1 = load i8*, i8** @rl_filename_quote_characters, align 4
  call void @set_filename_bstab(i8* %1)
  call void @set_directory_hook()
  store i32 (i8**)* @bash_filename_stat_hook, i32 (i8**)** @rl_filename_stat_hook, align 4
  call void @bashline_reset_event_hook()
  store i32 1, i32* @rl_sort_completion_matches, align 4
  ret void
}

declare void @tilde_initialize() #1

; Function Attrs: noinline nounwind
define i32 @bash_re_edit(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i8*, i8** @push_to_readline, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** @push_to_readline, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 669)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i8*, i8** %line.addr, align 4
  %call = call i32 @strlen(i8* %2)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 671)
  %3 = load i8*, i8** %line.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %3)
  store i8* %call2, i8** @push_to_readline, align 4
  %4 = load i32 ()*, i32 ()** @rl_startup_hook, align 4
  store i32 ()* %4, i32 ()** @old_rl_startup_hook, align 4
  store i32 ()* @bash_push_line, i32 ()** @rl_startup_hook, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @bash_push_line() #0 {
entry:
  %0 = load i8*, i8** @push_to_readline, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @push_to_readline, align 4
  %call = call i32 @rl_insert_text(i8* %1)
  %2 = load i8*, i8** @push_to_readline, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 656)
  store i8* null, i8** @push_to_readline, align 4
  %3 = load i32 ()*, i32 ()** @old_rl_startup_hook, align 4
  store i32 ()* %3, i32 ()** @rl_startup_hook, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind
define i8** @get_hostname_list() #0 {
entry:
  %0 = load i32, i32* @hostname_list_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @initialize_hostname_list()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8**, i8*** @hostname_list, align 4
  ret i8** %1
}

; Function Attrs: noinline nounwind
define internal void @initialize_hostname_list() #0 {
entry:
  %temp = alloca i8*, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.46, i32 0, i32 0))
  store i8* %call, i8** %temp, align 4
  %0 = load i8*, i8** %temp, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @get_string_value(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.47, i32 0, i32 0))
  store i8* %call1, i8** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** %temp, align 4
  %cmp2 = icmp eq i8* %1, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.48, i32 0, i32 0), i8** %temp, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %2 = load i8*, i8** %temp, align 4
  call void @snarf_hosts_from_file(i8* %2)
  %3 = load i8**, i8*** @hostname_list, align 4
  %tobool = icmp ne i8** %3, null
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end4
  %4 = load i32, i32* @hostname_list_initialized, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* @hostname_list_initialized, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end4
  ret void
}

; Function Attrs: noinline nounwind
define void @clear_hostname_list() #0 {
entry:
  %i = alloca i32, align 4
  %0 = load i32, i32* @hostname_list_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @hostname_list_length, align 4
  %cmp1 = icmp slt i32 %1, %2
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8**, i8*** @hostname_list, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 832)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @hostname_list_initialized, align 4
  store i32 0, i32* @hostname_list_length, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i8** @bash_default_completion(i8* %text, i32 %start, i32 %end, i32 %qc, i32 %compflags) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %qc.addr = alloca i32, align 4
  %compflags.addr = alloca i32, align 4
  %matches = alloca i8**, align 4
  %t = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32 %qc, i32* %qc.addr, align 4
  store i32 %compflags, i32* %compflags.addr, align 4
  store i8** null, i8*** %matches, align 4
  %0 = load i8**, i8*** %matches, align 4
  %tobool = icmp ne i8** %0, null
  br i1 %tobool, label %if.end30, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %text.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 36
  br i1 %cmp, label %if.then, label %if.end30

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %qc.addr, align 4
  %cmp2 = icmp ne i32 %3, 39
  br i1 %cmp2, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %if.then
  %4 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 40
  br i1 %cmp6, label %if.then8, label %if.else

if.then8:                                         ; preds = %land.lhs.true4
  %6 = load i8*, i8** %text.addr, align 4
  %call = call i8** @rl_completion_matches(i8* %6, i8* (i8*, i32)* @command_subst_completion_function)
  store i8** %call, i8*** %matches, align 4
  br label %if.end29

if.else:                                          ; preds = %land.lhs.true4, %if.then
  %7 = load i8*, i8** %text.addr, align 4
  %call9 = call i8** @rl_completion_matches(i8* %7, i8* (i8*, i32)* @variable_completion_function)
  store i8** %call9, i8*** %matches, align 4
  %8 = load i8**, i8*** %matches, align 4
  %tobool10 = icmp ne i8** %8, null
  br i1 %tobool10, label %land.lhs.true11, label %if.end28

land.lhs.true11:                                  ; preds = %if.else
  %9 = load i8**, i8*** %matches, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %9, i32 0
  %10 = load i8*, i8** %arrayidx12, align 4
  %tobool13 = icmp ne i8* %10, null
  br i1 %tobool13, label %land.lhs.true14, label %if.end28

land.lhs.true14:                                  ; preds = %land.lhs.true11
  %11 = load i8**, i8*** %matches, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %11, i32 1
  %12 = load i8*, i8** %arrayidx15, align 4
  %cmp16 = icmp eq i8* %12, null
  br i1 %cmp16, label %if.then18, label %if.end28

if.then18:                                        ; preds = %land.lhs.true14
  %13 = load i8**, i8*** %matches, align 4
  %arrayidx19 = getelementptr inbounds i8*, i8** %13, i32 0
  %14 = load i8*, i8** %arrayidx19, align 4
  %call20 = call i32 @strlen(i8* %14)
  %add = add i32 1, %call20
  %call21 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1656)
  %15 = load i8**, i8*** %matches, align 4
  %arrayidx22 = getelementptr inbounds i8*, i8** %15, i32 0
  %16 = load i8*, i8** %arrayidx22, align 4
  %call23 = call i8* @strcpy(i8* %call21, i8* %16)
  store i8* %call23, i8** %t, align 4
  %call24 = call i32 @bash_filename_stat_hook(i8** %t)
  %17 = load i8*, i8** %t, align 4
  %call25 = call i32 @file_isdir(i8* %17)
  %tobool26 = icmp ne i32 %call25, 0
  br i1 %tobool26, label %if.then27, label %if.end

if.then27:                                        ; preds = %if.then18
  store i32 47, i32* @rl_completion_append_character, align 4
  br label %if.end

if.end:                                           ; preds = %if.then27, %if.then18
  %18 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1662)
  br label %if.end28

if.end28:                                         ; preds = %if.end, %land.lhs.true14, %land.lhs.true11, %if.else
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.then8
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %land.lhs.true, %entry
  %19 = load i8**, i8*** %matches, align 4
  %cmp31 = icmp eq i8** %19, null
  br i1 %cmp31, label %land.lhs.true33, label %if.end43

land.lhs.true33:                                  ; preds = %if.end30
  %20 = load i8*, i8** %text.addr, align 4
  %21 = load i8, i8* %20, align 1
  %conv34 = sext i8 %21 to i32
  %cmp35 = icmp eq i32 %conv34, 126
  br i1 %cmp35, label %land.lhs.true37, label %if.end43

land.lhs.true37:                                  ; preds = %land.lhs.true33
  %22 = load i8*, i8** %text.addr, align 4
  %call38 = call i8* @mbschr(i8* %22, i32 47)
  %cmp39 = icmp eq i8* %call38, null
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %land.lhs.true37
  %23 = load i8*, i8** %text.addr, align 4
  %call42 = call i8** @rl_completion_matches(i8* %23, i8* (i8*, i32)* @rl_username_completion_function)
  store i8** %call42, i8*** %matches, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %land.lhs.true37, %land.lhs.true33, %if.end30
  %24 = load i8**, i8*** %matches, align 4
  %cmp44 = icmp eq i8** %24, null
  br i1 %cmp44, label %land.lhs.true46, label %if.end54

land.lhs.true46:                                  ; preds = %if.end43
  %25 = load i32, i32* @perform_hostname_completion, align 4
  %tobool47 = icmp ne i32 %25, 0
  br i1 %tobool47, label %land.lhs.true48, label %if.end54

land.lhs.true48:                                  ; preds = %land.lhs.true46
  %26 = load i8*, i8** %text.addr, align 4
  %27 = load i8, i8* %26, align 1
  %conv49 = sext i8 %27 to i32
  %cmp50 = icmp eq i32 %conv49, 64
  br i1 %cmp50, label %if.then52, label %if.end54

if.then52:                                        ; preds = %land.lhs.true48
  %28 = load i8*, i8** %text.addr, align 4
  %call53 = call i8** @rl_completion_matches(i8* %28, i8* (i8*, i32)* @hostname_completion_function)
  store i8** %call53, i8*** %matches, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %land.lhs.true48, %land.lhs.true46, %if.end43
  %29 = load i8**, i8*** %matches, align 4
  %cmp55 = icmp eq i8** %29, null
  br i1 %cmp55, label %land.lhs.true57, label %if.end147

land.lhs.true57:                                  ; preds = %if.end54
  %30 = load i32, i32* %compflags.addr, align 4
  %and = and i32 %30, 1
  %tobool58 = icmp ne i32 %and, 0
  br i1 %tobool58, label %if.then59, label %if.end147

if.then59:                                        ; preds = %land.lhs.true57
  %31 = load i32, i32* @no_empty_command_completion, align 4
  %tobool60 = icmp ne i32 %31, 0
  br i1 %tobool60, label %land.lhs.true61, label %if.else70

land.lhs.true61:                                  ; preds = %if.then59
  %32 = load i32, i32* %end.addr, align 4
  %33 = load i32, i32* %start.addr, align 4
  %cmp62 = icmp eq i32 %32, %33
  br i1 %cmp62, label %land.lhs.true64, label %if.else70

land.lhs.true64:                                  ; preds = %land.lhs.true61
  %34 = load i8*, i8** %text.addr, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx65, align 1
  %conv66 = sext i8 %35 to i32
  %cmp67 = icmp eq i32 %conv66, 0
  br i1 %cmp67, label %if.then69, label %if.else70

if.then69:                                        ; preds = %land.lhs.true64
  store i8** null, i8*** %matches, align 4
  store i32 (i8**)* @bash_ignore_everything, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  br label %if.end146

if.else70:                                        ; preds = %land.lhs.true64, %land.lhs.true61, %if.then59
  store i32 0, i32* @dot_in_path, align 4
  %36 = load i8*, i8** %text.addr, align 4
  %call71 = call i8** @rl_completion_matches(i8* %36, i8* (i8*, i32)* @command_word_completion_function)
  store i8** %call71, i8*** %matches, align 4
  %37 = load i8**, i8*** %matches, align 4
  %cmp72 = icmp eq i8** %37, null
  br i1 %cmp72, label %if.then74, label %if.else75

if.then74:                                        ; preds = %if.else70
  store i32 (i8**)* @bash_ignore_filenames, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  br label %if.end145

if.else75:                                        ; preds = %if.else70
  %38 = load i8**, i8*** %matches, align 4
  %arrayidx76 = getelementptr inbounds i8*, i8** %38, i32 1
  %39 = load i8*, i8** %arrayidx76, align 4
  %cmp77 = icmp eq i8* %39, null
  br i1 %cmp77, label %land.lhs.true79, label %if.else102

land.lhs.true79:                                  ; preds = %if.else75
  %40 = load i8**, i8*** %matches, align 4
  %arrayidx80 = getelementptr inbounds i8*, i8** %40, i32 0
  %41 = load i8*, i8** %arrayidx80, align 4
  %call81 = call i32 @absolute_pathname(i8* %41)
  %cmp82 = icmp eq i32 %call81, 0
  br i1 %cmp82, label %land.lhs.true84, label %if.else102

land.lhs.true84:                                  ; preds = %land.lhs.true79
  %42 = load i8**, i8*** %matches, align 4
  %arrayidx85 = getelementptr inbounds i8*, i8** %42, i32 0
  %43 = load i8*, i8** %arrayidx85, align 4
  %call86 = call i32 @absolute_program(i8* %43)
  %cmp87 = icmp eq i32 %call86, 0
  br i1 %cmp87, label %land.lhs.true89, label %if.else102

land.lhs.true89:                                  ; preds = %land.lhs.true84
  %44 = load i8**, i8*** %matches, align 4
  %arrayidx90 = getelementptr inbounds i8*, i8** %44, i32 0
  %45 = load i8*, i8** %arrayidx90, align 4
  %46 = load i8, i8* %45, align 1
  %conv91 = sext i8 %46 to i32
  %cmp92 = icmp ne i32 %conv91, 126
  br i1 %cmp92, label %land.lhs.true94, label %if.else102

land.lhs.true94:                                  ; preds = %land.lhs.true89
  %47 = load i8**, i8*** %matches, align 4
  %arrayidx95 = getelementptr inbounds i8*, i8** %47, i32 0
  %48 = load i8*, i8** %arrayidx95, align 4
  %call96 = call i32 @test_for_directory(i8* %48)
  %tobool97 = icmp ne i32 %call96, 0
  br i1 %tobool97, label %land.lhs.true98, label %if.else102

land.lhs.true98:                                  ; preds = %land.lhs.true94
  %49 = load i32, i32* @dot_in_path, align 4
  %cmp99 = icmp eq i32 %49, 0
  br i1 %cmp99, label %if.then101, label %if.else102

if.then101:                                       ; preds = %land.lhs.true98
  store i32 1, i32* @rl_completion_suppress_append, align 4
  store i32 0, i32* @rl_filename_completion_desired, align 4
  br label %if.end144

if.else102:                                       ; preds = %land.lhs.true98, %land.lhs.true94, %land.lhs.true89, %land.lhs.true84, %land.lhs.true79, %if.else75
  %50 = load i8**, i8*** %matches, align 4
  %arrayidx103 = getelementptr inbounds i8*, i8** %50, i32 0
  %51 = load i8*, i8** %arrayidx103, align 4
  %tobool104 = icmp ne i8* %51, null
  br i1 %tobool104, label %land.lhs.true105, label %if.end143

land.lhs.true105:                                 ; preds = %if.else102
  %52 = load i8**, i8*** %matches, align 4
  %arrayidx106 = getelementptr inbounds i8*, i8** %52, i32 1
  %53 = load i8*, i8** %arrayidx106, align 4
  %tobool107 = icmp ne i8* %53, null
  br i1 %tobool107, label %land.lhs.true108, label %if.end143

land.lhs.true108:                                 ; preds = %land.lhs.true105
  %54 = load i8**, i8*** %matches, align 4
  %arrayidx109 = getelementptr inbounds i8*, i8** %54, i32 0
  %55 = load i8*, i8** %arrayidx109, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %55, i32 0
  %56 = load i8, i8* %arrayidx110, align 1
  %conv111 = sext i8 %56 to i32
  %57 = load i8**, i8*** %matches, align 4
  %arrayidx112 = getelementptr inbounds i8*, i8** %57, i32 1
  %58 = load i8*, i8** %arrayidx112, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %58, i32 0
  %59 = load i8, i8* %arrayidx113, align 1
  %conv114 = sext i8 %59 to i32
  %cmp115 = icmp eq i32 %conv111, %conv114
  br i1 %cmp115, label %land.lhs.true117, label %if.end143

land.lhs.true117:                                 ; preds = %land.lhs.true108
  %60 = load i8**, i8*** %matches, align 4
  %arrayidx118 = getelementptr inbounds i8*, i8** %60, i32 0
  %61 = load i8*, i8** %arrayidx118, align 4
  %62 = load i8**, i8*** %matches, align 4
  %arrayidx119 = getelementptr inbounds i8*, i8** %62, i32 1
  %63 = load i8*, i8** %arrayidx119, align 4
  %call120 = call i32 @strcmp(i8* %61, i8* %63)
  %cmp121 = icmp eq i32 %call120, 0
  br i1 %cmp121, label %land.lhs.true123, label %if.end143

land.lhs.true123:                                 ; preds = %land.lhs.true117
  %64 = load i8**, i8*** %matches, align 4
  %arrayidx124 = getelementptr inbounds i8*, i8** %64, i32 0
  %65 = load i8*, i8** %arrayidx124, align 4
  %call125 = call i32 @absolute_pathname(i8* %65)
  %cmp126 = icmp eq i32 %call125, 0
  br i1 %cmp126, label %land.lhs.true128, label %if.end143

land.lhs.true128:                                 ; preds = %land.lhs.true123
  %66 = load i8**, i8*** %matches, align 4
  %arrayidx129 = getelementptr inbounds i8*, i8** %66, i32 0
  %67 = load i8*, i8** %arrayidx129, align 4
  %call130 = call i32 @absolute_program(i8* %67)
  %cmp131 = icmp eq i32 %call130, 0
  br i1 %cmp131, label %land.lhs.true133, label %if.end143

land.lhs.true133:                                 ; preds = %land.lhs.true128
  %68 = load i8**, i8*** %matches, align 4
  %arrayidx134 = getelementptr inbounds i8*, i8** %68, i32 0
  %69 = load i8*, i8** %arrayidx134, align 4
  %70 = load i8, i8* %69, align 1
  %conv135 = sext i8 %70 to i32
  %cmp136 = icmp ne i32 %conv135, 126
  br i1 %cmp136, label %land.lhs.true138, label %if.end143

land.lhs.true138:                                 ; preds = %land.lhs.true133
  %71 = load i8**, i8*** %matches, align 4
  %arrayidx139 = getelementptr inbounds i8*, i8** %71, i32 0
  %72 = load i8*, i8** %arrayidx139, align 4
  %call140 = call i32 @test_for_directory(i8* %72)
  %tobool141 = icmp ne i32 %call140, 0
  br i1 %tobool141, label %if.then142, label %if.end143

if.then142:                                       ; preds = %land.lhs.true138
  store i32 1, i32* @rl_completion_suppress_append, align 4
  store i32 0, i32* @rl_filename_completion_desired, align 4
  br label %if.end143

if.end143:                                        ; preds = %if.then142, %land.lhs.true138, %land.lhs.true133, %land.lhs.true128, %land.lhs.true123, %land.lhs.true117, %land.lhs.true108, %land.lhs.true105, %if.else102
  br label %if.end144

if.end144:                                        ; preds = %if.end143, %if.then101
  br label %if.end145

if.end145:                                        ; preds = %if.end144, %if.then74
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %if.then69
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %land.lhs.true57, %if.end54
  %73 = load i8**, i8*** %matches, align 4
  %tobool148 = icmp ne i8** %73, null
  br i1 %tobool148, label %if.end173, label %land.lhs.true149

land.lhs.true149:                                 ; preds = %if.end147
  %74 = load i8*, i8** %text.addr, align 4
  %call150 = call i32 @glob_pattern_p(i8* %74)
  %tobool151 = icmp ne i32 %call150, 0
  br i1 %tobool151, label %if.then152, label %if.end173

if.then152:                                       ; preds = %land.lhs.true149
  %75 = load i8*, i8** %text.addr, align 4
  %call153 = call i8** @rl_completion_matches(i8* %75, i8* (i8*, i32)* @glob_complete_word)
  store i8** %call153, i8*** %matches, align 4
  %76 = load i8**, i8*** %matches, align 4
  %tobool154 = icmp ne i8** %76, null
  br i1 %tobool154, label %land.lhs.true155, label %if.else162

land.lhs.true155:                                 ; preds = %if.then152
  %77 = load i8**, i8*** %matches, align 4
  %arrayidx156 = getelementptr inbounds i8*, i8** %77, i32 1
  %78 = load i8*, i8** %arrayidx156, align 4
  %tobool157 = icmp ne i8* %78, null
  br i1 %tobool157, label %land.lhs.true158, label %if.else162

land.lhs.true158:                                 ; preds = %land.lhs.true155
  %79 = load i32, i32* @rl_completion_type, align 4
  %cmp159 = icmp eq i32 %79, 9
  br i1 %cmp159, label %if.then161, label %if.else162

if.then161:                                       ; preds = %land.lhs.true158
  %80 = load i8**, i8*** %matches, align 4
  call void @strvec_dispose(i8** %80)
  store i8** null, i8*** %matches, align 4
  br label %if.end172

if.else162:                                       ; preds = %land.lhs.true158, %land.lhs.true155, %if.then152
  %81 = load i8**, i8*** %matches, align 4
  %tobool163 = icmp ne i8** %81, null
  br i1 %tobool163, label %land.lhs.true164, label %if.end171

land.lhs.true164:                                 ; preds = %if.else162
  %82 = load i8**, i8*** %matches, align 4
  %arrayidx165 = getelementptr inbounds i8*, i8** %82, i32 1
  %83 = load i8*, i8** %arrayidx165, align 4
  %tobool166 = icmp ne i8* %83, null
  br i1 %tobool166, label %land.lhs.true167, label %if.end171

land.lhs.true167:                                 ; preds = %land.lhs.true164
  %84 = load i32, i32* @rl_completion_type, align 4
  %cmp168 = icmp eq i32 %84, 33
  br i1 %cmp168, label %if.then170, label %if.end171

if.then170:                                       ; preds = %land.lhs.true167
  store i32 1, i32* @rl_completion_suppress_append, align 4
  store i32 0, i32* @rl_filename_completion_desired, align 4
  br label %if.end171

if.end171:                                        ; preds = %if.then170, %land.lhs.true167, %land.lhs.true164, %if.else162
  br label %if.end172

if.end172:                                        ; preds = %if.end171, %if.then161
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %land.lhs.true149, %if.end147
  %85 = load i8**, i8*** %matches, align 4
  ret i8** %85
}

declare i8** @rl_completion_matches(i8*, i8* (i8*, i32)*) #1

; Function Attrs: noinline nounwind
define internal i8* @command_subst_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %value = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end86

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2230)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %3 = load i8*, i8** %text.addr, align 4
  store i8* %3, i8** @command_subst_completion_function.orig_start, align 4
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 96
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %6 = load i8*, i8** %text.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %text.addr, align 4
  br label %if.end13

if.else:                                          ; preds = %if.end
  %7 = load i8*, i8** %text.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv5 = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv5, 36
  br i1 %cmp6, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.else
  %9 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx, align 1
  %conv8 = sext i8 %10 to i32
  %cmp9 = icmp eq i32 %conv8, 40
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true
  %11 = load i8*, i8** %text.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 2
  store i8* %add.ptr, i8** %text.addr, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %land.lhs.true, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then4
  store i32 1, i32* @rl_completion_suppress_quote, align 4
  %12 = load i8*, i8** %text.addr, align 4
  %13 = load i8*, i8** @command_subst_completion_function.orig_start, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %12 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %13 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* @command_subst_completion_function.start_len, align 4
  %14 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %14)
  %add = add i32 1, %call
  %call14 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2240)
  %15 = load i8*, i8** %text.addr, align 4
  %call15 = call i8* @strcpy(i8* %call14, i8* %15)
  store i8* %call15, i8** @command_subst_completion_function.filename_text, align 4
  %16 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %tobool16 = icmp ne i8** %16, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end13
  %17 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %18 = bitcast i8** %17 to i8*
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2242)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end13
  %19 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %20 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %call19 = call i32 @strlen(i8* %20)
  %add.ptr20 = getelementptr inbounds i8, i8* %19, i32 %call19
  %add.ptr21 = getelementptr inbounds i8, i8* %add.ptr20, i32 -1
  store i8* %add.ptr21, i8** %value, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end18
  %21 = load i8*, i8** %value, align 4
  %22 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %cmp22 = icmp ugt i8* %21, %22
  br i1 %cmp22, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load i8*, i8** %value, align 4
  %24 = load i8, i8* %23, align 1
  %conv24 = sext i8 %24 to i32
  %cmp25 = icmp eq i32 %conv24, 32
  br i1 %cmp25, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %25 = load i8*, i8** %value, align 4
  %26 = load i8, i8* %25, align 1
  %conv27 = sext i8 %26 to i32
  %cmp28 = icmp eq i32 %conv27, 9
  br i1 %cmp28, label %if.then37, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %lor.lhs.false
  %27 = load i8*, i8** %value, align 4
  %28 = load i8, i8* %27, align 1
  %conv31 = sext i8 %28 to i32
  %tobool32 = icmp ne i32 %conv31, 0
  br i1 %tobool32, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false30
  %29 = load i8*, i8** %value, align 4
  %30 = load i8, i8* %29, align 1
  %conv33 = sext i8 %30 to i32
  %call34 = call i8* @mbschr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i32 %conv33)
  %cmp35 = icmp ne i8* %call34, null
  br i1 %cmp35, label %if.then37, label %if.end38

cond.false:                                       ; preds = %lor.lhs.false30
  br i1 false, label %if.then37, label %if.end38

if.then37:                                        ; preds = %cond.false, %cond.true, %lor.lhs.false, %for.body
  br label %for.end

if.end38:                                         ; preds = %cond.false, %cond.true
  br label %for.inc

for.inc:                                          ; preds = %if.end38
  %31 = load i8*, i8** %value, align 4
  %incdec.ptr39 = getelementptr inbounds i8, i8* %31, i32 -1
  store i8* %incdec.ptr39, i8** %value, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then37, %for.cond
  %32 = load i8*, i8** %value, align 4
  %33 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %cmp40 = icmp ule i8* %32, %33
  br i1 %cmp40, label %if.then42, label %if.else44

if.then42:                                        ; preds = %for.end
  %34 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %call43 = call i8** @rl_completion_matches(i8* %34, i8* (i8*, i32)* @command_word_completion_function)
  store i8** %call43, i8*** @command_subst_completion_function.matches, align 4
  br label %if.end64

if.else44:                                        ; preds = %for.end
  %35 = load i8*, i8** %value, align 4
  %incdec.ptr45 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr45, i8** %value, align 4
  %36 = load i8*, i8** %value, align 4
  %37 = load i8*, i8** @command_subst_completion_function.filename_text, align 4
  %sub.ptr.lhs.cast46 = ptrtoint i8* %36 to i32
  %sub.ptr.rhs.cast47 = ptrtoint i8* %37 to i32
  %sub.ptr.sub48 = sub i32 %sub.ptr.lhs.cast46, %sub.ptr.rhs.cast47
  %38 = load i32, i32* @command_subst_completion_function.start_len, align 4
  %add49 = add nsw i32 %38, %sub.ptr.sub48
  store i32 %add49, i32* @command_subst_completion_function.start_len, align 4
  %39 = load i8*, i8** %value, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %39, i32 -1
  %40 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %40 to i32
  %cmp52 = icmp eq i32 %conv51, 32
  br i1 %cmp52, label %if.then59, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %if.else44
  %41 = load i8*, i8** %value, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %41, i32 -1
  %42 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %42 to i32
  %cmp57 = icmp eq i32 %conv56, 9
  br i1 %cmp57, label %if.then59, label %if.else61

if.then59:                                        ; preds = %lor.lhs.false54, %if.else44
  %43 = load i8*, i8** %value, align 4
  %call60 = call i8** @rl_completion_matches(i8* %43, i8* (i8*, i32)* @rl_filename_completion_function)
  store i8** %call60, i8*** @command_subst_completion_function.matches, align 4
  br label %if.end63

if.else61:                                        ; preds = %lor.lhs.false54
  %44 = load i8*, i8** %value, align 4
  %call62 = call i8** @rl_completion_matches(i8* %44, i8* (i8*, i32)* @command_word_completion_function)
  store i8** %call62, i8*** @command_subst_completion_function.matches, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.else61, %if.then59
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then42
  %45 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %tobool65 = icmp ne i8** %45, null
  br i1 %tobool65, label %land.lhs.true66, label %land.end

land.lhs.true66:                                  ; preds = %if.end64
  %46 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %arrayidx67 = getelementptr inbounds i8*, i8** %46, i32 0
  %47 = load i8*, i8** %arrayidx67, align 4
  %tobool68 = icmp ne i8* %47, null
  br i1 %tobool68, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true66
  %48 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %arrayidx69 = getelementptr inbounds i8*, i8** %48, i32 1
  %49 = load i8*, i8** %arrayidx69, align 4
  %tobool70 = icmp ne i8* %49, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true66, %if.end64
  %50 = phi i1 [ false, %land.lhs.true66 ], [ false, %if.end64 ], [ %tobool70, %land.rhs ]
  %land.ext = zext i1 %50 to i32
  store i32 %land.ext, i32* @command_subst_completion_function.cmd_index, align 4
  %51 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %tobool71 = icmp ne i8** %51, null
  br i1 %tobool71, label %land.lhs.true72, label %if.else84

land.lhs.true72:                                  ; preds = %land.end
  %52 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %arrayidx73 = getelementptr inbounds i8*, i8** %52, i32 0
  %53 = load i8*, i8** %arrayidx73, align 4
  %tobool74 = icmp ne i8* %53, null
  br i1 %tobool74, label %land.lhs.true75, label %if.else84

land.lhs.true75:                                  ; preds = %land.lhs.true72
  %54 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %arrayidx76 = getelementptr inbounds i8*, i8** %54, i32 1
  %55 = load i8*, i8** %arrayidx76, align 4
  %cmp77 = icmp eq i8* %55, null
  br i1 %cmp77, label %land.lhs.true79, label %if.else84

land.lhs.true79:                                  ; preds = %land.lhs.true75
  %56 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %arrayidx80 = getelementptr inbounds i8*, i8** %56, i32 0
  %57 = load i8*, i8** %arrayidx80, align 4
  %call81 = call i32 @test_for_directory(i8* %57)
  %tobool82 = icmp ne i32 %call81, 0
  br i1 %tobool82, label %if.then83, label %if.else84

if.then83:                                        ; preds = %land.lhs.true79
  store i32 47, i32* @rl_completion_append_character, align 4
  br label %if.end85

if.else84:                                        ; preds = %land.lhs.true79, %land.lhs.true75, %land.lhs.true72, %land.end
  store i32 1, i32* @rl_completion_suppress_append, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.else84, %if.then83
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %entry
  %58 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %cmp87 = icmp eq i8** %58, null
  br i1 %cmp87, label %if.then93, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %if.end86
  %59 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %60 = load i32, i32* @command_subst_completion_function.cmd_index, align 4
  %arrayidx90 = getelementptr inbounds i8*, i8** %59, i32 %60
  %61 = load i8*, i8** %arrayidx90, align 4
  %cmp91 = icmp eq i8* %61, null
  br i1 %cmp91, label %if.then93, label %if.else94

if.then93:                                        ; preds = %lor.lhs.false89, %if.end86
  store i32 0, i32* @rl_filename_quoting_desired, align 4
  store i8* null, i8** %retval, align 4
  br label %return

if.else94:                                        ; preds = %lor.lhs.false89
  %62 = load i32, i32* @command_subst_completion_function.start_len, align 4
  %add95 = add nsw i32 1, %62
  %63 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %64 = load i32, i32* @command_subst_completion_function.cmd_index, align 4
  %arrayidx96 = getelementptr inbounds i8*, i8** %63, i32 %64
  %65 = load i8*, i8** %arrayidx96, align 4
  %call97 = call i32 @strlen(i8* %65)
  %add98 = add i32 %add95, %call97
  %call99 = call i8* @sh_xmalloc(i32 %add98, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2284)
  store i8* %call99, i8** %value, align 4
  %66 = load i32, i32* @command_subst_completion_function.start_len, align 4
  %cmp100 = icmp eq i32 %66, 1
  br i1 %cmp100, label %if.then102, label %if.else104

if.then102:                                       ; preds = %if.else94
  %67 = load i8*, i8** @command_subst_completion_function.orig_start, align 4
  %68 = load i8, i8* %67, align 1
  %69 = load i8*, i8** %value, align 4
  %arrayidx103 = getelementptr inbounds i8, i8* %69, i32 0
  store i8 %68, i8* %arrayidx103, align 1
  br label %if.end106

if.else104:                                       ; preds = %if.else94
  %70 = load i8*, i8** %value, align 4
  %71 = load i8*, i8** @command_subst_completion_function.orig_start, align 4
  %72 = load i32, i32* @command_subst_completion_function.start_len, align 4
  %call105 = call i8* @strncpy(i8* %70, i8* %71, i32 %72)
  br label %if.end106

if.end106:                                        ; preds = %if.else104, %if.then102
  %73 = load i8*, i8** %value, align 4
  %74 = load i32, i32* @command_subst_completion_function.start_len, align 4
  %add.ptr107 = getelementptr inbounds i8, i8* %73, i32 %74
  %75 = load i8**, i8*** @command_subst_completion_function.matches, align 4
  %76 = load i32, i32* @command_subst_completion_function.cmd_index, align 4
  %arrayidx108 = getelementptr inbounds i8*, i8** %75, i32 %76
  %77 = load i8*, i8** %arrayidx108, align 4
  %call109 = call i8* @strcpy(i8* %add.ptr107, i8* %77)
  %78 = load i32, i32* @command_subst_completion_function.cmd_index, align 4
  %inc = add nsw i32 %78, 1
  store i32 %inc, i32* @command_subst_completion_function.cmd_index, align 4
  %79 = load i8*, i8** %value, align 4
  store i8* %79, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end106, %if.then93
  %80 = load i8*, i8** %retval, align 4
  ret i8* %80
}

; Function Attrs: noinline nounwind
define internal i8* @variable_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %value = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end21, label %if.then

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @variable_completion_function.varname, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i8*, i8** @variable_completion_function.varname, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2313)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  store i32 0, i32* @variable_completion_function.first_char_loc, align 4
  %3 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* @variable_completion_function.first_char, align 4
  %5 = load i32, i32* @variable_completion_function.first_char, align 4
  %cmp = icmp eq i32 %5, 36
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %6 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* @variable_completion_function.first_char_loc, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = load i8*, i8** %text.addr, align 4
  %8 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %9 to i32
  %cmp8 = icmp eq i32 %conv7, 123
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end5
  %10 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %inc11 = add nsw i32 %10, 1
  store i32 %inc11, i32* @variable_completion_function.first_char_loc, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end5
  %11 = load i8*, i8** %text.addr, align 4
  %12 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %call = call i32 @strlen(i8* %add.ptr)
  %add = add i32 1, %call
  %call13 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2324)
  %13 = load i8*, i8** %text.addr, align 4
  %14 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %add.ptr14 = getelementptr inbounds i8, i8* %13, i32 %14
  %call15 = call i8* @strcpy(i8* %call13, i8* %add.ptr14)
  store i8* %call15, i8** @variable_completion_function.varname, align 4
  %15 = load i8*, i8** @variable_completion_function.varname, align 4
  %call16 = call i32 @strlen(i8* %15)
  store i32 %call16, i32* @variable_completion_function.namelen, align 4
  %16 = load i8**, i8*** @variable_completion_function.varlist, align 4
  %tobool17 = icmp ne i8** %16, null
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end12
  %17 = load i8**, i8*** @variable_completion_function.varlist, align 4
  call void @strvec_dispose(i8** %17)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end12
  %18 = load i8*, i8** @variable_completion_function.varname, align 4
  %call20 = call i8** @all_variables_matching_prefix(i8* %18)
  store i8** %call20, i8*** @variable_completion_function.varlist, align 4
  store i32 0, i32* @variable_completion_function.varlist_index, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end19, %entry
  %19 = load i8**, i8*** @variable_completion_function.varlist, align 4
  %tobool22 = icmp ne i8** %19, null
  br i1 %tobool22, label %lor.lhs.false, label %if.then25

lor.lhs.false:                                    ; preds = %if.end21
  %20 = load i8**, i8*** @variable_completion_function.varlist, align 4
  %21 = load i32, i32* @variable_completion_function.varlist_index, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %20, i32 %21
  %22 = load i8*, i8** %arrayidx23, align 4
  %tobool24 = icmp ne i8* %22, null
  br i1 %tobool24, label %if.else, label %if.then25

if.then25:                                        ; preds = %lor.lhs.false, %if.end21
  store i8* null, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  %23 = load i8**, i8*** @variable_completion_function.varlist, align 4
  %24 = load i32, i32* @variable_completion_function.varlist_index, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %23, i32 %24
  %25 = load i8*, i8** %arrayidx26, align 4
  %call27 = call i32 @strlen(i8* %25)
  %add28 = add i32 4, %call27
  %call29 = call i8* @sh_xmalloc(i32 %add28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2342)
  store i8* %call29, i8** %value, align 4
  %26 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %tobool30 = icmp ne i32 %26, 0
  br i1 %tobool30, label %if.then31, label %if.end39

if.then31:                                        ; preds = %if.else
  %27 = load i32, i32* @variable_completion_function.first_char, align 4
  %conv32 = trunc i32 %27 to i8
  %28 = load i8*, i8** %value, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %28, i32 0
  store i8 %conv32, i8* %arrayidx33, align 1
  %29 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %cmp34 = icmp eq i32 %29, 2
  br i1 %cmp34, label %if.then36, label %if.end38

if.then36:                                        ; preds = %if.then31
  %30 = load i8*, i8** %value, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %30, i32 1
  store i8 123, i8* %arrayidx37, align 1
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %if.then31
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.else
  %31 = load i8*, i8** %value, align 4
  %32 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %add.ptr40 = getelementptr inbounds i8, i8* %31, i32 %32
  %33 = load i8**, i8*** @variable_completion_function.varlist, align 4
  %34 = load i32, i32* @variable_completion_function.varlist_index, align 4
  %arrayidx41 = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx41, align 4
  %call42 = call i8* @strcpy(i8* %add.ptr40, i8* %35)
  %36 = load i32, i32* @variable_completion_function.first_char_loc, align 4
  %cmp43 = icmp eq i32 %36, 2
  br i1 %cmp43, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end39
  %37 = load i8*, i8** %value, align 4
  %call46 = call i8* @strcat(i8* %37, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.65, i32 0, i32 0))
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end39
  %38 = load i32, i32* @variable_completion_function.varlist_index, align 4
  %inc48 = add nsw i32 %38, 1
  store i32 %inc48, i32* @variable_completion_function.varlist_index, align 4
  %39 = load i8*, i8** %value, align 4
  store i8* %39, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end47, %if.then25
  %40 = load i8*, i8** %retval, align 4
  ret i8* %40
}

declare i32 @file_isdir(i8*) #1

declare i8* @mbschr(i8*, i32) #1

declare i8* @rl_username_completion_function(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @hostname_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8**, i8*** @hostname_completion_function.list, align 4
  %tobool = icmp ne i8** %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8**, i8*** @hostname_completion_function.list, align 4
  %3 = bitcast i8** %2 to i8*
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2373)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i8** null, i8*** @hostname_completion_function.list, align 4
  store i32 0, i32* @hostname_completion_function.first_char_loc, align 4
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  store i32 %conv, i32* @hostname_completion_function.first_char, align 4
  %6 = load i32, i32* @hostname_completion_function.first_char, align 4
  %cmp2 = icmp eq i32 %6, 64
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %do.end
  %7 = load i32, i32* @hostname_completion_function.first_char_loc, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @hostname_completion_function.first_char_loc, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %do.end
  %8 = load i8*, i8** %text.addr, align 4
  %9 = load i32, i32* @hostname_completion_function.first_char_loc, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 %9
  %call = call i8** @hostnames_matching(i8* %add.ptr)
  store i8** %call, i8*** @hostname_completion_function.list, align 4
  store i32 0, i32* @hostname_completion_function.list_index, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %entry
  %10 = load i8**, i8*** @hostname_completion_function.list, align 4
  %tobool7 = icmp ne i8** %10, null
  br i1 %tobool7, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %if.end6
  %11 = load i8**, i8*** @hostname_completion_function.list, align 4
  %12 = load i32, i32* @hostname_completion_function.list_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx, align 4
  %tobool8 = icmp ne i8* %13, null
  br i1 %tobool8, label %if.then9, label %if.end18

if.then9:                                         ; preds = %land.lhs.true
  %14 = load i8**, i8*** @hostname_completion_function.list, align 4
  %15 = load i32, i32* @hostname_completion_function.list_index, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx10, align 4
  %call11 = call i32 @strlen(i8* %16)
  %add = add i32 2, %call11
  %call12 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2391)
  store i8* %call12, i8** %t, align 4
  %17 = load i32, i32* @hostname_completion_function.first_char, align 4
  %conv13 = trunc i32 %17 to i8
  %18 = load i8*, i8** %t, align 4
  store i8 %conv13, i8* %18, align 1
  %19 = load i8*, i8** %t, align 4
  %20 = load i32, i32* @hostname_completion_function.first_char_loc, align 4
  %add.ptr14 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8**, i8*** @hostname_completion_function.list, align 4
  %22 = load i32, i32* @hostname_completion_function.list_index, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %21, i32 %22
  %23 = load i8*, i8** %arrayidx15, align 4
  %call16 = call i8* @strcpy(i8* %add.ptr14, i8* %23)
  %24 = load i32, i32* @hostname_completion_function.list_index, align 4
  %inc17 = add nsw i32 %24, 1
  store i32 %inc17, i32* @hostname_completion_function.list_index, align 4
  %25 = load i8*, i8** %t, align 4
  store i8* %25, i8** %retval, align 4
  br label %return

if.end18:                                         ; preds = %land.lhs.true, %if.end6
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then9
  %26 = load i8*, i8** %retval, align 4
  ret i8* %26
}

; Function Attrs: noinline nounwind
define internal i32 @bash_ignore_everything(i8** %names) #0 {
entry:
  %names.addr = alloca i8**, align 4
  store i8** %names, i8*** %names.addr, align 4
  %0 = load i8**, i8*** %names.addr, align 4
  call void @_ignore_completion_names(i8** %0, i32 (i8*)* @return_zero)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i8* @command_word_completion_function(i8* %hint_text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %hint_text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %cval = alloca i8*, align 4
  %alias = alloca i8*, align 4
  %reserved_word = alloca i8*, align 4
  %varname = alloca i8*, align 4
  %i = alloca i32, align 4
  %current_path = alloca i8*, align 4
  %t = alloca i8*, align 4
  %match = alloca i32, align 4
  %freetemp = alloca i32, align 4
  store i8* %hint_text, i8** %hint_text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end113

if.then:                                          ; preds = %entry
  store i32 (i8**)* @bash_command_name_stat_hook, i32 (i8**)** @rl_filename_stat_hook, align 4
  %1 = load i8*, i8** @command_word_completion_function.dequoted_hint, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %2 = load i8*, i8** @command_word_completion_function.dequoted_hint, align 4
  %3 = load i8*, i8** @command_word_completion_function.hint, align 4
  %cmp1 = icmp ne i8* %2, %3
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i8*, i8** @command_word_completion_function.dequoted_hint, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1822)
  br label %if.end

if.end:                                           ; preds = %if.then2, %land.lhs.true, %if.then
  %5 = load i8*, i8** @command_word_completion_function.hint, align 4
  %tobool3 = icmp ne i8* %5, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %6 = load i8*, i8** @command_word_completion_function.hint, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1824)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i32 0, i32* @command_word_completion_function.searching_path, align 4
  store i32 0, i32* @command_word_completion_function.mapping_over, align 4
  %7 = load i8*, i8** %hint_text.addr, align 4
  %call = call i32 @absolute_pathname(i8* %7)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %land.lhs.true7, label %land.end

land.lhs.true7:                                   ; preds = %if.end5
  %8 = load i8*, i8** %hint_text.addr, align 4
  %call8 = call i32 @absolute_program(i8* %8)
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %land.lhs.true10, label %land.end

land.lhs.true10:                                  ; preds = %land.lhs.true7
  %9 = load i8*, i8** %hint_text.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %cmp11 = icmp ne i32 %conv, 126
  br i1 %cmp11, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true10
  %11 = load i8*, i8** %hint_text.addr, align 4
  %call13 = call i32 @test_for_directory(i8* %11)
  %tobool14 = icmp ne i32 %call13, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true10, %land.lhs.true7, %if.end5
  %12 = phi i1 [ false, %land.lhs.true10 ], [ false, %land.lhs.true7 ], [ false, %if.end5 ], [ %tobool14, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  store i32 %land.ext, i32* @command_word_completion_function.hint_is_dir, align 4
  store i8* null, i8** @command_word_completion_function.val, align 4
  %call15 = call i8* @rl_variable_value(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.37, i32 0, i32 0))
  store i8* %call15, i8** %temp, align 4
  %13 = load i8*, i8** %temp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx, align 1
  %conv16 = sext i8 %14 to i32
  %cmp17 = icmp eq i32 %conv16, 111
  br i1 %cmp17, label %land.lhs.true19, label %land.end29

land.lhs.true19:                                  ; preds = %land.end
  %15 = load i8*, i8** %temp, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %16 to i32
  %cmp22 = icmp eq i32 %conv21, 110
  br i1 %cmp22, label %land.rhs24, label %land.end29

land.rhs24:                                       ; preds = %land.lhs.true19
  %17 = load i8*, i8** %temp, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %17, i32 2
  %18 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %18 to i32
  %cmp27 = icmp eq i32 %conv26, 0
  br label %land.end29

land.end29:                                       ; preds = %land.rhs24, %land.lhs.true19, %land.end
  %19 = phi i1 [ false, %land.lhs.true19 ], [ false, %land.end ], [ %cmp27, %land.rhs24 ]
  %land.ext30 = zext i1 %19 to i32
  store i32 %land.ext30, i32* @command_word_completion_function.igncase, align 4
  %20 = load i8**, i8*** @command_word_completion_function.glob_matches, align 4
  %tobool31 = icmp ne i8** %20, null
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %land.end29
  %21 = load i8**, i8*** @command_word_completion_function.glob_matches, align 4
  %22 = bitcast i8** %21 to i8*
  call void @sh_xfree(i8* %22, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1835)
  store i8** null, i8*** @command_word_completion_function.glob_matches, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %land.end29
  %23 = load i8*, i8** %hint_text.addr, align 4
  %call34 = call i32 @glob_pattern_p(i8* %23)
  store i32 %call34, i32* @command_word_completion_function.globpat, align 4
  %24 = load i32, i32* @command_word_completion_function.globpat, align 4
  %tobool35 = icmp ne i32 %24, 0
  br i1 %tobool35, label %if.then38, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end33
  %25 = load i8*, i8** %hint_text.addr, align 4
  %call36 = call i32 @absolute_program(i8* %25)
  %tobool37 = icmp ne i32 %call36, 0
  br i1 %tobool37, label %if.then38, label %if.end90

if.then38:                                        ; preds = %lor.lhs.false, %if.end33
  %26 = load i8*, i8** %hint_text.addr, align 4
  %27 = load i8, i8* %26, align 1
  %conv39 = sext i8 %27 to i32
  %cmp40 = icmp eq i32 %conv39, 126
  br i1 %cmp40, label %if.then42, label %if.else51

if.then42:                                        ; preds = %if.then38
  %28 = load i8*, i8** %hint_text.addr, align 4
  %call43 = call i8* @bash_tilde_expand(i8* %28, i32 0)
  store i8* %call43, i8** @command_word_completion_function.hint, align 4
  %29 = load i8*, i8** %hint_text.addr, align 4
  %call44 = call i32 @strlen(i8* %29)
  %add = add i32 1, %call44
  %call45 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1854)
  %30 = load i8*, i8** %hint_text.addr, align 4
  %call46 = call i8* @strcpy(i8* %call45, i8* %30)
  store i8* %call46, i8** @command_word_completion_function.directory_part, align 4
  %31 = load i8*, i8** @command_word_completion_function.directory_part, align 4
  %call47 = call i8* @strchr(i8* %31, i32 47)
  store i8* %call47, i8** %temp, align 4
  %32 = load i8*, i8** %temp, align 4
  %tobool48 = icmp ne i8* %32, null
  br i1 %tobool48, label %if.then49, label %if.else

if.then49:                                        ; preds = %if.then42
  %33 = load i8*, i8** %temp, align 4
  store i8 0, i8* %33, align 1
  br label %if.end50

if.else:                                          ; preds = %if.then42
  %34 = load i8*, i8** @command_word_completion_function.directory_part, align 4
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1860)
  store i8* null, i8** @command_word_completion_function.directory_part, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.else, %if.then49
  br label %if.end65

if.else51:                                        ; preds = %if.then38
  %35 = load i32, i32* @dircomplete_expand, align 4
  %tobool52 = icmp ne i32 %35, 0
  br i1 %tobool52, label %if.then53, label %if.else59

if.then53:                                        ; preds = %if.else51
  %36 = load i8*, i8** %hint_text.addr, align 4
  %call54 = call i32 @strlen(i8* %36)
  %add55 = add i32 1, %call54
  %call56 = call i8* @sh_xmalloc(i32 %add55, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1866)
  %37 = load i8*, i8** %hint_text.addr, align 4
  %call57 = call i8* @strcpy(i8* %call56, i8* %37)
  store i8* %call57, i8** @command_word_completion_function.hint, align 4
  %call58 = call i32 @bash_directory_completion_hook(i8** @command_word_completion_function.hint)
  br label %if.end64

if.else59:                                        ; preds = %if.else51
  %38 = load i8*, i8** %hint_text.addr, align 4
  %call60 = call i32 @strlen(i8* %38)
  %add61 = add i32 1, %call60
  %call62 = call i8* @sh_xmalloc(i32 %add61, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1870)
  %39 = load i8*, i8** %hint_text.addr, align 4
  %call63 = call i8* @strcpy(i8* %call62, i8* %39)
  store i8* %call63, i8** @command_word_completion_function.hint, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.else59, %if.then53
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.end50
  %40 = load i8*, i8** @command_word_completion_function.hint, align 4
  store i8* %40, i8** @command_word_completion_function.dequoted_hint, align 4
  %41 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool66 = icmp ne i32 %41, 0
  br i1 %tobool66, label %land.lhs.true67, label %if.end72

land.lhs.true67:                                  ; preds = %if.end65
  %42 = load i32, i32* @rl_completion_quote_character, align 4
  %cmp68 = icmp eq i32 %42, 0
  br i1 %cmp68, label %if.then70, label %if.end72

if.then70:                                        ; preds = %land.lhs.true67
  %43 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call71 = call i8* @bash_dequote_filename(i8* %43, i32 0)
  store i8* %call71, i8** @command_word_completion_function.dequoted_hint, align 4
  %44 = load i8*, i8** @command_word_completion_function.hint, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1881)
  %45 = load i8*, i8** @command_word_completion_function.dequoted_hint, align 4
  store i8* %45, i8** @command_word_completion_function.hint, align 4
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %land.lhs.true67, %if.end65
  %46 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call73 = call i32 @strlen(i8* %46)
  store i32 %call73, i32* @command_word_completion_function.hint_len, align 4
  store i32 %call73, i32* @command_word_completion_function.dequoted_len, align 4
  %47 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  %tobool74 = icmp ne i8* %47, null
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  %48 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1887)
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.end72
  %49 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call77 = call i32 @strlen(i8* %49)
  %add78 = add i32 1, %call77
  %call79 = call i8* @sh_xmalloc(i32 %add78, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1889)
  %50 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call80 = call i8* @strcpy(i8* %call79, i8* %50)
  store i8* %call80, i8** @command_word_completion_function.filename_hint, align 4
  store i8* %call80, i8** @command_word_completion_function.fnhint, align 4
  store i32 0, i32* @command_word_completion_function.istate, align 4
  %51 = load i32, i32* @command_word_completion_function.globpat, align 4
  %tobool81 = icmp ne i32 %51, 0
  br i1 %tobool81, label %if.then82, label %if.else83

if.then82:                                        ; preds = %if.end76
  store i32 5, i32* @command_word_completion_function.mapping_over, align 4
  br label %globword

if.else83:                                        ; preds = %if.end76
  %52 = load i32, i32* @dircomplete_expand, align 4
  %tobool84 = icmp ne i32 %52, 0
  br i1 %tobool84, label %land.lhs.true85, label %if.end89

land.lhs.true85:                                  ; preds = %if.else83
  %53 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  %call86 = call i32 @path_dot_or_dotdot(i8* %53)
  %tobool87 = icmp ne i32 %call86, 0
  br i1 %tobool87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %land.lhs.true85
  store i32 0, i32* @dircomplete_expand, align 4
  call void @set_directory_hook()
  store i32 1, i32* @dircomplete_expand, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %land.lhs.true85, %if.else83
  store i32 4, i32* @command_word_completion_function.mapping_over, align 4
  br label %inner

if.end90:                                         ; preds = %lor.lhs.false
  %54 = load i8*, i8** %hint_text.addr, align 4
  %call91 = call i32 @strlen(i8* %54)
  %add92 = add i32 1, %call91
  %call93 = call i8* @sh_xmalloc(i32 %add92, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1911)
  %55 = load i8*, i8** %hint_text.addr, align 4
  %call94 = call i8* @strcpy(i8* %call93, i8* %55)
  store i8* %call94, i8** @command_word_completion_function.hint, align 4
  store i8* %call94, i8** @command_word_completion_function.dequoted_hint, align 4
  %56 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call95 = call i32 @strlen(i8* %56)
  store i32 %call95, i32* @command_word_completion_function.hint_len, align 4
  store i32 %call95, i32* @command_word_completion_function.dequoted_len, align 4
  %57 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool96 = icmp ne i32 %57, 0
  br i1 %tobool96, label %land.lhs.true97, label %if.end103

land.lhs.true97:                                  ; preds = %if.end90
  %58 = load i32, i32* @rl_completion_quote_character, align 4
  %cmp98 = icmp eq i32 %58, 0
  br i1 %cmp98, label %if.then100, label %if.end103

if.then100:                                       ; preds = %land.lhs.true97
  %59 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call101 = call i8* @bash_dequote_filename(i8* %59, i32 0)
  store i8* %call101, i8** @command_word_completion_function.dequoted_hint, align 4
  %60 = load i8*, i8** @command_word_completion_function.dequoted_hint, align 4
  %call102 = call i32 @strlen(i8* %60)
  store i32 %call102, i32* @command_word_completion_function.dequoted_len, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.then100, %land.lhs.true97, %if.end90
  %call104 = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.38, i32 0, i32 0))
  store i8* %call104, i8** @command_word_completion_function.path, align 4
  store i32 0, i32* @dot_in_path, align 4
  store i32 0, i32* @command_word_completion_function.path_index, align 4
  store i32 0, i32* @command_word_completion_function.local_index, align 4
  %61 = load %struct.variable**, %struct.variable*** @command_word_completion_function.varlist, align 4
  %tobool105 = icmp ne %struct.variable** %61, null
  br i1 %tobool105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %if.end103
  %62 = load %struct.variable**, %struct.variable*** @command_word_completion_function.varlist, align 4
  %63 = bitcast %struct.variable** %62 to i8*
  call void @sh_xfree(i8* %63, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1927)
  br label %if.end107

if.end107:                                        ; preds = %if.then106, %if.end103
  %call108 = call %struct.variable** @all_visible_functions()
  store %struct.variable** %call108, %struct.variable*** @command_word_completion_function.varlist, align 4
  %64 = load %struct.alias**, %struct.alias*** @command_word_completion_function.alias_list, align 4
  %tobool109 = icmp ne %struct.alias** %64, null
  br i1 %tobool109, label %if.then110, label %if.end111

if.then110:                                       ; preds = %if.end107
  %65 = load %struct.alias**, %struct.alias*** @command_word_completion_function.alias_list, align 4
  %66 = bitcast %struct.alias** %65 to i8*
  call void @sh_xfree(i8* %66, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1933)
  br label %if.end111

if.end111:                                        ; preds = %if.then110, %if.end107
  %call112 = call %struct.alias** @all_aliases()
  store %struct.alias** %call112, %struct.alias*** @command_word_completion_function.alias_list, align 4
  br label %if.end113

if.end113:                                        ; preds = %if.end111, %entry
  %67 = load i32, i32* @command_word_completion_function.mapping_over, align 4
  switch i32 %67, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb140
    i32 2, label %sw.bb170
    i32 3, label %sw.bb204
  ]

sw.bb:                                            ; preds = %if.end113
  br label %while.cond

while.cond:                                       ; preds = %if.end138, %sw.bb
  %68 = load %struct.alias**, %struct.alias*** @command_word_completion_function.alias_list, align 4
  %tobool114 = icmp ne %struct.alias** %68, null
  br i1 %tobool114, label %land.rhs115, label %land.end118

land.rhs115:                                      ; preds = %while.cond
  %69 = load %struct.alias**, %struct.alias*** @command_word_completion_function.alias_list, align 4
  %70 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx116 = getelementptr inbounds %struct.alias*, %struct.alias** %69, i32 %70
  %71 = load %struct.alias*, %struct.alias** %arrayidx116, align 4
  %tobool117 = icmp ne %struct.alias* %71, null
  br label %land.end118

land.end118:                                      ; preds = %land.rhs115, %while.cond
  %72 = phi i1 [ false, %while.cond ], [ %tobool117, %land.rhs115 ]
  br i1 %72, label %while.body, label %while.end

while.body:                                       ; preds = %land.end118
  %73 = load %struct.alias**, %struct.alias*** @command_word_completion_function.alias_list, align 4
  %74 = load i32, i32* @command_word_completion_function.local_index, align 4
  %inc = add nsw i32 %74, 1
  store i32 %inc, i32* @command_word_completion_function.local_index, align 4
  %arrayidx120 = getelementptr inbounds %struct.alias*, %struct.alias** %73, i32 %74
  %75 = load %struct.alias*, %struct.alias** %arrayidx120, align 4
  %name = getelementptr inbounds %struct.alias, %struct.alias* %75, i32 0, i32 0
  %76 = load i8*, i8** %name, align 4
  store i8* %76, i8** %alias, align 4
  %77 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %cmp121 = icmp eq i32 %77, 0
  br i1 %cmp121, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  br i1 true, label %if.then133, label %if.end138

cond.false:                                       ; preds = %while.body
  %78 = load i8*, i8** %alias, align 4
  %arrayidx123 = getelementptr inbounds i8, i8* %78, i32 0
  %79 = load i8, i8* %arrayidx123, align 1
  %conv124 = sext i8 %79 to i32
  %80 = load i8*, i8** @command_word_completion_function.hint, align 4
  %arrayidx125 = getelementptr inbounds i8, i8* %80, i32 0
  %81 = load i8, i8* %arrayidx125, align 1
  %conv126 = sext i8 %81 to i32
  %cmp127 = icmp eq i32 %conv124, %conv126
  br i1 %cmp127, label %land.lhs.true129, label %if.end138

land.lhs.true129:                                 ; preds = %cond.false
  %82 = load i8*, i8** %alias, align 4
  %83 = load i8*, i8** @command_word_completion_function.hint, align 4
  %84 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call130 = call i32 @strncmp(i8* %82, i8* %83, i32 %84)
  %cmp131 = icmp eq i32 %call130, 0
  br i1 %cmp131, label %if.then133, label %if.end138

if.then133:                                       ; preds = %land.lhs.true129, %cond.true
  %85 = load i8*, i8** %alias, align 4
  %call134 = call i32 @strlen(i8* %85)
  %add135 = add i32 1, %call134
  %call136 = call i8* @sh_xmalloc(i32 %add135, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1953)
  %86 = load i8*, i8** %alias, align 4
  %call137 = call i8* @strcpy(i8* %call136, i8* %86)
  store i8* %call137, i8** %retval, align 4
  br label %return

if.end138:                                        ; preds = %land.lhs.true129, %cond.false, %cond.true
  br label %while.cond

while.end:                                        ; preds = %land.end118
  store i32 0, i32* @command_word_completion_function.local_index, align 4
  %87 = load i32, i32* @command_word_completion_function.mapping_over, align 4
  %inc139 = add nsw i32 %87, 1
  store i32 %inc139, i32* @command_word_completion_function.mapping_over, align 4
  br label %sw.bb140

sw.bb140:                                         ; preds = %if.end113, %while.end
  br label %while.cond141

while.cond141:                                    ; preds = %if.end167, %sw.bb140
  %88 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx142 = getelementptr inbounds [0 x %struct.STRING_INT_ALIST], [0 x %struct.STRING_INT_ALIST]* @word_token_alist, i32 0, i32 %88
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx142, i32 0, i32 0
  %89 = load i8*, i8** %word, align 4
  %tobool143 = icmp ne i8* %89, null
  br i1 %tobool143, label %while.body144, label %while.end168

while.body144:                                    ; preds = %while.cond141
  %90 = load i32, i32* @command_word_completion_function.local_index, align 4
  %inc145 = add nsw i32 %90, 1
  store i32 %inc145, i32* @command_word_completion_function.local_index, align 4
  %arrayidx146 = getelementptr inbounds [0 x %struct.STRING_INT_ALIST], [0 x %struct.STRING_INT_ALIST]* @word_token_alist, i32 0, i32 %90
  %word147 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx146, i32 0, i32 0
  %91 = load i8*, i8** %word147, align 4
  store i8* %91, i8** %reserved_word, align 4
  %92 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %cmp148 = icmp eq i32 %92, 0
  br i1 %cmp148, label %cond.true150, label %cond.false151

cond.true150:                                     ; preds = %while.body144
  br i1 true, label %if.then162, label %if.end167

cond.false151:                                    ; preds = %while.body144
  %93 = load i8*, i8** %reserved_word, align 4
  %arrayidx152 = getelementptr inbounds i8, i8* %93, i32 0
  %94 = load i8, i8* %arrayidx152, align 1
  %conv153 = sext i8 %94 to i32
  %95 = load i8*, i8** @command_word_completion_function.hint, align 4
  %arrayidx154 = getelementptr inbounds i8, i8* %95, i32 0
  %96 = load i8, i8* %arrayidx154, align 1
  %conv155 = sext i8 %96 to i32
  %cmp156 = icmp eq i32 %conv153, %conv155
  br i1 %cmp156, label %land.lhs.true158, label %if.end167

land.lhs.true158:                                 ; preds = %cond.false151
  %97 = load i8*, i8** %reserved_word, align 4
  %98 = load i8*, i8** @command_word_completion_function.hint, align 4
  %99 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call159 = call i32 @strncmp(i8* %97, i8* %98, i32 %99)
  %cmp160 = icmp eq i32 %call159, 0
  br i1 %cmp160, label %if.then162, label %if.end167

if.then162:                                       ; preds = %land.lhs.true158, %cond.true150
  %100 = load i8*, i8** %reserved_word, align 4
  %call163 = call i32 @strlen(i8* %100)
  %add164 = add i32 1, %call163
  %call165 = call i8* @sh_xmalloc(i32 %add164, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1968)
  %101 = load i8*, i8** %reserved_word, align 4
  %call166 = call i8* @strcpy(i8* %call165, i8* %101)
  store i8* %call166, i8** %retval, align 4
  br label %return

if.end167:                                        ; preds = %land.lhs.true158, %cond.false151, %cond.true150
  br label %while.cond141

while.end168:                                     ; preds = %while.cond141
  store i32 0, i32* @command_word_completion_function.local_index, align 4
  %102 = load i32, i32* @command_word_completion_function.mapping_over, align 4
  %inc169 = add nsw i32 %102, 1
  store i32 %inc169, i32* @command_word_completion_function.mapping_over, align 4
  br label %sw.bb170

sw.bb170:                                         ; preds = %if.end113, %while.end168
  br label %while.cond171

while.cond171:                                    ; preds = %if.end201, %sw.bb170
  %103 = load %struct.variable**, %struct.variable*** @command_word_completion_function.varlist, align 4
  %tobool172 = icmp ne %struct.variable** %103, null
  br i1 %tobool172, label %land.rhs173, label %land.end176

land.rhs173:                                      ; preds = %while.cond171
  %104 = load %struct.variable**, %struct.variable*** @command_word_completion_function.varlist, align 4
  %105 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx174 = getelementptr inbounds %struct.variable*, %struct.variable** %104, i32 %105
  %106 = load %struct.variable*, %struct.variable** %arrayidx174, align 4
  %tobool175 = icmp ne %struct.variable* %106, null
  br label %land.end176

land.end176:                                      ; preds = %land.rhs173, %while.cond171
  %107 = phi i1 [ false, %while.cond171 ], [ %tobool175, %land.rhs173 ]
  br i1 %107, label %while.body178, label %while.end202

while.body178:                                    ; preds = %land.end176
  %108 = load %struct.variable**, %struct.variable*** @command_word_completion_function.varlist, align 4
  %109 = load i32, i32* @command_word_completion_function.local_index, align 4
  %inc179 = add nsw i32 %109, 1
  store i32 %inc179, i32* @command_word_completion_function.local_index, align 4
  %arrayidx180 = getelementptr inbounds %struct.variable*, %struct.variable** %108, i32 %109
  %110 = load %struct.variable*, %struct.variable** %arrayidx180, align 4
  %name181 = getelementptr inbounds %struct.variable, %struct.variable* %110, i32 0, i32 0
  %111 = load i8*, i8** %name181, align 4
  store i8* %111, i8** %varname, align 4
  %112 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %cmp182 = icmp eq i32 %112, 0
  br i1 %cmp182, label %cond.true184, label %cond.false185

cond.true184:                                     ; preds = %while.body178
  br i1 true, label %if.then196, label %if.end201

cond.false185:                                    ; preds = %while.body178
  %113 = load i8*, i8** %varname, align 4
  %arrayidx186 = getelementptr inbounds i8, i8* %113, i32 0
  %114 = load i8, i8* %arrayidx186, align 1
  %conv187 = sext i8 %114 to i32
  %115 = load i8*, i8** @command_word_completion_function.hint, align 4
  %arrayidx188 = getelementptr inbounds i8, i8* %115, i32 0
  %116 = load i8, i8* %arrayidx188, align 1
  %conv189 = sext i8 %116 to i32
  %cmp190 = icmp eq i32 %conv187, %conv189
  br i1 %cmp190, label %land.lhs.true192, label %if.end201

land.lhs.true192:                                 ; preds = %cond.false185
  %117 = load i8*, i8** %varname, align 4
  %118 = load i8*, i8** @command_word_completion_function.hint, align 4
  %119 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call193 = call i32 @strncmp(i8* %117, i8* %118, i32 %119)
  %cmp194 = icmp eq i32 %call193, 0
  br i1 %cmp194, label %if.then196, label %if.end201

if.then196:                                       ; preds = %land.lhs.true192, %cond.true184
  %120 = load i8*, i8** %varname, align 4
  %call197 = call i32 @strlen(i8* %120)
  %add198 = add i32 1, %call197
  %call199 = call i8* @sh_xmalloc(i32 %add198, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1982)
  %121 = load i8*, i8** %varname, align 4
  %call200 = call i8* @strcpy(i8* %call199, i8* %121)
  store i8* %call200, i8** %retval, align 4
  br label %return

if.end201:                                        ; preds = %land.lhs.true192, %cond.false185, %cond.true184
  br label %while.cond171

while.end202:                                     ; preds = %land.end176
  store i32 0, i32* @command_word_completion_function.local_index, align 4
  %122 = load i32, i32* @command_word_completion_function.mapping_over, align 4
  %inc203 = add nsw i32 %122, 1
  store i32 %inc203, i32* @command_word_completion_function.mapping_over, align 4
  br label %sw.bb204

sw.bb204:                                         ; preds = %if.end113, %while.end202
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.bb204
  %123 = load i32, i32* @command_word_completion_function.local_index, align 4
  %124 = load i32, i32* @num_shell_builtins, align 4
  %cmp205 = icmp slt i32 %123, %124
  br i1 %cmp205, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %125 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %126 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx207 = getelementptr inbounds %struct.builtin, %struct.builtin* %125, i32 %126
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx207, i32 0, i32 1
  %127 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %tobool208 = icmp ne i32 (%struct.word_list*)* %127, null
  br i1 %tobool208, label %lor.lhs.false209, label %if.then213

lor.lhs.false209:                                 ; preds = %for.body
  %128 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %129 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx210 = getelementptr inbounds %struct.builtin, %struct.builtin* %128, i32 %129
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx210, i32 0, i32 2
  %130 = load i32, i32* %flags, align 4
  %and = and i32 %130, 1
  %cmp211 = icmp eq i32 %and, 0
  br i1 %cmp211, label %if.then213, label %if.end214

if.then213:                                       ; preds = %lor.lhs.false209, %for.body
  br label %for.inc

if.end214:                                        ; preds = %lor.lhs.false209
  %131 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %cmp215 = icmp eq i32 %131, 0
  br i1 %cmp215, label %cond.true217, label %cond.false218

cond.true217:                                     ; preds = %if.end214
  br i1 true, label %if.then233, label %if.end243

cond.false218:                                    ; preds = %if.end214
  %132 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %133 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx219 = getelementptr inbounds %struct.builtin, %struct.builtin* %132, i32 %133
  %name220 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx219, i32 0, i32 0
  %134 = load i8*, i8** %name220, align 4
  %arrayidx221 = getelementptr inbounds i8, i8* %134, i32 0
  %135 = load i8, i8* %arrayidx221, align 1
  %conv222 = sext i8 %135 to i32
  %136 = load i8*, i8** @command_word_completion_function.hint, align 4
  %arrayidx223 = getelementptr inbounds i8, i8* %136, i32 0
  %137 = load i8, i8* %arrayidx223, align 1
  %conv224 = sext i8 %137 to i32
  %cmp225 = icmp eq i32 %conv222, %conv224
  br i1 %cmp225, label %land.lhs.true227, label %if.end243

land.lhs.true227:                                 ; preds = %cond.false218
  %138 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %139 = load i32, i32* @command_word_completion_function.local_index, align 4
  %arrayidx228 = getelementptr inbounds %struct.builtin, %struct.builtin* %138, i32 %139
  %name229 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx228, i32 0, i32 0
  %140 = load i8*, i8** %name229, align 4
  %141 = load i8*, i8** @command_word_completion_function.hint, align 4
  %142 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call230 = call i32 @strncmp(i8* %140, i8* %141, i32 %142)
  %cmp231 = icmp eq i32 %call230, 0
  br i1 %cmp231, label %if.then233, label %if.end243

if.then233:                                       ; preds = %land.lhs.true227, %cond.true217
  %143 = load i32, i32* @command_word_completion_function.local_index, align 4
  %inc234 = add nsw i32 %143, 1
  store i32 %inc234, i32* @command_word_completion_function.local_index, align 4
  store i32 %143, i32* %i, align 4
  %144 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %145 = load i32, i32* %i, align 4
  %arrayidx235 = getelementptr inbounds %struct.builtin, %struct.builtin* %144, i32 %145
  %name236 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx235, i32 0, i32 0
  %146 = load i8*, i8** %name236, align 4
  %call237 = call i32 @strlen(i8* %146)
  %add238 = add i32 1, %call237
  %call239 = call i8* @sh_xmalloc(i32 %add238, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2000)
  %147 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %148 = load i32, i32* %i, align 4
  %arrayidx240 = getelementptr inbounds %struct.builtin, %struct.builtin* %147, i32 %148
  %name241 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx240, i32 0, i32 0
  %149 = load i8*, i8** %name241, align 4
  %call242 = call i8* @strcpy(i8* %call239, i8* %149)
  store i8* %call242, i8** %retval, align 4
  br label %return

if.end243:                                        ; preds = %land.lhs.true227, %cond.false218, %cond.true217
  br label %for.inc

for.inc:                                          ; preds = %if.end243, %if.then213
  %150 = load i32, i32* @command_word_completion_function.local_index, align 4
  %inc244 = add nsw i32 %150, 1
  store i32 %inc244, i32* @command_word_completion_function.local_index, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @command_word_completion_function.local_index, align 4
  %151 = load i32, i32* @command_word_completion_function.mapping_over, align 4
  %inc245 = add nsw i32 %151, 1
  store i32 %inc245, i32* @command_word_completion_function.mapping_over, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end113
  br label %globword

globword:                                         ; preds = %sw.epilog, %if.then82
  %152 = load i32, i32* @command_word_completion_function.globpat, align 4
  %tobool246 = icmp ne i32 %152, 0
  br i1 %tobool246, label %if.then247, label %if.end285

if.then247:                                       ; preds = %globword
  %153 = load i32, i32* %state.addr, align 4
  %cmp248 = icmp eq i32 %153, 0
  br i1 %cmp248, label %if.then250, label %if.end266

if.then250:                                       ; preds = %if.then247
  %154 = load i32, i32* @command_word_completion_function.igncase, align 4
  store i32 %154, i32* @glob_ignore_case, align 4
  %155 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call251 = call i8** @shell_glob_filename(i8* %155)
  store i8** %call251, i8*** @command_word_completion_function.glob_matches, align 4
  %156 = load i32, i32* @command_word_completion_function.old_glob_ignore_case, align 4
  store i32 %156, i32* @glob_ignore_case, align 4
  %157 = load i8**, i8*** @command_word_completion_function.glob_matches, align 4
  %cmp252 = icmp eq i8** %157, @glob_error_return
  br i1 %cmp252, label %if.then257, label %lor.lhs.false254

lor.lhs.false254:                                 ; preds = %if.then250
  %158 = load i8**, i8*** @command_word_completion_function.glob_matches, align 4
  %cmp255 = icmp eq i8** %158, null
  br i1 %cmp255, label %if.then257, label %if.end258

if.then257:                                       ; preds = %lor.lhs.false254, %if.then250
  store i8** null, i8*** @command_word_completion_function.glob_matches, align 4
  store i8* null, i8** %retval, align 4
  br label %return

if.end258:                                        ; preds = %lor.lhs.false254
  store i32 0, i32* @command_word_completion_function.local_index, align 4
  %159 = load i8**, i8*** @command_word_completion_function.glob_matches, align 4
  %arrayidx259 = getelementptr inbounds i8*, i8** %159, i32 1
  %160 = load i8*, i8** %arrayidx259, align 4
  %tobool260 = icmp ne i8* %160, null
  br i1 %tobool260, label %land.lhs.true261, label %if.end265

land.lhs.true261:                                 ; preds = %if.end258
  %161 = load i32, i32* @rl_completion_type, align 4
  %cmp262 = icmp eq i32 %161, 9
  br i1 %cmp262, label %if.then264, label %if.end265

if.then264:                                       ; preds = %land.lhs.true261
  store i8* null, i8** %retval, align 4
  br label %return

if.end265:                                        ; preds = %land.lhs.true261, %if.end258
  br label %if.end266

if.end266:                                        ; preds = %if.end265, %if.then247
  br label %while.cond267

while.cond267:                                    ; preds = %if.end283, %if.end266
  %162 = load i8**, i8*** @command_word_completion_function.glob_matches, align 4
  %163 = load i32, i32* @command_word_completion_function.local_index, align 4
  %inc268 = add nsw i32 %163, 1
  store i32 %inc268, i32* @command_word_completion_function.local_index, align 4
  %arrayidx269 = getelementptr inbounds i8*, i8** %162, i32 %163
  %164 = load i8*, i8** %arrayidx269, align 4
  store i8* %164, i8** @command_word_completion_function.val, align 4
  %tobool270 = icmp ne i8* %164, null
  br i1 %tobool270, label %while.body271, label %while.end284

while.body271:                                    ; preds = %while.cond267
  %165 = load i8*, i8** @command_word_completion_function.val, align 4
  %call272 = call i32 @executable_or_directory(i8* %165)
  %tobool273 = icmp ne i32 %call272, 0
  br i1 %tobool273, label %if.then274, label %if.end283

if.then274:                                       ; preds = %while.body271
  %166 = load i8*, i8** %hint_text.addr, align 4
  %167 = load i8, i8* %166, align 1
  %conv275 = sext i8 %167 to i32
  %cmp276 = icmp eq i32 %conv275, 126
  br i1 %cmp276, label %land.lhs.true278, label %if.end282

land.lhs.true278:                                 ; preds = %if.then274
  %168 = load i8*, i8** @command_word_completion_function.directory_part, align 4
  %tobool279 = icmp ne i8* %168, null
  br i1 %tobool279, label %if.then280, label %if.end282

if.then280:                                       ; preds = %land.lhs.true278
  %169 = load i8*, i8** @command_word_completion_function.val, align 4
  %170 = load i8*, i8** @command_word_completion_function.directory_part, align 4
  %call281 = call i8* @maybe_restore_tilde(i8* %169, i8* %170)
  store i8* %call281, i8** %temp, align 4
  %171 = load i8*, i8** @command_word_completion_function.val, align 4
  call void @sh_xfree(i8* %171, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2039)
  %172 = load i8*, i8** %temp, align 4
  store i8* %172, i8** @command_word_completion_function.val, align 4
  br label %if.end282

if.end282:                                        ; preds = %if.then280, %land.lhs.true278, %if.then274
  %173 = load i8*, i8** @command_word_completion_function.val, align 4
  store i8* %173, i8** %retval, align 4
  br label %return

if.end283:                                        ; preds = %while.body271
  %174 = load i8*, i8** @command_word_completion_function.val, align 4
  call void @sh_xfree(i8* %174, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2044)
  br label %while.cond267

while.end284:                                     ; preds = %while.cond267
  %175 = load i32, i32* @command_word_completion_function.old_glob_ignore_case, align 4
  store i32 %175, i32* @glob_ignore_case, align 4
  store i8* null, i8** %retval, align 4
  br label %return

if.end285:                                        ; preds = %globword
  %176 = load i32, i32* @command_word_completion_function.hint_is_dir, align 4
  %tobool286 = icmp ne i32 %176, 0
  br i1 %tobool286, label %if.then287, label %if.end292

if.then287:                                       ; preds = %if.end285
  store i32 0, i32* @command_word_completion_function.hint_is_dir, align 4
  %177 = load i8*, i8** %hint_text.addr, align 4
  %call288 = call i32 @strlen(i8* %177)
  %add289 = add i32 1, %call288
  %call290 = call i8* @sh_xmalloc(i32 %add289, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2058)
  %178 = load i8*, i8** %hint_text.addr, align 4
  %call291 = call i8* @strcpy(i8* %call290, i8* %178)
  store i8* %call291, i8** %retval, align 4
  br label %return

if.end292:                                        ; preds = %if.end285
  br label %outer

outer:                                            ; preds = %if.end365, %if.end292
  %179 = load i8*, i8** @command_word_completion_function.val, align 4
  %cmp293 = icmp ne i8* %179, null
  %conv294 = zext i1 %cmp293 to i32
  store i32 %conv294, i32* @command_word_completion_function.istate, align 4
  %180 = load i32, i32* @command_word_completion_function.istate, align 4
  %cmp295 = icmp eq i32 %180, 0
  br i1 %cmp295, label %if.then297, label %if.end351

if.then297:                                       ; preds = %outer
  %181 = load i8*, i8** @command_word_completion_function.path, align 4
  %cmp298 = icmp eq i8* %181, null
  br i1 %cmp298, label %if.then309, label %lor.lhs.false300

lor.lhs.false300:                                 ; preds = %if.then297
  %182 = load i8*, i8** @command_word_completion_function.path, align 4
  %183 = load i32, i32* @command_word_completion_function.path_index, align 4
  %arrayidx301 = getelementptr inbounds i8, i8* %182, i32 %183
  %184 = load i8, i8* %arrayidx301, align 1
  %conv302 = sext i8 %184 to i32
  %cmp303 = icmp eq i32 %conv302, 0
  br i1 %cmp303, label %if.then309, label %lor.lhs.false305

lor.lhs.false305:                                 ; preds = %lor.lhs.false300
  %185 = load i8*, i8** @command_word_completion_function.path, align 4
  %call306 = call i8* @extract_colon_unit(i8* %185, i32* @command_word_completion_function.path_index)
  store i8* %call306, i8** %current_path, align 4
  %cmp307 = icmp eq i8* %call306, null
  br i1 %cmp307, label %if.then309, label %if.end310

if.then309:                                       ; preds = %lor.lhs.false305, %lor.lhs.false300, %if.then297
  store i8* null, i8** %retval, align 4
  br label %return

if.end310:                                        ; preds = %lor.lhs.false305
  store i32 1, i32* @command_word_completion_function.searching_path, align 4
  %186 = load i8*, i8** %current_path, align 4
  %187 = load i8, i8* %186, align 1
  %conv311 = sext i8 %187 to i32
  %cmp312 = icmp eq i32 %conv311, 0
  br i1 %cmp312, label %if.then314, label %if.end317

if.then314:                                       ; preds = %if.end310
  %188 = load i8*, i8** %current_path, align 4
  call void @sh_xfree(i8* %188, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2081)
  %call315 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2082)
  %call316 = call i8* @strcpy(i8* %call315, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.39, i32 0, i32 0))
  store i8* %call316, i8** %current_path, align 4
  br label %if.end317

if.end317:                                        ; preds = %if.then314, %if.end310
  %189 = load i8*, i8** %current_path, align 4
  %190 = load i8, i8* %189, align 1
  %conv318 = sext i8 %190 to i32
  %cmp319 = icmp eq i32 %conv318, 126
  br i1 %cmp319, label %if.then321, label %if.end323

if.then321:                                       ; preds = %if.end317
  %191 = load i8*, i8** %current_path, align 4
  %call322 = call i8* @bash_tilde_expand(i8* %191, i32 0)
  store i8* %call322, i8** %t, align 4
  %192 = load i8*, i8** %current_path, align 4
  call void @sh_xfree(i8* %192, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2090)
  %193 = load i8*, i8** %t, align 4
  store i8* %193, i8** %current_path, align 4
  br label %if.end323

if.end323:                                        ; preds = %if.then321, %if.end317
  %194 = load i8*, i8** %current_path, align 4
  %arrayidx324 = getelementptr inbounds i8, i8* %194, i32 0
  %195 = load i8, i8* %arrayidx324, align 1
  %conv325 = sext i8 %195 to i32
  %cmp326 = icmp eq i32 %conv325, 46
  br i1 %cmp326, label %land.lhs.true328, label %if.end334

land.lhs.true328:                                 ; preds = %if.end323
  %196 = load i8*, i8** %current_path, align 4
  %arrayidx329 = getelementptr inbounds i8, i8* %196, i32 1
  %197 = load i8, i8* %arrayidx329, align 1
  %conv330 = sext i8 %197 to i32
  %cmp331 = icmp eq i32 %conv330, 0
  br i1 %cmp331, label %if.then333, label %if.end334

if.then333:                                       ; preds = %land.lhs.true328
  store i32 1, i32* @dot_in_path, align 4
  br label %if.end334

if.end334:                                        ; preds = %if.then333, %land.lhs.true328, %if.end323
  %198 = load i8*, i8** @command_word_completion_function.fnhint, align 4
  %tobool335 = icmp ne i8* %198, null
  br i1 %tobool335, label %land.lhs.true336, label %if.end340

land.lhs.true336:                                 ; preds = %if.end334
  %199 = load i8*, i8** @command_word_completion_function.fnhint, align 4
  %200 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  %cmp337 = icmp ne i8* %199, %200
  br i1 %cmp337, label %if.then339, label %if.end340

if.then339:                                       ; preds = %land.lhs.true336
  %201 = load i8*, i8** @command_word_completion_function.fnhint, align 4
  call void @sh_xfree(i8* %201, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2098)
  br label %if.end340

if.end340:                                        ; preds = %if.then339, %land.lhs.true336, %if.end334
  %202 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  %tobool341 = icmp ne i8* %202, null
  br i1 %tobool341, label %if.then342, label %if.end343

if.then342:                                       ; preds = %if.end340
  %203 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  call void @sh_xfree(i8* %203, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2100)
  br label %if.end343

if.end343:                                        ; preds = %if.then342, %if.end340
  %204 = load i8*, i8** %current_path, align 4
  %205 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call344 = call i8* @sh_makepath(i8* %204, i8* %205, i32 0)
  store i8* %call344, i8** @command_word_completion_function.filename_hint, align 4
  %206 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  %call345 = call i8* @strpbrk(i8* %206, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.40, i32 0, i32 0))
  %tobool346 = icmp ne i8* %call345, null
  br i1 %tobool346, label %if.then347, label %if.else349

if.then347:                                       ; preds = %if.end343
  %207 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  %call348 = call i8* @sh_backslash_quote(i8* %207, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @filename_bstab, i32 0, i32 0), i32 0)
  store i8* %call348, i8** @command_word_completion_function.fnhint, align 4
  br label %if.end350

if.else349:                                       ; preds = %if.end343
  %208 = load i8*, i8** @command_word_completion_function.filename_hint, align 4
  store i8* %208, i8** @command_word_completion_function.fnhint, align 4
  br label %if.end350

if.end350:                                        ; preds = %if.else349, %if.then347
  %209 = load i8*, i8** %current_path, align 4
  call void @sh_xfree(i8* %209, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2111)
  br label %if.end351

if.end351:                                        ; preds = %if.end350, %outer
  br label %inner

inner:                                            ; preds = %if.end436, %if.end351, %if.end89
  %210 = load i8*, i8** @command_word_completion_function.fnhint, align 4
  %211 = load i32, i32* @command_word_completion_function.istate, align 4
  %call352 = call i8* @rl_filename_completion_function(i8* %210, i32 %211)
  store i8* %call352, i8** @command_word_completion_function.val, align 4
  %212 = load i32, i32* @command_word_completion_function.mapping_over, align 4
  %cmp353 = icmp eq i32 %212, 4
  br i1 %cmp353, label %land.lhs.true355, label %if.end358

land.lhs.true355:                                 ; preds = %inner
  %213 = load i32, i32* @dircomplete_expand, align 4
  %tobool356 = icmp ne i32 %213, 0
  br i1 %tobool356, label %if.then357, label %if.end358

if.then357:                                       ; preds = %land.lhs.true355
  call void @set_directory_hook()
  br label %if.end358

if.end358:                                        ; preds = %if.then357, %land.lhs.true355, %inner
  store i32 1, i32* @command_word_completion_function.istate, align 4
  %214 = load i8*, i8** @command_word_completion_function.val, align 4
  %cmp359 = icmp eq i8* %214, null
  br i1 %cmp359, label %if.then361, label %if.else366

if.then361:                                       ; preds = %if.end358
  %215 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call362 = call i32 @absolute_program(i8* %215)
  %tobool363 = icmp ne i32 %call362, 0
  br i1 %tobool363, label %if.then364, label %if.end365

if.then364:                                       ; preds = %if.then361
  store i8* null, i8** %retval, align 4
  br label %return

if.end365:                                        ; preds = %if.then361
  br label %outer

if.else366:                                       ; preds = %if.end358
  %216 = load i8*, i8** @command_word_completion_function.hint, align 4
  %call367 = call i32 @absolute_program(i8* %216)
  %tobool368 = icmp ne i32 %call367, 0
  br i1 %tobool368, label %if.then369, label %if.else392

if.then369:                                       ; preds = %if.else366
  %217 = load i32, i32* @command_word_completion_function.igncase, align 4
  %cmp370 = icmp eq i32 %217, 0
  br i1 %cmp370, label %if.then372, label %if.else376

if.then372:                                       ; preds = %if.then369
  %218 = load i8*, i8** @command_word_completion_function.val, align 4
  %219 = load i8*, i8** @command_word_completion_function.hint, align 4
  %220 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call373 = call i32 @strncmp(i8* %218, i8* %219, i32 %220)
  %cmp374 = icmp eq i32 %call373, 0
  %conv375 = zext i1 %cmp374 to i32
  store i32 %conv375, i32* %match, align 4
  br label %if.end380

if.else376:                                       ; preds = %if.then369
  %221 = load i8*, i8** @command_word_completion_function.val, align 4
  %222 = load i8*, i8** @command_word_completion_function.hint, align 4
  %223 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call377 = call i32 @strncasecmp(i8* %221, i8* %222, i32 %223)
  %cmp378 = icmp eq i32 %call377, 0
  %conv379 = zext i1 %cmp378 to i32
  store i32 %conv379, i32* %match, align 4
  br label %if.end380

if.end380:                                        ; preds = %if.else376, %if.then372
  %224 = load i8*, i8** %hint_text.addr, align 4
  %225 = load i8, i8* %224, align 1
  %conv381 = sext i8 %225 to i32
  %cmp382 = icmp eq i32 %conv381, 126
  br i1 %cmp382, label %if.then384, label %if.else386

if.then384:                                       ; preds = %if.end380
  %226 = load i8*, i8** @command_word_completion_function.val, align 4
  %227 = load i8*, i8** @command_word_completion_function.directory_part, align 4
  %call385 = call i8* @maybe_restore_tilde(i8* %226, i8* %227)
  store i8* %call385, i8** %temp, align 4
  br label %if.end391

if.else386:                                       ; preds = %if.end380
  %228 = load i8*, i8** @command_word_completion_function.val, align 4
  %call387 = call i32 @strlen(i8* %228)
  %add388 = add i32 1, %call387
  %call389 = call i8* @sh_xmalloc(i32 %add388, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2146)
  %229 = load i8*, i8** @command_word_completion_function.val, align 4
  %call390 = call i8* @strcpy(i8* %call389, i8* %229)
  store i8* %call390, i8** %temp, align 4
  br label %if.end391

if.end391:                                        ; preds = %if.else386, %if.then384
  store i32 1, i32* %freetemp, align 4
  br label %if.end416

if.else392:                                       ; preds = %if.else366
  %230 = load i8*, i8** @command_word_completion_function.val, align 4
  %call393 = call i8* @strrchr(i8* %230, i32 47)
  store i8* %call393, i8** %temp, align 4
  %231 = load i8*, i8** %temp, align 4
  %tobool394 = icmp ne i8* %231, null
  br i1 %tobool394, label %if.then395, label %if.else414

if.then395:                                       ; preds = %if.else392
  %232 = load i8*, i8** %temp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %232, i32 1
  store i8* %incdec.ptr, i8** %temp, align 4
  %233 = load i32, i32* @command_word_completion_function.igncase, align 4
  %cmp396 = icmp eq i32 %233, 0
  br i1 %cmp396, label %if.then398, label %if.else402

if.then398:                                       ; preds = %if.then395
  %234 = load i8*, i8** %temp, align 4
  %235 = load i8*, i8** @command_word_completion_function.hint, align 4
  %236 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call399 = call i32 @strncmp(i8* %234, i8* %235, i32 %236)
  %cmp400 = icmp eq i32 %call399, 0
  %conv401 = zext i1 %cmp400 to i32
  store i32 %conv401, i32* %match, align 4
  store i32 %conv401, i32* %freetemp, align 4
  br label %if.end406

if.else402:                                       ; preds = %if.then395
  %237 = load i8*, i8** %temp, align 4
  %238 = load i8*, i8** @command_word_completion_function.hint, align 4
  %239 = load i32, i32* @command_word_completion_function.hint_len, align 4
  %call403 = call i32 @strncasecmp(i8* %237, i8* %238, i32 %239)
  %cmp404 = icmp eq i32 %call403, 0
  %conv405 = zext i1 %cmp404 to i32
  store i32 %conv405, i32* %match, align 4
  store i32 %conv405, i32* %freetemp, align 4
  br label %if.end406

if.end406:                                        ; preds = %if.else402, %if.then398
  %240 = load i32, i32* %match, align 4
  %tobool407 = icmp ne i32 %240, 0
  br i1 %tobool407, label %if.then408, label %if.end413

if.then408:                                       ; preds = %if.end406
  %241 = load i8*, i8** %temp, align 4
  %call409 = call i32 @strlen(i8* %241)
  %add410 = add i32 1, %call409
  %call411 = call i8* @sh_xmalloc(i32 %add410, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2161)
  %242 = load i8*, i8** %temp, align 4
  %call412 = call i8* @strcpy(i8* %call411, i8* %242)
  store i8* %call412, i8** %temp, align 4
  br label %if.end413

if.end413:                                        ; preds = %if.then408, %if.end406
  br label %if.end415

if.else414:                                       ; preds = %if.else392
  store i32 0, i32* %match, align 4
  store i32 0, i32* %freetemp, align 4
  br label %if.end415

if.end415:                                        ; preds = %if.else414, %if.end413
  br label %if.end416

if.end416:                                        ; preds = %if.end415, %if.end391
  %243 = load i8*, i8** @command_word_completion_function.val, align 4
  store i8* %243, i8** %cval, align 4
  %244 = load i32, i32* %match, align 4
  %tobool417 = icmp ne i32 %244, 0
  br i1 %tobool417, label %land.lhs.true418, label %if.else429

land.lhs.true418:                                 ; preds = %if.end416
  %245 = load i32, i32* @command_word_completion_function.searching_path, align 4
  %tobool419 = icmp ne i32 %245, 0
  br i1 %tobool419, label %cond.true420, label %cond.false421

cond.true420:                                     ; preds = %land.lhs.true418
  %246 = load i8*, i8** @command_word_completion_function.val, align 4
  br label %cond.end

cond.false421:                                    ; preds = %land.lhs.true418
  %247 = load i8*, i8** %cval, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false421, %cond.true420
  %cond = phi i8* [ %246, %cond.true420 ], [ %247, %cond.false421 ]
  %248 = load i32, i32* @command_word_completion_function.searching_path, align 4
  %call422 = call i32 @executable_completion(i8* %cond, i32 %248)
  %tobool423 = icmp ne i32 %call422, 0
  br i1 %tobool423, label %if.then424, label %if.else429

if.then424:                                       ; preds = %cond.end
  %249 = load i8*, i8** %cval, align 4
  %250 = load i8*, i8** @command_word_completion_function.val, align 4
  %cmp425 = icmp ne i8* %249, %250
  br i1 %cmp425, label %if.then427, label %if.end428

if.then427:                                       ; preds = %if.then424
  %251 = load i8*, i8** %cval, align 4
  call void @sh_xfree(i8* %251, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2198)
  br label %if.end428

if.end428:                                        ; preds = %if.then427, %if.then424
  %252 = load i8*, i8** @command_word_completion_function.val, align 4
  call void @sh_xfree(i8* %252, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2199)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.41, i32 0, i32 0), i8** @command_word_completion_function.val, align 4
  %253 = load i8*, i8** %temp, align 4
  store i8* %253, i8** %retval, align 4
  br label %return

if.else429:                                       ; preds = %cond.end, %if.end416
  %254 = load i32, i32* %freetemp, align 4
  %tobool430 = icmp ne i32 %254, 0
  br i1 %tobool430, label %if.then431, label %if.end432

if.then431:                                       ; preds = %if.else429
  %255 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %255, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2206)
  br label %if.end432

if.end432:                                        ; preds = %if.then431, %if.else429
  %256 = load i8*, i8** %cval, align 4
  %257 = load i8*, i8** @command_word_completion_function.val, align 4
  %cmp433 = icmp ne i8* %256, %257
  br i1 %cmp433, label %if.then435, label %if.end436

if.then435:                                       ; preds = %if.end432
  %258 = load i8*, i8** %cval, align 4
  call void @sh_xfree(i8* %258, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2208)
  br label %if.end436

if.end436:                                        ; preds = %if.then435, %if.end432
  %259 = load i8*, i8** @command_word_completion_function.val, align 4
  call void @sh_xfree(i8* %259, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2209)
  br label %inner

return:                                           ; preds = %if.end428, %if.then364, %if.then309, %if.then287, %while.end284, %if.end282, %if.then264, %if.then257, %if.then233, %if.then196, %if.then162, %if.then133
  %260 = load i8*, i8** %retval, align 4
  ret i8* %260
}

; Function Attrs: noinline nounwind
define internal i32 @bash_ignore_filenames(i8** %names) #0 {
entry:
  %names.addr = alloca i8**, align 4
  store i8** %names, i8*** %names.addr, align 4
  %0 = load i8**, i8*** %names.addr, align 4
  call void @_ignore_completion_names(i8** %0, i32 (i8*)* @test_for_directory)
  ret i32 0
}

declare i32 @absolute_pathname(i8*) #1

declare i32 @absolute_program(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @test_for_directory(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %fn = alloca i8*, align 4
  %r = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i8* @bash_tilde_expand(i8* %0, i32 0)
  store i8* %call, i8** %fn, align 4
  %1 = load i8*, i8** %fn, align 4
  %call1 = call i32 @file_isdir(i8* %1)
  store i32 %call1, i32* %r, align 4
  %2 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2933)
  %3 = load i32, i32* %r, align 4
  ret i32 %3
}

declare i32 @strcmp(i8*, i8*) #1

declare i32 @glob_pattern_p(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @glob_complete_word(i8* %text, i32 %state) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %glen = alloca i32, align 4
  %ret = alloca i8*, align 4
  %ttext = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end38

if.then:                                          ; preds = %entry
  store i32 1, i32* @rl_filename_completion_desired, align 4
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8**, i8*** @glob_complete_word.matches, align 4
  %tobool = icmp ne i8** %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8**, i8*** @glob_complete_word.matches, align 4
  %3 = bitcast i8** %2 to i8*
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3678)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %4 = load i8*, i8** @globorig, align 4
  %5 = load i8*, i8** @globtext, align 4
  %cmp2 = icmp ne i8* %4, %5
  br i1 %cmp2, label %if.then3, label %if.end9

if.then3:                                         ; preds = %do.end
  br label %do.body4

do.body4:                                         ; preds = %if.then3
  %6 = load i8*, i8** @globorig, align 4
  %tobool5 = icmp ne i8* %6, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.body4
  %7 = load i8*, i8** @globorig, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3680)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %do.body4
  br label %do.end8

do.end8:                                          ; preds = %if.end7
  br label %if.end9

if.end9:                                          ; preds = %do.end8, %do.end
  br label %do.body10

do.body10:                                        ; preds = %if.end9
  %8 = load i8*, i8** @globtext, align 4
  %tobool11 = icmp ne i8* %8, null
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %do.body10
  %9 = load i8*, i8** @globtext, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3681)
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %do.body10
  br label %do.end14

do.end14:                                         ; preds = %if.end13
  %10 = load i8*, i8** %text.addr, align 4
  %call = call i8* @bash_tilde_expand(i8* %10, i32 0)
  store i8* %call, i8** %ttext, align 4
  %11 = load i32, i32* @rl_explicit_arg, align 4
  %tobool15 = icmp ne i32 %11, 0
  br i1 %tobool15, label %if.then16, label %if.else

if.then16:                                        ; preds = %do.end14
  %12 = load i8*, i8** %ttext, align 4
  %call17 = call i32 @strlen(i8* %12)
  %add = add i32 1, %call17
  %call18 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3687)
  %13 = load i8*, i8** %ttext, align 4
  %call19 = call i8* @strcpy(i8* %call18, i8* %13)
  store i8* %call19, i8** @globorig, align 4
  %14 = load i8*, i8** %ttext, align 4
  %call20 = call i32 @strlen(i8* %14)
  store i32 %call20, i32* %glen, align 4
  %15 = load i32, i32* %glen, align 4
  %add21 = add nsw i32 %15, 2
  %call22 = call i8* @sh_xmalloc(i32 %add21, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3689)
  store i8* %call22, i8** @globtext, align 4
  %16 = load i8*, i8** @globtext, align 4
  %17 = load i8*, i8** %ttext, align 4
  %call23 = call i8* @strcpy(i8* %16, i8* %17)
  %18 = load i8*, i8** @globtext, align 4
  %19 = load i32, i32* %glen, align 4
  %arrayidx = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 42, i8* %arrayidx, align 1
  %20 = load i8*, i8** @globtext, align 4
  %21 = load i32, i32* %glen, align 4
  %add24 = add nsw i32 %21, 1
  %arrayidx25 = getelementptr inbounds i8, i8* %20, i32 %add24
  store i8 0, i8* %arrayidx25, align 1
  br label %if.end30

if.else:                                          ; preds = %do.end14
  %22 = load i8*, i8** %ttext, align 4
  %call26 = call i32 @strlen(i8* %22)
  %add27 = add i32 1, %call26
  %call28 = call i8* @sh_xmalloc(i32 %add27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3695)
  %23 = load i8*, i8** %ttext, align 4
  %call29 = call i8* @strcpy(i8* %call28, i8* %23)
  store i8* %call29, i8** @globorig, align 4
  store i8* %call29, i8** @globtext, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then16
  %24 = load i8*, i8** %ttext, align 4
  %25 = load i8*, i8** %text.addr, align 4
  %cmp31 = icmp ne i8* %24, %25
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  %26 = load i8*, i8** %ttext, align 4
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3698)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  %27 = load i8*, i8** @globtext, align 4
  %call34 = call i8** @shell_glob_filename(i8* %27)
  store i8** %call34, i8*** @glob_complete_word.matches, align 4
  %28 = load i8**, i8*** @glob_complete_word.matches, align 4
  %cmp35 = icmp eq i8** %28, @glob_error_return
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end33
  store i8** null, i8*** @glob_complete_word.matches, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end33
  store i32 0, i32* @glob_complete_word.ind, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %entry
  %29 = load i8**, i8*** @glob_complete_word.matches, align 4
  %tobool39 = icmp ne i8** %29, null
  br i1 %tobool39, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end38
  %30 = load i8**, i8*** @glob_complete_word.matches, align 4
  %31 = load i32, i32* @glob_complete_word.ind, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx40, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end38
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %32, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %ret, align 4
  %33 = load i32, i32* @glob_complete_word.ind, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* @glob_complete_word.ind, align 4
  %34 = load i8*, i8** %ret, align 4
  ret i8* %34
}

declare void @strvec_dispose(i8**) #1

; Function Attrs: noinline nounwind
define internal i32 @bash_command_name_stat_hook(i8** %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8**, align 4
  %cname = alloca i8*, align 4
  %result = alloca i8*, align 4
  store i8** %name, i8*** %name.addr, align 4
  %0 = load i8**, i8*** %name.addr, align 4
  %1 = load i8*, i8** %0, align 4
  %call = call i32 @absolute_program(i8* %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** %name.addr, align 4
  %call1 = call i32 @bash_filename_stat_hook(i8** %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8**, i8*** %name.addr, align 4
  %4 = load i8*, i8** %3, align 4
  store i8* %4, i8** %cname, align 4
  %5 = load i8*, i8** %cname, align 4
  %call2 = call i8* @search_for_command(i8* %5, i32 0)
  store i8* %call2, i8** %result, align 4
  %6 = load i8*, i8** %result, align 4
  %tobool3 = icmp ne i8* %6, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %7 = load i8*, i8** %result, align 4
  %8 = load i8**, i8*** %name.addr, align 4
  store i8* %7, i8** %8, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare i8* @rl_variable_value(i8*) #1

declare i8* @bash_tilde_expand(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @bash_directory_completion_hook(i8** %dirname) #0 {
entry:
  %retval = alloca i32, align 4
  %dirname.addr = alloca i8**, align 4
  %local_dirname = alloca i8*, align 4
  %new_dirname = alloca i8*, align 4
  %t = alloca i8*, align 4
  %return_value = alloca i32, align 4
  %should_expand_dirname = alloca i32, align 4
  %nextch = alloca i32, align 4
  %closer = alloca i32, align 4
  %changed = alloca i32, align 4
  %local_dirlen = alloca i32, align 4
  %wl = alloca %struct.word_list*, align 4
  %sb = alloca %struct.stat, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %temp1 = alloca i8*, align 4
  %temp2 = alloca i8*, align 4
  %len1 = alloca i32, align 4
  %len2 = alloca i32, align 4
  store i8** %dirname, i8*** %dirname.addr, align 4
  store i32 0, i32* %closer, align 4
  store i32 0, i32* %nextch, align 4
  store i32 0, i32* %should_expand_dirname, align 4
  store i32 0, i32* %return_value, align 4
  %0 = load i8**, i8*** %dirname.addr, align 4
  %1 = load i8*, i8** %0, align 4
  store i8* %1, i8** %local_dirname, align 4
  %2 = load i8*, i8** %local_dirname, align 4
  %call = call i8* @mbschr(i8* %2, i32 36)
  store i8* %call, i8** %t, align 4
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %if.then, label %if.else8

if.then:                                          ; preds = %entry
  store i32 36, i32* %should_expand_dirname, align 4
  %3 = load i8*, i8** %t, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* %nextch, align 4
  %5 = load i32, i32* %nextch, align 4
  %cmp = icmp eq i32 %5, 40
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  store i32 41, i32* %closer, align 4
  br label %if.end7

if.else:                                          ; preds = %if.then
  %6 = load i32, i32* %nextch, align 4
  %cmp3 = icmp eq i32 %6, 123
  br i1 %cmp3, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else
  store i32 125, i32* %closer, align 4
  br label %if.end

if.else6:                                         ; preds = %if.else
  store i32 0, i32* %nextch, align 4
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then5
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then2
  br label %if.end24

if.else8:                                         ; preds = %entry
  %7 = load i8*, i8** %local_dirname, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %8 to i32
  %cmp11 = icmp eq i32 %conv10, 126
  br i1 %cmp11, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else8
  store i32 126, i32* %should_expand_dirname, align 4
  br label %if.end23

if.else14:                                        ; preds = %if.else8
  %9 = load i8*, i8** %local_dirname, align 4
  %call15 = call i8* @mbschr(i8* %9, i32 96)
  store i8* %call15, i8** %t, align 4
  %10 = load i8*, i8** %t, align 4
  %tobool16 = icmp ne i8* %10, null
  br i1 %tobool16, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %if.else14
  %11 = load i8*, i8** %local_dirname, align 4
  %12 = load i8*, i8** %local_dirname, align 4
  %call17 = call i32 @strlen(i8* %12)
  %call18 = call i32 @unclosed_pair(i8* %11, i32 %call17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.61, i32 0, i32 0))
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true
  store i32 96, i32* %should_expand_dirname, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %land.lhs.true, %if.else14
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then13
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.end7
  %13 = load i32, i32* %should_expand_dirname, align 4
  %tobool25 = icmp ne i32 %13, 0
  br i1 %tobool25, label %land.lhs.true26, label %if.end30

land.lhs.true26:                                  ; preds = %if.end24
  %14 = load i8*, i8** %local_dirname, align 4
  %call27 = call i32 @directory_exists(i8* %14, i32 1)
  %tobool28 = icmp ne i32 %call27, 0
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %land.lhs.true26
  store i32 0, i32* %should_expand_dirname, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %land.lhs.true26, %if.end24
  %15 = load i32, i32* %should_expand_dirname, align 4
  %tobool31 = icmp ne i32 %15, 0
  br i1 %tobool31, label %if.then32, label %if.else79

if.then32:                                        ; preds = %if.end30
  %16 = load i8*, i8** %local_dirname, align 4
  %call33 = call i32 @strlen(i8* %16)
  %add = add i32 1, %call33
  %call34 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3254)
  %17 = load i8*, i8** %local_dirname, align 4
  %call35 = call i8* @strcpy(i8* %call34, i8* %17)
  store i8* %call35, i8** %new_dirname, align 4
  %18 = load i8*, i8** %new_dirname, align 4
  %call36 = call %struct.word_list* @expand_prompt_string(i8* %18, i32 0, i32 135267328)
  store %struct.word_list* %call36, %struct.word_list** %wl, align 4
  %19 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %tobool37 = icmp ne %struct.word_list* %19, null
  br i1 %tobool37, label %if.then38, label %if.else76

if.then38:                                        ; preds = %if.then32
  %20 = load %struct.word_list*, %struct.word_list** %wl, align 4
  %call39 = call i8* @string_list(%struct.word_list* %20)
  %21 = load i8**, i8*** %dirname.addr, align 4
  store i8* %call39, i8** %21, align 4
  %22 = load i8*, i8** %local_dirname, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %22, i32 0
  %23 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %23 to i32
  %24 = load i8**, i8*** %dirname.addr, align 4
  %25 = load i8*, i8** %24, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %26 to i32
  %cmp44 = icmp eq i32 %conv41, %conv43
  br i1 %cmp44, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then38
  %27 = load i8*, i8** %local_dirname, align 4
  %28 = load i8**, i8*** %dirname.addr, align 4
  %29 = load i8*, i8** %28, align 4
  %call46 = call i32 @strcmp(i8* %27, i8* %29)
  %cmp47 = icmp eq i32 %call46, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then38
  %30 = phi i1 [ false, %if.then38 ], [ %cmp47, %land.rhs ]
  %land.ext = zext i1 %30 to i32
  %cmp49 = icmp eq i32 %land.ext, 0
  %conv50 = zext i1 %cmp49 to i32
  store i32 %conv50, i32* %return_value, align 4
  %31 = load i8*, i8** %local_dirname, align 4
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3262)
  %32 = load i8*, i8** %new_dirname, align 4
  call void @sh_xfree(i8* %32, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3263)
  %33 = load %struct.word_list*, %struct.word_list** %wl, align 4
  call void @dispose_words(%struct.word_list* %33)
  %34 = load i8**, i8*** %dirname.addr, align 4
  %35 = load i8*, i8** %34, align 4
  store i8* %35, i8** %local_dirname, align 4
  %36 = load i8*, i8** @rl_filename_quote_characters, align 4
  %tobool51 = icmp ne i8* %36, null
  br i1 %tobool51, label %land.lhs.true52, label %if.end75

land.lhs.true52:                                  ; preds = %land.end
  %37 = load i8*, i8** @rl_filename_quote_characters, align 4
  %38 = load i8, i8* %37, align 1
  %conv53 = sext i8 %38 to i32
  %tobool54 = icmp ne i32 %conv53, 0
  br i1 %tobool54, label %if.then55, label %if.end75

if.then55:                                        ; preds = %land.lhs.true52
  %39 = load i8*, i8** @default_filename_quote_characters, align 4
  %call56 = call i32 @strlen(i8* %39)
  store i32 %call56, i32* %i, align 4
  %40 = load i8*, i8** @custom_filename_quote_characters, align 4
  %41 = load i32, i32* %i, align 4
  %add57 = add nsw i32 %41, 1
  %call58 = call i8* @sh_xrealloc(i8* %40, i32 %add57, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3273)
  store i8* %call58, i8** @custom_filename_quote_characters, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then55
  %42 = load i8*, i8** @default_filename_quote_characters, align 4
  %43 = load i32, i32* %i, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %44 to i32
  store i32 %conv60, i32* %c, align 4
  %tobool61 = icmp ne i32 %conv60, 0
  br i1 %tobool61, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %45 = load i32, i32* %c, align 4
  %46 = load i32, i32* %should_expand_dirname, align 4
  %cmp62 = icmp eq i32 %45, %46
  br i1 %cmp62, label %if.then69, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %47 = load i32, i32* %c, align 4
  %48 = load i32, i32* %nextch, align 4
  %cmp64 = icmp eq i32 %47, %48
  br i1 %cmp64, label %if.then69, label %lor.lhs.false66

lor.lhs.false66:                                  ; preds = %lor.lhs.false
  %49 = load i32, i32* %c, align 4
  %50 = load i32, i32* %closer, align 4
  %cmp67 = icmp eq i32 %49, %50
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %lor.lhs.false66, %lor.lhs.false, %for.body
  br label %for.inc

if.end70:                                         ; preds = %lor.lhs.false66
  %51 = load i32, i32* %c, align 4
  %conv71 = trunc i32 %51 to i8
  %52 = load i8*, i8** @custom_filename_quote_characters, align 4
  %53 = load i32, i32* %j, align 4
  %inc = add nsw i32 %53, 1
  store i32 %inc, i32* %j, align 4
  %arrayidx72 = getelementptr inbounds i8, i8* %52, i32 %53
  store i8 %conv71, i8* %arrayidx72, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end70, %if.then69
  %54 = load i32, i32* %i, align 4
  %inc73 = add nsw i32 %54, 1
  store i32 %inc73, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %55 = load i8*, i8** @custom_filename_quote_characters, align 4
  %56 = load i32, i32* %j, align 4
  %arrayidx74 = getelementptr inbounds i8, i8* %55, i32 %56
  store i8 0, i8* %arrayidx74, align 1
  %57 = load i8*, i8** @custom_filename_quote_characters, align 4
  store i8* %57, i8** @rl_filename_quote_characters, align 4
  %58 = load i8*, i8** @rl_filename_quote_characters, align 4
  call void @set_filename_bstab(i8* %58)
  br label %if.end75

if.end75:                                         ; preds = %for.end, %land.lhs.true52, %land.end
  br label %if.end78

if.else76:                                        ; preds = %if.then32
  %59 = load i8*, i8** %new_dirname, align 4
  call void @sh_xfree(i8* %59, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3287)
  %60 = load i8*, i8** %local_dirname, align 4
  call void @sh_xfree(i8* %60, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3288)
  %call77 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3289)
  %61 = load i8**, i8*** %dirname.addr, align 4
  store i8* %call77, i8** %61, align 4
  %62 = load i8**, i8*** %dirname.addr, align 4
  %63 = load i8*, i8** %62, align 4
  store i8 0, i8* %63, align 1
  store i32 1, i32* %retval, align 4
  br label %return

if.end78:                                         ; preds = %if.end75
  br label %if.end95

if.else79:                                        ; preds = %if.end30
  %64 = load i8*, i8** %local_dirname, align 4
  %65 = load i32, i32* @rl_completion_quote_character, align 4
  %call80 = call i8* @bash_dequote_filename(i8* %64, i32 %65)
  store i8* %call80, i8** %new_dirname, align 4
  %66 = load i8*, i8** %local_dirname, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %66, i32 0
  %67 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %67 to i32
  %68 = load i8*, i8** %new_dirname, align 4
  %arrayidx83 = getelementptr inbounds i8, i8* %68, i32 0
  %69 = load i8, i8* %arrayidx83, align 1
  %conv84 = sext i8 %69 to i32
  %cmp85 = icmp eq i32 %conv82, %conv84
  br i1 %cmp85, label %land.rhs87, label %land.end91

land.rhs87:                                       ; preds = %if.else79
  %70 = load i8*, i8** %local_dirname, align 4
  %71 = load i8*, i8** %new_dirname, align 4
  %call88 = call i32 @strcmp(i8* %70, i8* %71)
  %cmp89 = icmp eq i32 %call88, 0
  br label %land.end91

land.end91:                                       ; preds = %land.rhs87, %if.else79
  %72 = phi i1 [ false, %if.else79 ], [ %cmp89, %land.rhs87 ]
  %land.ext92 = zext i1 %72 to i32
  %cmp93 = icmp eq i32 %land.ext92, 0
  %conv94 = zext i1 %cmp93 to i32
  store i32 %conv94, i32* %return_value, align 4
  %73 = load i8*, i8** %local_dirname, align 4
  call void @sh_xfree(i8* %73, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3299)
  %74 = load i8*, i8** %new_dirname, align 4
  %75 = load i8**, i8*** %dirname.addr, align 4
  store i8* %74, i8** %75, align 4
  store i8* %74, i8** %local_dirname, align 4
  br label %if.end95

if.end95:                                         ; preds = %land.end91, %if.end78
  %76 = load i32, i32* @no_symbolic_links, align 4
  %cmp96 = icmp eq i32 %76, 0
  br i1 %cmp96, label %land.lhs.true98, label %if.end190

land.lhs.true98:                                  ; preds = %if.end95
  %77 = load i8*, i8** %local_dirname, align 4
  %arrayidx99 = getelementptr inbounds i8, i8* %77, i32 0
  %78 = load i8, i8* %arrayidx99, align 1
  %conv100 = sext i8 %78 to i32
  %cmp101 = icmp ne i32 %conv100, 46
  br i1 %cmp101, label %if.then107, label %lor.lhs.false103

lor.lhs.false103:                                 ; preds = %land.lhs.true98
  %79 = load i8*, i8** %local_dirname, align 4
  %arrayidx104 = getelementptr inbounds i8, i8* %79, i32 1
  %80 = load i8, i8* %arrayidx104, align 1
  %conv105 = sext i8 %80 to i32
  %tobool106 = icmp ne i32 %conv105, 0
  br i1 %tobool106, label %if.then107, label %if.end190

if.then107:                                       ; preds = %lor.lhs.false103, %land.lhs.true98
  %call108 = call i8* @get_working_directory(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.68, i32 0, i32 0))
  store i8* %call108, i8** %t, align 4
  %81 = load i8*, i8** %local_dirname, align 4
  %82 = load i8*, i8** %t, align 4
  %call109 = call i8* @make_absolute(i8* %81, i8* %82)
  store i8* %call109, i8** %temp1, align 4
  %83 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %83, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3330)
  %84 = load i8*, i8** %temp1, align 4
  %call110 = call i8* @sh_canonpath(i8* %84, i32 3)
  store i8* %call110, i8** %temp2, align 4
  %85 = load i8*, i8** %temp2, align 4
  %cmp111 = icmp eq i8* %85, null
  br i1 %cmp111, label %land.lhs.true113, label %if.end125

land.lhs.true113:                                 ; preds = %if.then107
  %86 = load i32, i32* @dircomplete_spelling, align 4
  %tobool114 = icmp ne i32 %86, 0
  br i1 %tobool114, label %land.lhs.true115, label %if.end125

land.lhs.true115:                                 ; preds = %land.lhs.true113
  %87 = load i32, i32* @dircomplete_expand, align 4
  %tobool116 = icmp ne i32 %87, 0
  br i1 %tobool116, label %if.then117, label %if.end125

if.then117:                                       ; preds = %land.lhs.true115
  %88 = load i8*, i8** %temp1, align 4
  %call118 = call i8* @dirspell(i8* %88)
  store i8* %call118, i8** %temp2, align 4
  %89 = load i8*, i8** %temp2, align 4
  %tobool119 = icmp ne i8* %89, null
  br i1 %tobool119, label %if.then120, label %if.end124

if.then120:                                       ; preds = %if.then117
  %90 = load i8*, i8** %temp1, align 4
  call void @sh_xfree(i8* %90, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3341)
  %91 = load i8*, i8** %temp2, align 4
  store i8* %91, i8** %temp1, align 4
  %92 = load i8*, i8** %temp1, align 4
  %call121 = call i8* @sh_canonpath(i8* %92, i32 3)
  store i8* %call121, i8** %temp2, align 4
  %93 = load i8*, i8** %temp2, align 4
  %cmp122 = icmp ne i8* %93, null
  %conv123 = zext i1 %cmp122 to i32
  %94 = load i32, i32* %return_value, align 4
  %or = or i32 %94, %conv123
  store i32 %or, i32* %return_value, align 4
  br label %if.end124

if.end124:                                        ; preds = %if.then120, %if.then117
  br label %if.end125

if.end125:                                        ; preds = %if.end124, %land.lhs.true115, %land.lhs.true113, %if.then107
  %95 = load i8*, i8** %temp2, align 4
  %cmp126 = icmp eq i8* %95, null
  br i1 %cmp126, label %if.then128, label %if.end129

if.then128:                                       ; preds = %if.end125
  %96 = load i8*, i8** %temp1, align 4
  call void @sh_xfree(i8* %96, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3350)
  %97 = load i32, i32* %return_value, align 4
  store i32 %97, i32* %retval, align 4
  br label %return

if.end129:                                        ; preds = %if.end125
  %98 = load i8*, i8** %temp1, align 4
  %call130 = call i32 @strlen(i8* %98)
  store i32 %call130, i32* %len1, align 4
  %99 = load i8*, i8** %temp1, align 4
  %100 = load i32, i32* %len1, align 4
  %sub = sub nsw i32 %100, 1
  %arrayidx131 = getelementptr inbounds i8, i8* %99, i32 %sub
  %101 = load i8, i8* %arrayidx131, align 1
  %conv132 = sext i8 %101 to i32
  %cmp133 = icmp eq i32 %conv132, 47
  br i1 %cmp133, label %if.then135, label %if.end146

if.then135:                                       ; preds = %if.end129
  %102 = load i8*, i8** %temp2, align 4
  %call136 = call i32 @strlen(i8* %102)
  store i32 %call136, i32* %len2, align 4
  %103 = load i32, i32* %len2, align 4
  %cmp137 = icmp sgt i32 %103, 2
  br i1 %cmp137, label %if.then139, label %if.end145

if.then139:                                       ; preds = %if.then135
  %104 = load i8*, i8** %temp2, align 4
  %105 = load i32, i32* %len2, align 4
  %add140 = add nsw i32 %105, 2
  %call141 = call i8* @sh_xrealloc(i8* %104, i32 %add140, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3359)
  store i8* %call141, i8** %temp2, align 4
  %106 = load i8*, i8** %temp2, align 4
  %107 = load i32, i32* %len2, align 4
  %arrayidx142 = getelementptr inbounds i8, i8* %106, i32 %107
  store i8 47, i8* %arrayidx142, align 1
  %108 = load i8*, i8** %temp2, align 4
  %109 = load i32, i32* %len2, align 4
  %add143 = add nsw i32 %109, 1
  %arrayidx144 = getelementptr inbounds i8, i8* %108, i32 %add143
  store i8 0, i8* %arrayidx144, align 1
  br label %if.end145

if.end145:                                        ; preds = %if.then139, %if.then135
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %if.end129
  %110 = load i32, i32* @dircomplete_expand_relpath, align 4
  %tobool147 = icmp ne i32 %110, 0
  br i1 %tobool147, label %if.then173, label %lor.lhs.false148

lor.lhs.false148:                                 ; preds = %if.end146
  %111 = load i8*, i8** %local_dirname, align 4
  %arrayidx149 = getelementptr inbounds i8, i8* %111, i32 0
  %112 = load i8, i8* %arrayidx149, align 1
  %conv150 = sext i8 %112 to i32
  %cmp151 = icmp ne i32 %conv150, 47
  br i1 %cmp151, label %land.lhs.true153, label %if.end189

land.lhs.true153:                                 ; preds = %lor.lhs.false148
  %113 = load i8*, i8** %local_dirname, align 4
  %arrayidx154 = getelementptr inbounds i8, i8* %113, i32 0
  %114 = load i8, i8* %arrayidx154, align 1
  %conv155 = sext i8 %114 to i32
  %cmp156 = icmp ne i32 %conv155, 46
  br i1 %cmp156, label %land.lhs.true158, label %if.end189

land.lhs.true158:                                 ; preds = %land.lhs.true153
  %115 = load i8*, i8** %temp1, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %115, i32 0
  %116 = load i8, i8* %arrayidx159, align 1
  %conv160 = sext i8 %116 to i32
  %117 = load i8*, i8** %temp2, align 4
  %arrayidx161 = getelementptr inbounds i8, i8* %117, i32 0
  %118 = load i8, i8* %arrayidx161, align 1
  %conv162 = sext i8 %118 to i32
  %cmp163 = icmp eq i32 %conv160, %conv162
  br i1 %cmp163, label %land.rhs165, label %land.end169

land.rhs165:                                      ; preds = %land.lhs.true158
  %119 = load i8*, i8** %temp1, align 4
  %120 = load i8*, i8** %temp2, align 4
  %call166 = call i32 @strcmp(i8* %119, i8* %120)
  %cmp167 = icmp eq i32 %call166, 0
  br label %land.end169

land.end169:                                      ; preds = %land.rhs165, %land.lhs.true158
  %121 = phi i1 [ false, %land.lhs.true158 ], [ %cmp167, %land.rhs165 ]
  %land.ext170 = zext i1 %121 to i32
  %cmp171 = icmp eq i32 %land.ext170, 0
  br i1 %cmp171, label %if.then173, label %if.end189

if.then173:                                       ; preds = %land.end169, %if.end146
  %122 = load i8*, i8** %local_dirname, align 4
  %arrayidx174 = getelementptr inbounds i8, i8* %122, i32 0
  %123 = load i8, i8* %arrayidx174, align 1
  %conv175 = sext i8 %123 to i32
  %124 = load i8*, i8** %temp2, align 4
  %arrayidx176 = getelementptr inbounds i8, i8* %124, i32 0
  %125 = load i8, i8* %arrayidx176, align 1
  %conv177 = sext i8 %125 to i32
  %cmp178 = icmp eq i32 %conv175, %conv177
  br i1 %cmp178, label %land.rhs180, label %land.end184

land.rhs180:                                      ; preds = %if.then173
  %126 = load i8*, i8** %local_dirname, align 4
  %127 = load i8*, i8** %temp2, align 4
  %call181 = call i32 @strcmp(i8* %126, i8* %127)
  %cmp182 = icmp eq i32 %call181, 0
  br label %land.end184

land.end184:                                      ; preds = %land.rhs180, %if.then173
  %128 = phi i1 [ false, %if.then173 ], [ %cmp182, %land.rhs180 ]
  %land.ext185 = zext i1 %128 to i32
  %cmp186 = icmp eq i32 %land.ext185, 0
  %conv187 = zext i1 %cmp186 to i32
  %129 = load i32, i32* %return_value, align 4
  %or188 = or i32 %129, %conv187
  store i32 %or188, i32* %return_value, align 4
  br label %if.end189

if.end189:                                        ; preds = %land.end184, %land.end169, %land.lhs.true153, %lor.lhs.false148
  %130 = load i8*, i8** %local_dirname, align 4
  call void @sh_xfree(i8* %130, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3373)
  %131 = load i8*, i8** %temp2, align 4
  %132 = load i8**, i8*** %dirname.addr, align 4
  store i8* %131, i8** %132, align 4
  %133 = load i8*, i8** %temp1, align 4
  call void @sh_xfree(i8* %133, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3375)
  br label %if.end190

if.end190:                                        ; preds = %if.end189, %lor.lhs.false103, %if.end95
  %134 = load i32, i32* %return_value, align 4
  store i32 %134, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end190, %if.then128, %if.else76
  %135 = load i32, i32* %retval, align 4
  ret i32 %135
}

declare i32 @path_dot_or_dotdot(i8*) #1

declare %struct.variable** @all_visible_functions() #1

declare %struct.alias** @all_aliases() #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8** @shell_glob_filename(i8*) #1

declare i32 @executable_or_directory(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @maybe_restore_tilde(i8* %val, i8* %directory_part) #0 {
entry:
  %val.addr = alloca i8*, align 4
  %directory_part.addr = alloca i8*, align 4
  %save = alloca i32 (i8**)*, align 4
  %ret = alloca i8*, align 4
  store i8* %val, i8** %val.addr, align 4
  store i8* %directory_part, i8** %directory_part.addr, align 4
  %0 = load i32, i32* @dircomplete_expand, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i32 (i8**)* @save_directory_hook()
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 (i8**)* [ %call, %cond.true ], [ null, %cond.false ]
  store i32 (i8**)* %cond, i32 (i8**)** %save, align 4
  %1 = load i8*, i8** %val.addr, align 4
  %2 = load i8*, i8** %directory_part.addr, align 4
  %call1 = call i8* @restore_tilde(i8* %1, i8* %2)
  store i8* %call1, i8** %ret, align 4
  %3 = load i32 (i8**)*, i32 (i8**)** %save, align 4
  %tobool = icmp ne i32 (i8**)* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %4 = load i32 (i8**)*, i32 (i8**)** %save, align 4
  call void @restore_directory_hook(i32 (i8**)* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %5 = load i8*, i8** %ret, align 4
  ret i8* %5
}

declare i8* @extract_colon_unit(i8*, i32*) #1

declare i8* @sh_makepath(i8*, i8*, i32) #1

declare i8* @strpbrk(i8*, i8*) #1

declare i8* @sh_backslash_quote(i8*, i8*, i32) #1

declare i8* @rl_filename_completion_function(i8*, i32) #1

declare i32 @strncasecmp(i8*, i8*, i32) #1

declare i8* @strrchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @executable_completion(i8* %filename, i32 %searching_path) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %searching_path.addr = alloca i32, align 4
  %f = alloca i8*, align 4
  %r = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %searching_path, i32* %searching_path.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1781)
  %1 = load i8*, i8** %filename.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %1)
  store i8* %call2, i8** %f, align 4
  %call3 = call i32 @bash_directory_completion_hook(i8** %f)
  %2 = load i32, i32* %searching_path.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i8*, i8** %f, align 4
  %call4 = call i32 @executable_file(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i8*, i8** %f, align 4
  %call5 = call i32 @executable_or_directory(i8* %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call4, %cond.true ], [ %call5, %cond.false ]
  store i32 %cond, i32* %r, align 4
  %5 = load i8*, i8** %f, align 4
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 1785)
  %6 = load i32, i32* %r, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i8* @bash_servicename_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %value = alloca i8*, align 4
  %alist = alloca i8**, align 4
  %aentry = alloca i8*, align 4
  %afound = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2421)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i8*, i8** %text.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* @bash_servicename_completion_function.firstc, align 4
  %5 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %add = add i32 1, %call
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2424)
  %6 = load i8*, i8** %text.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %6)
  store i8* %call3, i8** @bash_servicename_completion_function.sname, align 4
  %7 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  %call4 = call i32 @strlen(i8* %7)
  store i32 %call4, i32* @bash_servicename_completion_function.snamelen, align 4
  call void @setservent(i32 0)
  br label %if.end5

if.end5:                                          ; preds = %do.end, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end42, %if.end5
  %call6 = call %struct.servent* @getservent()
  store %struct.servent* %call6, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %tobool7 = icmp ne %struct.servent* %call6, null
  br i1 %tobool7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %afound, align 4
  %8 = load i32, i32* @bash_servicename_completion_function.snamelen, align 4
  %cmp8 = icmp eq i32 %8, 0
  br i1 %cmp8, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %9 = load i32, i32* @bash_servicename_completion_function.snamelen, align 4
  %cmp10 = icmp eq i32 %9, 0
  br i1 %cmp10, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  br i1 true, label %if.then21, label %if.end22

cond.false:                                       ; preds = %lor.lhs.false
  %10 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx, align 1
  %conv12 = sext i8 %11 to i32
  %12 = load %struct.servent*, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %s_name = getelementptr inbounds %struct.servent, %struct.servent* %12, i32 0, i32 0
  %13 = load i8*, i8** %s_name, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %14 to i32
  %cmp15 = icmp eq i32 %conv12, %conv14
  br i1 %cmp15, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %cond.false
  %15 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  %16 = load %struct.servent*, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %s_name17 = getelementptr inbounds %struct.servent, %struct.servent* %16, i32 0, i32 0
  %17 = load i8*, i8** %s_name17, align 4
  %18 = load i32, i32* @bash_servicename_completion_function.snamelen, align 4
  %call18 = call i32 @strncmp(i8* %15, i8* %17, i32 %18)
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true, %cond.true, %while.body
  br label %while.end

if.end22:                                         ; preds = %land.lhs.true, %cond.false, %cond.true
  %19 = load %struct.servent*, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %s_aliases = getelementptr inbounds %struct.servent, %struct.servent* %19, i32 0, i32 1
  %20 = load i8**, i8*** %s_aliases, align 4
  store i8** %20, i8*** %alist, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end22
  %21 = load i8**, i8*** %alist, align 4
  %22 = load i8*, i8** %21, align 4
  %tobool23 = icmp ne i8* %22, null
  br i1 %tobool23, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load i8**, i8*** %alist, align 4
  %24 = load i8*, i8** %23, align 4
  store i8* %24, i8** %aentry, align 4
  %25 = load i32, i32* @bash_servicename_completion_function.snamelen, align 4
  %cmp24 = icmp eq i32 %25, 0
  br i1 %cmp24, label %cond.true26, label %cond.false27

cond.true26:                                      ; preds = %for.body
  br i1 true, label %if.then38, label %if.end39

cond.false27:                                     ; preds = %for.body
  %26 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %26, i32 0
  %27 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %27 to i32
  %28 = load i8*, i8** %aentry, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %28, i32 0
  %29 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %29 to i32
  %cmp32 = icmp eq i32 %conv29, %conv31
  br i1 %cmp32, label %land.lhs.true34, label %if.end39

land.lhs.true34:                                  ; preds = %cond.false27
  %30 = load i8*, i8** @bash_servicename_completion_function.sname, align 4
  %31 = load i8*, i8** %aentry, align 4
  %32 = load i32, i32* @bash_servicename_completion_function.snamelen, align 4
  %call35 = call i32 @strncmp(i8* %30, i8* %31, i32 %32)
  %cmp36 = icmp eq i32 %call35, 0
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %land.lhs.true34, %cond.true26
  store i32 1, i32* %afound, align 4
  br label %for.end

if.end39:                                         ; preds = %land.lhs.true34, %cond.false27, %cond.true26
  br label %for.inc

for.inc:                                          ; preds = %if.end39
  %33 = load i8**, i8*** %alist, align 4
  %incdec.ptr = getelementptr inbounds i8*, i8** %33, i32 1
  store i8** %incdec.ptr, i8*** %alist, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then38, %for.cond
  %34 = load i32, i32* %afound, align 4
  %tobool40 = icmp ne i32 %34, 0
  br i1 %tobool40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %for.end
  br label %while.end

if.end42:                                         ; preds = %for.end
  br label %while.cond

while.end:                                        ; preds = %if.then41, %if.then21, %while.cond
  %35 = load %struct.servent*, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %cmp43 = icmp eq %struct.servent* %35, null
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %while.end
  call void @endservent()
  store i8* null, i8** %retval, align 4
  br label %return

if.end46:                                         ; preds = %while.end
  %36 = load i32, i32* %afound, align 4
  %tobool47 = icmp ne i32 %36, 0
  br i1 %tobool47, label %cond.true48, label %cond.false53

cond.true48:                                      ; preds = %if.end46
  %37 = load i8*, i8** %aentry, align 4
  %call49 = call i32 @strlen(i8* %37)
  %add50 = add i32 1, %call49
  %call51 = call i8* @sh_xmalloc(i32 %add50, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2455)
  %38 = load i8*, i8** %aentry, align 4
  %call52 = call i8* @strcpy(i8* %call51, i8* %38)
  br label %cond.end

cond.false53:                                     ; preds = %if.end46
  %39 = load %struct.servent*, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %s_name54 = getelementptr inbounds %struct.servent, %struct.servent* %39, i32 0, i32 0
  %40 = load i8*, i8** %s_name54, align 4
  %call55 = call i32 @strlen(i8* %40)
  %add56 = add i32 1, %call55
  %call57 = call i8* @sh_xmalloc(i32 %add56, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2455)
  %41 = load %struct.servent*, %struct.servent** @bash_servicename_completion_function.srvent, align 4
  %s_name58 = getelementptr inbounds %struct.servent, %struct.servent* %41, i32 0, i32 0
  %42 = load i8*, i8** %s_name58, align 4
  %call59 = call i8* @strcpy(i8* %call57, i8* %42)
  br label %cond.end

cond.end:                                         ; preds = %cond.false53, %cond.true48
  %cond = phi i8* [ %call52, %cond.true48 ], [ %call59, %cond.false53 ]
  store i8* %cond, i8** %value, align 4
  %43 = load i8*, i8** %value, align 4
  store i8* %43, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then45
  %44 = load i8*, i8** %retval, align 4
  ret i8* %44
}

declare void @setservent(i32) #1

declare %struct.servent* @getservent() #1

declare void @endservent() #1

; Function Attrs: noinline nounwind
define i8* @bash_groupname_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %value = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8*, i8** @bash_groupname_completion_function.gname, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8*, i8** @bash_groupname_completion_function.gname, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2478)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 1, %call
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2479)
  %4 = load i8*, i8** %text.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %4)
  store i8* %call3, i8** @bash_groupname_completion_function.gname, align 4
  %5 = load i8*, i8** @bash_groupname_completion_function.gname, align 4
  %call4 = call i32 @strlen(i8* %5)
  store i32 %call4, i32* @bash_groupname_completion_function.gnamelen, align 4
  call void @setgrent()
  br label %if.end5

if.end5:                                          ; preds = %do.end, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end19, %if.end5
  %call6 = call %struct.group* @getgrent()
  store %struct.group* %call6, %struct.group** @bash_groupname_completion_function.grent, align 4
  %tobool7 = icmp ne %struct.group* %call6, null
  br i1 %tobool7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load i32, i32* @bash_groupname_completion_function.gnamelen, align 4
  %cmp8 = icmp eq i32 %6, 0
  br i1 %cmp8, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %7 = load i32, i32* @bash_groupname_completion_function.gnamelen, align 4
  %cmp9 = icmp eq i32 %7, 0
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  br i1 true, label %if.then18, label %if.end19

cond.false:                                       ; preds = %lor.lhs.false
  %8 = load i8*, i8** @bash_groupname_completion_function.gname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %9 to i32
  %10 = load %struct.group*, %struct.group** @bash_groupname_completion_function.grent, align 4
  %gr_name = getelementptr inbounds %struct.group, %struct.group* %10, i32 0, i32 0
  %11 = load i8*, i8** %gr_name, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %12 to i32
  %cmp12 = icmp eq i32 %conv, %conv11
  br i1 %cmp12, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %cond.false
  %13 = load i8*, i8** @bash_groupname_completion_function.gname, align 4
  %14 = load %struct.group*, %struct.group** @bash_groupname_completion_function.grent, align 4
  %gr_name14 = getelementptr inbounds %struct.group, %struct.group* %14, i32 0, i32 0
  %15 = load i8*, i8** %gr_name14, align 4
  %16 = load i32, i32* @bash_groupname_completion_function.gnamelen, align 4
  %call15 = call i32 @strncmp(i8* %13, i8* %15, i32 %16)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %land.lhs.true, %cond.true, %while.body
  br label %while.end

if.end19:                                         ; preds = %land.lhs.true, %cond.false, %cond.true
  br label %while.cond

while.end:                                        ; preds = %if.then18, %while.cond
  %17 = load %struct.group*, %struct.group** @bash_groupname_completion_function.grent, align 4
  %cmp20 = icmp eq %struct.group* %17, null
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %while.end
  call void @endgrent()
  store i8* null, i8** %retval, align 4
  br label %return

if.end23:                                         ; preds = %while.end
  %18 = load %struct.group*, %struct.group** @bash_groupname_completion_function.grent, align 4
  %gr_name24 = getelementptr inbounds %struct.group, %struct.group* %18, i32 0, i32 0
  %19 = load i8*, i8** %gr_name24, align 4
  %call25 = call i32 @strlen(i8* %19)
  %add26 = add i32 1, %call25
  %call27 = call i8* @sh_xmalloc(i32 %add26, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2497)
  %20 = load %struct.group*, %struct.group** @bash_groupname_completion_function.grent, align 4
  %gr_name28 = getelementptr inbounds %struct.group, %struct.group* %20, i32 0, i32 0
  %21 = load i8*, i8** %gr_name28, align 4
  %call29 = call i8* @strcpy(i8* %call27, i8* %21)
  store i8* %call29, i8** %value, align 4
  %22 = load i8*, i8** %value, align 4
  store i8* %22, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end23, %if.then22
  %23 = load i8*, i8** %retval, align 4
  ret i8* %23
}

declare void @setgrent() #1

declare %struct.group* @getgrent() #1

declare void @endgrent() #1

; Function Attrs: noinline nounwind
define i32 @print_unix_command_map() #0 {
entry:
  %save = alloca %struct._keymap_entry*, align 4
  %call = call %struct._keymap_entry* @rl_get_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** %save, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @cmd_xmap, align 4
  call void @rl_set_keymap(%struct._keymap_entry* %0)
  call void @rl_macro_dumper(i32 1)
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %save, align 4
  call void @rl_set_keymap(%struct._keymap_entry* %1)
  ret i32 0
}

declare %struct._keymap_entry* @rl_get_keymap() #1

declare void @rl_set_keymap(%struct._keymap_entry*) #1

declare void @rl_macro_dumper(i32) #1

; Function Attrs: noinline nounwind
define i32 @bind_keyseq_to_unix_command(i8* %line) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %kmap = alloca %struct._keymap_entry*, align 4
  %kseq = alloca i8*, align 4
  %value = alloca i8*, align 4
  %i = alloca i32, align 4
  %kstart = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @cmd_xmap, align 4
  %cmp = icmp eq %struct._keymap_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @init_unix_command_map()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call %struct._keymap_entry* @rl_get_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** %kmap, align 4
  %1 = load i8*, i8** %line.addr, align 4
  %call1 = call i32 @isolate_sequence(i8* %1, i32 0, i32 1, i32* %kstart)
  store i32 %call1, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i8*, i8** %line.addr, align 4
  %4 = load i32, i32* %kstart, align 4
  %5 = load i32, i32* %i, align 4
  %call5 = call i8* @substring(i8* %3, i32 %4, i32 %5)
  store i8* %call5, i8** %kseq, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i8*, i8** %line.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %9 = load i8*, i8** %line.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %11 to i32
  %cmp8 = icmp ne i32 %conv7, 58
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %12 = phi i1 [ false, %for.cond ], [ %cmp8, %land.rhs ]
  br i1 %12, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %14 = load i8*, i8** %line.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %16 to i32
  %cmp12 = icmp ne i32 %conv11, 58
  br i1 %cmp12, label %if.then14, label %if.end19

if.then14:                                        ; preds = %for.end
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.42, i32 0, i32 0))
  %17 = load i8*, i8** %line.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call15, i8* %17)
  br label %do.body

do.body:                                          ; preds = %if.then14
  %18 = load i8*, i8** %kseq, align 4
  %tobool16 = icmp ne i8* %18, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body
  %19 = load i8*, i8** %kseq, align 4
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4255)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end18
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %for.end
  %20 = load i8*, i8** %line.addr, align 4
  %21 = load i32, i32* %i, align 4
  %add = add nsw i32 %21, 1
  %call20 = call i32 @isolate_sequence(i8* %20, i32 %add, i32 0, i32* %kstart)
  store i32 %call20, i32* %i, align 4
  %22 = load i32, i32* %i, align 4
  %cmp21 = icmp slt i32 %22, 0
  br i1 %cmp21, label %if.then23, label %if.end29

if.then23:                                        ; preds = %if.end19
  br label %do.body24

do.body24:                                        ; preds = %if.then23
  %23 = load i8*, i8** %kseq, align 4
  %tobool25 = icmp ne i8* %23, null
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %do.body24
  %24 = load i8*, i8** %kseq, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4262)
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %do.body24
  br label %do.end28

do.end28:                                         ; preds = %if.end27
  store i32 -1, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.end19
  %25 = load i8*, i8** %line.addr, align 4
  %26 = load i32, i32* %kstart, align 4
  %27 = load i32, i32* %i, align 4
  %call30 = call i8* @substring(i8* %25, i32 %26, i32 %27)
  store i8* %call30, i8** %value, align 4
  %28 = load i8*, i8** %kseq, align 4
  %29 = load i8*, i8** %value, align 4
  %30 = load %struct._keymap_entry*, %struct._keymap_entry** @cmd_xmap, align 4
  %call31 = call i32 @rl_generic_bind(i32 2, i8* %28, i8* %29, %struct._keymap_entry* %30)
  %31 = load i8*, i8** %kseq, align 4
  %32 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  %call32 = call i32 @rl_bind_keyseq_in_map(i8* %31, i32 (i32, i32)* @bash_execute_unix_command, %struct._keymap_entry* %32)
  %33 = load i8*, i8** %kseq, align 4
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4276)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %do.end28, %do.end, %if.then3
  %34 = load i32, i32* %retval, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind
define internal void @init_unix_command_map() #0 {
entry:
  %call = call %struct._keymap_entry* @rl_make_bare_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** @cmd_xmap, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @isolate_sequence(i8* %string, i32 %ind, i32 %need_dquote, i32* %startp) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %need_dquote.addr = alloca i32, align 4
  %startp.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %passc = alloca i32, align 4
  %delim = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store i32 %need_dquote, i32* %need_dquote.addr, align 4
  store i32* %startp, i32** %startp.addr, align 4
  %0 = load i32, i32* %ind.addr, align 4
  store i32 %0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv2, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %cmp6 = icmp eq i32 %conv5, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %10 = phi i1 [ true, %land.rhs ], [ %cmp6, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.cond
  %11 = phi i1 [ false, %for.cond ], [ %10, %lor.end ]
  br i1 %11, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %13 = load i32, i32* %need_dquote.addr, align 4
  %tobool8 = icmp ne i32 %13, 0
  br i1 %tobool8, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.end
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %16 to i32
  %cmp11 = icmp ne i32 %conv10, 34
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.70, i32 0, i32 0))
  %17 = load i8*, i8** %string.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call, i8* %17)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.end
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %20 to i32
  %cmp15 = icmp eq i32 %conv14, 34
  br i1 %cmp15, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %21 = load i8*, i8** %string.addr, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %23 to i32
  %cmp19 = icmp eq i32 %conv18, 39
  br i1 %cmp19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.end
  %24 = load i8*, i8** %string.addr, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %26 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv22, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %delim, align 4
  %27 = load i32*, i32** %startp.addr, align 4
  %tobool23 = icmp ne i32* %27, null
  br i1 %tobool23, label %if.then24, label %if.end31

if.then24:                                        ; preds = %cond.end
  %28 = load i32, i32* %delim, align 4
  %tobool25 = icmp ne i32 %28, 0
  br i1 %tobool25, label %cond.true26, label %cond.false28

cond.true26:                                      ; preds = %if.then24
  %29 = load i32, i32* %i, align 4
  %inc27 = add nsw i32 %29, 1
  store i32 %inc27, i32* %i, align 4
  br label %cond.end29

cond.false28:                                     ; preds = %if.then24
  %30 = load i32, i32* %i, align 4
  br label %cond.end29

cond.end29:                                       ; preds = %cond.false28, %cond.true26
  %cond30 = phi i32 [ %inc27, %cond.true26 ], [ %30, %cond.false28 ]
  %31 = load i32*, i32** %startp.addr, align 4
  store i32 %cond30, i32* %31, align 4
  br label %if.end31

if.end31:                                         ; preds = %cond.end29, %cond.end
  store i32 0, i32* %passc, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc49, %if.end31
  %32 = load i8*, i8** %string.addr, align 4
  %33 = load i32, i32* %i, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %34 to i32
  store i32 %conv34, i32* %c, align 4
  %tobool35 = icmp ne i32 %conv34, 0
  br i1 %tobool35, label %for.body36, label %for.end51

for.body36:                                       ; preds = %for.cond32
  %35 = load i32, i32* %passc, align 4
  %tobool37 = icmp ne i32 %35, 0
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %for.body36
  store i32 0, i32* %passc, align 4
  br label %for.inc49

if.end39:                                         ; preds = %for.body36
  %36 = load i32, i32* %c, align 4
  %cmp40 = icmp eq i32 %36, 92
  br i1 %cmp40, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.end39
  %37 = load i32, i32* %passc, align 4
  %inc43 = add nsw i32 %37, 1
  store i32 %inc43, i32* %passc, align 4
  br label %for.inc49

if.end44:                                         ; preds = %if.end39
  %38 = load i32, i32* %c, align 4
  %39 = load i32, i32* %delim, align 4
  %cmp45 = icmp eq i32 %38, %39
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  br label %for.end51

if.end48:                                         ; preds = %if.end44
  br label %for.inc49

for.inc49:                                        ; preds = %if.end48, %if.then42, %if.then38
  %40 = load i32, i32* %i, align 4
  %inc50 = add nsw i32 %40, 1
  store i32 %inc50, i32* %i, align 4
  br label %for.cond32

for.end51:                                        ; preds = %if.then47, %for.cond32
  %41 = load i32, i32* %delim, align 4
  %tobool52 = icmp ne i32 %41, 0
  br i1 %tobool52, label %land.lhs.true53, label %if.end60

land.lhs.true53:                                  ; preds = %for.end51
  %42 = load i8*, i8** %string.addr, align 4
  %43 = load i32, i32* %i, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8, i8* %arrayidx54, align 1
  %conv55 = sext i8 %44 to i32
  %45 = load i32, i32* %delim, align 4
  %cmp56 = icmp ne i32 %conv55, %45
  br i1 %cmp56, label %if.then58, label %if.end60

if.then58:                                        ; preds = %land.lhs.true53
  %call59 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.71, i32 0, i32 0))
  %46 = load i32, i32* %delim, align 4
  %47 = load i8*, i8** %string.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call59, i32 %46, i8* %47)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end60:                                         ; preds = %land.lhs.true53, %for.end51
  %48 = load i32, i32* %i, align 4
  store i32 %48, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end60, %if.then58, %if.then
  %49 = load i32, i32* %retval, align 4
  ret i32 %49
}

declare i8* @substring(i8*, i32, i32) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @rl_generic_bind(i32, i8*, i8*, %struct._keymap_entry*) #1

; Function Attrs: noinline nounwind
define internal i32 @bash_execute_unix_command(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %ckmap = alloca %struct._keymap_entry*, align 4
  %xkmap = alloca %struct._keymap_entry*, align 4
  %func = alloca i32 (i32, i32)*, align 4
  %type = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  %mi = alloca i64, align 8
  %ps = alloca %struct._sh_parser_state_t, align 4
  %cmd = alloca i8*, align 4
  %value = alloca i8*, align 4
  %l = alloca i8*, align 4
  %l1 = alloca i8*, align 4
  %ce = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  %ibuf = alloca [12 x i8], align 1
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i8*, i8** @rl_executing_keyseq, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @cmd_xmap, align 4
  %call = call i32 (i32, i32)* @rl_function_of_keyseq(i8* %0, %struct._keymap_entry* %1, i32* %type)
  %2 = bitcast i32 (i32, i32)* %call to i8*
  store i8* %2, i8** %cmd, align 4
  %3 = load i8*, i8** %cmd, align 4
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load i32, i32* %type, align 4
  %cmp1 = icmp ne i32 %4, 2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call2 = call i32 @rl_crlf()
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.72, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call3)
  %call4 = call i32 @rl_forced_update_display()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %call5 = call i8* @rl_get_termcap(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.73, i32 0, i32 0))
  store i8* %call5, i8** %ce, align 4
  %5 = load i8*, i8** %ce, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %call7 = call i32 @rl_clear_visible_line()
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call8 = call i32 @fflush(%struct._IO_FILE* %6)
  br label %if.end10

if.else:                                          ; preds = %if.end
  %call9 = call i32 @rl_crlf()
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then6
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %call11 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.74, i32 0, i32 0), i8* %7, i32 0)
  store %struct.variable* %call11, %struct.variable** %v, align 4
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool12 = icmp ne %struct.variable* %8, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes, align 4
  %or = or i32 %10, 1
  store i32 %or, i32* %attributes, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end10
  %11 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool15 = icmp ne %struct.variable* %11, null
  br i1 %tobool15, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end14
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  %value16 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 1
  %13 = load i8*, i8** %value16, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %13, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %l, align 4
  %14 = load i32, i32* @rl_point, align 4
  %conv = sext i32 %14 to i64
  %arraydecay = getelementptr inbounds [12 x i8], [12 x i8]* %ibuf, i32 0, i32 0
  %call17 = call i8* @inttostr(i64 %conv, i8* %arraydecay, i32 12)
  store i8* %call17, i8** %value, align 4
  %15 = load i8*, i8** %value, align 4
  %call18 = call %struct.variable* @bind_int_variable(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.75, i32 0, i32 0), i8* %15)
  store %struct.variable* %call18, %struct.variable** %v, align 4
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool19 = icmp ne %struct.variable* %16, null
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %cond.end
  %17 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes21 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes21, align 4
  %or22 = or i32 %18, 1
  store i32 %or22, i32* %attributes21, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %cond.end
  store i32 1, i32* @array_needs_making, align 4
  %call24 = call %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t* %ps)
  %19 = load i8*, i8** %cmd, align 4
  %call25 = call i32 @parse_and_execute(i8* %19, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.76, i32 0, i32 0), i32 12)
  store i32 %call25, i32* %r, align 4
  call void @restore_parser_state(%struct._sh_parser_state_t* %ps)
  %call26 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.74, i32 0, i32 0))
  store %struct.variable* %call26, %struct.variable** %v, align 4
  %20 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool27 = icmp ne %struct.variable* %20, null
  br i1 %tobool27, label %cond.true28, label %cond.false30

cond.true28:                                      ; preds = %if.end23
  %21 = load %struct.variable*, %struct.variable** %v, align 4
  %value29 = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 1
  %22 = load i8*, i8** %value29, align 4
  br label %cond.end31

cond.false30:                                     ; preds = %if.end23
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false30, %cond.true28
  %cond32 = phi i8* [ %22, %cond.true28 ], [ null, %cond.false30 ]
  store i8* %cond32, i8** %l1, align 4
  %23 = load i8*, i8** %l1, align 4
  %24 = load i8*, i8** %l, align 4
  %cmp33 = icmp ne i8* %23, %24
  br i1 %cmp33, label %if.then35, label %if.end37

if.then35:                                        ; preds = %cond.end31
  %25 = load %struct.variable*, %struct.variable** %v, align 4
  %value36 = getelementptr inbounds %struct.variable, %struct.variable* %25, i32 0, i32 1
  %26 = load i8*, i8** %value36, align 4
  call void @maybe_make_readline_line(i8* %26)
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %cond.end31
  %call38 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.75, i32 0, i32 0))
  store %struct.variable* %call38, %struct.variable** %v, align 4
  %27 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool39 = icmp ne %struct.variable* %27, null
  br i1 %tobool39, label %land.lhs.true, label %if.end58

land.lhs.true:                                    ; preds = %if.end37
  %28 = load %struct.variable*, %struct.variable** %v, align 4
  %value40 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 1
  %29 = load i8*, i8** %value40, align 4
  %call41 = call i32 @legal_number(i8* %29, i64* %mi)
  %tobool42 = icmp ne i32 %call41, 0
  br i1 %tobool42, label %if.then43, label %if.end58

if.then43:                                        ; preds = %land.lhs.true
  %30 = load i64, i64* %mi, align 8
  %conv44 = trunc i64 %30 to i32
  store i32 %conv44, i32* %i, align 4
  %31 = load i32, i32* %i, align 4
  %32 = load i32, i32* @rl_point, align 4
  %cmp45 = icmp ne i32 %31, %32
  br i1 %cmp45, label %if.then47, label %if.end57

if.then47:                                        ; preds = %if.then43
  %33 = load i32, i32* %i, align 4
  store i32 %33, i32* @rl_point, align 4
  %34 = load i32, i32* @rl_point, align 4
  %35 = load i32, i32* @rl_end, align 4
  %cmp48 = icmp sgt i32 %34, %35
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.then47
  %36 = load i32, i32* @rl_end, align 4
  store i32 %36, i32* @rl_point, align 4
  br label %if.end56

if.else51:                                        ; preds = %if.then47
  %37 = load i32, i32* @rl_point, align 4
  %cmp52 = icmp slt i32 %37, 0
  br i1 %cmp52, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.else51
  store i32 0, i32* @rl_point, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %if.else51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then50
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then43
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %land.lhs.true, %if.end37
  %call59 = call i32 @check_unbind_variable(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.74, i32 0, i32 0))
  %call60 = call i32 @check_unbind_variable(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.75, i32 0, i32 0))
  store i32 1, i32* @array_needs_making, align 4
  %38 = load i8*, i8** %ce, align 4
  %tobool61 = icmp ne i8* %38, null
  br i1 %tobool61, label %land.lhs.true62, label %if.else66

land.lhs.true62:                                  ; preds = %if.end58
  %39 = load i32, i32* %r, align 4
  %cmp63 = icmp ne i32 %39, 124
  br i1 %cmp63, label %if.then65, label %if.else66

if.then65:                                        ; preds = %land.lhs.true62
  call void @rl_redraw_prompt_last_line()
  br label %if.end68

if.else66:                                        ; preds = %land.lhs.true62, %if.end58
  %call67 = call i32 @rl_forced_update_display()
  br label %if.end68

if.end68:                                         ; preds = %if.else66, %if.then65
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end68, %if.then
  %40 = load i32, i32* %retval, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind
define i8** @bash_directory_completion_matches(i8* %text) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %m1 = alloca i8**, align 4
  %dfn = alloca i8*, align 4
  %qc = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i32, i32* @rl_dispatching, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @rl_completion_quote_character, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %qc, align 4
  %2 = load i32, i32* @rl_dispatching, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i32, i32* @rl_completion_found_quote, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i32, i32* %qc, align 4
  %call = call i8* @bash_dequote_filename(i8* %4, i32 %5)
  store i8* %call, i8** %dfn, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %cond.end
  %6 = load i8*, i8** %text.addr, align 4
  store i8* %6, i8** %dfn, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i8*, i8** %dfn, align 4
  %call2 = call i8** @rl_completion_matches(i8* %7, i8* (i8*, i32)* @rl_filename_completion_function)
  store i8** %call2, i8*** %m1, align 4
  %8 = load i8*, i8** %dfn, align 4
  %9 = load i8*, i8** %text.addr, align 4
  %cmp3 = icmp ne i8* %8, %9
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %10 = load i8*, i8** %dfn, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 4301)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %11 = load i8**, i8*** %m1, align 4
  %cmp6 = icmp eq i8** %11, null
  br i1 %cmp6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %12 = load i8**, i8*** %m1, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %12, i32 0
  %13 = load i8*, i8** %arrayidx, align 4
  %cmp7 = icmp eq i8* %13, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end5
  %14 = load i8**, i8*** %m1, align 4
  store i8** %14, i8*** %retval, align 4
  br label %return

if.end9:                                          ; preds = %lor.lhs.false
  %15 = load i8**, i8*** %m1, align 4
  %call10 = call i32 @bash_ignore_filenames(i8** %15)
  %16 = load i8**, i8*** %m1, align 4
  store i8** %16, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then8
  %17 = load i8**, i8*** %retval, align 4
  ret i8** %17
}

; Function Attrs: noinline nounwind
define i8* @bash_dequote_text(i8* %text) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %dtxt = alloca i8*, align 4
  %qc = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 34
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8*, i8** %text.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 39
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %4 = load i8*, i8** %text.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv7, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %qc, align 4
  %6 = load i8*, i8** %text.addr, align 4
  %7 = load i32, i32* %qc, align 4
  %call = call i8* @bash_dequote_filename(i8* %6, i32 %7)
  store i8* %call, i8** %dtxt, align 4
  %8 = load i8*, i8** %dtxt, align 4
  ret i8* %8
}

declare i32 @rl_insert_text(i8*) #1

declare i32 @rl_crlf() #1

declare void @show_shell_version(i32) #1

declare i32 @putc(i32, %struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @rl_on_new_line() #1

declare void @rl_redisplay() #1

; Function Attrs: noinline nounwind
define internal void @snarf_hosts_from_file(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %file = alloca %struct._IO_FILE*, align 4
  %temp = alloca i8*, align 4
  %buffer = alloca [256 x i8], align 1
  %name = alloca [256 x i8], align 1
  %i = alloca i32, align 4
  %start = alloca i32, align 4
  %incfile = alloca i8*, align 4
  %t = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.49, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 4
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.end, %for.end83, %if.then30, %if.end
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 0
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 4
  %call1 = call i8* @fgets(i8* %arraydecay, i32 255, %struct._IO_FILE* %2)
  store i8* %call1, i8** %temp, align 4
  %tobool = icmp ne i8* %call1, null
  br i1 %tobool, label %while.body, label %while.end219

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %5
  %6 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 13
  br i1 %cmp5, label %lor.end20, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.rhs
  %7 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %7
  %8 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %8 to i32
  %cmp9 = icmp eq i32 %conv8, 10
  br i1 %cmp9, label %lor.end20, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %9 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %9
  %10 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %10 to i32
  %cmp13 = icmp eq i32 %conv12, 32
  br i1 %cmp13, label %lor.end, label %lor.rhs15

lor.rhs15:                                        ; preds = %lor.rhs
  %11 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %11
  %12 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %12 to i32
  %cmp18 = icmp eq i32 %conv17, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs15, %lor.rhs
  %13 = phi i1 [ true, %lor.rhs ], [ %cmp18, %lor.rhs15 ]
  br label %lor.end20

lor.end20:                                        ; preds = %lor.end, %lor.lhs.false, %land.rhs
  %14 = phi i1 [ true, %lor.lhs.false ], [ true, %land.rhs ], [ %13, %lor.end ]
  br label %land.end

land.end:                                         ; preds = %lor.end20, %for.cond
  %15 = phi i1 [ false, %for.cond ], [ %14, %lor.end20 ]
  br i1 %15, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %17 = load i32, i32* %i, align 4
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %17
  %18 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %18 to i32
  %cmp23 = icmp eq i32 %conv22, 0
  br i1 %cmp23, label %if.then30, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %for.end
  %19 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %19
  %20 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %20 to i32
  %cmp28 = icmp eq i32 %conv27, 35
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %lor.lhs.false25, %for.end
  br label %while.cond

if.end31:                                         ; preds = %lor.lhs.false25
  %arraydecay32 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 0
  %21 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay32, i32 %21
  %call33 = call i32 @strncmp(i8* %add.ptr, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.50, i32 0, i32 0), i32 9)
  %cmp34 = icmp eq i32 %call33, 0
  br i1 %cmp34, label %if.then36, label %if.end84

if.then36:                                        ; preds = %if.end31
  %arraydecay37 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 0
  %22 = load i32, i32* %i, align 4
  %add.ptr38 = getelementptr inbounds i8, i8* %arraydecay37, i32 %22
  %add.ptr39 = getelementptr inbounds i8, i8* %add.ptr38, i32 9
  store i8* %add.ptr39, i8** %incfile, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc54, %if.then36
  %23 = load i8*, i8** %incfile, align 4
  %24 = load i8, i8* %23, align 1
  %conv41 = sext i8 %24 to i32
  %tobool42 = icmp ne i32 %conv41, 0
  br i1 %tobool42, label %land.rhs43, label %land.end52

land.rhs43:                                       ; preds = %for.cond40
  %25 = load i8*, i8** %incfile, align 4
  %26 = load i8, i8* %25, align 1
  %conv44 = sext i8 %26 to i32
  %cmp45 = icmp eq i32 %conv44, 32
  br i1 %cmp45, label %lor.end51, label %lor.rhs47

lor.rhs47:                                        ; preds = %land.rhs43
  %27 = load i8*, i8** %incfile, align 4
  %28 = load i8, i8* %27, align 1
  %conv48 = sext i8 %28 to i32
  %cmp49 = icmp eq i32 %conv48, 9
  br label %lor.end51

lor.end51:                                        ; preds = %lor.rhs47, %land.rhs43
  %29 = phi i1 [ true, %land.rhs43 ], [ %cmp49, %lor.rhs47 ]
  br label %land.end52

land.end52:                                       ; preds = %lor.end51, %for.cond40
  %30 = phi i1 [ false, %for.cond40 ], [ %29, %lor.end51 ]
  br i1 %30, label %for.body53, label %for.end55

for.body53:                                       ; preds = %land.end52
  br label %for.inc54

for.inc54:                                        ; preds = %for.body53
  %31 = load i8*, i8** %incfile, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr, i8** %incfile, align 4
  br label %for.cond40

for.end55:                                        ; preds = %land.end52
  %32 = load i8*, i8** %incfile, align 4
  store i8* %32, i8** %t, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc81, %for.end55
  %33 = load i8*, i8** %t, align 4
  %34 = load i8, i8* %33, align 1
  %conv57 = sext i8 %34 to i32
  %tobool58 = icmp ne i32 %conv57, 0
  br i1 %tobool58, label %land.rhs59, label %land.end79

land.rhs59:                                       ; preds = %for.cond56
  %35 = load i8*, i8** %t, align 4
  %36 = load i8, i8* %35, align 1
  %conv60 = sext i8 %36 to i32
  %cmp61 = icmp eq i32 %conv60, 13
  br i1 %cmp61, label %lor.end76, label %lor.lhs.false63

lor.lhs.false63:                                  ; preds = %land.rhs59
  %37 = load i8*, i8** %t, align 4
  %38 = load i8, i8* %37, align 1
  %conv64 = sext i8 %38 to i32
  %cmp65 = icmp eq i32 %conv64, 10
  br i1 %cmp65, label %lor.end76, label %lor.rhs67

lor.rhs67:                                        ; preds = %lor.lhs.false63
  %39 = load i8*, i8** %t, align 4
  %40 = load i8, i8* %39, align 1
  %conv68 = sext i8 %40 to i32
  %cmp69 = icmp eq i32 %conv68, 32
  br i1 %cmp69, label %lor.end75, label %lor.rhs71

lor.rhs71:                                        ; preds = %lor.rhs67
  %41 = load i8*, i8** %t, align 4
  %42 = load i8, i8* %41, align 1
  %conv72 = sext i8 %42 to i32
  %cmp73 = icmp eq i32 %conv72, 9
  br label %lor.end75

lor.end75:                                        ; preds = %lor.rhs71, %lor.rhs67
  %43 = phi i1 [ true, %lor.rhs67 ], [ %cmp73, %lor.rhs71 ]
  br label %lor.end76

lor.end76:                                        ; preds = %lor.end75, %lor.lhs.false63, %land.rhs59
  %44 = phi i1 [ true, %lor.lhs.false63 ], [ true, %land.rhs59 ], [ %43, %lor.end75 ]
  %lor.ext = zext i1 %44 to i32
  %cmp77 = icmp eq i32 %lor.ext, 0
  br label %land.end79

land.end79:                                       ; preds = %lor.end76, %for.cond56
  %45 = phi i1 [ false, %for.cond56 ], [ %cmp77, %lor.end76 ]
  br i1 %45, label %for.body80, label %for.end83

for.body80:                                       ; preds = %land.end79
  br label %for.inc81

for.inc81:                                        ; preds = %for.body80
  %46 = load i8*, i8** %t, align 4
  %incdec.ptr82 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr82, i8** %t, align 4
  br label %for.cond56

for.end83:                                        ; preds = %land.end79
  %47 = load i8*, i8** %t, align 4
  store i8 0, i8* %47, align 1
  %48 = load i8*, i8** %incfile, align 4
  call void @snarf_hosts_from_file(i8* %48)
  br label %while.cond

if.end84:                                         ; preds = %if.end31
  %49 = load i32, i32* %i, align 4
  %arrayidx85 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %49
  %50 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %50 to i32
  %cmp87 = icmp sge i32 %conv86, 48
  br i1 %cmp87, label %land.lhs.true, label %if.end129

land.lhs.true:                                    ; preds = %if.end84
  %51 = load i32, i32* %i, align 4
  %arrayidx89 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %51
  %52 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %52 to i32
  %cmp91 = icmp sle i32 %conv90, 57
  br i1 %cmp91, label %if.then93, label %if.end129

if.then93:                                        ; preds = %land.lhs.true
  br label %for.cond94

for.cond94:                                       ; preds = %for.inc126, %if.then93
  %53 = load i32, i32* %i, align 4
  %arrayidx95 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %53
  %54 = load i8, i8* %arrayidx95, align 1
  %conv96 = sext i8 %54 to i32
  %tobool97 = icmp ne i32 %conv96, 0
  br i1 %tobool97, label %land.rhs98, label %land.end124

land.rhs98:                                       ; preds = %for.cond94
  %55 = load i32, i32* %i, align 4
  %arrayidx99 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %55
  %56 = load i8, i8* %arrayidx99, align 1
  %conv100 = sext i8 %56 to i32
  %cmp101 = icmp eq i32 %conv100, 13
  br i1 %cmp101, label %lor.end120, label %lor.lhs.false103

lor.lhs.false103:                                 ; preds = %land.rhs98
  %57 = load i32, i32* %i, align 4
  %arrayidx104 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %57
  %58 = load i8, i8* %arrayidx104, align 1
  %conv105 = sext i8 %58 to i32
  %cmp106 = icmp eq i32 %conv105, 10
  br i1 %cmp106, label %lor.end120, label %lor.rhs108

lor.rhs108:                                       ; preds = %lor.lhs.false103
  %59 = load i32, i32* %i, align 4
  %arrayidx109 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %59
  %60 = load i8, i8* %arrayidx109, align 1
  %conv110 = sext i8 %60 to i32
  %cmp111 = icmp eq i32 %conv110, 32
  br i1 %cmp111, label %lor.end118, label %lor.rhs113

lor.rhs113:                                       ; preds = %lor.rhs108
  %61 = load i32, i32* %i, align 4
  %arrayidx114 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %61
  %62 = load i8, i8* %arrayidx114, align 1
  %conv115 = sext i8 %62 to i32
  %cmp116 = icmp eq i32 %conv115, 9
  br label %lor.end118

lor.end118:                                       ; preds = %lor.rhs113, %lor.rhs108
  %63 = phi i1 [ true, %lor.rhs108 ], [ %cmp116, %lor.rhs113 ]
  br label %lor.end120

lor.end120:                                       ; preds = %lor.end118, %lor.lhs.false103, %land.rhs98
  %64 = phi i1 [ true, %lor.lhs.false103 ], [ true, %land.rhs98 ], [ %63, %lor.end118 ]
  %lor.ext121 = zext i1 %64 to i32
  %cmp122 = icmp eq i32 %lor.ext121, 0
  br label %land.end124

land.end124:                                      ; preds = %lor.end120, %for.cond94
  %65 = phi i1 [ false, %for.cond94 ], [ %cmp122, %lor.end120 ]
  br i1 %65, label %for.body125, label %for.end128

for.body125:                                      ; preds = %land.end124
  br label %for.inc126

for.inc126:                                       ; preds = %for.body125
  %66 = load i32, i32* %i, align 4
  %inc127 = add nsw i32 %66, 1
  store i32 %inc127, i32* %i, align 4
  br label %for.cond94

for.end128:                                       ; preds = %land.end124
  br label %if.end129

if.end129:                                        ; preds = %for.end128, %land.lhs.true, %if.end84
  br label %while.cond130

while.cond130:                                    ; preds = %if.end211, %if.then210, %if.end129
  %67 = load i32, i32* %i, align 4
  %arrayidx131 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %67
  %68 = load i8, i8* %arrayidx131, align 1
  %tobool132 = icmp ne i8 %68, 0
  br i1 %tobool132, label %while.body133, label %while.end

while.body133:                                    ; preds = %while.cond130
  br label %for.cond134

for.cond134:                                      ; preds = %for.inc159, %while.body133
  %69 = load i32, i32* %i, align 4
  %arrayidx135 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %69
  %70 = load i8, i8* %arrayidx135, align 1
  %conv136 = sext i8 %70 to i32
  %cmp137 = icmp eq i32 %conv136, 13
  br i1 %cmp137, label %lor.end156, label %lor.lhs.false139

lor.lhs.false139:                                 ; preds = %for.cond134
  %71 = load i32, i32* %i, align 4
  %arrayidx140 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %71
  %72 = load i8, i8* %arrayidx140, align 1
  %conv141 = sext i8 %72 to i32
  %cmp142 = icmp eq i32 %conv141, 10
  br i1 %cmp142, label %lor.end156, label %lor.rhs144

lor.rhs144:                                       ; preds = %lor.lhs.false139
  %73 = load i32, i32* %i, align 4
  %arrayidx145 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %73
  %74 = load i8, i8* %arrayidx145, align 1
  %conv146 = sext i8 %74 to i32
  %cmp147 = icmp eq i32 %conv146, 32
  br i1 %cmp147, label %lor.end154, label %lor.rhs149

lor.rhs149:                                       ; preds = %lor.rhs144
  %75 = load i32, i32* %i, align 4
  %arrayidx150 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %75
  %76 = load i8, i8* %arrayidx150, align 1
  %conv151 = sext i8 %76 to i32
  %cmp152 = icmp eq i32 %conv151, 9
  br label %lor.end154

lor.end154:                                       ; preds = %lor.rhs149, %lor.rhs144
  %77 = phi i1 [ true, %lor.rhs144 ], [ %cmp152, %lor.rhs149 ]
  br label %lor.end156

lor.end156:                                       ; preds = %lor.end154, %lor.lhs.false139, %for.cond134
  %78 = phi i1 [ true, %lor.lhs.false139 ], [ true, %for.cond134 ], [ %77, %lor.end154 ]
  br i1 %78, label %for.body158, label %for.end161

for.body158:                                      ; preds = %lor.end156
  br label %for.inc159

for.inc159:                                       ; preds = %for.body158
  %79 = load i32, i32* %i, align 4
  %inc160 = add nsw i32 %79, 1
  store i32 %inc160, i32* %i, align 4
  br label %for.cond134

for.end161:                                       ; preds = %lor.end156
  %80 = load i32, i32* %i, align 4
  %arrayidx162 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %80
  %81 = load i8, i8* %arrayidx162, align 1
  %conv163 = sext i8 %81 to i32
  %cmp164 = icmp eq i32 %conv163, 0
  br i1 %cmp164, label %if.then171, label %lor.lhs.false166

lor.lhs.false166:                                 ; preds = %for.end161
  %82 = load i32, i32* %i, align 4
  %arrayidx167 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %82
  %83 = load i8, i8* %arrayidx167, align 1
  %conv168 = sext i8 %83 to i32
  %cmp169 = icmp eq i32 %conv168, 35
  br i1 %cmp169, label %if.then171, label %if.end172

if.then171:                                       ; preds = %lor.lhs.false166, %for.end161
  br label %while.end

if.end172:                                        ; preds = %lor.lhs.false166
  %84 = load i32, i32* %i, align 4
  store i32 %84, i32* %start, align 4
  br label %for.cond173

for.cond173:                                      ; preds = %for.inc205, %if.end172
  %85 = load i32, i32* %i, align 4
  %arrayidx174 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %85
  %86 = load i8, i8* %arrayidx174, align 1
  %conv175 = sext i8 %86 to i32
  %tobool176 = icmp ne i32 %conv175, 0
  br i1 %tobool176, label %land.rhs177, label %land.end203

land.rhs177:                                      ; preds = %for.cond173
  %87 = load i32, i32* %i, align 4
  %arrayidx178 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %87
  %88 = load i8, i8* %arrayidx178, align 1
  %conv179 = sext i8 %88 to i32
  %cmp180 = icmp eq i32 %conv179, 13
  br i1 %cmp180, label %lor.end199, label %lor.lhs.false182

lor.lhs.false182:                                 ; preds = %land.rhs177
  %89 = load i32, i32* %i, align 4
  %arrayidx183 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %89
  %90 = load i8, i8* %arrayidx183, align 1
  %conv184 = sext i8 %90 to i32
  %cmp185 = icmp eq i32 %conv184, 10
  br i1 %cmp185, label %lor.end199, label %lor.rhs187

lor.rhs187:                                       ; preds = %lor.lhs.false182
  %91 = load i32, i32* %i, align 4
  %arrayidx188 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %91
  %92 = load i8, i8* %arrayidx188, align 1
  %conv189 = sext i8 %92 to i32
  %cmp190 = icmp eq i32 %conv189, 32
  br i1 %cmp190, label %lor.end197, label %lor.rhs192

lor.rhs192:                                       ; preds = %lor.rhs187
  %93 = load i32, i32* %i, align 4
  %arrayidx193 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 %93
  %94 = load i8, i8* %arrayidx193, align 1
  %conv194 = sext i8 %94 to i32
  %cmp195 = icmp eq i32 %conv194, 9
  br label %lor.end197

lor.end197:                                       ; preds = %lor.rhs192, %lor.rhs187
  %95 = phi i1 [ true, %lor.rhs187 ], [ %cmp195, %lor.rhs192 ]
  br label %lor.end199

lor.end199:                                       ; preds = %lor.end197, %lor.lhs.false182, %land.rhs177
  %96 = phi i1 [ true, %lor.lhs.false182 ], [ true, %land.rhs177 ], [ %95, %lor.end197 ]
  %lor.ext200 = zext i1 %96 to i32
  %cmp201 = icmp eq i32 %lor.ext200, 0
  br label %land.end203

land.end203:                                      ; preds = %lor.end199, %for.cond173
  %97 = phi i1 [ false, %for.cond173 ], [ %cmp201, %lor.end199 ]
  br i1 %97, label %for.body204, label %for.end207

for.body204:                                      ; preds = %land.end203
  br label %for.inc205

for.inc205:                                       ; preds = %for.body204
  %98 = load i32, i32* %i, align 4
  %inc206 = add nsw i32 %98, 1
  store i32 %inc206, i32* %i, align 4
  br label %for.cond173

for.end207:                                       ; preds = %land.end203
  %99 = load i32, i32* %i, align 4
  %100 = load i32, i32* %start, align 4
  %cmp208 = icmp eq i32 %99, %100
  br i1 %cmp208, label %if.then210, label %if.end211

if.then210:                                       ; preds = %for.end207
  br label %while.cond130

if.end211:                                        ; preds = %for.end207
  %arraydecay212 = getelementptr inbounds [256 x i8], [256 x i8]* %name, i32 0, i32 0
  %arraydecay213 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 0
  %101 = load i32, i32* %start, align 4
  %add.ptr214 = getelementptr inbounds i8, i8* %arraydecay213, i32 %101
  %102 = load i32, i32* %i, align 4
  %103 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %102, %103
  %call215 = call i8* @strncpy(i8* %arraydecay212, i8* %add.ptr214, i32 %sub)
  %104 = load i32, i32* %i, align 4
  %105 = load i32, i32* %start, align 4
  %sub216 = sub nsw i32 %104, %105
  %arrayidx217 = getelementptr inbounds [256 x i8], [256 x i8]* %name, i32 0, i32 %sub216
  store i8 0, i8* %arrayidx217, align 1
  %arraydecay218 = getelementptr inbounds [256 x i8], [256 x i8]* %name, i32 0, i32 0
  call void @add_host_name(i8* %arraydecay218)
  br label %while.cond130

while.end:                                        ; preds = %if.then171, %while.cond130
  br label %while.cond

while.end219:                                     ; preds = %while.cond
  %106 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 4
  %call220 = call i32 @fclose(%struct._IO_FILE* %106)
  br label %return

return:                                           ; preds = %while.end219, %if.then
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

declare i8* @strncpy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @add_host_name(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i32, i32* @hostname_list_length, align 4
  %add = add nsw i32 %0, 2
  %1 = load i32, i32* @hostname_list_size, align 4
  %cmp = icmp sgt i32 %add, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @hostname_list_size, align 4
  %add1 = add nsw i32 %2, 32
  %3 = load i32, i32* @hostname_list_size, align 4
  %rem = srem i32 %3, 32
  %sub = sub nsw i32 %add1, %rem
  store i32 %sub, i32* @hostname_list_size, align 4
  %4 = load i8**, i8*** @hostname_list, align 4
  %5 = load i32, i32* @hostname_list_size, align 4
  %call = call i8** @strvec_resize(i8** %4, i32 %5)
  store i8** %call, i8*** @hostname_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i8*, i8** %name.addr, align 4
  %call2 = call i32 @strlen(i8* %6)
  %add3 = add i32 1, %call2
  %call4 = call i8* @sh_xmalloc(i32 %add3, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 743)
  %7 = load i8*, i8** %name.addr, align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %7)
  %8 = load i8**, i8*** @hostname_list, align 4
  %9 = load i32, i32* @hostname_list_length, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* @hostname_list_length, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %8, i32 %9
  store i8* %call5, i8** %arrayidx, align 4
  %10 = load i8**, i8*** @hostname_list, align 4
  %11 = load i32, i32* @hostname_list_length, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %10, i32 %11
  store i8* null, i8** %arrayidx6, align 4
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #1

declare i8** @strvec_resize(i8**, i32) #1

declare i32 @rl_newline(i32, i32) #1

declare i32 @where_history() #1

declare i32 @history_is_stifled() #1

; Function Attrs: noinline nounwind
define internal i32 @set_saved_history() #0 {
entry:
  %call = call i32 @history_is_stifled()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i32, i32* @history_length, align 4
  %1 = load i32, i32* @history_max_entries, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @hist_last_line_added, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true1
  %3 = load i32, i32* @saved_history_line_to_use, align 4
  %4 = load i32, i32* @history_length, align 4
  %sub = sub nsw i32 %4, 1
  %cmp4 = icmp slt i32 %3, %sub
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true3
  %5 = load i32, i32* @saved_history_line_to_use, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @saved_history_line_to_use, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true3, %land.lhs.true1, %land.lhs.true, %entry
  %6 = load i32, i32* @saved_history_line_to_use, align 4
  %cmp5 = icmp sge i32 %6, 0
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end
  %7 = load i32, i32* @history_length, align 4
  %8 = load i32, i32* @saved_history_line_to_use, align 4
  %sub7 = sub nsw i32 %7, %8
  %call8 = call i32 @rl_get_previous_history(i32 %sub7, i32 0)
  %9 = load i32, i32* @saved_history_line_to_use, align 4
  store i32 %9, i32* @last_saved_history_line, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %if.end
  store i32 -1, i32* @saved_history_line_to_use, align 4
  %10 = load i32 ()*, i32 ()** @old_rl_startup_hook, align 4
  store i32 ()* %10, i32 ()** @rl_startup_hook, align 4
  ret i32 0
}

declare i32 @rl_get_previous_history(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @edit_and_execute_command(i32 %count, i32 %c, i32 %editing_mode, i8* %edit_command) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %editing_mode.addr = alloca i32, align 4
  %edit_command.addr = alloca i8*, align 4
  %command = alloca i8*, align 4
  %metaval = alloca i8*, align 4
  %r = alloca i32, align 4
  %rrs = alloca i32, align 4
  %metaflag = alloca i32, align 4
  %ps = alloca %struct._sh_parser_state_t, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %editing_mode, i32* %editing_mode.addr, align 4
  store i8* %edit_command, i8** %edit_command.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  store i32 %0, i32* %rrs, align 4
  %1 = load i32, i32* @current_command_line_count, align 4
  store i32 %1, i32* @saved_command_line_count, align 4
  %2 = load i32, i32* %c.addr, align 4
  %call = call i32 @rl_newline(i32 1, i32 %2)
  %3 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %edit_command.addr, align 4
  %call1 = call i32 @strlen(i8* %4)
  %add = add i32 %call1, 8
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 960)
  store i8* %call2, i8** %command, align 4
  %5 = load i8*, i8** %command, align 4
  %6 = load i8*, i8** %edit_command.addr, align 4
  %7 = load i32, i32* %count.addr, align 4
  %call3 = call i32 (i8*, i8*, ...) @sprintf(i8* %5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.53, i32 0, i32 0), i8* %6, i32 %7)
  br label %if.end

if.else:                                          ; preds = %entry
  call void @using_history()
  %8 = load i32, i32* @current_command_line_count, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* @current_command_line_count, align 4
  %9 = load i8*, i8** @rl_line_buffer, align 4
  call void @bash_add_history(i8* %9)
  store i32 0, i32* @current_command_line_count, align 4
  call void @bash_add_history(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.41, i32 0, i32 0))
  %10 = load i32, i32* @history_lines_this_session, align 4
  %inc4 = add nsw i32 %10, 1
  store i32 %inc4, i32* @history_lines_this_session, align 4
  call void @using_history()
  %11 = load i8*, i8** %edit_command.addr, align 4
  %call5 = call i32 @strlen(i8* %11)
  %add6 = add i32 1, %call5
  %call7 = call i8* @sh_xmalloc(i32 %add6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 978)
  %12 = load i8*, i8** %edit_command.addr, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %12)
  store i8* %call8, i8** %command, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call9 = call i8* @rl_variable_value(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.54, i32 0, i32 0))
  store i8* %call9, i8** %metaval, align 4
  %13 = load i8*, i8** %metaval, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %14 to i32
  %cmp = icmp eq i32 %conv, 111
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %if.end
  %15 = load i8*, i8** %metaval, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %16 to i32
  %cmp13 = icmp eq i32 %conv12, 110
  br i1 %cmp13, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %17 = load i8*, i8** %metaval, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %17, i32 2
  %18 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %18 to i32
  %cmp17 = icmp eq i32 %conv16, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %if.end
  %19 = phi i1 [ false, %land.lhs.true ], [ false, %if.end ], [ %cmp17, %land.rhs ]
  %land.ext = zext i1 %19 to i32
  store i32 %land.ext, i32* %metaflag, align 4
  %20 = load void ()*, void ()** @rl_deprep_term_function, align 4
  %tobool19 = icmp ne void ()* %20, null
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %land.end
  %21 = load void ()*, void ()** @rl_deprep_term_function, align 4
  call void %21()
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %land.end
  %call22 = call %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t* %ps)
  %22 = load i8*, i8** %command, align 4
  %23 = load i32, i32* %editing_mode.addr, align 4
  %cmp23 = icmp eq i32 %23, 0
  %cond = select i1 %cmp23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.56, i32 0, i32 0)
  %call25 = call i32 @parse_and_execute(i8* %22, i8* %cond, i32 4)
  store i32 %call25, i32* %r, align 4
  call void @restore_parser_state(%struct._sh_parser_state_t* %ps)
  %24 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %tobool26 = icmp ne void (i32)* %24, null
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end21
  %25 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %26 = load i32, i32* %metaflag, align 4
  call void %25(i32 %26)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.end21
  %27 = load i32, i32* @saved_command_line_count, align 4
  store i32 %27, i32* @current_command_line_count, align 4
  %28 = load i8*, i8** @rl_line_buffer, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %28, i32 0
  store i8 0, i8* %arrayidx29, align 1
  store i32 0, i32* @rl_end, align 4
  store i32 0, i32* @rl_point, align 4
  store i32 0, i32* @rl_done, align 4
  %29 = load i32, i32* %rrs, align 4
  store i32 %29, i32* @rl_readline_state, align 4
  %call30 = call i32 @rl_forced_update_display()
  %30 = load i32, i32* %r, align 4
  ret i32 %30
}

declare i32 @sprintf(i8*, i8*, ...) #1

declare void @using_history() #1

declare void @bash_add_history(i8*) #1

declare %struct._sh_parser_state_t* @save_parser_state(%struct._sh_parser_state_t*) #1

declare i32 @parse_and_execute(i8*, i8*, i32) #1

declare void @restore_parser_state(%struct._sh_parser_state_t*) #1

declare i32 @rl_forced_update_display() #1

declare i32 @rl_read_key() #1

declare i8* @get_alias_value(i8*) #1

declare void @rl_push_macro_input(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @is_basic_table, i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #1

declare i32 @skip_to_delim(i8*, i32, i8*, i32) #1

declare i32 @rl_ding() #1

declare i32 @rl_kill_text(i32, i32) #1

declare i32 @parser_in_command_position() #1

; Function Attrs: noinline nounwind
define internal i32 @check_redir(i32 %ti) #0 {
entry:
  %retval = alloca i32, align 4
  %ti.addr = alloca i32, align 4
  %this_char = alloca i32, align 4
  %prev_char = alloca i32, align 4
  store i32 %ti, i32* %ti.addr, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %1 = load i32, i32* %ti.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  store i32 %conv, i32* %this_char, align 4
  %3 = load i32, i32* %ti.addr, align 4
  %cmp = icmp sgt i32 %3, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* %ti.addr, align 4
  %sub = sub nsw i32 %5, 1
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 %sub
  %6 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %prev_char, align 4
  %7 = load i32, i32* %this_char, align 4
  %cmp4 = icmp eq i32 %7, 38
  br i1 %cmp4, label %land.lhs.true, label %lor.lhs.false10

land.lhs.true:                                    ; preds = %cond.end
  %8 = load i32, i32* %prev_char, align 4
  %cmp6 = icmp eq i32 %8, 60
  br i1 %cmp6, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %9 = load i32, i32* %prev_char, align 4
  %cmp8 = icmp eq i32 %9, 62
  br i1 %cmp8, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false, %cond.end
  %10 = load i32, i32* %this_char, align 4
  %cmp11 = icmp eq i32 %10, 124
  br i1 %cmp11, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %lor.lhs.false10
  %11 = load i32, i32* %prev_char, align 4
  %cmp14 = icmp eq i32 %11, 62
  br i1 %cmp14, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true13, %lor.lhs.false, %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true13, %lor.lhs.false10
  %12 = load i32, i32* %this_char, align 4
  %cmp16 = icmp eq i32 %12, 123
  br i1 %cmp16, label %land.lhs.true18, label %if.else22

land.lhs.true18:                                  ; preds = %if.else
  %13 = load i32, i32* %prev_char, align 4
  %cmp19 = icmp eq i32 %13, 36
  br i1 %cmp19, label %if.then21, label %if.else22

if.then21:                                        ; preds = %land.lhs.true18
  store i32 1, i32* %retval, align 4
  br label %return

if.else22:                                        ; preds = %land.lhs.true18, %if.else
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* %ti.addr, align 4
  %call = call i32 @char_is_quoted(i8* %14, i32 %15)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then23, label %if.end

if.then23:                                        ; preds = %if.else22
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else22
  br label %if.end24

if.end24:                                         ; preds = %if.end
  br label %if.end25

if.end25:                                         ; preds = %if.end24
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end25, %if.then23, %if.then21, %if.then
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind
define internal i32 @invalid_completion(i8* %text, i32 %ind) #0 {
entry:
  %retval = alloca i32, align 4
  %text.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %pind = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  %0 = load i32, i32* %ind.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %2 = load i32, i32* %ind.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 40
  br i1 %cmp1, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* %ind.addr, align 4
  %sub = sub nsw i32 %5, 1
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i32 %sub
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %tobool = icmp ne i32 %conv5, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true3
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* %ind.addr, align 4
  %sub6 = sub nsw i32 %8, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i32 %sub6
  %9 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %9 to i32
  %call = call i8* @mbschr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.63, i32 0, i32 0), i32 %conv8)
  %cmp9 = icmp ne i8* %call, null
  br i1 %cmp9, label %if.then, label %if.end

cond.false:                                       ; preds = %land.lhs.true3
  br i1 false, label %if.then, label %if.end

if.then:                                          ; preds = %cond.false, %cond.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.false, %cond.true, %land.lhs.true, %entry
  %10 = load i32, i32* %ind.addr, align 4
  %sub11 = sub nsw i32 %10, 1
  store i32 %sub11, i32* %pind, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %11 = load i32, i32* %pind, align 4
  %cmp12 = icmp sgt i32 %11, 0
  br i1 %cmp12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* %pind, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %14 to i32
  %cmp16 = icmp eq i32 %conv15, 32
  br i1 %cmp16, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* %pind, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %17 to i32
  %cmp20 = icmp eq i32 %conv19, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %18 = phi i1 [ true, %land.rhs ], [ %cmp20, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %19 = phi i1 [ false, %while.cond ], [ %18, %lor.end ]
  br i1 %19, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %20 = load i32, i32* %pind, align 4
  %dec = add nsw i32 %20, -1
  store i32 %dec, i32* %pind, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %21 = load i32, i32* %ind.addr, align 4
  %cmp22 = icmp sge i32 %21, 0
  br i1 %cmp22, label %land.lhs.true24, label %if.end33

land.lhs.true24:                                  ; preds = %while.end
  %22 = load i32, i32* %pind, align 4
  %cmp25 = icmp sle i32 %22, 0
  br i1 %cmp25, label %land.lhs.true27, label %if.end33

land.lhs.true27:                                  ; preds = %land.lhs.true24
  %23 = load i8*, i8** @rl_line_buffer, align 4
  %24 = load i32, i32* %ind.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %25 to i32
  %cmp30 = icmp eq i32 %conv29, 40
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %land.lhs.true27
  store i32 0, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %land.lhs.true27, %land.lhs.true24, %while.end
  %26 = load i32, i32* %ind.addr, align 4
  %cmp34 = icmp sgt i32 %26, 0
  br i1 %cmp34, label %land.lhs.true36, label %if.end55

land.lhs.true36:                                  ; preds = %if.end33
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* %ind.addr, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %29 to i32
  %cmp39 = icmp eq i32 %conv38, 40
  br i1 %cmp39, label %land.lhs.true41, label %if.end55

land.lhs.true41:                                  ; preds = %land.lhs.true36
  %30 = load i8*, i8** @rl_line_buffer, align 4
  %31 = load i32, i32* %pind, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %32 to i32
  %tobool44 = icmp ne i32 %conv43, 0
  br i1 %tobool44, label %cond.true45, label %cond.false51

cond.true45:                                      ; preds = %land.lhs.true41
  %33 = load i8*, i8** @rl_line_buffer, align 4
  %34 = load i32, i32* %pind, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %35 to i32
  %call48 = call i8* @mbschr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i32 %conv47)
  %cmp49 = icmp ne i8* %call48, null
  %conv50 = zext i1 %cmp49 to i32
  br label %cond.end

cond.false51:                                     ; preds = %land.lhs.true41
  br label %cond.end

cond.end:                                         ; preds = %cond.false51, %cond.true45
  %cond = phi i32 [ %conv50, %cond.true45 ], [ 0, %cond.false51 ]
  %cmp52 = icmp eq i32 %cond, 0
  br i1 %cmp52, label %if.then54, label %if.end55

if.then54:                                        ; preds = %cond.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end55:                                         ; preds = %cond.end, %land.lhs.true36, %if.end33
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end55, %if.then54, %if.then32, %if.then
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

declare i32 @unclosed_pair(i8*, i32, i8*) #1

declare i32 @progcomp_size() #1

; Function Attrs: noinline nounwind
define internal i32 @find_cmd_start(i32 %start) #0 {
entry:
  %retval = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %s = alloca i32, align 4
  %os = alloca i32, align 4
  %ns = alloca i32, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 0, i32* %os, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %if.end, %entry
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %1 = load i32, i32* %os, align 4
  %call = call i32 @skip_to_delim(i8* %0, i32 %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i32 257)
  store i32 %call, i32* %s, align 4
  %2 = load i32, i32* %start.addr, align 4
  %cmp = icmp sle i32 %call, %2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %4 = load i32, i32* %s, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %tobool = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* %s, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %9 to i32
  %cmp3 = icmp eq i32 %conv2, 124
  br i1 %cmp3, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %while.body
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* %s, align 4
  %sub = sub nsw i32 %11, 1
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i32 %sub
  %12 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %12 to i32
  %cmp7 = icmp eq i32 %conv6, 62
  br i1 %cmp7, label %if.then, label %if.end18

if.then:                                          ; preds = %land.lhs.true
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* %s, align 4
  %add = add nsw i32 %14, 1
  %call9 = call i32 @skip_to_delim(i8* %13, i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i32 257)
  store i32 %call9, i32* %ns, align 4
  %15 = load i32, i32* %ns, align 4
  %16 = load i32, i32* %start.addr, align 4
  %cmp10 = icmp sgt i32 %15, %16
  br i1 %cmp10, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* %ns, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %19 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then16, label %if.end

if.then16:                                        ; preds = %lor.lhs.false, %if.then
  %20 = load i32, i32* %os, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %21 = load i32, i32* %ns, align 4
  %add17 = add nsw i32 %21, 1
  store i32 %add17, i32* %os, align 4
  br label %while.cond

if.end18:                                         ; preds = %land.lhs.true, %while.body
  %22 = load i32, i32* %s, align 4
  %add19 = add nsw i32 %22, 1
  store i32 %add19, i32* %os, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %23 = load i32, i32* %os, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then16
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind
define internal i32 @find_cmd_end(i32 %end) #0 {
entry:
  %end.addr = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %end, i32* %end.addr, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %1 = load i32, i32* %end.addr, align 4
  %call = call i32 @skip_to_delim(i8* %0, i32 %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.60, i32 0, i32 0), i32 257)
  store i32 %call, i32* %e, align 4
  %2 = load i32, i32* %e, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define internal i8* @find_cmd_name(i32 %start, i32* %sp, i32* %ep) #0 {
entry:
  %start.addr = alloca i32, align 4
  %sp.addr = alloca i32*, align 4
  %ep.addr = alloca i32*, align 4
  %name = alloca i8*, align 4
  %s = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32* %sp, i32** %sp.addr, align 4
  store i32* %ep, i32** %ep.addr, align 4
  %0 = load i32, i32* %start.addr, align 4
  store i32 %0, i32* %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %2 = load i32, i32* %s, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.cond
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* %s, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv3, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %7 = phi i1 [ true, %for.cond ], [ %cmp4, %lor.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %lor.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %s, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %s, align 4
  br label %for.cond

for.end:                                          ; preds = %lor.end
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %10 = load i32, i32* %s, align 4
  %call = call i32 @skip_to_delim(i8* %9, i32 %10, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.64, i32 0, i32 0), i32 257)
  store i32 %call, i32* %e, align 4
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %12 = load i32, i32* %s, align 4
  %13 = load i32, i32* %e, align 4
  %call6 = call i8* @substring(i8* %11, i32 %12, i32 %13)
  store i8* %call6, i8** %name, align 4
  %14 = load i32*, i32** %sp.addr, align 4
  %tobool = icmp ne i32* %14, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %15 = load i32, i32* %s, align 4
  %16 = load i32*, i32** %sp.addr, align 4
  store i32 %15, i32* %16, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %17 = load i32*, i32** %ep.addr, align 4
  %tobool7 = icmp ne i32* %17, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  %18 = load i32, i32* %e, align 4
  %19 = load i32*, i32** %ep.addr, align 4
  store i32 %18, i32* %19, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  %20 = load i8*, i8** %name, align 4
  ret i8* %20
}

declare i32 @assignment(i8*, i32) #1

declare i8** @programmable_completions(i8*, i8*, i32, i32, i32*) #1

declare void @pcomp_set_readline_variables(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @prog_complete_return(i8* %text, i32 %matchnum) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %matchnum.addr = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %matchnum, i32* %matchnum.addr, align 4
  %0 = load i32, i32* %matchnum.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @prog_complete_return.ind, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8**, i8*** @prog_complete_matches, align 4
  %cmp1 = icmp eq i8** %1, null
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %2 = load i8**, i8*** @prog_complete_matches, align 4
  %3 = load i32, i32* @prog_complete_return.ind, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %cmp2 = icmp eq i8* %4, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %lor.lhs.false, %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %lor.lhs.false
  %5 = load i8**, i8*** @prog_complete_matches, align 4
  %6 = load i32, i32* @prog_complete_return.ind, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* @prog_complete_return.ind, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx5, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3
  %8 = load i8*, i8** %retval, align 4
  ret i8* %8
}

declare i8* @search_for_command(i8*, i32) #1

declare i32 @executable_file(i8*) #1

declare i8** @all_variables_matching_prefix(i8*) #1

declare i8* @strcat(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal i8** @hostnames_matching(i8* %text) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %nmatch = alloca i32, align 4
  %rsize = alloca i32, align 4
  %result = alloca i8**, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i32, i32* @hostname_list_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @initialize_hostname_list()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @hostname_list_initialized, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i8** null, i8*** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %2 = load i8*, i8** %text.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv, 0
  br i1 %cmp4, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.end3
  %4 = load i32, i32* @hostname_list_length, align 4
  %add = add nsw i32 1, %4
  %call = call i8** @strvec_create(i32 %add)
  store i8** %call, i8*** %result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then6
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* @hostname_list_length, align 4
  %cmp7 = icmp slt i32 %5, %6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i8**, i8*** @hostname_list, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %7, i32 %8
  %9 = load i8*, i8** %arrayidx, align 4
  %10 = load i8**, i8*** %result, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %10, i32 %11
  store i8* %9, i8** %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load i8**, i8*** %result, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %13, i32 %14
  store i8* null, i8** %arrayidx10, align 4
  %15 = load i8**, i8*** %result, align 4
  store i8** %15, i8*** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end3
  %16 = load i8*, i8** %text.addr, align 4
  %call12 = call i32 @strlen(i8* %16)
  store i32 %call12, i32* %len, align 4
  store i8** null, i8*** %result, align 4
  store i32 0, i32* %rsize, align 4
  store i32 0, i32* %nmatch, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc44, %if.end11
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* @hostname_list_length, align 4
  %cmp14 = icmp slt i32 %17, %18
  br i1 %cmp14, label %for.body16, label %for.end46

for.body16:                                       ; preds = %for.cond13
  %19 = load i32, i32* %len, align 4
  %cmp17 = icmp eq i32 %19, 0
  br i1 %cmp17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body16
  br label %cond.end

cond.false:                                       ; preds = %for.body16
  %20 = load i8*, i8** %text.addr, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %21 to i32
  %22 = load i8**, i8*** @hostname_list, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx21 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx21, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %24, i32 0
  %25 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %25 to i32
  %cmp24 = icmp eq i32 %conv20, %conv23
  br i1 %cmp24, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.false
  %26 = load i8*, i8** %text.addr, align 4
  %27 = load i8**, i8*** @hostname_list, align 4
  %28 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %27, i32 %28
  %29 = load i8*, i8** %arrayidx26, align 4
  %30 = load i32, i32* %len, align 4
  %call27 = call i32 @strncmp(i8* %26, i8* %29, i32 %30)
  %cmp28 = icmp eq i32 %call27, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false
  %31 = phi i1 [ false, %cond.false ], [ %cmp28, %land.rhs ]
  %land.ext = zext i1 %31 to i32
  br label %cond.end

cond.end:                                         ; preds = %land.end, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %land.ext, %land.end ]
  %cmp30 = icmp eq i32 %cond, 0
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %cond.end
  br label %for.inc44

if.end33:                                         ; preds = %cond.end
  %32 = load i32, i32* %nmatch, align 4
  %33 = load i32, i32* %rsize, align 4
  %sub = sub nsw i32 %33, 1
  %cmp34 = icmp sge i32 %32, %sub
  br i1 %cmp34, label %if.then36, label %if.end40

if.then36:                                        ; preds = %if.end33
  %34 = load i32, i32* %rsize, align 4
  %add37 = add nsw i32 %34, 16
  %35 = load i32, i32* %rsize, align 4
  %rem = srem i32 %35, 16
  %sub38 = sub nsw i32 %add37, %rem
  store i32 %sub38, i32* %rsize, align 4
  %36 = load i8**, i8*** %result, align 4
  %37 = load i32, i32* %rsize, align 4
  %call39 = call i8** @strvec_resize(i8** %36, i32 %37)
  store i8** %call39, i8*** %result, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then36, %if.end33
  %38 = load i8**, i8*** @hostname_list, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx41 = getelementptr inbounds i8*, i8** %38, i32 %39
  %40 = load i8*, i8** %arrayidx41, align 4
  %41 = load i8**, i8*** %result, align 4
  %42 = load i32, i32* %nmatch, align 4
  %inc42 = add nsw i32 %42, 1
  store i32 %inc42, i32* %nmatch, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %41, i32 %42
  store i8* %40, i8** %arrayidx43, align 4
  br label %for.inc44

for.inc44:                                        ; preds = %if.end40, %if.then32
  %43 = load i32, i32* %i, align 4
  %inc45 = add nsw i32 %43, 1
  store i32 %inc45, i32* %i, align 4
  br label %for.cond13

for.end46:                                        ; preds = %for.cond13
  %44 = load i32, i32* %nmatch, align 4
  %tobool = icmp ne i32 %44, 0
  br i1 %tobool, label %if.then47, label %if.end49

if.then47:                                        ; preds = %for.end46
  %45 = load i8**, i8*** %result, align 4
  %46 = load i32, i32* %nmatch, align 4
  %arrayidx48 = getelementptr inbounds i8*, i8** %45, i32 %46
  store i8* null, i8** %arrayidx48, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %for.end46
  %47 = load i8**, i8*** %result, align 4
  store i8** %47, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end49, %for.end, %if.then2
  %48 = load i8**, i8*** %retval, align 4
  ret i8** %48
}

declare i8** @strvec_create(i32) #1

declare i8* @alias_expand(i8*) #1

; Function Attrs: noinline nounwind
define internal void @set_up_new_line(i8* %new_line) #0 {
entry:
  %new_line.addr = alloca i8*, align 4
  %old_point = alloca i32, align 4
  %at_end = alloca i32, align 4
  store i8* %new_line, i8** %new_line.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %old_point, align 4
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %cmp = icmp eq i32 %1, %2
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %at_end, align 4
  %3 = load i8*, i8** %new_line.addr, align 4
  call void @maybe_make_readline_line(i8* %3)
  %4 = load i8*, i8** %new_line.addr, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2580)
  %5 = load i32, i32* %at_end, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i32, i32* @rl_end, align 4
  store i32 %6, i32* @rl_point, align 4
  br label %if.end13

if.else:                                          ; preds = %entry
  %7 = load i32, i32* %old_point, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp slt i32 %7, %8
  br i1 %cmp1, label %if.then3, label %if.end12

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %old_point, align 4
  store i32 %9, i32* @rl_point, align 4
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx, align 1
  %conv4 = sext i8 %12 to i32
  %cmp5 = icmp eq i32 %conv4, 32
  br i1 %cmp5, label %if.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then3
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* @rl_point, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %15 to i32
  %cmp9 = icmp eq i32 %conv8, 9
  br i1 %cmp9, label %if.end, label %if.then11

if.then11:                                        ; preds = %lor.lhs.false
  %call = call i32 @rl_forward_word(i32 1, i32 0)
  br label %if.end

if.end:                                           ; preds = %if.then11, %lor.lhs.false, %if.then3
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @cleanup_expansion_error() #0 {
entry:
  %to_free = alloca i8*, align 4
  %old_verify = alloca i32, align 4
  %0 = load i32, i32* @hist_verify, align 4
  store i32 %0, i32* %old_verify, align 4
  store i32 0, i32* @hist_verify, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.66, i32 0, i32 0))
  %2 = load i8*, i8** @rl_line_buffer, align 4
  %call1 = call i8* @pre_process_line(i8* %2, i32 1, i32 0)
  store i8* %call1, i8** %to_free, align 4
  %3 = load i32, i32* %old_verify, align 4
  store i32 %3, i32* @hist_verify, align 4
  %4 = load i8*, i8** %to_free, align 4
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %cmp = icmp ne i8* %4, %5
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %6 = load i8*, i8** %to_free, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %7 = load i8*, i8** %to_free, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2543)
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end3

if.end3:                                          ; preds = %do.end, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call4 = call i32 @putc(i32 13, %struct._IO_FILE* %8)
  %call5 = call i32 @rl_forced_update_display()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @maybe_make_readline_line(i8* %new_line) #0 {
entry:
  %new_line.addr = alloca i8*, align 4
  store i8* %new_line, i8** %new_line.addr, align 4
  %0 = load i8*, i8** %new_line.addr, align 4
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i32 @strcmp(i8* %0, i8* %1)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @rl_end, align 4
  store i32 %2, i32* @rl_point, align 4
  call void @rl_add_undo(i32 2, i32 0, i32 0, i8* null)
  %3 = load i32, i32* @rl_point, align 4
  %call1 = call i32 @rl_delete_text(i32 0, i32 %3)
  store i32 0, i32* @rl_mark, align 4
  store i32 0, i32* @rl_end, align 4
  store i32 0, i32* @rl_point, align 4
  %4 = load i8*, i8** %new_line.addr, align 4
  %call2 = call i32 @rl_insert_text(i8* %4)
  call void @rl_add_undo(i32 3, i32 0, i32 0, i8* null)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @rl_forward_word(i32, i32) #1

declare void @rl_add_undo(i32, i32, i32, i8*) #1

declare i32 @rl_delete_text(i32, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @pre_process_line(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @history_expand_line_internal(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %new_line = alloca i8*, align 4
  %old_verify = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load i32, i32* @hist_verify, align 4
  store i32 %0, i32* %old_verify, align 4
  store i32 0, i32* @hist_verify, align 4
  %1 = load i8*, i8** %line.addr, align 4
  %call = call i8* @pre_process_line(i8* %1, i32 0, i32 0)
  store i8* %call, i8** %new_line, align 4
  %2 = load i32, i32* %old_verify, align 4
  store i32 %2, i32* @hist_verify, align 4
  %3 = load i8*, i8** %new_line, align 4
  %4 = load i8*, i8** %line.addr, align 4
  %cmp = icmp eq i8* %3, %4
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %5 = load i8*, i8** %line.addr, align 4
  %call1 = call i32 @strlen(i8* %5)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2520)
  %6 = load i8*, i8** %line.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %6)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %7 = load i8*, i8** %new_line, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call3, %cond.true ], [ %7, %cond.false ]
  ret i8* %cond
}

declare %struct.word_list* @expand_string(i8*, i32) #1

declare i8* @string_list(%struct.word_list*) #1

declare void @dispose_words(%struct.word_list*) #1

declare void @setup_ignore_patterns(%struct.ignorevar*) #1

; Function Attrs: noinline nounwind
define internal void @_ignore_completion_names(i8** %names, i32 (i8*)* %name_func) #0 {
entry:
  %names.addr = alloca i8**, align 4
  %name_func.addr = alloca i32 (i8*)*, align 4
  %newnames = alloca i8**, align 4
  %idx = alloca i32, align 4
  %nidx = alloca i32, align 4
  %oldnames = alloca i8**, align 4
  %oidx = alloca i32, align 4
  store i8** %names, i8*** %names.addr, align 4
  store i32 (i8*)* %name_func, i32 (i8*)** %name_func.addr, align 4
  %0 = load i8**, i8*** %names.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 1
  %1 = load i8*, i8** %arrayidx, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @force_fignore, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then1, label %if.end7

if.then1:                                         ; preds = %if.then
  %3 = load i32 (i8*)*, i32 (i8*)** %name_func.addr, align 4
  %4 = load i8**, i8*** %names.addr, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx2, align 4
  %call = call i32 %3(i8* %5)
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then1
  %6 = load i8**, i8*** %names.addr, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i32 0
  %7 = load i8*, i8** %arrayidx5, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2807)
  %8 = load i8**, i8*** %names.addr, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %8, i32 0
  store i8* null, i8** %arrayidx6, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then1
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  br label %return

if.end8:                                          ; preds = %entry
  store i32 1, i32* %nidx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end8
  %9 = load i8**, i8*** %names.addr, align 4
  %10 = load i32, i32* %nidx, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %9, i32 %10
  %11 = load i8*, i8** %arrayidx9, align 4
  %tobool10 = icmp ne i8* %11, null
  br i1 %tobool10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %nidx, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %nidx, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load i32, i32* %nidx, align 4
  %add = add nsw i32 %13, 1
  %call11 = call i8** @strvec_create(i32 %add)
  store i8** %call11, i8*** %newnames, align 4
  %14 = load i32, i32* @force_fignore, align 4
  %cmp12 = icmp eq i32 %14, 0
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %for.end
  %15 = load i32, i32* %nidx, align 4
  %sub = sub nsw i32 %15, 1
  %call14 = call i8** @strvec_create(i32 %sub)
  store i8** %call14, i8*** %oldnames, align 4
  store i32 0, i32* %oidx, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %for.end
  %16 = load i8**, i8*** %names.addr, align 4
  %arrayidx16 = getelementptr inbounds i8*, i8** %16, i32 0
  %17 = load i8*, i8** %arrayidx16, align 4
  %18 = load i8**, i8*** %newnames, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %18, i32 0
  store i8* %17, i8** %arrayidx17, align 4
  store i32 1, i32* %nidx, align 4
  store i32 1, i32* %idx, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc38, %if.end15
  %19 = load i8**, i8*** %names.addr, align 4
  %20 = load i32, i32* %idx, align 4
  %arrayidx19 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx19, align 4
  %tobool20 = icmp ne i8* %21, null
  br i1 %tobool20, label %for.body21, label %for.end40

for.body21:                                       ; preds = %for.cond18
  %22 = load i32 (i8*)*, i32 (i8*)** %name_func.addr, align 4
  %23 = load i8**, i8*** %names.addr, align 4
  %24 = load i32, i32* %idx, align 4
  %arrayidx22 = getelementptr inbounds i8*, i8** %23, i32 %24
  %25 = load i8*, i8** %arrayidx22, align 4
  %call23 = call i32 %22(i8* %25)
  %tobool24 = icmp ne i32 %call23, 0
  br i1 %tobool24, label %if.then25, label %if.else

if.then25:                                        ; preds = %for.body21
  %26 = load i8**, i8*** %names.addr, align 4
  %27 = load i32, i32* %idx, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %26, i32 %27
  %28 = load i8*, i8** %arrayidx26, align 4
  %29 = load i8**, i8*** %newnames, align 4
  %30 = load i32, i32* %nidx, align 4
  %inc27 = add nsw i32 %30, 1
  store i32 %inc27, i32* %nidx, align 4
  %arrayidx28 = getelementptr inbounds i8*, i8** %29, i32 %30
  store i8* %28, i8** %arrayidx28, align 4
  br label %if.end37

if.else:                                          ; preds = %for.body21
  %31 = load i32, i32* @force_fignore, align 4
  %cmp29 = icmp eq i32 %31, 0
  br i1 %cmp29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.else
  %32 = load i8**, i8*** %names.addr, align 4
  %33 = load i32, i32* %idx, align 4
  %arrayidx31 = getelementptr inbounds i8*, i8** %32, i32 %33
  %34 = load i8*, i8** %arrayidx31, align 4
  %35 = load i8**, i8*** %oldnames, align 4
  %36 = load i32, i32* %oidx, align 4
  %inc32 = add nsw i32 %36, 1
  store i32 %inc32, i32* %oidx, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %35, i32 %36
  store i8* %34, i8** %arrayidx33, align 4
  br label %if.end36

if.else34:                                        ; preds = %if.else
  %37 = load i8**, i8*** %names.addr, align 4
  %38 = load i32, i32* %idx, align 4
  %arrayidx35 = getelementptr inbounds i8*, i8** %37, i32 %38
  %39 = load i8*, i8** %arrayidx35, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2834)
  br label %if.end36

if.end36:                                         ; preds = %if.else34, %if.then30
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then25
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  %40 = load i32, i32* %idx, align 4
  %inc39 = add nsw i32 %40, 1
  store i32 %inc39, i32* %idx, align 4
  br label %for.cond18

for.end40:                                        ; preds = %for.cond18
  %41 = load i8**, i8*** %newnames, align 4
  %42 = load i32, i32* %nidx, align 4
  %arrayidx41 = getelementptr inbounds i8*, i8** %41, i32 %42
  store i8* null, i8** %arrayidx41, align 4
  %43 = load i32, i32* %nidx, align 4
  %cmp42 = icmp eq i32 %43, 1
  br i1 %cmp42, label %if.then43, label %if.end50

if.then43:                                        ; preds = %for.end40
  %44 = load i32, i32* @force_fignore, align 4
  %tobool44 = icmp ne i32 %44, 0
  br i1 %tobool44, label %if.then45, label %if.else48

if.then45:                                        ; preds = %if.then43
  %45 = load i8**, i8*** %names.addr, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %45, i32 0
  %46 = load i8*, i8** %arrayidx46, align 4
  call void @sh_xfree(i8* %46, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2844)
  %47 = load i8**, i8*** %names.addr, align 4
  %arrayidx47 = getelementptr inbounds i8*, i8** %47, i32 0
  store i8* null, i8** %arrayidx47, align 4
  br label %if.end49

if.else48:                                        ; preds = %if.then43
  %48 = load i8**, i8*** %oldnames, align 4
  %49 = bitcast i8** %48 to i8*
  call void @sh_xfree(i8* %49, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2848)
  br label %if.end49

if.end49:                                         ; preds = %if.else48, %if.then45
  %50 = load i8**, i8*** %newnames, align 4
  %51 = bitcast i8** %50 to i8*
  call void @sh_xfree(i8* %51, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2850)
  br label %return

if.end50:                                         ; preds = %for.end40
  %52 = load i32, i32* @force_fignore, align 4
  %cmp51 = icmp eq i32 %52, 0
  br i1 %cmp51, label %if.then52, label %if.end55

if.then52:                                        ; preds = %if.end50
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then52
  %53 = load i32, i32* %oidx, align 4
  %tobool53 = icmp ne i32 %53, 0
  br i1 %tobool53, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %54 = load i8**, i8*** %oldnames, align 4
  %55 = load i32, i32* %oidx, align 4
  %dec = add nsw i32 %55, -1
  store i32 %dec, i32* %oidx, align 4
  %arrayidx54 = getelementptr inbounds i8*, i8** %54, i32 %dec
  %56 = load i8*, i8** %arrayidx54, align 4
  call void @sh_xfree(i8* %56, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2857)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %57 = load i8**, i8*** %oldnames, align 4
  %58 = bitcast i8** %57 to i8*
  call void @sh_xfree(i8* %58, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2858)
  br label %if.end55

if.end55:                                         ; preds = %while.end, %if.end50
  %59 = load i32, i32* %nidx, align 4
  %cmp56 = icmp eq i32 %59, 2
  br i1 %cmp56, label %if.then57, label %if.end62

if.then57:                                        ; preds = %if.end55
  %60 = load i8**, i8*** %names.addr, align 4
  %arrayidx58 = getelementptr inbounds i8*, i8** %60, i32 0
  %61 = load i8*, i8** %arrayidx58, align 4
  call void @sh_xfree(i8* %61, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2864)
  %62 = load i8**, i8*** %newnames, align 4
  %arrayidx59 = getelementptr inbounds i8*, i8** %62, i32 1
  %63 = load i8*, i8** %arrayidx59, align 4
  %64 = load i8**, i8*** %names.addr, align 4
  %arrayidx60 = getelementptr inbounds i8*, i8** %64, i32 0
  store i8* %63, i8** %arrayidx60, align 4
  %65 = load i8**, i8*** %names.addr, align 4
  %arrayidx61 = getelementptr inbounds i8*, i8** %65, i32 1
  store i8* null, i8** %arrayidx61, align 4
  %66 = load i8**, i8*** %newnames, align 4
  %67 = bitcast i8** %66 to i8*
  call void @sh_xfree(i8* %67, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2867)
  br label %return

if.end62:                                         ; preds = %if.end55
  store i32 1, i32* %nidx, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc69, %if.end62
  %68 = load i8**, i8*** %newnames, align 4
  %69 = load i32, i32* %nidx, align 4
  %arrayidx64 = getelementptr inbounds i8*, i8** %68, i32 %69
  %70 = load i8*, i8** %arrayidx64, align 4
  %tobool65 = icmp ne i8* %70, null
  br i1 %tobool65, label %for.body66, label %for.end71

for.body66:                                       ; preds = %for.cond63
  %71 = load i8**, i8*** %newnames, align 4
  %72 = load i32, i32* %nidx, align 4
  %arrayidx67 = getelementptr inbounds i8*, i8** %71, i32 %72
  %73 = load i8*, i8** %arrayidx67, align 4
  %74 = load i8**, i8*** %names.addr, align 4
  %75 = load i32, i32* %nidx, align 4
  %arrayidx68 = getelementptr inbounds i8*, i8** %74, i32 %75
  store i8* %73, i8** %arrayidx68, align 4
  br label %for.inc69

for.inc69:                                        ; preds = %for.body66
  %76 = load i32, i32* %nidx, align 4
  %inc70 = add nsw i32 %76, 1
  store i32 %inc70, i32* %nidx, align 4
  br label %for.cond63

for.end71:                                        ; preds = %for.cond63
  %77 = load i8**, i8*** %names.addr, align 4
  %78 = load i32, i32* %nidx, align 4
  %arrayidx72 = getelementptr inbounds i8*, i8** %77, i32 %78
  store i8* null, i8** %arrayidx72, align 4
  %79 = load i8**, i8*** %newnames, align 4
  %80 = bitcast i8** %79 to i8*
  call void @sh_xfree(i8* %80, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2876)
  br label %return

return:                                           ; preds = %for.end71, %if.then57, %if.end49, %if.end7
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @name_is_acceptable(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %p = alloca %struct.ign*, align 4
  %nlen = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %nlen, align 4
  %1 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @fignore, i32 0, i32 1), align 4
  store %struct.ign* %1, %struct.ign** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load %struct.ign*, %struct.ign** %p, align 4
  %val = getelementptr inbounds %struct.ign, %struct.ign* %2, i32 0, i32 0
  %3 = load i8*, i8** %val, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %nlen, align 4
  %5 = load %struct.ign*, %struct.ign** %p, align 4
  %len = getelementptr inbounds %struct.ign, %struct.ign* %5, i32 0, i32 1
  %6 = load i32, i32* %len, align 4
  %cmp = icmp sgt i32 %4, %6
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %7 = load %struct.ign*, %struct.ign** %p, align 4
  %len1 = getelementptr inbounds %struct.ign, %struct.ign* %7, i32 0, i32 1
  %8 = load i32, i32* %len1, align 4
  %cmp2 = icmp sgt i32 %8, 0
  br i1 %cmp2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %9 = load %struct.ign*, %struct.ign** %p, align 4
  %val4 = getelementptr inbounds %struct.ign, %struct.ign* %9, i32 0, i32 0
  %10 = load i8*, i8** %val4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %11 to i32
  %12 = load i8*, i8** %name.addr, align 4
  %13 = load i32, i32* %nlen, align 4
  %14 = load %struct.ign*, %struct.ign** %p, align 4
  %len5 = getelementptr inbounds %struct.ign, %struct.ign* %14, i32 0, i32 1
  %15 = load i32, i32* %len5, align 4
  %sub = sub nsw i32 %13, %15
  %arrayidx6 = getelementptr inbounds i8, i8* %12, i32 %sub
  %arrayidx7 = getelementptr inbounds i8, i8* %arrayidx6, i32 0
  %16 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %16 to i32
  %cmp9 = icmp eq i32 %conv, %conv8
  br i1 %cmp9, label %land.lhs.true11, label %if.end

land.lhs.true11:                                  ; preds = %land.lhs.true3
  %17 = load %struct.ign*, %struct.ign** %p, align 4
  %val12 = getelementptr inbounds %struct.ign, %struct.ign* %17, i32 0, i32 0
  %18 = load i8*, i8** %val12, align 4
  %19 = load i8*, i8** %name.addr, align 4
  %20 = load i32, i32* %nlen, align 4
  %21 = load %struct.ign*, %struct.ign** %p, align 4
  %len13 = getelementptr inbounds %struct.ign, %struct.ign* %21, i32 0, i32 1
  %22 = load i32, i32* %len13, align 4
  %sub14 = sub nsw i32 %20, %22
  %arrayidx15 = getelementptr inbounds i8, i8* %19, i32 %sub14
  %call16 = call i32 @strcmp(i8* %18, i8* %arrayidx15)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true11
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true11, %land.lhs.true3, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %23 = load %struct.ign*, %struct.ign** %p, align 4
  %incdec.ptr = getelementptr inbounds %struct.ign, %struct.ign* %23, i32 1
  store %struct.ign* %incdec.ptr, %struct.ign** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind
define internal i32 @return_zero(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 (i8**)* @save_directory_hook() #0 {
entry:
  %ret = alloca i32 (i8**)*, align 4
  %0 = load i32, i32* @dircomplete_expand, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  store i32 (i8**)* %1, i32 (i8**)** %ret, align 4
  store i32 (i8**)* null, i32 (i8**)** @rl_directory_completion_hook, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i32 (i8**)*, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  store i32 (i8**)* %2, i32 (i8**)** %ret, align 4
  store i32 (i8**)* null, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32 (i8**)*, i32 (i8**)** %ret, align 4
  ret i32 (i8**)* %3
}

; Function Attrs: noinline nounwind
define internal i8* @restore_tilde(i8* %val, i8* %directory_part) #0 {
entry:
  %val.addr = alloca i8*, align 4
  %directory_part.addr = alloca i8*, align 4
  %l = alloca i32, align 4
  %vl = alloca i32, align 4
  %dl2 = alloca i32, align 4
  %xl = alloca i32, align 4
  %dh2 = alloca i8*, align 4
  %expdir = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %val, i8** %val.addr, align 4
  store i8* %directory_part, i8** %directory_part.addr, align 4
  %0 = load i8*, i8** %val.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %vl, align 4
  %1 = load i8*, i8** %directory_part.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %directory_part.addr, align 4
  %call1 = call i8* @bash_dequote_filename(i8* %2, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call1, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %dh2, align 4
  call void @bash_directory_expansion(i8** %dh2)
  %3 = load i8*, i8** %dh2, align 4
  %call2 = call i32 @strlen(i8* %3)
  store i32 %call2, i32* %dl2, align 4
  %4 = load i8*, i8** %directory_part.addr, align 4
  %call3 = call i8* @bash_tilde_expand(i8* %4, i32 0)
  store i8* %call3, i8** %expdir, align 4
  %5 = load i8*, i8** %expdir, align 4
  %call4 = call i32 @strlen(i8* %5)
  store i32 %call4, i32* %xl, align 4
  %6 = load i8*, i8** %expdir, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2982)
  %7 = load i32, i32* %vl, align 4
  %8 = load i32, i32* %xl, align 4
  %sub = sub nsw i32 %7, %8
  %add = add nsw i32 %sub, 1
  store i32 %add, i32* %l, align 4
  %9 = load i32, i32* %dl2, align 4
  %add5 = add nsw i32 %9, 2
  %10 = load i32, i32* %l, align 4
  %add6 = add nsw i32 %add5, %10
  %call7 = call i8* @sh_xmalloc(i32 %add6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2993)
  store i8* %call7, i8** %ret, align 4
  %11 = load i8*, i8** %ret, align 4
  %12 = load i8*, i8** %dh2, align 4
  %call8 = call i8* @strcpy(i8* %11, i8* %12)
  %13 = load i8*, i8** %ret, align 4
  %14 = load i32, i32* %dl2, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8*, i8** %val.addr, align 4
  %16 = load i32, i32* %xl, align 4
  %add.ptr9 = getelementptr inbounds i8, i8* %15, i32 %16
  %call10 = call i8* @strcpy(i8* %add.ptr, i8* %add.ptr9)
  %17 = load i8*, i8** %dh2, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 2997)
  %18 = load i8*, i8** %ret, align 4
  ret i8* %18
}

; Function Attrs: noinline nounwind
define internal void @restore_directory_hook(i32 (i8**)* %hookf) #0 {
entry:
  %hookf.addr = alloca i32 (i8**)*, align 4
  store i32 (i8**)* %hookf, i32 (i8**)** %hookf.addr, align 4
  %0 = load i32, i32* @dircomplete_expand, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32 (i8**)*, i32 (i8**)** %hookf.addr, align 4
  store i32 (i8**)* %1, i32 (i8**)** @rl_directory_completion_hook, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i32 (i8**)*, i32 (i8**)** %hookf.addr, align 4
  store i32 (i8**)* %2, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @bash_directory_expansion(i8** %dirname) #0 {
entry:
  %dirname.addr = alloca i8**, align 4
  %d = alloca i8*, align 4
  %nd = alloca i8*, align 4
  store i8** %dirname, i8*** %dirname.addr, align 4
  %0 = load i8**, i8*** %dirname.addr, align 4
  %1 = load i8*, i8** %0, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3024)
  %2 = load i8**, i8*** %dirname.addr, align 4
  %3 = load i8*, i8** %2, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %3)
  store i8* %call2, i8** %d, align 4
  %4 = load i32 (i8**)*, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  %tobool = icmp ne i32 (i8**)* %4, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %5 = load i32 (i8**)*, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  %call3 = call i32 %5(i8** %d)
  %tobool4 = icmp ne i32 %call3, 0
  br i1 %tobool4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %6 = load i8**, i8*** %dirname.addr, align 4
  %7 = load i8*, i8** %6, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3028)
  %8 = load i8*, i8** %d, align 4
  %9 = load i8**, i8*** %dirname.addr, align 4
  store i8* %8, i8** %9, align 4
  br label %if.end15

if.else:                                          ; preds = %land.lhs.true, %entry
  %10 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %tobool5 = icmp ne i32 (i8**)* %10, null
  br i1 %tobool5, label %land.lhs.true6, label %if.else10

land.lhs.true6:                                   ; preds = %if.else
  %11 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %call7 = call i32 %11(i8** %d)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %land.lhs.true6
  %12 = load i8**, i8*** %dirname.addr, align 4
  %13 = load i8*, i8** %12, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3033)
  %14 = load i8*, i8** %d, align 4
  %15 = load i8**, i8*** %dirname.addr, align 4
  store i8* %14, i8** %15, align 4
  br label %if.end14

if.else10:                                        ; preds = %land.lhs.true6, %if.else
  %16 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool11 = icmp ne i32 %16, 0
  br i1 %tobool11, label %if.then12, label %if.end

if.then12:                                        ; preds = %if.else10
  %17 = load i8*, i8** %d, align 4
  %18 = load i32, i32* @rl_completion_quote_character, align 4
  %call13 = call i8* @bash_dequote_filename(i8* %17, i32 %18)
  store i8* %call13, i8** %nd, align 4
  %19 = load i8**, i8*** %dirname.addr, align 4
  %20 = load i8*, i8** %19, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3039)
  %21 = load i8*, i8** %d, align 4
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3040)
  %22 = load i8*, i8** %nd, align 4
  %23 = load i8**, i8*** %dirname.addr, align 4
  store i8* %22, i8** %23, align 4
  br label %if.end

if.end:                                           ; preds = %if.then12, %if.else10
  br label %if.end14

if.end14:                                         ; preds = %if.end, %if.then9
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then
  ret void
}

declare i8* @fnx_fromfs(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @directory_exists(i8* %dirname, i32 %should_dequote) #0 {
entry:
  %dirname.addr = alloca i8*, align 4
  %should_dequote.addr = alloca i32, align 4
  %new_dirname = alloca i8*, align 4
  %dirlen = alloca i32, align 4
  %r = alloca i32, align 4
  %sb = alloca %struct.stat, align 8
  store i8* %dirname, i8** %dirname.addr, align 4
  store i32 %should_dequote, i32* %should_dequote.addr, align 4
  %0 = load i32, i32* %should_dequote.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %dirname.addr, align 4
  %2 = load i32, i32* @rl_completion_quote_character, align 4
  %call = call i8* @bash_dequote_filename(i8* %1, i32 %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i8*, i8** %dirname.addr, align 4
  %call1 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3118)
  %4 = load i8*, i8** %dirname.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %call3, %cond.false ]
  store i8* %cond, i8** %new_dirname, align 4
  %5 = load i8*, i8** %new_dirname, align 4
  %tobool4 = icmp ne i8* %5, null
  br i1 %tobool4, label %land.lhs.true, label %cond.false22

land.lhs.true:                                    ; preds = %cond.end
  %6 = load i8*, i8** %new_dirname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %tobool5 = icmp ne i32 %conv, 0
  br i1 %tobool5, label %cond.true6, label %cond.false22

cond.true6:                                       ; preds = %land.lhs.true
  %8 = load i8*, i8** %new_dirname, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i32 1
  %9 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %9 to i32
  %tobool9 = icmp ne i32 %conv8, 0
  br i1 %tobool9, label %cond.true10, label %cond.false19

cond.true10:                                      ; preds = %cond.true6
  %10 = load i8*, i8** %new_dirname, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %10, i32 2
  %11 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %11 to i32
  %tobool13 = icmp ne i32 %conv12, 0
  br i1 %tobool13, label %cond.true14, label %cond.false16

cond.true14:                                      ; preds = %cond.true10
  %12 = load i8*, i8** %new_dirname, align 4
  %call15 = call i32 @strlen(i8* %12)
  br label %cond.end17

cond.false16:                                     ; preds = %cond.true10
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.true14
  %cond18 = phi i32 [ %call15, %cond.true14 ], [ 2, %cond.false16 ]
  br label %cond.end20

cond.false19:                                     ; preds = %cond.true6
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.end17
  %cond21 = phi i32 [ %cond18, %cond.end17 ], [ 1, %cond.false19 ]
  br label %cond.end23

cond.false22:                                     ; preds = %land.lhs.true, %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.end20
  %cond24 = phi i32 [ %cond21, %cond.end20 ], [ 0, %cond.false22 ]
  store i32 %cond24, i32* %dirlen, align 4
  %13 = load i8*, i8** %new_dirname, align 4
  %14 = load i32, i32* %dirlen, align 4
  %sub = sub nsw i32 %14, 1
  %arrayidx25 = getelementptr inbounds i8, i8* %13, i32 %sub
  %15 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %15 to i32
  %cmp = icmp eq i32 %conv26, 47
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end23
  %16 = load i8*, i8** %new_dirname, align 4
  %17 = load i32, i32* %dirlen, align 4
  %sub28 = sub nsw i32 %17, 1
  %arrayidx29 = getelementptr inbounds i8, i8* %16, i32 %sub28
  store i8 0, i8* %arrayidx29, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end23
  %18 = load i8*, i8** %new_dirname, align 4
  %call30 = call i32 @lstat(i8* %18, %struct.stat* %sb)
  %cmp31 = icmp eq i32 %call30, 0
  %conv32 = zext i1 %cmp31 to i32
  store i32 %conv32, i32* %r, align 4
  %19 = load i8*, i8** %new_dirname, align 4
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3127)
  %20 = load i32, i32* %r, align 4
  ret i32 %20
}

declare %struct.word_list* @expand_prompt_string(i8*, i32, i32) #1

declare i8* @get_working_directory(i8*) #1

declare i8* @make_absolute(i8*, i8*) #1

declare i8* @sh_canonpath(i8*, i32) #1

declare i32 @lstat(i8*, %struct.stat*) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare i8* @dirspell(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @history_completion_generator(i8* %hint_text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %hint_text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  store i8* %hint_text, i8** %hint_text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @dabbrev_expand_active, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  store i32 1, i32* @rl_completion_suppress_append, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store i32 0, i32* @history_completion_generator.local_index, align 4
  call void @build_history_completion_array()
  %2 = load i8*, i8** %hint_text.addr, align 4
  store i8* %2, i8** @history_completion_generator.text, align 4
  %3 = load i8*, i8** @history_completion_generator.text, align 4
  %call = call i32 @strlen(i8* %3)
  store i32 %call, i32* @history_completion_generator.len, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.end, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end15, %if.end2
  %4 = load i8**, i8*** @history_completion_array, align 4
  %tobool3 = icmp ne i8** %4, null
  br i1 %tobool3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %5 = load i8**, i8*** @history_completion_array, align 4
  %6 = load i32, i32* @history_completion_generator.local_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx, align 4
  %tobool4 = icmp ne i8* %7, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %8 = phi i1 [ false, %while.cond ], [ %tobool4, %land.rhs ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %9 = load i8*, i8** @history_completion_generator.text, align 4
  %10 = load i8**, i8*** @history_completion_array, align 4
  %11 = load i32, i32* @history_completion_generator.local_index, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* @history_completion_generator.local_index, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx5, align 4
  %13 = load i32, i32* @history_completion_generator.len, align 4
  %call6 = call i32 @strncmp(i8* %9, i8* %12, i32 %13)
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %while.body
  %14 = load i8**, i8*** @history_completion_array, align 4
  %15 = load i32, i32* @history_completion_generator.local_index, align 4
  %sub = sub nsw i32 %15, 1
  %arrayidx9 = getelementptr inbounds i8*, i8** %14, i32 %sub
  %16 = load i8*, i8** %arrayidx9, align 4
  %call10 = call i32 @strlen(i8* %16)
  %add = add i32 1, %call10
  %call11 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3454)
  %17 = load i8**, i8*** @history_completion_array, align 4
  %18 = load i32, i32* @history_completion_generator.local_index, align 4
  %sub12 = sub nsw i32 %18, 1
  %arrayidx13 = getelementptr inbounds i8*, i8** %17, i32 %sub12
  %19 = load i8*, i8** %arrayidx13, align 4
  %call14 = call i8* @strcpy(i8* %call11, i8* %19)
  store i8* %call14, i8** %retval, align 4
  br label %return

if.end15:                                         ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %land.end
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then8
  %20 = load i8*, i8** %retval, align 4
  ret i8* %20
}

declare i32 @rl_complete_internal(i32) #1

; Function Attrs: noinline nounwind
define internal void @build_history_completion_array() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %hlist = alloca %struct._hist_entry**, align 4
  %tokens = alloca i8**, align 4
  %0 = load i32, i32* @harry_size, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** @history_completion_array, align 4
  call void @strvec_dispose(i8** %1)
  store i8** null, i8*** @history_completion_array, align 4
  store i32 0, i32* @harry_size, align 4
  store i32 0, i32* @harry_len, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call, %struct._hist_entry*** %hlist, align 4
  %2 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %tobool1 = icmp ne %struct._hist_entry** %2, null
  br i1 %tobool1, label %if.then2, label %if.end31

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %3 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %3, i32 %4
  %5 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool3 = icmp ne %struct._hist_entry* %5, null
  br i1 %tobool3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %i, align 4
  %dec = add nsw i32 %7, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc25, %for.end
  %8 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %8, 0
  br i1 %cmp, label %for.body5, label %for.end27

for.body5:                                        ; preds = %for.cond4
  %9 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %9, i32 %10
  %11 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx6, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 0
  %12 = load i8*, i8** %line, align 4
  %call7 = call i8** @history_tokenize(i8* %12)
  store i8** %call7, i8*** %tokens, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc22, %for.body5
  %13 = load i8**, i8*** %tokens, align 4
  %tobool9 = icmp ne i8** %13, null
  br i1 %tobool9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond8
  %14 = load i8**, i8*** %tokens, align 4
  %15 = load i32, i32* %j, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx10, align 4
  %tobool11 = icmp ne i8* %16, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond8
  %17 = phi i1 [ false, %for.cond8 ], [ %tobool11, %land.rhs ]
  br i1 %17, label %for.body12, label %for.end24

for.body12:                                       ; preds = %land.end
  %18 = load i32, i32* @harry_len, align 4
  %add = add nsw i32 %18, 2
  %19 = load i32, i32* @harry_size, align 4
  %cmp13 = icmp sgt i32 %add, %19
  br i1 %cmp13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %for.body12
  %20 = load i8**, i8*** @history_completion_array, align 4
  %21 = load i32, i32* @harry_size, align 4
  %add15 = add nsw i32 %21, 10
  store i32 %add15, i32* @harry_size, align 4
  %call16 = call i8** @strvec_resize(i8** %20, i32 %add15)
  store i8** %call16, i8*** @history_completion_array, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then14, %for.body12
  %22 = load i8**, i8*** %tokens, align 4
  %23 = load i32, i32* %j, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx18, align 4
  %25 = load i8**, i8*** @history_completion_array, align 4
  %26 = load i32, i32* @harry_len, align 4
  %inc19 = add nsw i32 %26, 1
  store i32 %inc19, i32* @harry_len, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %25, i32 %26
  store i8* %24, i8** %arrayidx20, align 4
  %27 = load i8**, i8*** @history_completion_array, align 4
  %28 = load i32, i32* @harry_len, align 4
  %arrayidx21 = getelementptr inbounds i8*, i8** %27, i32 %28
  store i8* null, i8** %arrayidx21, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %if.end17
  %29 = load i32, i32* %j, align 4
  %inc23 = add nsw i32 %29, 1
  store i32 %inc23, i32* %j, align 4
  br label %for.cond8

for.end24:                                        ; preds = %land.end
  %30 = load i8**, i8*** %tokens, align 4
  %31 = bitcast i8** %30 to i8*
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3422)
  br label %for.inc25

for.inc25:                                        ; preds = %for.end24
  %32 = load i32, i32* %i, align 4
  %dec26 = add nsw i32 %32, -1
  store i32 %dec26, i32* %i, align 4
  br label %for.cond4

for.end27:                                        ; preds = %for.cond4
  %33 = load i32, i32* @dabbrev_expand_active, align 4
  %cmp28 = icmp eq i32 %33, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %for.end27
  %34 = load i8**, i8*** @history_completion_array, align 4
  %35 = bitcast i8** %34 to i8*
  %36 = load i32, i32* @harry_len, align 4
  call void @qsort(i8* %35, i32 %36, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @strvec_strcmp to i32 (i8*, i8*)*))
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %for.end27
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.end
  ret void
}

declare %struct._hist_entry** @history_list() #1

declare i8** @history_tokenize(i8*) #1

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

declare i32 @strvec_strcmp(i8**, i8**) #1

declare i32 @rl_menu_complete(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_username_internal(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i32, i32* %what_to_do.addr, align 4
  %call = call i32 @bash_specific_completion(i32 %0, i8* (i8*, i32)* @rl_username_completion_function)
  ret i32 %call
}

declare i32 @rl_completion_mode(i32 (i32, i32)*) #1

; Function Attrs: noinline nounwind
define internal i32 @bash_specific_completion(i32 %what_to_do, i8* (i8*, i32)* %generator) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  %generator.addr = alloca i8* (i8*, i32)*, align 4
  %orig_func = alloca i8* (i8*, i32)*, align 4
  %orig_attempt_func = alloca i8** (i8*, i32, i32)*, align 4
  %orig_ignore_func = alloca i32 (i8**)*, align 4
  %r = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  store i8* (i8*, i32)* %generator, i8* (i8*, i32)** %generator.addr, align 4
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8* (i8*, i32)* %0, i8* (i8*, i32)** %orig_func, align 4
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %1, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  %2 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i32 (i8**)* %2, i32 (i8**)** %orig_ignore_func, align 4
  %3 = load i8* (i8*, i32)*, i8* (i8*, i32)** %generator.addr, align 4
  store i8* (i8*, i32)* %3, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %4 = load i32 (i8**)*, i32 (i8**)** %orig_ignore_func, align 4
  store i32 (i8**)* %4, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %5 = load i32, i32* %what_to_do.addr, align 4
  %call = call i32 @rl_complete_internal(i32 %5)
  store i32 %call, i32* %r, align 4
  %6 = load i8* (i8*, i32)*, i8* (i8*, i32)** %orig_func, align 4
  store i8* (i8*, i32)* %6, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %7 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  store i8** (i8*, i32, i32)* %7, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %8 = load i32 (i8**)*, i32 (i8**)** %orig_ignore_func, align 4
  store i32 (i8**)* %8, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %9 = load i32, i32* %r, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_filename_internal(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  %orig_func = alloca i8* (i8*, i32)*, align 4
  %orig_attempt_func = alloca i8** (i8*, i32, i32)*, align 4
  %orig_dir_func = alloca i32 (i8**)*, align 4
  %orig_ignore_func = alloca i32 (i8**)*, align 4
  %orig_rl_completer_word_break_characters = alloca i8*, align 4
  %r = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8* (i8*, i32)* %0, i8* (i8*, i32)** %orig_func, align 4
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %1, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  %2 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i32 (i8**)* %2, i32 (i8**)** %orig_ignore_func, align 4
  %3 = load i8*, i8** @rl_completer_word_break_characters, align 4
  store i8* %3, i8** %orig_rl_completer_word_break_characters, align 4
  %call = call i32 (i8**)* @save_directory_hook()
  store i32 (i8**)* %call, i32 (i8**)** %orig_dir_func, align 4
  store i8* (i8*, i32)* @rl_filename_completion_function, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i32 (i8**)* @filename_completion_ignore, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.69, i32 0, i32 0), i8** @rl_completer_word_break_characters, align 4
  %4 = load i32, i32* %what_to_do.addr, align 4
  %call1 = call i32 @rl_complete_internal(i32 %4)
  store i32 %call1, i32* %r, align 4
  %5 = load i8* (i8*, i32)*, i8* (i8*, i32)** %orig_func, align 4
  store i8* (i8*, i32)* %5, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %6 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  store i8** (i8*, i32, i32)* %6, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %7 = load i32 (i8**)*, i32 (i8**)** %orig_ignore_func, align 4
  store i32 (i8**)* %7, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %8 = load i8*, i8** %orig_rl_completer_word_break_characters, align 4
  store i8* %8, i8** @rl_completer_word_break_characters, align 4
  %9 = load i32 (i8**)*, i32 (i8**)** %orig_dir_func, align 4
  call void @restore_directory_hook(i32 (i8**)* %9)
  %10 = load i32, i32* %r, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_hostname_internal(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i32, i32* %what_to_do.addr, align 4
  %call = call i32 @bash_specific_completion(i32 %0, i8* (i8*, i32)* @hostname_completion_function)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_variable_internal(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i32, i32* %what_to_do.addr, align 4
  %call = call i32 @bash_specific_completion(i32 %0, i8* (i8*, i32)* @variable_completion_function)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @bash_complete_command_internal(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i32, i32* %what_to_do.addr, align 4
  %call = call i32 @bash_specific_completion(i32 %0, i8* (i8*, i32)* @command_word_completion_function)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i8* @bash_glob_quote_filename(i8* %s, i32 %rtype, i8* %qcp) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %rtype.addr = alloca i32, align 4
  %qcp.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %rtype, i32* %rtype.addr, align 4
  store i8* %qcp, i8** %qcp.addr, align 4
  %0 = load i8*, i8** @globorig, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %qcp.addr, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i8*, i8** %qcp.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %4 = load i8*, i8** %s.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %5 to i32
  %6 = load i8*, i8** @globorig, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %7 to i32
  %cmp8 = icmp eq i32 %conv5, %conv7
  br i1 %cmp8, label %land.lhs.true10, label %if.else

land.lhs.true10:                                  ; preds = %land.lhs.true4
  %8 = load i8*, i8** %s.addr, align 4
  %9 = load i8*, i8** @globorig, align 4
  %call = call i32 @strcmp(i8* %8, i8* %9)
  %cmp11 = icmp eq i32 %call, 0
  br i1 %cmp11, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true10
  %10 = load i8*, i8** %s.addr, align 4
  %call13 = call i32 @strlen(i8* %10)
  %add = add i32 1, %call13
  %call14 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3727)
  %11 = load i8*, i8** %s.addr, align 4
  %call15 = call i8* @strcpy(i8* %call14, i8* %11)
  store i8* %call15, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true10, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  %12 = load i8*, i8** %s.addr, align 4
  %13 = load i32, i32* %rtype.addr, align 4
  %14 = load i8*, i8** %qcp.addr, align 4
  %call16 = call i8* @bash_quote_filename(i8* %12, i32 %13, i8* %14)
  store i8* %call16, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %15 = load i8*, i8** %retval, align 4
  ret i8* %15
}

; Function Attrs: noinline nounwind
define internal i32 @bash_glob_completion_internal(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i32, i32* %what_to_do.addr, align 4
  %call = call i32 @bash_specific_completion(i32 %0, i8* (i8*, i32)* @glob_complete_word)
  ret i32 %call
}

declare i32 @rl_vi_end_word(i32, i32) #1

declare i32 @rl_vi_bWord(i32, i32) #1

declare void @rl_vi_start_inserting(i32, i32, i32) #1

declare i8* @sh_double_quote(i8*) #1

declare i8* @sh_single_quote(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @quote_word_break_chars(i8* %text) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  %l = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %l, align 4
  %1 = load i32, i32* %l, align 4
  %mul = mul nsw i32 2, %1
  %add = add nsw i32 %mul, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 3910)
  store i8* %call1, i8** %ret, align 4
  %2 = load i8*, i8** %text.addr, align 4
  store i8* %2, i8** %s, align 4
  %3 = load i8*, i8** %ret, align 4
  store i8* %3, i8** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  %tobool = icmp ne i8 %5, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, 92
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %for.body
  %8 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 92, i8* %8, align 1
  %9 = load i8*, i8** %s, align 4
  %incdec.ptr3 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr3, i8** %s, align 4
  %10 = load i8, i8* %incdec.ptr3, align 1
  %11 = load i8*, i8** %r, align 4
  %incdec.ptr4 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr4, i8** %r, align 4
  store i8 %10, i8* %11, align 1
  %12 = load i8*, i8** %s, align 4
  %13 = load i8, i8* %12, align 1
  %conv5 = sext i8 %13 to i32
  %cmp6 = icmp eq i32 %conv5, 0
  br i1 %cmp6, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.then
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.inc

if.end9:                                          ; preds = %for.body
  %14 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %15 = load i8*, i8** %s, align 4
  %16 = load i8, i8* %15, align 1
  %conv10 = sext i8 %16 to i32
  %call11 = call i8* @mbschr(i8* %14, i32 %conv10)
  %tobool12 = icmp ne i8* %call11, null
  br i1 %tobool12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end9
  %17 = load i8*, i8** %r, align 4
  %incdec.ptr14 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr14, i8** %r, align 4
  store i8 92, i8* %17, align 1
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end9
  %18 = load i8*, i8** %s, align 4
  %19 = load i8*, i8** %text.addr, align 4
  %cmp16 = icmp eq i8* %18, %19
  br i1 %cmp16, label %land.lhs.true, label %if.end26

land.lhs.true:                                    ; preds = %if.end15
  %20 = load i8*, i8** %s, align 4
  %21 = load i8, i8* %20, align 1
  %conv18 = sext i8 %21 to i32
  %cmp19 = icmp eq i32 %conv18, 126
  br i1 %cmp19, label %land.lhs.true21, label %if.end26

land.lhs.true21:                                  ; preds = %land.lhs.true
  %22 = load i8*, i8** %text.addr, align 4
  %call22 = call i32 @file_exists(i8* %22)
  %tobool23 = icmp ne i32 %call22, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %land.lhs.true21
  %23 = load i8*, i8** %r, align 4
  %incdec.ptr25 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr25, i8** %r, align 4
  store i8 92, i8* %23, align 1
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %land.lhs.true21, %land.lhs.true, %if.end15
  %24 = load i8*, i8** %s, align 4
  %25 = load i8, i8* %24, align 1
  %26 = load i8*, i8** %r, align 4
  %incdec.ptr27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr27, i8** %r, align 4
  store i8 %25, i8* %26, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end26, %if.end
  %27 = load i8*, i8** %s, align 4
  %incdec.ptr28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr28, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then8, %for.cond
  %28 = load i8*, i8** %r, align 4
  store i8 0, i8* %28, align 1
  %29 = load i8*, i8** %ret, align 4
  ret i8* %29
}

declare i32 @file_exists(i8*) #1

declare %struct._keymap_entry* @rl_make_bare_keymap() #1

declare void @internal_error(i8*, ...) #1

declare i8* @rl_get_termcap(i8*) #1

declare i32 @rl_clear_visible_line() #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare i8* @inttostr(i64, i8*, i32) #1

declare %struct.variable* @bind_int_variable(i8*, i8*) #1

declare %struct.variable* @find_variable(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare i32 @check_unbind_variable(i8*) #1

declare void @rl_redraw_prompt_last_line() #1

declare void @rl_cleanup_after_signal() #1

declare void @check_signals_and_traps() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
