; ModuleID = 'keymaps.c'
source_filename = "keymaps.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._keymap_entry = type { i8, i32 (i32, i32)* }

@emacs_ctlx_keymap = global [257 x %struct._keymap_entry] [%struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_abort }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_re_read_init_file }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_undo_command }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_exchange_point_and_mark }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_start_kbd_macro }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_end_kbd_macro }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_call_last_kbd_macro }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_kill_line }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer], align 4
@emacs_meta_keymap = global [257 x %struct._keymap_entry] [%struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_abort }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_kill_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_tab_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_editing_mode }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_editing_mode }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_revert_line }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank_nth_arg }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_complete }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_char_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_set_mark }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert_comment }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_tilde_expand }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert_completions }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank_last_arg }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_digit_argument }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_beginning_of_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_possible_completions }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_end_of_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_possible_completions }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_do_lowercase_version }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_delete_horizontal_space }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank_last_arg }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_capitalize_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_kill_word }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_word }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_downcase_word }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_noninc_forward_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_noninc_reverse_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_revert_line }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_transpose_words }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_upcase_word }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank_pop }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_tilde_expand }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_kill_word }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer], align 4
@emacs_standard_keymap = global [257 x %struct._keymap_entry] [%struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_set_mark }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_beg_of_line }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_char }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_delete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_end_of_line }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_char }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_abort }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_rubout }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_complete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_newline }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_kill_line }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_clear_screen }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_newline }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_next_history }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_previous_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_quoted_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_reverse_search_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_search_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_transpose_chars }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_unix_line_discard }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_quoted_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_unix_word_rubout }, %struct._keymap_entry { i8 1, i32 (i32, i32)* bitcast ([257 x %struct._keymap_entry]* @emacs_ctlx_keymap to i32 (i32, i32)*) }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 1, i32 (i32, i32)* bitcast ([257 x %struct._keymap_entry]* @emacs_meta_keymap to i32 (i32, i32)*) }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_char_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_undo_command }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_rubout }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry zeroinitializer], align 4
@vi_movement_keymap = global [257 x %struct._keymap_entry] [%struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_eof_maybe }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_emacs_editing_mode }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_abort }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_char }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_newline }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_kill_line }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_clear_screen }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_newline }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_next_history }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_previous_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_quoted_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_reverse_search_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_search_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_transpose_chars }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_unix_line_discard }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_quoted_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_unix_word_rubout }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_undo }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_char }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert_comment }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_end_of_line }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_match }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_tilde_expand }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_complete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_next_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_char_search }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_previous_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_redo }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_search }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_beg_of_line }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_arg_digit }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_char_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_complete }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_append_eol }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_prev_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_change_to }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_delete_to }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_end_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_char_search }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_fetch_history }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_insert_beg }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_search_again }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_put }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_replace }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_subst }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_char_search }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_revert_line }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_next_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_rubout }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_yank_to }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_complete }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_first_print }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_yank_arg }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_goto_mark }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_append_mode }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_prev_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_change_to }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_delete_to }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_end_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_char_search }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_char }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_insert_mode }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_next_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_get_previous_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_char }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_set_mark }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_search_again }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_put }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_change_char }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_subst }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_char_search }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_undo }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_next_word }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_delete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_yank_to }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_column }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_change_case }, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer, %struct._keymap_entry zeroinitializer], align 4
@vi_insertion_keymap = global [257 x %struct._keymap_entry] [%struct._keymap_entry zeroinitializer, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_eof_maybe }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_rubout }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_complete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_newline }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_newline }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_menu_complete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_backward_menu_complete }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_reverse_search_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_forward_search_history }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_transpose_chars }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_unix_line_discard }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_quoted_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_unix_word_rubout }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_yank }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_movement_mode }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_vi_undo }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_rubout }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry { i8 0, i32 (i32, i32)* @rl_insert }, %struct._keymap_entry zeroinitializer], align 4

declare i32 @rl_set_mark(i32, i32) #0

declare i32 @rl_beg_of_line(i32, i32) #0

declare i32 @rl_backward_char(i32, i32) #0

declare i32 @rl_delete(i32, i32) #0

declare i32 @rl_end_of_line(i32, i32) #0

declare i32 @rl_forward_char(i32, i32) #0

declare i32 @rl_abort(i32, i32) #0

declare i32 @rl_rubout(i32, i32) #0

declare i32 @rl_complete(i32, i32) #0

declare i32 @rl_newline(i32, i32) #0

declare i32 @rl_kill_line(i32, i32) #0

declare i32 @rl_clear_screen(i32, i32) #0

declare i32 @rl_get_next_history(i32, i32) #0

declare i32 @rl_get_previous_history(i32, i32) #0

declare i32 @rl_quoted_insert(i32, i32) #0

declare i32 @rl_reverse_search_history(i32, i32) #0

declare i32 @rl_forward_search_history(i32, i32) #0

declare i32 @rl_transpose_chars(i32, i32) #0

declare i32 @rl_unix_line_discard(i32, i32) #0

declare i32 @rl_unix_word_rubout(i32, i32) #0

declare i32 @rl_yank(i32, i32) #0

declare i32 @rl_char_search(i32, i32) #0

declare i32 @rl_undo_command(i32, i32) #0

declare i32 @rl_insert(i32, i32) #0

declare i32 @rl_backward_kill_word(i32, i32) #0

declare i32 @rl_tab_insert(i32, i32) #0

declare i32 @rl_vi_editing_mode(i32, i32) #0

declare i32 @rl_revert_line(i32, i32) #0

declare i32 @rl_yank_nth_arg(i32, i32) #0

declare i32 @rl_backward_char_search(i32, i32) #0

declare i32 @rl_insert_comment(i32, i32) #0

declare i32 @rl_tilde_expand(i32, i32) #0

declare i32 @rl_insert_completions(i32, i32) #0

declare i32 @rl_digit_argument(i32, i32) #0

declare i32 @rl_yank_last_arg(i32, i32) #0

declare i32 @rl_beginning_of_history(i32, i32) #0

declare i32 @rl_possible_completions(i32, i32) #0

declare i32 @rl_end_of_history(i32, i32) #0

declare i32 @rl_do_lowercase_version(i32, i32) #0

declare i32 @rl_delete_horizontal_space(i32, i32) #0

declare i32 @rl_backward_word(i32, i32) #0

declare i32 @rl_capitalize_word(i32, i32) #0

declare i32 @rl_kill_word(i32, i32) #0

declare i32 @rl_forward_word(i32, i32) #0

declare i32 @rl_downcase_word(i32, i32) #0

declare i32 @rl_noninc_forward_search(i32, i32) #0

declare i32 @rl_noninc_reverse_search(i32, i32) #0

declare i32 @rl_transpose_words(i32, i32) #0

declare i32 @rl_upcase_word(i32, i32) #0

declare i32 @rl_yank_pop(i32, i32) #0

declare i32 @rl_re_read_init_file(i32, i32) #0

declare i32 @rl_exchange_point_and_mark(i32, i32) #0

declare i32 @rl_start_kbd_macro(i32, i32) #0

declare i32 @rl_end_kbd_macro(i32, i32) #0

declare i32 @rl_call_last_kbd_macro(i32, i32) #0

declare i32 @rl_backward_kill_line(i32, i32) #0

declare i32 @rl_vi_eof_maybe(i32, i32) #0

declare i32 @rl_emacs_editing_mode(i32, i32) #0

declare i32 @rl_vi_unix_word_rubout(i32, i32) #0

declare i32 @rl_vi_undo(i32, i32) #0

declare i32 @rl_vi_match(i32, i32) #0

declare i32 @rl_vi_tilde_expand(i32, i32) #0

declare i32 @rl_vi_complete(i32, i32) #0

declare i32 @rl_vi_char_search(i32, i32) #0

declare i32 @rl_vi_redo(i32, i32) #0

declare i32 @rl_vi_search(i32, i32) #0

declare i32 @rl_vi_arg_digit(i32, i32) #0

declare i32 @rl_vi_append_eol(i32, i32) #0

declare i32 @rl_vi_prev_word(i32, i32) #0

declare i32 @rl_vi_change_to(i32, i32) #0

declare i32 @rl_vi_delete_to(i32, i32) #0

declare i32 @rl_vi_end_word(i32, i32) #0

declare i32 @rl_vi_fetch_history(i32, i32) #0

declare i32 @rl_vi_insert_beg(i32, i32) #0

declare i32 @rl_vi_search_again(i32, i32) #0

declare i32 @rl_vi_put(i32, i32) #0

declare i32 @rl_vi_replace(i32, i32) #0

declare i32 @rl_vi_subst(i32, i32) #0

declare i32 @rl_vi_next_word(i32, i32) #0

declare i32 @rl_vi_rubout(i32, i32) #0

declare i32 @rl_vi_yank_to(i32, i32) #0

declare i32 @rl_vi_first_print(i32, i32) #0

declare i32 @rl_vi_yank_arg(i32, i32) #0

declare i32 @rl_vi_goto_mark(i32, i32) #0

declare i32 @rl_vi_append_mode(i32, i32) #0

declare i32 @rl_vi_insert_mode(i32, i32) #0

declare i32 @rl_vi_set_mark(i32, i32) #0

declare i32 @rl_vi_change_char(i32, i32) #0

declare i32 @rl_vi_delete(i32, i32) #0

declare i32 @rl_vi_column(i32, i32) #0

declare i32 @rl_vi_change_case(i32, i32) #0

declare i32 @rl_menu_complete(i32, i32) #0

declare i32 @rl_backward_menu_complete(i32, i32) #0

declare i32 @rl_vi_movement_mode(i32, i32) #0

; Function Attrs: noinline nounwind
define %struct._keymap_entry* @rl_make_bare_keymap() #1 {
entry:
  %i = alloca i32, align 4
  %keymap = alloca %struct._keymap_entry*, align 4
  %call = call i8* @xmalloc(i32 2056)
  %0 = bitcast i8* %call to %struct._keymap_entry*
  store %struct._keymap_entry* %0, %struct._keymap_entry** %keymap, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 257
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %2, i32 %3
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  store i8 0, i8* %type, align 4
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 %5
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 1
  store i32 (i32, i32)* null, i32 (i32, i32)** %function, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap, align 4
  ret %struct._keymap_entry* %7
}

declare i8* @xmalloc(i32) #0

; Function Attrs: noinline nounwind
define %struct._keymap_entry* @rl_copy_keymap(%struct._keymap_entry* %map) #1 {
entry:
  %map.addr = alloca %struct._keymap_entry*, align 4
  %i = alloca i32, align 4
  %temp = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %call = call %struct._keymap_entry* @rl_make_bare_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** %temp, align 4
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
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %temp, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 %5
  %type2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 0
  store i8 %3, i8* %type2, align 4
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %6, i32 %7
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx3, i32 0, i32 1
  %8 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %9 = load %struct._keymap_entry*, %struct._keymap_entry** %temp, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %9, i32 %10
  %function5 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx4, i32 0, i32 1
  store i32 (i32, i32)* %8, i32 (i32, i32)** %function5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load %struct._keymap_entry*, %struct._keymap_entry** %temp, align 4
  ret %struct._keymap_entry* %12
}

; Function Attrs: noinline nounwind
define %struct._keymap_entry* @rl_make_keymap() #1 {
entry:
  %i = alloca i32, align 4
  %newmap = alloca %struct._keymap_entry*, align 4
  %call = call %struct._keymap_entry* @rl_make_bare_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** %newmap, align 4
  store i32 32, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 127
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %newmap, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %1, i32 %2
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %newmap, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 9
  %function2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function2, align 4
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %newmap, align 4
  %arrayidx3 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 127
  %function4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx3, i32 0, i32 1
  store i32 (i32, i32)* @rl_rubout, i32 (i32, i32)** %function4, align 4
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** %newmap, align 4
  %arrayidx5 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %6, i32 8
  %function6 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx5, i32 0, i32 1
  store i32 (i32, i32)* @rl_rubout, i32 (i32, i32)** %function6, align 4
  store i32 128, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc12, %for.end
  %7 = load i32, i32* %i, align 4
  %cmp8 = icmp slt i32 %7, 256
  br i1 %cmp8, label %for.body9, label %for.end14

for.body9:                                        ; preds = %for.cond7
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %newmap, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %8, i32 %9
  %function11 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx10, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.body9
  %10 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %10, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond7

for.end14:                                        ; preds = %for.cond7
  %11 = load %struct._keymap_entry*, %struct._keymap_entry** %newmap, align 4
  ret %struct._keymap_entry* %11
}

; Function Attrs: noinline nounwind
define void @rl_discard_keymap(%struct._keymap_entry* %map) #1 {
entry:
  %map.addr = alloca %struct._keymap_entry*, align 4
  %i = alloca i32, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %cmp = icmp eq %struct._keymap_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %1, 257
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %2, i32 %3
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %4 = load i8, i8* %type, align 4
  %conv = sext i8 %4 to i32
  switch i32 %conv, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb6
  ]

sw.bb:                                            ; preds = %for.body
  br label %sw.epilog

sw.bb2:                                           ; preds = %for.body
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 %6
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx3, i32 0, i32 1
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %8 = bitcast i32 (i32, i32)* %7 to %struct._keymap_entry*
  call void @rl_discard_keymap(%struct._keymap_entry* %8)
  %9 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %9, i32 %10
  %function5 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx4, i32 0, i32 1
  %11 = load i32 (i32, i32)*, i32 (i32, i32)** %function5, align 4
  %12 = bitcast i32 (i32, i32)* %11 to i8*
  call void @xfree(i8* %12)
  br label %sw.epilog

sw.bb6:                                           ; preds = %for.body
  %13 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %13, i32 %14
  %function8 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx7, i32 0, i32 1
  %15 = load i32 (i32, i32)*, i32 (i32, i32)** %function8, align 4
  %16 = bitcast i32 (i32, i32)* %15 to i8*
  call void @xfree(i8* %16)
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.body, %sw.bb6, %sw.bb2, %sw.bb
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

declare void @xfree(i8*) #0

; Function Attrs: noinline nounwind
define void @rl_free_keymap(%struct._keymap_entry* %map) #1 {
entry:
  %map.addr = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  call void @rl_discard_keymap(%struct._keymap_entry* %0)
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %2 = bitcast %struct._keymap_entry* %1 to i8*
  call void @xfree(i8* %2)
  ret void
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
