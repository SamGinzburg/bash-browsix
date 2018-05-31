; ModuleID = 'readline.c'
source_filename = "readline.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._IO_FILE = type opaque
%struct.__rl_keyseq_context = type { i32, i32, i32, i32, %struct._keymap_entry*, %struct._keymap_entry*, %struct.__rl_keyseq_context*, i32 }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct._hist_entry = type { i8*, i8*, i8* }
%struct.readline_state = type { i32, i32, i32, i32, i8*, %struct.undo_list*, i8*, i32, i32, %struct._keymap_entry*, i32 (i32, i32)*, i32, i32, i8*, i32, i32, %struct._IO_FILE*, %struct._IO_FILE*, i8*, i32, i32, i8* (i8*, i32)*, i8* (i8*, i32)*, i32 (i8**)*, i8** (i8*, i32, i32)*, i8*, [64 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"5.1\00", align 1
@rl_library_version = global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), align 4
@rl_readline_version = global i32 1792, align 4
@rl_gnu_readline_p = global i32 1, align 4
@emacs_standard_keymap = external global [257 x %struct._keymap_entry], align 4
@_rl_keymap = global %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0), align 4
@rl_editing_mode = global i32 1, align 4
@rl_insert_mode = global i32 1, align 4
@_rl_last_command_was_kill = global i32 0, align 4
@rl_numeric_arg = global i32 1, align 4
@rl_explicit_arg = global i32 0, align 4
@rl_arg_sign = global i32 1, align 4
@rl_readline_state = global i32 0, align 4
@rl_last_func = global i32 (i32, i32)* null, align 4
@rl_instream = global %struct._IO_FILE* null, align 4
@rl_outstream = global %struct._IO_FILE* null, align 4
@_rl_echoing_p = global i32 0, align 4
@rl_prompt = global i8* null, align 4
@rl_visible_prompt_length = global i32 0, align 4
@rl_already_prompted = global i32 0, align 4
@rl_key_sequence_length = global i32 0, align 4
@rl_startup_hook = global i32 ()* null, align 4
@rl_pre_input_hook = global i32 ()* null, align 4
@_rl_eof_char = global i32 4, align 4
@rl_pending_input = global i32 0, align 4
@rl_terminal_name = global i8* null, align 4
@_rl_horizontal_scroll_mode = global i32 0, align 4
@_rl_mark_modified_lines = global i32 0, align 4
@_rl_bell_preference = global i32 1, align 4
@rl_erase_empty_line = global i32 0, align 4
@rl_line_buffer = global i8* null, align 4
@rl_line_buffer_len = global i32 0, align 4
@_rl_kscxt = global %struct.__rl_keyseq_context* null, align 4
@rl_executing_keyseq = global i8* null, align 4
@_rl_executing_keyseq_size = global i32 0, align 4
@_rl_keyseq_timeout = global i32 500, align 4
@_rl_parsing_conditionalized_out = global i8 0, align 1
@_rl_convert_meta_chars_to_ascii = global i32 1, align 4
@_rl_output_meta_chars = global i32 0, align 4
@_rl_bind_stty_chars = global i32 1, align 4
@_rl_revert_all_at_newline = global i32 0, align 4
@_rl_echo_control_chars = global i32 1, align 4
@_rl_show_mode_in_prompt = global i32 0, align 4
@_rl_enable_bracketed_paste = global i32 0, align 4
@_rl_meta_flag = global i32 0, align 4
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@rl_display_prompt = external global i8*, align 4
@rl_prep_term_function = external global void (i32)*, align 4
@rl_deprep_term_function = external global void ()*, align 4
@_rl_in_stream = common global %struct._IO_FILE* null, align 4
@_rl_out_stream = common global %struct._IO_FILE* null, align 4
@_rl_enable_meta = external global i32, align 4
@rl_redisplay_function = external global void ()*, align 4
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@_rl_caught_signal = external global i32, align 4
@rl_undo_list = external global %struct.undo_list*, align 4
@the_line = internal global i8* null, align 4
@vi_movement_keymap = external global [257 x %struct._keymap_entry], align 4
@rl_num_chars_to_read = common global i32 0, align 4
@rl_end = common global i32 0, align 4
@_rl_want_redisplay = external global i32, align 4
@rl_done = common global i32 0, align 4
@rl_point = common global i32 0, align 4
@readline_internal_char.lastc = internal global i32 0, align 4
@readline_internal_char.eof_found = internal global i32 0, align 4
@_rl_top_level = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@rl_signal_event_hook = external global i32 ()*, align 4
@rl_mark = common global i32 0, align 4
@_rl_dispatching_keymap = common global %struct._keymap_entry* null, align 4
@rl_executing_keymap = common global %struct._keymap_entry* null, align 4
@rl_executing_key = common global i32 0, align 4
@rl_dispatching = common global i32 0, align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@_rl_vi_redoing = external global i32, align 4
@rl_initialized = internal global i32 0, align 4
@rl_executing_macro = external global i8*, align 4
@rl_catch_signals = external global i32, align 4
@rl_catch_sigwinch = external global i32, align 4
@rl_completion_entry_function = external global i8* (i8*, i32)*, align 4
@rl_menu_completion_entry_function = external global i8* (i8*, i32)*, align 4
@rl_ignore_some_completions_function = external global i32 (i8**)*, align 4
@rl_attempted_completion_function = external global i8** (i8*, i32, i32)*, align 4
@rl_completer_word_break_characters = external global i8*, align 4
@_rl_comment_begin = common global i8* null, align 4
@stdin = external constant %struct._IO_FILE*, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@.str.3 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@_rl_term_autowrap = external global i32, align 4
@_rl_screenwidth = external global i32, align 4
@_rl_screenheight = external global i32, align 4
@_rl_screenchars = external global i32, align 4
@rl_basic_word_break_characters = external global i8*, align 4
@_rl_colored_stats = external global i32, align 4
@_rl_colored_completion_prefix = external global i32, align 4
@.str.4 = private unnamed_addr constant [2 x i8] c"\1B\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"\1B[A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"\1B[B\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"\1B[C\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"\1B[D\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"\1B[H\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"\1B[F\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"\1BOA\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"\1BOB\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"\1BOC\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"\1BOD\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"\1BOH\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"\1BOF\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"\1B[200~\00", align 1

; Function Attrs: noinline nounwind
define i32 @rl_set_prompt(i8* %prompt) #0 {
entry:
  %prompt.addr = alloca i8*, align 4
  store i8* %prompt, i8** %prompt.addr, align 4
  %0 = load i8*, i8** @rl_prompt, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @rl_prompt, align 4
  call void @free(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %prompt.addr, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %3 = load i8*, i8** %prompt.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 1, %call
  %call2 = call i8* @xmalloc(i32 %add)
  %4 = load i8*, i8** %prompt.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %4)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call3, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** @rl_prompt, align 4
  %5 = load i8*, i8** @rl_prompt, align 4
  %tobool4 = icmp ne i8* %5, null
  br i1 %tobool4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %cond.end
  %6 = load i8*, i8** @rl_prompt, align 4
  br label %cond.end7

cond.false6:                                      ; preds = %cond.end
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true5
  %cond8 = phi i8* [ %6, %cond.true5 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), %cond.false6 ]
  store i8* %cond8, i8** @rl_display_prompt, align 4
  %7 = load i8*, i8** @rl_prompt, align 4
  %call9 = call i32 @rl_expand_prompt(i8* %7)
  store i32 %call9, i32* @rl_visible_prompt_length, align 4
  ret i32 0
}

declare void @free(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

declare i32 @rl_expand_prompt(i8*) #1

; Function Attrs: noinline nounwind
define i8* @readline(i8* %prompt) #0 {
entry:
  %retval = alloca i8*, align 4
  %prompt.addr = alloca i8*, align 4
  %value = alloca i8*, align 4
  store i8* %prompt, i8** %prompt.addr, align 4
  %0 = load i32, i32* @rl_pending_input, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @rl_clear_pending_input()
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %prompt.addr, align 4
  %call1 = call i32 @rl_set_prompt(i8* %1)
  %call2 = call i32 @rl_initialize()
  %2 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %tobool = icmp ne void (i32)* %2, null
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %3 = load void (i32)*, void (i32)** @rl_prep_term_function, align 4
  %4 = load i32, i32* @_rl_meta_flag, align 4
  call void %3(i32 %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %call5 = call i32 @rl_set_signals()
  %call6 = call i8* @readline_internal()
  store i8* %call6, i8** %value, align 4
  %5 = load void ()*, void ()** @rl_deprep_term_function, align 4
  %tobool7 = icmp ne void ()* %5, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %6 = load void ()*, void ()** @rl_deprep_term_function, align 4
  call void %6()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end4
  %call10 = call i32 @rl_clear_signals()
  %7 = load i8*, i8** %value, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then
  %8 = load i8*, i8** %retval, align 4
  ret i8* %8
}

declare i32 @rl_clear_pending_input() #1

; Function Attrs: noinline nounwind
define i32 @rl_initialize() #0 {
entry:
  %0 = load i32, i32* @rl_initialized, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 1
  store i32 %or, i32* @rl_readline_state, align 4
  call void @readline_initialize_everything()
  %2 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %2, -2
  store i32 %and, i32* @rl_readline_state, align 4
  %3 = load i32, i32* @rl_initialized, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @rl_initialized, align 4
  %4 = load i32, i32* @rl_readline_state, align 4
  %or1 = or i32 %4, 2
  store i32 %or1, i32* @rl_readline_state, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @_rl_init_line_state()
  store i32 0, i32* @rl_done, align 4
  %5 = load i32, i32* @rl_readline_state, align 4
  %and2 = and i32 %5, -33554433
  store i32 %and2, i32* @rl_readline_state, align 4
  call void @_rl_start_using_history()
  %call = call i32 @rl_reset_line_state()
  store i32 (i32, i32)* null, i32 (i32, i32)** @rl_last_func, align 4
  store i8 0, i8* @_rl_parsing_conditionalized_out, align 1
  %6 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @_rl_vi_initialize_line()
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  call void @_rl_set_insert_mode(i32 1, i32 1)
  ret i32 0
}

declare i32 @rl_set_signals() #1

; Function Attrs: noinline nounwind
define internal i8* @readline_internal() #0 {
entry:
  %eof = alloca i32, align 4
  call void @readline_internal_setup()
  %call = call i32 @readline_internal_charloop()
  store i32 %call, i32* %eof, align 4
  %0 = load i32, i32* %eof, align 4
  %call1 = call i8* @readline_internal_teardown(i32 %0)
  ret i8* %call1
}

declare i32 @rl_clear_signals() #1

; Function Attrs: noinline nounwind
define void @readline_internal_setup() #0 {
entry:
  %nprompt = alloca i8*, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** @_rl_in_stream, align 4
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  store %struct._IO_FILE* %1, %struct._IO_FILE** @_rl_out_stream, align 4
  %2 = load i32, i32* @_rl_enable_meta, align 4
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, 4
  %and1 = and i32 %2, %and
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_rl_enable_meta_key()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32 ()*, i32 ()** @rl_startup_hook, align 4
  %tobool2 = icmp ne i32 ()* %4, null
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %5 = load i32 ()*, i32 ()** @rl_startup_hook, align 4
  %call = call i32 %5()
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %6 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end4
  %call6 = call i32 @rl_vi_insertion_mode(i32 1, i32 105)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end4
  %7 = load i32, i32* @_rl_echoing_p, align 4
  %cmp8 = icmp eq i32 %7, 0
  br i1 %cmp8, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end7
  %8 = load void ()*, void ()** @rl_redisplay_function, align 4
  %cmp9 = icmp eq void ()* %8, @rl_redisplay
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %land.lhs.true
  %9 = load i8*, i8** @rl_prompt, align 4
  %tobool11 = icmp ne i8* %9, null
  br i1 %tobool11, label %land.lhs.true12, label %if.end18

land.lhs.true12:                                  ; preds = %if.then10
  %10 = load i32, i32* @rl_already_prompted, align 4
  %cmp13 = icmp eq i32 %10, 0
  br i1 %cmp13, label %if.then14, label %if.end18

if.then14:                                        ; preds = %land.lhs.true12
  %11 = load i8*, i8** @rl_prompt, align 4
  %call15 = call i8* @_rl_strip_prompt(i8* %11)
  store i8* %call15, i8** %nprompt, align 4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @_rl_out_stream, align 4
  %13 = load i8*, i8** %nprompt, align 4
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* %13)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @_rl_out_stream, align 4
  %call17 = call i32 @fflush(%struct._IO_FILE* %14)
  %15 = load i8*, i8** %nprompt, align 4
  call void @xfree(i8* %15)
  br label %if.end18

if.end18:                                         ; preds = %if.then14, %land.lhs.true12, %if.then10
  br label %if.end27

if.else:                                          ; preds = %land.lhs.true, %if.end7
  %16 = load i8*, i8** @rl_prompt, align 4
  %tobool19 = icmp ne i8* %16, null
  br i1 %tobool19, label %land.lhs.true20, label %if.else24

land.lhs.true20:                                  ; preds = %if.else
  %17 = load i32, i32* @rl_already_prompted, align 4
  %tobool21 = icmp ne i32 %17, 0
  br i1 %tobool21, label %if.then22, label %if.else24

if.then22:                                        ; preds = %land.lhs.true20
  %call23 = call i32 @rl_on_new_line_with_prompt()
  br label %if.end26

if.else24:                                        ; preds = %land.lhs.true20, %if.else
  %call25 = call i32 @rl_on_new_line()
  br label %if.end26

if.end26:                                         ; preds = %if.else24, %if.then22
  %18 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %18()
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end18
  %19 = load i32 ()*, i32 ()** @rl_pre_input_hook, align 4
  %tobool28 = icmp ne i32 ()* %19, null
  br i1 %tobool28, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end27
  %20 = load i32 ()*, i32 ()** @rl_pre_input_hook, align 4
  %call30 = call i32 %20()
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.end27
  br label %do.body

do.body:                                          ; preds = %if.end31
  %21 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool32 = icmp ne i32 %21, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %do.body
  %22 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %22)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end34
  ret void
}

declare void @_rl_enable_meta_key() #1

declare i32 @rl_vi_insertion_mode(i32, i32) #1

declare void @rl_redisplay() #1

declare i8* @_rl_strip_prompt(i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare void @xfree(i8*) #1

declare i32 @rl_on_new_line_with_prompt() #1

declare i32 @rl_on_new_line() #1

declare void @_rl_signal_handler(i32) #1

; Function Attrs: noinline nounwind
define i8* @readline_internal_teardown(i32 %eof) #0 {
entry:
  %eof.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %entry1 = alloca %struct._hist_entry*, align 4
  store i32 %eof, i32* %eof.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call, %struct._hist_entry** %entry1, align 4
  %2 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %tobool2 = icmp ne %struct._hist_entry* %2, null
  br i1 %tobool2, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %do.end
  %3 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool3 = icmp ne %struct.undo_list* %3, null
  br i1 %tobool3, label %if.then4, label %if.end12

if.then4:                                         ; preds = %land.lhs.true
  %4 = load i8*, i8** @the_line, align 4
  %call5 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call5
  %call6 = call i8* @xmalloc(i32 %add)
  %5 = load i8*, i8** @the_line, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %5)
  store i8* %call7, i8** %temp, align 4
  %call8 = call i32 @rl_revert_line(i32 1, i32 0)
  %call9 = call i32 @where_history()
  %6 = load i8*, i8** @the_line, align 4
  %call10 = call %struct._hist_entry* @replace_history_entry(i32 %call9, i8* %6, i8* null)
  store %struct._hist_entry* %call10, %struct._hist_entry** %entry1, align 4
  %7 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  call void @_rl_free_history_entry(%struct._hist_entry* %7)
  %8 = load i8*, i8** @the_line, align 4
  %9 = load i8*, i8** %temp, align 4
  %call11 = call i8* @strcpy(i8* %8, i8* %9)
  %10 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %10)
  br label %if.end12

if.end12:                                         ; preds = %if.then4, %land.lhs.true, %do.end
  %11 = load i32, i32* @_rl_revert_all_at_newline, align 4
  %tobool13 = icmp ne i32 %11, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  call void @_rl_revert_all_lines()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end12
  %12 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool16 = icmp ne %struct.undo_list* %12, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  call void @rl_free_undo_list()
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end15
  call void @_rl_disable_meta_key()
  call void @_rl_set_insert_mode(i32 1, i32 0)
  %13 = load i32, i32* %eof.addr, align 4
  %tobool19 = icmp ne i32 %13, 0
  br i1 %tobool19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end18
  br label %cond.end

cond.false:                                       ; preds = %if.end18
  %14 = load i8*, i8** @the_line, align 4
  %call20 = call i32 @strlen(i8* %14)
  %add21 = add i32 1, %call20
  %call22 = call i8* @xmalloc(i32 %add21)
  %15 = load i8*, i8** @the_line, align 4
  %call23 = call i8* @strcpy(i8* %call22, i8* %15)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ null, %cond.true ], [ %call23, %cond.false ]
  ret i8* %cond
}

declare %struct._hist_entry* @current_history() #1

declare i32 @rl_revert_line(i32, i32) #1

declare %struct._hist_entry* @replace_history_entry(i32, i8*, i8*) #1

declare i32 @where_history() #1

declare void @_rl_free_history_entry(%struct._hist_entry*) #1

declare void @_rl_revert_all_lines() #1

declare void @rl_free_undo_list() #1

declare void @_rl_disable_meta_key() #1

declare void @_rl_set_insert_mode(i32, i32) #1

; Function Attrs: noinline nounwind
define void @_rl_internal_char_cleanup() #0 {
entry:
  %0 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %cmp1 = icmp eq %struct._keymap_entry* %1, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0)
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i32 @rl_vi_check()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %2 = load i32, i32* @rl_num_chars_to_read, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true2, label %if.end6

land.lhs.true2:                                   ; preds = %if.end
  %3 = load i32, i32* @rl_end, align 4
  %4 = load i32, i32* @rl_num_chars_to_read, align 4
  %cmp3 = icmp sge i32 %3, %4
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %land.lhs.true2
  %5 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %5()
  store i32 0, i32* @_rl_want_redisplay, align 4
  %call5 = call i32 @rl_newline(i32 1, i32 10)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %land.lhs.true2, %if.end
  %6 = load i32, i32* @rl_done, align 4
  %cmp7 = icmp eq i32 %6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  %7 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %7()
  store i32 0, i32* @_rl_want_redisplay, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  %8 = load i32, i32* @rl_erase_empty_line, align 4
  %tobool10 = icmp ne i32 %8, 0
  br i1 %tobool10, label %land.lhs.true11, label %if.end20

land.lhs.true11:                                  ; preds = %if.end9
  %9 = load i32, i32* @rl_done, align 4
  %tobool12 = icmp ne i32 %9, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.end20

land.lhs.true13:                                  ; preds = %land.lhs.true11
  %10 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp14 = icmp eq i32 (i32, i32)* %10, @rl_newline
  br i1 %cmp14, label %land.lhs.true15, label %if.end20

land.lhs.true15:                                  ; preds = %land.lhs.true13
  %11 = load i32, i32* @rl_point, align 4
  %cmp16 = icmp eq i32 %11, 0
  br i1 %cmp16, label %land.lhs.true17, label %if.end20

land.lhs.true17:                                  ; preds = %land.lhs.true15
  %12 = load i32, i32* @rl_end, align 4
  %cmp18 = icmp eq i32 %12, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true17
  call void @_rl_erase_entire_line()
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %land.lhs.true17, %land.lhs.true15, %land.lhs.true13, %land.lhs.true11, %if.end9
  ret void
}

declare i32 @rl_vi_check() #1

declare i32 @rl_newline(i32, i32) #1

declare void @_rl_erase_entire_line() #1

; Function Attrs: noinline nounwind
define i32 @readline_internal_char() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %code = alloca i32, align 4
  %lk = alloca i32, align 4
  store i32 -1, i32* @readline_internal_char.lastc, align 4
  %0 = load i32, i32* @_rl_last_command_was_kill, align 4
  store i32 %0, i32* %lk, align 4
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @_rl_top_level, i32 0, i32 0)) #4
  store i32 %call, i32* %code, align 4
  %1 = load i32, i32* %code, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %2 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %2()
  store i32 0, i32* @_rl_want_redisplay, align 4
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, 524288
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* @rl_pending_input, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  call void @_rl_reset_argument()
  %5 = load i8*, i8** @rl_executing_keyseq, align 4
  store i32 0, i32* @rl_key_sequence_length, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  %6 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %6, 8
  store i32 %or, i32* @rl_readline_state, align 4
  %call6 = call i32 @rl_read_key()
  store i32 %call6, i32* %c, align 4
  %7 = load i32, i32* @rl_readline_state, align 4
  %and7 = and i32 %7, -9
  store i32 %and7, i32* @rl_readline_state, align 4
  %8 = load i32, i32* %c, align 4
  %cmp8 = icmp eq i32 %8, -2
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end5
  %9 = load i32, i32* @rl_readline_state, align 4
  %or10 = or i32 %9, 33554432
  store i32 %or10, i32* @rl_readline_state, align 4
  store i32 1, i32* @rl_done, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end5
  %10 = load i32, i32* %c, align 4
  %cmp12 = icmp eq i32 %10, -1
  br i1 %cmp12, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %if.end11
  %11 = load i32, i32* @rl_end, align 4
  %tobool13 = icmp ne i32 %11, 0
  br i1 %tobool13, label %if.then14, label %if.end34

if.then14:                                        ; preds = %land.lhs.true
  %12 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp15 = icmp ne i32 %12, 0
  br i1 %cmp15, label %if.then16, label %if.end24

if.then16:                                        ; preds = %if.then14
  br label %do.body

do.body:                                          ; preds = %if.then16
  %13 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool17 = icmp ne i32 %13, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %do.body
  %14 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %14)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end19
  %15 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %tobool20 = icmp ne i32 ()* %15, null
  br i1 %tobool20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %do.end
  %16 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %call22 = call i32 %16()
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %do.end
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then14
  %17 = load i32, i32* @rl_readline_state, align 4
  %and25 = and i32 %17, 4
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then27, label %if.else32

if.then27:                                        ; preds = %if.end24
  %18 = load i32, i32* @readline_internal_char.lastc, align 4
  %19 = load i32, i32* @_rl_eof_char, align 4
  %cmp28 = icmp eq i32 %18, %19
  br i1 %cmp28, label %if.then30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then27
  %20 = load i32, i32* @readline_internal_char.lastc, align 4
  %cmp29 = icmp eq i32 %20, -1
  br i1 %cmp29, label %if.then30, label %if.else

if.then30:                                        ; preds = %lor.lhs.false, %if.then27
  store i32 0, i32* @rl_end, align 4
  br label %if.end31

if.else:                                          ; preds = %lor.lhs.false
  %21 = load i32, i32* @_rl_eof_char, align 4
  store i32 %21, i32* %c, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then30
  br label %if.end33

if.else32:                                        ; preds = %if.end24
  store i32 10, i32* %c, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.end31
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %land.lhs.true, %if.end11
  %22 = load i32, i32* %c, align 4
  %23 = load i32, i32* @_rl_eof_char, align 4
  %cmp35 = icmp eq i32 %22, %23
  br i1 %cmp35, label %land.lhs.true36, label %lor.lhs.false38

land.lhs.true36:                                  ; preds = %if.end34
  %24 = load i32, i32* @readline_internal_char.lastc, align 4
  %25 = load i32, i32* %c, align 4
  %cmp37 = icmp ne i32 %24, %25
  br i1 %cmp37, label %land.lhs.true40, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %land.lhs.true36, %if.end34
  %26 = load i32, i32* %c, align 4
  %cmp39 = icmp eq i32 %26, -1
  br i1 %cmp39, label %land.lhs.true40, label %if.end44

land.lhs.true40:                                  ; preds = %lor.lhs.false38, %land.lhs.true36
  %27 = load i32, i32* @rl_end, align 4
  %cmp41 = icmp eq i32 %27, 0
  br i1 %cmp41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %land.lhs.true40
  %28 = load i32, i32* @rl_readline_state, align 4
  %or43 = or i32 %28, 33554432
  store i32 %or43, i32* @rl_readline_state, align 4
  store i32 1, i32* @rl_done, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end44:                                         ; preds = %land.lhs.true40, %lor.lhs.false38
  %29 = load i32, i32* %c, align 4
  store i32 %29, i32* @readline_internal_char.lastc, align 4
  %30 = load i32, i32* %c, align 4
  %conv = trunc i32 %30 to i8
  %conv45 = zext i8 %conv to i32
  %31 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call46 = call i32 @_rl_dispatch(i32 %conv45, %struct._keymap_entry* %31)
  br label %do.body47

do.body47:                                        ; preds = %if.end44
  %32 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool48 = icmp ne i32 %32, 0
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %do.body47
  %33 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %33)
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %do.body47
  br label %do.end51

do.end51:                                         ; preds = %if.end50
  %34 = load i32, i32* @rl_pending_input, align 4
  %cmp52 = icmp eq i32 %34, 0
  br i1 %cmp52, label %land.lhs.true54, label %if.end58

land.lhs.true54:                                  ; preds = %do.end51
  %35 = load i32, i32* %lk, align 4
  %36 = load i32, i32* @_rl_last_command_was_kill, align 4
  %cmp55 = icmp eq i32 %35, %36
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true54
  store i32 0, i32* @_rl_last_command_was_kill, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then57, %land.lhs.true54, %do.end51
  call void @_rl_internal_char_cleanup()
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end58, %if.then42, %if.then9, %if.then2
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #2

declare void @_rl_reset_argument() #1

declare i32 @rl_read_key() #1

; Function Attrs: noinline nounwind
define i32 @_rl_dispatch(i32 %key, %struct._keymap_entry* %map) #0 {
entry:
  %key.addr = alloca i32, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  store i32 %key, i32* %key.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %0, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %1 = load i32, i32* %key.addr, align 4
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call = call i32 @_rl_dispatch_subseq(i32 %1, %struct._keymap_entry* %2, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define void @_rl_init_line_state() #0 {
entry:
  store i32 0, i32* @rl_mark, align 4
  store i32 0, i32* @rl_end, align 4
  store i32 0, i32* @rl_point, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  store i8* %0, i8** @the_line, align 4
  %1 = load i8*, i8** @the_line, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  store i8 0, i8* %arrayidx, align 1
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_set_the_line() #0 {
entry:
  %0 = load i8*, i8** @rl_line_buffer, align 4
  store i8* %0, i8** @the_line, align 4
  ret void
}

; Function Attrs: noinline nounwind
define %struct.__rl_keyseq_context* @_rl_keyseq_cxt_alloc() #0 {
entry:
  %cxt = alloca %struct.__rl_keyseq_context*, align 4
  %call = call i8* @xmalloc(i32 32)
  %0 = bitcast i8* %call to %struct.__rl_keyseq_context*
  store %struct.__rl_keyseq_context* %0, %struct.__rl_keyseq_context** %cxt, align 4
  %1 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %subseq_retval = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %1, i32 0, i32 2
  store i32 0, i32* %subseq_retval, align 4
  %2 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %subseq_arg = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %2, i32 0, i32 1
  store i32 0, i32* %subseq_arg, align 4
  %3 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %flags = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %3, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %4 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %okey = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %4, i32 0, i32 3
  store i32 0, i32* %okey, align 4
  %5 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %6 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %ocxt = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %6, i32 0, i32 6
  store %struct.__rl_keyseq_context* %5, %struct.__rl_keyseq_context** %ocxt, align 4
  %7 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %childval = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %7, i32 0, i32 7
  store i32 42, i32* %childval, align 4
  %8 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  ret %struct.__rl_keyseq_context* %8
}

; Function Attrs: noinline nounwind
define void @_rl_keyseq_cxt_dispose(%struct.__rl_keyseq_context* %cxt) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_keyseq_context*, align 4
  store %struct.__rl_keyseq_context* %cxt, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %0 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %1 = bitcast %struct.__rl_keyseq_context* %0 to i8*
  call void @xfree(i8* %1)
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_keyseq_chain_dispose() #0 {
entry:
  %cxt = alloca %struct.__rl_keyseq_context*, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %tobool = icmp ne %struct.__rl_keyseq_context* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  store %struct.__rl_keyseq_context* %1, %struct.__rl_keyseq_context** %cxt, align 4
  %2 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %ocxt = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %2, i32 0, i32 6
  %3 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %ocxt, align 4
  store %struct.__rl_keyseq_context* %3, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %4 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  call void @_rl_keyseq_cxt_dispose(%struct.__rl_keyseq_context* %4)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_dispatch_callback(%struct.__rl_keyseq_context* %cxt) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca %struct.__rl_keyseq_context*, align 4
  %nkey = alloca i32, align 4
  %r = alloca i32, align 4
  store %struct.__rl_keyseq_context* %cxt, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %0 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %flags = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %0, i32 0, i32 0
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %okey = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %2, i32 0, i32 3
  %3 = load i32, i32* %okey, align 4
  %call = call i32 @_rl_subseq_getchar(i32 %3)
  store i32 %call, i32* %nkey, align 4
  %4 = load i32, i32* %nkey, align 4
  %cmp1 = icmp slt i32 %4, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %call3 = call i32 @_rl_abort_internal()
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %5 = load i32, i32* %nkey, align 4
  %6 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %dmap = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %6, i32 0, i32 4
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** %dmap, align 4
  %8 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %subseq_arg = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %8, i32 0, i32 1
  %9 = load i32, i32* %subseq_arg, align 4
  %call4 = call i32 @_rl_dispatch_subseq(i32 %5, %struct._keymap_entry* %7, i32 %9)
  store i32 %call4, i32* %r, align 4
  %10 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %flags5 = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %10, i32 0, i32 0
  %11 = load i32, i32* %flags5, align 4
  %or = or i32 %11, 1
  store i32 %or, i32* %flags5, align 4
  br label %if.end6

if.else:                                          ; preds = %entry
  %12 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %childval = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %12, i32 0, i32 7
  %13 = load i32, i32* %childval, align 4
  store i32 %13, i32* %r, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.end
  %14 = load i32, i32* %r, align 4
  %cmp7 = icmp ne i32 %14, -3
  br i1 %cmp7, label %if.then8, label %if.end13

if.then8:                                         ; preds = %if.end6
  %15 = load i32, i32* %r, align 4
  %16 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %oldmap = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %16, i32 0, i32 5
  %17 = load %struct._keymap_entry*, %struct._keymap_entry** %oldmap, align 4
  %18 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %okey9 = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %18, i32 0, i32 3
  %19 = load i32, i32* %okey9, align 4
  %20 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %flags10 = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %20, i32 0, i32 0
  %21 = load i32, i32* %flags10, align 4
  %and11 = and i32 %21, 2
  %call12 = call i32 @_rl_subseq_result(i32 %15, %struct._keymap_entry* %17, i32 %19, i32 %and11)
  store i32 %call12, i32* %r, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then8, %if.end6
  br label %do.body

do.body:                                          ; preds = %if.end13
  %22 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %22, 0
  br i1 %tobool, label %if.then14, label %if.end15

if.then14:                                        ; preds = %do.body
  %23 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %23)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end15
  %24 = load i32, i32* %r, align 4
  %cmp16 = icmp sge i32 %24, 0
  br i1 %cmp16, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end
  %25 = load i32, i32* %r, align 4
  %cmp17 = icmp eq i32 %25, -1
  br i1 %cmp17, label %land.lhs.true, label %if.end23

land.lhs.true:                                    ; preds = %lor.lhs.false
  %26 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %flags18 = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %26, i32 0, i32 0
  %27 = load i32, i32* %flags18, align 4
  %and19 = and i32 %27, 2
  %cmp20 = icmp eq i32 %and19, 0
  br i1 %cmp20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %land.lhs.true, %do.end
  call void @_rl_keyseq_chain_dispose()
  %28 = load i32, i32* @rl_readline_state, align 4
  %and22 = and i32 %28, -2097153
  store i32 %and22, i32* @rl_readline_state, align 4
  %29 = load i32, i32* %r, align 4
  store i32 %29, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %land.lhs.true, %lor.lhs.false
  %30 = load i32, i32* %r, align 4
  %cmp24 = icmp ne i32 %30, -3
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  %31 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  %ocxt = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %31, i32 0, i32 6
  %32 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %ocxt, align 4
  store %struct.__rl_keyseq_context* %32, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  %33 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %tobool27 = icmp ne %struct.__rl_keyseq_context* %33, null
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end26
  %34 = load i32, i32* %r, align 4
  %35 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %childval29 = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %35, i32 0, i32 7
  store i32 %34, i32* %childval29, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end26
  %36 = load i32, i32* %r, align 4
  %cmp31 = icmp ne i32 %36, -3
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  %37 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt.addr, align 4
  call void @_rl_keyseq_cxt_dispose(%struct.__rl_keyseq_context* %37)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  %38 = load i32, i32* %r, align 4
  store i32 %38, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then21, %if.then2
  %39 = load i32, i32* %retval, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_subseq_getchar(i32 %key) #0 {
entry:
  %key.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %0, 27
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 16
  store i32 %or, i32* @rl_readline_state, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @rl_readline_state, align 4
  %or1 = or i32 %2, 64
  store i32 %or1, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %k, align 4
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %4 = load i32, i32* %key.addr, align 4
  %cmp2 = icmp eq i32 %4, 27
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %5 = load i32, i32* @rl_readline_state, align 4
  %and4 = and i32 %5, -17
  store i32 %and4, i32* @rl_readline_state, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %6 = load i32, i32* %k, align 4
  ret i32 %6
}

declare i32 @_rl_abort_internal() #1

; Function Attrs: noinline nounwind
define i32 @_rl_dispatch_subseq(i32 %key, %struct._keymap_entry* %map, i32 %got_subseq) #0 {
entry:
  %retval = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %got_subseq.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %newkey = alloca i32, align 4
  %macro = alloca i8*, align 4
  %func = alloca i32 (i32, i32)*, align 4
  %cxt = alloca %struct.__rl_keyseq_context*, align 4
  store i32 %key, i32* %key.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i32 %got_subseq, i32* %got_subseq.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp sgt i32 %0, 127
  br i1 %cmp, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  %cmp1 = icmp sle i32 %1, 255
  br i1 %cmp1, label %land.lhs.true2, label %if.end19

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @_rl_convert_meta_chars_to_ascii, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end19

if.then:                                          ; preds = %land.lhs.true2
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %3, i32 27
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %4 = load i8, i8* %type, align 4
  %conv = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv, 1
  br i1 %cmp3, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %5 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %5, 4096
  %tobool6 = icmp ne i32 %and, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then5
  call void @_rl_add_macro_char(i32 27)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then5
  br label %do.body

do.body:                                          ; preds = %if.end
  %6 = load i32, i32* @rl_key_sequence_length, align 4
  %add = add nsw i32 %6, 2
  %7 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %cmp8 = icmp sge i32 %add, %7
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %do.body
  %8 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %add11 = add nsw i32 %8, 16
  store i32 %add11, i32* @_rl_executing_keyseq_size, align 4
  %9 = load i8*, i8** @rl_executing_keyseq, align 4
  %10 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %call = call i8* @xrealloc(i8* %9, i32 %10)
  store i8* %call, i8** @rl_executing_keyseq, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end12
  %11 = load i8*, i8** @rl_executing_keyseq, align 4
  %12 = load i32, i32* @rl_key_sequence_length, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* @rl_key_sequence_length, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i32 %12
  store i8 27, i8* %arrayidx13, align 1
  %13 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx14 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %13, i32 27
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx14, i32 0, i32 1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %15 = bitcast i32 (i32, i32)* %14 to %struct._keymap_entry*
  store %struct._keymap_entry* %15, %struct._keymap_entry** %map.addr, align 4
  %16 = load i32, i32* %key.addr, align 4
  %and15 = and i32 %16, -129
  store i32 %and15, i32* %key.addr, align 4
  %17 = load i32, i32* %key.addr, align 4
  %18 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call16 = call i32 @_rl_dispatch(i32 %17, %struct._keymap_entry* %18)
  store i32 %call16, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %call17 = call i32 @rl_ding()
  br label %if.end18

if.end18:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %19 = load i32, i32* @rl_readline_state, align 4
  %and20 = and i32 %19, 4096
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end19
  %20 = load i32, i32* %key.addr, align 4
  call void @_rl_add_macro_char(i32 %20)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.end19
  store i32 0, i32* %r, align 4
  %21 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %22 = load i32, i32* %key.addr, align 4
  %arrayidx24 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %21, i32 %22
  %type25 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx24, i32 0, i32 0
  %23 = load i8, i8* %type25, align 4
  %conv26 = sext i8 %23 to i32
  switch i32 %conv26, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb109
    i32 2, label %sw.bb230
  ]

sw.bb:                                            ; preds = %if.end23
  %24 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %25 = load i32, i32* %key.addr, align 4
  %arrayidx27 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %24, i32 %25
  %function28 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx27, i32 0, i32 1
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %function28, align 4
  store i32 (i32, i32)* %26, i32 (i32, i32)** %func, align 4
  %27 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %tobool29 = icmp ne i32 (i32, i32)* %27, null
  br i1 %tobool29, label %if.then30, label %if.else83

if.then30:                                        ; preds = %sw.bb
  %28 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp31 = icmp eq i32 (i32, i32)* %28, @rl_do_lowercase_version
  br i1 %cmp31, label %if.then33, label %if.end51

if.then33:                                        ; preds = %if.then30
  %29 = load i32, i32* %key.addr, align 4
  %conv34 = trunc i32 %29 to i8
  %conv35 = zext i8 %conv34 to i32
  %30 = load i32, i32* %key.addr, align 4
  %conv36 = trunc i32 %30 to i8
  %conv37 = zext i8 %conv36 to i32
  %cmp38 = icmp eq i32 %conv35, %conv37
  br i1 %cmp38, label %land.lhs.true40, label %cond.false

land.lhs.true40:                                  ; preds = %if.then33
  %31 = load i32, i32* %key.addr, align 4
  %conv41 = trunc i32 %31 to i8
  %conv42 = zext i8 %conv41 to i32
  %call43 = call i32 @isupper(i32 %conv42) #5
  %tobool44 = icmp ne i32 %call43, 0
  br i1 %tobool44, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true40
  %32 = load i32, i32* %key.addr, align 4
  %conv45 = trunc i32 %32 to i8
  %conv46 = zext i8 %conv45 to i32
  %call47 = call i32 @tolower(i32 %conv46) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true40, %if.then33
  %33 = load i32, i32* %key.addr, align 4
  %conv48 = trunc i32 %33 to i8
  %conv49 = zext i8 %conv48 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call47, %cond.true ], [ %conv49, %cond.false ]
  %34 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call50 = call i32 @_rl_dispatch(i32 %cond, %struct._keymap_entry* %34)
  store i32 %call50, i32* %retval, align 4
  br label %return

if.end51:                                         ; preds = %if.then30
  %35 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %35, %struct._keymap_entry** @rl_executing_keymap, align 4
  %36 = load i32, i32* %key.addr, align 4
  store i32 %36, i32* @rl_executing_key, align 4
  br label %do.body52

do.body52:                                        ; preds = %if.end51
  %37 = load i32, i32* @rl_key_sequence_length, align 4
  %add53 = add nsw i32 %37, 2
  %38 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %cmp54 = icmp sge i32 %add53, %38
  br i1 %cmp54, label %if.then56, label %if.end59

if.then56:                                        ; preds = %do.body52
  %39 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %add57 = add nsw i32 %39, 16
  store i32 %add57, i32* @_rl_executing_keyseq_size, align 4
  %40 = load i8*, i8** @rl_executing_keyseq, align 4
  %41 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %call58 = call i8* @xrealloc(i8* %40, i32 %41)
  store i8* %call58, i8** @rl_executing_keyseq, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then56, %do.body52
  br label %do.end60

do.end60:                                         ; preds = %if.end59
  %42 = load i32, i32* %key.addr, align 4
  %conv61 = trunc i32 %42 to i8
  %43 = load i8*, i8** @rl_executing_keyseq, align 4
  %44 = load i32, i32* @rl_key_sequence_length, align 4
  %inc62 = add nsw i32 %44, 1
  store i32 %inc62, i32* @rl_key_sequence_length, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %43, i32 %44
  store i8 %conv61, i8* %arrayidx63, align 1
  %45 = load i8*, i8** @rl_executing_keyseq, align 4
  %46 = load i32, i32* @rl_key_sequence_length, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %45, i32 %46
  store i8 0, i8* %arrayidx64, align 1
  store i32 1, i32* @rl_dispatching, align 4
  %47 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %47, 32
  store i32 %or, i32* @rl_readline_state, align 4
  %48 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %49 = load i32, i32* @rl_numeric_arg, align 4
  %50 = load i32, i32* @rl_arg_sign, align 4
  %mul = mul nsw i32 %49, %50
  %51 = load i32, i32* %key.addr, align 4
  %call65 = call i32 %48(i32 %mul, i32 %51)
  store i32 %call65, i32* %r, align 4
  %52 = load i32, i32* @rl_readline_state, align 4
  %and66 = and i32 %52, -33
  store i32 %and66, i32* @rl_readline_state, align 4
  store i32 0, i32* @rl_dispatching, align 4
  %53 = load i32, i32* @rl_pending_input, align 4
  %cmp67 = icmp eq i32 %53, 0
  br i1 %cmp67, label %land.lhs.true69, label %if.end77

land.lhs.true69:                                  ; preds = %do.end60
  %54 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %55 = load i32, i32* %key.addr, align 4
  %arrayidx70 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %54, i32 %55
  %function71 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx70, i32 0, i32 1
  %56 = load i32 (i32, i32)*, i32 (i32, i32)** %function71, align 4
  %cmp72 = icmp ne i32 (i32, i32)* %56, @rl_digit_argument
  br i1 %cmp72, label %if.then74, label %if.end77

if.then74:                                        ; preds = %land.lhs.true69
  %57 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %58 = load i32, i32* %key.addr, align 4
  %arrayidx75 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %57, i32 %58
  %function76 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx75, i32 0, i32 1
  %59 = load i32 (i32, i32)*, i32 (i32, i32)** %function76, align 4
  store i32 (i32, i32)* %59, i32 (i32, i32)** @rl_last_func, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.then74, %land.lhs.true69, %do.end60
  br label %do.body78

do.body78:                                        ; preds = %if.end77
  %60 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool79 = icmp ne i32 %60, 0
  br i1 %tobool79, label %if.then80, label %if.end81

if.then80:                                        ; preds = %do.body78
  %61 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %61)
  br label %if.end81

if.end81:                                         ; preds = %if.then80, %do.body78
  br label %do.end82

do.end82:                                         ; preds = %if.end81
  br label %if.end108

if.else83:                                        ; preds = %sw.bb
  %62 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx84 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %62, i32 256
  %function85 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx84, i32 0, i32 1
  %63 = load i32 (i32, i32)*, i32 (i32, i32)** %function85, align 4
  %tobool86 = icmp ne i32 (i32, i32)* %63, null
  br i1 %tobool86, label %if.then87, label %if.else95

if.then87:                                        ; preds = %if.else83
  %64 = load i32, i32* @rl_readline_state, align 4
  %and88 = and i32 %64, 2048
  %tobool89 = icmp ne i32 %and88, 0
  br i1 %tobool89, label %if.then90, label %if.else92

if.then90:                                        ; preds = %if.then87
  %call91 = call i32 @_rl_prev_macro_key()
  br label %if.end94

if.else92:                                        ; preds = %if.then87
  %65 = load i32, i32* %key.addr, align 4
  %call93 = call i32 @_rl_unget_char(i32 %65)
  br label %if.end94

if.end94:                                         ; preds = %if.else92, %if.then90
  store i32 -2, i32* %retval, align 4
  br label %return

if.else95:                                        ; preds = %if.else83
  %66 = load i32, i32* %got_subseq.addr, align 4
  %tobool96 = icmp ne i32 %66, 0
  br i1 %tobool96, label %if.then97, label %if.else105

if.then97:                                        ; preds = %if.else95
  %67 = load i32, i32* @rl_readline_state, align 4
  %and98 = and i32 %67, 2048
  %tobool99 = icmp ne i32 %and98, 0
  br i1 %tobool99, label %if.then100, label %if.else102

if.then100:                                       ; preds = %if.then97
  %call101 = call i32 @_rl_prev_macro_key()
  br label %if.end104

if.else102:                                       ; preds = %if.then97
  %68 = load i32, i32* %key.addr, align 4
  %call103 = call i32 @_rl_unget_char(i32 %68)
  br label %if.end104

if.end104:                                        ; preds = %if.else102, %if.then100
  store i32 -1, i32* %retval, align 4
  br label %return

if.else105:                                       ; preds = %if.else95
  %69 = load i32, i32* @rl_readline_state, align 4
  %and106 = and i32 %69, -2097153
  store i32 %and106, i32* @rl_readline_state, align 4
  call void @_rl_keyseq_chain_dispose()
  %call107 = call i32 @_rl_abort_internal()
  store i32 -1, i32* %retval, align 4
  br label %return

if.end108:                                        ; preds = %do.end82
  br label %sw.epilog

sw.bb109:                                         ; preds = %if.end23
  %70 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %71 = load i32, i32* %key.addr, align 4
  %arrayidx110 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %70, i32 %71
  %function111 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx110, i32 0, i32 1
  %72 = load i32 (i32, i32)*, i32 (i32, i32)** %function111, align 4
  %cmp112 = icmp ne i32 (i32, i32)* %72, null
  br i1 %cmp112, label %if.then114, label %if.else228

if.then114:                                       ; preds = %sw.bb109
  %73 = load i32, i32* @rl_editing_mode, align 4
  %cmp115 = icmp eq i32 %73, 0
  br i1 %cmp115, label %land.lhs.true117, label %if.end146

land.lhs.true117:                                 ; preds = %if.then114
  %74 = load i32, i32* %key.addr, align 4
  %cmp118 = icmp eq i32 %74, 27
  br i1 %cmp118, label %land.lhs.true120, label %if.end146

land.lhs.true120:                                 ; preds = %land.lhs.true117
  %75 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %cmp121 = icmp eq %struct._keymap_entry* %75, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0)
  br i1 %cmp121, label %land.lhs.true123, label %if.end146

land.lhs.true123:                                 ; preds = %land.lhs.true120
  %76 = load i32, i32* @rl_readline_state, align 4
  %and124 = and i32 %76, 133120
  %cmp125 = icmp eq i32 %and124, 0
  br i1 %cmp125, label %land.lhs.true127, label %if.end146

land.lhs.true127:                                 ; preds = %land.lhs.true123
  %call128 = call i32 @_rl_pushed_input_available()
  %cmp129 = icmp eq i32 %call128, 0
  br i1 %cmp129, label %land.lhs.true131, label %if.end146

land.lhs.true131:                                 ; preds = %land.lhs.true127
  %77 = load i32, i32* @_rl_keyseq_timeout, align 4
  %cmp132 = icmp sgt i32 %77, 0
  br i1 %cmp132, label %cond.true134, label %cond.false136

cond.true134:                                     ; preds = %land.lhs.true131
  %78 = load i32, i32* @_rl_keyseq_timeout, align 4
  %mul135 = mul nsw i32 %78, 1000
  br label %cond.end137

cond.false136:                                    ; preds = %land.lhs.true131
  br label %cond.end137

cond.end137:                                      ; preds = %cond.false136, %cond.true134
  %cond138 = phi i32 [ %mul135, %cond.true134 ], [ 0, %cond.false136 ]
  %call139 = call i32 @_rl_input_queued(i32 %cond138)
  %cmp140 = icmp eq i32 %call139, 0
  br i1 %cmp140, label %if.then142, label %if.end146

if.then142:                                       ; preds = %cond.end137
  %79 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %80 = load i32, i32* %key.addr, align 4
  %arrayidx143 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %79, i32 %80
  %function144 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx143, i32 0, i32 1
  %81 = load i32 (i32, i32)*, i32 (i32, i32)** %function144, align 4
  %82 = bitcast i32 (i32, i32)* %81 to %struct._keymap_entry*
  %call145 = call i32 @_rl_dispatch(i32 256, %struct._keymap_entry* %82)
  store i32 %call145, i32* %retval, align 4
  br label %return

if.end146:                                        ; preds = %cond.end137, %land.lhs.true127, %land.lhs.true123, %land.lhs.true120, %land.lhs.true117, %if.then114
  br label %do.body147

do.body147:                                       ; preds = %if.end146
  %83 = load i32, i32* @rl_key_sequence_length, align 4
  %add148 = add nsw i32 %83, 2
  %84 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %cmp149 = icmp sge i32 %add148, %84
  br i1 %cmp149, label %if.then151, label %if.end154

if.then151:                                       ; preds = %do.body147
  %85 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %add152 = add nsw i32 %85, 16
  store i32 %add152, i32* @_rl_executing_keyseq_size, align 4
  %86 = load i8*, i8** @rl_executing_keyseq, align 4
  %87 = load i32, i32* @_rl_executing_keyseq_size, align 4
  %call153 = call i8* @xrealloc(i8* %86, i32 %87)
  store i8* %call153, i8** @rl_executing_keyseq, align 4
  br label %if.end154

if.end154:                                        ; preds = %if.then151, %do.body147
  br label %do.end155

do.end155:                                        ; preds = %if.end154
  %88 = load i32, i32* %key.addr, align 4
  %conv156 = trunc i32 %88 to i8
  %89 = load i8*, i8** @rl_executing_keyseq, align 4
  %90 = load i32, i32* @rl_key_sequence_length, align 4
  %inc157 = add nsw i32 %90, 1
  store i32 %inc157, i32* @rl_key_sequence_length, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %89, i32 %90
  store i8 %conv156, i8* %arrayidx158, align 1
  %91 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %92 = load i32, i32* %key.addr, align 4
  %arrayidx159 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %91, i32 %92
  %function160 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx159, i32 0, i32 1
  %93 = load i32 (i32, i32)*, i32 (i32, i32)** %function160, align 4
  %94 = bitcast i32 (i32, i32)* %93 to %struct._keymap_entry*
  store %struct._keymap_entry* %94, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %95 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool161 = icmp ne i32 %95, 0
  br i1 %tobool161, label %land.lhs.true162, label %if.end172

land.lhs.true162:                                 ; preds = %do.end155
  %96 = load i32, i32* @rl_readline_state, align 4
  %and163 = and i32 %96, 524288
  %tobool164 = icmp ne i32 %and163, 0
  br i1 %tobool164, label %land.lhs.true165, label %if.end172

land.lhs.true165:                                 ; preds = %land.lhs.true162
  %97 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx166 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %97, i32 256
  %function167 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx166, i32 0, i32 1
  %98 = load i32 (i32, i32)*, i32 (i32, i32)** %function167, align 4
  %cmp168 = icmp ne i32 (i32, i32)* %98, null
  br i1 %cmp168, label %if.then170, label %if.end172

if.then170:                                       ; preds = %land.lhs.true165
  %99 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %100 = load i32, i32* %key.addr, align 4
  %101 = load i32, i32* %got_subseq.addr, align 4
  %call171 = call i32 @_rl_subseq_result(i32 -2, %struct._keymap_entry* %99, i32 %100, i32 %101)
  store i32 %call171, i32* %retval, align 4
  br label %return

if.end172:                                        ; preds = %land.lhs.true165, %land.lhs.true162, %do.end155
  %102 = load i32, i32* @rl_readline_state, align 4
  %and173 = and i32 %102, 524288
  %tobool174 = icmp ne i32 %and173, 0
  br i1 %tobool174, label %if.then175, label %if.end190

if.then175:                                       ; preds = %if.end172
  %103 = load i32, i32* @rl_readline_state, align 4
  %and176 = and i32 %103, 2097152
  %tobool177 = icmp ne i32 %and176, 0
  %cond178 = select i1 %tobool177, i32 -3, i32 0
  store i32 %cond178, i32* %r, align 4
  %call179 = call %struct.__rl_keyseq_context* @_rl_keyseq_cxt_alloc()
  store %struct.__rl_keyseq_context* %call179, %struct.__rl_keyseq_context** %cxt, align 4
  %104 = load i32, i32* %got_subseq.addr, align 4
  %tobool180 = icmp ne i32 %104, 0
  br i1 %tobool180, label %if.then181, label %if.end183

if.then181:                                       ; preds = %if.then175
  %105 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %flags = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %105, i32 0, i32 0
  %106 = load i32, i32* %flags, align 4
  %or182 = or i32 %106, 2
  store i32 %or182, i32* %flags, align 4
  br label %if.end183

if.end183:                                        ; preds = %if.then181, %if.then175
  %107 = load i32, i32* %key.addr, align 4
  %108 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %okey = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %108, i32 0, i32 3
  store i32 %107, i32* %okey, align 4
  %109 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %110 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %oldmap = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %110, i32 0, i32 5
  store %struct._keymap_entry* %109, %struct._keymap_entry** %oldmap, align 4
  %111 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %112 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %dmap = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %112, i32 0, i32 4
  store %struct._keymap_entry* %111, %struct._keymap_entry** %dmap, align 4
  %113 = load i32, i32* %got_subseq.addr, align 4
  %tobool184 = icmp ne i32 %113, 0
  br i1 %tobool184, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end183
  %114 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %dmap185 = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %114, i32 0, i32 4
  %115 = load %struct._keymap_entry*, %struct._keymap_entry** %dmap185, align 4
  %arrayidx186 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %115, i32 256
  %function187 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx186, i32 0, i32 1
  %116 = load i32 (i32, i32)*, i32 (i32, i32)** %function187, align 4
  %tobool188 = icmp ne i32 (i32, i32)* %116, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end183
  %117 = phi i1 [ true, %if.end183 ], [ %tobool188, %lor.rhs ]
  %lor.ext = zext i1 %117 to i32
  %118 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  %subseq_arg = getelementptr inbounds %struct.__rl_keyseq_context, %struct.__rl_keyseq_context* %118, i32 0, i32 1
  store i32 %lor.ext, i32* %subseq_arg, align 4
  %119 = load i32, i32* @rl_readline_state, align 4
  %or189 = or i32 %119, 2097152
  store i32 %or189, i32* @rl_readline_state, align 4
  %120 = load %struct.__rl_keyseq_context*, %struct.__rl_keyseq_context** %cxt, align 4
  store %struct.__rl_keyseq_context* %120, %struct.__rl_keyseq_context** @_rl_kscxt, align 4
  %121 = load i32, i32* %r, align 4
  store i32 %121, i32* %retval, align 4
  br label %return

if.end190:                                        ; preds = %if.end172
  %122 = load i32, i32* @_rl_keyseq_timeout, align 4
  %cmp191 = icmp sgt i32 %122, 0
  br i1 %cmp191, label %land.lhs.true193, label %if.end212

land.lhs.true193:                                 ; preds = %if.end190
  %123 = load i32, i32* @rl_readline_state, align 4
  %and194 = and i32 %123, 133120
  %cmp195 = icmp eq i32 %and194, 0
  br i1 %cmp195, label %land.lhs.true197, label %if.end212

land.lhs.true197:                                 ; preds = %land.lhs.true193
  %call198 = call i32 @_rl_pushed_input_available()
  %cmp199 = icmp eq i32 %call198, 0
  br i1 %cmp199, label %land.lhs.true201, label %if.end212

land.lhs.true201:                                 ; preds = %land.lhs.true197
  %124 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %arrayidx202 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %124, i32 256
  %function203 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx202, i32 0, i32 1
  %125 = load i32 (i32, i32)*, i32 (i32, i32)** %function203, align 4
  %tobool204 = icmp ne i32 (i32, i32)* %125, null
  br i1 %tobool204, label %land.lhs.true205, label %if.end212

land.lhs.true205:                                 ; preds = %land.lhs.true201
  %126 = load i32, i32* @_rl_keyseq_timeout, align 4
  %mul206 = mul nsw i32 %126, 1000
  %call207 = call i32 @_rl_input_queued(i32 %mul206)
  %cmp208 = icmp eq i32 %call207, 0
  br i1 %cmp208, label %if.then210, label %if.end212

if.then210:                                       ; preds = %land.lhs.true205
  %127 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %128 = load i32, i32* %key.addr, align 4
  %129 = load i32, i32* %got_subseq.addr, align 4
  %call211 = call i32 @_rl_subseq_result(i32 -2, %struct._keymap_entry* %127, i32 %128, i32 %129)
  store i32 %call211, i32* %retval, align 4
  br label %return

if.end212:                                        ; preds = %land.lhs.true205, %land.lhs.true201, %land.lhs.true197, %land.lhs.true193, %if.end190
  %130 = load i32, i32* %key.addr, align 4
  %call213 = call i32 @_rl_subseq_getchar(i32 %130)
  store i32 %call213, i32* %newkey, align 4
  %131 = load i32, i32* %newkey, align 4
  %cmp214 = icmp slt i32 %131, 0
  br i1 %cmp214, label %if.then216, label %if.end218

if.then216:                                       ; preds = %if.end212
  %call217 = call i32 @_rl_abort_internal()
  store i32 -1, i32* %retval, align 4
  br label %return

if.end218:                                        ; preds = %if.end212
  %132 = load i32, i32* %newkey, align 4
  %133 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %134 = load i32, i32* %got_subseq.addr, align 4
  %tobool219 = icmp ne i32 %134, 0
  br i1 %tobool219, label %lor.end224, label %lor.rhs220

lor.rhs220:                                       ; preds = %if.end218
  %135 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx221 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %135, i32 256
  %function222 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx221, i32 0, i32 1
  %136 = load i32 (i32, i32)*, i32 (i32, i32)** %function222, align 4
  %tobool223 = icmp ne i32 (i32, i32)* %136, null
  br label %lor.end224

lor.end224:                                       ; preds = %lor.rhs220, %if.end218
  %137 = phi i1 [ true, %if.end218 ], [ %tobool223, %lor.rhs220 ]
  %lor.ext225 = zext i1 %137 to i32
  %call226 = call i32 @_rl_dispatch_subseq(i32 %132, %struct._keymap_entry* %133, i32 %lor.ext225)
  store i32 %call226, i32* %r, align 4
  %138 = load i32, i32* %r, align 4
  %139 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %140 = load i32, i32* %key.addr, align 4
  %141 = load i32, i32* %got_subseq.addr, align 4
  %call227 = call i32 @_rl_subseq_result(i32 %138, %struct._keymap_entry* %139, i32 %140, i32 %141)
  store i32 %call227, i32* %retval, align 4
  br label %return

if.else228:                                       ; preds = %sw.bb109
  %call229 = call i32 @_rl_abort_internal()
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb230:                                         ; preds = %if.end23
  %142 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %143 = load i32, i32* %key.addr, align 4
  %arrayidx231 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %142, i32 %143
  %function232 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx231, i32 0, i32 1
  %144 = load i32 (i32, i32)*, i32 (i32, i32)** %function232, align 4
  %cmp233 = icmp ne i32 (i32, i32)* %144, null
  br i1 %cmp233, label %if.then235, label %if.end245

if.then235:                                       ; preds = %sw.bb230
  %145 = load i8*, i8** @rl_executing_keyseq, align 4
  %146 = load i32, i32* @rl_key_sequence_length, align 4
  %arrayidx236 = getelementptr inbounds i8, i8* %145, i32 %146
  store i8 0, i8* %arrayidx236, align 1
  %147 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %148 = load i32, i32* %key.addr, align 4
  %arrayidx237 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %147, i32 %148
  %function238 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx237, i32 0, i32 1
  %149 = load i32 (i32, i32)*, i32 (i32, i32)** %function238, align 4
  %150 = bitcast i32 (i32, i32)* %149 to i8*
  %call239 = call i32 @strlen(i8* %150)
  %add240 = add i32 1, %call239
  %call241 = call i8* @xmalloc(i32 %add240)
  %151 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %152 = load i32, i32* %key.addr, align 4
  %arrayidx242 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %151, i32 %152
  %function243 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx242, i32 0, i32 1
  %153 = load i32 (i32, i32)*, i32 (i32, i32)** %function243, align 4
  %154 = bitcast i32 (i32, i32)* %153 to i8*
  %call244 = call i8* @strcpy(i8* %call241, i8* %154)
  store i8* %call244, i8** %macro, align 4
  %155 = load i8*, i8** %macro, align 4
  call void @_rl_with_macro_input(i8* %155)
  store i32 0, i32* %retval, align 4
  br label %return

if.end245:                                        ; preds = %sw.bb230
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end23, %if.end245, %if.end108
  %156 = load i32, i32* @rl_editing_mode, align 4
  %cmp246 = icmp eq i32 %156, 0
  br i1 %cmp246, label %land.lhs.true248, label %if.end261

land.lhs.true248:                                 ; preds = %sw.epilog
  %157 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %cmp249 = icmp eq %struct._keymap_entry* %157, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0)
  br i1 %cmp249, label %land.lhs.true251, label %if.end261

land.lhs.true251:                                 ; preds = %land.lhs.true248
  %158 = load i32, i32* %key.addr, align 4
  %cmp252 = icmp ne i32 %158, 256
  br i1 %cmp252, label %land.lhs.true254, label %if.end261

land.lhs.true254:                                 ; preds = %land.lhs.true251
  %159 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %cmp255 = icmp eq %struct._keymap_entry* %159, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0)
  br i1 %cmp255, label %land.lhs.true257, label %if.end261

land.lhs.true257:                                 ; preds = %land.lhs.true254
  %160 = load i32, i32* %key.addr, align 4
  %call258 = call i32 @_rl_vi_textmod_command(i32 %160)
  %tobool259 = icmp ne i32 %call258, 0
  br i1 %tobool259, label %if.then260, label %if.end261

if.then260:                                       ; preds = %land.lhs.true257
  %161 = load i32, i32* %key.addr, align 4
  %162 = load i32, i32* @rl_numeric_arg, align 4
  %163 = load i32, i32* @rl_arg_sign, align 4
  call void @_rl_vi_set_last(i32 %161, i32 %162, i32 %163)
  br label %if.end261

if.end261:                                        ; preds = %if.then260, %land.lhs.true257, %land.lhs.true254, %land.lhs.true251, %land.lhs.true248, %sw.epilog
  %164 = load i32, i32* %r, align 4
  store i32 %164, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end261, %if.then235, %if.else228, %lor.end224, %if.then216, %if.then210, %lor.end, %if.then170, %if.then142, %if.else105, %if.end104, %if.end94, %cond.end, %if.end18, %do.end
  %165 = load i32, i32* %retval, align 4
  ret i32 %165
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_subseq_result(i32 %r, %struct._keymap_entry* %map, i32 %key, i32 %got_subseq) #0 {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca i32, align 4
  %map.addr = alloca %struct._keymap_entry*, align 4
  %key.addr = alloca i32, align 4
  %got_subseq.addr = alloca i32, align 4
  %m = alloca %struct._keymap_entry*, align 4
  %type = alloca i32, align 4
  %nt = alloca i32, align 4
  %func = alloca i32 (i32, i32)*, align 4
  %nf = alloca i32 (i32, i32)*, align 4
  store i32 %r, i32* %r.addr, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 %got_subseq, i32* %got_subseq.addr, align 4
  %0 = load i32, i32* %r.addr, align 4
  %cmp = icmp eq i32 %0, -2
  br i1 %cmp, label %if.then, label %if.else45

if.then:                                          ; preds = %entry
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** %m, align 4
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %2, i32 256
  %type1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %3 = load i8, i8* %type1, align 4
  %conv = sext i8 %3 to i32
  store i32 %conv, i32* %type, align 4
  %4 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %arrayidx2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %4, i32 256
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx2, i32 0, i32 1
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  store i32 (i32, i32)* %5, i32 (i32, i32)** %func, align 4
  %6 = load i32, i32* %type, align 4
  %cmp3 = icmp eq i32 %6, 0
  br i1 %cmp3, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %cmp5 = icmp eq i32 (i32, i32)* %7, @rl_do_lowercase_version
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %land.lhs.true
  %8 = load i32, i32* %key.addr, align 4
  %conv8 = trunc i32 %8 to i8
  %conv9 = zext i8 %conv8 to i32
  %9 = load i32, i32* %key.addr, align 4
  %conv10 = trunc i32 %9 to i8
  %conv11 = zext i8 %conv10 to i32
  %cmp12 = icmp eq i32 %conv9, %conv11
  br i1 %cmp12, label %land.lhs.true14, label %cond.false

land.lhs.true14:                                  ; preds = %if.then7
  %10 = load i32, i32* %key.addr, align 4
  %conv15 = trunc i32 %10 to i8
  %conv16 = zext i8 %conv15 to i32
  %call = call i32 @isupper(i32 %conv16) #5
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true14
  %11 = load i32, i32* %key.addr, align 4
  %conv17 = trunc i32 %11 to i8
  %conv18 = zext i8 %conv17 to i32
  %call19 = call i32 @tolower(i32 %conv18) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true14, %if.then7
  %12 = load i32, i32* %key.addr, align 4
  %conv20 = trunc i32 %12 to i8
  %conv21 = zext i8 %conv20 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call19, %cond.true ], [ %conv21, %cond.false ]
  %13 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %call22 = call i32 @_rl_dispatch(i32 %cond, %struct._keymap_entry* %13)
  store i32 %call22, i32* %r.addr, align 4
  br label %if.end44

if.else:                                          ; preds = %land.lhs.true, %if.then
  %14 = load i32, i32* %type, align 4
  %cmp23 = icmp eq i32 %14, 0
  br i1 %cmp23, label %if.then25, label %if.else42

if.then25:                                        ; preds = %if.else
  %15 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %16 = load i32, i32* %key.addr, align 4
  %arrayidx26 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %15, i32 %16
  %type27 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx26, i32 0, i32 0
  %17 = load i8, i8* %type27, align 4
  %conv28 = sext i8 %17 to i32
  store i32 %conv28, i32* %nt, align 4
  %18 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %19 = load i32, i32* %key.addr, align 4
  %arrayidx29 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %18, i32 %19
  %function30 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx29, i32 0, i32 1
  %20 = load i32 (i32, i32)*, i32 (i32, i32)** %function30, align 4
  store i32 (i32, i32)* %20, i32 (i32, i32)** %nf, align 4
  %21 = load i32, i32* %type, align 4
  %conv31 = trunc i32 %21 to i8
  %22 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %23 = load i32, i32* %key.addr, align 4
  %arrayidx32 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %22, i32 %23
  %type33 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx32, i32 0, i32 0
  store i8 %conv31, i8* %type33, align 4
  %24 = load i32 (i32, i32)*, i32 (i32, i32)** %func, align 4
  %25 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %26 = load i32, i32* %key.addr, align 4
  %arrayidx34 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %25, i32 %26
  %function35 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx34, i32 0, i32 1
  store i32 (i32, i32)* %24, i32 (i32, i32)** %function35, align 4
  %27 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %27, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  %28 = load i32, i32* %key.addr, align 4
  %29 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %call36 = call i32 @_rl_dispatch_subseq(i32 %28, %struct._keymap_entry* %29, i32 0)
  store i32 %call36, i32* %r.addr, align 4
  %30 = load i32, i32* %nt, align 4
  %conv37 = trunc i32 %30 to i8
  %31 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %32 = load i32, i32* %key.addr, align 4
  %arrayidx38 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %31, i32 %32
  %type39 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx38, i32 0, i32 0
  store i8 %conv37, i8* %type39, align 4
  %33 = load i32 (i32, i32)*, i32 (i32, i32)** %nf, align 4
  %34 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %35 = load i32, i32* %key.addr, align 4
  %arrayidx40 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %34, i32 %35
  %function41 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx40, i32 0, i32 1
  store i32 (i32, i32)* %33, i32 (i32, i32)** %function41, align 4
  br label %if.end

if.else42:                                        ; preds = %if.else
  %36 = load %struct._keymap_entry*, %struct._keymap_entry** %m, align 4
  %call43 = call i32 @_rl_dispatch(i32 256, %struct._keymap_entry* %36)
  store i32 %call43, i32* %r.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.else42, %if.then25
  br label %if.end44

if.end44:                                         ; preds = %if.end, %cond.end
  br label %if.end72

if.else45:                                        ; preds = %entry
  %37 = load i32, i32* %r.addr, align 4
  %tobool46 = icmp ne i32 %37, 0
  br i1 %tobool46, label %land.lhs.true47, label %if.else58

land.lhs.true47:                                  ; preds = %if.else45
  %38 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  %arrayidx48 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %38, i32 256
  %function49 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx48, i32 0, i32 1
  %39 = load i32 (i32, i32)*, i32 (i32, i32)** %function49, align 4
  %tobool50 = icmp ne i32 (i32, i32)* %39, null
  br i1 %tobool50, label %if.then51, label %if.else58

if.then51:                                        ; preds = %land.lhs.true47
  %40 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %40, 2048
  %tobool52 = icmp ne i32 %and, 0
  br i1 %tobool52, label %if.then53, label %if.else55

if.then53:                                        ; preds = %if.then51
  %call54 = call i32 @_rl_prev_macro_key()
  br label %if.end57

if.else55:                                        ; preds = %if.then51
  %41 = load i32, i32* %key.addr, align 4
  %call56 = call i32 @_rl_unget_char(i32 %41)
  br label %if.end57

if.end57:                                         ; preds = %if.else55, %if.then53
  %42 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %42, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  store i32 -2, i32* %retval, align 4
  br label %return

if.else58:                                        ; preds = %land.lhs.true47, %if.else45
  %43 = load i32, i32* %r.addr, align 4
  %tobool59 = icmp ne i32 %43, 0
  br i1 %tobool59, label %land.lhs.true60, label %if.end70

land.lhs.true60:                                  ; preds = %if.else58
  %44 = load i32, i32* %got_subseq.addr, align 4
  %tobool61 = icmp ne i32 %44, 0
  br i1 %tobool61, label %if.then62, label %if.end70

if.then62:                                        ; preds = %land.lhs.true60
  %45 = load i32, i32* @rl_readline_state, align 4
  %and63 = and i32 %45, 2048
  %tobool64 = icmp ne i32 %and63, 0
  br i1 %tobool64, label %if.then65, label %if.else67

if.then65:                                        ; preds = %if.then62
  %call66 = call i32 @_rl_prev_macro_key()
  br label %if.end69

if.else67:                                        ; preds = %if.then62
  %46 = load i32, i32* %key.addr, align 4
  %call68 = call i32 @_rl_unget_char(i32 %46)
  br label %if.end69

if.end69:                                         ; preds = %if.else67, %if.then65
  %47 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %47, %struct._keymap_entry** @_rl_dispatching_keymap, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end70:                                         ; preds = %land.lhs.true60, %if.else58
  br label %if.end71

if.end71:                                         ; preds = %if.end70
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %if.end44
  %48 = load i32, i32* %r.addr, align 4
  store i32 %48, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end72, %if.end69, %if.end57
  %49 = load i32, i32* %retval, align 4
  ret i32 %49
}

declare void @_rl_add_macro_char(i32) #1

declare i8* @xrealloc(i8*, i32) #1

declare i32 @rl_ding() #1

declare i32 @rl_do_lowercase_version(i32, i32) #1

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #3

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #3

declare i32 @rl_digit_argument(i32, i32) #1

declare i32 @_rl_prev_macro_key() #1

declare i32 @_rl_unget_char(i32) #1

declare i32 @_rl_pushed_input_available() #1

declare i32 @_rl_input_queued(i32) #1

declare void @_rl_with_macro_input(i8*) #1

declare i32 @_rl_vi_textmod_command(i32) #1

declare void @_rl_vi_set_last(i32, i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @readline_initialize_everything() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  store %struct._IO_FILE* %1, %struct._IO_FILE** @rl_instream, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %tobool1 = icmp ne %struct._IO_FILE* %2, null
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  store %struct._IO_FILE* %3, %struct._IO_FILE** @rl_outstream, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  store %struct._IO_FILE* %4, %struct._IO_FILE** @_rl_in_stream, align 4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  store %struct._IO_FILE* %5, %struct._IO_FILE** @_rl_out_stream, align 4
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %cmp = icmp eq i8* %6, null
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  store i32 256, i32* @rl_line_buffer_len, align 4
  %call = call i8* @xmalloc(i32 256)
  store i8* %call, i8** @rl_line_buffer, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  %7 = load i8*, i8** @rl_terminal_name, align 4
  %cmp6 = icmp eq i8* %7, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end5
  %call8 = call i8* @sh_get_env_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0))
  store i8* %call8, i8** @rl_terminal_name, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end5
  %8 = load i8*, i8** @rl_terminal_name, align 4
  %call10 = call i32 @_rl_init_terminal_io(i8* %8)
  call void @readline_default_bindings()
  call void @rl_initialize_funmap()
  %call11 = call i32 @_rl_init_eightbit()
  %call12 = call i32 @rl_read_init_file(i8* null)
  %9 = load i32, i32* @_rl_horizontal_scroll_mode, align 4
  %tobool13 = icmp ne i32 %9, 0
  br i1 %tobool13, label %land.lhs.true, label %if.end16

land.lhs.true:                                    ; preds = %if.end9
  %10 = load i32, i32* @_rl_term_autowrap, align 4
  %tobool14 = icmp ne i32 %10, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %land.lhs.true
  %11 = load i32, i32* @_rl_screenwidth, align 4
  %dec = add nsw i32 %11, -1
  store i32 %dec, i32* @_rl_screenwidth, align 4
  %12 = load i32, i32* @_rl_screenheight, align 4
  %13 = load i32, i32* @_rl_screenchars, align 4
  %sub = sub nsw i32 %13, %12
  store i32 %sub, i32* @_rl_screenchars, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %land.lhs.true, %if.end9
  call void @rl_set_keymap_from_edit_mode()
  call void @bind_arrow_keys()
  call void @bind_bracketed_paste_prefix()
  %14 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %cmp17 = icmp eq i8* %14, null
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end16
  %15 = load i8*, i8** @rl_basic_word_break_characters, align 4
  store i8* %15, i8** @rl_completer_word_break_characters, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end16
  %16 = load i32, i32* @_rl_colored_stats, align 4
  %tobool20 = icmp ne i32 %16, 0
  br i1 %tobool20, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end19
  %17 = load i32, i32* @_rl_colored_completion_prefix, align 4
  %tobool21 = icmp ne i32 %17, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %lor.lhs.false, %if.end19
  call void @_rl_parse_colors()
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %lor.lhs.false
  store i32 16, i32* @_rl_executing_keyseq_size, align 4
  %call24 = call i8* @malloc(i32 16)
  store i8* %call24, i8** @rl_executing_keyseq, align 4
  %18 = load i8*, i8** @rl_executing_keyseq, align 4
  %tobool25 = icmp ne i8* %18, null
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end23
  %19 = load i8*, i8** @rl_executing_keyseq, align 4
  %arrayidx = getelementptr inbounds i8, i8* %19, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end23
  ret void
}

declare void @_rl_start_using_history() #1

declare i32 @rl_reset_line_state() #1

declare void @_rl_vi_initialize_line() #1

; Function Attrs: noinline nounwind
define i32 @rl_save_state(%struct.readline_state* %sp) #0 {
entry:
  %retval = alloca i32, align 4
  %sp.addr = alloca %struct.readline_state*, align 4
  store %struct.readline_state* %sp, %struct.readline_state** %sp.addr, align 4
  %0 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %cmp = icmp eq %struct.readline_state* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %2 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %point = getelementptr inbounds %struct.readline_state, %struct.readline_state* %2, i32 0, i32 0
  store i32 %1, i32* %point, align 4
  %3 = load i32, i32* @rl_end, align 4
  %4 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %end = getelementptr inbounds %struct.readline_state, %struct.readline_state* %4, i32 0, i32 1
  store i32 %3, i32* %end, align 4
  %5 = load i32, i32* @rl_mark, align 4
  %6 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %mark = getelementptr inbounds %struct.readline_state, %struct.readline_state* %6, i32 0, i32 2
  store i32 %5, i32* %mark, align 4
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %buffer = getelementptr inbounds %struct.readline_state, %struct.readline_state* %8, i32 0, i32 4
  store i8* %7, i8** %buffer, align 4
  %9 = load i32, i32* @rl_line_buffer_len, align 4
  %10 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %buflen = getelementptr inbounds %struct.readline_state, %struct.readline_state* %10, i32 0, i32 3
  store i32 %9, i32* %buflen, align 4
  %11 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %12 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %ul = getelementptr inbounds %struct.readline_state, %struct.readline_state* %12, i32 0, i32 5
  store %struct.undo_list* %11, %struct.undo_list** %ul, align 4
  %13 = load i8*, i8** @rl_prompt, align 4
  %14 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %prompt = getelementptr inbounds %struct.readline_state, %struct.readline_state* %14, i32 0, i32 6
  store i8* %13, i8** %prompt, align 4
  %15 = load i32, i32* @rl_readline_state, align 4
  %16 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %rlstate = getelementptr inbounds %struct.readline_state, %struct.readline_state* %16, i32 0, i32 7
  store i32 %15, i32* %rlstate, align 4
  %17 = load i32, i32* @rl_done, align 4
  %18 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %done = getelementptr inbounds %struct.readline_state, %struct.readline_state* %18, i32 0, i32 8
  store i32 %17, i32* %done, align 4
  %19 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %20 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %kmap = getelementptr inbounds %struct.readline_state, %struct.readline_state* %20, i32 0, i32 9
  store %struct._keymap_entry* %19, %struct._keymap_entry** %kmap, align 4
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %22 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %lastfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %22, i32 0, i32 10
  store i32 (i32, i32)* %21, i32 (i32, i32)** %lastfunc, align 4
  %23 = load i32, i32* @rl_insert_mode, align 4
  %24 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %insmode = getelementptr inbounds %struct.readline_state, %struct.readline_state* %24, i32 0, i32 11
  store i32 %23, i32* %insmode, align 4
  %25 = load i32, i32* @rl_editing_mode, align 4
  %26 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %edmode = getelementptr inbounds %struct.readline_state, %struct.readline_state* %26, i32 0, i32 12
  store i32 %25, i32* %edmode, align 4
  %27 = load i8*, i8** @rl_executing_keyseq, align 4
  %28 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %kseq = getelementptr inbounds %struct.readline_state, %struct.readline_state* %28, i32 0, i32 13
  store i8* %27, i8** %kseq, align 4
  %29 = load i32, i32* @rl_key_sequence_length, align 4
  %30 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %kseqlen = getelementptr inbounds %struct.readline_state, %struct.readline_state* %30, i32 0, i32 14
  store i32 %29, i32* %kseqlen, align 4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_instream, align 4
  %32 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %inf = getelementptr inbounds %struct.readline_state, %struct.readline_state* %32, i32 0, i32 16
  store %struct._IO_FILE* %31, %struct._IO_FILE** %inf, align 4
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %34 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %outf = getelementptr inbounds %struct.readline_state, %struct.readline_state* %34, i32 0, i32 17
  store %struct._IO_FILE* %33, %struct._IO_FILE** %outf, align 4
  %35 = load i32, i32* @rl_pending_input, align 4
  %36 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %pendingin = getelementptr inbounds %struct.readline_state, %struct.readline_state* %36, i32 0, i32 15
  store i32 %35, i32* %pendingin, align 4
  %37 = load i8*, i8** @rl_executing_macro, align 4
  %38 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %macro = getelementptr inbounds %struct.readline_state, %struct.readline_state* %38, i32 0, i32 18
  store i8* %37, i8** %macro, align 4
  %39 = load i32, i32* @rl_catch_signals, align 4
  %40 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %catchsigs = getelementptr inbounds %struct.readline_state, %struct.readline_state* %40, i32 0, i32 19
  store i32 %39, i32* %catchsigs, align 4
  %41 = load i32, i32* @rl_catch_sigwinch, align 4
  %42 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %catchsigwinch = getelementptr inbounds %struct.readline_state, %struct.readline_state* %42, i32 0, i32 20
  store i32 %41, i32* %catchsigwinch, align 4
  %43 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %44 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %entryfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %44, i32 0, i32 21
  store i8* (i8*, i32)* %43, i8* (i8*, i32)** %entryfunc, align 4
  %45 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  %46 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %menuentryfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %46, i32 0, i32 22
  store i8* (i8*, i32)* %45, i8* (i8*, i32)** %menuentryfunc, align 4
  %47 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %48 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %ignorefunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %48, i32 0, i32 23
  store i32 (i8**)* %47, i32 (i8**)** %ignorefunc, align 4
  %49 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %50 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %attemptfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %50, i32 0, i32 24
  store i8** (i8*, i32, i32)* %49, i8** (i8*, i32, i32)** %attemptfunc, align 4
  %51 = load i8*, i8** @rl_completer_word_break_characters, align 4
  %52 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %wordbreakchars = getelementptr inbounds %struct.readline_state, %struct.readline_state* %52, i32 0, i32 25
  store i8* %51, i8** %wordbreakchars, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %53 = load i32, i32* %retval, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind
define i32 @rl_restore_state(%struct.readline_state* %sp) #0 {
entry:
  %retval = alloca i32, align 4
  %sp.addr = alloca %struct.readline_state*, align 4
  store %struct.readline_state* %sp, %struct.readline_state** %sp.addr, align 4
  %0 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %cmp = icmp eq %struct.readline_state* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %point = getelementptr inbounds %struct.readline_state, %struct.readline_state* %1, i32 0, i32 0
  %2 = load i32, i32* %point, align 4
  store i32 %2, i32* @rl_point, align 4
  %3 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %end = getelementptr inbounds %struct.readline_state, %struct.readline_state* %3, i32 0, i32 1
  %4 = load i32, i32* %end, align 4
  store i32 %4, i32* @rl_end, align 4
  %5 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %mark = getelementptr inbounds %struct.readline_state, %struct.readline_state* %5, i32 0, i32 2
  %6 = load i32, i32* %mark, align 4
  store i32 %6, i32* @rl_mark, align 4
  %7 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %buffer = getelementptr inbounds %struct.readline_state, %struct.readline_state* %7, i32 0, i32 4
  %8 = load i8*, i8** %buffer, align 4
  store i8* %8, i8** @rl_line_buffer, align 4
  store i8* %8, i8** @the_line, align 4
  %9 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %buflen = getelementptr inbounds %struct.readline_state, %struct.readline_state* %9, i32 0, i32 3
  %10 = load i32, i32* %buflen, align 4
  store i32 %10, i32* @rl_line_buffer_len, align 4
  %11 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %ul = getelementptr inbounds %struct.readline_state, %struct.readline_state* %11, i32 0, i32 5
  %12 = load %struct.undo_list*, %struct.undo_list** %ul, align 4
  store %struct.undo_list* %12, %struct.undo_list** @rl_undo_list, align 4
  %13 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %prompt = getelementptr inbounds %struct.readline_state, %struct.readline_state* %13, i32 0, i32 6
  %14 = load i8*, i8** %prompt, align 4
  store i8* %14, i8** @rl_prompt, align 4
  %15 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %rlstate = getelementptr inbounds %struct.readline_state, %struct.readline_state* %15, i32 0, i32 7
  %16 = load i32, i32* %rlstate, align 4
  store i32 %16, i32* @rl_readline_state, align 4
  %17 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %done = getelementptr inbounds %struct.readline_state, %struct.readline_state* %17, i32 0, i32 8
  %18 = load i32, i32* %done, align 4
  store i32 %18, i32* @rl_done, align 4
  %19 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %kmap = getelementptr inbounds %struct.readline_state, %struct.readline_state* %19, i32 0, i32 9
  %20 = load %struct._keymap_entry*, %struct._keymap_entry** %kmap, align 4
  store %struct._keymap_entry* %20, %struct._keymap_entry** @_rl_keymap, align 4
  %21 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %lastfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %21, i32 0, i32 10
  %22 = load i32 (i32, i32)*, i32 (i32, i32)** %lastfunc, align 4
  store i32 (i32, i32)* %22, i32 (i32, i32)** @rl_last_func, align 4
  %23 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %insmode = getelementptr inbounds %struct.readline_state, %struct.readline_state* %23, i32 0, i32 11
  %24 = load i32, i32* %insmode, align 4
  store i32 %24, i32* @rl_insert_mode, align 4
  %25 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %edmode = getelementptr inbounds %struct.readline_state, %struct.readline_state* %25, i32 0, i32 12
  %26 = load i32, i32* %edmode, align 4
  store i32 %26, i32* @rl_editing_mode, align 4
  %27 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %kseq = getelementptr inbounds %struct.readline_state, %struct.readline_state* %27, i32 0, i32 13
  %28 = load i8*, i8** %kseq, align 4
  store i8* %28, i8** @rl_executing_keyseq, align 4
  %29 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %kseqlen = getelementptr inbounds %struct.readline_state, %struct.readline_state* %29, i32 0, i32 14
  %30 = load i32, i32* %kseqlen, align 4
  store i32 %30, i32* @rl_key_sequence_length, align 4
  %31 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %inf = getelementptr inbounds %struct.readline_state, %struct.readline_state* %31, i32 0, i32 16
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %inf, align 4
  store %struct._IO_FILE* %32, %struct._IO_FILE** @rl_instream, align 4
  %33 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %outf = getelementptr inbounds %struct.readline_state, %struct.readline_state* %33, i32 0, i32 17
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %outf, align 4
  store %struct._IO_FILE* %34, %struct._IO_FILE** @rl_outstream, align 4
  %35 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %pendingin = getelementptr inbounds %struct.readline_state, %struct.readline_state* %35, i32 0, i32 15
  %36 = load i32, i32* %pendingin, align 4
  store i32 %36, i32* @rl_pending_input, align 4
  %37 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %macro = getelementptr inbounds %struct.readline_state, %struct.readline_state* %37, i32 0, i32 18
  %38 = load i8*, i8** %macro, align 4
  store i8* %38, i8** @rl_executing_macro, align 4
  %39 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %catchsigs = getelementptr inbounds %struct.readline_state, %struct.readline_state* %39, i32 0, i32 19
  %40 = load i32, i32* %catchsigs, align 4
  store i32 %40, i32* @rl_catch_signals, align 4
  %41 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %catchsigwinch = getelementptr inbounds %struct.readline_state, %struct.readline_state* %41, i32 0, i32 20
  %42 = load i32, i32* %catchsigwinch, align 4
  store i32 %42, i32* @rl_catch_sigwinch, align 4
  %43 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %entryfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %43, i32 0, i32 21
  %44 = load i8* (i8*, i32)*, i8* (i8*, i32)** %entryfunc, align 4
  store i8* (i8*, i32)* %44, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %45 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %menuentryfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %45, i32 0, i32 22
  %46 = load i8* (i8*, i32)*, i8* (i8*, i32)** %menuentryfunc, align 4
  store i8* (i8*, i32)* %46, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  %47 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %ignorefunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %47, i32 0, i32 23
  %48 = load i32 (i8**)*, i32 (i8**)** %ignorefunc, align 4
  store i32 (i8**)* %48, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %49 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %attemptfunc = getelementptr inbounds %struct.readline_state, %struct.readline_state* %49, i32 0, i32 24
  %50 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** %attemptfunc, align 4
  store i8** (i8*, i32, i32)* %50, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %51 = load %struct.readline_state*, %struct.readline_state** %sp.addr, align 4
  %wordbreakchars = getelementptr inbounds %struct.readline_state, %struct.readline_state* %51, i32 0, i32 25
  %52 = load i8*, i8** %wordbreakchars, align 4
  store i8* %52, i8** @rl_completer_word_break_characters, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %53 = load i32, i32* %retval, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind
define internal i32 @readline_internal_charloop() #0 {
entry:
  %eof = alloca i32, align 4
  store i32 1, i32* %eof, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @rl_done, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 @readline_internal_char()
  store i32 %call, i32* %eof, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %1 = load i32, i32* %eof, align 4
  ret i32 %1
}

declare i8* @sh_get_env_value(i8*) #1

declare i32 @_rl_init_terminal_io(i8*) #1

; Function Attrs: noinline nounwind
define internal void @readline_default_bindings() #0 {
entry:
  %0 = load i32, i32* @_rl_bind_stty_chars, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  call void @rl_tty_set_default_bindings(%struct._keymap_entry* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @rl_initialize_funmap() #1

declare i32 @_rl_init_eightbit() #1

declare i32 @rl_read_init_file(i8*) #1

declare void @rl_set_keymap_from_edit_mode() #1

; Function Attrs: noinline nounwind
define internal void @bind_arrow_keys() #0 {
entry:
  call void @bind_arrow_keys_internal(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0))
  call void @bind_arrow_keys_internal(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  %0 = load i8, i8* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 27, i32 0), align 4
  %conv = sext i8 %0 to i32
  %cmp = icmp eq i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @rl_bind_keyseq_in_map(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i32 (i32, i32)* null, %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @bind_arrow_keys_internal(%struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @bind_bracketed_paste_prefix() #0 {
entry:
  %xkeymap = alloca %struct._keymap_entry*, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  store %struct._keymap_entry* %0, %struct._keymap_entry** %xkeymap, align 4
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 (i32, i32)* @rl_bracketed_paste_begin)
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  %call1 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0), i32 (i32, i32)* @rl_bracketed_paste_begin)
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %xkeymap, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** @_rl_keymap, align 4
  ret void
}

declare void @_rl_parse_colors() #1

declare i8* @malloc(i32) #1

declare void @rl_tty_set_default_bindings(%struct._keymap_entry*) #1

; Function Attrs: noinline nounwind
define internal void @bind_arrow_keys_internal(%struct._keymap_entry* %map) #0 {
entry:
  %map.addr = alloca %struct._keymap_entry*, align 4
  %xkeymap = alloca %struct._keymap_entry*, align 4
  store %struct._keymap_entry* %map, %struct._keymap_entry** %map.addr, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  store %struct._keymap_entry* %0, %struct._keymap_entry** %xkeymap, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %map.addr, align 4
  store %struct._keymap_entry* %1, %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 (i32, i32)* @rl_get_previous_history)
  %call1 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i32 (i32, i32)* @rl_get_next_history)
  %call2 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 (i32, i32)* @rl_forward_char)
  %call3 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i32 (i32, i32)* @rl_backward_char)
  %call4 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 (i32, i32)* @rl_beg_of_line)
  %call5 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i32 (i32, i32)* @rl_end_of_line)
  %call6 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 (i32, i32)* @rl_get_previous_history)
  %call7 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i32 (i32, i32)* @rl_get_next_history)
  %call8 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i32 (i32, i32)* @rl_forward_char)
  %call9 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i32 (i32, i32)* @rl_backward_char)
  %call10 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), i32 (i32, i32)* @rl_beg_of_line)
  %call11 = call i32 @rl_bind_keyseq_if_unbound(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), i32 (i32, i32)* @rl_end_of_line)
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** %xkeymap, align 4
  store %struct._keymap_entry* %2, %struct._keymap_entry** @_rl_keymap, align 4
  ret void
}

declare i32 @rl_bind_keyseq_in_map(i8*, i32 (i32, i32)*, %struct._keymap_entry*) #1

declare i32 @rl_bind_keyseq_if_unbound(i8*, i32 (i32, i32)*) #1

declare i32 @rl_get_previous_history(i32, i32) #1

declare i32 @rl_get_next_history(i32, i32) #1

declare i32 @rl_forward_char(i32, i32) #1

declare i32 @rl_backward_char(i32, i32) #1

declare i32 @rl_beg_of_line(i32, i32) #1

declare i32 @rl_end_of_line(i32, i32) #1

declare i32 @rl_bracketed_paste_begin(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { returns_twice }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
