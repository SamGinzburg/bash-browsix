; ModuleID = 'bind.c'
source_filename = "bind.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._funmap = type { i8*, i32 (i32, i32)* }
%struct.anon = type { i8*, i32*, i32 }
%struct.anon.0 = type { i8*, i32, i32 (i8*)* }
%struct.anon.1 = type { i8*, %struct._keymap_entry* }
%struct._IO_FILE = type opaque
%struct.anon.2 = type { i8*, i32 (i8*)* }
%struct.assoc_list = type { i8*, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@_rl_convert_meta_chars_to_ascii = external global i32, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@rl_binding_keymap = common global %struct._keymap_entry* null, align 4
@.str = private unnamed_addr constant [6 x i8] c"C-\5CM-\00", align 1
@rl_untranslate_keyseq.kseq = internal global [16 x i8] zeroinitializer, align 1
@funmap = external global %struct._funmap**, align 4
@last_readline_init_file = internal global i8* null, align 4
@.str.1 = private unnamed_addr constant [8 x i8] c"INPUTRC\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"~/.inputrc\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"/etc/inputrc\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Control-\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"C-\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"CTRL-\00", align 1
@_rl_possible_control_prefixes = constant [4 x i8*] [i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* null], align 4
@.str.7 = private unnamed_addr constant [5 x i8] c"Meta\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"M-\00", align 1
@_rl_possible_meta_prefixes = constant [3 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* null], align 4
@.str.9 = private unnamed_addr constant [6 x i8] c"other\00", align 1
@rl_readline_name = global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i32 0, i32 0), align 4
@_rl_parsing_conditionalized_out = external global i8, align 1
@.str.10 = private unnamed_addr constant [34 x i8] c"%s: no closing `\22' in key binding\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"set\00", align 1
@.str.12 = private unnamed_addr constant [31 x i8] c"%s: no key sequence terminator\00", align 1
@.str.13 = private unnamed_addr constant [25 x i8] c"%s: unknown key modifier\00", align 1
@.str.14 = private unnamed_addr constant [12 x i8] c"prefix-meta\00", align 1
@emacs_meta_keymap = external global [257 x %struct._keymap_entry], align 4
@boolean_varlist = internal constant [34 x %struct.anon] [%struct.anon { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.49, i32 0, i32 0), i32* @_rl_bind_stty_chars, i32 0 }, %struct.anon { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.50, i32 0, i32 0), i32* @rl_blink_matching_paren, i32 1 }, %struct.anon { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.51, i32 0, i32 0), i32* @rl_byte_oriented, i32 0 }, %struct.anon { i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.52, i32 0, i32 0), i32* @_rl_colored_completion_prefix, i32 0 }, %struct.anon { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.53, i32 0, i32 0), i32* @_rl_colored_stats, i32 0 }, %struct.anon { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.54, i32 0, i32 0), i32* @_rl_completion_case_fold, i32 0 }, %struct.anon { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.55, i32 0, i32 0), i32* @_rl_completion_case_map, i32 0 }, %struct.anon { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.56, i32 0, i32 0), i32* @_rl_convert_meta_chars_to_ascii, i32 0 }, %struct.anon { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.57, i32 0, i32 0), i32* @rl_inhibit_completion, i32 0 }, %struct.anon { i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.58, i32 0, i32 0), i32* @_rl_echo_control_chars, i32 0 }, %struct.anon { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.59, i32 0, i32 0), i32* @_rl_enable_bracketed_paste, i32 0 }, %struct.anon { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.60, i32 0, i32 0), i32* @_rl_enable_keypad, i32 0 }, %struct.anon { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.61, i32 0, i32 0), i32* @_rl_enable_meta, i32 0 }, %struct.anon { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.62, i32 0, i32 0), i32* @rl_complete_with_tilde_expansion, i32 0 }, %struct.anon { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.63, i32 0, i32 0), i32* @_rl_history_preserve_point, i32 0 }, %struct.anon { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.64, i32 0, i32 0), i32* @_rl_horizontal_scroll_mode, i32 0 }, %struct.anon { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.65, i32 0, i32 0), i32* @_rl_meta_flag, i32 0 }, %struct.anon { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.66, i32 0, i32 0), i32* @_rl_complete_mark_directories, i32 0 }, %struct.anon { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.67, i32 0, i32 0), i32* @_rl_mark_modified_lines, i32 0 }, %struct.anon { i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.68, i32 0, i32 0), i32* @_rl_complete_mark_symlink_dirs, i32 0 }, %struct.anon { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.69, i32 0, i32 0), i32* @_rl_match_hidden_files, i32 0 }, %struct.anon { i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.70, i32 0, i32 0), i32* @_rl_menu_complete_prefix_first, i32 0 }, %struct.anon { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.71, i32 0, i32 0), i32* @_rl_meta_flag, i32 0 }, %struct.anon { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.72, i32 0, i32 0), i32* @_rl_output_meta_chars, i32 0 }, %struct.anon { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.73, i32 0, i32 0), i32* @_rl_page_completions, i32 0 }, %struct.anon { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.74, i32 0, i32 0), i32* @_rl_prefer_visible_bell, i32 1 }, %struct.anon { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.75, i32 0, i32 0), i32* @_rl_print_completions_horizontally, i32 0 }, %struct.anon { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.76, i32 0, i32 0), i32* @_rl_revert_all_at_newline, i32 0 }, %struct.anon { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.77, i32 0, i32 0), i32* @_rl_complete_show_all, i32 0 }, %struct.anon { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.78, i32 0, i32 0), i32* @_rl_complete_show_unmodified, i32 0 }, %struct.anon { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.79, i32 0, i32 0), i32* @_rl_show_mode_in_prompt, i32 0 }, %struct.anon { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.80, i32 0, i32 0), i32* @_rl_skip_completed_text, i32 0 }, %struct.anon { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.81, i32 0, i32 0), i32* @rl_visible_stats, i32 0 }, %struct.anon zeroinitializer], align 4
@.str.15 = private unnamed_addr constant [3 x i8] c"on\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"off\00", align 1
@string_varlist = internal constant [14 x %struct.anon.0] [%struct.anon.0 { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.82, i32 0, i32 0), i32 1, i32 (i8*)* @sv_bell_style }, %struct.anon.0 { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.83, i32 0, i32 0), i32 1, i32 (i8*)* @sv_combegin }, %struct.anon.0 { i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.84, i32 0, i32 0), i32 2, i32 (i8*)* @sv_compwidth }, %struct.anon.0 { i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.85, i32 0, i32 0), i32 2, i32 (i8*)* @sv_dispprefix }, %struct.anon.0 { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.86, i32 0, i32 0), i32 2, i32 (i8*)* @sv_compquery }, %struct.anon.0 { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.87, i32 0, i32 0), i32 1, i32 (i8*)* @sv_editmode }, %struct.anon.0 { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.88, i32 0, i32 0), i32 1, i32 (i8*)* @sv_emacs_modestr }, %struct.anon.0 { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.89, i32 0, i32 0), i32 2, i32 (i8*)* @sv_histsize }, %struct.anon.0 { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.90, i32 0, i32 0), i32 1, i32 (i8*)* @sv_isrchterm }, %struct.anon.0 { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.91, i32 0, i32 0), i32 1, i32 (i8*)* @sv_keymap }, %struct.anon.0 { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.92, i32 0, i32 0), i32 2, i32 (i8*)* @sv_seqtimeout }, %struct.anon.0 { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.93, i32 0, i32 0), i32 1, i32 (i8*)* @sv_vicmd_modestr }, %struct.anon.0 { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.94, i32 0, i32 0), i32 1, i32 (i8*)* @sv_viins_modestr }, %struct.anon.0 zeroinitializer], align 4
@.str.17 = private unnamed_addr constant [26 x i8] c"%s: unknown variable name\00", align 1
@keymap_names = internal constant [9 x %struct.anon.1] [%struct.anon.1 { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.108, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.109, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.110, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_ctlx_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.111, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.112, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0) }, %struct.anon.1 { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.113, i32 0, i32 0), %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0) }, %struct.anon.1 zeroinitializer], align 4
@rl_editing_mode = external global i32, align 4
@emacs_standard_keymap = external global [257 x %struct._keymap_entry], align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@.str.18 = private unnamed_addr constant [6 x i8] c"emacs\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"vi\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@rl_outstream = external global %struct._IO_FILE*, align 4
@.str.21 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"\5CM-\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"\5Ce\00", align 1
@.str.24 = private unnamed_addr constant [6 x i8] c"\5CC-%c\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"\5CC-?\00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.27 = private unnamed_addr constant [18 x i8] c"# %s (not bound)\0A\00", align 1
@.str.28 = private unnamed_addr constant [10 x i8] c"\22%s\22: %s\0A\00", align 1
@.str.29 = private unnamed_addr constant [29 x i8] c"%s is not bound to any keys\0A\00", align 1
@.str.30 = private unnamed_addr constant [20 x i8] c"%s can be found on \00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"\22%s\22%s\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c".\0A\00", align 1
@.str.34 = private unnamed_addr constant [5 x i8] c"...\0A\00", align 1
@rl_dispatching = external global i32, align 4
@.str.35 = private unnamed_addr constant [3 x i8] c"\0D\0A\00", align 1
@rl_explicit_arg = external global i32, align 4
@.str.36 = private unnamed_addr constant [11 x i8] c"set %s %s\0A\00", align 1
@.str.37 = private unnamed_addr constant [19 x i8] c"%s is set to `%s'\0A\00", align 1
@current_readline_init_file = internal global i8* null, align 4
@current_readline_init_include_level = internal global i32 0, align 4
@_rl_caught_signal = external global i32, align 4
@currently_reading_init_file = internal global i32 0, align 4
@current_readline_init_lineno = internal global i32 0, align 4
@parser_directives = internal constant [5 x %struct.anon.2] [%struct.anon.2 { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.39, i32 0, i32 0), i32 (i8*)* @parser_if }, %struct.anon.2 { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.40, i32 0, i32 0), i32 (i8*)* @parser_endif }, %struct.anon.2 { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0), i32 (i8*)* @parser_else }, %struct.anon.2 { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.42, i32 0, i32 0), i32 (i8*)* @parser_include }, %struct.anon.2 zeroinitializer], align 4
@.str.38 = private unnamed_addr constant [29 x i8] c"%s: unknown parser directive\00", align 1
@.str.39 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.40 = private unnamed_addr constant [6 x i8] c"endif\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.42 = private unnamed_addr constant [8 x i8] c"include\00", align 1
@if_stack_depth = internal global i32 0, align 4
@if_stack_size = internal global i32 0, align 4
@if_stack = internal global i8* null, align 4
@rl_terminal_name = external global i8*, align 4
@.str.43 = private unnamed_addr constant [6 x i8] c"term=\00", align 1
@.str.44 = private unnamed_addr constant [6 x i8] c"mode=\00", align 1
@.str.45 = private unnamed_addr constant [28 x i8] c"$endif without matching $if\00", align 1
@.str.46 = private unnamed_addr constant [33 x i8] c"$else found without matching $if\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.47 = private unnamed_addr constant [11 x i8] c"readline: \00", align 1
@.str.48 = private unnamed_addr constant [14 x i8] c"%s: line %d: \00", align 1
@.str.49 = private unnamed_addr constant [23 x i8] c"bind-tty-special-chars\00", align 1
@_rl_bind_stty_chars = external global i32, align 4
@.str.50 = private unnamed_addr constant [21 x i8] c"blink-matching-paren\00", align 1
@rl_blink_matching_paren = external global i32, align 4
@.str.51 = private unnamed_addr constant [14 x i8] c"byte-oriented\00", align 1
@rl_byte_oriented = external global i32, align 4
@.str.52 = private unnamed_addr constant [26 x i8] c"colored-completion-prefix\00", align 1
@_rl_colored_completion_prefix = external global i32, align 4
@.str.53 = private unnamed_addr constant [14 x i8] c"colored-stats\00", align 1
@_rl_colored_stats = external global i32, align 4
@.str.54 = private unnamed_addr constant [23 x i8] c"completion-ignore-case\00", align 1
@_rl_completion_case_fold = external global i32, align 4
@.str.55 = private unnamed_addr constant [20 x i8] c"completion-map-case\00", align 1
@_rl_completion_case_map = external global i32, align 4
@.str.56 = private unnamed_addr constant [13 x i8] c"convert-meta\00", align 1
@.str.57 = private unnamed_addr constant [19 x i8] c"disable-completion\00", align 1
@rl_inhibit_completion = external global i32, align 4
@.str.58 = private unnamed_addr constant [24 x i8] c"echo-control-characters\00", align 1
@_rl_echo_control_chars = external global i32, align 4
@.str.59 = private unnamed_addr constant [23 x i8] c"enable-bracketed-paste\00", align 1
@_rl_enable_bracketed_paste = external global i32, align 4
@.str.60 = private unnamed_addr constant [14 x i8] c"enable-keypad\00", align 1
@_rl_enable_keypad = external global i32, align 4
@.str.61 = private unnamed_addr constant [16 x i8] c"enable-meta-key\00", align 1
@_rl_enable_meta = external global i32, align 4
@.str.62 = private unnamed_addr constant [13 x i8] c"expand-tilde\00", align 1
@rl_complete_with_tilde_expansion = external global i32, align 4
@.str.63 = private unnamed_addr constant [23 x i8] c"history-preserve-point\00", align 1
@_rl_history_preserve_point = external global i32, align 4
@.str.64 = private unnamed_addr constant [23 x i8] c"horizontal-scroll-mode\00", align 1
@_rl_horizontal_scroll_mode = external global i32, align 4
@.str.65 = private unnamed_addr constant [11 x i8] c"input-meta\00", align 1
@_rl_meta_flag = external global i32, align 4
@.str.66 = private unnamed_addr constant [17 x i8] c"mark-directories\00", align 1
@_rl_complete_mark_directories = external global i32, align 4
@.str.67 = private unnamed_addr constant [20 x i8] c"mark-modified-lines\00", align 1
@_rl_mark_modified_lines = external global i32, align 4
@.str.68 = private unnamed_addr constant [27 x i8] c"mark-symlinked-directories\00", align 1
@_rl_complete_mark_symlink_dirs = external global i32, align 4
@.str.69 = private unnamed_addr constant [19 x i8] c"match-hidden-files\00", align 1
@_rl_match_hidden_files = external global i32, align 4
@.str.70 = private unnamed_addr constant [29 x i8] c"menu-complete-display-prefix\00", align 1
@_rl_menu_complete_prefix_first = external global i32, align 4
@.str.71 = private unnamed_addr constant [10 x i8] c"meta-flag\00", align 1
@.str.72 = private unnamed_addr constant [12 x i8] c"output-meta\00", align 1
@_rl_output_meta_chars = external global i32, align 4
@.str.73 = private unnamed_addr constant [17 x i8] c"page-completions\00", align 1
@_rl_page_completions = external global i32, align 4
@.str.74 = private unnamed_addr constant [20 x i8] c"prefer-visible-bell\00", align 1
@_rl_prefer_visible_bell = internal global i32 1, align 4
@.str.75 = private unnamed_addr constant [31 x i8] c"print-completions-horizontally\00", align 1
@_rl_print_completions_horizontally = external global i32, align 4
@.str.76 = private unnamed_addr constant [22 x i8] c"revert-all-at-newline\00", align 1
@_rl_revert_all_at_newline = external global i32, align 4
@.str.77 = private unnamed_addr constant [22 x i8] c"show-all-if-ambiguous\00", align 1
@_rl_complete_show_all = external global i32, align 4
@.str.78 = private unnamed_addr constant [23 x i8] c"show-all-if-unmodified\00", align 1
@_rl_complete_show_unmodified = external global i32, align 4
@.str.79 = private unnamed_addr constant [20 x i8] c"show-mode-in-prompt\00", align 1
@_rl_show_mode_in_prompt = external global i32, align 4
@.str.80 = private unnamed_addr constant [20 x i8] c"skip-completed-text\00", align 1
@_rl_skip_completed_text = external global i32, align 4
@.str.81 = private unnamed_addr constant [14 x i8] c"visible-stats\00", align 1
@rl_visible_stats = external global i32, align 4
@.str.82 = private unnamed_addr constant [11 x i8] c"bell-style\00", align 1
@.str.83 = private unnamed_addr constant [14 x i8] c"comment-begin\00", align 1
@.str.84 = private unnamed_addr constant [25 x i8] c"completion-display-width\00", align 1
@.str.85 = private unnamed_addr constant [33 x i8] c"completion-prefix-display-length\00", align 1
@.str.86 = private unnamed_addr constant [23 x i8] c"completion-query-items\00", align 1
@.str.87 = private unnamed_addr constant [13 x i8] c"editing-mode\00", align 1
@.str.88 = private unnamed_addr constant [18 x i8] c"emacs-mode-string\00", align 1
@.str.89 = private unnamed_addr constant [13 x i8] c"history-size\00", align 1
@.str.90 = private unnamed_addr constant [20 x i8] c"isearch-terminators\00", align 1
@.str.91 = private unnamed_addr constant [7 x i8] c"keymap\00", align 1
@.str.92 = private unnamed_addr constant [15 x i8] c"keyseq-timeout\00", align 1
@.str.93 = private unnamed_addr constant [19 x i8] c"vi-cmd-mode-string\00", align 1
@.str.94 = private unnamed_addr constant [19 x i8] c"vi-ins-mode-string\00", align 1
@_rl_bell_preference = external global i32, align 4
@.str.95 = private unnamed_addr constant [8 x i8] c"audible\00", align 1
@.str.96 = private unnamed_addr constant [8 x i8] c"visible\00", align 1
@_rl_comment_begin = external global i8*, align 4
@_rl_completion_columns = external global i32, align 4
@_rl_completion_prefix_display_length = external global i32, align 4
@rl_completion_query_items = external global i32, align 4
@_rl_emacs_mode_str = external global i8*, align 4
@_rl_emacs_modestr_len = external global i32, align 4
@_rl_isearch_terminators = external global i8*, align 4
@_rl_keyseq_timeout = external global i32, align 4
@_rl_vi_cmd_mode_str = external global i8*, align 4
@_rl_vi_cmd_modestr_len = external global i32, align 4
@_rl_vi_ins_mode_str = external global i8*, align 4
@_rl_vi_ins_modestr_len = external global i32, align 4
@name_key_alist = internal constant [12 x %struct.assoc_list] [%struct.assoc_list { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.97, i32 0, i32 0), i32 127 }, %struct.assoc_list { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.98, i32 0, i32 0), i32 27 }, %struct.assoc_list { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.99, i32 0, i32 0), i32 27 }, %struct.assoc_list { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.100, i32 0, i32 0), i32 10 }, %struct.assoc_list { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.101, i32 0, i32 0), i32 10 }, %struct.assoc_list { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.102, i32 0, i32 0), i32 13 }, %struct.assoc_list { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.103, i32 0, i32 0), i32 13 }, %struct.assoc_list { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.104, i32 0, i32 0), i32 127 }, %struct.assoc_list { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.105, i32 0, i32 0), i32 32 }, %struct.assoc_list { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.106, i32 0, i32 0), i32 32 }, %struct.assoc_list { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.107, i32 0, i32 0), i32 9 }, %struct.assoc_list zeroinitializer], align 4
@.str.97 = private unnamed_addr constant [4 x i8] c"DEL\00", align 1
@.str.98 = private unnamed_addr constant [4 x i8] c"ESC\00", align 1
@.str.99 = private unnamed_addr constant [7 x i8] c"Escape\00", align 1
@.str.100 = private unnamed_addr constant [4 x i8] c"LFD\00", align 1
@.str.101 = private unnamed_addr constant [8 x i8] c"Newline\00", align 1
@.str.102 = private unnamed_addr constant [4 x i8] c"RET\00", align 1
@.str.103 = private unnamed_addr constant [7 x i8] c"Return\00", align 1
@.str.104 = private unnamed_addr constant [7 x i8] c"Rubout\00", align 1
@.str.105 = private unnamed_addr constant [4 x i8] c"SPC\00", align 1
@.str.106 = private unnamed_addr constant [6 x i8] c"Space\00", align 1
@.str.107 = private unnamed_addr constant [4 x i8] c"Tab\00", align 1
@.str.108 = private unnamed_addr constant [15 x i8] c"emacs-standard\00", align 1
@.str.109 = private unnamed_addr constant [11 x i8] c"emacs-meta\00", align 1
@.str.110 = private unnamed_addr constant [11 x i8] c"emacs-ctlx\00", align 1
@emacs_ctlx_keymap = external global [257 x %struct._keymap_entry], align 4
@vi_movement_keymap = external global [257 x %struct._keymap_entry], align 4
@.str.111 = private unnamed_addr constant [8 x i8] c"vi-move\00", align 1
@.str.112 = private unnamed_addr constant [11 x i8] c"vi-command\00", align 1
@.str.113 = private unnamed_addr constant [10 x i8] c"vi-insert\00", align 1
@.str.114 = private unnamed_addr constant [14 x i8] c"\22%s%s\22: \22%s\22\0A\00", align 1
@.str.115 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.116 = private unnamed_addr constant [17 x i8] c"%s%s outputs %s\0A\00", align 1
@_rl_get_string_variable_value.numbuf = internal global [32 x i8] zeroinitializer, align 1
@.str.117 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@.str.118 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@history_max_entries = external global i32, align 4
@.str.119 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@.str.120 = private unnamed_addr constant [6 x i8] c"(cmd)\00", align 1
@.str.121 = private unnamed_addr constant [6 x i8] c"(ins)\00", align 1

; Function Attrs: noinline nounwind
define i32 @rl_add_defun(i8* %name, i32 (i32, i32)* %function, i32 %key) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  %key.addr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %call = call i32 @rl_bind_key(i32 %1, i32 (i32, i32)* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %call1 = call i32 @rl_add_funmap_entry(i8* %3, i32 (i32, i32)* %4)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_bind_key(i32 %key, i32 (i32, i32)* %function) #0 {
entry:
  %retval = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  %keyseq = alloca [3 x i8], align 1
  %l = alloca i32, align 4
  %escmap = alloca %struct._keymap_entry*, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %key.addr, align 4
  %cmp1 = icmp sgt i32 %2, 127
  br i1 %cmp1, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %key.addr, align 4
  %cmp2 = icmp sle i32 %3, 255
  br i1 %cmp2, label %land.lhs.true3, label %if.end15

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i32, i32* @_rl_convert_meta_chars_to_ascii, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then4, label %if.end15

if.then4:                                         ; preds = %land.lhs.true3
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 27
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %6 = load i8, i8* %type, align 4
  %conv = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv, 1
  br i1 %cmp5, label %if.then7, label %if.end14

if.then7:                                         ; preds = %if.then4
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %arrayidx8 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %7, i32 27
  %function9 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx8, i32 0, i32 1
  %8 = load i32 (i32, i32)*, i32 (i32, i32)** %function9, align 4
  %9 = bitcast i32 (i32, i32)* %8 to %struct._keymap_entry*
  store %struct._keymap_entry* %9, %struct._keymap_entry** %escmap, align 4
  %10 = load i32, i32* %key.addr, align 4
  %and = and i32 %10, -129
  store i32 %and, i32* %key.addr, align 4
  %11 = load %struct._keymap_entry*, %struct._keymap_entry** %escmap, align 4
  %12 = load i32, i32* %key.addr, align 4
  %arrayidx10 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %11, i32 %12
  %type11 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx10, i32 0, i32 0
  store i8 0, i8* %type11, align 4
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %14 = load %struct._keymap_entry*, %struct._keymap_entry** %escmap, align 4
  %15 = load i32, i32* %key.addr, align 4
  %arrayidx12 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %14, i32 %15
  %function13 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx12, i32 0, i32 1
  store i32 (i32, i32)* %13, i32 (i32, i32)** %function13, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.then4
  %16 = load i32, i32* %key.addr, align 4
  store i32 %16, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %land.lhs.true3, %land.lhs.true, %if.end
  %17 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %18 = load i32, i32* %key.addr, align 4
  %arrayidx16 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %17, i32 %18
  %type17 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx16, i32 0, i32 0
  %19 = load i8, i8* %type17, align 4
  %conv18 = sext i8 %19 to i32
  %cmp19 = icmp ne i32 %conv18, 1
  br i1 %cmp19, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end15
  %20 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %21 = load i32, i32* %key.addr, align 4
  %arrayidx22 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %20, i32 %21
  %type23 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx22, i32 0, i32 0
  store i8 0, i8* %type23, align 4
  %22 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %23 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %24 = load i32, i32* %key.addr, align 4
  %arrayidx24 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %23, i32 %24
  %function25 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx24, i32 0, i32 1
  store i32 (i32, i32)* %22, i32 (i32, i32)** %function25, align 4
  br label %if.end35

if.else:                                          ; preds = %if.end15
  store i32 0, i32* %l, align 4
  %25 = load i32, i32* %key.addr, align 4
  %cmp26 = icmp eq i32 %25, 92
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.else
  %26 = load i32, i32* %l, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %l, align 4
  %arrayidx29 = getelementptr inbounds [3 x i8], [3 x i8]* %keyseq, i32 0, i32 %26
  store i8 92, i8* %arrayidx29, align 1
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.else
  %27 = load i32, i32* %key.addr, align 4
  %conv31 = trunc i32 %27 to i8
  %28 = load i32, i32* %l, align 4
  %inc32 = add nsw i32 %28, 1
  store i32 %inc32, i32* %l, align 4
  %arrayidx33 = getelementptr inbounds [3 x i8], [3 x i8]* %keyseq, i32 0, i32 %28
  store i8 %conv31, i8* %arrayidx33, align 1
  %29 = load i32, i32* %l, align 4
  %arrayidx34 = getelementptr inbounds [3 x i8], [3 x i8]* %keyseq, i32 0, i32 %29
  store i8 0, i8* %arrayidx34, align 1
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %keyseq, i32 0, i32 0
  %30 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %call = call i32 @rl_bind_keyseq(i8* %arraydecay, i32 (i32, i32)* %30)
  br label %if.end35

if.end35:                                         ; preds = %if.end30, %if.then21
  %31 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  store %struct._keymap_entry* %31, %struct._keymap_entry** @rl_binding_keymap, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end35, %if.end14, %if.then7, %if.then
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

declare i32 @rl_add_funmap_entry(i8*, i32 (i32, i32)*) #1

; Function Attrs: noinline nounwind
define i32 @rl_bind_keyseq(i8* %keyseq, i32 (i32, i32)* %function) #0 {
entry:
  %keyseq.addr = alloca i8*, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  %0 = load i8*, i8** %keyseq.addr, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %2 = bitcast i32 (i32, i32)* %1 to i8*
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i32 @rl_generic_bind(i32 0, i8* %0, i8* %2, %struct._keymap_entry* %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_bind_key_in_map(i32 %key, i32 (i32, i32)* %function, %struct._keymap_entry* %map) #0 {
entry:
  %key.addr = alloca i32, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %result = alloca i32, align 4
  %oldmap = alloca %struct._keymap_entry*, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  store %struct._keymap_entry* %0, %struct._keymap_entry** %oldmap, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** @_rl_keymap, align 4
  %2 = load i32, i32* %key.addr, align 4
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %call = call i32 @rl_bind_key(i32 %2, i32 (i32, i32)* %3)
  store i32 %call, i32* %result, align 4
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %oldmap, align 4
  store %struct._keymap_entry* %4, %struct._keymap_entry** @_rl_keymap, align 4
  %5 = load i32, i32* %result, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @rl_bind_key_if_unbound_in_map(i32 %key, i32 (i32, i32)* %default_func, %struct._keymap_entry* %kmap) #0 {
entry:
  %key.addr = alloca i32, align 4
  %default_func.addr = alloca i32 (i32, i32)*, align 4
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  %keyseq = alloca [2 x i8], align 1
  store i32 %key, i32* %key.addr, align 4
  store i32 (i32, i32)* %default_func, i32 (i32, i32)** %default_func.addr, align 4
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %0 to i8
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %keyseq, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [2 x i8], [2 x i8]* %keyseq, i32 0, i32 1
  store i8 0, i8* %arrayidx1, align 1
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %keyseq, i32 0, i32 0
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %default_func.addr, align 4
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %call = call i32 @rl_bind_keyseq_if_unbound_in_map(i8* %arraydecay, i32 (i32, i32)* %1, %struct._keymap_entry* %2)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_bind_keyseq_if_unbound_in_map(i8* %keyseq, i32 (i32, i32)* %default_func, %struct._keymap_entry* %kmap) #0 {
entry:
  %retval = alloca i32, align 4
  %keyseq.addr = alloca i8*, align 4
  %default_func.addr = alloca i32 (i32, i32)*, align 4
  %kmap.addr = alloca %struct._keymap_entry*, align 4
  %func = alloca i32 (i32, i32)*, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i32 (i32, i32)* %default_func, i32 (i32, i32)** %default_func.addr, align 4
  store %struct._keymap_entry* %kmap, %struct._keymap_entry** %kmap.addr, align 4
  %0 = load i8*, i8** %keyseq.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %keyseq.addr, align 4
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %call = call i32 (i32, i32)* @rl_function_of_keyseq(i8* %1, %struct._keymap_entry* %2, i32* null)
  store i32 (i32, i32)* %call, i32 (i32, i32)** %func, align 4
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %tobool1 = icmp ne i32 (i32, i32)* %3, null
  br i1 %tobool1, label %lor.lhs.false, label %if.then4

lor.lhs.false:                                    ; preds = %if.then
  %4 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp = icmp eq i32 (i32, i32)* %4, @rl_do_lowercase_version
  br i1 %cmp, label %if.then4, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp3 = icmp eq i32 (i32, i32)* %5, @rl_vi_movement_mode
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false2, %lor.lhs.false, %if.then
  %6 = load i8*, i8** %keyseq.addr, align 4
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %default_func.addr, align 4
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap.addr, align 4
  %call5 = call i32 @rl_bind_keyseq_in_map(i8* %6, i32 (i32, i32)* %7, %struct._keymap_entry* %8)
  store i32 %call5, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false2
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.else, %if.then4
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define i32 @rl_bind_key_if_unbound(i32 %key, i32 (i32, i32)* %default_func) #0 {
entry:
  %key.addr = alloca i32, align 4
  %default_func.addr = alloca i32 (i32, i32)*, align 4
  %keyseq = alloca [2 x i8], align 1
  store i32 %key, i32* %key.addr, align 4
  store i32 (i32, i32)* %default_func, i32 (i32, i32)** %default_func.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %0 to i8
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %keyseq, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [2 x i8], [2 x i8]* %keyseq, i32 0, i32 1
  store i8 0, i8* %arrayidx1, align 1
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %keyseq, i32 0, i32 0
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %default_func.addr, align 4
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i32 @rl_bind_keyseq_if_unbound_in_map(i8* %arraydecay, i32 (i32, i32)* %1, %struct._keymap_entry* %2)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_unbind_key(i32 %key) #0 {
entry:
  %key.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_bind_key(i32 %0, i32 (i32, i32)* null)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_unbind_key_in_map(i32 %key, %struct._keymap_entry* %map) #0 {
entry:
  %key.addr = alloca i32, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  store i32 %key, i32* %key.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call = call i32 @rl_bind_key_in_map(i32 %0, i32 (i32, i32)* null, %struct._keymap_entry* %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_unbind_function_in_map(i32 (i32, i32)* %func, %struct._keymap_entry* %map) #0 {
entry:
  %func.addr = alloca i32 (i32, i32)*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %i = alloca i32, align 4
  %rval = alloca i32, align 4
  store i32 (i32, i32)* %func, i32 (i32, i32)** %func.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i32 0, i32* %rval, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 257
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %1, i32 %2
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %3 = load i8, i8* %type, align 4
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 %5
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx3, i32 0, i32 1
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %func.addr, align 4
  %cmp4 = icmp eq i32 (i32, i32)* %6, %7
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %8, i32 %9
  %function7 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx6, i32 0, i32 1
  store i32 (i32, i32)* null, i32 (i32, i32)** %function7, align 4
  store i32 1, i32* %rval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %rval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @rl_unbind_command_in_map(i8* %command, %struct._keymap_entry* %map) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca i8*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %func = alloca i32 (i32, i32)*, align 4
  store i8* %command, i8** %command.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  %call = call i32 (i32, i32)* @rl_named_function(i8* %0)
  store i32 (i32, i32)* %call, i32 (i32, i32)** %func, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp = icmp eq i32 (i32, i32)* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call1 = call i32 @rl_unbind_function_in_map(i32 (i32, i32)* %2, %struct._keymap_entry* %3)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define i32 (i32, i32)* @rl_named_function(i8* %string) #0 {
entry:
  %retval = alloca i32 (i32, i32)*, align 4
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  call void @rl_initialize_funmap()
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._funmap*, %struct._funmap** %0, i32 %1
  %2 = load %struct._funmap*, %struct._funmap** %arrayidx, align 4
  %tobool = icmp ne %struct._funmap* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct._funmap*, %struct._funmap** %3, i32 %4
  %5 = load %struct._funmap*, %struct._funmap** %arrayidx1, align 4
  %name = getelementptr inbounds %struct._funmap, %struct._funmap* %5, i32 0, i32 0
  %6 = load i8*, i8** %name, align 4
  %7 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strcasecmp(i8* %6, i8* %7)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct._funmap*, %struct._funmap** %8, i32 %9
  %10 = load %struct._funmap*, %struct._funmap** %arrayidx2, align 4
  %function = getelementptr inbounds %struct._funmap, %struct._funmap* %10, i32 0, i32 1
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  store i32 (i32, i32)* %11, i32 (i32, i32)** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 (i32, i32)* null, i32 (i32, i32)** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %13 = load i32 (i32, i32)*, i32 (i32, i32)** %retval, align 4
  ret i32 (i32, i32)* %13
}

; Function Attrs: noinline nounwind
define i32 @rl_generic_bind(i32 %type, i8* %keyseq, i8* %data, %struct._keymap_entry* %map) #0 {
entry:
  %retval = alloca i32, align 4
  %type.addr = alloca i32, align 4
  %keyseq.addr = alloca i8*, align 4
  %data.addr = alloca i8*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %keys = alloca i8*, align 4
  %keys_len = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca %struct._keymap_entry, align 4
  %uc = alloca i8, align 1
  %ic = alloca i32, align 4
  store i32 %type, i32* %type.addr, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i8* %data, i8** %data.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %k, i32 0, i32 1
  store i32 (i32, i32)* null, i32 (i32, i32)** %function, align 4
  %0 = load i8*, i8** %keyseq.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %keyseq.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end6

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %type.addr, align 4
  %cmp3 = icmp eq i32 %3, 2
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  %4 = load i8*, i8** %data.addr, align 4
  call void @xfree(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  store i32 -1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %5 = load i8*, i8** %keyseq.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %mul = mul i32 2, %call
  %add = add i32 1, %mul
  %call7 = call i8* @xmalloc(i32 %add)
  store i8* %call7, i8** %keys, align 4
  %6 = load i8*, i8** %keyseq.addr, align 4
  %7 = load i8*, i8** %keys, align 4
  %call8 = call i32 @rl_translate_keyseq(i8* %6, i8* %7, i32* %keys_len)
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  %8 = load i8*, i8** %keys, align 4
  call void @xfree(i8* %8)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end6
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end10
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %keys_len, align 4
  %cmp11 = icmp slt i32 %9, %10
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %keys, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx, align 1
  store i8 %13, i8* %uc, align 1
  %14 = load i8, i8* %uc, align 1
  %conv13 = zext i8 %14 to i32
  store i32 %conv13, i32* %ic, align 4
  %15 = load i32, i32* %ic, align 4
  %cmp14 = icmp slt i32 %15, 0
  br i1 %cmp14, label %if.then19, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %for.body
  %16 = load i32, i32* %ic, align 4
  %cmp17 = icmp sge i32 %16, 257
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %lor.lhs.false16, %for.body
  %17 = load i8*, i8** %keys, align 4
  call void @xfree(i8* %17)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %lor.lhs.false16
  %18 = load i32, i32* %ic, align 4
  %cmp21 = icmp sgt i32 %18, 127
  br i1 %cmp21, label %land.lhs.true, label %if.end37

land.lhs.true:                                    ; preds = %if.end20
  %19 = load i32, i32* %ic, align 4
  %cmp23 = icmp sle i32 %19, 255
  br i1 %cmp23, label %land.lhs.true25, label %if.end37

land.lhs.true25:                                  ; preds = %land.lhs.true
  %20 = load i32, i32* @_rl_convert_meta_chars_to_ascii, align 4
  %tobool26 = icmp ne i32 %20, 0
  br i1 %tobool26, label %if.then27, label %if.end37

if.then27:                                        ; preds = %land.lhs.true25
  %21 = load i32, i32* %ic, align 4
  %and = and i32 %21, -129
  store i32 %and, i32* %ic, align 4
  %22 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx28 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %22, i32 27
  %type29 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx28, i32 0, i32 0
  %23 = load i8, i8* %type29, align 4
  %conv30 = sext i8 %23 to i32
  %cmp31 = icmp eq i32 %conv30, 1
  br i1 %cmp31, label %if.then33, label %if.end36

if.then33:                                        ; preds = %if.then27
  %24 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx34 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %24, i32 27
  %function35 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx34, i32 0, i32 1
  %25 = load i32 (i32, i32)*, i32 (i32, i32)** %function35, align 4
  %26 = bitcast i32 (i32, i32)* %25 to %struct._keymap_entry*
  store %struct._keymap_entry* %26, %struct._keymap_entry** %map.addr, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then33, %if.then27
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %land.lhs.true25, %land.lhs.true, %if.end20
  %27 = load i32, i32* %i, align 4
  %add38 = add nsw i32 %27, 1
  %28 = load i32, i32* %keys_len, align 4
  %cmp39 = icmp slt i32 %add38, %28
  br i1 %cmp39, label %if.then41, label %if.else

if.then41:                                        ; preds = %if.end37
  %29 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %30 = load i32, i32* %ic, align 4
  %arrayidx42 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %29, i32 %30
  %type43 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx42, i32 0, i32 0
  %31 = load i8, i8* %type43, align 4
  %conv44 = sext i8 %31 to i32
  %cmp45 = icmp ne i32 %conv44, 1
  br i1 %cmp45, label %if.then47, label %if.end54

if.then47:                                        ; preds = %if.then41
  %32 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %33 = load i32, i32* %ic, align 4
  %arrayidx48 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %32, i32 %33
  %34 = bitcast %struct._keymap_entry* %k to i8*
  %35 = bitcast %struct._keymap_entry* %arrayidx48 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %34, i8* %35, i32 8, i32 4, i1 false)
  %36 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %37 = load i32, i32* %ic, align 4
  %arrayidx49 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %36, i32 %37
  %type50 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx49, i32 0, i32 0
  store i8 1, i8* %type50, align 4
  %call51 = call %struct._keymap_entry* @rl_make_bare_keymap()
  %38 = bitcast %struct._keymap_entry* %call51 to i32 (i32, i32)*
  %39 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %40 = load i32, i32* %ic, align 4
  %arrayidx52 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %39, i32 %40
  %function53 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx52, i32 0, i32 1
  store i32 (i32, i32)* %38, i32 (i32, i32)** %function53, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then47, %if.then41
  %41 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %42 = load i32, i32* %ic, align 4
  %arrayidx55 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %41, i32 %42
  %function56 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx55, i32 0, i32 1
  %43 = load i32 (i32, i32)*, i32 (i32, i32)** %function56, align 4
  %44 = bitcast i32 (i32, i32)* %43 to %struct._keymap_entry*
  store %struct._keymap_entry* %44, %struct._keymap_entry** %map.addr, align 4
  %function57 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %k, i32 0, i32 1
  %45 = load i32 (i32, i32)*, i32 (i32, i32)** %function57, align 4
  %tobool58 = icmp ne i32 (i32, i32)* %45, null
  br i1 %tobool58, label %land.lhs.true59, label %if.end76

land.lhs.true59:                                  ; preds = %if.end54
  %type60 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %k, i32 0, i32 0
  %46 = load i8, i8* %type60, align 4
  %conv61 = sext i8 %46 to i32
  %cmp62 = icmp eq i32 %conv61, 0
  br i1 %cmp62, label %land.lhs.true64, label %lor.lhs.false68

land.lhs.true64:                                  ; preds = %land.lhs.true59
  %function65 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %k, i32 0, i32 1
  %47 = load i32 (i32, i32)*, i32 (i32, i32)** %function65, align 4
  %cmp66 = icmp ne i32 (i32, i32)* %47, @rl_do_lowercase_version
  br i1 %cmp66, label %if.then73, label %lor.lhs.false68

lor.lhs.false68:                                  ; preds = %land.lhs.true64, %land.lhs.true59
  %type69 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %k, i32 0, i32 0
  %48 = load i8, i8* %type69, align 4
  %conv70 = sext i8 %48 to i32
  %cmp71 = icmp eq i32 %conv70, 2
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %lor.lhs.false68, %land.lhs.true64
  %49 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx74 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %49, i32 256
  %50 = bitcast %struct._keymap_entry* %arrayidx74 to i8*
  %51 = bitcast %struct._keymap_entry* %k to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %50, i8* %51, i32 8, i32 4, i1 false)
  %function75 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %k, i32 0, i32 1
  store i32 (i32, i32)* null, i32 (i32, i32)** %function75, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then73, %lor.lhs.false68, %if.end54
  br label %if.end108

if.else:                                          ; preds = %if.end37
  %52 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %53 = load i32, i32* %ic, align 4
  %arrayidx77 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %52, i32 %53
  %type78 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx77, i32 0, i32 0
  %54 = load i8, i8* %type78, align 4
  %conv79 = sext i8 %54 to i32
  %cmp80 = icmp eq i32 %conv79, 2
  br i1 %cmp80, label %if.then82, label %if.else85

if.then82:                                        ; preds = %if.else
  %55 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %56 = load i32, i32* %ic, align 4
  %arrayidx83 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %55, i32 %56
  %function84 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx83, i32 0, i32 1
  %57 = load i32 (i32, i32)*, i32 (i32, i32)** %function84, align 4
  %58 = bitcast i32 (i32, i32)* %57 to i8*
  call void @xfree(i8* %58)
  br label %if.end102

if.else85:                                        ; preds = %if.else
  %59 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %60 = load i32, i32* %ic, align 4
  %arrayidx86 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %59, i32 %60
  %type87 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx86, i32 0, i32 0
  %61 = load i8, i8* %type87, align 4
  %conv88 = sext i8 %61 to i32
  %cmp89 = icmp eq i32 %conv88, 1
  br i1 %cmp89, label %if.then91, label %if.end101

if.then91:                                        ; preds = %if.else85
  %62 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %63 = load i32, i32* %ic, align 4
  %arrayidx92 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %62, i32 %63
  %function93 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx92, i32 0, i32 1
  %64 = load i32 (i32, i32)*, i32 (i32, i32)** %function93, align 4
  %65 = bitcast i32 (i32, i32)* %64 to %struct._keymap_entry*
  store %struct._keymap_entry* %65, %struct._keymap_entry** %map.addr, align 4
  store i32 256, i32* %ic, align 4
  %66 = load i32, i32* %type.addr, align 4
  %cmp94 = icmp eq i32 %66, 0
  br i1 %cmp94, label %land.lhs.true96, label %if.end100

land.lhs.true96:                                  ; preds = %if.then91
  %67 = load i8*, i8** %data.addr, align 4
  %cmp97 = icmp eq i8* %67, null
  br i1 %cmp97, label %if.then99, label %if.end100

if.then99:                                        ; preds = %land.lhs.true96
  store i8* bitcast (i32 (i32, i32)* @_rl_null_function to i8*), i8** %data.addr, align 4
  br label %if.end100

if.end100:                                        ; preds = %if.then99, %land.lhs.true96, %if.then91
  br label %if.end101

if.end101:                                        ; preds = %if.end100, %if.else85
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %if.then82
  %68 = load i8*, i8** %data.addr, align 4
  %69 = bitcast i8* %68 to i32 (i32, i32)*
  %70 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %71 = load i32, i32* %ic, align 4
  %arrayidx103 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %70, i32 %71
  %function104 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx103, i32 0, i32 1
  store i32 (i32, i32)* %69, i32 (i32, i32)** %function104, align 4
  %72 = load i32, i32* %type.addr, align 4
  %conv105 = trunc i32 %72 to i8
  %73 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %74 = load i32, i32* %ic, align 4
  %arrayidx106 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %73, i32 %74
  %type107 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx106, i32 0, i32 0
  store i8 %conv105, i8* %type107, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.end102, %if.end76
  %75 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %75, %struct._keymap_entry** @rl_binding_keymap, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end108
  %76 = load i32, i32* %i, align 4
  %inc = add nsw i32 %76, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %77 = load i8*, i8** %keys, align 4
  call void @xfree(i8* %77)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then19, %if.then9, %if.end
  %78 = load i32, i32* %retval, align 4
  ret i32 %78
}

; Function Attrs: noinline nounwind
define i32 @rl_bind_keyseq_in_map(i8* %keyseq, i32 (i32, i32)* %function, %struct._keymap_entry* %map) #0 {
entry:
  %keyseq.addr = alloca i8*, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load i8*, i8** %keyseq.addr, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %2 = bitcast i32 (i32, i32)* %1 to i8*
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call = call i32 @rl_generic_bind(i32 0, i8* %0, i8* %2, %struct._keymap_entry* %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_set_key(i8* %keyseq, i32 (i32, i32)* %function, %struct._keymap_entry* %map) #0 {
entry:
  %keyseq.addr = alloca i8*, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load i8*, i8** %keyseq.addr, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %2 = bitcast i32 (i32, i32)* %1 to i8*
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call = call i32 @rl_generic_bind(i32 0, i8* %0, i8* %2, %struct._keymap_entry* %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 (i32, i32)* @rl_function_of_keyseq(i8* %keyseq, %struct._keymap_entry* %map, i32* %type) #0 {
entry:
  %retval = alloca i32 (i32, i32)*, align 4
  %keyseq.addr = alloca i8*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %type.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %ic = alloca i8, align 1
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i32* %type, i32** %type.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %cmp = icmp eq %struct._keymap_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** %map.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i8*, i8** %keyseq.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load i8*, i8** %keyseq.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %6 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %7 = load i8*, i8** %keyseq.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx2, align 1
  store i8 %9, i8* %ic, align 1
  %10 = load i8, i8* %ic, align 1
  %conv3 = zext i8 %10 to i32
  %cmp4 = icmp sgt i32 %conv3, 127
  br i1 %cmp4, label %land.lhs.true, label %if.end30

land.lhs.true:                                    ; preds = %for.body
  %11 = load i8, i8* %ic, align 1
  %conv6 = zext i8 %11 to i32
  %cmp7 = icmp sle i32 %conv6, 255
  br i1 %cmp7, label %land.lhs.true9, label %if.end30

land.lhs.true9:                                   ; preds = %land.lhs.true
  %12 = load i32, i32* @_rl_convert_meta_chars_to_ascii, align 4
  %tobool10 = icmp ne i32 %12, 0
  br i1 %tobool10, label %if.then11, label %if.end30

if.then11:                                        ; preds = %land.lhs.true9
  %13 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx12 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %13, i32 27
  %type13 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx12, i32 0, i32 0
  %14 = load i8, i8* %type13, align 4
  %conv14 = sext i8 %14 to i32
  %cmp15 = icmp eq i32 %conv14, 1
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.then11
  %15 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx18 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %15, i32 27
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx18, i32 0, i32 1
  %16 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %17 = bitcast i32 (i32, i32)* %16 to %struct._keymap_entry*
  store %struct._keymap_entry* %17, %struct._keymap_entry** %map.addr, align 4
  %18 = load i8, i8* %ic, align 1
  %conv19 = zext i8 %18 to i32
  %and = and i32 %conv19, -129
  %conv20 = trunc i32 %and to i8
  store i8 %conv20, i8* %ic, align 1
  br label %if.end29

if.else:                                          ; preds = %if.then11
  %19 = load i32*, i32** %type.addr, align 4
  %tobool21 = icmp ne i32* %19, null
  br i1 %tobool21, label %if.then22, label %if.end26

if.then22:                                        ; preds = %if.else
  %20 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx23 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %20, i32 27
  %type24 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx23, i32 0, i32 0
  %21 = load i8, i8* %type24, align 4
  %conv25 = sext i8 %21 to i32
  %22 = load i32*, i32** %type.addr, align 4
  store i32 %conv25, i32* %22, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then22, %if.else
  %23 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx27 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %23, i32 27
  %function28 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx27, i32 0, i32 1
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %function28, align 4
  store i32 (i32, i32)* %24, i32 (i32, i32)** %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.then17
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %land.lhs.true9, %land.lhs.true, %for.body
  %25 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %26 = load i8, i8* %ic, align 1
  %idxprom = zext i8 %26 to i32
  %arrayidx31 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %25, i32 %idxprom
  %type32 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx31, i32 0, i32 0
  %27 = load i8, i8* %type32, align 4
  %conv33 = sext i8 %27 to i32
  %cmp34 = icmp eq i32 %conv33, 1
  br i1 %cmp34, label %if.then36, label %if.else53

if.then36:                                        ; preds = %if.end30
  %28 = load i8*, i8** %keyseq.addr, align 4
  %29 = load i32, i32* %i, align 4
  %add = add nsw i32 %29, 1
  %arrayidx37 = getelementptr inbounds i8, i8* %28, i32 %add
  %30 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %30 to i32
  %cmp39 = icmp eq i32 %conv38, 0
  br i1 %cmp39, label %if.then41, label %if.else48

if.then41:                                        ; preds = %if.then36
  %31 = load i32*, i32** %type.addr, align 4
  %tobool42 = icmp ne i32* %31, null
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.then41
  %32 = load i32*, i32** %type.addr, align 4
  store i32 1, i32* %32, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.then41
  %33 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %34 = load i8, i8* %ic, align 1
  %idxprom45 = zext i8 %34 to i32
  %arrayidx46 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %33, i32 %idxprom45
  %function47 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx46, i32 0, i32 1
  %35 = load i32 (i32, i32)*, i32 (i32, i32)** %function47, align 4
  store i32 (i32, i32)* %35, i32 (i32, i32)** %retval, align 4
  br label %return

if.else48:                                        ; preds = %if.then36
  %36 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %37 = load i8, i8* %ic, align 1
  %idxprom49 = zext i8 %37 to i32
  %arrayidx50 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %36, i32 %idxprom49
  %function51 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx50, i32 0, i32 1
  %38 = load i32 (i32, i32)*, i32 (i32, i32)** %function51, align 4
  %39 = bitcast i32 (i32, i32)* %38 to %struct._keymap_entry*
  store %struct._keymap_entry* %39, %struct._keymap_entry** %map.addr, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.else48
  br label %if.end77

if.else53:                                        ; preds = %if.end30
  %40 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %41 = load i8, i8* %ic, align 1
  %idxprom54 = zext i8 %41 to i32
  %arrayidx55 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %40, i32 %idxprom54
  %type56 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx55, i32 0, i32 0
  %42 = load i8, i8* %type56, align 4
  %conv57 = sext i8 %42 to i32
  %cmp58 = icmp ne i32 %conv57, 1
  br i1 %cmp58, label %land.lhs.true60, label %if.else66

land.lhs.true60:                                  ; preds = %if.else53
  %43 = load i8*, i8** %keyseq.addr, align 4
  %44 = load i32, i32* %i, align 4
  %add61 = add nsw i32 %44, 1
  %arrayidx62 = getelementptr inbounds i8, i8* %43, i32 %add61
  %45 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %45 to i32
  %tobool64 = icmp ne i32 %conv63, 0
  br i1 %tobool64, label %if.then65, label %if.else66

if.then65:                                        ; preds = %land.lhs.true60
  store i32 (i32, i32)* null, i32 (i32, i32)** %retval, align 4
  br label %return

if.else66:                                        ; preds = %land.lhs.true60, %if.else53
  %46 = load i32*, i32** %type.addr, align 4
  %tobool67 = icmp ne i32* %46, null
  br i1 %tobool67, label %if.then68, label %if.end73

if.then68:                                        ; preds = %if.else66
  %47 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %48 = load i8, i8* %ic, align 1
  %idxprom69 = zext i8 %48 to i32
  %arrayidx70 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %47, i32 %idxprom69
  %type71 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx70, i32 0, i32 0
  %49 = load i8, i8* %type71, align 4
  %conv72 = sext i8 %49 to i32
  %50 = load i32*, i32** %type.addr, align 4
  store i32 %conv72, i32* %50, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then68, %if.else66
  %51 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %52 = load i8, i8* %ic, align 1
  %idxprom74 = zext i8 %52 to i32
  %arrayidx75 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %51, i32 %idxprom74
  %function76 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx75, i32 0, i32 1
  %53 = load i32 (i32, i32)*, i32 (i32, i32)** %function76, align 4
  store i32 (i32, i32)* %53, i32 (i32, i32)** %retval, align 4
  br label %return

if.end77:                                         ; preds = %if.end52
  br label %for.inc

for.inc:                                          ; preds = %if.end77
  %54 = load i32, i32* %i, align 4
  %inc = add nsw i32 %54, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 (i32, i32)* null, i32 (i32, i32)** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.end73, %if.then65, %if.end44, %if.end26
  %55 = load i32 (i32, i32)*, i32 (i32, i32)** %retval, align 4
  ret i32 (i32, i32)* %55
}

declare i32 @rl_do_lowercase_version(i32, i32) #1

declare i32 @rl_vi_movement_mode(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_bind_keyseq_if_unbound(i8* %keyseq, i32 (i32, i32)* %default_func) #0 {
entry:
  %keyseq.addr = alloca i8*, align 4
  %default_func.addr = alloca i32 (i32, i32)*, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i32 (i32, i32)* %default_func, i32 (i32, i32)** %default_func.addr, align 4
  %0 = load i8*, i8** %keyseq.addr, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %default_func.addr, align 4
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i32 @rl_bind_keyseq_if_unbound_in_map(i8* %0, i32 (i32, i32)* %1, %struct._keymap_entry* %2)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_macro_bind(i8* %keyseq, i8* %macro, %struct._keymap_entry* %map) #0 {
entry:
  %retval = alloca i32, align 4
  %keyseq.addr = alloca i8*, align 4
  %macro.addr = alloca i8*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %macro_keys = alloca i8*, align 4
  %macro_keys_len = alloca i32, align 4
  store i8* %keyseq, i8** %keyseq.addr, align 4
  store i8* %macro, i8** %macro.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load i8*, i8** %macro.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 2, %call
  %add = add i32 %mul, 1
  %call1 = call i8* @xmalloc(i32 %add)
  store i8* %call1, i8** %macro_keys, align 4
  %1 = load i8*, i8** %macro.addr, align 4
  %2 = load i8*, i8** %macro_keys, align 4
  %call2 = call i32 @rl_translate_keyseq(i8* %1, i8* %2, i32* %macro_keys_len)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %macro_keys, align 4
  call void @xfree(i8* %3)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %keyseq.addr, align 4
  %5 = load i8*, i8** %macro_keys, align 4
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call3 = call i32 @rl_generic_bind(i32 2, i8* %4, i8* %5, %struct._keymap_entry* %6)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_translate_keyseq(i8* %seq, i8* %array, i32* %len) #0 {
entry:
  %seq.addr = alloca i8*, align 4
  %array.addr = alloca i8*, align 4
  %len.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %l = alloca i32, align 4
  %temp = alloca i32, align 4
  store i8* %seq, i8** %seq.addr, align 4
  store i8* %array, i8** %array.addr, align 4
  store i32* %len, i32** %len.addr, align 4
  store i32 0, i32* %l, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc288, %entry
  %0 = load i8*, i8** %seq.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  store i32 %conv, i32* %c, align 4
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %for.body, label %for.end290

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %3, 92
  br i1 %cmp, label %if.then, label %if.end284

if.then:                                          ; preds = %for.body
  %4 = load i8*, i8** %seq.addr, align 4
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 %inc
  %6 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  store i32 %conv3, i32* %c, align 4
  %7 = load i32, i32* %c, align 4
  %cmp4 = icmp eq i32 %7, 0
  br i1 %cmp4, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  br label %for.end290

if.end:                                           ; preds = %if.then
  %8 = load i32, i32* %c, align 4
  %cmp7 = icmp eq i32 %8, 67
  br i1 %cmp7, label %land.lhs.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %9 = load i32, i32* %c, align 4
  %cmp9 = icmp eq i32 %9, 77
  br i1 %cmp9, label %land.lhs.true, label %if.end163

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end
  %10 = load i8*, i8** %seq.addr, align 4
  %11 = load i32, i32* %i, align 4
  %add = add nsw i32 %11, 1
  %arrayidx11 = getelementptr inbounds i8, i8* %10, i32 %add
  %12 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %12 to i32
  %cmp13 = icmp eq i32 %conv12, 45
  br i1 %cmp13, label %if.then15, label %if.end163

if.then15:                                        ; preds = %land.lhs.true
  %13 = load i8*, i8** %seq.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %13, i32 %14
  %call = call i32 @strncmp(i8* %arrayidx16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 5)
  %cmp17 = icmp eq i32 %call, 0
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.then15
  %15 = load i8*, i8** %array.addr, align 4
  %16 = load i32, i32* %l, align 4
  %inc20 = add nsw i32 %16, 1
  store i32 %inc20, i32* %l, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %15, i32 %16
  store i8 27, i8* %arrayidx21, align 1
  %17 = load i32, i32* %i, align 4
  %add22 = add nsw i32 %17, 5
  store i32 %add22, i32* %i, align 4
  %18 = load i8*, i8** %seq.addr, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx23, align 1
  %conv24 = zext i8 %20 to i32
  %21 = load i8*, i8** %seq.addr, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %23 to i32
  %cmp27 = icmp eq i32 %conv24, %conv26
  br i1 %cmp27, label %land.lhs.true29, label %cond.false

land.lhs.true29:                                  ; preds = %if.then19
  %24 = load i8*, i8** %seq.addr, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx30, align 1
  %conv31 = zext i8 %26 to i32
  %call32 = call i32 @islower(i32 %conv31) #5
  %tobool33 = icmp ne i32 %call32, 0
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true29
  %27 = load i8*, i8** %seq.addr, align 4
  %28 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx34, align 1
  %conv35 = zext i8 %29 to i32
  %call36 = call i32 @toupper(i32 %conv35) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true29, %if.then19
  %30 = load i8*, i8** %seq.addr, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %32 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call36, %cond.true ], [ %conv38, %cond.false ]
  %and = and i32 %cond, 31
  %conv39 = trunc i32 %and to i8
  %33 = load i8*, i8** %array.addr, align 4
  %34 = load i32, i32* %l, align 4
  %inc40 = add nsw i32 %34, 1
  store i32 %inc40, i32* %l, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %33, i32 %34
  store i8 %conv39, i8* %arrayidx41, align 1
  %35 = load i8*, i8** %seq.addr, align 4
  %36 = load i32, i32* %i, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %37 to i32
  %cmp44 = icmp eq i32 %conv43, 0
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %cond.end
  %38 = load i32, i32* %i, align 4
  %dec = add nsw i32 %38, -1
  store i32 %dec, i32* %i, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %cond.end
  br label %if.end162

if.else:                                          ; preds = %if.then15
  %39 = load i32, i32* %c, align 4
  %cmp48 = icmp eq i32 %39, 77
  br i1 %cmp48, label %if.then50, label %if.else123

if.then50:                                        ; preds = %if.else
  %40 = load i32, i32* %i, align 4
  %inc51 = add nsw i32 %40, 1
  store i32 %inc51, i32* %i, align 4
  %41 = load i32, i32* @_rl_convert_meta_chars_to_ascii, align 4
  %tobool52 = icmp ne i32 %41, 0
  br i1 %tobool52, label %land.lhs.true53, label %if.else61

land.lhs.true53:                                  ; preds = %if.then50
  %42 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %arrayidx54 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %42, i32 27
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx54, i32 0, i32 0
  %43 = load i8, i8* %type, align 4
  %conv55 = sext i8 %43 to i32
  %cmp56 = icmp eq i32 %conv55, 1
  br i1 %cmp56, label %if.then58, label %if.else61

if.then58:                                        ; preds = %land.lhs.true53
  %44 = load i8*, i8** %array.addr, align 4
  %45 = load i32, i32* %l, align 4
  %inc59 = add nsw i32 %45, 1
  store i32 %inc59, i32* %l, align 4
  %arrayidx60 = getelementptr inbounds i8, i8* %44, i32 %45
  store i8 27, i8* %arrayidx60, align 1
  br label %if.end122

if.else61:                                        ; preds = %land.lhs.true53, %if.then50
  %46 = load i8*, i8** %seq.addr, align 4
  %47 = load i32, i32* %i, align 4
  %add62 = add nsw i32 %47, 1
  %arrayidx63 = getelementptr inbounds i8, i8* %46, i32 %add62
  %48 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %48 to i32
  %cmp65 = icmp eq i32 %conv64, 92
  br i1 %cmp65, label %land.lhs.true67, label %if.else113

land.lhs.true67:                                  ; preds = %if.else61
  %49 = load i8*, i8** %seq.addr, align 4
  %50 = load i32, i32* %i, align 4
  %add68 = add nsw i32 %50, 2
  %arrayidx69 = getelementptr inbounds i8, i8* %49, i32 %add68
  %51 = load i8, i8* %arrayidx69, align 1
  %conv70 = sext i8 %51 to i32
  %cmp71 = icmp eq i32 %conv70, 67
  br i1 %cmp71, label %land.lhs.true73, label %if.else113

land.lhs.true73:                                  ; preds = %land.lhs.true67
  %52 = load i8*, i8** %seq.addr, align 4
  %53 = load i32, i32* %i, align 4
  %add74 = add nsw i32 %53, 3
  %arrayidx75 = getelementptr inbounds i8, i8* %52, i32 %add74
  %54 = load i8, i8* %arrayidx75, align 1
  %conv76 = sext i8 %54 to i32
  %cmp77 = icmp eq i32 %conv76, 45
  br i1 %cmp77, label %if.then79, label %if.else113

if.then79:                                        ; preds = %land.lhs.true73
  %55 = load i32, i32* %i, align 4
  %add80 = add nsw i32 %55, 4
  store i32 %add80, i32* %i, align 4
  %56 = load i8*, i8** %seq.addr, align 4
  %57 = load i32, i32* %i, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %56, i32 %57
  %58 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %58 to i32
  %cmp83 = icmp eq i32 %conv82, 63
  br i1 %cmp83, label %cond.true85, label %cond.false86

cond.true85:                                      ; preds = %if.then79
  br label %cond.end108

cond.false86:                                     ; preds = %if.then79
  %59 = load i8*, i8** %seq.addr, align 4
  %60 = load i32, i32* %i, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %59, i32 %60
  %61 = load i8, i8* %arrayidx87, align 1
  %conv88 = zext i8 %61 to i32
  %62 = load i8*, i8** %seq.addr, align 4
  %63 = load i32, i32* %i, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %62, i32 %63
  %64 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %64 to i32
  %cmp91 = icmp eq i32 %conv88, %conv90
  br i1 %cmp91, label %land.lhs.true93, label %cond.false102

land.lhs.true93:                                  ; preds = %cond.false86
  %65 = load i8*, i8** %seq.addr, align 4
  %66 = load i32, i32* %i, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i8, i8* %arrayidx94, align 1
  %conv95 = zext i8 %67 to i32
  %call96 = call i32 @islower(i32 %conv95) #5
  %tobool97 = icmp ne i32 %call96, 0
  br i1 %tobool97, label %cond.true98, label %cond.false102

cond.true98:                                      ; preds = %land.lhs.true93
  %68 = load i8*, i8** %seq.addr, align 4
  %69 = load i32, i32* %i, align 4
  %arrayidx99 = getelementptr inbounds i8, i8* %68, i32 %69
  %70 = load i8, i8* %arrayidx99, align 1
  %conv100 = zext i8 %70 to i32
  %call101 = call i32 @toupper(i32 %conv100) #5
  br label %cond.end105

cond.false102:                                    ; preds = %land.lhs.true93, %cond.false86
  %71 = load i8*, i8** %seq.addr, align 4
  %72 = load i32, i32* %i, align 4
  %arrayidx103 = getelementptr inbounds i8, i8* %71, i32 %72
  %73 = load i8, i8* %arrayidx103, align 1
  %conv104 = sext i8 %73 to i32
  br label %cond.end105

cond.end105:                                      ; preds = %cond.false102, %cond.true98
  %cond106 = phi i32 [ %call101, %cond.true98 ], [ %conv104, %cond.false102 ]
  %and107 = and i32 %cond106, 31
  br label %cond.end108

cond.end108:                                      ; preds = %cond.end105, %cond.true85
  %cond109 = phi i32 [ 127, %cond.true85 ], [ %and107, %cond.end105 ]
  store i32 %cond109, i32* %temp, align 4
  %74 = load i32, i32* %temp, align 4
  %or = or i32 %74, 128
  %conv110 = trunc i32 %or to i8
  %75 = load i8*, i8** %array.addr, align 4
  %76 = load i32, i32* %l, align 4
  %inc111 = add nsw i32 %76, 1
  store i32 %inc111, i32* %l, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %75, i32 %76
  store i8 %conv110, i8* %arrayidx112, align 1
  br label %if.end121

if.else113:                                       ; preds = %land.lhs.true73, %land.lhs.true67, %if.else61
  %77 = load i32, i32* %i, align 4
  %inc114 = add nsw i32 %77, 1
  store i32 %inc114, i32* %i, align 4
  %78 = load i8*, i8** %seq.addr, align 4
  %79 = load i32, i32* %i, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %78, i32 %79
  %80 = load i8, i8* %arrayidx115, align 1
  %conv116 = sext i8 %80 to i32
  %or117 = or i32 %conv116, 128
  %conv118 = trunc i32 %or117 to i8
  %81 = load i8*, i8** %array.addr, align 4
  %82 = load i32, i32* %l, align 4
  %inc119 = add nsw i32 %82, 1
  store i32 %inc119, i32* %l, align 4
  %arrayidx120 = getelementptr inbounds i8, i8* %81, i32 %82
  store i8 %conv118, i8* %arrayidx120, align 1
  br label %if.end121

if.end121:                                        ; preds = %if.else113, %cond.end108
  br label %if.end122

if.end122:                                        ; preds = %if.end121, %if.then58
  br label %if.end161

if.else123:                                       ; preds = %if.else
  %83 = load i32, i32* %c, align 4
  %cmp124 = icmp eq i32 %83, 67
  br i1 %cmp124, label %if.then126, label %if.end160

if.then126:                                       ; preds = %if.else123
  %84 = load i32, i32* %i, align 4
  %add127 = add nsw i32 %84, 2
  store i32 %add127, i32* %i, align 4
  %85 = load i8*, i8** %seq.addr, align 4
  %86 = load i32, i32* %i, align 4
  %arrayidx128 = getelementptr inbounds i8, i8* %85, i32 %86
  %87 = load i8, i8* %arrayidx128, align 1
  %conv129 = sext i8 %87 to i32
  %cmp130 = icmp eq i32 %conv129, 63
  br i1 %cmp130, label %cond.true132, label %cond.false133

cond.true132:                                     ; preds = %if.then126
  br label %cond.end155

cond.false133:                                    ; preds = %if.then126
  %88 = load i8*, i8** %seq.addr, align 4
  %89 = load i32, i32* %i, align 4
  %arrayidx134 = getelementptr inbounds i8, i8* %88, i32 %89
  %90 = load i8, i8* %arrayidx134, align 1
  %conv135 = zext i8 %90 to i32
  %91 = load i8*, i8** %seq.addr, align 4
  %92 = load i32, i32* %i, align 4
  %arrayidx136 = getelementptr inbounds i8, i8* %91, i32 %92
  %93 = load i8, i8* %arrayidx136, align 1
  %conv137 = sext i8 %93 to i32
  %cmp138 = icmp eq i32 %conv135, %conv137
  br i1 %cmp138, label %land.lhs.true140, label %cond.false149

land.lhs.true140:                                 ; preds = %cond.false133
  %94 = load i8*, i8** %seq.addr, align 4
  %95 = load i32, i32* %i, align 4
  %arrayidx141 = getelementptr inbounds i8, i8* %94, i32 %95
  %96 = load i8, i8* %arrayidx141, align 1
  %conv142 = zext i8 %96 to i32
  %call143 = call i32 @islower(i32 %conv142) #5
  %tobool144 = icmp ne i32 %call143, 0
  br i1 %tobool144, label %cond.true145, label %cond.false149

cond.true145:                                     ; preds = %land.lhs.true140
  %97 = load i8*, i8** %seq.addr, align 4
  %98 = load i32, i32* %i, align 4
  %arrayidx146 = getelementptr inbounds i8, i8* %97, i32 %98
  %99 = load i8, i8* %arrayidx146, align 1
  %conv147 = zext i8 %99 to i32
  %call148 = call i32 @toupper(i32 %conv147) #5
  br label %cond.end152

cond.false149:                                    ; preds = %land.lhs.true140, %cond.false133
  %100 = load i8*, i8** %seq.addr, align 4
  %101 = load i32, i32* %i, align 4
  %arrayidx150 = getelementptr inbounds i8, i8* %100, i32 %101
  %102 = load i8, i8* %arrayidx150, align 1
  %conv151 = sext i8 %102 to i32
  br label %cond.end152

cond.end152:                                      ; preds = %cond.false149, %cond.true145
  %cond153 = phi i32 [ %call148, %cond.true145 ], [ %conv151, %cond.false149 ]
  %and154 = and i32 %cond153, 31
  br label %cond.end155

cond.end155:                                      ; preds = %cond.end152, %cond.true132
  %cond156 = phi i32 [ 127, %cond.true132 ], [ %and154, %cond.end152 ]
  %conv157 = trunc i32 %cond156 to i8
  %103 = load i8*, i8** %array.addr, align 4
  %104 = load i32, i32* %l, align 4
  %inc158 = add nsw i32 %104, 1
  store i32 %inc158, i32* %l, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %103, i32 %104
  store i8 %conv157, i8* %arrayidx159, align 1
  br label %if.end160

if.end160:                                        ; preds = %cond.end155, %if.else123
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %if.end122
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %if.end47
  br label %for.inc288

if.end163:                                        ; preds = %land.lhs.true, %lor.lhs.false
  %105 = load i32, i32* %c, align 4
  switch i32 %105, label %sw.default [
    i32 97, label %sw.bb
    i32 98, label %sw.bb166
    i32 100, label %sw.bb169
    i32 101, label %sw.bb172
    i32 102, label %sw.bb175
    i32 110, label %sw.bb178
    i32 114, label %sw.bb181
    i32 116, label %sw.bb184
    i32 118, label %sw.bb187
    i32 92, label %sw.bb190
    i32 48, label %sw.bb193
    i32 49, label %sw.bb193
    i32 50, label %sw.bb193
    i32 51, label %sw.bb193
    i32 52, label %sw.bb193
    i32 53, label %sw.bb193
    i32 54, label %sw.bb193
    i32 55, label %sw.bb193
    i32 120, label %sw.bb218
  ]

sw.bb:                                            ; preds = %if.end163
  %106 = load i8*, i8** %array.addr, align 4
  %107 = load i32, i32* %l, align 4
  %inc164 = add nsw i32 %107, 1
  store i32 %inc164, i32* %l, align 4
  %arrayidx165 = getelementptr inbounds i8, i8* %106, i32 %107
  store i8 7, i8* %arrayidx165, align 1
  br label %sw.epilog

sw.bb166:                                         ; preds = %if.end163
  %108 = load i8*, i8** %array.addr, align 4
  %109 = load i32, i32* %l, align 4
  %inc167 = add nsw i32 %109, 1
  store i32 %inc167, i32* %l, align 4
  %arrayidx168 = getelementptr inbounds i8, i8* %108, i32 %109
  store i8 8, i8* %arrayidx168, align 1
  br label %sw.epilog

sw.bb169:                                         ; preds = %if.end163
  %110 = load i8*, i8** %array.addr, align 4
  %111 = load i32, i32* %l, align 4
  %inc170 = add nsw i32 %111, 1
  store i32 %inc170, i32* %l, align 4
  %arrayidx171 = getelementptr inbounds i8, i8* %110, i32 %111
  store i8 127, i8* %arrayidx171, align 1
  br label %sw.epilog

sw.bb172:                                         ; preds = %if.end163
  %112 = load i8*, i8** %array.addr, align 4
  %113 = load i32, i32* %l, align 4
  %inc173 = add nsw i32 %113, 1
  store i32 %inc173, i32* %l, align 4
  %arrayidx174 = getelementptr inbounds i8, i8* %112, i32 %113
  store i8 27, i8* %arrayidx174, align 1
  br label %sw.epilog

sw.bb175:                                         ; preds = %if.end163
  %114 = load i8*, i8** %array.addr, align 4
  %115 = load i32, i32* %l, align 4
  %inc176 = add nsw i32 %115, 1
  store i32 %inc176, i32* %l, align 4
  %arrayidx177 = getelementptr inbounds i8, i8* %114, i32 %115
  store i8 12, i8* %arrayidx177, align 1
  br label %sw.epilog

sw.bb178:                                         ; preds = %if.end163
  %116 = load i8*, i8** %array.addr, align 4
  %117 = load i32, i32* %l, align 4
  %inc179 = add nsw i32 %117, 1
  store i32 %inc179, i32* %l, align 4
  %arrayidx180 = getelementptr inbounds i8, i8* %116, i32 %117
  store i8 10, i8* %arrayidx180, align 1
  br label %sw.epilog

sw.bb181:                                         ; preds = %if.end163
  %118 = load i8*, i8** %array.addr, align 4
  %119 = load i32, i32* %l, align 4
  %inc182 = add nsw i32 %119, 1
  store i32 %inc182, i32* %l, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %118, i32 %119
  store i8 13, i8* %arrayidx183, align 1
  br label %sw.epilog

sw.bb184:                                         ; preds = %if.end163
  %120 = load i8*, i8** %array.addr, align 4
  %121 = load i32, i32* %l, align 4
  %inc185 = add nsw i32 %121, 1
  store i32 %inc185, i32* %l, align 4
  %arrayidx186 = getelementptr inbounds i8, i8* %120, i32 %121
  store i8 9, i8* %arrayidx186, align 1
  br label %sw.epilog

sw.bb187:                                         ; preds = %if.end163
  %122 = load i8*, i8** %array.addr, align 4
  %123 = load i32, i32* %l, align 4
  %inc188 = add nsw i32 %123, 1
  store i32 %inc188, i32* %l, align 4
  %arrayidx189 = getelementptr inbounds i8, i8* %122, i32 %123
  store i8 11, i8* %arrayidx189, align 1
  br label %sw.epilog

sw.bb190:                                         ; preds = %if.end163
  %124 = load i8*, i8** %array.addr, align 4
  %125 = load i32, i32* %l, align 4
  %inc191 = add nsw i32 %125, 1
  store i32 %inc191, i32* %l, align 4
  %arrayidx192 = getelementptr inbounds i8, i8* %124, i32 %125
  store i8 92, i8* %arrayidx192, align 1
  br label %sw.epilog

sw.bb193:                                         ; preds = %if.end163, %if.end163, %if.end163, %if.end163, %if.end163, %if.end163, %if.end163, %if.end163
  %126 = load i32, i32* %i, align 4
  %inc194 = add nsw i32 %126, 1
  store i32 %inc194, i32* %i, align 4
  store i32 2, i32* %temp, align 4
  %127 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %127, 48
  store i32 %sub, i32* %c, align 4
  br label %for.cond195

for.cond195:                                      ; preds = %for.inc, %sw.bb193
  %128 = load i8*, i8** %seq.addr, align 4
  %129 = load i32, i32* %i, align 4
  %arrayidx196 = getelementptr inbounds i8, i8* %128, i32 %129
  %130 = load i8, i8* %arrayidx196, align 1
  %conv197 = zext i8 %130 to i32
  %cmp198 = icmp sge i32 %conv197, 48
  br i1 %cmp198, label %land.lhs.true200, label %land.end

land.lhs.true200:                                 ; preds = %for.cond195
  %131 = load i8*, i8** %seq.addr, align 4
  %132 = load i32, i32* %i, align 4
  %arrayidx201 = getelementptr inbounds i8, i8* %131, i32 %132
  %133 = load i8, i8* %arrayidx201, align 1
  %conv202 = zext i8 %133 to i32
  %cmp203 = icmp sle i32 %conv202, 55
  br i1 %cmp203, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true200
  %134 = load i32, i32* %temp, align 4
  %dec205 = add nsw i32 %134, -1
  store i32 %dec205, i32* %temp, align 4
  %tobool206 = icmp ne i32 %134, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true200, %for.cond195
  %135 = phi i1 [ false, %land.lhs.true200 ], [ false, %for.cond195 ], [ %tobool206, %land.rhs ]
  br i1 %135, label %for.body207, label %for.end

for.body207:                                      ; preds = %land.end
  %136 = load i32, i32* %c, align 4
  %mul = mul nsw i32 %136, 8
  %137 = load i8*, i8** %seq.addr, align 4
  %138 = load i32, i32* %i, align 4
  %arrayidx208 = getelementptr inbounds i8, i8* %137, i32 %138
  %139 = load i8, i8* %arrayidx208, align 1
  %conv209 = sext i8 %139 to i32
  %sub210 = sub nsw i32 %conv209, 48
  %add211 = add nsw i32 %mul, %sub210
  store i32 %add211, i32* %c, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body207
  %140 = load i32, i32* %i, align 4
  %inc212 = add nsw i32 %140, 1
  store i32 %inc212, i32* %i, align 4
  br label %for.cond195

for.end:                                          ; preds = %land.end
  %141 = load i32, i32* %i, align 4
  %dec213 = add nsw i32 %141, -1
  store i32 %dec213, i32* %i, align 4
  %142 = load i32, i32* %c, align 4
  %and214 = and i32 %142, 255
  %conv215 = trunc i32 %and214 to i8
  %143 = load i8*, i8** %array.addr, align 4
  %144 = load i32, i32* %l, align 4
  %inc216 = add nsw i32 %144, 1
  store i32 %inc216, i32* %l, align 4
  %arrayidx217 = getelementptr inbounds i8, i8* %143, i32 %144
  store i8 %conv215, i8* %arrayidx217, align 1
  br label %sw.epilog

sw.bb218:                                         ; preds = %if.end163
  %145 = load i32, i32* %i, align 4
  %inc219 = add nsw i32 %145, 1
  store i32 %inc219, i32* %i, align 4
  store i32 2, i32* %temp, align 4
  store i32 0, i32* %c, align 4
  br label %for.cond220

for.cond220:                                      ; preds = %for.inc269, %sw.bb218
  %146 = load i8*, i8** %seq.addr, align 4
  %147 = load i32, i32* %i, align 4
  %arrayidx221 = getelementptr inbounds i8, i8* %146, i32 %147
  %148 = load i8, i8* %arrayidx221, align 1
  %conv222 = zext i8 %148 to i32
  %call223 = call i32 @isxdigit(i32 %conv222) #5
  %tobool224 = icmp ne i32 %call223, 0
  br i1 %tobool224, label %land.rhs225, label %land.end228

land.rhs225:                                      ; preds = %for.cond220
  %149 = load i32, i32* %temp, align 4
  %dec226 = add nsw i32 %149, -1
  store i32 %dec226, i32* %temp, align 4
  %tobool227 = icmp ne i32 %149, 0
  br label %land.end228

land.end228:                                      ; preds = %land.rhs225, %for.cond220
  %150 = phi i1 [ false, %for.cond220 ], [ %tobool227, %land.rhs225 ]
  br i1 %150, label %for.body229, label %for.end271

for.body229:                                      ; preds = %land.end228
  %151 = load i32, i32* %c, align 4
  %mul230 = mul nsw i32 %151, 16
  %152 = load i8*, i8** %seq.addr, align 4
  %153 = load i32, i32* %i, align 4
  %arrayidx231 = getelementptr inbounds i8, i8* %152, i32 %153
  %154 = load i8, i8* %arrayidx231, align 1
  %conv232 = sext i8 %154 to i32
  %cmp233 = icmp sge i32 %conv232, 97
  br i1 %cmp233, label %land.lhs.true235, label %cond.false245

land.lhs.true235:                                 ; preds = %for.body229
  %155 = load i8*, i8** %seq.addr, align 4
  %156 = load i32, i32* %i, align 4
  %arrayidx236 = getelementptr inbounds i8, i8* %155, i32 %156
  %157 = load i8, i8* %arrayidx236, align 1
  %conv237 = sext i8 %157 to i32
  %cmp238 = icmp sle i32 %conv237, 102
  br i1 %cmp238, label %cond.true240, label %cond.false245

cond.true240:                                     ; preds = %land.lhs.true235
  %158 = load i8*, i8** %seq.addr, align 4
  %159 = load i32, i32* %i, align 4
  %arrayidx241 = getelementptr inbounds i8, i8* %158, i32 %159
  %160 = load i8, i8* %arrayidx241, align 1
  %conv242 = sext i8 %160 to i32
  %sub243 = sub nsw i32 %conv242, 97
  %add244 = add nsw i32 %sub243, 10
  br label %cond.end266

cond.false245:                                    ; preds = %land.lhs.true235, %for.body229
  %161 = load i8*, i8** %seq.addr, align 4
  %162 = load i32, i32* %i, align 4
  %arrayidx246 = getelementptr inbounds i8, i8* %161, i32 %162
  %163 = load i8, i8* %arrayidx246, align 1
  %conv247 = sext i8 %163 to i32
  %cmp248 = icmp sge i32 %conv247, 65
  br i1 %cmp248, label %land.lhs.true250, label %cond.false260

land.lhs.true250:                                 ; preds = %cond.false245
  %164 = load i8*, i8** %seq.addr, align 4
  %165 = load i32, i32* %i, align 4
  %arrayidx251 = getelementptr inbounds i8, i8* %164, i32 %165
  %166 = load i8, i8* %arrayidx251, align 1
  %conv252 = sext i8 %166 to i32
  %cmp253 = icmp sle i32 %conv252, 70
  br i1 %cmp253, label %cond.true255, label %cond.false260

cond.true255:                                     ; preds = %land.lhs.true250
  %167 = load i8*, i8** %seq.addr, align 4
  %168 = load i32, i32* %i, align 4
  %arrayidx256 = getelementptr inbounds i8, i8* %167, i32 %168
  %169 = load i8, i8* %arrayidx256, align 1
  %conv257 = sext i8 %169 to i32
  %sub258 = sub nsw i32 %conv257, 65
  %add259 = add nsw i32 %sub258, 10
  br label %cond.end264

cond.false260:                                    ; preds = %land.lhs.true250, %cond.false245
  %170 = load i8*, i8** %seq.addr, align 4
  %171 = load i32, i32* %i, align 4
  %arrayidx261 = getelementptr inbounds i8, i8* %170, i32 %171
  %172 = load i8, i8* %arrayidx261, align 1
  %conv262 = sext i8 %172 to i32
  %sub263 = sub nsw i32 %conv262, 48
  br label %cond.end264

cond.end264:                                      ; preds = %cond.false260, %cond.true255
  %cond265 = phi i32 [ %add259, %cond.true255 ], [ %sub263, %cond.false260 ]
  br label %cond.end266

cond.end266:                                      ; preds = %cond.end264, %cond.true240
  %cond267 = phi i32 [ %add244, %cond.true240 ], [ %cond265, %cond.end264 ]
  %add268 = add nsw i32 %mul230, %cond267
  store i32 %add268, i32* %c, align 4
  br label %for.inc269

for.inc269:                                       ; preds = %cond.end266
  %173 = load i32, i32* %i, align 4
  %inc270 = add nsw i32 %173, 1
  store i32 %inc270, i32* %i, align 4
  br label %for.cond220

for.end271:                                       ; preds = %land.end228
  %174 = load i32, i32* %temp, align 4
  %cmp272 = icmp eq i32 %174, 2
  br i1 %cmp272, label %if.then274, label %if.end275

if.then274:                                       ; preds = %for.end271
  store i32 120, i32* %c, align 4
  br label %if.end275

if.end275:                                        ; preds = %if.then274, %for.end271
  %175 = load i32, i32* %i, align 4
  %dec276 = add nsw i32 %175, -1
  store i32 %dec276, i32* %i, align 4
  %176 = load i32, i32* %c, align 4
  %and277 = and i32 %176, 255
  %conv278 = trunc i32 %and277 to i8
  %177 = load i8*, i8** %array.addr, align 4
  %178 = load i32, i32* %l, align 4
  %inc279 = add nsw i32 %178, 1
  store i32 %inc279, i32* %l, align 4
  %arrayidx280 = getelementptr inbounds i8, i8* %177, i32 %178
  store i8 %conv278, i8* %arrayidx280, align 1
  br label %sw.epilog

sw.default:                                       ; preds = %if.end163
  %179 = load i32, i32* %c, align 4
  %conv281 = trunc i32 %179 to i8
  %180 = load i8*, i8** %array.addr, align 4
  %181 = load i32, i32* %l, align 4
  %inc282 = add nsw i32 %181, 1
  store i32 %inc282, i32* %l, align 4
  %arrayidx283 = getelementptr inbounds i8, i8* %180, i32 %181
  store i8 %conv281, i8* %arrayidx283, align 1
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end275, %for.end, %sw.bb190, %sw.bb187, %sw.bb184, %sw.bb181, %sw.bb178, %sw.bb175, %sw.bb172, %sw.bb169, %sw.bb166, %sw.bb
  br label %for.inc288

if.end284:                                        ; preds = %for.body
  %182 = load i32, i32* %c, align 4
  %conv285 = trunc i32 %182 to i8
  %183 = load i8*, i8** %array.addr, align 4
  %184 = load i32, i32* %l, align 4
  %inc286 = add nsw i32 %184, 1
  store i32 %inc286, i32* %l, align 4
  %arrayidx287 = getelementptr inbounds i8, i8* %183, i32 %184
  store i8 %conv285, i8* %arrayidx287, align 1
  br label %for.inc288

for.inc288:                                       ; preds = %if.end284, %sw.epilog, %if.end162
  %185 = load i32, i32* %i, align 4
  %inc289 = add nsw i32 %185, 1
  store i32 %inc289, i32* %i, align 4
  br label %for.cond

for.end290:                                       ; preds = %if.then6, %for.cond
  %186 = load i32, i32* %l, align 4
  %187 = load i32*, i32** %len.addr, align 4
  store i32 %186, i32* %187, align 4
  %188 = load i8*, i8** %array.addr, align 4
  %189 = load i32, i32* %l, align 4
  %arrayidx291 = getelementptr inbounds i8, i8* %188, i32 %189
  store i8 0, i8* %arrayidx291, align 1
  ret i32 0
}

declare void @xfree(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare %struct._keymap_entry* @rl_make_bare_keymap() #1

declare i32 @_rl_null_function(i32, i32) #1

declare i32 @strncmp(i8*, i8*, i32) #1

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #3

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

; Function Attrs: nounwind readonly
declare i32 @isxdigit(i32) #3

; Function Attrs: noinline nounwind
define i8* @rl_untranslate_keyseq(i32 %seq) #0 {
entry:
  %seq.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %seq, i32* %seq.addr, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %seq.addr, align 4
  store i32 %0, i32* %c, align 4
  %1 = load i32, i32* %c, align 4
  %cmp = icmp sgt i32 %1, 127
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %c, align 4
  %cmp1 = icmp sle i32 %2, 255
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %3
  store i8 92, i8* %arrayidx, align 1
  %4 = load i32, i32* %i, align 4
  %inc2 = add nsw i32 %4, 1
  store i32 %inc2, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %4
  store i8 77, i8* %arrayidx3, align 1
  %5 = load i32, i32* %i, align 4
  %inc4 = add nsw i32 %5, 1
  store i32 %inc4, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %5
  store i8 45, i8* %arrayidx5, align 1
  %6 = load i32, i32* %c, align 4
  %and = and i32 %6, -129
  store i32 %and, i32* %c, align 4
  br label %if.end147

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %c, align 4
  %cmp6 = icmp eq i32 %7, 27
  br i1 %cmp6, label %if.then7, label %if.else10

if.then7:                                         ; preds = %if.else
  %8 = load i32, i32* %i, align 4
  %inc8 = add nsw i32 %8, 1
  store i32 %inc8, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %8
  store i8 92, i8* %arrayidx9, align 1
  store i32 101, i32* %c, align 4
  br label %if.end146

if.else10:                                        ; preds = %if.else
  %9 = load i32, i32* %c, align 4
  %cmp11 = icmp slt i32 %9, 32
  br i1 %cmp11, label %land.lhs.true12, label %if.else135

land.lhs.true12:                                  ; preds = %if.else10
  %10 = load i32, i32* %c, align 4
  %and13 = and i32 %10, 128
  %cmp14 = icmp eq i32 %and13, 0
  br i1 %cmp14, label %if.then15, label %if.else135

if.then15:                                        ; preds = %land.lhs.true12
  %11 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %11, 1
  store i32 %inc16, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %11
  store i8 92, i8* %arrayidx17, align 1
  %12 = load i32, i32* %i, align 4
  %inc18 = add nsw i32 %12, 1
  store i32 %inc18, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %12
  store i8 67, i8* %arrayidx19, align 1
  %13 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %13, 1
  store i32 %inc20, i32* %i, align 4
  %arrayidx21 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %13
  store i8 45, i8* %arrayidx21, align 1
  %14 = load i32, i32* %c, align 4
  %or = or i32 %14, 64
  %conv = trunc i32 %or to i8
  %conv22 = zext i8 %conv to i32
  %15 = load i32, i32* %c, align 4
  %or23 = or i32 %15, 64
  %cmp24 = icmp eq i32 %conv22, %or23
  br i1 %cmp24, label %land.lhs.true26, label %cond.false

land.lhs.true26:                                  ; preds = %if.then15
  %16 = load i32, i32* %c, align 4
  %or27 = or i32 %16, 64
  %conv28 = trunc i32 %or27 to i8
  %conv29 = zext i8 %conv28 to i32
  %call = call i32 @islower(i32 %conv29) #5
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true26
  %17 = load i32, i32* %c, align 4
  %or30 = or i32 %17, 64
  %conv31 = trunc i32 %or30 to i8
  %conv32 = zext i8 %conv31 to i32
  %call33 = call i32 @toupper(i32 %conv32) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true26, %if.then15
  %18 = load i32, i32* %c, align 4
  %or34 = or i32 %18, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call33, %cond.true ], [ %or34, %cond.false ]
  %conv35 = trunc i32 %cond to i8
  %conv36 = zext i8 %conv35 to i32
  %19 = load i32, i32* %c, align 4
  %or37 = or i32 %19, 64
  %conv38 = trunc i32 %or37 to i8
  %conv39 = zext i8 %conv38 to i32
  %20 = load i32, i32* %c, align 4
  %or40 = or i32 %20, 64
  %cmp41 = icmp eq i32 %conv39, %or40
  br i1 %cmp41, label %land.lhs.true43, label %cond.false54

land.lhs.true43:                                  ; preds = %cond.end
  %21 = load i32, i32* %c, align 4
  %or44 = or i32 %21, 64
  %conv45 = trunc i32 %or44 to i8
  %conv46 = zext i8 %conv45 to i32
  %call47 = call i32 @islower(i32 %conv46) #5
  %tobool48 = icmp ne i32 %call47, 0
  br i1 %tobool48, label %cond.true49, label %cond.false54

cond.true49:                                      ; preds = %land.lhs.true43
  %22 = load i32, i32* %c, align 4
  %or50 = or i32 %22, 64
  %conv51 = trunc i32 %or50 to i8
  %conv52 = zext i8 %conv51 to i32
  %call53 = call i32 @toupper(i32 %conv52) #5
  br label %cond.end56

cond.false54:                                     ; preds = %land.lhs.true43, %cond.end
  %23 = load i32, i32* %c, align 4
  %or55 = or i32 %23, 64
  br label %cond.end56

cond.end56:                                       ; preds = %cond.false54, %cond.true49
  %cond57 = phi i32 [ %call53, %cond.true49 ], [ %or55, %cond.false54 ]
  %cmp58 = icmp eq i32 %conv36, %cond57
  br i1 %cmp58, label %land.lhs.true60, label %cond.false111

land.lhs.true60:                                  ; preds = %cond.end56
  %24 = load i32, i32* %c, align 4
  %or61 = or i32 %24, 64
  %conv62 = trunc i32 %or61 to i8
  %conv63 = zext i8 %conv62 to i32
  %25 = load i32, i32* %c, align 4
  %or64 = or i32 %25, 64
  %cmp65 = icmp eq i32 %conv63, %or64
  br i1 %cmp65, label %land.lhs.true67, label %cond.false78

land.lhs.true67:                                  ; preds = %land.lhs.true60
  %26 = load i32, i32* %c, align 4
  %or68 = or i32 %26, 64
  %conv69 = trunc i32 %or68 to i8
  %conv70 = zext i8 %conv69 to i32
  %call71 = call i32 @islower(i32 %conv70) #5
  %tobool72 = icmp ne i32 %call71, 0
  br i1 %tobool72, label %cond.true73, label %cond.false78

cond.true73:                                      ; preds = %land.lhs.true67
  %27 = load i32, i32* %c, align 4
  %or74 = or i32 %27, 64
  %conv75 = trunc i32 %or74 to i8
  %conv76 = zext i8 %conv75 to i32
  %call77 = call i32 @toupper(i32 %conv76) #5
  br label %cond.end80

cond.false78:                                     ; preds = %land.lhs.true67, %land.lhs.true60
  %28 = load i32, i32* %c, align 4
  %or79 = or i32 %28, 64
  br label %cond.end80

cond.end80:                                       ; preds = %cond.false78, %cond.true73
  %cond81 = phi i32 [ %call77, %cond.true73 ], [ %or79, %cond.false78 ]
  %conv82 = trunc i32 %cond81 to i8
  %conv83 = zext i8 %conv82 to i32
  %call84 = call i32 @isupper(i32 %conv83) #5
  %tobool85 = icmp ne i32 %call84, 0
  br i1 %tobool85, label %cond.true86, label %cond.false111

cond.true86:                                      ; preds = %cond.end80
  %29 = load i32, i32* %c, align 4
  %or87 = or i32 %29, 64
  %conv88 = trunc i32 %or87 to i8
  %conv89 = zext i8 %conv88 to i32
  %30 = load i32, i32* %c, align 4
  %or90 = or i32 %30, 64
  %cmp91 = icmp eq i32 %conv89, %or90
  br i1 %cmp91, label %land.lhs.true93, label %cond.false104

land.lhs.true93:                                  ; preds = %cond.true86
  %31 = load i32, i32* %c, align 4
  %or94 = or i32 %31, 64
  %conv95 = trunc i32 %or94 to i8
  %conv96 = zext i8 %conv95 to i32
  %call97 = call i32 @islower(i32 %conv96) #5
  %tobool98 = icmp ne i32 %call97, 0
  br i1 %tobool98, label %cond.true99, label %cond.false104

cond.true99:                                      ; preds = %land.lhs.true93
  %32 = load i32, i32* %c, align 4
  %or100 = or i32 %32, 64
  %conv101 = trunc i32 %or100 to i8
  %conv102 = zext i8 %conv101 to i32
  %call103 = call i32 @toupper(i32 %conv102) #5
  br label %cond.end106

cond.false104:                                    ; preds = %land.lhs.true93, %cond.true86
  %33 = load i32, i32* %c, align 4
  %or105 = or i32 %33, 64
  br label %cond.end106

cond.end106:                                      ; preds = %cond.false104, %cond.true99
  %cond107 = phi i32 [ %call103, %cond.true99 ], [ %or105, %cond.false104 ]
  %conv108 = trunc i32 %cond107 to i8
  %conv109 = zext i8 %conv108 to i32
  %call110 = call i32 @tolower(i32 %conv109) #5
  br label %cond.end133

cond.false111:                                    ; preds = %cond.end80, %cond.end56
  %34 = load i32, i32* %c, align 4
  %or112 = or i32 %34, 64
  %conv113 = trunc i32 %or112 to i8
  %conv114 = zext i8 %conv113 to i32
  %35 = load i32, i32* %c, align 4
  %or115 = or i32 %35, 64
  %cmp116 = icmp eq i32 %conv114, %or115
  br i1 %cmp116, label %land.lhs.true118, label %cond.false129

land.lhs.true118:                                 ; preds = %cond.false111
  %36 = load i32, i32* %c, align 4
  %or119 = or i32 %36, 64
  %conv120 = trunc i32 %or119 to i8
  %conv121 = zext i8 %conv120 to i32
  %call122 = call i32 @islower(i32 %conv121) #5
  %tobool123 = icmp ne i32 %call122, 0
  br i1 %tobool123, label %cond.true124, label %cond.false129

cond.true124:                                     ; preds = %land.lhs.true118
  %37 = load i32, i32* %c, align 4
  %or125 = or i32 %37, 64
  %conv126 = trunc i32 %or125 to i8
  %conv127 = zext i8 %conv126 to i32
  %call128 = call i32 @toupper(i32 %conv127) #5
  br label %cond.end131

cond.false129:                                    ; preds = %land.lhs.true118, %cond.false111
  %38 = load i32, i32* %c, align 4
  %or130 = or i32 %38, 64
  br label %cond.end131

cond.end131:                                      ; preds = %cond.false129, %cond.true124
  %cond132 = phi i32 [ %call128, %cond.true124 ], [ %or130, %cond.false129 ]
  br label %cond.end133

cond.end133:                                      ; preds = %cond.end131, %cond.end106
  %cond134 = phi i32 [ %call110, %cond.end106 ], [ %cond132, %cond.end131 ]
  store i32 %cond134, i32* %c, align 4
  br label %if.end145

if.else135:                                       ; preds = %land.lhs.true12, %if.else10
  %39 = load i32, i32* %c, align 4
  %cmp136 = icmp eq i32 %39, 127
  br i1 %cmp136, label %if.then138, label %if.end

if.then138:                                       ; preds = %if.else135
  %40 = load i32, i32* %i, align 4
  %inc139 = add nsw i32 %40, 1
  store i32 %inc139, i32* %i, align 4
  %arrayidx140 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %40
  store i8 92, i8* %arrayidx140, align 1
  %41 = load i32, i32* %i, align 4
  %inc141 = add nsw i32 %41, 1
  store i32 %inc141, i32* %i, align 4
  %arrayidx142 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %41
  store i8 67, i8* %arrayidx142, align 1
  %42 = load i32, i32* %i, align 4
  %inc143 = add nsw i32 %42, 1
  store i32 %inc143, i32* %i, align 4
  %arrayidx144 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %42
  store i8 45, i8* %arrayidx144, align 1
  store i32 63, i32* %c, align 4
  br label %if.end

if.end:                                           ; preds = %if.then138, %if.else135
  br label %if.end145

if.end145:                                        ; preds = %if.end, %cond.end133
  br label %if.end146

if.end146:                                        ; preds = %if.end145, %if.then7
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %if.then
  %43 = load i32, i32* %c, align 4
  %cmp148 = icmp eq i32 %43, 27
  br i1 %cmp148, label %if.then150, label %if.else153

if.then150:                                       ; preds = %if.end147
  %44 = load i32, i32* %i, align 4
  %inc151 = add nsw i32 %44, 1
  store i32 %inc151, i32* %i, align 4
  %arrayidx152 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %44
  store i8 92, i8* %arrayidx152, align 1
  store i32 101, i32* %c, align 4
  br label %if.end162

if.else153:                                       ; preds = %if.end147
  %45 = load i32, i32* %c, align 4
  %cmp154 = icmp eq i32 %45, 92
  br i1 %cmp154, label %if.then158, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else153
  %46 = load i32, i32* %c, align 4
  %cmp156 = icmp eq i32 %46, 34
  br i1 %cmp156, label %if.then158, label %if.end161

if.then158:                                       ; preds = %lor.lhs.false, %if.else153
  %47 = load i32, i32* %i, align 4
  %inc159 = add nsw i32 %47, 1
  store i32 %inc159, i32* %i, align 4
  %arrayidx160 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %47
  store i8 92, i8* %arrayidx160, align 1
  br label %if.end161

if.end161:                                        ; preds = %if.then158, %lor.lhs.false
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %if.then150
  %48 = load i32, i32* %c, align 4
  %conv163 = trunc i32 %48 to i8
  %49 = load i32, i32* %i, align 4
  %inc164 = add nsw i32 %49, 1
  store i32 %inc164, i32* %i, align 4
  %arrayidx165 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %49
  store i8 %conv163, i8* %arrayidx165, align 1
  %50 = load i32, i32* %i, align 4
  %arrayidx166 = getelementptr inbounds [16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 %50
  store i8 0, i8* %arrayidx166, align 1
  ret i8* getelementptr inbounds ([16 x i8], [16 x i8]* @rl_untranslate_keyseq.kseq, i32 0, i32 0)
}

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #3

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #3

; Function Attrs: noinline nounwind
define i8* @_rl_untranslate_macro_value(i8* %seq, i32 %use_escapes) #0 {
entry:
  %seq.addr = alloca i8*, align 4
  %use_escapes.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  %c = alloca i32, align 4
  store i8* %seq, i8** %seq.addr, align 4
  store i32 %use_escapes, i32* %use_escapes.addr, align 4
  %0 = load i8*, i8** %seq.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 7, %call
  %add = add i32 %mul, 1
  %call1 = call i8* @xmalloc(i32 %add)
  store i8* %call1, i8** %ret, align 4
  store i8* %call1, i8** %r, align 4
  %1 = load i8*, i8** %seq.addr, align 4
  store i8* %1, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  store i32 %conv, i32* %c, align 4
  %6 = load i32, i32* %c, align 4
  %cmp = icmp sgt i32 %6, 127
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %c, align 4
  %cmp3 = icmp sle i32 %7, 255
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %8 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 92, i8* %8, align 1
  %9 = load i8*, i8** %r, align 4
  %incdec.ptr5 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr5, i8** %r, align 4
  store i8 77, i8* %9, align 1
  %10 = load i8*, i8** %r, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr6, i8** %r, align 4
  store i8 45, i8* %10, align 1
  %11 = load i32, i32* %c, align 4
  %and = and i32 %11, -129
  store i32 %and, i32* %c, align 4
  br label %if.end155

if.else:                                          ; preds = %land.lhs.true, %for.body
  %12 = load i32, i32* %c, align 4
  %cmp7 = icmp eq i32 %12, 27
  br i1 %cmp7, label %if.then9, label %if.else11

if.then9:                                         ; preds = %if.else
  %13 = load i8*, i8** %r, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr10, i8** %r, align 4
  store i8 92, i8* %13, align 1
  store i32 101, i32* %c, align 4
  br label %if.end154

if.else11:                                        ; preds = %if.else
  %14 = load i32, i32* %c, align 4
  %cmp12 = icmp slt i32 %14, 32
  br i1 %cmp12, label %land.lhs.true14, label %if.else145

land.lhs.true14:                                  ; preds = %if.else11
  %15 = load i32, i32* %c, align 4
  %and15 = and i32 %15, 128
  %cmp16 = icmp eq i32 %and15, 0
  br i1 %cmp16, label %if.then18, label %if.else145

if.then18:                                        ; preds = %land.lhs.true14
  %16 = load i8*, i8** %r, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr19, i8** %r, align 4
  store i8 92, i8* %16, align 1
  %17 = load i32, i32* %use_escapes.addr, align 4
  %tobool20 = icmp ne i32 %17, 0
  br i1 %tobool20, label %land.lhs.true21, label %if.else26

land.lhs.true21:                                  ; preds = %if.then18
  %18 = load i32, i32* %c, align 4
  %call22 = call i32 @_rl_isescape(i32 %18)
  %tobool23 = icmp ne i32 %call22, 0
  br i1 %tobool23, label %if.then24, label %if.else26

if.then24:                                        ; preds = %land.lhs.true21
  %19 = load i32, i32* %c, align 4
  %call25 = call i32 @_rl_escchar(i32 %19)
  store i32 %call25, i32* %c, align 4
  br label %if.end

if.else26:                                        ; preds = %land.lhs.true21, %if.then18
  %20 = load i8*, i8** %r, align 4
  %incdec.ptr27 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr27, i8** %r, align 4
  store i8 67, i8* %20, align 1
  %21 = load i8*, i8** %r, align 4
  %incdec.ptr28 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr28, i8** %r, align 4
  store i8 45, i8* %21, align 1
  %22 = load i32, i32* %c, align 4
  %or = or i32 %22, 64
  %conv29 = trunc i32 %or to i8
  %conv30 = zext i8 %conv29 to i32
  %23 = load i32, i32* %c, align 4
  %or31 = or i32 %23, 64
  %cmp32 = icmp eq i32 %conv30, %or31
  br i1 %cmp32, label %land.lhs.true34, label %cond.false

land.lhs.true34:                                  ; preds = %if.else26
  %24 = load i32, i32* %c, align 4
  %or35 = or i32 %24, 64
  %conv36 = trunc i32 %or35 to i8
  %conv37 = zext i8 %conv36 to i32
  %call38 = call i32 @islower(i32 %conv37) #5
  %tobool39 = icmp ne i32 %call38, 0
  br i1 %tobool39, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true34
  %25 = load i32, i32* %c, align 4
  %or40 = or i32 %25, 64
  %conv41 = trunc i32 %or40 to i8
  %conv42 = zext i8 %conv41 to i32
  %call43 = call i32 @toupper(i32 %conv42) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true34, %if.else26
  %26 = load i32, i32* %c, align 4
  %or44 = or i32 %26, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call43, %cond.true ], [ %or44, %cond.false ]
  %conv45 = trunc i32 %cond to i8
  %conv46 = zext i8 %conv45 to i32
  %27 = load i32, i32* %c, align 4
  %or47 = or i32 %27, 64
  %conv48 = trunc i32 %or47 to i8
  %conv49 = zext i8 %conv48 to i32
  %28 = load i32, i32* %c, align 4
  %or50 = or i32 %28, 64
  %cmp51 = icmp eq i32 %conv49, %or50
  br i1 %cmp51, label %land.lhs.true53, label %cond.false64

land.lhs.true53:                                  ; preds = %cond.end
  %29 = load i32, i32* %c, align 4
  %or54 = or i32 %29, 64
  %conv55 = trunc i32 %or54 to i8
  %conv56 = zext i8 %conv55 to i32
  %call57 = call i32 @islower(i32 %conv56) #5
  %tobool58 = icmp ne i32 %call57, 0
  br i1 %tobool58, label %cond.true59, label %cond.false64

cond.true59:                                      ; preds = %land.lhs.true53
  %30 = load i32, i32* %c, align 4
  %or60 = or i32 %30, 64
  %conv61 = trunc i32 %or60 to i8
  %conv62 = zext i8 %conv61 to i32
  %call63 = call i32 @toupper(i32 %conv62) #5
  br label %cond.end66

cond.false64:                                     ; preds = %land.lhs.true53, %cond.end
  %31 = load i32, i32* %c, align 4
  %or65 = or i32 %31, 64
  br label %cond.end66

cond.end66:                                       ; preds = %cond.false64, %cond.true59
  %cond67 = phi i32 [ %call63, %cond.true59 ], [ %or65, %cond.false64 ]
  %cmp68 = icmp eq i32 %conv46, %cond67
  br i1 %cmp68, label %land.lhs.true70, label %cond.false121

land.lhs.true70:                                  ; preds = %cond.end66
  %32 = load i32, i32* %c, align 4
  %or71 = or i32 %32, 64
  %conv72 = trunc i32 %or71 to i8
  %conv73 = zext i8 %conv72 to i32
  %33 = load i32, i32* %c, align 4
  %or74 = or i32 %33, 64
  %cmp75 = icmp eq i32 %conv73, %or74
  br i1 %cmp75, label %land.lhs.true77, label %cond.false88

land.lhs.true77:                                  ; preds = %land.lhs.true70
  %34 = load i32, i32* %c, align 4
  %or78 = or i32 %34, 64
  %conv79 = trunc i32 %or78 to i8
  %conv80 = zext i8 %conv79 to i32
  %call81 = call i32 @islower(i32 %conv80) #5
  %tobool82 = icmp ne i32 %call81, 0
  br i1 %tobool82, label %cond.true83, label %cond.false88

cond.true83:                                      ; preds = %land.lhs.true77
  %35 = load i32, i32* %c, align 4
  %or84 = or i32 %35, 64
  %conv85 = trunc i32 %or84 to i8
  %conv86 = zext i8 %conv85 to i32
  %call87 = call i32 @toupper(i32 %conv86) #5
  br label %cond.end90

cond.false88:                                     ; preds = %land.lhs.true77, %land.lhs.true70
  %36 = load i32, i32* %c, align 4
  %or89 = or i32 %36, 64
  br label %cond.end90

cond.end90:                                       ; preds = %cond.false88, %cond.true83
  %cond91 = phi i32 [ %call87, %cond.true83 ], [ %or89, %cond.false88 ]
  %conv92 = trunc i32 %cond91 to i8
  %conv93 = zext i8 %conv92 to i32
  %call94 = call i32 @isupper(i32 %conv93) #5
  %tobool95 = icmp ne i32 %call94, 0
  br i1 %tobool95, label %cond.true96, label %cond.false121

cond.true96:                                      ; preds = %cond.end90
  %37 = load i32, i32* %c, align 4
  %or97 = or i32 %37, 64
  %conv98 = trunc i32 %or97 to i8
  %conv99 = zext i8 %conv98 to i32
  %38 = load i32, i32* %c, align 4
  %or100 = or i32 %38, 64
  %cmp101 = icmp eq i32 %conv99, %or100
  br i1 %cmp101, label %land.lhs.true103, label %cond.false114

land.lhs.true103:                                 ; preds = %cond.true96
  %39 = load i32, i32* %c, align 4
  %or104 = or i32 %39, 64
  %conv105 = trunc i32 %or104 to i8
  %conv106 = zext i8 %conv105 to i32
  %call107 = call i32 @islower(i32 %conv106) #5
  %tobool108 = icmp ne i32 %call107, 0
  br i1 %tobool108, label %cond.true109, label %cond.false114

cond.true109:                                     ; preds = %land.lhs.true103
  %40 = load i32, i32* %c, align 4
  %or110 = or i32 %40, 64
  %conv111 = trunc i32 %or110 to i8
  %conv112 = zext i8 %conv111 to i32
  %call113 = call i32 @toupper(i32 %conv112) #5
  br label %cond.end116

cond.false114:                                    ; preds = %land.lhs.true103, %cond.true96
  %41 = load i32, i32* %c, align 4
  %or115 = or i32 %41, 64
  br label %cond.end116

cond.end116:                                      ; preds = %cond.false114, %cond.true109
  %cond117 = phi i32 [ %call113, %cond.true109 ], [ %or115, %cond.false114 ]
  %conv118 = trunc i32 %cond117 to i8
  %conv119 = zext i8 %conv118 to i32
  %call120 = call i32 @tolower(i32 %conv119) #5
  br label %cond.end143

cond.false121:                                    ; preds = %cond.end90, %cond.end66
  %42 = load i32, i32* %c, align 4
  %or122 = or i32 %42, 64
  %conv123 = trunc i32 %or122 to i8
  %conv124 = zext i8 %conv123 to i32
  %43 = load i32, i32* %c, align 4
  %or125 = or i32 %43, 64
  %cmp126 = icmp eq i32 %conv124, %or125
  br i1 %cmp126, label %land.lhs.true128, label %cond.false139

land.lhs.true128:                                 ; preds = %cond.false121
  %44 = load i32, i32* %c, align 4
  %or129 = or i32 %44, 64
  %conv130 = trunc i32 %or129 to i8
  %conv131 = zext i8 %conv130 to i32
  %call132 = call i32 @islower(i32 %conv131) #5
  %tobool133 = icmp ne i32 %call132, 0
  br i1 %tobool133, label %cond.true134, label %cond.false139

cond.true134:                                     ; preds = %land.lhs.true128
  %45 = load i32, i32* %c, align 4
  %or135 = or i32 %45, 64
  %conv136 = trunc i32 %or135 to i8
  %conv137 = zext i8 %conv136 to i32
  %call138 = call i32 @toupper(i32 %conv137) #5
  br label %cond.end141

cond.false139:                                    ; preds = %land.lhs.true128, %cond.false121
  %46 = load i32, i32* %c, align 4
  %or140 = or i32 %46, 64
  br label %cond.end141

cond.end141:                                      ; preds = %cond.false139, %cond.true134
  %cond142 = phi i32 [ %call138, %cond.true134 ], [ %or140, %cond.false139 ]
  br label %cond.end143

cond.end143:                                      ; preds = %cond.end141, %cond.end116
  %cond144 = phi i32 [ %call120, %cond.end116 ], [ %cond142, %cond.end141 ]
  store i32 %cond144, i32* %c, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end143, %if.then24
  br label %if.end153

if.else145:                                       ; preds = %land.lhs.true14, %if.else11
  %47 = load i32, i32* %c, align 4
  %cmp146 = icmp eq i32 %47, 127
  br i1 %cmp146, label %if.then148, label %if.end152

if.then148:                                       ; preds = %if.else145
  %48 = load i8*, i8** %r, align 4
  %incdec.ptr149 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr149, i8** %r, align 4
  store i8 92, i8* %48, align 1
  %49 = load i8*, i8** %r, align 4
  %incdec.ptr150 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr150, i8** %r, align 4
  store i8 67, i8* %49, align 1
  %50 = load i8*, i8** %r, align 4
  %incdec.ptr151 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %incdec.ptr151, i8** %r, align 4
  store i8 45, i8* %50, align 1
  store i32 63, i32* %c, align 4
  br label %if.end152

if.end152:                                        ; preds = %if.then148, %if.else145
  br label %if.end153

if.end153:                                        ; preds = %if.end152, %if.end
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %if.then9
  br label %if.end155

if.end155:                                        ; preds = %if.end154, %if.then
  %51 = load i32, i32* %c, align 4
  %cmp156 = icmp eq i32 %51, 27
  br i1 %cmp156, label %if.then158, label %if.else160

if.then158:                                       ; preds = %if.end155
  %52 = load i8*, i8** %r, align 4
  %incdec.ptr159 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr159, i8** %r, align 4
  store i8 92, i8* %52, align 1
  store i32 101, i32* %c, align 4
  br label %if.end168

if.else160:                                       ; preds = %if.end155
  %53 = load i32, i32* %c, align 4
  %cmp161 = icmp eq i32 %53, 92
  br i1 %cmp161, label %if.then165, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else160
  %54 = load i32, i32* %c, align 4
  %cmp163 = icmp eq i32 %54, 34
  br i1 %cmp163, label %if.then165, label %if.end167

if.then165:                                       ; preds = %lor.lhs.false, %if.else160
  %55 = load i8*, i8** %r, align 4
  %incdec.ptr166 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr166, i8** %r, align 4
  store i8 92, i8* %55, align 1
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %lor.lhs.false
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %if.then158
  %56 = load i32, i32* %c, align 4
  %conv169 = trunc i32 %56 to i8
  %57 = load i8*, i8** %r, align 4
  %incdec.ptr170 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %incdec.ptr170, i8** %r, align 4
  store i8 %conv169, i8* %57, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end168
  %58 = load i8*, i8** %s, align 4
  %incdec.ptr171 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr171, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %59 = load i8*, i8** %r, align 4
  store i8 0, i8* %59, align 1
  %60 = load i8*, i8** %ret, align 4
  ret i8* %60
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_isescape(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 7, label %sw.bb
    i32 8, label %sw.bb
    i32 12, label %sw.bb
    i32 10, label %sw.bb
    i32 13, label %sw.bb
    i32 9, label %sw.bb
    i32 11, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_escchar(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 7, label %sw.bb
    i32 8, label %sw.bb1
    i32 12, label %sw.bb2
    i32 10, label %sw.bb3
    i32 13, label %sw.bb4
    i32 9, label %sw.bb5
    i32 11, label %sw.bb6
  ]

sw.bb:                                            ; preds = %entry
  store i32 97, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry
  store i32 98, i32* %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %entry
  store i32 102, i32* %retval, align 4
  br label %return

sw.bb3:                                           ; preds = %entry
  store i32 110, i32* %retval, align 4
  br label %return

sw.bb4:                                           ; preds = %entry
  store i32 114, i32* %retval, align 4
  br label %return

sw.bb5:                                           ; preds = %entry
  store i32 116, i32* %retval, align 4
  br label %return

sw.bb6:                                           ; preds = %entry
  store i32 118, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare void @rl_initialize_funmap() #1

declare i32 @strcasecmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_re_read_init_file(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %call = call i32 @rl_read_init_file(i8* null)
  store i32 %call, i32* %r, align 4
  call void @rl_set_keymap_from_edit_mode()
  %0 = load i32, i32* %r, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define i32 @rl_read_init_file(i8* %filename) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @last_readline_init_file, align 4
  store i8* %1, i8** %filename.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %filename.addr, align 4
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %call = call i8* @sh_get_env_value(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call, i8** %filename.addr, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load i8*, i8** %filename.addr, align 4
  %cmp4 = icmp eq i8* %3, null
  br i1 %cmp4, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end3
  %4 = load i8*, i8** %filename.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %cmp5 = icmp eq i32 %conv, 0
  br i1 %cmp5, label %if.then7, label %if.end13

if.then7:                                         ; preds = %lor.lhs.false, %if.end3
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i8** %filename.addr, align 4
  %6 = load i8*, i8** %filename.addr, align 4
  %call8 = call i32 @_rl_read_init_file(i8* %6, i32 0)
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.then7
  store i32 0, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.then7
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i8** %filename.addr, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %lor.lhs.false
  %7 = load i8*, i8** %filename.addr, align 4
  %call14 = call i32 @_rl_read_init_file(i8* %7, i32 0)
  store i32 %call14, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then11
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define void @rl_set_keymap_from_edit_mode() #0 {
entry:
  %0 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  br label %if.end3

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @rl_editing_mode, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  ret void
}

declare i8* @sh_get_env_value(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_read_init_file(i8* %filename, i32 %include_level) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %include_level.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i8*, align 4
  %openname = alloca i8*, align 4
  %line = alloca i8*, align 4
  %end = alloca i8*, align 4
  %file_size = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %include_level, i32* %include_level.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  store i8* %0, i8** @current_readline_init_file, align 4
  %1 = load i32, i32* %include_level.addr, align 4
  store i32 %1, i32* @current_readline_init_include_level, align 4
  %2 = load i8*, i8** %filename.addr, align 4
  %call = call i8* @tilde_expand(i8* %2)
  store i8* %call, i8** %openname, align 4
  %3 = load i8*, i8** %openname, align 4
  %call1 = call i8* @_rl_read_file(i8* %3, i32* %file_size)
  store i8* %call1, i8** %buffer, align 4
  %4 = load i8*, i8** %openname, align 4
  call void @xfree(i8* %4)
  br label %do.body

do.body:                                          ; preds = %entry
  %5 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %6 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %7 = load i8*, i8** %buffer, align 4
  %cmp = icmp eq i8* %7, null
  br i1 %cmp, label %if.then2, label %if.end4

if.then2:                                         ; preds = %do.end
  %call3 = call i32* @__errno_location()
  %8 = load i32, i32* %call3, align 4
  store i32 %8, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %do.end
  %9 = load i32, i32* %include_level.addr, align 4
  %cmp5 = icmp eq i32 %9, 0
  br i1 %cmp5, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.end4
  %10 = load i8*, i8** %filename.addr, align 4
  %11 = load i8*, i8** @last_readline_init_file, align 4
  %cmp6 = icmp ne i8* %10, %11
  br i1 %cmp6, label %if.then7, label %if.end14

if.then7:                                         ; preds = %land.lhs.true
  %12 = load i8*, i8** @last_readline_init_file, align 4
  %tobool8 = icmp ne i8* %12, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %13 = load i8*, i8** @last_readline_init_file, align 4
  call void @free(i8* %13)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  %14 = load i8*, i8** %filename.addr, align 4
  %call11 = call i32 @strlen(i8* %14)
  %add = add i32 1, %call11
  %call12 = call i8* @xmalloc(i32 %add)
  %15 = load i8*, i8** %filename.addr, align 4
  %call13 = call i8* @strcpy(i8* %call12, i8* %15)
  store i8* %call13, i8** @last_readline_init_file, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.end10, %land.lhs.true, %if.end4
  store i32 1, i32* @currently_reading_init_file, align 4
  store i32 1, i32* @current_readline_init_lineno, align 4
  %16 = load i8*, i8** %buffer, align 4
  store i8* %16, i8** %line, align 4
  %17 = load i8*, i8** %buffer, align 4
  %18 = load i32, i32* %file_size, align 4
  %add.ptr = getelementptr inbounds i8, i8* %17, i32 %18
  store i8* %add.ptr, i8** %end, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end41, %if.end14
  %19 = load i8*, i8** %line, align 4
  %20 = load i8*, i8** %end, align 4
  %cmp15 = icmp ult i8* %19, %20
  br i1 %cmp15, label %while.body, label %while.end45

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %21 = load i8*, i8** %line, align 4
  %22 = load i32, i32* %i, align 4
  %add.ptr16 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8*, i8** %end, align 4
  %cmp17 = icmp ne i8* %add.ptr16, %23
  br i1 %cmp17, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %24 = load i8*, i8** %line, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %26 to i32
  %cmp18 = icmp ne i32 %conv, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %27 = phi i1 [ false, %for.cond ], [ %cmp18, %land.rhs ]
  br i1 %27, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %29 = load i8*, i8** %line, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %29, i32 %30
  store i8 0, i8* %arrayidx20, align 1
  br label %while.cond21

while.cond21:                                     ; preds = %while.body32, %for.end
  %31 = load i8*, i8** %line, align 4
  %32 = load i8, i8* %31, align 1
  %conv22 = sext i8 %32 to i32
  %tobool23 = icmp ne i32 %conv22, 0
  br i1 %tobool23, label %land.rhs24, label %land.end31

land.rhs24:                                       ; preds = %while.cond21
  %33 = load i8*, i8** %line, align 4
  %34 = load i8, i8* %33, align 1
  %conv25 = sext i8 %34 to i32
  %cmp26 = icmp eq i32 %conv25, 32
  br i1 %cmp26, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs24
  %35 = load i8*, i8** %line, align 4
  %36 = load i8, i8* %35, align 1
  %conv28 = sext i8 %36 to i32
  %cmp29 = icmp eq i32 %conv28, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs24
  %37 = phi i1 [ true, %land.rhs24 ], [ %cmp29, %lor.rhs ]
  br label %land.end31

land.end31:                                       ; preds = %lor.end, %while.cond21
  %38 = phi i1 [ false, %while.cond21 ], [ %37, %lor.end ]
  br i1 %38, label %while.body32, label %while.end

while.body32:                                     ; preds = %land.end31
  %39 = load i8*, i8** %line, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %incdec.ptr, i8** %line, align 4
  %40 = load i32, i32* %i, align 4
  %dec = add nsw i32 %40, -1
  store i32 %dec, i32* %i, align 4
  br label %while.cond21

while.end:                                        ; preds = %land.end31
  %41 = load i8*, i8** %line, align 4
  %42 = load i8, i8* %41, align 1
  %conv33 = sext i8 %42 to i32
  %tobool34 = icmp ne i32 %conv33, 0
  br i1 %tobool34, label %land.lhs.true35, label %if.end41

land.lhs.true35:                                  ; preds = %while.end
  %43 = load i8*, i8** %line, align 4
  %44 = load i8, i8* %43, align 1
  %conv36 = sext i8 %44 to i32
  %cmp37 = icmp ne i32 %conv36, 35
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %land.lhs.true35
  %45 = load i8*, i8** %line, align 4
  %call40 = call i32 @rl_parse_and_bind(i8* %45)
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %land.lhs.true35, %while.end
  %46 = load i32, i32* %i, align 4
  %add42 = add nsw i32 %46, 1
  %47 = load i8*, i8** %line, align 4
  %add.ptr43 = getelementptr inbounds i8, i8* %47, i32 %add42
  store i8* %add.ptr43, i8** %line, align 4
  %48 = load i32, i32* @current_readline_init_lineno, align 4
  %inc44 = add nsw i32 %48, 1
  store i32 %inc44, i32* @current_readline_init_lineno, align 4
  br label %while.cond

while.end45:                                      ; preds = %while.cond
  %49 = load i8*, i8** %buffer, align 4
  call void @xfree(i8* %49)
  store i32 0, i32* @currently_reading_init_file, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end45, %if.then2
  %50 = load i32, i32* %retval, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind
define i32 @rl_parse_and_bind(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %funname = alloca i8*, align 4
  %kname = alloca i8*, align 4
  %c = alloca i32, align 4
  %i = alloca i32, align 4
  %key = alloca i32, align 4
  %equivalency = alloca i32, align 4
  %foundmod = alloca i32, align 4
  %foundsep = alloca i32, align 4
  %var = alloca i8*, align 4
  %value = alloca i8*, align 4
  %e = alloca i8*, align 4
  %s = alloca i32, align 4
  %seq = alloca i8*, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %passc = alloca i32, align 4
  %useq = alloca [2 x i8], align 1
  %fl = alloca i32, align 4
  %seq383 = alloca [2 x i8], align 1
  store i8* %string, i8** %string.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %string.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %5 = phi i1 [ true, %land.rhs ], [ %cmp3, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %5, %lor.end ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %7 = load i8*, i8** %string.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %string.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %8 = load i8*, i8** %string.addr, align 4
  %cmp5 = icmp eq i8* %8, null
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv7 = sext i8 %10 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i8, i8* %11, align 1
  %conv11 = sext i8 %12 to i32
  %cmp12 = icmp eq i32 %conv11, 35
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %while.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false10
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i8, i8* %13, align 1
  %conv14 = sext i8 %14 to i32
  %cmp15 = icmp eq i32 %conv14, 36
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  %15 = load i8*, i8** %string.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 1
  %call = call i32 @handle_parser_directive(i8* %arrayidx)
  store i32 0, i32* %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end
  %16 = load i8, i8* @_rl_parsing_conditionalized_out, align 1
  %tobool19 = icmp ne i8 %16, 0
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  store i32 0, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end18
  store i32 0, i32* %i, align 4
  %17 = load i8*, i8** %string.addr, align 4
  %18 = load i8, i8* %17, align 1
  %conv22 = sext i8 %18 to i32
  %cmp23 = icmp eq i32 %conv22, 34
  br i1 %cmp23, label %if.then25, label %if.end33

if.then25:                                        ; preds = %if.end21
  %19 = load i8*, i8** %string.addr, align 4
  %call26 = call i32 @_rl_skip_to_delim(i8* %19, i32 1, i32 34)
  store i32 %call26, i32* %i, align 4
  %20 = load i8*, i8** %string.addr, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %22 to i32
  %cmp29 = icmp eq i32 %conv28, 0
  br i1 %cmp29, label %if.then31, label %if.else

if.then31:                                        ; preds = %if.then25
  %23 = load i8*, i8** %string.addr, align 4
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.10, i32 0, i32 0), i8* %23)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then25
  %24 = load i32, i32* %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.else
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end21
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end33
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %27 to i32
  store i32 %conv35, i32* %c, align 4
  %tobool36 = icmp ne i32 %conv35, 0
  br i1 %tobool36, label %land.lhs.true, label %land.end45

land.lhs.true:                                    ; preds = %for.cond
  %28 = load i32, i32* %c, align 4
  %cmp37 = icmp ne i32 %28, 58
  br i1 %cmp37, label %land.lhs.true39, label %land.end45

land.lhs.true39:                                  ; preds = %land.lhs.true
  %29 = load i32, i32* %c, align 4
  %cmp40 = icmp ne i32 %29, 32
  br i1 %cmp40, label %land.rhs42, label %land.end45

land.rhs42:                                       ; preds = %land.lhs.true39
  %30 = load i32, i32* %c, align 4
  %cmp43 = icmp ne i32 %30, 9
  br label %land.end45

land.end45:                                       ; preds = %land.rhs42, %land.lhs.true39, %land.lhs.true, %for.cond
  %31 = phi i1 [ false, %land.lhs.true39 ], [ false, %land.lhs.true ], [ false, %for.cond ], [ %cmp43, %land.rhs42 ]
  br i1 %31, label %for.body, label %for.end

for.body:                                         ; preds = %land.end45
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %i, align 4
  %inc46 = add nsw i32 %32, 1
  store i32 %inc46, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end45
  %33 = load i32, i32* %c, align 4
  %cmp47 = icmp eq i32 %33, 58
  br i1 %cmp47, label %land.rhs49, label %land.end54

land.rhs49:                                       ; preds = %for.end
  %34 = load i8*, i8** %string.addr, align 4
  %35 = load i32, i32* %i, align 4
  %add = add nsw i32 %35, 1
  %arrayidx50 = getelementptr inbounds i8, i8* %34, i32 %add
  %36 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %36 to i32
  %cmp52 = icmp eq i32 %conv51, 61
  br label %land.end54

land.end54:                                       ; preds = %land.rhs49, %for.end
  %37 = phi i1 [ false, %for.end ], [ %cmp52, %land.rhs49 ]
  %land.ext = zext i1 %37 to i32
  store i32 %land.ext, i32* %equivalency, align 4
  %38 = load i32, i32* %c, align 4
  %cmp55 = icmp ne i32 %38, 0
  %conv56 = zext i1 %cmp55 to i32
  store i32 %conv56, i32* %foundsep, align 4
  %39 = load i8*, i8** %string.addr, align 4
  %40 = load i32, i32* %i, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %39, i32 %40
  %41 = load i8, i8* %arrayidx57, align 1
  %tobool58 = icmp ne i8 %41, 0
  br i1 %tobool58, label %if.then59, label %if.end62

if.then59:                                        ; preds = %land.end54
  %42 = load i8*, i8** %string.addr, align 4
  %43 = load i32, i32* %i, align 4
  %inc60 = add nsw i32 %43, 1
  store i32 %inc60, i32* %i, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %42, i32 %43
  store i8 0, i8* %arrayidx61, align 1
  br label %if.end62

if.end62:                                         ; preds = %if.then59, %land.end54
  %44 = load i32, i32* %equivalency, align 4
  %tobool63 = icmp ne i32 %44, 0
  br i1 %tobool63, label %if.then64, label %if.end67

if.then64:                                        ; preds = %if.end62
  %45 = load i8*, i8** %string.addr, align 4
  %46 = load i32, i32* %i, align 4
  %inc65 = add nsw i32 %46, 1
  store i32 %inc65, i32* %i, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %45, i32 %46
  store i8 0, i8* %arrayidx66, align 1
  br label %if.end67

if.end67:                                         ; preds = %if.then64, %if.end62
  %47 = load i8*, i8** %string.addr, align 4
  %call68 = call i32 @strcasecmp(i8* %47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0))
  %cmp69 = icmp eq i32 %call68, 0
  br i1 %cmp69, label %if.then71, label %if.end181

if.then71:                                        ; preds = %if.end67
  %48 = load i8*, i8** %string.addr, align 4
  %49 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %48, i32 %49
  store i8* %add.ptr, i8** %var, align 4
  br label %while.cond72

while.cond72:                                     ; preds = %while.body86, %if.then71
  %50 = load i8*, i8** %var, align 4
  %51 = load i8, i8* %50, align 1
  %conv73 = sext i8 %51 to i32
  %tobool74 = icmp ne i32 %conv73, 0
  br i1 %tobool74, label %land.rhs75, label %land.end84

land.rhs75:                                       ; preds = %while.cond72
  %52 = load i8*, i8** %var, align 4
  %53 = load i8, i8* %52, align 1
  %conv76 = sext i8 %53 to i32
  %cmp77 = icmp eq i32 %conv76, 32
  br i1 %cmp77, label %lor.end83, label %lor.rhs79

lor.rhs79:                                        ; preds = %land.rhs75
  %54 = load i8*, i8** %var, align 4
  %55 = load i8, i8* %54, align 1
  %conv80 = sext i8 %55 to i32
  %cmp81 = icmp eq i32 %conv80, 9
  br label %lor.end83

lor.end83:                                        ; preds = %lor.rhs79, %land.rhs75
  %56 = phi i1 [ true, %land.rhs75 ], [ %cmp81, %lor.rhs79 ]
  br label %land.end84

land.end84:                                       ; preds = %lor.end83, %while.cond72
  %57 = phi i1 [ false, %while.cond72 ], [ %56, %lor.end83 ]
  br i1 %57, label %while.body86, label %while.end88

while.body86:                                     ; preds = %land.end84
  %58 = load i8*, i8** %var, align 4
  %incdec.ptr87 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr87, i8** %var, align 4
  br label %while.cond72

while.end88:                                      ; preds = %land.end84
  %59 = load i8*, i8** %var, align 4
  store i8* %59, i8** %value, align 4
  br label %while.cond89

while.cond89:                                     ; preds = %while.body105, %while.end88
  %60 = load i8*, i8** %value, align 4
  %61 = load i8, i8* %60, align 1
  %conv90 = sext i8 %61 to i32
  %tobool91 = icmp ne i32 %conv90, 0
  br i1 %tobool91, label %land.rhs92, label %land.end103

land.rhs92:                                       ; preds = %while.cond89
  %62 = load i8*, i8** %value, align 4
  %63 = load i8, i8* %62, align 1
  %conv93 = sext i8 %63 to i32
  %cmp94 = icmp eq i32 %conv93, 32
  br i1 %cmp94, label %lor.end100, label %lor.rhs96

lor.rhs96:                                        ; preds = %land.rhs92
  %64 = load i8*, i8** %value, align 4
  %65 = load i8, i8* %64, align 1
  %conv97 = sext i8 %65 to i32
  %cmp98 = icmp eq i32 %conv97, 9
  br label %lor.end100

lor.end100:                                       ; preds = %lor.rhs96, %land.rhs92
  %66 = phi i1 [ true, %land.rhs92 ], [ %cmp98, %lor.rhs96 ]
  %lor.ext = zext i1 %66 to i32
  %cmp101 = icmp eq i32 %lor.ext, 0
  br label %land.end103

land.end103:                                      ; preds = %lor.end100, %while.cond89
  %67 = phi i1 [ false, %while.cond89 ], [ %cmp101, %lor.end100 ]
  br i1 %67, label %while.body105, label %while.end107

while.body105:                                    ; preds = %land.end103
  %68 = load i8*, i8** %value, align 4
  %incdec.ptr106 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %incdec.ptr106, i8** %value, align 4
  br label %while.cond89

while.end107:                                     ; preds = %land.end103
  %69 = load i8*, i8** %value, align 4
  %70 = load i8, i8* %69, align 1
  %tobool108 = icmp ne i8 %70, 0
  br i1 %tobool108, label %if.then109, label %if.end111

if.then109:                                       ; preds = %while.end107
  %71 = load i8*, i8** %value, align 4
  %incdec.ptr110 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %incdec.ptr110, i8** %value, align 4
  store i8 0, i8* %71, align 1
  br label %if.end111

if.end111:                                        ; preds = %if.then109, %while.end107
  br label %while.cond112

while.cond112:                                    ; preds = %while.body127, %if.end111
  %72 = load i8*, i8** %value, align 4
  %73 = load i8, i8* %72, align 1
  %conv113 = sext i8 %73 to i32
  %tobool114 = icmp ne i32 %conv113, 0
  br i1 %tobool114, label %land.rhs115, label %land.end125

land.rhs115:                                      ; preds = %while.cond112
  %74 = load i8*, i8** %value, align 4
  %75 = load i8, i8* %74, align 1
  %conv116 = sext i8 %75 to i32
  %cmp117 = icmp eq i32 %conv116, 32
  br i1 %cmp117, label %lor.end123, label %lor.rhs119

lor.rhs119:                                       ; preds = %land.rhs115
  %76 = load i8*, i8** %value, align 4
  %77 = load i8, i8* %76, align 1
  %conv120 = sext i8 %77 to i32
  %cmp121 = icmp eq i32 %conv120, 9
  br label %lor.end123

lor.end123:                                       ; preds = %lor.rhs119, %land.rhs115
  %78 = phi i1 [ true, %land.rhs115 ], [ %cmp121, %lor.rhs119 ]
  br label %land.end125

land.end125:                                      ; preds = %lor.end123, %while.cond112
  %79 = phi i1 [ false, %while.cond112 ], [ %78, %lor.end123 ]
  br i1 %79, label %while.body127, label %while.end129

while.body127:                                    ; preds = %land.end125
  %80 = load i8*, i8** %value, align 4
  %incdec.ptr128 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %incdec.ptr128, i8** %value, align 4
  br label %while.cond112

while.end129:                                     ; preds = %land.end125
  %81 = load i8*, i8** %var, align 4
  %call130 = call i32 @find_boolean_var(i8* %81)
  %cmp131 = icmp sge i32 %call130, 0
  br i1 %cmp131, label %if.then133, label %if.else163

if.then133:                                       ; preds = %while.end129
  br label %remove_trailing

remove_trailing:                                  ; preds = %if.else176, %if.then133
  %82 = load i8*, i8** %value, align 4
  %83 = load i8*, i8** %value, align 4
  %call134 = call i32 @strlen(i8* %83)
  %add.ptr135 = getelementptr inbounds i8, i8* %82, i32 %call134
  %add.ptr136 = getelementptr inbounds i8, i8* %add.ptr135, i32 -1
  store i8* %add.ptr136, i8** %e, align 4
  br label %while.cond137

while.cond137:                                    ; preds = %while.body152, %remove_trailing
  %84 = load i8*, i8** %e, align 4
  %85 = load i8*, i8** %value, align 4
  %cmp138 = icmp uge i8* %84, %85
  br i1 %cmp138, label %land.rhs140, label %land.end150

land.rhs140:                                      ; preds = %while.cond137
  %86 = load i8*, i8** %e, align 4
  %87 = load i8, i8* %86, align 1
  %conv141 = sext i8 %87 to i32
  %cmp142 = icmp eq i32 %conv141, 32
  br i1 %cmp142, label %lor.end148, label %lor.rhs144

lor.rhs144:                                       ; preds = %land.rhs140
  %88 = load i8*, i8** %e, align 4
  %89 = load i8, i8* %88, align 1
  %conv145 = sext i8 %89 to i32
  %cmp146 = icmp eq i32 %conv145, 9
  br label %lor.end148

lor.end148:                                       ; preds = %lor.rhs144, %land.rhs140
  %90 = phi i1 [ true, %land.rhs140 ], [ %cmp146, %lor.rhs144 ]
  br label %land.end150

land.end150:                                      ; preds = %lor.end148, %while.cond137
  %91 = phi i1 [ false, %while.cond137 ], [ %90, %lor.end148 ]
  br i1 %91, label %while.body152, label %while.end154

while.body152:                                    ; preds = %land.end150
  %92 = load i8*, i8** %e, align 4
  %incdec.ptr153 = getelementptr inbounds i8, i8* %92, i32 -1
  store i8* %incdec.ptr153, i8** %e, align 4
  br label %while.cond137

while.end154:                                     ; preds = %land.end150
  %93 = load i8*, i8** %e, align 4
  %incdec.ptr155 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %incdec.ptr155, i8** %e, align 4
  %94 = load i8*, i8** %e, align 4
  %95 = load i8, i8* %94, align 1
  %conv156 = sext i8 %95 to i32
  %tobool157 = icmp ne i32 %conv156, 0
  br i1 %tobool157, label %land.lhs.true158, label %if.end162

land.lhs.true158:                                 ; preds = %while.end154
  %96 = load i8*, i8** %e, align 4
  %97 = load i8*, i8** %value, align 4
  %cmp159 = icmp uge i8* %96, %97
  br i1 %cmp159, label %if.then161, label %if.end162

if.then161:                                       ; preds = %land.lhs.true158
  %98 = load i8*, i8** %e, align 4
  store i8 0, i8* %98, align 1
  br label %if.end162

if.end162:                                        ; preds = %if.then161, %land.lhs.true158, %while.end154
  br label %if.end179

if.else163:                                       ; preds = %while.end129
  %99 = load i8*, i8** %var, align 4
  %call164 = call i32 @find_string_var(i8* %99)
  store i32 %call164, i32* %i, align 4
  %cmp165 = icmp sge i32 %call164, 0
  br i1 %cmp165, label %if.then167, label %if.end178

if.then167:                                       ; preds = %if.else163
  %100 = load i8*, i8** %value, align 4
  %101 = load i8, i8* %100, align 1
  %conv168 = sext i8 %101 to i32
  %cmp169 = icmp eq i32 %conv168, 34
  br i1 %cmp169, label %if.then171, label %if.else176

if.then171:                                       ; preds = %if.then167
  %102 = load i8*, i8** %value, align 4
  %103 = load i8*, i8** %value, align 4
  %104 = load i8, i8* %103, align 1
  %conv172 = sext i8 %104 to i32
  %call173 = call i32 @_rl_skip_to_delim(i8* %102, i32 1, i32 %conv172)
  store i32 %call173, i32* %i, align 4
  %105 = load i8*, i8** %value, align 4
  %106 = load i32, i32* %i, align 4
  %arrayidx174 = getelementptr inbounds i8, i8* %105, i32 %106
  store i8 0, i8* %arrayidx174, align 1
  %107 = load i8*, i8** %value, align 4
  %incdec.ptr175 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %incdec.ptr175, i8** %value, align 4
  br label %if.end177

if.else176:                                       ; preds = %if.then167
  br label %remove_trailing

if.end177:                                        ; preds = %if.then171
  br label %if.end178

if.end178:                                        ; preds = %if.end177, %if.else163
  br label %if.end179

if.end179:                                        ; preds = %if.end178, %if.end162
  %108 = load i8*, i8** %var, align 4
  %109 = load i8*, i8** %value, align 4
  %call180 = call i32 @rl_variable_bind(i8* %108, i8* %109)
  store i32 0, i32* %retval, align 4
  br label %return

if.end181:                                        ; preds = %if.end67
  br label %for.cond182

for.cond182:                                      ; preds = %for.inc201, %if.end181
  %110 = load i8*, i8** %string.addr, align 4
  %111 = load i32, i32* %i, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %110, i32 %111
  %112 = load i8, i8* %arrayidx183, align 1
  %conv184 = sext i8 %112 to i32
  %tobool185 = icmp ne i32 %conv184, 0
  br i1 %tobool185, label %land.rhs186, label %land.end198

land.rhs186:                                      ; preds = %for.cond182
  %113 = load i8*, i8** %string.addr, align 4
  %114 = load i32, i32* %i, align 4
  %arrayidx187 = getelementptr inbounds i8, i8* %113, i32 %114
  %115 = load i8, i8* %arrayidx187, align 1
  %conv188 = sext i8 %115 to i32
  %cmp189 = icmp eq i32 %conv188, 32
  br i1 %cmp189, label %lor.end196, label %lor.rhs191

lor.rhs191:                                       ; preds = %land.rhs186
  %116 = load i8*, i8** %string.addr, align 4
  %117 = load i32, i32* %i, align 4
  %arrayidx192 = getelementptr inbounds i8, i8* %116, i32 %117
  %118 = load i8, i8* %arrayidx192, align 1
  %conv193 = sext i8 %118 to i32
  %cmp194 = icmp eq i32 %conv193, 9
  br label %lor.end196

lor.end196:                                       ; preds = %lor.rhs191, %land.rhs186
  %119 = phi i1 [ true, %land.rhs186 ], [ %cmp194, %lor.rhs191 ]
  br label %land.end198

land.end198:                                      ; preds = %lor.end196, %for.cond182
  %120 = phi i1 [ false, %for.cond182 ], [ %119, %lor.end196 ]
  br i1 %120, label %for.body200, label %for.end203

for.body200:                                      ; preds = %land.end198
  br label %for.inc201

for.inc201:                                       ; preds = %for.body200
  %121 = load i32, i32* %i, align 4
  %inc202 = add nsw i32 %121, 1
  store i32 %inc202, i32* %i, align 4
  br label %for.cond182

for.end203:                                       ; preds = %land.end198
  %122 = load i8*, i8** %string.addr, align 4
  %123 = load i32, i32* %i, align 4
  %arrayidx204 = getelementptr inbounds i8, i8* %122, i32 %123
  store i8* %arrayidx204, i8** %funname, align 4
  %124 = load i8*, i8** %funname, align 4
  %125 = load i8, i8* %124, align 1
  %conv205 = sext i8 %125 to i32
  %cmp206 = icmp eq i32 %conv205, 39
  br i1 %cmp206, label %if.then212, label %lor.lhs.false208

lor.lhs.false208:                                 ; preds = %for.end203
  %126 = load i8*, i8** %funname, align 4
  %127 = load i8, i8* %126, align 1
  %conv209 = sext i8 %127 to i32
  %cmp210 = icmp eq i32 %conv209, 34
  br i1 %cmp210, label %if.then212, label %if.end221

if.then212:                                       ; preds = %lor.lhs.false208, %for.end203
  %128 = load i8*, i8** %string.addr, align 4
  %129 = load i32, i32* %i, align 4
  %add213 = add nsw i32 %129, 1
  %130 = load i8*, i8** %funname, align 4
  %131 = load i8, i8* %130, align 1
  %conv214 = sext i8 %131 to i32
  %call215 = call i32 @_rl_skip_to_delim(i8* %128, i32 %add213, i32 %conv214)
  store i32 %call215, i32* %i, align 4
  %132 = load i8*, i8** %string.addr, align 4
  %133 = load i32, i32* %i, align 4
  %arrayidx216 = getelementptr inbounds i8, i8* %132, i32 %133
  %134 = load i8, i8* %arrayidx216, align 1
  %tobool217 = icmp ne i8 %134, 0
  br i1 %tobool217, label %if.then218, label %if.end220

if.then218:                                       ; preds = %if.then212
  %135 = load i32, i32* %i, align 4
  %inc219 = add nsw i32 %135, 1
  store i32 %inc219, i32* %i, align 4
  br label %if.end220

if.end220:                                        ; preds = %if.then218, %if.then212
  br label %if.end221

if.end221:                                        ; preds = %if.end220, %lor.lhs.false208
  br label %for.cond222

for.cond222:                                      ; preds = %for.inc243, %if.end221
  %136 = load i8*, i8** %string.addr, align 4
  %137 = load i32, i32* %i, align 4
  %arrayidx223 = getelementptr inbounds i8, i8* %136, i32 %137
  %138 = load i8, i8* %arrayidx223, align 1
  %conv224 = sext i8 %138 to i32
  %tobool225 = icmp ne i32 %conv224, 0
  br i1 %tobool225, label %land.rhs226, label %land.end240

land.rhs226:                                      ; preds = %for.cond222
  %139 = load i8*, i8** %string.addr, align 4
  %140 = load i32, i32* %i, align 4
  %arrayidx227 = getelementptr inbounds i8, i8* %139, i32 %140
  %141 = load i8, i8* %arrayidx227, align 1
  %conv228 = sext i8 %141 to i32
  %cmp229 = icmp eq i32 %conv228, 32
  br i1 %cmp229, label %lor.end236, label %lor.rhs231

lor.rhs231:                                       ; preds = %land.rhs226
  %142 = load i8*, i8** %string.addr, align 4
  %143 = load i32, i32* %i, align 4
  %arrayidx232 = getelementptr inbounds i8, i8* %142, i32 %143
  %144 = load i8, i8* %arrayidx232, align 1
  %conv233 = sext i8 %144 to i32
  %cmp234 = icmp eq i32 %conv233, 9
  br label %lor.end236

lor.end236:                                       ; preds = %lor.rhs231, %land.rhs226
  %145 = phi i1 [ true, %land.rhs226 ], [ %cmp234, %lor.rhs231 ]
  %lor.ext237 = zext i1 %145 to i32
  %cmp238 = icmp eq i32 %lor.ext237, 0
  br label %land.end240

land.end240:                                      ; preds = %lor.end236, %for.cond222
  %146 = phi i1 [ false, %for.cond222 ], [ %cmp238, %lor.end236 ]
  br i1 %146, label %for.body242, label %for.end245

for.body242:                                      ; preds = %land.end240
  br label %for.inc243

for.inc243:                                       ; preds = %for.body242
  %147 = load i32, i32* %i, align 4
  %inc244 = add nsw i32 %147, 1
  store i32 %inc244, i32* %i, align 4
  br label %for.cond222

for.end245:                                       ; preds = %land.end240
  %148 = load i8*, i8** %string.addr, align 4
  %149 = load i32, i32* %i, align 4
  %arrayidx246 = getelementptr inbounds i8, i8* %148, i32 %149
  store i8 0, i8* %arrayidx246, align 1
  %150 = load i32, i32* %equivalency, align 4
  %tobool247 = icmp ne i32 %150, 0
  br i1 %tobool247, label %if.then248, label %if.end249

if.then248:                                       ; preds = %for.end245
  store i32 0, i32* %retval, align 4
  br label %return

if.end249:                                        ; preds = %for.end245
  %151 = load i32, i32* %foundsep, align 4
  %cmp250 = icmp eq i32 %151, 0
  br i1 %cmp250, label %if.then252, label %if.end253

if.then252:                                       ; preds = %if.end249
  %152 = load i8*, i8** %string.addr, align 4
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.12, i32 0, i32 0), i8* %152)
  store i32 1, i32* %retval, align 4
  br label %return

if.end253:                                        ; preds = %if.end249
  %153 = load i8*, i8** %string.addr, align 4
  %154 = load i8, i8* %153, align 1
  %conv254 = sext i8 %154 to i32
  %cmp255 = icmp eq i32 %conv254, 34
  br i1 %cmp255, label %if.then257, label %if.end316

if.then257:                                       ; preds = %if.end253
  %155 = load i8*, i8** %string.addr, align 4
  %call258 = call i32 @strlen(i8* %155)
  %add259 = add i32 1, %call258
  %call260 = call i8* @xmalloc(i32 %add259)
  store i8* %call260, i8** %seq, align 4
  store i32 1, i32* %j, align 4
  store i32 0, i32* %passc, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond261

for.cond261:                                      ; preds = %for.inc286, %if.then257
  %156 = load i8*, i8** %string.addr, align 4
  %157 = load i32, i32* %j, align 4
  %arrayidx262 = getelementptr inbounds i8, i8* %156, i32 %157
  %158 = load i8, i8* %arrayidx262, align 1
  %tobool263 = icmp ne i8 %158, 0
  br i1 %tobool263, label %for.body264, label %for.end288

for.body264:                                      ; preds = %for.cond261
  %159 = load i32, i32* %passc, align 4
  %tobool265 = icmp ne i32 %159, 0
  br i1 %tobool265, label %if.then271, label %lor.lhs.false266

lor.lhs.false266:                                 ; preds = %for.body264
  %160 = load i8*, i8** %string.addr, align 4
  %161 = load i32, i32* %j, align 4
  %arrayidx267 = getelementptr inbounds i8, i8* %160, i32 %161
  %162 = load i8, i8* %arrayidx267, align 1
  %conv268 = sext i8 %162 to i32
  %cmp269 = icmp eq i32 %conv268, 92
  br i1 %cmp269, label %if.then271, label %if.end276

if.then271:                                       ; preds = %lor.lhs.false266, %for.body264
  %163 = load i8*, i8** %string.addr, align 4
  %164 = load i32, i32* %j, align 4
  %arrayidx272 = getelementptr inbounds i8, i8* %163, i32 %164
  %165 = load i8, i8* %arrayidx272, align 1
  %166 = load i8*, i8** %seq, align 4
  %167 = load i32, i32* %k, align 4
  %inc273 = add nsw i32 %167, 1
  store i32 %inc273, i32* %k, align 4
  %arrayidx274 = getelementptr inbounds i8, i8* %166, i32 %167
  store i8 %165, i8* %arrayidx274, align 1
  %168 = load i32, i32* %passc, align 4
  %tobool275 = icmp ne i32 %168, 0
  %lnot = xor i1 %tobool275, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %passc, align 4
  br label %for.inc286

if.end276:                                        ; preds = %lor.lhs.false266
  %169 = load i8*, i8** %string.addr, align 4
  %170 = load i32, i32* %j, align 4
  %arrayidx277 = getelementptr inbounds i8, i8* %169, i32 %170
  %171 = load i8, i8* %arrayidx277, align 1
  %conv278 = sext i8 %171 to i32
  %cmp279 = icmp eq i32 %conv278, 34
  br i1 %cmp279, label %if.then281, label %if.end282

if.then281:                                       ; preds = %if.end276
  br label %for.end288

if.end282:                                        ; preds = %if.end276
  %172 = load i8*, i8** %string.addr, align 4
  %173 = load i32, i32* %j, align 4
  %arrayidx283 = getelementptr inbounds i8, i8* %172, i32 %173
  %174 = load i8, i8* %arrayidx283, align 1
  %175 = load i8*, i8** %seq, align 4
  %176 = load i32, i32* %k, align 4
  %inc284 = add nsw i32 %176, 1
  store i32 %inc284, i32* %k, align 4
  %arrayidx285 = getelementptr inbounds i8, i8* %175, i32 %176
  store i8 %174, i8* %arrayidx285, align 1
  br label %for.inc286

for.inc286:                                       ; preds = %if.end282, %if.then271
  %177 = load i32, i32* %j, align 4
  %inc287 = add nsw i32 %177, 1
  store i32 %inc287, i32* %j, align 4
  br label %for.cond261

for.end288:                                       ; preds = %if.then281, %for.cond261
  %178 = load i8*, i8** %seq, align 4
  %179 = load i32, i32* %k, align 4
  %arrayidx289 = getelementptr inbounds i8, i8* %178, i32 %179
  store i8 0, i8* %arrayidx289, align 1
  %180 = load i8*, i8** %funname, align 4
  %181 = load i8, i8* %180, align 1
  %conv290 = sext i8 %181 to i32
  %cmp291 = icmp eq i32 %conv290, 39
  br i1 %cmp291, label %if.then297, label %lor.lhs.false293

lor.lhs.false293:                                 ; preds = %for.end288
  %182 = load i8*, i8** %funname, align 4
  %183 = load i8, i8* %182, align 1
  %conv294 = sext i8 %183 to i32
  %cmp295 = icmp eq i32 %conv294, 34
  br i1 %cmp295, label %if.then297, label %if.else312

if.then297:                                       ; preds = %lor.lhs.false293, %for.end288
  %184 = load i8*, i8** %funname, align 4
  %call298 = call i32 @strlen(i8* %184)
  store i32 %call298, i32* %j, align 4
  %185 = load i32, i32* %j, align 4
  %tobool299 = icmp ne i32 %185, 0
  br i1 %tobool299, label %land.lhs.true300, label %if.end309

land.lhs.true300:                                 ; preds = %if.then297
  %186 = load i8*, i8** %funname, align 4
  %187 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %187, 1
  %arrayidx301 = getelementptr inbounds i8, i8* %186, i32 %sub
  %188 = load i8, i8* %arrayidx301, align 1
  %conv302 = sext i8 %188 to i32
  %189 = load i8*, i8** %funname, align 4
  %190 = load i8, i8* %189, align 1
  %conv303 = sext i8 %190 to i32
  %cmp304 = icmp eq i32 %conv302, %conv303
  br i1 %cmp304, label %if.then306, label %if.end309

if.then306:                                       ; preds = %land.lhs.true300
  %191 = load i8*, i8** %funname, align 4
  %192 = load i32, i32* %j, align 4
  %sub307 = sub nsw i32 %192, 1
  %arrayidx308 = getelementptr inbounds i8, i8* %191, i32 %sub307
  store i8 0, i8* %arrayidx308, align 1
  br label %if.end309

if.end309:                                        ; preds = %if.then306, %land.lhs.true300, %if.then297
  %193 = load i8*, i8** %seq, align 4
  %194 = load i8*, i8** %funname, align 4
  %arrayidx310 = getelementptr inbounds i8, i8* %194, i32 1
  %195 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call311 = call i32 @rl_macro_bind(i8* %193, i8* %arrayidx310, %struct._keymap_entry* %195)
  br label %if.end315

if.else312:                                       ; preds = %lor.lhs.false293
  %196 = load i8*, i8** %seq, align 4
  %197 = load i8*, i8** %funname, align 4
  %call313 = call i32 (i32, i32)* @rl_named_function(i8* %197)
  %call314 = call i32 @rl_bind_keyseq(i8* %196, i32 (i32, i32)* %call313)
  br label %if.end315

if.end315:                                        ; preds = %if.else312, %if.end309
  %198 = load i8*, i8** %seq, align 4
  call void @xfree(i8* %198)
  store i32 0, i32* %retval, align 4
  br label %return

if.end316:                                        ; preds = %if.end253
  %199 = load i8*, i8** %string.addr, align 4
  %call317 = call i8* @strrchr(i8* %199, i32 45)
  store i8* %call317, i8** %kname, align 4
  %200 = load i8*, i8** %kname, align 4
  %cmp318 = icmp eq i8* %200, null
  br i1 %cmp318, label %if.then320, label %if.else321

if.then320:                                       ; preds = %if.end316
  %201 = load i8*, i8** %string.addr, align 4
  store i8* %201, i8** %kname, align 4
  br label %if.end323

if.else321:                                       ; preds = %if.end316
  %202 = load i8*, i8** %kname, align 4
  %incdec.ptr322 = getelementptr inbounds i8, i8* %202, i32 1
  store i8* %incdec.ptr322, i8** %kname, align 4
  br label %if.end323

if.end323:                                        ; preds = %if.else321, %if.then320
  %203 = load i8*, i8** %kname, align 4
  %call324 = call i32 @glean_key_from_name(i8* %203)
  store i32 %call324, i32* %key, align 4
  store i32 0, i32* %foundmod, align 4
  %204 = load i8*, i8** %string.addr, align 4
  %call325 = call i32 @substring_member_of_array(i8* %204, i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @_rl_possible_control_prefixes, i32 0, i32 0))
  %tobool326 = icmp ne i32 %call325, 0
  br i1 %tobool326, label %if.then327, label %if.end340

if.then327:                                       ; preds = %if.end323
  %205 = load i32, i32* %key, align 4
  %conv328 = trunc i32 %205 to i8
  %conv329 = zext i8 %conv328 to i32
  %206 = load i32, i32* %key, align 4
  %cmp330 = icmp eq i32 %conv329, %206
  br i1 %cmp330, label %land.lhs.true332, label %cond.false

land.lhs.true332:                                 ; preds = %if.then327
  %207 = load i32, i32* %key, align 4
  %conv333 = trunc i32 %207 to i8
  %conv334 = zext i8 %conv333 to i32
  %call335 = call i32 @islower(i32 %conv334) #5
  %tobool336 = icmp ne i32 %call335, 0
  br i1 %tobool336, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true332
  %208 = load i32, i32* %key, align 4
  %conv337 = trunc i32 %208 to i8
  %conv338 = zext i8 %conv337 to i32
  %call339 = call i32 @toupper(i32 %conv338) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true332, %if.then327
  %209 = load i32, i32* %key, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call339, %cond.true ], [ %209, %cond.false ]
  %and = and i32 %cond, 31
  store i32 %and, i32* %key, align 4
  store i32 1, i32* %foundmod, align 4
  br label %if.end340

if.end340:                                        ; preds = %cond.end, %if.end323
  %210 = load i8*, i8** %string.addr, align 4
  %call341 = call i32 @substring_member_of_array(i8* %210, i8** getelementptr inbounds ([3 x i8*], [3 x i8*]* @_rl_possible_meta_prefixes, i32 0, i32 0))
  %tobool342 = icmp ne i32 %call341, 0
  br i1 %tobool342, label %if.then343, label %if.end344

if.then343:                                       ; preds = %if.end340
  %211 = load i32, i32* %key, align 4
  %or = or i32 %211, 128
  store i32 %or, i32* %key, align 4
  store i32 1, i32* %foundmod, align 4
  br label %if.end344

if.end344:                                        ; preds = %if.then343, %if.end340
  %212 = load i32, i32* %foundmod, align 4
  %cmp345 = icmp eq i32 %212, 0
  br i1 %cmp345, label %land.lhs.true347, label %if.end351

land.lhs.true347:                                 ; preds = %if.end344
  %213 = load i8*, i8** %kname, align 4
  %214 = load i8*, i8** %string.addr, align 4
  %cmp348 = icmp ne i8* %213, %214
  br i1 %cmp348, label %if.then350, label %if.end351

if.then350:                                       ; preds = %land.lhs.true347
  %215 = load i8*, i8** %string.addr, align 4
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i32 0, i32 0), i8* %215)
  store i32 1, i32* %retval, align 4
  br label %return

if.end351:                                        ; preds = %land.lhs.true347, %if.end344
  %216 = load i8*, i8** %funname, align 4
  %217 = load i8, i8* %216, align 1
  %conv352 = sext i8 %217 to i32
  %cmp353 = icmp eq i32 %conv352, 39
  br i1 %cmp353, label %if.then359, label %lor.lhs.false355

lor.lhs.false355:                                 ; preds = %if.end351
  %218 = load i8*, i8** %funname, align 4
  %219 = load i8, i8* %218, align 1
  %conv356 = sext i8 %219 to i32
  %cmp357 = icmp eq i32 %conv356, 34
  br i1 %cmp357, label %if.then359, label %if.else378

if.then359:                                       ; preds = %lor.lhs.false355, %if.end351
  %220 = load i8*, i8** %funname, align 4
  %call360 = call i32 @strlen(i8* %220)
  store i32 %call360, i32* %fl, align 4
  %221 = load i32, i32* %key, align 4
  %conv361 = trunc i32 %221 to i8
  %arrayidx362 = getelementptr inbounds [2 x i8], [2 x i8]* %useq, i32 0, i32 0
  store i8 %conv361, i8* %arrayidx362, align 1
  %arrayidx363 = getelementptr inbounds [2 x i8], [2 x i8]* %useq, i32 0, i32 1
  store i8 0, i8* %arrayidx363, align 1
  %222 = load i32, i32* %fl, align 4
  %tobool364 = icmp ne i32 %222, 0
  br i1 %tobool364, label %land.lhs.true365, label %if.end375

land.lhs.true365:                                 ; preds = %if.then359
  %223 = load i8*, i8** %funname, align 4
  %224 = load i32, i32* %fl, align 4
  %sub366 = sub nsw i32 %224, 1
  %arrayidx367 = getelementptr inbounds i8, i8* %223, i32 %sub366
  %225 = load i8, i8* %arrayidx367, align 1
  %conv368 = sext i8 %225 to i32
  %226 = load i8*, i8** %funname, align 4
  %227 = load i8, i8* %226, align 1
  %conv369 = sext i8 %227 to i32
  %cmp370 = icmp eq i32 %conv368, %conv369
  br i1 %cmp370, label %if.then372, label %if.end375

if.then372:                                       ; preds = %land.lhs.true365
  %228 = load i8*, i8** %funname, align 4
  %229 = load i32, i32* %fl, align 4
  %sub373 = sub nsw i32 %229, 1
  %arrayidx374 = getelementptr inbounds i8, i8* %228, i32 %sub373
  store i8 0, i8* %arrayidx374, align 1
  br label %if.end375

if.end375:                                        ; preds = %if.then372, %land.lhs.true365, %if.then359
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %useq, i32 0, i32 0
  %230 = load i8*, i8** %funname, align 4
  %arrayidx376 = getelementptr inbounds i8, i8* %230, i32 1
  %231 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call377 = call i32 @rl_macro_bind(i8* %arraydecay, i8* %arrayidx376, %struct._keymap_entry* %231)
  br label %if.end393

if.else378:                                       ; preds = %lor.lhs.false355
  %232 = load i8*, i8** %funname, align 4
  %call379 = call i32 @strcasecmp(i8* %232, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i32 0, i32 0))
  %cmp380 = icmp eq i32 %call379, 0
  br i1 %cmp380, label %if.then382, label %if.else389

if.then382:                                       ; preds = %if.else378
  %233 = load i32, i32* %key, align 4
  %conv384 = trunc i32 %233 to i8
  %arrayidx385 = getelementptr inbounds [2 x i8], [2 x i8]* %seq383, i32 0, i32 0
  store i8 %conv384, i8* %arrayidx385, align 1
  %arrayidx386 = getelementptr inbounds [2 x i8], [2 x i8]* %seq383, i32 0, i32 1
  store i8 0, i8* %arrayidx386, align 1
  %arraydecay387 = getelementptr inbounds [2 x i8], [2 x i8]* %seq383, i32 0, i32 0
  %234 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call388 = call i32 @rl_generic_bind(i32 1, i8* %arraydecay387, i8* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_meta_keymap, i32 0, i32 0, i32 0), %struct._keymap_entry* %234)
  br label %if.end392

if.else389:                                       ; preds = %if.else378
  %235 = load i32, i32* %key, align 4
  %236 = load i8*, i8** %funname, align 4
  %call390 = call i32 (i32, i32)* @rl_named_function(i8* %236)
  %call391 = call i32 @rl_bind_key(i32 %235, i32 (i32, i32)* %call390)
  br label %if.end392

if.end392:                                        ; preds = %if.else389, %if.then382
  br label %if.end393

if.end393:                                        ; preds = %if.end392, %if.end375
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end393, %if.then350, %if.end315, %if.then252, %if.then248, %if.end179, %if.then31, %if.then20, %if.then17, %if.then
  %237 = load i32, i32* %retval, align 4
  ret i32 %237
}

; Function Attrs: noinline nounwind
define internal i32 @handle_parser_directive(i8* %statement) #0 {
entry:
  %retval = alloca i32, align 4
  %statement.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %directive = alloca i8*, align 4
  %args = alloca i8*, align 4
  store i8* %statement, i8** %statement.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8*, i8** %statement.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.cond
  %3 = load i8*, i8** %statement.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %5 to i32
  %cmp4 = icmp eq i32 %conv3, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.cond
  %6 = phi i1 [ true, %for.cond ], [ %cmp4, %lor.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %lor.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %lor.end
  %8 = load i8*, i8** %statement.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8* %arrayidx6, i8** %directive, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc21, %for.end
  %10 = load i8*, i8** %statement.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %12 to i32
  %tobool = icmp ne i32 %conv9, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond7
  %13 = load i8*, i8** %statement.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %15 to i32
  %cmp12 = icmp eq i32 %conv11, 32
  br i1 %cmp12, label %lor.end19, label %lor.rhs14

lor.rhs14:                                        ; preds = %land.rhs
  %16 = load i8*, i8** %statement.addr, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %18 to i32
  %cmp17 = icmp eq i32 %conv16, 9
  br label %lor.end19

lor.end19:                                        ; preds = %lor.rhs14, %land.rhs
  %19 = phi i1 [ true, %land.rhs ], [ %cmp17, %lor.rhs14 ]
  %lnot = xor i1 %19, true
  br label %land.end

land.end:                                         ; preds = %lor.end19, %for.cond7
  %20 = phi i1 [ false, %for.cond7 ], [ %lnot, %lor.end19 ]
  br i1 %20, label %for.body20, label %for.end23

for.body20:                                       ; preds = %land.end
  br label %for.inc21

for.inc21:                                        ; preds = %for.body20
  %21 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %21, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond7

for.end23:                                        ; preds = %land.end
  %22 = load i8*, i8** %statement.addr, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %22, i32 %23
  %24 = load i8, i8* %arrayidx24, align 1
  %tobool25 = icmp ne i8 %24, 0
  br i1 %tobool25, label %if.then, label %if.end

if.then:                                          ; preds = %for.end23
  %25 = load i8*, i8** %statement.addr, align 4
  %26 = load i32, i32* %i, align 4
  %inc26 = add nsw i32 %26, 1
  store i32 %inc26, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %25, i32 %26
  store i8 0, i8* %arrayidx27, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end23
  br label %for.cond28

for.cond28:                                       ; preds = %for.inc45, %if.end
  %27 = load i8*, i8** %statement.addr, align 4
  %28 = load i32, i32* %i, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %29 to i32
  %tobool31 = icmp ne i32 %conv30, 0
  br i1 %tobool31, label %land.rhs32, label %land.end43

land.rhs32:                                       ; preds = %for.cond28
  %30 = load i8*, i8** %statement.addr, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %32 to i32
  %cmp35 = icmp eq i32 %conv34, 32
  br i1 %cmp35, label %lor.end42, label %lor.rhs37

lor.rhs37:                                        ; preds = %land.rhs32
  %33 = load i8*, i8** %statement.addr, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %35 to i32
  %cmp40 = icmp eq i32 %conv39, 9
  br label %lor.end42

lor.end42:                                        ; preds = %lor.rhs37, %land.rhs32
  %36 = phi i1 [ true, %land.rhs32 ], [ %cmp40, %lor.rhs37 ]
  br label %land.end43

land.end43:                                       ; preds = %lor.end42, %for.cond28
  %37 = phi i1 [ false, %for.cond28 ], [ %36, %lor.end42 ]
  br i1 %37, label %for.body44, label %for.end47

for.body44:                                       ; preds = %land.end43
  br label %for.inc45

for.inc45:                                        ; preds = %for.body44
  %38 = load i32, i32* %i, align 4
  %inc46 = add nsw i32 %38, 1
  store i32 %inc46, i32* %i, align 4
  br label %for.cond28

for.end47:                                        ; preds = %land.end43
  %39 = load i8*, i8** %statement.addr, align 4
  %40 = load i32, i32* %i, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %39, i32 %40
  store i8* %arrayidx48, i8** %args, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc61, %for.end47
  %41 = load i32, i32* %i, align 4
  %arrayidx50 = getelementptr inbounds [5 x %struct.anon.2], [5 x %struct.anon.2]* @parser_directives, i32 0, i32 %41
  %name = getelementptr inbounds %struct.anon.2, %struct.anon.2* %arrayidx50, i32 0, i32 0
  %42 = load i8*, i8** %name, align 4
  %tobool51 = icmp ne i8* %42, null
  br i1 %tobool51, label %for.body52, label %for.end63

for.body52:                                       ; preds = %for.cond49
  %43 = load i8*, i8** %directive, align 4
  %44 = load i32, i32* %i, align 4
  %arrayidx53 = getelementptr inbounds [5 x %struct.anon.2], [5 x %struct.anon.2]* @parser_directives, i32 0, i32 %44
  %name54 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %arrayidx53, i32 0, i32 0
  %45 = load i8*, i8** %name54, align 4
  %call = call i32 @strcasecmp(i8* %43, i8* %45)
  %cmp55 = icmp eq i32 %call, 0
  br i1 %cmp55, label %if.then57, label %if.end60

if.then57:                                        ; preds = %for.body52
  %46 = load i32, i32* %i, align 4
  %arrayidx58 = getelementptr inbounds [5 x %struct.anon.2], [5 x %struct.anon.2]* @parser_directives, i32 0, i32 %46
  %function = getelementptr inbounds %struct.anon.2, %struct.anon.2* %arrayidx58, i32 0, i32 1
  %47 = load i32 (i8*)*, i32 (i8*)** %function, align 4
  %48 = load i8*, i8** %args, align 4
  %call59 = call i32 %47(i8* %48)
  store i32 0, i32* %retval, align 4
  br label %return

if.end60:                                         ; preds = %for.body52
  br label %for.inc61

for.inc61:                                        ; preds = %if.end60
  %49 = load i32, i32* %i, align 4
  %inc62 = add nsw i32 %49, 1
  store i32 %inc62, i32* %i, align 4
  br label %for.cond49

for.end63:                                        ; preds = %for.cond49
  %50 = load i8*, i8** %directive, align 4
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.38, i32 0, i32 0), i8* %50)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end63, %if.then57
  %51 = load i32, i32* %retval, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_skip_to_delim(i8* %string, i32 %start, i32 %delim) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %delim.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %passc = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %delim, i32* %delim.addr, align 4
  %0 = load i32, i32* %start.addr, align 4
  store i32 %0, i32* %i, align 4
  store i32 0, i32* %passc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  store i32 %conv, i32* %c, align 4
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %passc, align 4
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %if.then, label %if.end4

if.then:                                          ; preds = %for.body
  store i32 0, i32* %passc, align 4
  %5 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.inc

if.end4:                                          ; preds = %for.body
  %6 = load i32, i32* %c, align 4
  %cmp5 = icmp eq i32 %6, 92
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  store i32 1, i32* %passc, align 4
  br label %for.inc

if.end8:                                          ; preds = %if.end4
  %7 = load i32, i32* %c, align 4
  %8 = load i32, i32* %delim.addr, align 4
  %cmp9 = icmp eq i32 %7, %8
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  br label %for.end

if.end12:                                         ; preds = %if.end8
  br label %for.inc

for.inc:                                          ; preds = %if.end12, %if.then7, %if.end
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then11, %if.then3, %for.cond
  %10 = load i32, i32* %i, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal void @_rl_init_file_error(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0))
  %1 = load i32, i32* @currently_reading_init_file, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %3 = load i8*, i8** @current_readline_init_file, align 4
  %4 = load i32, i32* @current_readline_init_lineno, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.48, i32 0, i32 0), i8* %3, i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %6 = load i8*, i8** %format.addr, align 4
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call4 = call i32 @vfprintf(%struct._IO_FILE* %5, i8* %6, i32* %arraydecay3)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i32 0, i32 0))
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call6 = call i32 @fflush(%struct._IO_FILE* %8)
  %arraydecay7 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay78 = bitcast i32* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @find_boolean_var(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %3
  %name3 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx2, i32 0, i32 0
  %4 = load i8*, i8** %name3, align 4
  %call = call i32 @strcasecmp(i8* %2, i8* %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define internal i32 @find_string_var(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %3
  %name3 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx2, i32 0, i32 0
  %4 = load i8*, i8** %name3, align 4
  %call = call i32 @strcasecmp(i8* %2, i8* %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define i32 @rl_variable_bind(i8* %name, i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %v = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @find_boolean_var(i8* %0)
  store i32 %call, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %value.addr, align 4
  %call1 = call i32 @bool_to_int(i8* %2)
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %3
  %value2 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 1
  %4 = load i32*, i32** %value2, align 4
  store i32 %call1, i32* %4, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %5
  %flags = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx3, i32 0, i32 2
  %6 = load i32, i32* %flags, align 4
  %and = and i32 %6, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %7 = load i32, i32* %i, align 4
  call void @hack_special_boolean_var(i32 %7)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %entry
  %8 = load i8*, i8** %name.addr, align 4
  %call6 = call i32 @find_string_var(i8* %8)
  store i32 %call6, i32* %i, align 4
  %9 = load i32, i32* %i, align 4
  %cmp7 = icmp slt i32 %9, 0
  br i1 %cmp7, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %10 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %10
  %set_func = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx8, i32 0, i32 2
  %11 = load i32 (i8*)*, i32 (i8*)** %set_func, align 4
  %cmp9 = icmp eq i32 (i8*)* %11, null
  br i1 %cmp9, label %if.then10, label %if.end14

if.then10:                                        ; preds = %lor.lhs.false, %if.end5
  %12 = load i32, i32* %i, align 4
  %cmp11 = icmp slt i32 %12, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.then10
  %13 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.17, i32 0, i32 0), i8* %13)
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.then10
  store i32 0, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %lor.lhs.false
  %14 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %14
  %set_func16 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx15, i32 0, i32 2
  %15 = load i32 (i8*)*, i32 (i8*)** %set_func16, align 4
  %16 = load i8*, i8** %value.addr, align 4
  %call17 = call i32 %15(i8* %16)
  store i32 %call17, i32* %v, align 4
  %17 = load i32, i32* %v, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.end13, %if.end
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

declare i8* @strrchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @glean_key_from_name(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [12 x %struct.assoc_list], [12 x %struct.assoc_list]* @name_key_alist, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.assoc_list, %struct.assoc_list* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [12 x %struct.assoc_list], [12 x %struct.assoc_list]* @name_key_alist, i32 0, i32 %3
  %name3 = getelementptr inbounds %struct.assoc_list, %struct.assoc_list* %arrayidx2, i32 0, i32 0
  %4 = load i8*, i8** %name3, align 4
  %call = call i32 @strcasecmp(i8* %2, i8* %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [12 x %struct.assoc_list], [12 x %struct.assoc_list]* @name_key_alist, i32 0, i32 %5
  %value = getelementptr inbounds %struct.assoc_list, %struct.assoc_list* %arrayidx4, i32 0, i32 1
  %6 = load i32, i32* %value, align 4
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
  %8 = load i8*, i8** %name.addr, align 4
  %9 = load i8, i8* %8, align 1
  %conv = zext i8 %9 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal i32 @substring_member_of_array(i8* %string, i8** %array) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %array.addr = alloca i8**, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8** %array, i8*** %array.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i8**, i8*** %array.addr, align 4
  %1 = load i8*, i8** %0, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i8**, i8*** %array.addr, align 4
  %4 = load i8*, i8** %3, align 4
  %call = call i8* @_rl_strindex(i8* %2, i8* %4)
  %tobool1 = icmp ne i8* %call, null
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %5 = load i8**, i8*** %array.addr, align 4
  %incdec.ptr = getelementptr inbounds i8*, i8** %5, i32 1
  store i8** %incdec.ptr, i8*** %array.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i8* @rl_variable_value(i8* %name) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @find_boolean_var(i8* %0)
  store i32 %call, i32* %i, align 4
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %2
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 1
  %3 = load i32*, i32** %value, align 4
  %4 = load i32, i32* %3, align 4
  %tobool = icmp ne i32 %4, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)
  store i8* %cond, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i8*, i8** %name.addr, align 4
  %call1 = call i32 @find_string_var(i8* %5)
  store i32 %call1, i32* %i, align 4
  %6 = load i32, i32* %i, align 4
  %cmp2 = icmp sge i32 %6, 0
  br i1 %cmp2, label %if.then3, label %if.end7

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %7
  %name5 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx4, i32 0, i32 0
  %8 = load i8*, i8** %name5, align 4
  %call6 = call i8* @_rl_get_string_variable_value(i8* %8)
  store i8* %call6, i8** %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then3, %if.then
  %9 = load i8*, i8** %retval, align 4
  ret i8* %9
}

; Function Attrs: noinline nounwind
define internal i8* @_rl_get_string_variable_value(i8* %name) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strcasecmp(i8* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.82, i32 0, i32 0))
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_bell_preference, align 4
  switch i32 %1, label %sw.default [
    i32 0, label %sw.bb
    i32 2, label %sw.bb1
    i32 1, label %sw.bb2
  ]

sw.bb:                                            ; preds = %if.then
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0), i8** %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %if.then
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.96, i32 0, i32 0), i8** %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %if.then
  br label %sw.default

sw.default:                                       ; preds = %if.then, %sw.bb2
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.95, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call3 = call i32 @strcasecmp(i8* %2, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.83, i32 0, i32 0))
  %cmp4 = icmp eq i32 %call3, 0
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else
  %3 = load i8*, i8** @_rl_comment_begin, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then5
  %4 = load i8*, i8** @_rl_comment_begin, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.117, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

if.else6:                                         ; preds = %if.else
  %5 = load i8*, i8** %name.addr, align 4
  %call7 = call i32 @strcasecmp(i8* %5, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.84, i32 0, i32 0))
  %cmp8 = icmp eq i32 %call7, 0
  br i1 %cmp8, label %if.then9, label %if.else11

if.then9:                                         ; preds = %if.else6
  %6 = load i32, i32* @_rl_completion_columns, align 4
  %call10 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.118, i32 0, i32 0), i32 %6)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else11:                                        ; preds = %if.else6
  %7 = load i8*, i8** %name.addr, align 4
  %call12 = call i32 @strcasecmp(i8* %7, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.85, i32 0, i32 0))
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.else11
  %8 = load i32, i32* @_rl_completion_prefix_display_length, align 4
  %call15 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.118, i32 0, i32 0), i32 %8)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else16:                                        ; preds = %if.else11
  %9 = load i8*, i8** %name.addr, align 4
  %call17 = call i32 @strcasecmp(i8* %9, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.86, i32 0, i32 0))
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.else21

if.then19:                                        ; preds = %if.else16
  %10 = load i32, i32* @rl_completion_query_items, align 4
  %call20 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.118, i32 0, i32 0), i32 %10)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else21:                                        ; preds = %if.else16
  %11 = load i8*, i8** %name.addr, align 4
  %call22 = call i32 @strcasecmp(i8* %11, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.87, i32 0, i32 0))
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %if.then24, label %if.else26

if.then24:                                        ; preds = %if.else21
  %call25 = call i8* @rl_get_keymap_name_from_edit_mode()
  store i8* %call25, i8** %retval, align 4
  br label %return

if.else26:                                        ; preds = %if.else21
  %12 = load i8*, i8** %name.addr, align 4
  %call27 = call i32 @strcasecmp(i8* %12, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.89, i32 0, i32 0))
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.else37

if.then29:                                        ; preds = %if.else26
  %call30 = call i32 @history_is_stifled()
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %cond.true32, label %cond.false33

cond.true32:                                      ; preds = %if.then29
  %13 = load i32, i32* @history_max_entries, align 4
  br label %cond.end34

cond.false33:                                     ; preds = %if.then29
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false33, %cond.true32
  %cond35 = phi i32 [ %13, %cond.true32 ], [ 0, %cond.false33 ]
  %call36 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.118, i32 0, i32 0), i32 %cond35)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else37:                                        ; preds = %if.else26
  %14 = load i8*, i8** %name.addr, align 4
  %call38 = call i32 @strcasecmp(i8* %14, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.90, i32 0, i32 0))
  %cmp39 = icmp eq i32 %call38, 0
  br i1 %cmp39, label %if.then40, label %if.else49

if.then40:                                        ; preds = %if.else37
  %15 = load i8*, i8** @_rl_isearch_terminators, align 4
  %cmp41 = icmp eq i8* %15, null
  br i1 %cmp41, label %if.then42, label %if.end

if.then42:                                        ; preds = %if.then40
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then40
  %16 = load i8*, i8** @_rl_isearch_terminators, align 4
  %call43 = call i8* @_rl_untranslate_macro_value(i8* %16, i32 0)
  store i8* %call43, i8** %ret, align 4
  %17 = load i8*, i8** %ret, align 4
  %tobool44 = icmp ne i8* %17, null
  br i1 %tobool44, label %if.then45, label %if.else47

if.then45:                                        ; preds = %if.end
  %18 = load i8*, i8** %ret, align 4
  %call46 = call i8* @strncpy(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8* %18, i32 31)
  %19 = load i8*, i8** %ret, align 4
  call void @xfree(i8* %19)
  store i8 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 31), align 1
  br label %if.end48

if.else47:                                        ; preds = %if.end
  store i8 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), align 1
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.then45
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else49:                                        ; preds = %if.else37
  %20 = load i8*, i8** %name.addr, align 4
  %call50 = call i32 @strcasecmp(i8* %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.91, i32 0, i32 0))
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %if.then52, label %if.else63

if.then52:                                        ; preds = %if.else49
  %21 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call53 = call i8* @rl_get_keymap_name(%struct._keymap_entry* %21)
  store i8* %call53, i8** %ret, align 4
  %22 = load i8*, i8** %ret, align 4
  %cmp54 = icmp eq i8* %22, null
  br i1 %cmp54, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.then52
  %call56 = call i8* @rl_get_keymap_name_from_edit_mode()
  store i8* %call56, i8** %ret, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.then52
  %23 = load i8*, i8** %ret, align 4
  %tobool58 = icmp ne i8* %23, null
  br i1 %tobool58, label %cond.true59, label %cond.false60

cond.true59:                                      ; preds = %if.end57
  %24 = load i8*, i8** %ret, align 4
  br label %cond.end61

cond.false60:                                     ; preds = %if.end57
  br label %cond.end61

cond.end61:                                       ; preds = %cond.false60, %cond.true59
  %cond62 = phi i8* [ %24, %cond.true59 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0), %cond.false60 ]
  store i8* %cond62, i8** %retval, align 4
  br label %return

if.else63:                                        ; preds = %if.else49
  %25 = load i8*, i8** %name.addr, align 4
  %call64 = call i32 @strcasecmp(i8* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.92, i32 0, i32 0))
  %cmp65 = icmp eq i32 %call64, 0
  br i1 %cmp65, label %if.then66, label %if.else68

if.then66:                                        ; preds = %if.else63
  %26 = load i32, i32* @_rl_keyseq_timeout, align 4
  %call67 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.118, i32 0, i32 0), i32 %26)
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @_rl_get_string_variable_value.numbuf, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else68:                                        ; preds = %if.else63
  %27 = load i8*, i8** %name.addr, align 4
  %call69 = call i32 @strcasecmp(i8* %27, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.88, i32 0, i32 0))
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %if.then71, label %if.else77

if.then71:                                        ; preds = %if.else68
  %28 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %tobool72 = icmp ne i8* %28, null
  br i1 %tobool72, label %cond.true73, label %cond.false74

cond.true73:                                      ; preds = %if.then71
  %29 = load i8*, i8** @_rl_emacs_mode_str, align 4
  br label %cond.end75

cond.false74:                                     ; preds = %if.then71
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false74, %cond.true73
  %cond76 = phi i8* [ %29, %cond.true73 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.119, i32 0, i32 0), %cond.false74 ]
  store i8* %cond76, i8** %retval, align 4
  br label %return

if.else77:                                        ; preds = %if.else68
  %30 = load i8*, i8** %name.addr, align 4
  %call78 = call i32 @strcasecmp(i8* %30, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.93, i32 0, i32 0))
  %cmp79 = icmp eq i32 %call78, 0
  br i1 %cmp79, label %if.then80, label %if.else86

if.then80:                                        ; preds = %if.else77
  %31 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %tobool81 = icmp ne i8* %31, null
  br i1 %tobool81, label %cond.true82, label %cond.false83

cond.true82:                                      ; preds = %if.then80
  %32 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  br label %cond.end84

cond.false83:                                     ; preds = %if.then80
  br label %cond.end84

cond.end84:                                       ; preds = %cond.false83, %cond.true82
  %cond85 = phi i8* [ %32, %cond.true82 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.120, i32 0, i32 0), %cond.false83 ]
  store i8* %cond85, i8** %retval, align 4
  br label %return

if.else86:                                        ; preds = %if.else77
  %33 = load i8*, i8** %name.addr, align 4
  %call87 = call i32 @strcasecmp(i8* %33, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.94, i32 0, i32 0))
  %cmp88 = icmp eq i32 %call87, 0
  br i1 %cmp88, label %if.then89, label %if.else95

if.then89:                                        ; preds = %if.else86
  %34 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %tobool90 = icmp ne i8* %34, null
  br i1 %tobool90, label %cond.true91, label %cond.false92

cond.true91:                                      ; preds = %if.then89
  %35 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  br label %cond.end93

cond.false92:                                     ; preds = %if.then89
  br label %cond.end93

cond.end93:                                       ; preds = %cond.false92, %cond.true91
  %cond94 = phi i8* [ %35, %cond.true91 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.121, i32 0, i32 0), %cond.false92 ]
  store i8* %cond94, i8** %retval, align 4
  br label %return

if.else95:                                        ; preds = %if.else86
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else95, %cond.end93, %cond.end84, %cond.end75, %if.then66, %cond.end61, %if.end48, %if.then42, %cond.end34, %if.then24, %if.then19, %if.then14, %if.then9, %cond.end, %sw.default, %sw.bb1, %sw.bb
  %36 = load i8*, i8** %retval, align 4
  ret i8* %36
}

; Function Attrs: noinline nounwind
define internal i32 @bool_to_int(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %lor.end, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strcasecmp(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0))
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false3
  %4 = load i8*, i8** %value.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv6 = sext i8 %5 to i32
  %cmp7 = icmp eq i32 %conv6, 49
  br i1 %cmp7, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %6 = load i8*, i8** %value.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %7 to i32
  %cmp11 = icmp eq i32 %conv10, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %8 = phi i1 [ false, %lor.rhs ], [ %cmp11, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %lor.lhs.false3, %lor.lhs.false, %entry
  %9 = phi i1 [ true, %lor.lhs.false3 ], [ true, %lor.lhs.false ], [ true, %entry ], [ %8, %land.end ]
  %lor.ext = zext i1 %9 to i32
  ret i32 %lor.ext
}

; Function Attrs: noinline nounwind
define internal void @hack_special_boolean_var(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %name = alloca i8*, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  store i8* %1, i8** %name, align 4
  %2 = load i8*, i8** %name, align 4
  %call = call i32 @strcasecmp(i8* %2, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.50, i32 0, i32 0))
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @rl_blink_matching_paren, align 4
  call void @_rl_enable_paren_matching(i32 %3)
  br label %if.end13

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %name, align 4
  %call2 = call i32 @strcasecmp(i8* %4, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.74, i32 0, i32 0))
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %if.then4, label %if.else7

if.then4:                                         ; preds = %if.else
  %5 = load i32, i32* @_rl_prefer_visible_bell, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.then4
  store i32 2, i32* @_rl_bell_preference, align 4
  br label %if.end

if.else6:                                         ; preds = %if.then4
  store i32 1, i32* @_rl_bell_preference, align 4
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then5
  br label %if.end12

if.else7:                                         ; preds = %if.else
  %6 = load i8*, i8** %name, align 4
  %call8 = call i32 @strcasecmp(i8* %6, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.79, i32 0, i32 0))
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.else7
  call void @_rl_reset_prompt()
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.else7
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define %struct._keymap_entry* @rl_get_keymap_by_name(i8* %name) #0 {
entry:
  %retval = alloca %struct._keymap_entry*, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [9 x %struct.anon.1], [9 x %struct.anon.1]* @keymap_names, i32 0, i32 %0
  %name1 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name1, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %name.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [9 x %struct.anon.1], [9 x %struct.anon.1]* @keymap_names, i32 0, i32 %3
  %name3 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %arrayidx2, i32 0, i32 0
  %4 = load i8*, i8** %name3, align 4
  %call = call i32 @strcasecmp(i8* %2, i8* %4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [9 x %struct.anon.1], [9 x %struct.anon.1]* @keymap_names, i32 0, i32 %5
  %map = getelementptr inbounds %struct.anon.1, %struct.anon.1* %arrayidx4, i32 0, i32 1
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** %map, align 4
  store %struct._keymap_entry* %6, %struct._keymap_entry** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct._keymap_entry* null, %struct._keymap_entry** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %retval, align 4
  ret %struct._keymap_entry* %8
}

; Function Attrs: noinline nounwind
define i8* @rl_get_keymap_name(%struct._keymap_entry* %map) #0 {
entry:
  %retval = alloca i8*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %i = alloca i32, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [9 x %struct.anon.1], [9 x %struct.anon.1]* @keymap_names, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon.1, %struct.anon.1* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [9 x %struct.anon.1], [9 x %struct.anon.1]* @keymap_names, i32 0, i32 %3
  %map2 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %arrayidx1, i32 0, i32 1
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %map2, align 4
  %cmp = icmp eq %struct._keymap_entry* %2, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [9 x %struct.anon.1], [9 x %struct.anon.1]* @keymap_names, i32 0, i32 %5
  %name4 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %arrayidx3, i32 0, i32 0
  %6 = load i8*, i8** %name4, align 4
  store i8* %6, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i8*, i8** %retval, align 4
  ret i8* %8
}

; Function Attrs: noinline nounwind
define void @rl_set_keymap(%struct._keymap_entry* %map) #0 {
entry:
  %map.addr = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %tobool = icmp ne %struct._keymap_entry* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** @_rl_keymap, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define %struct._keymap_entry* @rl_get_keymap() #0 {
entry:
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  ret %struct._keymap_entry* %0
}

; Function Attrs: noinline nounwind
define i8* @rl_get_keymap_name_from_edit_mode() #0 {
entry:
  %retval = alloca i8*, align 4
  %0 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @rl_editing_mode, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else3:                                         ; preds = %if.else
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0), i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %2 = load i8*, i8** %retval, align 4
  ret i8* %2
}

; Function Attrs: noinline nounwind
define void @rl_list_funmap_names() #0 {
entry:
  %i = alloca i32, align 4
  %funmap_names = alloca i8**, align 4
  %call = call i8** @rl_funmap_names()
  store i8** %call, i8*** %funmap_names, align 4
  %0 = load i8**, i8*** %funmap_names, align 4
  %tobool = icmp ne i8** %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8**, i8*** %funmap_names, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool1 = icmp ne i8* %3, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %5 = load i8**, i8*** %funmap_names, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx2, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.21, i32 0, i32 0), i8* %7)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i8**, i8*** %funmap_names, align 4
  %10 = bitcast i8** %9 to i8*
  call void @xfree(i8* %10)
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

declare i8** @rl_funmap_names() #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define i8** @rl_invoking_keyseqs_in_map(i32 (i32, i32)* %function, %struct._keymap_entry* %map) #0 {
entry:
  %function.addr = alloca i32 (i32, i32)*, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %key = alloca i32, align 4
  %result = alloca i8**, align 4
  %result_index = alloca i32, align 4
  %result_size = alloca i32, align 4
  %keyname = alloca i8*, align 4
  %seqs = alloca i8**, align 4
  %i = alloca i32, align 4
  %keyname29 = alloca i8*, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i8** null, i8*** %result, align 4
  store i32 0, i32* %result_size, align 4
  store i32 0, i32* %result_index, align 4
  store i32 0, i32* %key, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc210, %entry
  %0 = load i32, i32* %key, align 4
  %cmp = icmp slt i32 %0, 257
  br i1 %cmp, label %for.body, label %for.end212

for.body:                                         ; preds = %for.cond
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %2 = load i32, i32* %key, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %1, i32 %2
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %3 = load i8, i8* %type, align 4
  %conv = sext i8 %3 to i32
  switch i32 %conv, label %sw.epilog [
    i32 2, label %sw.bb
    i32 0, label %sw.bb
    i32 1, label %sw.bb13
  ]

sw.bb:                                            ; preds = %for.body, %for.body
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %5 = load i32, i32* %key, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 %5
  %function2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 1
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %function2, align 4
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %cmp3 = icmp eq i32 (i32, i32)* %6, %7
  br i1 %cmp3, label %if.then, label %if.end12

if.then:                                          ; preds = %sw.bb
  %8 = load i32, i32* %key, align 4
  %call = call i8* @_rl_get_keyname(i32 %8)
  store i8* %call, i8** %keyname, align 4
  %9 = load i32, i32* %result_index, align 4
  %add = add nsw i32 %9, 2
  %10 = load i32, i32* %result_size, align 4
  %cmp5 = icmp sgt i32 %add, %10
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %11 = load i32, i32* %result_size, align 4
  %add8 = add nsw i32 %11, 10
  store i32 %add8, i32* %result_size, align 4
  %12 = load i8**, i8*** %result, align 4
  %13 = bitcast i8** %12 to i8*
  %14 = load i32, i32* %result_size, align 4
  %mul = mul i32 %14, 4
  %call9 = call i8* @xrealloc(i8* %13, i32 %mul)
  %15 = bitcast i8* %call9 to i8**
  store i8** %15, i8*** %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  %16 = load i8*, i8** %keyname, align 4
  %17 = load i8**, i8*** %result, align 4
  %18 = load i32, i32* %result_index, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %result_index, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %17, i32 %18
  store i8* %16, i8** %arrayidx10, align 4
  %19 = load i8**, i8*** %result, align 4
  %20 = load i32, i32* %result_index, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %19, i32 %20
  store i8* null, i8** %arrayidx11, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.end, %sw.bb
  br label %sw.epilog

sw.bb13:                                          ; preds = %for.body
  %21 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %22 = load i32, i32* %key, align 4
  %arrayidx14 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %21, i32 %22
  %function15 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx14, i32 0, i32 1
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %function15, align 4
  %tobool = icmp ne i32 (i32, i32)* %23, null
  br i1 %tobool, label %if.then16, label %if.else

if.then16:                                        ; preds = %sw.bb13
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %25 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %26 = load i32, i32* %key, align 4
  %arrayidx17 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %25, i32 %26
  %function18 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx17, i32 0, i32 1
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %function18, align 4
  %28 = bitcast i32 (i32, i32)* %27 to %struct._keymap_entry*
  %call19 = call i8** @rl_invoking_keyseqs_in_map(i32 (i32, i32)* %24, %struct._keymap_entry* %28)
  store i8** %call19, i8*** %seqs, align 4
  br label %if.end20

if.else:                                          ; preds = %sw.bb13
  br label %sw.epilog

if.end20:                                         ; preds = %if.then16
  %29 = load i8**, i8*** %seqs, align 4
  %cmp21 = icmp eq i8** %29, null
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  br label %sw.epilog

if.end24:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc, %if.end24
  %30 = load i8**, i8*** %seqs, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx26, align 4
  %tobool27 = icmp ne i8* %32, null
  br i1 %tobool27, label %for.body28, label %for.end

for.body28:                                       ; preds = %for.cond25
  %33 = load i8**, i8*** %seqs, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx30, align 4
  %call31 = call i32 @strlen(i8* %35)
  %add32 = add i32 6, %call31
  %call33 = call i8* @xmalloc(i32 %add32)
  store i8* %call33, i8** %keyname29, align 4
  %36 = load i32, i32* %key, align 4
  %cmp34 = icmp eq i32 %36, 27
  br i1 %cmp34, label %if.then36, label %if.else48

if.then36:                                        ; preds = %for.body28
  %37 = load i32, i32* @_rl_convert_meta_chars_to_ascii, align 4
  %tobool37 = icmp ne i32 %37, 0
  br i1 %tobool37, label %land.lhs.true, label %if.else45

land.lhs.true:                                    ; preds = %if.then36
  %38 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx38 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %38, i32 27
  %type39 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx38, i32 0, i32 0
  %39 = load i8, i8* %type39, align 4
  %conv40 = sext i8 %39 to i32
  %cmp41 = icmp eq i32 %conv40, 1
  br i1 %cmp41, label %if.then43, label %if.else45

if.then43:                                        ; preds = %land.lhs.true
  %40 = load i8*, i8** %keyname29, align 4
  %call44 = call i32 (i8*, i8*, ...) @sprintf(i8* %40, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0))
  br label %if.end47

if.else45:                                        ; preds = %land.lhs.true, %if.then36
  %41 = load i8*, i8** %keyname29, align 4
  %call46 = call i32 (i8*, i8*, ...) @sprintf(i8* %41, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0))
  br label %if.end47

if.end47:                                         ; preds = %if.else45, %if.then43
  br label %if.end194

if.else48:                                        ; preds = %for.body28
  %42 = load i32, i32* %key, align 4
  %cmp49 = icmp slt i32 %42, 32
  br i1 %cmp49, label %land.lhs.true51, label %if.else172

land.lhs.true51:                                  ; preds = %if.else48
  %43 = load i32, i32* %key, align 4
  %and = and i32 %43, 128
  %cmp52 = icmp eq i32 %and, 0
  br i1 %cmp52, label %if.then54, label %if.else172

if.then54:                                        ; preds = %land.lhs.true51
  %44 = load i8*, i8** %keyname29, align 4
  %45 = load i32, i32* %key, align 4
  %or = or i32 %45, 64
  %conv55 = trunc i32 %or to i8
  %conv56 = zext i8 %conv55 to i32
  %46 = load i32, i32* %key, align 4
  %or57 = or i32 %46, 64
  %cmp58 = icmp eq i32 %conv56, %or57
  br i1 %cmp58, label %land.lhs.true60, label %cond.false

land.lhs.true60:                                  ; preds = %if.then54
  %47 = load i32, i32* %key, align 4
  %or61 = or i32 %47, 64
  %conv62 = trunc i32 %or61 to i8
  %conv63 = zext i8 %conv62 to i32
  %call64 = call i32 @islower(i32 %conv63) #5
  %tobool65 = icmp ne i32 %call64, 0
  br i1 %tobool65, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true60
  %48 = load i32, i32* %key, align 4
  %or66 = or i32 %48, 64
  %conv67 = trunc i32 %or66 to i8
  %conv68 = zext i8 %conv67 to i32
  %call69 = call i32 @toupper(i32 %conv68) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true60, %if.then54
  %49 = load i32, i32* %key, align 4
  %or70 = or i32 %49, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call69, %cond.true ], [ %or70, %cond.false ]
  %conv71 = trunc i32 %cond to i8
  %conv72 = zext i8 %conv71 to i32
  %50 = load i32, i32* %key, align 4
  %or73 = or i32 %50, 64
  %conv74 = trunc i32 %or73 to i8
  %conv75 = zext i8 %conv74 to i32
  %51 = load i32, i32* %key, align 4
  %or76 = or i32 %51, 64
  %cmp77 = icmp eq i32 %conv75, %or76
  br i1 %cmp77, label %land.lhs.true79, label %cond.false90

land.lhs.true79:                                  ; preds = %cond.end
  %52 = load i32, i32* %key, align 4
  %or80 = or i32 %52, 64
  %conv81 = trunc i32 %or80 to i8
  %conv82 = zext i8 %conv81 to i32
  %call83 = call i32 @islower(i32 %conv82) #5
  %tobool84 = icmp ne i32 %call83, 0
  br i1 %tobool84, label %cond.true85, label %cond.false90

cond.true85:                                      ; preds = %land.lhs.true79
  %53 = load i32, i32* %key, align 4
  %or86 = or i32 %53, 64
  %conv87 = trunc i32 %or86 to i8
  %conv88 = zext i8 %conv87 to i32
  %call89 = call i32 @toupper(i32 %conv88) #5
  br label %cond.end92

cond.false90:                                     ; preds = %land.lhs.true79, %cond.end
  %54 = load i32, i32* %key, align 4
  %or91 = or i32 %54, 64
  br label %cond.end92

cond.end92:                                       ; preds = %cond.false90, %cond.true85
  %cond93 = phi i32 [ %call89, %cond.true85 ], [ %or91, %cond.false90 ]
  %cmp94 = icmp eq i32 %conv72, %cond93
  br i1 %cmp94, label %land.lhs.true96, label %cond.false147

land.lhs.true96:                                  ; preds = %cond.end92
  %55 = load i32, i32* %key, align 4
  %or97 = or i32 %55, 64
  %conv98 = trunc i32 %or97 to i8
  %conv99 = zext i8 %conv98 to i32
  %56 = load i32, i32* %key, align 4
  %or100 = or i32 %56, 64
  %cmp101 = icmp eq i32 %conv99, %or100
  br i1 %cmp101, label %land.lhs.true103, label %cond.false114

land.lhs.true103:                                 ; preds = %land.lhs.true96
  %57 = load i32, i32* %key, align 4
  %or104 = or i32 %57, 64
  %conv105 = trunc i32 %or104 to i8
  %conv106 = zext i8 %conv105 to i32
  %call107 = call i32 @islower(i32 %conv106) #5
  %tobool108 = icmp ne i32 %call107, 0
  br i1 %tobool108, label %cond.true109, label %cond.false114

cond.true109:                                     ; preds = %land.lhs.true103
  %58 = load i32, i32* %key, align 4
  %or110 = or i32 %58, 64
  %conv111 = trunc i32 %or110 to i8
  %conv112 = zext i8 %conv111 to i32
  %call113 = call i32 @toupper(i32 %conv112) #5
  br label %cond.end116

cond.false114:                                    ; preds = %land.lhs.true103, %land.lhs.true96
  %59 = load i32, i32* %key, align 4
  %or115 = or i32 %59, 64
  br label %cond.end116

cond.end116:                                      ; preds = %cond.false114, %cond.true109
  %cond117 = phi i32 [ %call113, %cond.true109 ], [ %or115, %cond.false114 ]
  %conv118 = trunc i32 %cond117 to i8
  %conv119 = zext i8 %conv118 to i32
  %call120 = call i32 @isupper(i32 %conv119) #5
  %tobool121 = icmp ne i32 %call120, 0
  br i1 %tobool121, label %cond.true122, label %cond.false147

cond.true122:                                     ; preds = %cond.end116
  %60 = load i32, i32* %key, align 4
  %or123 = or i32 %60, 64
  %conv124 = trunc i32 %or123 to i8
  %conv125 = zext i8 %conv124 to i32
  %61 = load i32, i32* %key, align 4
  %or126 = or i32 %61, 64
  %cmp127 = icmp eq i32 %conv125, %or126
  br i1 %cmp127, label %land.lhs.true129, label %cond.false140

land.lhs.true129:                                 ; preds = %cond.true122
  %62 = load i32, i32* %key, align 4
  %or130 = or i32 %62, 64
  %conv131 = trunc i32 %or130 to i8
  %conv132 = zext i8 %conv131 to i32
  %call133 = call i32 @islower(i32 %conv132) #5
  %tobool134 = icmp ne i32 %call133, 0
  br i1 %tobool134, label %cond.true135, label %cond.false140

cond.true135:                                     ; preds = %land.lhs.true129
  %63 = load i32, i32* %key, align 4
  %or136 = or i32 %63, 64
  %conv137 = trunc i32 %or136 to i8
  %conv138 = zext i8 %conv137 to i32
  %call139 = call i32 @toupper(i32 %conv138) #5
  br label %cond.end142

cond.false140:                                    ; preds = %land.lhs.true129, %cond.true122
  %64 = load i32, i32* %key, align 4
  %or141 = or i32 %64, 64
  br label %cond.end142

cond.end142:                                      ; preds = %cond.false140, %cond.true135
  %cond143 = phi i32 [ %call139, %cond.true135 ], [ %or141, %cond.false140 ]
  %conv144 = trunc i32 %cond143 to i8
  %conv145 = zext i8 %conv144 to i32
  %call146 = call i32 @tolower(i32 %conv145) #5
  br label %cond.end169

cond.false147:                                    ; preds = %cond.end116, %cond.end92
  %65 = load i32, i32* %key, align 4
  %or148 = or i32 %65, 64
  %conv149 = trunc i32 %or148 to i8
  %conv150 = zext i8 %conv149 to i32
  %66 = load i32, i32* %key, align 4
  %or151 = or i32 %66, 64
  %cmp152 = icmp eq i32 %conv150, %or151
  br i1 %cmp152, label %land.lhs.true154, label %cond.false165

land.lhs.true154:                                 ; preds = %cond.false147
  %67 = load i32, i32* %key, align 4
  %or155 = or i32 %67, 64
  %conv156 = trunc i32 %or155 to i8
  %conv157 = zext i8 %conv156 to i32
  %call158 = call i32 @islower(i32 %conv157) #5
  %tobool159 = icmp ne i32 %call158, 0
  br i1 %tobool159, label %cond.true160, label %cond.false165

cond.true160:                                     ; preds = %land.lhs.true154
  %68 = load i32, i32* %key, align 4
  %or161 = or i32 %68, 64
  %conv162 = trunc i32 %or161 to i8
  %conv163 = zext i8 %conv162 to i32
  %call164 = call i32 @toupper(i32 %conv163) #5
  br label %cond.end167

cond.false165:                                    ; preds = %land.lhs.true154, %cond.false147
  %69 = load i32, i32* %key, align 4
  %or166 = or i32 %69, 64
  br label %cond.end167

cond.end167:                                      ; preds = %cond.false165, %cond.true160
  %cond168 = phi i32 [ %call164, %cond.true160 ], [ %or166, %cond.false165 ]
  br label %cond.end169

cond.end169:                                      ; preds = %cond.end167, %cond.end142
  %cond170 = phi i32 [ %call146, %cond.end142 ], [ %cond168, %cond.end167 ]
  %call171 = call i32 (i8*, i8*, ...) @sprintf(i8* %44, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.24, i32 0, i32 0), i32 %cond170)
  br label %if.end193

if.else172:                                       ; preds = %land.lhs.true51, %if.else48
  %70 = load i32, i32* %key, align 4
  %cmp173 = icmp eq i32 %70, 127
  br i1 %cmp173, label %if.then175, label %if.else177

if.then175:                                       ; preds = %if.else172
  %71 = load i8*, i8** %keyname29, align 4
  %call176 = call i32 (i8*, i8*, ...) @sprintf(i8* %71, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0))
  br label %if.end192

if.else177:                                       ; preds = %if.else172
  %72 = load i32, i32* %key, align 4
  %cmp178 = icmp eq i32 %72, 92
  br i1 %cmp178, label %if.then182, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else177
  %73 = load i32, i32* %key, align 4
  %cmp180 = icmp eq i32 %73, 34
  br i1 %cmp180, label %if.then182, label %if.else187

if.then182:                                       ; preds = %lor.lhs.false, %if.else177
  %74 = load i8*, i8** %keyname29, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %74, i32 0
  store i8 92, i8* %arrayidx183, align 1
  %75 = load i32, i32* %key, align 4
  %conv184 = trunc i32 %75 to i8
  %76 = load i8*, i8** %keyname29, align 4
  %arrayidx185 = getelementptr inbounds i8, i8* %76, i32 1
  store i8 %conv184, i8* %arrayidx185, align 1
  %77 = load i8*, i8** %keyname29, align 4
  %arrayidx186 = getelementptr inbounds i8, i8* %77, i32 2
  store i8 0, i8* %arrayidx186, align 1
  br label %if.end191

if.else187:                                       ; preds = %lor.lhs.false
  %78 = load i32, i32* %key, align 4
  %conv188 = trunc i32 %78 to i8
  %79 = load i8*, i8** %keyname29, align 4
  %arrayidx189 = getelementptr inbounds i8, i8* %79, i32 0
  store i8 %conv188, i8* %arrayidx189, align 1
  %80 = load i8*, i8** %keyname29, align 4
  %arrayidx190 = getelementptr inbounds i8, i8* %80, i32 1
  store i8 0, i8* %arrayidx190, align 1
  br label %if.end191

if.end191:                                        ; preds = %if.else187, %if.then182
  br label %if.end192

if.end192:                                        ; preds = %if.end191, %if.then175
  br label %if.end193

if.end193:                                        ; preds = %if.end192, %cond.end169
  br label %if.end194

if.end194:                                        ; preds = %if.end193, %if.end47
  %81 = load i8*, i8** %keyname29, align 4
  %82 = load i8**, i8*** %seqs, align 4
  %83 = load i32, i32* %i, align 4
  %arrayidx195 = getelementptr inbounds i8*, i8** %82, i32 %83
  %84 = load i8*, i8** %arrayidx195, align 4
  %call196 = call i8* @strcat(i8* %81, i8* %84)
  %85 = load i8**, i8*** %seqs, align 4
  %86 = load i32, i32* %i, align 4
  %arrayidx197 = getelementptr inbounds i8*, i8** %85, i32 %86
  %87 = load i8*, i8** %arrayidx197, align 4
  call void @xfree(i8* %87)
  %88 = load i32, i32* %result_index, align 4
  %add198 = add nsw i32 %88, 2
  %89 = load i32, i32* %result_size, align 4
  %cmp199 = icmp sgt i32 %add198, %89
  br i1 %cmp199, label %if.then201, label %if.end205

if.then201:                                       ; preds = %if.end194
  %90 = load i32, i32* %result_size, align 4
  %add202 = add nsw i32 %90, 10
  store i32 %add202, i32* %result_size, align 4
  %91 = load i8**, i8*** %result, align 4
  %92 = bitcast i8** %91 to i8*
  %93 = load i32, i32* %result_size, align 4
  %mul203 = mul i32 %93, 4
  %call204 = call i8* @xrealloc(i8* %92, i32 %mul203)
  %94 = bitcast i8* %call204 to i8**
  store i8** %94, i8*** %result, align 4
  br label %if.end205

if.end205:                                        ; preds = %if.then201, %if.end194
  %95 = load i8*, i8** %keyname29, align 4
  %96 = load i8**, i8*** %result, align 4
  %97 = load i32, i32* %result_index, align 4
  %inc206 = add nsw i32 %97, 1
  store i32 %inc206, i32* %result_index, align 4
  %arrayidx207 = getelementptr inbounds i8*, i8** %96, i32 %97
  store i8* %95, i8** %arrayidx207, align 4
  %98 = load i8**, i8*** %result, align 4
  %99 = load i32, i32* %result_index, align 4
  %arrayidx208 = getelementptr inbounds i8*, i8** %98, i32 %99
  store i8* null, i8** %arrayidx208, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end205
  %100 = load i32, i32* %i, align 4
  %inc209 = add nsw i32 %100, 1
  store i32 %inc209, i32* %i, align 4
  br label %for.cond25

for.end:                                          ; preds = %for.cond25
  %101 = load i8**, i8*** %seqs, align 4
  %102 = bitcast i8** %101 to i8*
  call void @xfree(i8* %102)
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.body, %for.end, %if.then23, %if.else, %if.end12
  br label %for.inc210

for.inc210:                                       ; preds = %sw.epilog
  %103 = load i32, i32* %key, align 4
  %inc211 = add nsw i32 %103, 1
  store i32 %inc211, i32* %key, align 4
  br label %for.cond

for.end212:                                       ; preds = %for.cond
  %104 = load i8**, i8*** %result, align 4
  ret i8** %104
}

; Function Attrs: noinline nounwind
define internal i8* @_rl_get_keyname(i32 %key) #0 {
entry:
  %retval = alloca i8*, align 4
  %key.addr = alloca i32, align 4
  %keyname = alloca i8*, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i8* @xmalloc(i32 8)
  store i8* %call, i8** %keyname, align 4
  %0 = load i32, i32* %key.addr, align 4
  store i32 %0, i32* %c, align 4
  %1 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %1, 27
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %keyname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  store i8 92, i8* %arrayidx, align 1
  %3 = load i8*, i8** %keyname, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i32 1
  store i8 101, i8* %arrayidx1, align 1
  %4 = load i8*, i8** %keyname, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 2
  store i8 0, i8* %arrayidx2, align 1
  %5 = load i8*, i8** %keyname, align 4
  store i8* %5, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %key.addr, align 4
  %cmp3 = icmp eq i32 %6, 127
  br i1 %cmp3, label %if.then4, label %if.end10

if.then4:                                         ; preds = %if.end
  %7 = load i8*, i8** %keyname, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i32 0
  store i8 92, i8* %arrayidx5, align 1
  %8 = load i8*, i8** %keyname, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 1
  store i8 67, i8* %arrayidx6, align 1
  %9 = load i8*, i8** %keyname, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i32 2
  store i8 45, i8* %arrayidx7, align 1
  %10 = load i8*, i8** %keyname, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i32 3
  store i8 63, i8* %arrayidx8, align 1
  %11 = load i8*, i8** %keyname, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %11, i32 4
  store i8 0, i8* %arrayidx9, align 1
  %12 = load i8*, i8** %keyname, align 4
  store i8* %12, i8** %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  %13 = load i32, i32* %c, align 4
  %cmp11 = icmp slt i32 %13, 32
  br i1 %cmp11, label %land.lhs.true, label %if.end133

land.lhs.true:                                    ; preds = %if.end10
  %14 = load i32, i32* %c, align 4
  %and = and i32 %14, 128
  %cmp12 = icmp eq i32 %and, 0
  br i1 %cmp12, label %if.then13, label %if.end133

if.then13:                                        ; preds = %land.lhs.true
  %15 = load i8*, i8** %keyname, align 4
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %15, i32 %16
  store i8 92, i8* %arrayidx14, align 1
  %17 = load i8*, i8** %keyname, align 4
  %18 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %18, 1
  store i32 %inc15, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %17, i32 %18
  store i8 67, i8* %arrayidx16, align 1
  %19 = load i8*, i8** %keyname, align 4
  %20 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %20, 1
  store i32 %inc17, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %19, i32 %20
  store i8 45, i8* %arrayidx18, align 1
  %21 = load i32, i32* %c, align 4
  %or = or i32 %21, 64
  %conv = trunc i32 %or to i8
  %conv19 = zext i8 %conv to i32
  %22 = load i32, i32* %c, align 4
  %or20 = or i32 %22, 64
  %cmp21 = icmp eq i32 %conv19, %or20
  br i1 %cmp21, label %land.lhs.true23, label %cond.false

land.lhs.true23:                                  ; preds = %if.then13
  %23 = load i32, i32* %c, align 4
  %or24 = or i32 %23, 64
  %conv25 = trunc i32 %or24 to i8
  %conv26 = zext i8 %conv25 to i32
  %call27 = call i32 @islower(i32 %conv26) #5
  %tobool = icmp ne i32 %call27, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true23
  %24 = load i32, i32* %c, align 4
  %or28 = or i32 %24, 64
  %conv29 = trunc i32 %or28 to i8
  %conv30 = zext i8 %conv29 to i32
  %call31 = call i32 @toupper(i32 %conv30) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true23, %if.then13
  %25 = load i32, i32* %c, align 4
  %or32 = or i32 %25, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call31, %cond.true ], [ %or32, %cond.false ]
  %conv33 = trunc i32 %cond to i8
  %conv34 = zext i8 %conv33 to i32
  %26 = load i32, i32* %c, align 4
  %or35 = or i32 %26, 64
  %conv36 = trunc i32 %or35 to i8
  %conv37 = zext i8 %conv36 to i32
  %27 = load i32, i32* %c, align 4
  %or38 = or i32 %27, 64
  %cmp39 = icmp eq i32 %conv37, %or38
  br i1 %cmp39, label %land.lhs.true41, label %cond.false52

land.lhs.true41:                                  ; preds = %cond.end
  %28 = load i32, i32* %c, align 4
  %or42 = or i32 %28, 64
  %conv43 = trunc i32 %or42 to i8
  %conv44 = zext i8 %conv43 to i32
  %call45 = call i32 @islower(i32 %conv44) #5
  %tobool46 = icmp ne i32 %call45, 0
  br i1 %tobool46, label %cond.true47, label %cond.false52

cond.true47:                                      ; preds = %land.lhs.true41
  %29 = load i32, i32* %c, align 4
  %or48 = or i32 %29, 64
  %conv49 = trunc i32 %or48 to i8
  %conv50 = zext i8 %conv49 to i32
  %call51 = call i32 @toupper(i32 %conv50) #5
  br label %cond.end54

cond.false52:                                     ; preds = %land.lhs.true41, %cond.end
  %30 = load i32, i32* %c, align 4
  %or53 = or i32 %30, 64
  br label %cond.end54

cond.end54:                                       ; preds = %cond.false52, %cond.true47
  %cond55 = phi i32 [ %call51, %cond.true47 ], [ %or53, %cond.false52 ]
  %cmp56 = icmp eq i32 %conv34, %cond55
  br i1 %cmp56, label %land.lhs.true58, label %cond.false109

land.lhs.true58:                                  ; preds = %cond.end54
  %31 = load i32, i32* %c, align 4
  %or59 = or i32 %31, 64
  %conv60 = trunc i32 %or59 to i8
  %conv61 = zext i8 %conv60 to i32
  %32 = load i32, i32* %c, align 4
  %or62 = or i32 %32, 64
  %cmp63 = icmp eq i32 %conv61, %or62
  br i1 %cmp63, label %land.lhs.true65, label %cond.false76

land.lhs.true65:                                  ; preds = %land.lhs.true58
  %33 = load i32, i32* %c, align 4
  %or66 = or i32 %33, 64
  %conv67 = trunc i32 %or66 to i8
  %conv68 = zext i8 %conv67 to i32
  %call69 = call i32 @islower(i32 %conv68) #5
  %tobool70 = icmp ne i32 %call69, 0
  br i1 %tobool70, label %cond.true71, label %cond.false76

cond.true71:                                      ; preds = %land.lhs.true65
  %34 = load i32, i32* %c, align 4
  %or72 = or i32 %34, 64
  %conv73 = trunc i32 %or72 to i8
  %conv74 = zext i8 %conv73 to i32
  %call75 = call i32 @toupper(i32 %conv74) #5
  br label %cond.end78

cond.false76:                                     ; preds = %land.lhs.true65, %land.lhs.true58
  %35 = load i32, i32* %c, align 4
  %or77 = or i32 %35, 64
  br label %cond.end78

cond.end78:                                       ; preds = %cond.false76, %cond.true71
  %cond79 = phi i32 [ %call75, %cond.true71 ], [ %or77, %cond.false76 ]
  %conv80 = trunc i32 %cond79 to i8
  %conv81 = zext i8 %conv80 to i32
  %call82 = call i32 @isupper(i32 %conv81) #5
  %tobool83 = icmp ne i32 %call82, 0
  br i1 %tobool83, label %cond.true84, label %cond.false109

cond.true84:                                      ; preds = %cond.end78
  %36 = load i32, i32* %c, align 4
  %or85 = or i32 %36, 64
  %conv86 = trunc i32 %or85 to i8
  %conv87 = zext i8 %conv86 to i32
  %37 = load i32, i32* %c, align 4
  %or88 = or i32 %37, 64
  %cmp89 = icmp eq i32 %conv87, %or88
  br i1 %cmp89, label %land.lhs.true91, label %cond.false102

land.lhs.true91:                                  ; preds = %cond.true84
  %38 = load i32, i32* %c, align 4
  %or92 = or i32 %38, 64
  %conv93 = trunc i32 %or92 to i8
  %conv94 = zext i8 %conv93 to i32
  %call95 = call i32 @islower(i32 %conv94) #5
  %tobool96 = icmp ne i32 %call95, 0
  br i1 %tobool96, label %cond.true97, label %cond.false102

cond.true97:                                      ; preds = %land.lhs.true91
  %39 = load i32, i32* %c, align 4
  %or98 = or i32 %39, 64
  %conv99 = trunc i32 %or98 to i8
  %conv100 = zext i8 %conv99 to i32
  %call101 = call i32 @toupper(i32 %conv100) #5
  br label %cond.end104

cond.false102:                                    ; preds = %land.lhs.true91, %cond.true84
  %40 = load i32, i32* %c, align 4
  %or103 = or i32 %40, 64
  br label %cond.end104

cond.end104:                                      ; preds = %cond.false102, %cond.true97
  %cond105 = phi i32 [ %call101, %cond.true97 ], [ %or103, %cond.false102 ]
  %conv106 = trunc i32 %cond105 to i8
  %conv107 = zext i8 %conv106 to i32
  %call108 = call i32 @tolower(i32 %conv107) #5
  br label %cond.end131

cond.false109:                                    ; preds = %cond.end78, %cond.end54
  %41 = load i32, i32* %c, align 4
  %or110 = or i32 %41, 64
  %conv111 = trunc i32 %or110 to i8
  %conv112 = zext i8 %conv111 to i32
  %42 = load i32, i32* %c, align 4
  %or113 = or i32 %42, 64
  %cmp114 = icmp eq i32 %conv112, %or113
  br i1 %cmp114, label %land.lhs.true116, label %cond.false127

land.lhs.true116:                                 ; preds = %cond.false109
  %43 = load i32, i32* %c, align 4
  %or117 = or i32 %43, 64
  %conv118 = trunc i32 %or117 to i8
  %conv119 = zext i8 %conv118 to i32
  %call120 = call i32 @islower(i32 %conv119) #5
  %tobool121 = icmp ne i32 %call120, 0
  br i1 %tobool121, label %cond.true122, label %cond.false127

cond.true122:                                     ; preds = %land.lhs.true116
  %44 = load i32, i32* %c, align 4
  %or123 = or i32 %44, 64
  %conv124 = trunc i32 %or123 to i8
  %conv125 = zext i8 %conv124 to i32
  %call126 = call i32 @toupper(i32 %conv125) #5
  br label %cond.end129

cond.false127:                                    ; preds = %land.lhs.true116, %cond.false109
  %45 = load i32, i32* %c, align 4
  %or128 = or i32 %45, 64
  br label %cond.end129

cond.end129:                                      ; preds = %cond.false127, %cond.true122
  %cond130 = phi i32 [ %call126, %cond.true122 ], [ %or128, %cond.false127 ]
  br label %cond.end131

cond.end131:                                      ; preds = %cond.end129, %cond.end104
  %cond132 = phi i32 [ %call108, %cond.end104 ], [ %cond130, %cond.end129 ]
  store i32 %cond132, i32* %c, align 4
  br label %if.end133

if.end133:                                        ; preds = %cond.end131, %land.lhs.true, %if.end10
  %46 = load i32, i32* %c, align 4
  %cmp134 = icmp sge i32 %46, 128
  br i1 %cmp134, label %land.lhs.true136, label %if.end148

land.lhs.true136:                                 ; preds = %if.end133
  %47 = load i32, i32* %c, align 4
  %cmp137 = icmp sle i32 %47, 159
  br i1 %cmp137, label %if.then139, label %if.end148

if.then139:                                       ; preds = %land.lhs.true136
  %48 = load i8*, i8** %keyname, align 4
  %49 = load i32, i32* %i, align 4
  %inc140 = add nsw i32 %49, 1
  store i32 %inc140, i32* %i, align 4
  %arrayidx141 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 92, i8* %arrayidx141, align 1
  %50 = load i8*, i8** %keyname, align 4
  %51 = load i32, i32* %i, align 4
  %inc142 = add nsw i32 %51, 1
  store i32 %inc142, i32* %i, align 4
  %arrayidx143 = getelementptr inbounds i8, i8* %50, i32 %51
  store i8 50, i8* %arrayidx143, align 1
  %52 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %52, 128
  store i32 %sub, i32* %c, align 4
  %53 = load i32, i32* %c, align 4
  %div = sdiv i32 %53, 8
  %add = add nsw i32 %div, 48
  %conv144 = trunc i32 %add to i8
  %54 = load i8*, i8** %keyname, align 4
  %55 = load i32, i32* %i, align 4
  %inc145 = add nsw i32 %55, 1
  store i32 %inc145, i32* %i, align 4
  %arrayidx146 = getelementptr inbounds i8, i8* %54, i32 %55
  store i8 %conv144, i8* %arrayidx146, align 1
  %56 = load i32, i32* %c, align 4
  %rem = srem i32 %56, 8
  %add147 = add nsw i32 %rem, 48
  store i32 %add147, i32* %c, align 4
  br label %if.end148

if.end148:                                        ; preds = %if.then139, %land.lhs.true136, %if.end133
  %57 = load i32, i32* %c, align 4
  %cmp149 = icmp eq i32 %57, 92
  br i1 %cmp149, label %if.then153, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end148
  %58 = load i32, i32* %c, align 4
  %cmp151 = icmp eq i32 %58, 34
  br i1 %cmp151, label %if.then153, label %if.end156

if.then153:                                       ; preds = %lor.lhs.false, %if.end148
  %59 = load i8*, i8** %keyname, align 4
  %60 = load i32, i32* %i, align 4
  %inc154 = add nsw i32 %60, 1
  store i32 %inc154, i32* %i, align 4
  %arrayidx155 = getelementptr inbounds i8, i8* %59, i32 %60
  store i8 92, i8* %arrayidx155, align 1
  br label %if.end156

if.end156:                                        ; preds = %if.then153, %lor.lhs.false
  %61 = load i32, i32* %c, align 4
  %conv157 = trunc i32 %61 to i8
  %62 = load i8*, i8** %keyname, align 4
  %63 = load i32, i32* %i, align 4
  %inc158 = add nsw i32 %63, 1
  store i32 %inc158, i32* %i, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %62, i32 %63
  store i8 %conv157, i8* %arrayidx159, align 1
  %64 = load i8*, i8** %keyname, align 4
  %65 = load i32, i32* %i, align 4
  %arrayidx160 = getelementptr inbounds i8, i8* %64, i32 %65
  store i8 0, i8* %arrayidx160, align 1
  %66 = load i8*, i8** %keyname, align 4
  store i8* %66, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end156, %if.then4, %if.then
  %67 = load i8*, i8** %retval, align 4
  ret i8* %67
}

declare i8* @xrealloc(i8*, i32) #1

declare i32 @sprintf(i8*, i8*, ...) #1

declare i8* @strcat(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i8** @rl_invoking_keyseqs(i32 (i32, i32)* %function) #0 {
entry:
  %function.addr = alloca i32 (i32, i32)*, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i8** @rl_invoking_keyseqs_in_map(i32 (i32, i32)* %0, %struct._keymap_entry* %1)
  ret i8** %call
}

; Function Attrs: noinline nounwind
define void @rl_function_dumper(i32 %print_readably) #0 {
entry:
  %print_readably.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %names = alloca i8**, align 4
  %name = alloca i8*, align 4
  %function = alloca i32 (i32, i32)*, align 4
  %invokers = alloca i8**, align 4
  %j = alloca i32, align 4
  %j20 = alloca i32, align 4
  store i32 %print_readably, i32* %print_readably.addr, align 4
  %call = call i8** @rl_funmap_names()
  store i8** %call, i8*** %names, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc49, %entry
  %1 = load i8**, i8*** %names, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  store i8* %3, i8** %name, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end51

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %name, align 4
  %call2 = call i32 (i32, i32)* @rl_named_function(i8* %4)
  store i32 (i32, i32)* %call2, i32 (i32, i32)** %function, align 4
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call3 = call i8** @rl_invoking_keyseqs_in_map(i32 (i32, i32)* %5, %struct._keymap_entry* %6)
  store i8** %call3, i8*** %invokers, align 4
  %7 = load i32, i32* %print_readably.addr, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %if.then, label %if.else15

if.then:                                          ; preds = %for.body
  %8 = load i8**, i8*** %invokers, align 4
  %tobool5 = icmp ne i8** %8, null
  br i1 %tobool5, label %if.else, label %if.then6

if.then6:                                         ; preds = %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %10 = load i8*, i8** %name, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.27, i32 0, i32 0), i8* %10)
  br label %if.end

if.else:                                          ; preds = %if.then
  store i32 0, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %if.else
  %11 = load i8**, i8*** %invokers, align 4
  %12 = load i32, i32* %j, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx9, align 4
  %tobool10 = icmp ne i8* %13, null
  br i1 %tobool10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %15 = load i8**, i8*** %invokers, align 4
  %16 = load i32, i32* %j, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %15, i32 %16
  %17 = load i8*, i8** %arrayidx12, align 4
  %18 = load i8*, i8** %name, align 4
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.28, i32 0, i32 0), i8* %17, i8* %18)
  %19 = load i8**, i8*** %invokers, align 4
  %20 = load i32, i32* %j, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx14, align 4
  call void @xfree(i8* %21)
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %22 = load i32, i32* %j, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  %23 = load i8**, i8*** %invokers, align 4
  %24 = bitcast i8** %23 to i8*
  call void @xfree(i8* %24)
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then6
  br label %if.end48

if.else15:                                        ; preds = %for.body
  %25 = load i8**, i8*** %invokers, align 4
  %tobool16 = icmp ne i8** %25, null
  br i1 %tobool16, label %if.else19, label %if.then17

if.then17:                                        ; preds = %if.else15
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %27 = load i8*, i8** %name, align 4
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.29, i32 0, i32 0), i8* %27)
  br label %if.end47

if.else19:                                        ; preds = %if.else15
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %29 = load i8*, i8** %name, align 4
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.30, i32 0, i32 0), i8* %29)
  store i32 0, i32* %j20, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc30, %if.else19
  %30 = load i8**, i8*** %invokers, align 4
  %31 = load i32, i32* %j20, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx23, align 4
  %tobool24 = icmp ne i8* %32, null
  br i1 %tobool24, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond22
  %33 = load i32, i32* %j20, align 4
  %cmp = icmp slt i32 %33, 5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond22
  %34 = phi i1 [ false, %for.cond22 ], [ %cmp, %land.rhs ]
  br i1 %34, label %for.body25, label %for.end32

for.body25:                                       ; preds = %land.end
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %36 = load i8**, i8*** %invokers, align 4
  %37 = load i32, i32* %j20, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %36, i32 %37
  %38 = load i8*, i8** %arrayidx26, align 4
  %39 = load i8**, i8*** %invokers, align 4
  %40 = load i32, i32* %j20, align 4
  %add = add nsw i32 %40, 1
  %arrayidx27 = getelementptr inbounds i8*, i8** %39, i32 %add
  %41 = load i8*, i8** %arrayidx27, align 4
  %tobool28 = icmp ne i8* %41, null
  %cond = select i1 %tobool28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i32 0, i32 0)
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.31, i32 0, i32 0), i8* %38, i8* %cond)
  br label %for.inc30

for.inc30:                                        ; preds = %for.body25
  %42 = load i32, i32* %j20, align 4
  %inc31 = add nsw i32 %42, 1
  store i32 %inc31, i32* %j20, align 4
  br label %for.cond22

for.end32:                                        ; preds = %land.end
  %43 = load i32, i32* %j20, align 4
  %cmp33 = icmp eq i32 %43, 5
  br i1 %cmp33, label %land.lhs.true, label %if.end38

land.lhs.true:                                    ; preds = %for.end32
  %44 = load i8**, i8*** %invokers, align 4
  %45 = load i32, i32* %j20, align 4
  %arrayidx34 = getelementptr inbounds i8*, i8** %44, i32 %45
  %46 = load i8*, i8** %arrayidx34, align 4
  %tobool35 = icmp ne i8* %46, null
  br i1 %tobool35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %land.lhs.true
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.34, i32 0, i32 0))
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %land.lhs.true, %for.end32
  store i32 0, i32* %j20, align 4
  br label %for.cond39

for.cond39:                                       ; preds = %for.inc44, %if.end38
  %48 = load i8**, i8*** %invokers, align 4
  %49 = load i32, i32* %j20, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %48, i32 %49
  %50 = load i8*, i8** %arrayidx40, align 4
  %tobool41 = icmp ne i8* %50, null
  br i1 %tobool41, label %for.body42, label %for.end46

for.body42:                                       ; preds = %for.cond39
  %51 = load i8**, i8*** %invokers, align 4
  %52 = load i32, i32* %j20, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %51, i32 %52
  %53 = load i8*, i8** %arrayidx43, align 4
  call void @xfree(i8* %53)
  br label %for.inc44

for.inc44:                                        ; preds = %for.body42
  %54 = load i32, i32* %j20, align 4
  %inc45 = add nsw i32 %54, 1
  store i32 %inc45, i32* %j20, align 4
  br label %for.cond39

for.end46:                                        ; preds = %for.cond39
  %55 = load i8**, i8*** %invokers, align 4
  %56 = bitcast i8** %55 to i8*
  call void @xfree(i8* %56)
  br label %if.end47

if.end47:                                         ; preds = %for.end46, %if.then17
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end
  br label %for.inc49

for.inc49:                                        ; preds = %if.end48
  %57 = load i32, i32* %i, align 4
  %inc50 = add nsw i32 %57, 1
  store i32 %inc50, i32* %i, align 4
  br label %for.cond

for.end51:                                        ; preds = %for.cond
  %58 = load i8**, i8*** %names, align 4
  %59 = bitcast i8** %58 to i8*
  call void @xfree(i8* %59)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_dump_functions(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_dispatching, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @rl_explicit_arg, align 4
  call void @rl_function_dumper(i32 %2)
  %call1 = call i32 @rl_on_new_line()
  ret i32 0
}

declare i32 @rl_on_new_line() #1

; Function Attrs: noinline nounwind
define void @rl_macro_dumper(i32 %print_readably) #0 {
entry:
  %print_readably.addr = alloca i32, align 4
  store i32 %print_readably, i32* %print_readably.addr, align 4
  %0 = load i32, i32* %print_readably.addr, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  call void @_rl_macro_dumper_internal(i32 %0, %struct._keymap_entry* %1, i8* null)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_rl_macro_dumper_internal(i32 %print_readably, %struct._keymap_entry* %map, i8* %prefix) #0 {
entry:
  %print_readably.addr = alloca i32, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %prefix.addr = alloca i8*, align 4
  %key = alloca i32, align 4
  %keyname = alloca i8*, align 4
  %out = alloca i8*, align 4
  %prefix_len = alloca i32, align 4
  store i32 %print_readably, i32* %print_readably.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i8* %prefix, i8** %prefix.addr, align 4
  store i32 0, i32* %key, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %key, align 4
  %cmp = icmp slt i32 %0, 257
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %2 = load i32, i32* %key, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %1, i32 %2
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %3 = load i8, i8* %type, align 4
  %conv = sext i8 %3 to i32
  switch i32 %conv, label %sw.epilog [
    i32 2, label %sw.bb
    i32 0, label %sw.bb21
    i32 1, label %sw.bb22
  ]

sw.bb:                                            ; preds = %for.body
  %4 = load i32, i32* %key, align 4
  %call = call i8* @_rl_get_keyname(i32 %4)
  store i8* %call, i8** %keyname, align 4
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %6 = load i32, i32* %key, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 %6
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 1
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %8 = bitcast i32 (i32, i32)* %7 to i8*
  %call2 = call i8* @_rl_untranslate_macro_value(i8* %8, i32 0)
  store i8* %call2, i8** %out, align 4
  %9 = load i32, i32* %print_readably.addr, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %11 = load i8*, i8** %prefix.addr, align 4
  %tobool3 = icmp ne i8* %11, null
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %12 = load i8*, i8** %prefix.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %12, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.115, i32 0, i32 0), %cond.false ]
  %13 = load i8*, i8** %keyname, align 4
  %14 = load i8*, i8** %out, align 4
  %tobool4 = icmp ne i8* %14, null
  br i1 %tobool4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %cond.end
  %15 = load i8*, i8** %out, align 4
  br label %cond.end7

cond.false6:                                      ; preds = %cond.end
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true5
  %cond8 = phi i8* [ %15, %cond.true5 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.115, i32 0, i32 0), %cond.false6 ]
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.114, i32 0, i32 0), i8* %cond, i8* %13, i8* %cond8)
  br label %if.end

if.else:                                          ; preds = %sw.bb
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %17 = load i8*, i8** %prefix.addr, align 4
  %tobool10 = icmp ne i8* %17, null
  br i1 %tobool10, label %cond.true11, label %cond.false12

cond.true11:                                      ; preds = %if.else
  %18 = load i8*, i8** %prefix.addr, align 4
  br label %cond.end13

cond.false12:                                     ; preds = %if.else
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true11
  %cond14 = phi i8* [ %18, %cond.true11 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.115, i32 0, i32 0), %cond.false12 ]
  %19 = load i8*, i8** %keyname, align 4
  %20 = load i8*, i8** %out, align 4
  %tobool15 = icmp ne i8* %20, null
  br i1 %tobool15, label %cond.true16, label %cond.false17

cond.true16:                                      ; preds = %cond.end13
  %21 = load i8*, i8** %out, align 4
  br label %cond.end18

cond.false17:                                     ; preds = %cond.end13
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false17, %cond.true16
  %cond19 = phi i8* [ %21, %cond.true16 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.115, i32 0, i32 0), %cond.false17 ]
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.116, i32 0, i32 0), i8* %cond14, i8* %19, i8* %cond19)
  br label %if.end

if.end:                                           ; preds = %cond.end18, %cond.end7
  %22 = load i8*, i8** %keyname, align 4
  call void @xfree(i8* %22)
  %23 = load i8*, i8** %out, align 4
  call void @xfree(i8* %23)
  br label %sw.epilog

sw.bb21:                                          ; preds = %for.body
  br label %sw.epilog

sw.bb22:                                          ; preds = %for.body
  %24 = load i8*, i8** %prefix.addr, align 4
  %tobool23 = icmp ne i8* %24, null
  br i1 %tobool23, label %cond.true24, label %cond.false26

cond.true24:                                      ; preds = %sw.bb22
  %25 = load i8*, i8** %prefix.addr, align 4
  %call25 = call i32 @strlen(i8* %25)
  br label %cond.end27

cond.false26:                                     ; preds = %sw.bb22
  br label %cond.end27

cond.end27:                                       ; preds = %cond.false26, %cond.true24
  %cond28 = phi i32 [ %call25, %cond.true24 ], [ 0, %cond.false26 ]
  store i32 %cond28, i32* %prefix_len, align 4
  %26 = load i32, i32* %key, align 4
  %cmp29 = icmp eq i32 %26, 27
  br i1 %cmp29, label %if.then31, label %if.else42

if.then31:                                        ; preds = %cond.end27
  %27 = load i32, i32* %prefix_len, align 4
  %add = add nsw i32 3, %27
  %call32 = call i8* @xmalloc(i32 %add)
  store i8* %call32, i8** %keyname, align 4
  %28 = load i8*, i8** %prefix.addr, align 4
  %tobool33 = icmp ne i8* %28, null
  br i1 %tobool33, label %if.then34, label %if.end36

if.then34:                                        ; preds = %if.then31
  %29 = load i8*, i8** %keyname, align 4
  %30 = load i8*, i8** %prefix.addr, align 4
  %call35 = call i8* @strcpy(i8* %29, i8* %30)
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.then31
  %31 = load i8*, i8** %keyname, align 4
  %32 = load i32, i32* %prefix_len, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %31, i32 %32
  store i8 92, i8* %arrayidx37, align 1
  %33 = load i8*, i8** %keyname, align 4
  %34 = load i32, i32* %prefix_len, align 4
  %add38 = add nsw i32 %34, 1
  %arrayidx39 = getelementptr inbounds i8, i8* %33, i32 %add38
  store i8 101, i8* %arrayidx39, align 1
  %35 = load i8*, i8** %keyname, align 4
  %36 = load i32, i32* %prefix_len, align 4
  %add40 = add nsw i32 %36, 2
  %arrayidx41 = getelementptr inbounds i8, i8* %35, i32 %add40
  store i8 0, i8* %arrayidx41, align 1
  br label %if.end53

if.else42:                                        ; preds = %cond.end27
  %37 = load i32, i32* %key, align 4
  %call43 = call i8* @_rl_get_keyname(i32 %37)
  store i8* %call43, i8** %keyname, align 4
  %38 = load i8*, i8** %prefix.addr, align 4
  %tobool44 = icmp ne i8* %38, null
  br i1 %tobool44, label %if.then45, label %if.end52

if.then45:                                        ; preds = %if.else42
  %39 = load i8*, i8** %keyname, align 4
  %call46 = call i32 @strlen(i8* %39)
  %40 = load i32, i32* %prefix_len, align 4
  %add47 = add i32 %call46, %40
  %add48 = add i32 %add47, 1
  %call49 = call i8* @xmalloc(i32 %add48)
  store i8* %call49, i8** %out, align 4
  %41 = load i8*, i8** %out, align 4
  %42 = load i8*, i8** %prefix.addr, align 4
  %call50 = call i8* @strcpy(i8* %41, i8* %42)
  %43 = load i8*, i8** %out, align 4
  %44 = load i32, i32* %prefix_len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i8*, i8** %keyname, align 4
  %call51 = call i8* @strcpy(i8* %add.ptr, i8* %45)
  %46 = load i8*, i8** %keyname, align 4
  call void @xfree(i8* %46)
  %47 = load i8*, i8** %out, align 4
  store i8* %47, i8** %keyname, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then45, %if.else42
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end36
  %48 = load i32, i32* %print_readably.addr, align 4
  %49 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %50 = load i32, i32* %key, align 4
  %arrayidx54 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %49, i32 %50
  %function55 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx54, i32 0, i32 1
  %51 = load i32 (i32, i32)*, i32 (i32, i32)** %function55, align 4
  %52 = bitcast i32 (i32, i32)* %51 to %struct._keymap_entry*
  %53 = load i8*, i8** %keyname, align 4
  call void @_rl_macro_dumper_internal(i32 %48, %struct._keymap_entry* %52, i8* %53)
  %54 = load i8*, i8** %keyname, align 4
  call void @xfree(i8* %54)
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.body, %if.end53, %sw.bb21, %if.end
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %55 = load i32, i32* %key, align 4
  %inc = add nsw i32 %55, 1
  store i32 %inc, i32* %key, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_dump_macros(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_dispatching, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @rl_explicit_arg, align 4
  call void @rl_macro_dumper(i32 %2)
  %call1 = call i32 @rl_on_new_line()
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @rl_variable_dumper(i32 %print_readably) #0 {
entry:
  %print_readably.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %v = alloca i8*, align 4
  store i32 %print_readably, i32* %print_readably.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %0
  %name = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i8*, i8** %name, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %print_readably.addr, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %4
  %name3 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx2, i32 0, i32 0
  %5 = load i8*, i8** %name3, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %6
  %value = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx4, i32 0, i32 1
  %7 = load i32*, i32** %value, align 4
  %8 = load i32, i32* %7, align 4
  %tobool5 = icmp ne i32 %8, 0
  %cond = select i1 %tobool5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.36, i32 0, i32 0), i8* %5, i8* %cond)
  br label %if.end

if.else:                                          ; preds = %for.body
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %10
  %name7 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx6, i32 0, i32 0
  %11 = load i8*, i8** %name7, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [34 x %struct.anon], [34 x %struct.anon]* @boolean_varlist, i32 0, i32 %12
  %value9 = getelementptr inbounds %struct.anon, %struct.anon* %arrayidx8, i32 0, i32 1
  %13 = load i32*, i32** %value9, align 4
  %14 = load i32, i32* %13, align 4
  %tobool10 = icmp ne i32 %14, 0
  %cond11 = select i1 %tobool10, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0)
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i32 0, i32 0), i8* %11, i8* %cond11)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc33, %for.end
  %16 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %16
  %name15 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx14, i32 0, i32 0
  %17 = load i8*, i8** %name15, align 4
  %tobool16 = icmp ne i8* %17, null
  br i1 %tobool16, label %for.body17, label %for.end35

for.body17:                                       ; preds = %for.cond13
  %18 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %18
  %name19 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx18, i32 0, i32 0
  %19 = load i8*, i8** %name19, align 4
  %call20 = call i8* @_rl_get_string_variable_value(i8* %19)
  store i8* %call20, i8** %v, align 4
  %20 = load i8*, i8** %v, align 4
  %cmp = icmp eq i8* %20, null
  br i1 %cmp, label %if.then21, label %if.end22

if.then21:                                        ; preds = %for.body17
  br label %for.inc33

if.end22:                                         ; preds = %for.body17
  %21 = load i32, i32* %print_readably.addr, align 4
  %tobool23 = icmp ne i32 %21, 0
  br i1 %tobool23, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end22
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %23
  %name26 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx25, i32 0, i32 0
  %24 = load i8*, i8** %name26, align 4
  %25 = load i8*, i8** %v, align 4
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.36, i32 0, i32 0), i8* %24, i8* %25)
  br label %if.end32

if.else28:                                        ; preds = %if.end22
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx29 = getelementptr inbounds [14 x %struct.anon.0], [14 x %struct.anon.0]* @string_varlist, i32 0, i32 %27
  %name30 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %arrayidx29, i32 0, i32 0
  %28 = load i8*, i8** %name30, align 4
  %29 = load i8*, i8** %v, align 4
  %call31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.37, i32 0, i32 0), i8* %28, i8* %29)
  br label %if.end32

if.end32:                                         ; preds = %if.else28, %if.then24
  br label %for.inc33

for.inc33:                                        ; preds = %if.end32, %if.then21
  %30 = load i32, i32* %i, align 4
  %inc34 = add nsw i32 %30, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond13

for.end35:                                        ; preds = %for.cond13
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_dump_variables(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_dispatching, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @rl_explicit_arg, align 4
  call void @rl_variable_dumper(i32 %2)
  %call1 = call i32 @rl_on_new_line()
  ret i32 0
}

declare i8* @tilde_expand(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @_rl_read_file(i8* %filename, i32* %sizep) #0 {
entry:
  %retval = alloca i8*, align 4
  %filename.addr = alloca i8*, align 4
  %sizep.addr = alloca i32*, align 4
  %finfo = alloca %struct.stat, align 8
  %file_size = alloca i32, align 4
  %buffer = alloca i8*, align 4
  %i = alloca i32, align 4
  %file = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32* %sizep, i32** %sizep.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %finfo)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 4
  %call1 = call i32 (i8*, i32, ...) @open(i8* %1, i32 0, i32 438)
  store i32 %call1, i32* %file, align 4
  %cmp2 = icmp slt i32 %call1, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %2 = load i32, i32* %st_size, align 8
  store i32 %2, i32* %file_size, align 4
  %3 = load i32, i32* %file_size, align 4
  %st_size3 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 12
  %4 = load i32, i32* %st_size3, align 8
  %cmp4 = icmp ne i32 %3, %4
  br i1 %cmp4, label %if.then7, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %if.end
  %5 = load i32, i32* %file_size, align 4
  %add = add i32 %5, 1
  %6 = load i32, i32* %file_size, align 4
  %cmp6 = icmp ult i32 %add, %6
  br i1 %cmp6, label %if.then7, label %if.end13

if.then7:                                         ; preds = %lor.lhs.false5, %if.end
  %7 = load i32, i32* %file, align 4
  %cmp8 = icmp sge i32 %7, 0
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.then7
  %8 = load i32, i32* %file, align 4
  %call10 = call i32 @close(i32 %8)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.then7
  %call12 = call i32* @__errno_location()
  store i32 27, i32* %call12, align 4
  store i8* null, i8** %retval, align 4
  br label %return

if.end13:                                         ; preds = %lor.lhs.false5
  %9 = load i32, i32* %file_size, align 4
  %add14 = add i32 %9, 1
  %call15 = call i8* @xmalloc(i32 %add14)
  store i8* %call15, i8** %buffer, align 4
  %10 = load i32, i32* %file, align 4
  %11 = load i8*, i8** %buffer, align 4
  %12 = load i32, i32* %file_size, align 4
  %call16 = call i32 @read(i32 %10, i8* %11, i32 %12)
  store i32 %call16, i32* %i, align 4
  %13 = load i32, i32* %file, align 4
  %call17 = call i32 @close(i32 %13)
  %14 = load i32, i32* %i, align 4
  %cmp18 = icmp slt i32 %14, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end13
  %15 = load i8*, i8** %buffer, align 4
  call void @xfree(i8* %15)
  store i8* null, i8** %retval, align 4
  br label %return

if.end20:                                         ; preds = %if.end13
  br label %do.body

do.body:                                          ; preds = %if.end20
  %16 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %16, 0
  br i1 %tobool, label %if.then21, label %if.end22

if.then21:                                        ; preds = %do.body
  %17 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %17)
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end22
  %18 = load i8*, i8** %buffer, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 0, i8* %arrayidx, align 1
  %20 = load i32*, i32** %sizep.addr, align 4
  %tobool23 = icmp ne i32* %20, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %do.end
  %21 = load i32, i32* %i, align 4
  %22 = load i32*, i32** %sizep.addr, align 4
  store i32 %21, i32* %22, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %do.end
  %23 = load i8*, i8** %buffer, align 4
  store i8* %23, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end25, %if.then19, %if.end11, %if.then
  %24 = load i8*, i8** %retval, align 4
  ret i8* %24
}

declare void @_rl_signal_handler(i32) #1

declare i32* @__errno_location() #1

declare void @free(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @open(i8*, i32, ...) #1

declare i32 @close(i32) #1

declare i32 @read(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @parser_if(i8* %args) #0 {
entry:
  %retval = alloca i32, align 4
  %args.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %tem = alloca i8*, align 4
  %tname = alloca i8*, align 4
  %mode = alloca i32, align 4
  store i8* %args, i8** %args.addr, align 4
  %0 = load i32, i32* @if_stack_depth, align 4
  %add = add nsw i32 %0, 1
  %1 = load i32, i32* @if_stack_size, align 4
  %cmp = icmp sge i32 %add, %1
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** @if_stack, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.else, label %if.then1

if.then1:                                         ; preds = %if.then
  store i32 20, i32* @if_stack_size, align 4
  %call = call i8* @xmalloc(i32 20)
  store i8* %call, i8** @if_stack, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %3 = load i8*, i8** @if_stack, align 4
  %4 = load i32, i32* @if_stack_size, align 4
  %add2 = add nsw i32 %4, 20
  store i32 %add2, i32* @if_stack_size, align 4
  %call3 = call i8* @xrealloc(i8* %3, i32 %add2)
  store i8* %call3, i8** @if_stack, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  %5 = load i8, i8* @_rl_parsing_conditionalized_out, align 1
  %6 = load i8*, i8** @if_stack, align 4
  %7 = load i32, i32* @if_stack_depth, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @if_stack_depth, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 %7
  store i8 %5, i8* %arrayidx, align 1
  %8 = load i8, i8* @_rl_parsing_conditionalized_out, align 1
  %tobool5 = icmp ne i8 %8, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %9 = load i8*, i8** %args.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx8, align 1
  %conv = sext i8 %11 to i32
  %tobool9 = icmp ne i32 %conv, 0
  br i1 %tobool9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %12 = load i8*, i8** %args.addr, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %14 to i32
  %cmp12 = icmp eq i32 %conv11, 32
  br i1 %cmp12, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %15 = load i8*, i8** %args.addr, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %17 to i32
  %cmp16 = icmp eq i32 %conv15, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %18 = phi i1 [ true, %land.rhs ], [ %cmp16, %lor.rhs ]
  %lnot = xor i1 %18, true
  br label %land.end

land.end:                                         ; preds = %lor.end, %for.cond
  %19 = phi i1 [ false, %for.cond ], [ %lnot, %lor.end ]
  br i1 %19, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4
  %inc18 = add nsw i32 %20, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %21 = load i8*, i8** %args.addr, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx19, align 1
  %tobool20 = icmp ne i8 %23, 0
  br i1 %tobool20, label %if.then21, label %if.end24

if.then21:                                        ; preds = %for.end
  %24 = load i8*, i8** %args.addr, align 4
  %25 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %25, 1
  store i32 %inc22, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %24, i32 %25
  store i8 0, i8* %arrayidx23, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %for.end
  %26 = load i8*, i8** @rl_terminal_name, align 4
  %tobool25 = icmp ne i8* %26, null
  br i1 %tobool25, label %land.lhs.true, label %if.else46

land.lhs.true:                                    ; preds = %if.end24
  %27 = load i8*, i8** %args.addr, align 4
  %call26 = call i32 @strncasecmp(i8* %27, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.43, i32 0, i32 0), i32 5)
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %if.then29, label %if.else46

if.then29:                                        ; preds = %land.lhs.true
  %28 = load i8*, i8** @rl_terminal_name, align 4
  %call30 = call i32 @strlen(i8* %28)
  %add31 = add i32 1, %call30
  %call32 = call i8* @xmalloc(i32 %add31)
  %29 = load i8*, i8** @rl_terminal_name, align 4
  %call33 = call i8* @strcpy(i8* %call32, i8* %29)
  store i8* %call33, i8** %tname, align 4
  %30 = load i8*, i8** %tname, align 4
  %call34 = call i8* @strchr(i8* %30, i32 45)
  store i8* %call34, i8** %tem, align 4
  %31 = load i8*, i8** %tem, align 4
  %tobool35 = icmp ne i8* %31, null
  br i1 %tobool35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.then29
  %32 = load i8*, i8** %tem, align 4
  store i8 0, i8* %32, align 1
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.then29
  %33 = load i8*, i8** %args.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %33, i32 5
  %34 = load i8*, i8** %tname, align 4
  %call38 = call i32 @strcasecmp(i8* %add.ptr, i8* %34)
  %tobool39 = icmp ne i32 %call38, 0
  br i1 %tobool39, label %land.rhs40, label %land.end44

land.rhs40:                                       ; preds = %if.end37
  %35 = load i8*, i8** %args.addr, align 4
  %add.ptr41 = getelementptr inbounds i8, i8* %35, i32 5
  %36 = load i8*, i8** @rl_terminal_name, align 4
  %call42 = call i32 @strcasecmp(i8* %add.ptr41, i8* %36)
  %tobool43 = icmp ne i32 %call42, 0
  br label %land.end44

land.end44:                                       ; preds = %land.rhs40, %if.end37
  %37 = phi i1 [ false, %if.end37 ], [ %tobool43, %land.rhs40 ]
  %land.ext = zext i1 %37 to i32
  %conv45 = trunc i32 %land.ext to i8
  store i8 %conv45, i8* @_rl_parsing_conditionalized_out, align 1
  %38 = load i8*, i8** %tname, align 4
  call void @xfree(i8* %38)
  br label %if.end76

if.else46:                                        ; preds = %land.lhs.true, %if.end24
  %39 = load i8*, i8** %args.addr, align 4
  %call47 = call i32 @strncasecmp(i8* %39, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.44, i32 0, i32 0), i32 5)
  %cmp48 = icmp eq i32 %call47, 0
  br i1 %cmp48, label %if.then50, label %if.else68

if.then50:                                        ; preds = %if.else46
  %40 = load i8*, i8** %args.addr, align 4
  %add.ptr51 = getelementptr inbounds i8, i8* %40, i32 5
  %call52 = call i32 @strcasecmp(i8* %add.ptr51, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0))
  %cmp53 = icmp eq i32 %call52, 0
  br i1 %cmp53, label %if.then55, label %if.else56

if.then55:                                        ; preds = %if.then50
  store i32 1, i32* %mode, align 4
  br label %if.end64

if.else56:                                        ; preds = %if.then50
  %41 = load i8*, i8** %args.addr, align 4
  %add.ptr57 = getelementptr inbounds i8, i8* %41, i32 5
  %call58 = call i32 @strcasecmp(i8* %add.ptr57, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0))
  %cmp59 = icmp eq i32 %call58, 0
  br i1 %cmp59, label %if.then61, label %if.else62

if.then61:                                        ; preds = %if.else56
  store i32 0, i32* %mode, align 4
  br label %if.end63

if.else62:                                        ; preds = %if.else56
  store i32 -1, i32* %mode, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %if.then61
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then55
  %42 = load i32, i32* %mode, align 4
  %43 = load i32, i32* @rl_editing_mode, align 4
  %cmp65 = icmp ne i32 %42, %43
  %conv66 = zext i1 %cmp65 to i32
  %conv67 = trunc i32 %conv66 to i8
  store i8 %conv67, i8* @_rl_parsing_conditionalized_out, align 1
  br label %if.end75

if.else68:                                        ; preds = %if.else46
  %44 = load i8*, i8** %args.addr, align 4
  %45 = load i8*, i8** @rl_readline_name, align 4
  %call69 = call i32 @strcasecmp(i8* %44, i8* %45)
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %if.then72, label %if.else73

if.then72:                                        ; preds = %if.else68
  store i8 0, i8* @_rl_parsing_conditionalized_out, align 1
  br label %if.end74

if.else73:                                        ; preds = %if.else68
  store i8 1, i8* @_rl_parsing_conditionalized_out, align 1
  br label %if.end74

if.end74:                                         ; preds = %if.else73, %if.then72
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.end64
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %land.end44
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end76, %if.then6
  %46 = load i32, i32* %retval, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind
define internal i32 @parser_endif(i8* %args) #0 {
entry:
  %args.addr = alloca i8*, align 4
  store i8* %args, i8** %args.addr, align 4
  %0 = load i32, i32* @if_stack_depth, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @if_stack, align 4
  %2 = load i32, i32* @if_stack_depth, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @if_stack_depth, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %dec
  %3 = load i8, i8* %arrayidx, align 1
  store i8 %3, i8* @_rl_parsing_conditionalized_out, align 1
  br label %if.end

if.else:                                          ; preds = %entry
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.45, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @parser_else(i8* %args) #0 {
entry:
  %retval = alloca i32, align 4
  %args.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %args, i8** %args.addr, align 4
  %0 = load i32, i32* @if_stack_depth, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void (i8*, ...) @_rl_init_file_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.46, i32 0, i32 0))
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @if_stack_depth, align 4
  %cmp1 = icmp slt i32 %1, %2
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** @if_stack, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 1
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end5
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i8, i8* @_rl_parsing_conditionalized_out, align 1
  %tobool = icmp ne i8 %7, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %conv6 = trunc i32 %lnot.ext to i8
  store i8 %conv6, i8* @_rl_parsing_conditionalized_out, align 1
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then4, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @parser_include(i8* %args) #0 {
entry:
  %retval = alloca i32, align 4
  %args.addr = alloca i8*, align 4
  %old_init_file = alloca i8*, align 4
  %e = alloca i8*, align 4
  %old_line_number = alloca i32, align 4
  %old_include_level = alloca i32, align 4
  %r = alloca i32, align 4
  store i8* %args, i8** %args.addr, align 4
  %0 = load i8, i8* @_rl_parsing_conditionalized_out, align 1
  %tobool = icmp ne i8 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** @current_readline_init_file, align 4
  store i8* %1, i8** %old_init_file, align 4
  %2 = load i32, i32* @current_readline_init_lineno, align 4
  store i32 %2, i32* %old_line_number, align 4
  %3 = load i32, i32* @current_readline_init_include_level, align 4
  store i32 %3, i32* %old_include_level, align 4
  %4 = load i8*, i8** %args.addr, align 4
  %call = call i8* @strchr(i8* %4, i32 10)
  store i8* %call, i8** %e, align 4
  %5 = load i8*, i8** %e, align 4
  %tobool1 = icmp ne i8* %5, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %6 = load i8*, i8** %e, align 4
  store i8 0, i8* %6, align 1
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %7 = load i8*, i8** %args.addr, align 4
  %8 = load i32, i32* %old_include_level, align 4
  %add = add nsw i32 %8, 1
  %call4 = call i32 @_rl_read_init_file(i8* %7, i32 %add)
  store i32 %call4, i32* %r, align 4
  %9 = load i8*, i8** %old_init_file, align 4
  store i8* %9, i8** @current_readline_init_file, align 4
  %10 = load i32, i32* %old_line_number, align 4
  store i32 %10, i32* @current_readline_init_lineno, align 4
  %11 = load i32, i32* %old_include_level, align 4
  store i32 %11, i32* @current_readline_init_include_level, align 4
  %12 = load i32, i32* %r, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @strncasecmp(i8*, i8*, i32) #1

declare i8* @strchr(i8*, i32) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

declare i32 @vfprintf(%struct._IO_FILE*, i8*, i32*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: noinline nounwind
define internal i32 @sv_bell_style(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* @_rl_bell_preference, align 4
  br label %if.end27

if.else:                                          ; preds = %lor.lhs.false
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strcasecmp(i8* %3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i32 0, i32 0))
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %if.then9, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %if.else
  %4 = load i8*, i8** %value.addr, align 4
  %call6 = call i32 @strcasecmp(i8* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0))
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %if.then9, label %if.else10

if.then9:                                         ; preds = %lor.lhs.false5, %if.else
  store i32 0, i32* @_rl_bell_preference, align 4
  br label %if.end26

if.else10:                                        ; preds = %lor.lhs.false5
  %5 = load i8*, i8** %value.addr, align 4
  %call11 = call i32 @strcasecmp(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.95, i32 0, i32 0))
  %cmp12 = icmp eq i32 %call11, 0
  br i1 %cmp12, label %if.then18, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %if.else10
  %6 = load i8*, i8** %value.addr, align 4
  %call15 = call i32 @strcasecmp(i8* %6, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0))
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.else19

if.then18:                                        ; preds = %lor.lhs.false14, %if.else10
  store i32 1, i32* @_rl_bell_preference, align 4
  br label %if.end25

if.else19:                                        ; preds = %lor.lhs.false14
  %7 = load i8*, i8** %value.addr, align 4
  %call20 = call i32 @strcasecmp(i8* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.96, i32 0, i32 0))
  %cmp21 = icmp eq i32 %call20, 0
  br i1 %cmp21, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else19
  store i32 2, i32* @_rl_bell_preference, align 4
  br label %if.end

if.else24:                                        ; preds = %if.else19
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then23
  br label %if.end25

if.end25:                                         ; preds = %if.end, %if.then18
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then9
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end27, %if.else24
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @sv_combegin(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end6

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** @_rl_comment_begin, align 4
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** @_rl_comment_begin, align 4
  call void @free(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %add = add i32 1, %call
  %call4 = call i8* @xmalloc(i32 %add)
  %6 = load i8*, i8** %value.addr, align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %6)
  store i8* %call5, i8** @_rl_comment_begin, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %land.lhs.true, %entry
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.end
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define internal i32 @sv_compwidth(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  %nval = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 -1, i32* %nval, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @atoi(i8* %3)
  store i32 %call, i32* %nval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %4 = load i32, i32* %nval, align 4
  store i32 %4, i32* @_rl_completion_columns, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @sv_dispprefix(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  %nval = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 0, i32* %nval, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @atoi(i8* %3)
  store i32 %call, i32* %nval, align 4
  %4 = load i32, i32* %nval, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* %nval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  %5 = load i32, i32* %nval, align 4
  store i32 %5, i32* @_rl_completion_prefix_display_length, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @sv_compquery(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  %nval = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 100, i32* %nval, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @atoi(i8* %3)
  store i32 %call, i32* %nval, align 4
  %4 = load i32, i32* %nval, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* %nval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  %5 = load i32, i32* %nval, align 4
  store i32 %5, i32* @rl_completion_query_items, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @sv_editmode(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strncasecmp(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i32 2)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  store i32 0, i32* @rl_editing_mode, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %call1 = call i32 @strncasecmp(i8* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0), i32 5)
  %cmp2 = icmp eq i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  store i32 1, i32* @rl_editing_mode, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define internal i32 @sv_emacs_modestr(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** @_rl_emacs_mode_str, align 4
  call void @free(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %mul = mul i32 2, %call
  %add = add i32 %mul, 1
  %call4 = call i8* @xmalloc(i32 %add)
  store i8* %call4, i8** @_rl_emacs_mode_str, align 4
  %6 = load i8*, i8** %value.addr, align 4
  %7 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %call5 = call i32 @rl_translate_keyseq(i8* %6, i8* %7, i32* @_rl_emacs_modestr_len)
  %8 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %9 = load i32, i32* @_rl_emacs_modestr_len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %10 = load i8*, i8** %value.addr, align 4
  %tobool6 = icmp ne i8* %10, null
  br i1 %tobool6, label %if.then7, label %if.else13

if.then7:                                         ; preds = %if.else
  %11 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %tobool8 = icmp ne i8* %11, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %12 = load i8*, i8** @_rl_emacs_mode_str, align 4
  call void @free(i8* %12)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  %call11 = call i8* @xmalloc(i32 1)
  store i8* %call11, i8** @_rl_emacs_mode_str, align 4
  %13 = load i8*, i8** @_rl_emacs_mode_str, align 4
  store i32 0, i32* @_rl_emacs_modestr_len, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %13, i32 0
  store i8 0, i8* %arrayidx12, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.else13:                                        ; preds = %if.else
  %14 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %14, null
  br i1 %cmp, label %if.then15, label %if.end19

if.then15:                                        ; preds = %if.else13
  %15 = load i8*, i8** @_rl_emacs_mode_str, align 4
  %tobool16 = icmp ne i8* %15, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.then15
  %16 = load i8*, i8** @_rl_emacs_mode_str, align 4
  call void @free(i8* %16)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.then15
  store i8* null, i8** @_rl_emacs_mode_str, align 4
  store i32 0, i32* @_rl_emacs_modestr_len, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.else13
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  br label %if.end21

if.end21:                                         ; preds = %if.end20
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.end18, %if.end10, %if.end
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define internal i32 @sv_histsize(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  %nval = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 500, i32* %nval, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end5

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end5

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @atoi(i8* %3)
  store i32 %call, i32* %nval, align 4
  %4 = load i32, i32* %nval, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %call4 = call i32 @unstifle_history()
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end5

if.end5:                                          ; preds = %if.end, %land.lhs.true, %entry
  %5 = load i32, i32* %nval, align 4
  call void @stifle_history(i32 %5)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then3
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @sv_isrchterm(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  %beg = alloca i32, align 4
  %end = alloca i32, align 4
  %delim = alloca i32, align 4
  %v = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 1, %call
  %call1 = call i8* @xmalloc(i32 %add)
  %2 = load i8*, i8** %value.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %2)
  store i8* %call2, i8** %v, align 4
  %3 = load i8*, i8** @_rl_isearch_terminators, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i8*, i8** @_rl_isearch_terminators, align 4
  call void @free(i8* %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i8*, i8** %v, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv, 34
  br i1 %cmp5, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %7 = load i8*, i8** %v, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %8 to i32
  %cmp9 = icmp eq i32 %conv8, 39
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %lor.lhs.false, %if.end4
  %9 = load i8*, i8** %v, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %10 to i32
  store i32 %conv13, i32* %delim, align 4
  store i32 1, i32* %end, align 4
  store i32 1, i32* %beg, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then11
  %11 = load i8*, i8** %v, align 4
  %12 = load i32, i32* %end, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %13 to i32
  %tobool16 = icmp ne i32 %conv15, 0
  br i1 %tobool16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %14 = load i8*, i8** %v, align 4
  %15 = load i32, i32* %end, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %16 to i32
  %17 = load i32, i32* %delim, align 4
  %cmp19 = icmp ne i32 %conv18, %17
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %18 = phi i1 [ false, %for.cond ], [ %cmp19, %land.rhs ]
  br i1 %18, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %end, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %end, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  br label %if.end41

if.else:                                          ; preds = %lor.lhs.false
  store i32 0, i32* %end, align 4
  store i32 0, i32* %beg, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc38, %if.else
  %20 = load i8*, i8** %v, align 4
  %21 = load i32, i32* %end, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %22 to i32
  %tobool24 = icmp ne i32 %conv23, 0
  br i1 %tobool24, label %land.rhs25, label %land.end36

land.rhs25:                                       ; preds = %for.cond21
  %23 = load i8*, i8** %v, align 4
  %24 = load i32, i32* %end, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %25 to i32
  %cmp28 = icmp eq i32 %conv27, 32
  br i1 %cmp28, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs25
  %26 = load i8*, i8** %v, align 4
  %27 = load i32, i32* %end, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %26, i32 %27
  %28 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %28 to i32
  %cmp32 = icmp eq i32 %conv31, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs25
  %29 = phi i1 [ true, %land.rhs25 ], [ %cmp32, %lor.rhs ]
  %lor.ext = zext i1 %29 to i32
  %cmp34 = icmp eq i32 %lor.ext, 0
  br label %land.end36

land.end36:                                       ; preds = %lor.end, %for.cond21
  %30 = phi i1 [ false, %for.cond21 ], [ %cmp34, %lor.end ]
  br i1 %30, label %for.body37, label %for.end40

for.body37:                                       ; preds = %land.end36
  br label %for.inc38

for.inc38:                                        ; preds = %for.body37
  %31 = load i32, i32* %end, align 4
  %inc39 = add nsw i32 %31, 1
  store i32 %inc39, i32* %end, align 4
  br label %for.cond21

for.end40:                                        ; preds = %land.end36
  br label %if.end41

if.end41:                                         ; preds = %for.end40, %for.end
  %32 = load i8*, i8** %v, align 4
  %33 = load i32, i32* %end, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %32, i32 %33
  store i8 0, i8* %arrayidx42, align 1
  %34 = load i8*, i8** %v, align 4
  %call43 = call i32 @strlen(i8* %34)
  %mul = mul i32 2, %call43
  %add44 = add i32 %mul, 1
  %call45 = call i8* @xmalloc(i32 %add44)
  store i8* %call45, i8** @_rl_isearch_terminators, align 4
  %35 = load i8*, i8** %v, align 4
  %36 = load i32, i32* %beg, align 4
  %add.ptr = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i8*, i8** @_rl_isearch_terminators, align 4
  %call46 = call i32 @rl_translate_keyseq(i8* %add.ptr, i8* %37, i32* %end)
  %38 = load i8*, i8** @_rl_isearch_terminators, align 4
  %39 = load i32, i32* %end, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %38, i32 %39
  store i8 0, i8* %arrayidx47, align 1
  %40 = load i8*, i8** %v, align 4
  call void @xfree(i8* %40)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end41, %if.then
  %41 = load i32, i32* %retval, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind
define internal i32 @sv_keymap(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  %kmap = alloca %struct._keymap_entry*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %call = call %struct._keymap_entry* @rl_get_keymap_by_name(i8* %0)
  store %struct._keymap_entry* %call, %struct._keymap_entry** %kmap, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  %tobool = icmp ne %struct._keymap_entry* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  call void @rl_set_keymap(%struct._keymap_entry* %2)
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define internal i32 @sv_seqtimeout(i8* %value) #0 {
entry:
  %value.addr = alloca i8*, align 4
  %nval = alloca i32, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 0, i32* %nval, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** %value.addr, align 4
  %call = call i32 @atoi(i8* %3)
  store i32 %call, i32* %nval, align 4
  %4 = load i32, i32* %nval, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* %nval, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  %5 = load i32, i32* %nval, align 4
  store i32 %5, i32* @_rl_keyseq_timeout, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @sv_vicmd_modestr(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  call void @free(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %mul = mul i32 2, %call
  %add = add i32 %mul, 1
  %call4 = call i8* @xmalloc(i32 %add)
  store i8* %call4, i8** @_rl_vi_cmd_mode_str, align 4
  %6 = load i8*, i8** %value.addr, align 4
  %7 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %call5 = call i32 @rl_translate_keyseq(i8* %6, i8* %7, i32* @_rl_vi_cmd_modestr_len)
  %8 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %9 = load i32, i32* @_rl_vi_cmd_modestr_len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %10 = load i8*, i8** %value.addr, align 4
  %tobool6 = icmp ne i8* %10, null
  br i1 %tobool6, label %if.then7, label %if.else13

if.then7:                                         ; preds = %if.else
  %11 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %tobool8 = icmp ne i8* %11, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %12 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  call void @free(i8* %12)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  %call11 = call i8* @xmalloc(i32 1)
  store i8* %call11, i8** @_rl_vi_cmd_mode_str, align 4
  %13 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  store i32 0, i32* @_rl_vi_cmd_modestr_len, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %13, i32 0
  store i8 0, i8* %arrayidx12, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.else13:                                        ; preds = %if.else
  %14 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %14, null
  br i1 %cmp, label %if.then15, label %if.end19

if.then15:                                        ; preds = %if.else13
  %15 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  %tobool16 = icmp ne i8* %15, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.then15
  %16 = load i8*, i8** @_rl_vi_cmd_mode_str, align 4
  call void @free(i8* %16)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.then15
  store i8* null, i8** @_rl_vi_cmd_mode_str, align 4
  store i32 0, i32* @_rl_vi_cmd_modestr_len, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.else13
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  br label %if.end21

if.end21:                                         ; preds = %if.end20
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.end18, %if.end10, %if.end
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define internal i32 @sv_viins_modestr(i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i8*, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %value.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  call void @free(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strlen(i8* %5)
  %mul = mul i32 2, %call
  %add = add i32 %mul, 1
  %call4 = call i8* @xmalloc(i32 %add)
  store i8* %call4, i8** @_rl_vi_ins_mode_str, align 4
  %6 = load i8*, i8** %value.addr, align 4
  %7 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %call5 = call i32 @rl_translate_keyseq(i8* %6, i8* %7, i32* @_rl_vi_ins_modestr_len)
  %8 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %9 = load i32, i32* @_rl_vi_ins_modestr_len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %10 = load i8*, i8** %value.addr, align 4
  %tobool6 = icmp ne i8* %10, null
  br i1 %tobool6, label %if.then7, label %if.else13

if.then7:                                         ; preds = %if.else
  %11 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %tobool8 = icmp ne i8* %11, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %12 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  call void @free(i8* %12)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  %call11 = call i8* @xmalloc(i32 1)
  store i8* %call11, i8** @_rl_vi_ins_mode_str, align 4
  %13 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  store i32 0, i32* @_rl_vi_ins_modestr_len, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %13, i32 0
  store i8 0, i8* %arrayidx12, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.else13:                                        ; preds = %if.else
  %14 = load i8*, i8** %value.addr, align 4
  %cmp = icmp eq i8* %14, null
  br i1 %cmp, label %if.then15, label %if.end19

if.then15:                                        ; preds = %if.else13
  %15 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  %tobool16 = icmp ne i8* %15, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.then15
  %16 = load i8*, i8** @_rl_vi_ins_mode_str, align 4
  call void @free(i8* %16)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.then15
  store i8* null, i8** @_rl_vi_ins_mode_str, align 4
  store i32 0, i32* @_rl_vi_ins_modestr_len, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.else13
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  br label %if.end21

if.end21:                                         ; preds = %if.end20
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.end18, %if.end10, %if.end
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i32 @atoi(i8*) #1

declare i32 @unstifle_history() #1

declare void @stifle_history(i32) #1

declare void @_rl_enable_paren_matching(i32) #1

declare void @_rl_reset_prompt() #1

declare i32 @history_is_stifled() #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i8* @_rl_strindex(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
