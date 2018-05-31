; ModuleID = 'funmap.c'
source_filename = "funmap.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._funmap = type { i8*, i32 (i32, i32)* }

@funmap_entry = internal global i32 0, align 4
@funmap_size = internal global i32 0, align 4
@funmap = common global %struct._funmap** null, align 4
@funmap_initialized = internal global i32 0, align 4
@default_funmap = internal constant [137 x %struct._funmap] [%struct._funmap { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 (i32, i32)* @rl_abort }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 (i32, i32)* @rl_newline }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i32 (i32, i32)* @rl_arrow_keys }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 (i32, i32)* @rl_backward_byte }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i32 (i32, i32)* @rl_backward_char }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i32 0, i32 0), i32 (i32, i32)* @rl_rubout }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i32 0, i32 0), i32 (i32, i32)* @rl_backward_kill_line }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i32 0, i32 0), i32 (i32, i32)* @rl_backward_kill_word }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0), i32 (i32, i32)* @rl_backward_word }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i32 0, i32 0), i32 (i32, i32)* @rl_beginning_of_history }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.10, i32 0, i32 0), i32 (i32, i32)* @rl_beg_of_line }, %struct._funmap { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i32 0, i32 0), i32 (i32, i32)* @rl_bracketed_paste_begin }, %struct._funmap { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i32 0, i32 0), i32 (i32, i32)* @rl_call_last_kbd_macro }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.13, i32 0, i32 0), i32 (i32, i32)* @rl_capitalize_word }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i32 0, i32 0), i32 (i32, i32)* @rl_char_search }, %struct._funmap { i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.15, i32 0, i32 0), i32 (i32, i32)* @rl_backward_char_search }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.16, i32 0, i32 0), i32 (i32, i32)* @rl_clear_screen }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.17, i32 0, i32 0), i32 (i32, i32)* @rl_complete }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.18, i32 0, i32 0), i32 (i32, i32)* @rl_copy_backward_word }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.19, i32 0, i32 0), i32 (i32, i32)* @rl_copy_forward_word }, %struct._funmap { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.20, i32 0, i32 0), i32 (i32, i32)* @rl_copy_region_to_kill }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.21, i32 0, i32 0), i32 (i32, i32)* @rl_delete }, %struct._funmap { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.22, i32 0, i32 0), i32 (i32, i32)* @rl_delete_or_show_completions }, %struct._funmap { i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.23, i32 0, i32 0), i32 (i32, i32)* @rl_delete_horizontal_space }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.24, i32 0, i32 0), i32 (i32, i32)* @rl_digit_argument }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.25, i32 0, i32 0), i32 (i32, i32)* @rl_do_lowercase_version }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.26, i32 0, i32 0), i32 (i32, i32)* @rl_downcase_word }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i32 0, i32 0), i32 (i32, i32)* @rl_dump_functions }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.28, i32 0, i32 0), i32 (i32, i32)* @rl_dump_macros }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.29, i32 0, i32 0), i32 (i32, i32)* @rl_dump_variables }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.30, i32 0, i32 0), i32 (i32, i32)* @rl_emacs_editing_mode }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i32 0, i32 0), i32 (i32, i32)* @rl_end_kbd_macro }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.32, i32 0, i32 0), i32 (i32, i32)* @rl_end_of_history }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i32 0, i32 0), i32 (i32, i32)* @rl_end_of_line }, %struct._funmap { i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.34, i32 0, i32 0), i32 (i32, i32)* @rl_exchange_point_and_mark }, %struct._funmap { i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.35, i32 0, i32 0), i32 (i32, i32)* @rl_rubout_or_delete }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.36, i32 0, i32 0), i32 (i32, i32)* @rl_forward_byte }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.37, i32 0, i32 0), i32 (i32, i32)* @rl_forward_char }, %struct._funmap { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.38, i32 0, i32 0), i32 (i32, i32)* @rl_forward_search_history }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i32 0, i32 0), i32 (i32, i32)* @rl_forward_word }, %struct._funmap { i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.40, i32 0, i32 0), i32 (i32, i32)* @rl_history_search_backward }, %struct._funmap { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.41, i32 0, i32 0), i32 (i32, i32)* @rl_history_search_forward }, %struct._funmap { i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.42, i32 0, i32 0), i32 (i32, i32)* @rl_history_substr_search_backward }, %struct._funmap { i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.43, i32 0, i32 0), i32 (i32, i32)* @rl_history_substr_search_forward }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.44, i32 0, i32 0), i32 (i32, i32)* @rl_insert_comment }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.45, i32 0, i32 0), i32 (i32, i32)* @rl_insert_completions }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.46, i32 0, i32 0), i32 (i32, i32)* @rl_kill_full_line }, %struct._funmap { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.47, i32 0, i32 0), i32 (i32, i32)* @rl_kill_line }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.48, i32 0, i32 0), i32 (i32, i32)* @rl_kill_region }, %struct._funmap { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.49, i32 0, i32 0), i32 (i32, i32)* @rl_kill_word }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.50, i32 0, i32 0), i32 (i32, i32)* @rl_menu_complete }, %struct._funmap { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.51, i32 0, i32 0), i32 (i32, i32)* @rl_backward_menu_complete }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.52, i32 0, i32 0), i32 (i32, i32)* @rl_get_next_history }, %struct._funmap { i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.53, i32 0, i32 0), i32 (i32, i32)* @rl_noninc_forward_search }, %struct._funmap { i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.54, i32 0, i32 0), i32 (i32, i32)* @rl_noninc_reverse_search }, %struct._funmap { i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.55, i32 0, i32 0), i32 (i32, i32)* @rl_noninc_forward_search_again }, %struct._funmap { i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.56, i32 0, i32 0), i32 (i32, i32)* @rl_noninc_reverse_search_again }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.57, i32 0, i32 0), i32 (i32, i32)* @rl_old_menu_complete }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.58, i32 0, i32 0), i32 (i32, i32)* @rl_overwrite_mode }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.59, i32 0, i32 0), i32 (i32, i32)* @rl_possible_completions }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.60, i32 0, i32 0), i32 (i32, i32)* @rl_get_previous_history }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.61, i32 0, i32 0), i32 (i32, i32)* @rl_print_last_kbd_macro }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.62, i32 0, i32 0), i32 (i32, i32)* @rl_quoted_insert }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.63, i32 0, i32 0), i32 (i32, i32)* @rl_re_read_init_file }, %struct._funmap { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.64, i32 0, i32 0), i32 (i32, i32)* @rl_refresh_line }, %struct._funmap { i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.65, i32 0, i32 0), i32 (i32, i32)* @rl_reverse_search_history }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.66, i32 0, i32 0), i32 (i32, i32)* @rl_revert_line }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.67, i32 0, i32 0), i32 (i32, i32)* @rl_insert }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.68, i32 0, i32 0), i32 (i32, i32)* @rl_set_mark }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.69, i32 0, i32 0), i32 (i32, i32)* @rl_skip_csi_sequence }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.70, i32 0, i32 0), i32 (i32, i32)* @rl_start_kbd_macro }, %struct._funmap { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.71, i32 0, i32 0), i32 (i32, i32)* @rl_tab_insert }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.72, i32 0, i32 0), i32 (i32, i32)* @rl_tilde_expand }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.73, i32 0, i32 0), i32 (i32, i32)* @rl_transpose_chars }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.74, i32 0, i32 0), i32 (i32, i32)* @rl_transpose_words }, %struct._funmap { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.75, i32 0, i32 0), i32 (i32, i32)* @rl_tty_status }, %struct._funmap { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.76, i32 0, i32 0), i32 (i32, i32)* @rl_undo_command }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.77, i32 0, i32 0), i32 (i32, i32)* @rl_universal_argument }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.78, i32 0, i32 0), i32 (i32, i32)* @rl_unix_filename_rubout }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.79, i32 0, i32 0), i32 (i32, i32)* @rl_unix_line_discard }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.80, i32 0, i32 0), i32 (i32, i32)* @rl_unix_word_rubout }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.81, i32 0, i32 0), i32 (i32, i32)* @rl_upcase_word }, %struct._funmap { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.82, i32 0, i32 0), i32 (i32, i32)* @rl_yank }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.83, i32 0, i32 0), i32 (i32, i32)* @rl_yank_last_arg }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.84, i32 0, i32 0), i32 (i32, i32)* @rl_yank_nth_arg }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i32 (i32, i32)* @rl_yank_pop }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.86, i32 0, i32 0), i32 (i32, i32)* @rl_vi_append_eol }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.87, i32 0, i32 0), i32 (i32, i32)* @rl_vi_append_mode }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.88, i32 0, i32 0), i32 (i32, i32)* @rl_vi_arg_digit }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.89, i32 0, i32 0), i32 (i32, i32)* @rl_vi_back_to_indent }, %struct._funmap { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.90, i32 0, i32 0), i32 (i32, i32)* @rl_vi_bWord }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.91, i32 0, i32 0), i32 (i32, i32)* @rl_vi_bword }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.92, i32 0, i32 0), i32 (i32, i32)* @rl_vi_bWord }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.93, i32 0, i32 0), i32 (i32, i32)* @rl_vi_bword }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.94, i32 0, i32 0), i32 (i32, i32)* @rl_vi_change_case }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.95, i32 0, i32 0), i32 (i32, i32)* @rl_vi_change_char }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.96, i32 0, i32 0), i32 (i32, i32)* @rl_vi_change_to }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.97, i32 0, i32 0), i32 (i32, i32)* @rl_vi_char_search }, %struct._funmap { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.98, i32 0, i32 0), i32 (i32, i32)* @rl_vi_column }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.99, i32 0, i32 0), i32 (i32, i32)* @rl_vi_complete }, %struct._funmap { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.100, i32 0, i32 0), i32 (i32, i32)* @rl_vi_delete }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.101, i32 0, i32 0), i32 (i32, i32)* @rl_vi_delete_to }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.102, i32 0, i32 0), i32 (i32, i32)* @rl_vi_eWord }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.103, i32 0, i32 0), i32 (i32, i32)* @rl_vi_editing_mode }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.104, i32 0, i32 0), i32 (i32, i32)* @rl_vi_eWord }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.105, i32 0, i32 0), i32 (i32, i32)* @rl_vi_end_word }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.106, i32 0, i32 0), i32 (i32, i32)* @rl_vi_eof_maybe }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.107, i32 0, i32 0), i32 (i32, i32)* @rl_vi_eword }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.108, i32 0, i32 0), i32 (i32, i32)* @rl_vi_fWord }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.109, i32 0, i32 0), i32 (i32, i32)* @rl_vi_fetch_history }, %struct._funmap { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.110, i32 0, i32 0), i32 (i32, i32)* @rl_vi_first_print }, %struct._funmap { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.111, i32 0, i32 0), i32 (i32, i32)* @rl_vi_fWord }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.112, i32 0, i32 0), i32 (i32, i32)* @rl_vi_fword }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.113, i32 0, i32 0), i32 (i32, i32)* @rl_vi_fword }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.114, i32 0, i32 0), i32 (i32, i32)* @rl_vi_goto_mark }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.115, i32 0, i32 0), i32 (i32, i32)* @rl_vi_insert_beg }, %struct._funmap { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.116, i32 0, i32 0), i32 (i32, i32)* @rl_vi_insert_mode }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.117, i32 0, i32 0), i32 (i32, i32)* @rl_vi_match }, %struct._funmap { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.118, i32 0, i32 0), i32 (i32, i32)* @rl_vi_movement_mode }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.119, i32 0, i32 0), i32 (i32, i32)* @rl_vi_next_word }, %struct._funmap { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.120, i32 0, i32 0), i32 (i32, i32)* @rl_vi_overstrike }, %struct._funmap { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.121, i32 0, i32 0), i32 (i32, i32)* @rl_vi_overstrike_delete }, %struct._funmap { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.122, i32 0, i32 0), i32 (i32, i32)* @rl_vi_prev_word }, %struct._funmap { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.123, i32 0, i32 0), i32 (i32, i32)* @rl_vi_put }, %struct._funmap { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.124, i32 0, i32 0), i32 (i32, i32)* @rl_vi_redo }, %struct._funmap { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.125, i32 0, i32 0), i32 (i32, i32)* @rl_vi_replace }, %struct._funmap { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.126, i32 0, i32 0), i32 (i32, i32)* @rl_vi_rubout }, %struct._funmap { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.127, i32 0, i32 0), i32 (i32, i32)* @rl_vi_search }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.128, i32 0, i32 0), i32 (i32, i32)* @rl_vi_search_again }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.129, i32 0, i32 0), i32 (i32, i32)* @rl_vi_set_mark }, %struct._funmap { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.130, i32 0, i32 0), i32 (i32, i32)* @rl_vi_subst }, %struct._funmap { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.131, i32 0, i32 0), i32 (i32, i32)* @rl_vi_tilde_expand }, %struct._funmap { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.132, i32 0, i32 0), i32 (i32, i32)* @rl_vi_unix_word_rubout }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.133, i32 0, i32 0), i32 (i32, i32)* @rl_vi_yank_arg }, %struct._funmap { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.134, i32 0, i32 0), i32 (i32, i32)* @rl_vi_yank_pop }, %struct._funmap { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.135, i32 0, i32 0), i32 (i32, i32)* @rl_vi_yank_to }, %struct._funmap zeroinitializer], align 4
@funmap_program_specific_entry_start = common global i32 0, align 4
@.str = private unnamed_addr constant [6 x i8] c"abort\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"accept-line\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"arrow-key-prefix\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"backward-byte\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"backward-char\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"backward-delete-char\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"backward-kill-line\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"backward-kill-word\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"backward-word\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"beginning-of-history\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"beginning-of-line\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"bracketed-paste-begin\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"call-last-kbd-macro\00", align 1
@.str.13 = private unnamed_addr constant [16 x i8] c"capitalize-word\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"character-search\00", align 1
@.str.15 = private unnamed_addr constant [26 x i8] c"character-search-backward\00", align 1
@.str.16 = private unnamed_addr constant [13 x i8] c"clear-screen\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"complete\00", align 1
@.str.18 = private unnamed_addr constant [19 x i8] c"copy-backward-word\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c"copy-forward-word\00", align 1
@.str.20 = private unnamed_addr constant [20 x i8] c"copy-region-as-kill\00", align 1
@.str.21 = private unnamed_addr constant [12 x i8] c"delete-char\00", align 1
@.str.22 = private unnamed_addr constant [20 x i8] c"delete-char-or-list\00", align 1
@.str.23 = private unnamed_addr constant [24 x i8] c"delete-horizontal-space\00", align 1
@.str.24 = private unnamed_addr constant [15 x i8] c"digit-argument\00", align 1
@.str.25 = private unnamed_addr constant [21 x i8] c"do-lowercase-version\00", align 1
@.str.26 = private unnamed_addr constant [14 x i8] c"downcase-word\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"dump-functions\00", align 1
@.str.28 = private unnamed_addr constant [12 x i8] c"dump-macros\00", align 1
@.str.29 = private unnamed_addr constant [15 x i8] c"dump-variables\00", align 1
@.str.30 = private unnamed_addr constant [19 x i8] c"emacs-editing-mode\00", align 1
@.str.31 = private unnamed_addr constant [14 x i8] c"end-kbd-macro\00", align 1
@.str.32 = private unnamed_addr constant [15 x i8] c"end-of-history\00", align 1
@.str.33 = private unnamed_addr constant [12 x i8] c"end-of-line\00", align 1
@.str.34 = private unnamed_addr constant [24 x i8] c"exchange-point-and-mark\00", align 1
@.str.35 = private unnamed_addr constant [29 x i8] c"forward-backward-delete-char\00", align 1
@.str.36 = private unnamed_addr constant [13 x i8] c"forward-byte\00", align 1
@.str.37 = private unnamed_addr constant [13 x i8] c"forward-char\00", align 1
@.str.38 = private unnamed_addr constant [23 x i8] c"forward-search-history\00", align 1
@.str.39 = private unnamed_addr constant [13 x i8] c"forward-word\00", align 1
@.str.40 = private unnamed_addr constant [24 x i8] c"history-search-backward\00", align 1
@.str.41 = private unnamed_addr constant [23 x i8] c"history-search-forward\00", align 1
@.str.42 = private unnamed_addr constant [34 x i8] c"history-substring-search-backward\00", align 1
@.str.43 = private unnamed_addr constant [33 x i8] c"history-substring-search-forward\00", align 1
@.str.44 = private unnamed_addr constant [15 x i8] c"insert-comment\00", align 1
@.str.45 = private unnamed_addr constant [19 x i8] c"insert-completions\00", align 1
@.str.46 = private unnamed_addr constant [16 x i8] c"kill-whole-line\00", align 1
@.str.47 = private unnamed_addr constant [10 x i8] c"kill-line\00", align 1
@.str.48 = private unnamed_addr constant [12 x i8] c"kill-region\00", align 1
@.str.49 = private unnamed_addr constant [10 x i8] c"kill-word\00", align 1
@.str.50 = private unnamed_addr constant [14 x i8] c"menu-complete\00", align 1
@.str.51 = private unnamed_addr constant [23 x i8] c"menu-complete-backward\00", align 1
@.str.52 = private unnamed_addr constant [13 x i8] c"next-history\00", align 1
@.str.53 = private unnamed_addr constant [39 x i8] c"non-incremental-forward-search-history\00", align 1
@.str.54 = private unnamed_addr constant [39 x i8] c"non-incremental-reverse-search-history\00", align 1
@.str.55 = private unnamed_addr constant [45 x i8] c"non-incremental-forward-search-history-again\00", align 1
@.str.56 = private unnamed_addr constant [45 x i8] c"non-incremental-reverse-search-history-again\00", align 1
@.str.57 = private unnamed_addr constant [18 x i8] c"old-menu-complete\00", align 1
@.str.58 = private unnamed_addr constant [15 x i8] c"overwrite-mode\00", align 1
@.str.59 = private unnamed_addr constant [21 x i8] c"possible-completions\00", align 1
@.str.60 = private unnamed_addr constant [17 x i8] c"previous-history\00", align 1
@.str.61 = private unnamed_addr constant [21 x i8] c"print-last-kbd-macro\00", align 1
@.str.62 = private unnamed_addr constant [14 x i8] c"quoted-insert\00", align 1
@.str.63 = private unnamed_addr constant [18 x i8] c"re-read-init-file\00", align 1
@.str.64 = private unnamed_addr constant [20 x i8] c"redraw-current-line\00", align 1
@.str.65 = private unnamed_addr constant [23 x i8] c"reverse-search-history\00", align 1
@.str.66 = private unnamed_addr constant [12 x i8] c"revert-line\00", align 1
@.str.67 = private unnamed_addr constant [12 x i8] c"self-insert\00", align 1
@.str.68 = private unnamed_addr constant [9 x i8] c"set-mark\00", align 1
@.str.69 = private unnamed_addr constant [18 x i8] c"skip-csi-sequence\00", align 1
@.str.70 = private unnamed_addr constant [16 x i8] c"start-kbd-macro\00", align 1
@.str.71 = private unnamed_addr constant [11 x i8] c"tab-insert\00", align 1
@.str.72 = private unnamed_addr constant [13 x i8] c"tilde-expand\00", align 1
@.str.73 = private unnamed_addr constant [16 x i8] c"transpose-chars\00", align 1
@.str.74 = private unnamed_addr constant [16 x i8] c"transpose-words\00", align 1
@.str.75 = private unnamed_addr constant [11 x i8] c"tty-status\00", align 1
@.str.76 = private unnamed_addr constant [5 x i8] c"undo\00", align 1
@.str.77 = private unnamed_addr constant [19 x i8] c"universal-argument\00", align 1
@.str.78 = private unnamed_addr constant [21 x i8] c"unix-filename-rubout\00", align 1
@.str.79 = private unnamed_addr constant [18 x i8] c"unix-line-discard\00", align 1
@.str.80 = private unnamed_addr constant [17 x i8] c"unix-word-rubout\00", align 1
@.str.81 = private unnamed_addr constant [12 x i8] c"upcase-word\00", align 1
@.str.82 = private unnamed_addr constant [5 x i8] c"yank\00", align 1
@.str.83 = private unnamed_addr constant [14 x i8] c"yank-last-arg\00", align 1
@.str.84 = private unnamed_addr constant [13 x i8] c"yank-nth-arg\00", align 1
@.str.85 = private unnamed_addr constant [9 x i8] c"yank-pop\00", align 1
@.str.86 = private unnamed_addr constant [14 x i8] c"vi-append-eol\00", align 1
@.str.87 = private unnamed_addr constant [15 x i8] c"vi-append-mode\00", align 1
@.str.88 = private unnamed_addr constant [13 x i8] c"vi-arg-digit\00", align 1
@.str.89 = private unnamed_addr constant [18 x i8] c"vi-back-to-indent\00", align 1
@.str.90 = private unnamed_addr constant [20 x i8] c"vi-backward-bigword\00", align 1
@.str.91 = private unnamed_addr constant [17 x i8] c"vi-backward-word\00", align 1
@.str.92 = private unnamed_addr constant [9 x i8] c"vi-bWord\00", align 1
@.str.93 = private unnamed_addr constant [9 x i8] c"vi-bword\00", align 1
@.str.94 = private unnamed_addr constant [15 x i8] c"vi-change-case\00", align 1
@.str.95 = private unnamed_addr constant [15 x i8] c"vi-change-char\00", align 1
@.str.96 = private unnamed_addr constant [13 x i8] c"vi-change-to\00", align 1
@.str.97 = private unnamed_addr constant [15 x i8] c"vi-char-search\00", align 1
@.str.98 = private unnamed_addr constant [10 x i8] c"vi-column\00", align 1
@.str.99 = private unnamed_addr constant [12 x i8] c"vi-complete\00", align 1
@.str.100 = private unnamed_addr constant [10 x i8] c"vi-delete\00", align 1
@.str.101 = private unnamed_addr constant [13 x i8] c"vi-delete-to\00", align 1
@.str.102 = private unnamed_addr constant [9 x i8] c"vi-eWord\00", align 1
@.str.103 = private unnamed_addr constant [16 x i8] c"vi-editing-mode\00", align 1
@.str.104 = private unnamed_addr constant [15 x i8] c"vi-end-bigword\00", align 1
@.str.105 = private unnamed_addr constant [12 x i8] c"vi-end-word\00", align 1
@.str.106 = private unnamed_addr constant [13 x i8] c"vi-eof-maybe\00", align 1
@.str.107 = private unnamed_addr constant [9 x i8] c"vi-eword\00", align 1
@.str.108 = private unnamed_addr constant [9 x i8] c"vi-fWord\00", align 1
@.str.109 = private unnamed_addr constant [17 x i8] c"vi-fetch-history\00", align 1
@.str.110 = private unnamed_addr constant [15 x i8] c"vi-first-print\00", align 1
@.str.111 = private unnamed_addr constant [19 x i8] c"vi-forward-bigword\00", align 1
@.str.112 = private unnamed_addr constant [16 x i8] c"vi-forward-word\00", align 1
@.str.113 = private unnamed_addr constant [9 x i8] c"vi-fword\00", align 1
@.str.114 = private unnamed_addr constant [13 x i8] c"vi-goto-mark\00", align 1
@.str.115 = private unnamed_addr constant [14 x i8] c"vi-insert-beg\00", align 1
@.str.116 = private unnamed_addr constant [18 x i8] c"vi-insertion-mode\00", align 1
@.str.117 = private unnamed_addr constant [9 x i8] c"vi-match\00", align 1
@.str.118 = private unnamed_addr constant [17 x i8] c"vi-movement-mode\00", align 1
@.str.119 = private unnamed_addr constant [13 x i8] c"vi-next-word\00", align 1
@.str.120 = private unnamed_addr constant [14 x i8] c"vi-overstrike\00", align 1
@.str.121 = private unnamed_addr constant [21 x i8] c"vi-overstrike-delete\00", align 1
@.str.122 = private unnamed_addr constant [13 x i8] c"vi-prev-word\00", align 1
@.str.123 = private unnamed_addr constant [7 x i8] c"vi-put\00", align 1
@.str.124 = private unnamed_addr constant [8 x i8] c"vi-redo\00", align 1
@.str.125 = private unnamed_addr constant [11 x i8] c"vi-replace\00", align 1
@.str.126 = private unnamed_addr constant [10 x i8] c"vi-rubout\00", align 1
@.str.127 = private unnamed_addr constant [10 x i8] c"vi-search\00", align 1
@.str.128 = private unnamed_addr constant [16 x i8] c"vi-search-again\00", align 1
@.str.129 = private unnamed_addr constant [12 x i8] c"vi-set-mark\00", align 1
@.str.130 = private unnamed_addr constant [9 x i8] c"vi-subst\00", align 1
@.str.131 = private unnamed_addr constant [16 x i8] c"vi-tilde-expand\00", align 1
@.str.132 = private unnamed_addr constant [20 x i8] c"vi-unix-word-rubout\00", align 1
@.str.133 = private unnamed_addr constant [12 x i8] c"vi-yank-arg\00", align 1
@.str.134 = private unnamed_addr constant [12 x i8] c"vi-yank-pop\00", align 1
@.str.135 = private unnamed_addr constant [11 x i8] c"vi-yank-to\00", align 1

; Function Attrs: noinline nounwind
define i32 @rl_add_funmap_entry(i8* %name, i32 (i32, i32)* %function) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %function.addr = alloca i32 (i32, i32)*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 (i32, i32)* %function, i32 (i32, i32)** %function.addr, align 4
  %0 = load i32, i32* @funmap_entry, align 4
  %add = add nsw i32 %0, 2
  %1 = load i32, i32* @funmap_size, align 4
  %cmp = icmp sge i32 %add, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @funmap_size, align 4
  %add1 = add nsw i32 %2, 64
  store i32 %add1, i32* @funmap_size, align 4
  %3 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %4 = bitcast %struct._funmap** %3 to i8*
  %5 = load i32, i32* @funmap_size, align 4
  %mul = mul i32 %5, 4
  %call = call i8* @xrealloc(i8* %4, i32 %mul)
  %6 = bitcast i8* %call to %struct._funmap**
  store %struct._funmap** %6, %struct._funmap*** @funmap, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i8* @xmalloc(i32 8)
  %7 = bitcast i8* %call2 to %struct._funmap*
  %8 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %9 = load i32, i32* @funmap_entry, align 4
  %arrayidx = getelementptr inbounds %struct._funmap*, %struct._funmap** %8, i32 %9
  store %struct._funmap* %7, %struct._funmap** %arrayidx, align 4
  %10 = load i8*, i8** %name.addr, align 4
  %11 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %12 = load i32, i32* @funmap_entry, align 4
  %arrayidx3 = getelementptr inbounds %struct._funmap*, %struct._funmap** %11, i32 %12
  %13 = load %struct._funmap*, %struct._funmap** %arrayidx3, align 4
  %name4 = getelementptr inbounds %struct._funmap, %struct._funmap* %13, i32 0, i32 0
  store i8* %10, i8** %name4, align 4
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %function.addr, align 4
  %15 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %16 = load i32, i32* @funmap_entry, align 4
  %arrayidx5 = getelementptr inbounds %struct._funmap*, %struct._funmap** %15, i32 %16
  %17 = load %struct._funmap*, %struct._funmap** %arrayidx5, align 4
  %function6 = getelementptr inbounds %struct._funmap, %struct._funmap* %17, i32 0, i32 1
  store i32 (i32, i32)* %14, i32 (i32, i32)** %function6, align 4
  %18 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %19 = load i32, i32* @funmap_entry, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* @funmap_entry, align 4
  %arrayidx7 = getelementptr inbounds %struct._funmap*, %struct._funmap** %18, i32 %inc
  store %struct._funmap* null, %struct._funmap** %arrayidx7, align 4
  %20 = load i32, i32* @funmap_entry, align 4
  ret i32 %20
}

declare i8* @xrealloc(i8*, i32) #1

declare i8* @xmalloc(i32) #1

; Function Attrs: noinline nounwind
define void @rl_initialize_funmap() #0 {
entry:
  %i = alloca i32, align 4
  %0 = load i32, i32* @funmap_initialized, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [137 x %struct._funmap], [137 x %struct._funmap]* @default_funmap, i32 0, i32 %1
  %name = getelementptr inbounds %struct._funmap, %struct._funmap* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [137 x %struct._funmap], [137 x %struct._funmap]* @default_funmap, i32 0, i32 %3
  %name3 = getelementptr inbounds %struct._funmap, %struct._funmap* %arrayidx2, i32 0, i32 0
  %4 = load i8*, i8** %name3, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [137 x %struct._funmap], [137 x %struct._funmap]* @default_funmap, i32 0, i32 %5
  %function = getelementptr inbounds %struct._funmap, %struct._funmap* %arrayidx4, i32 0, i32 1
  %6 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %call = call i32 @rl_add_funmap_entry(i8* %4, i32 (i32, i32)* %6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* @funmap_initialized, align 4
  %8 = load i32, i32* %i, align 4
  store i32 %8, i32* @funmap_program_specific_entry_start, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i8** @rl_funmap_names() #0 {
entry:
  %result = alloca i8**, align 4
  %result_size = alloca i32, align 4
  %result_index = alloca i32, align 4
  call void @rl_initialize_funmap()
  store i32 0, i32* %result_size, align 4
  store i32 0, i32* %result_index, align 4
  store i8** null, i8*** %result, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %1 = load i32, i32* %result_index, align 4
  %arrayidx = getelementptr inbounds %struct._funmap*, %struct._funmap** %0, i32 %1
  %2 = load %struct._funmap*, %struct._funmap** %arrayidx, align 4
  %tobool = icmp ne %struct._funmap* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %result_index, align 4
  %add = add nsw i32 %3, 2
  %4 = load i32, i32* %result_size, align 4
  %cmp = icmp sgt i32 %add, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %result_size, align 4
  %add1 = add nsw i32 %5, 20
  store i32 %add1, i32* %result_size, align 4
  %6 = load i8**, i8*** %result, align 4
  %7 = bitcast i8** %6 to i8*
  %8 = load i32, i32* %result_size, align 4
  %mul = mul i32 %8, 4
  %call = call i8* @xrealloc(i8* %7, i32 %mul)
  %9 = bitcast i8* %call to i8**
  store i8** %9, i8*** %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %10 = load %struct._funmap**, %struct._funmap*** @funmap, align 4
  %11 = load i32, i32* %result_index, align 4
  %arrayidx2 = getelementptr inbounds %struct._funmap*, %struct._funmap** %10, i32 %11
  %12 = load %struct._funmap*, %struct._funmap** %arrayidx2, align 4
  %name = getelementptr inbounds %struct._funmap, %struct._funmap* %12, i32 0, i32 0
  %13 = load i8*, i8** %name, align 4
  %14 = load i8**, i8*** %result, align 4
  %15 = load i32, i32* %result_index, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %14, i32 %15
  store i8* %13, i8** %arrayidx3, align 4
  %16 = load i8**, i8*** %result, align 4
  %17 = load i32, i32* %result_index, align 4
  %add4 = add nsw i32 %17, 1
  %arrayidx5 = getelementptr inbounds i8*, i8** %16, i32 %add4
  store i8* null, i8** %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %18 = load i32, i32* %result_index, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %result_index, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load i8**, i8*** %result, align 4
  %20 = bitcast i8** %19 to i8*
  %21 = load i32, i32* %result_index, align 4
  call void @qsort(i8* %20, i32 %21, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @_rl_qsort_string_compare to i32 (i8*, i8*)*))
  %22 = load i8**, i8*** %result, align 4
  ret i8** %22
}

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

declare i32 @_rl_qsort_string_compare(i8**, i8**) #1

declare i32 @rl_abort(i32, i32) #1

declare i32 @rl_newline(i32, i32) #1

declare i32 @rl_arrow_keys(i32, i32) #1

declare i32 @rl_backward_byte(i32, i32) #1

declare i32 @rl_backward_char(i32, i32) #1

declare i32 @rl_rubout(i32, i32) #1

declare i32 @rl_backward_kill_line(i32, i32) #1

declare i32 @rl_backward_kill_word(i32, i32) #1

declare i32 @rl_backward_word(i32, i32) #1

declare i32 @rl_beginning_of_history(i32, i32) #1

declare i32 @rl_beg_of_line(i32, i32) #1

declare i32 @rl_bracketed_paste_begin(i32, i32) #1

declare i32 @rl_call_last_kbd_macro(i32, i32) #1

declare i32 @rl_capitalize_word(i32, i32) #1

declare i32 @rl_char_search(i32, i32) #1

declare i32 @rl_backward_char_search(i32, i32) #1

declare i32 @rl_clear_screen(i32, i32) #1

declare i32 @rl_complete(i32, i32) #1

declare i32 @rl_copy_backward_word(i32, i32) #1

declare i32 @rl_copy_forward_word(i32, i32) #1

declare i32 @rl_copy_region_to_kill(i32, i32) #1

declare i32 @rl_delete(i32, i32) #1

declare i32 @rl_delete_or_show_completions(i32, i32) #1

declare i32 @rl_delete_horizontal_space(i32, i32) #1

declare i32 @rl_digit_argument(i32, i32) #1

declare i32 @rl_do_lowercase_version(i32, i32) #1

declare i32 @rl_downcase_word(i32, i32) #1

declare i32 @rl_dump_functions(i32, i32) #1

declare i32 @rl_dump_macros(i32, i32) #1

declare i32 @rl_dump_variables(i32, i32) #1

declare i32 @rl_emacs_editing_mode(i32, i32) #1

declare i32 @rl_end_kbd_macro(i32, i32) #1

declare i32 @rl_end_of_history(i32, i32) #1

declare i32 @rl_end_of_line(i32, i32) #1

declare i32 @rl_exchange_point_and_mark(i32, i32) #1

declare i32 @rl_rubout_or_delete(i32, i32) #1

declare i32 @rl_forward_byte(i32, i32) #1

declare i32 @rl_forward_char(i32, i32) #1

declare i32 @rl_forward_search_history(i32, i32) #1

declare i32 @rl_forward_word(i32, i32) #1

declare i32 @rl_history_search_backward(i32, i32) #1

declare i32 @rl_history_search_forward(i32, i32) #1

declare i32 @rl_history_substr_search_backward(i32, i32) #1

declare i32 @rl_history_substr_search_forward(i32, i32) #1

declare i32 @rl_insert_comment(i32, i32) #1

declare i32 @rl_insert_completions(i32, i32) #1

declare i32 @rl_kill_full_line(i32, i32) #1

declare i32 @rl_kill_line(i32, i32) #1

declare i32 @rl_kill_region(i32, i32) #1

declare i32 @rl_kill_word(i32, i32) #1

declare i32 @rl_menu_complete(i32, i32) #1

declare i32 @rl_backward_menu_complete(i32, i32) #1

declare i32 @rl_get_next_history(i32, i32) #1

declare i32 @rl_noninc_forward_search(i32, i32) #1

declare i32 @rl_noninc_reverse_search(i32, i32) #1

declare i32 @rl_noninc_forward_search_again(i32, i32) #1

declare i32 @rl_noninc_reverse_search_again(i32, i32) #1

declare i32 @rl_old_menu_complete(i32, i32) #1

declare i32 @rl_overwrite_mode(i32, i32) #1

declare i32 @rl_possible_completions(i32, i32) #1

declare i32 @rl_get_previous_history(i32, i32) #1

declare i32 @rl_print_last_kbd_macro(i32, i32) #1

declare i32 @rl_quoted_insert(i32, i32) #1

declare i32 @rl_re_read_init_file(i32, i32) #1

declare i32 @rl_refresh_line(i32, i32) #1

declare i32 @rl_reverse_search_history(i32, i32) #1

declare i32 @rl_revert_line(i32, i32) #1

declare i32 @rl_insert(i32, i32) #1

declare i32 @rl_set_mark(i32, i32) #1

declare i32 @rl_skip_csi_sequence(i32, i32) #1

declare i32 @rl_start_kbd_macro(i32, i32) #1

declare i32 @rl_tab_insert(i32, i32) #1

declare i32 @rl_tilde_expand(i32, i32) #1

declare i32 @rl_transpose_chars(i32, i32) #1

declare i32 @rl_transpose_words(i32, i32) #1

declare i32 @rl_tty_status(i32, i32) #1

declare i32 @rl_undo_command(i32, i32) #1

declare i32 @rl_universal_argument(i32, i32) #1

declare i32 @rl_unix_filename_rubout(i32, i32) #1

declare i32 @rl_unix_line_discard(i32, i32) #1

declare i32 @rl_unix_word_rubout(i32, i32) #1

declare i32 @rl_upcase_word(i32, i32) #1

declare i32 @rl_yank(i32, i32) #1

declare i32 @rl_yank_last_arg(i32, i32) #1

declare i32 @rl_yank_nth_arg(i32, i32) #1

declare i32 @rl_yank_pop(i32, i32) #1

declare i32 @rl_vi_append_eol(i32, i32) #1

declare i32 @rl_vi_append_mode(i32, i32) #1

declare i32 @rl_vi_arg_digit(i32, i32) #1

declare i32 @rl_vi_back_to_indent(i32, i32) #1

declare i32 @rl_vi_bWord(i32, i32) #1

declare i32 @rl_vi_bword(i32, i32) #1

declare i32 @rl_vi_change_case(i32, i32) #1

declare i32 @rl_vi_change_char(i32, i32) #1

declare i32 @rl_vi_change_to(i32, i32) #1

declare i32 @rl_vi_char_search(i32, i32) #1

declare i32 @rl_vi_column(i32, i32) #1

declare i32 @rl_vi_complete(i32, i32) #1

declare i32 @rl_vi_delete(i32, i32) #1

declare i32 @rl_vi_delete_to(i32, i32) #1

declare i32 @rl_vi_eWord(i32, i32) #1

declare i32 @rl_vi_editing_mode(i32, i32) #1

declare i32 @rl_vi_end_word(i32, i32) #1

declare i32 @rl_vi_eof_maybe(i32, i32) #1

declare i32 @rl_vi_eword(i32, i32) #1

declare i32 @rl_vi_fWord(i32, i32) #1

declare i32 @rl_vi_fetch_history(i32, i32) #1

declare i32 @rl_vi_first_print(i32, i32) #1

declare i32 @rl_vi_fword(i32, i32) #1

declare i32 @rl_vi_goto_mark(i32, i32) #1

declare i32 @rl_vi_insert_beg(i32, i32) #1

declare i32 @rl_vi_insert_mode(i32, i32) #1

declare i32 @rl_vi_match(i32, i32) #1

declare i32 @rl_vi_movement_mode(i32, i32) #1

declare i32 @rl_vi_next_word(i32, i32) #1

declare i32 @rl_vi_overstrike(i32, i32) #1

declare i32 @rl_vi_overstrike_delete(i32, i32) #1

declare i32 @rl_vi_prev_word(i32, i32) #1

declare i32 @rl_vi_put(i32, i32) #1

declare i32 @rl_vi_redo(i32, i32) #1

declare i32 @rl_vi_replace(i32, i32) #1

declare i32 @rl_vi_rubout(i32, i32) #1

declare i32 @rl_vi_search(i32, i32) #1

declare i32 @rl_vi_search_again(i32, i32) #1

declare i32 @rl_vi_set_mark(i32, i32) #1

declare i32 @rl_vi_subst(i32, i32) #1

declare i32 @rl_vi_tilde_expand(i32, i32) #1

declare i32 @rl_vi_unix_word_rubout(i32, i32) #1

declare i32 @rl_vi_yank_arg(i32, i32) #1

declare i32 @rl_vi_yank_pop(i32, i32) #1

declare i32 @rl_vi_yank_to(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
